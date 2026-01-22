Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGMeEEgEcmmvZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:04:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D422D65B06
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701BC10E97D;
	Thu, 22 Jan 2026 11:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="atDu5xow";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hg6FuhPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A534B10E983
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 11:04:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60M6rdDW724846
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 11:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t0KlvkM5KQlhi9X1NhLsO3/hA2b2nzw1RRo2lI06OH4=; b=atDu5xowozGMAuUZ
 GzTtRyhJQ2wqIsuDLs7r9ve+/Ed1V5cy9CzphuYN01LXzxL/RVZWp4hu/nDoNk+3
 TCwhJUsz/ORIjI16HRuDW8xFabYsz0DgkWTdvrmUoG3JvWhiPOnKAqDNHq2IyyuJ
 xaSQh2qgg2FJDegmMLs37HqsKzmJSPCHkS7JrjolG/zBbpOUXKFvUch7uQr6m02/
 NAVlITpNvBiNOW8BZKxFktIr8KWt1xipbBpL493HGz7UoLElGipusI/zFLkMACmP
 Ae3W/XJWF+f4gCBe8MKE130TmCtczKSyeknY1copj2+dgEa5R1cdbTkVqLPULtkE
 gG3xgw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bgrs0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 11:04:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5634817781dso741823e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769079874; x=1769684674;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t0KlvkM5KQlhi9X1NhLsO3/hA2b2nzw1RRo2lI06OH4=;
 b=Hg6FuhPOqeDArbdLO4Qk/WAAuPsRccHm2YxtIEe3C4JZhCZKcqqw5BINh9i4CL5wtg
 rEer1cyjLoukN87HbPknU4HsSr3+CEsGMp295ldyuY//FQvvbXdAlJKjNYqbQK/uWQcs
 KjpAqymiAP3xTuMQQAA+wQHmcGe1976cnhQh9ik64vqw9leOD6eiff3Kc8p3Nw4ChLPa
 9xu+fjIWbb7pUi53mCBXygpO+K1E+m6M/c+74WnKM9/9qCFlRGGTdX7Clzj4N+1MuDhS
 M4f07uNtpXOCPv9YvgAGXObvV1fM2yP5ElufsIMtaWDGIAt+RIEEP73K2MIewKwOo+lT
 Ooiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769079874; x=1769684674;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t0KlvkM5KQlhi9X1NhLsO3/hA2b2nzw1RRo2lI06OH4=;
 b=tmrB/3d/MQyMKlgIpY9Y9pH6mRTvqw22F3XrI+ibuEB6bKnI1ugKqDO0rtpwnpa6ym
 wHiND+nMHsvjQw0jIFQAdIAvLpDHM4bPPtaW3QPYubpaQz1SH1Tgx1W92h+xTHpZnK9E
 tSJheoqcuMyTraH/NY63VdSVr3O3RNsz5dNUCOfX068kN2oFOC0TLo/dFpFrMbmf48ZP
 YvuL8TFSmjj+rLXIiaIBfzVxUIlQ1Ab160m6K2u2qRA90mW8PGLA+x3RtLndfdn4mFXX
 VgBRozSyFaEeR898mSc57CmqdvgGOvvi5DzIdSZfr0ShW8bQyGgyxlb5C1jr2R30ADfK
 8AKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxwXED1rUZOh+7z3XLKaohT/FJ+PjMUtqEEchfKkT415+V1Z0Sih98nH2nNEw336+9TmAUuHhpZ40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLacpypislKeUhK+YgV0wlg6z7CJccRYgrCay7s/2ngvUrriQr
 yJaWoLlUEblT2HpW2jW1459I7085NzUHft4vKCQp57quiyJKHpBfLEFPcgV2q2R78eeeBrc8SgS
 8+r5FNxQFpC2NUwBpk79jjcnNMmVxqcwk18gVtTk8meAI8+mepg04g5OG3+v+vm/5jl00ZMY=
X-Gm-Gg: AZuq6aIkcnqL2E6l9RFsfhRt6HoCZW6nkeCes27LhswExlKeRIdeVAI8WamjUsq1sVu
 2jX4C0eeauF1ENIQmNWK4/aHP7zDKGwCXRa01gtFBHkuC8Dqku+EvcodmD9Gddkxqy3wTtCL3oc
 qWCUrwis8A/DXzoeN8z9gieLC/n8CC6c4MX0TtIIIJHiVU/yVhw0g/PT0rhv1ramW58z/5guoyx
 G+SAnE7JcFt4F6brPGTyzZBy7FmMB05FKQRTdLqBUL1xLeIWDorgaKdoKmtz2zWgdnqMB/yUQOQ
 odMyKSmbSgLxVA4Q5khXQ/0pUTFLG3DaBXiiSe/KzQndrR7SGqLgCii00HcspYx7XYZWzn7ZDOc
 ++QttcQLlkNkT9ivVCaP2lk5555aqv/YYBlZvUhoE0va+jQesGTWFUSGGHTwsu0M4c5aBa7gSIC
 QpppVLBKk8noeo62gm+r4oerg=
X-Received: by 2002:a05:6102:6cf:b0:5ee:a2a8:2e73 with SMTP id
 ada2fe7eead31-5f1a551ef9amr6077499137.26.1769079873649; 
 Thu, 22 Jan 2026 03:04:33 -0800 (PST)
X-Received: by 2002:a05:6102:6cf:b0:5ee:a2a8:2e73 with SMTP id
 ada2fe7eead31-5f1a551ef9amr6077487137.26.1769079873108; 
 Thu, 22 Jan 2026 03:04:33 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3543d2sm5368629e87.43.2026.01.22.03.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 03:04:32 -0800 (PST)
Date: Thu, 22 Jan 2026 13:04:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
Message-ID: <sa6y3vjstutglftts3ucoouj6js53p6an4wjcvqhbjsazmmxrf@v35pf2dqvfdh>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
 <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
 <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
 <0841b98d-32b3-4e7d-940b-9be204fad7af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0841b98d-32b3-4e7d-940b-9be204fad7af@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9SNaVlIQinOMlgo_Ei3z3Vbb2xT6keT9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3OSBTYWx0ZWRfXzZRmXHLTqVBC
 IkSRFL9qwt6SV80m+hOo5W+1BJM4XgGrPft1PK95QkR09QDLNDXFcgxLUb4z0FoGOmuj/QArby8
 WQPpyAPnDBPswW4NYOTXciQz5g5XAgWWujL9qIf7utChRo61VNSWvddTQG57Fgi4C7AYvcaXvx0
 X5L/x9nraXLkZNKtFGOPj+Z5ZaysMMvtH+MHwTidiWo0LBFuYOAzb6rIv/Q+62vTFRt5PTBgOBb
 0Nmvu2Ns1IzYuLQA0eGfvvmWHJU6Q2jN10nR7f5pxAXYZ1bKQ82AX1zX1XGKY0iB2ybcqx4rXg0
 asgNCPSs6hKOImsZsqcTS4sh/9j6CLk/eF+lC9/xd2UbS9z/4TOS0JaXMu/Lk9BVvODHvkHaxn+
 bVHRP22EFalCgH2cKi0JpfB5I7g3XJCusVDed3NPcbYHnL6IlWIYmfRpchT4/JcF6W2qWS+cZ7J
 FwEdD4Z/Bg1JacpuSAQ==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=69720442 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=nY9ItIvBOz0YvIiU8-8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=tNoRWFLymzeba-QzToBc:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 9SNaVlIQinOMlgo_Ei3z3Vbb2xT6keT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220079
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:nicolas@ndufresne.ca,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:jesszhan0024@gmail.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ndufresne.ca,oss.qualcomm.com,poorly.run,gmail.com,linux.dev,kernel.org,vger.kernel.org,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: D422D65B06
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:29:32AM +0530, Vikash Garodia wrote:
> 
> On 1/16/2026 1:16 AM, Dmitry Baryshkov wrote:
> > I should have added GPU maintainers and ML beforehand. Fixing it now.
> > 
> > On Thu, Jan 15, 2026 at 09:02:07AM -0500, Nicolas Dufresne wrote:
> > > Le jeudi 15 janvier 2026 à 10:08 +0200, Dmitry Baryshkov a écrit :
> > > > On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
> > > > > Add support for the QC08C color format in both the encoder and decoder
> > > > > paths of the iris driver. The changes include:
> > > > > 
> > > > > - Adding QC08C format handling in the driver for both encoding and
> > > > > decoding.
> > > > > - Updating format enumeration to properly return supported formats.
> > > > > - Ensuring the correct HFI format is set for firmware communication.
> > > > > -Making all related changes required for seamless integration of QC08C
> > > > > support.
> > > > > 
> > > > > The changes have been validated using v4l2-ctl, compliance, and GStreamer
> > > > > (GST) tests.
> > > > > Both GST and v4l2-ctl tests were performed using the NV12 format, as
> > > > > these clients do not support the QCOM-specific QC08C format, and all
> > > > > tests passed successfully.
> > > > > 
> > > > > During v4l2-ctl testing, a regression was observed when using the NV12
> > > > > color format after adding QC08C support. A fix for this regression has
> > > > > also been posted [1].
> > > > > 
> > > > > [1]:
> > > > > https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
> > > > > 
> > > > > Changes in v2:
> > > > > - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
> > > > > - Updated commit text to indicate QC08C is NV12 with UBWC compression
> > > > > (Bryan, Dmitry)
> > > > > - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
> > > > > - Link to v1:
> > > > > https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com
> > > > > 
> > > > > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > > > ---
> > > > > Dikshita Agarwal (3):
> > > > >        media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
> > > > >        media: iris: Add support for QC08C format for decoder
> > > > >        media: iris: Add support for QC08C format for encoder
> > > > > 
> > > > 
> > > > Looking at the series again... What is the definition of V4L formats?
> > > > Are they expected to be self-compatible? Transferable between machines?
> > > > In DRM world we made a mistake, making use of a single non-parametrized
> > > > UBWC modifier, and then later we had to introduce OOB values to
> > > > represent different params of UBWC compressed images.
> > > > 
> > > > So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
> > > > should we have different format values (at least for different swizzle
> > > > and macrotile modes)?
> > > 
> > > Our expectation is that the decoder will produce the same format regardless the
> > > resolution. And that format should be shareable, so that same format coming from
> > > two drivers means the same thing without out of band data, except that
> > > resolution and strides are needed oob anyway and can obviously be used as an
> > > acceptable workaround the issue you describe. It should also have a single
> > > translation to DRM fourcc + modifier, and hopefully the other way around is
> > > possible too, otherwise its a bit broken and unusable.
> > 
> > Well... As I wrote, we made a certain decision several years go: there
> > is only one DRM modifier. At that point the decision was made by
> > open-source people which had a very limited information about hardware
> > internals. We can probably try deprecating it and shifting towards
> > multiple entries. On the other side, most of the blocks would only be
> > able to support only one of very few possible configurations.
> > 
> > > 
> > > So bottom line, since V4L2 does not have modifiers, you have to treat one V4L2
> > > format as a pair of DRM fourcc + modifier. Decoders typically only support a
> > > subset, or hardware engineers can generally pick a handful of performant
> > > configurations that works for all cases (its all 2D with similarly sized
> > > macroblocks).
> > 
> > This is not quite applicable: even if we try to fix all other settings,
> > the format differs from platform to platform because of the memory
> > organisation (highest_bank_bit in drivers/soc/qcom/ubwc_config.c).
> > 
> > There is a description of swizzling in Mesa ([1])
> > 
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/fdl/fd6_tiled_memcpy.cc
> > 
> > > Since these formats are only usable when consumed by GPU or
> > > display controllers, its important that all party uses the same convention for
> > > the limited information available.
> 
> Would there be a need for any client, other than GPU/display, to peek into
> the data OR to validate it, it need to decompress it. For that as well, it
> would need all the associated info to decompress it.

It doesn't really matter. This is uAPI. There might be no such client
now, but there might be one later. Also, with the tiling format being
defined, userspace apps can start poking into the meta / color buffers
(e.g. for the sake of clipping / blitting the part of the image).

> Again in same SOC, camera can produce compressed YUV with different
> parameter while VPU different, it would again need the associated info
> alongwith single "UBWC-compressed NV12" to decompress it.

Yes. It's actually a good point, it clearly shows a need to describe the
stream rather than stating that it is "just UBWC".

> 
> > 
> > Yes, we added UBWC config database in order to have a single source of
> > information for the kernel.
> > 
> > So... On the practical side there can be:
> >   - UBWC 1.0, 2.0, 3.0, 4.0, etc.
> > 
> >   - swizzle 1-2-3, 2-3 and 3, partially depends on UBWC version.
> > 
> >   - HBB or 13, 14, 15, 16
> > 
> >   - bank spreading (true or false)
> > 
> >  From the practical point of view, drivers/soc/qcom/ubwc.c defines the
> > following formats (currently, I'd like to cross-check some of them):
> > 
> > - linear
> > - 1.0_123_14
> > - 1.0_123_14_spread
> > - 1.0_123_15
> > - 2.0_23_14
> > - 2.0_23_14_spread
> > - 2.0_23_15
> > - 3.0_23_13_spread
> > - 3.0_23_14_spread
> > - 3.0_23_15
> > - 3.0_23_16
> > - 4.0_23_15_spread
> > - 4.0_23_16_spread
> > - 4.0_3_13_spread
> > - 5.0_23_15_spread
> > - 5.0_23_16_spread
> > - 6.0_23_16_spread
> > 
> > Would it be benefitable to define separate DRM modifiers (and NV12
> > compressed variant for V4L2) for each of them?

-- 
With best wishes
Dmitry
