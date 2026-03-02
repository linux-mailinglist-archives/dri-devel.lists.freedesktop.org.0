Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO9OIJSDpWmxCwYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:33:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B5A1D8960
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804C010E4BB;
	Mon,  2 Mar 2026 12:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCBt9oSL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwibZDjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D52D10E4B8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:33:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622B3lbb3863272
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=AHg8RT610JbVn0w1EKQT8kZU
 r3JvP/ohxZA8ve4jZUQ=; b=YCBt9oSL5zoZj0C0T9YxAN1+fOrGFZuoPcCH4Tb2
 FsC6K8v2e/QXbrSAktn7xXGnKbC5YttPcdGBZUb+gwmoZXq5GPMz+HRXB/X//lBC
 Q7mf4EOxQPty977WjuqcWHuojmdga0XOkk3wHc95Jax72Di2gjHcjCgyP69hd72N
 8Utp2cMxNeXoTeblvwvQDpN/73emTsEsLLetq1AaE6/el/4WhJgCfP60ToxxwoGo
 0cgPrkGeWfxTE1gMFvHDJdnVJz/P6Dri4b/Vmyt6XNojKBoXYe1hqJX7hh4RUzC6
 RhwUqRAokh8AXuqDq+GnT+UMWpNxjNzL4qHPeILZtjLOng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjg8c7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:33:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb0595def4so4237055985a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772454799; x=1773059599;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AHg8RT610JbVn0w1EKQT8kZUr3JvP/ohxZA8ve4jZUQ=;
 b=jwibZDjTq5XK/aAoYCJv3XLqIpjxL0ZqctSzh5+p3nJp1TkKbpYFzYqIcLe5amBUhX
 VdNOSBv95s79al+lUpLTKu5JWGe2j/Kpm27vkoyjFKuP9Hvhxc+tiAn1A678NELpzbQC
 n8khrdrPYMYAneBHTY+qaFzNDPz4P/mJwt39SVJRS5CU1WAYhYRVC22/ua5Q3M1kuFTO
 sA+l/msRguZVhzlPXyh7bNtIqn8IXVt8GnOSuVp0yL2crYrDCOe/xJSRsP5fT2k1U/7I
 VRkt05PFePt0HgvFSqau7ZFUiAh3J0A1uUso9GzTGMGKqvapSdmmiUnnTkYVOAZ44r3n
 YnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772454799; x=1773059599;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AHg8RT610JbVn0w1EKQT8kZUr3JvP/ohxZA8ve4jZUQ=;
 b=vd955f6eQ6BPJP/Kbg6ElEyjlEDEpbTzmJc9KQig/p7n3A+NESfIa+du8ZuXvnrtNv
 I/qKzPT/ET2C1J+YrS/PPIHSiCsmI4hiTCUpHRzppfILSOhHfoN3ZKKUffURmUqdrnoO
 NaPj6tWJPH5k6Nuluz1Ex98lvcYlOF4ChBBt3dIAhjArPjmza1yWwAYX1HWOFcWogXd4
 ZUcToUE12XGEphN5px9CiLHAZiTZQ/yAy3n1nQFI7pT8s6lcxNoi8YGoZzIveA8V7/Ms
 7tQ6tcQ65N4ylUieGPfhNAYf0EBX4AwoxlblXQO4JR+yixuODeiQF7me/wcUNDeeiX4Y
 Ajdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjcnJnDioDDeFCYTGz/gJq97AEgcrm8oxDFHBM+V6FQ8EFFxslERE9iPd6U/mQ1w+BrB7DWOLac1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywg+uXNaanh3SC94p2DIctrT5xUyfex951Q9aQMywUwxOCP0crm
 TfyiwBhKqLrVRlCgCdEjRPHyfO+yOI2n8ZExWxz3VJF+N+K5xLURlY5N9QjnoDdL180gc8RR6YR
 3NR1Z92FSSGNNs6gbfLofnDk1FNS6CksIzEOJ9AT0vQsjYWEIVyV1KwlpiEBnvDsWdgeTp90=
X-Gm-Gg: ATEYQzwywEmh/Mx+NCXFR0TSL2Xw/sClaiuZLH1RtFgpgWVU7niTwk1wMk30/KP9r3f
 HZbwJsOy+tNkvnOvTrVkQLdapnhyNT8nvN7AdvuZAgBeBZ/uB4Ugah0LTSg4RMNJ1nkoMuDKOr5
 ngRM/ODkexQq7QeF2MMjK2aXfQFulM9gACtCc8FCxKp/FbUPkEhvFG+RDryTe0fI1S149mlwL84
 93NO8SR3VjyQwYW29V1D0D2yE12OyYSsZU2diKVzuL1nq1G5nW0cMTrjGxSbZ0T6efP7UaFPoKn
 Cljkuq4vNJnEpvX9srNCwamIlB42cPwLmJLUqDT/aRps918opIxQrS49AodKSGR/+/LOdpLHCkB
 LC43U+pRJDYFKQ8//jkh3vWr25HyP4WfXvoF/9GCafk6U/pvlH1w030ROwtYjtMppVImpDj3Ygq
 atzRd6RiFo+AO4LapPWm2axLPHIWxgDwrnDks=
X-Received: by 2002:a05:620a:7115:b0:88e:1be9:cf65 with SMTP id
 af79cd13be357-8cbbf4042cdmr1777238585a.39.1772454798593; 
 Mon, 02 Mar 2026 04:33:18 -0800 (PST)
X-Received: by 2002:a05:620a:7115:b0:88e:1be9:cf65 with SMTP id
 af79cd13be357-8cbbf4042cdmr1777235185a.39.1772454798099; 
 Mon, 02 Mar 2026 04:33:18 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0dbsm1696744e87.41.2026.03.02.04.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 04:33:17 -0800 (PST)
Date: Mon, 2 Mar 2026 14:33:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Message-ID: <odvdqfomdfiyl34ftovpc4pfyrdhnol76qbufa32axpmsvvizb@c3oclvxz72am>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a5838f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=_P5vsXOTX-fIJvdZQ7wA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lJI9nU4YuE2sgE-c7Og4W6gslZYXv8Po
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNSBTYWx0ZWRfX+VBgJe0o8055
 uycH0abnrLwrAVXYNhC18iO8zXcjofZXGuMs/CGm9WykcyxwyJ2FEQ96z+ijZPDSbf45kWimiyw
 /JiaGc1sLcI3mJwVTC+Rpanl3gB8uhw0LvCn9Rf7dik/fUw8ntNe1sBFi0rauuj+PgyRWEHEpSD
 TjDkAHRn6j5MCWqsC7UBcrL/WY7+fo5118A4gVI/ABc28LpRqL9jkPnMtelMqsX17uGqSVgzkmo
 cDPFlYKShJ9Eg07RbrgJoXS0JebSKc2yE0YkiXuHg9UumR2Cxd7yT0hANW/rJCBcE/PEuPGdzg+
 EwLuUDa4+y2t2nk4g90G0EWrALc04WUDrAcg9VTuUaRj+DJh8hzRm8zRiVXig+nyk/4EgDQZX72
 x6VdonjkwszSBI2d/Ozvt/WoW9egf1I1vZBgM1uACnkdCxrxArQ1hlwDKIjQxaAy59jhdj/Vo00
 IAT9jQT5MQuUYNatObg==
X-Proofpoint-GUID: lJI9nU4YuE2sgE-c7Og4W6gslZYXv8Po
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020105
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 30B5A1D8960
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 12:58:42PM +0100, Konrad Dybcio wrote:
> On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> > Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> > question revealed that it's not actually used by the DPU driver.
> > 
> > There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> > VBIF_NRT being used only for the offscreen rotator, a separate block
> > performing writeback operation with the optional 90 degree rotation.
> > This block will require a separate isntance of the DPU driver, and it is
> > not supported at this point.
> 
> (in case someone interested is reading this - patches welcome!)
> 
> > The only exception to that rule is MSM8996, where VBIF_NRT has also been
> > used for outputting all writeback data. The DPU driver don't support WB
> > on that platform and most likely will not in the close feature.
> 
> Unfortunately, it seems that way. Fortunately, it seems like it's indeed
> isolated to MSM8996.
> 
> This patchset is tearing out a lot of abstraction (which would only be
> useful for that SoC though) - if someone decides to work on it, do you
> think this should be effectively reverted, or should the NRT VBIF be
> instantiated in some other, more locallized way?

I think it should be added as a separate vbif_nrt, added and handled
without touching the main catalog. The main difference point, xin_id, is
still in place, it will be easy to add dpu_kms->vbif_nrt as a
first-class object (instead of forcing the complexity of
vbif[VBIF_MAX]). In such a case I'd prefer if calling code passes VBIF
directly to dpu_vbif_set_*() functions instead of passing the index (or
it might be easier to have a separate wrapper around those functions).

My opinion is that if something isn't applicable to 99% of cases, those
99% should not care about the remaining 1% usecase.

-- 
With best wishes
Dmitry
