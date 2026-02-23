Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KOYI9rQnGllKQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:12:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA86717E105
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0479B10E2C2;
	Mon, 23 Feb 2026 22:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l74upXwG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgBKpvVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFDC10E2C2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:12:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NH0qqp109852
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=U8+99t2Q08+ketqYxwhfTfYr
 syyINxyz6SnBAR9Q/Mc=; b=l74upXwGKe5nvGSpUt5Sr+jvI1kN0EmQQJwIkT/f
 5rtolmxcSheWmP6r/BFNpA2OevUrbWJ+NAkmQcD4GHilDIXCkTUhHpz27O9z1yFC
 CBVYpIojePUWbaaugRyAZVBDVzIaLJN9nUYCw+bziNJV6OtlW+9iGCmq98a2W/ER
 NeBaHDaTESG+IjXV4SYxQKbS5e25zYOEnyIUu+lFeT7wKvY2JTB4pqTnN1Cb3IaB
 PqrL3bNhhZr7fM8R7W7/fXm16D96rajTYO7RSnV+Yqg/f+pfsHLHRjXOIwXac4Gg
 W9IkXjkizbIiNY7WGpfiVoICtOTDa1h7TAOVvkHQWdq2fQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx08vw4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:12:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb3fae6f60so5797272785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771884756; x=1772489556;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U8+99t2Q08+ketqYxwhfTfYrsyyINxyz6SnBAR9Q/Mc=;
 b=bgBKpvVZ9W8z/miMfUfieyVljyXT59+7PQAwYksh7tXa4TmHbBrgGBZee85y0T7MG/
 cv/Ml7AasMdhhn0zBTPBvnoQ9OVNG+UYrrDbQV/SsUB+CyIVw9ZGrT/uMgaohGt+8E6v
 tGwWc260cKFxFyWwnJahMGd36x92tf5NtIkl5Q4ESdvOcckMN3S2X4vjtunmAb2d9roE
 JG6H8+gtwj5vGdzgxm+zb+fDuA4K/swCoJruimw3/Wm9HV8ruf5SEHlg0mMsVJiHBVrA
 3WaZbqG+Hi/AEB8TjJ5IYwWV5evRisjiUbNqtORilV6A4aYOpNtCj3tPc2Ck3ktNm9Nb
 IT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771884756; x=1772489556;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U8+99t2Q08+ketqYxwhfTfYrsyyINxyz6SnBAR9Q/Mc=;
 b=rRwlwEEpKWX9lV41rWYjTslS/oEYseqbG38tV+a6otwewIjq989R7nBAncoYdZT/Nh
 hkUUQCN0qzHn/Y3icmTQAkHJRoj3C/7kWv4RUKF9jWcf4g/x1gCpGr7vVZxueGmpbB2O
 kIMBzb3GUu4XY4g52eJMAlSu5CV/zrVxvS44Qw1m1veBjXLwgXi3xxjkdbHrWfyPD5KT
 Fgel9kMV5JC3MGUen9LpJCtVKaWEccV/vAlPz87JNH4ek1zA4dxV2PVFn3QAP+9qXric
 OggsD5c7rwpg1qOLH0wNaiIbhoszp6FZ8wExiobRKVAutuiLOzQoE5ZDCUTDpF2vvY9r
 L4KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBnhF4jt2zI6glLsqrR/4HqnyMABIThrC9GGkq31e0ZVyzLTGwFKbVhKnIroK2bwZqa37KGBkd/w8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA4EM0EAT2c5qsVZLhN2wBkBMyAS3vC6z5MvG2QiVCz4AaOmCQ
 +jgkVdtBbkIZea+4oxahT8BjTIT4y99HJ8VVrBlt69mWreCDf3Ns8f34E8Qj64b2KRN8DDqrou2
 QO7mIpob6N6jvKAUSWdrWgCWshv4zX/MBEKcdQIsQUslfV7h88knLFIZmjbadCapOqjdfj0g=
X-Gm-Gg: AZuq6aLsI/gqlFTFKMWm8Zx0KQdWC0hdJcyKdKIGYmPHK929UhhPdxEq/uEzbDzFcMo
 MJ/33oy8owLU+kG9rxELxtZmjfUSbn4OCxKqg+SlIBe66jhGNYaer/R0iLE180YBCVXCaWzMAg1
 cuxFtfdDR1PrijjqE9mAxy6im/R164/iHJVllZb3QnMiYORoJg+8p3vQzbA5SDnKOSJFNruPJMU
 c1jJOLvvKNywnVutK/Bq/k9Qh37ytI7H7W1zh84sNZIYns9+0bsFyn+Gql023I320ZWskFFhmwp
 B0C6+hWQPrTfS2b9mW8Cp19tLH0Nw0VeUlDIU5FO0g2bfjh9x/27k0lCm5A9R1lp7s0EDIbJCcy
 5Ycbk4/mfkeVTGvlNUcTOErcprBbyh2sSv2axwdrdiqy2R6fDyFXHGzgwWR84MCRyAGy1hT2oJc
 ErCHdDQ39ihlltM7TyJ5TDxY4olX4mza2rK7o=
X-Received: by 2002:a05:620a:4441:b0:828:faae:b444 with SMTP id
 af79cd13be357-8cb7bfc8d06mr1818110185a.20.1771884756293; 
 Mon, 23 Feb 2026 14:12:36 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:828:faae:b444 with SMTP id
 af79cd13be357-8cb7bfc8d06mr1818103585a.20.1771884755417; 
 Mon, 23 Feb 2026 14:12:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a7aaed3esm18805261fa.40.2026.02.23.14.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 14:12:34 -0800 (PST)
Date: Tue, 24 Feb 2026 00:12:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm
 DSP accelerator
Message-ID: <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
 <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
X-Proofpoint-ORIG-GUID: HfoCANNWeAvgcElZVPQHbRaM4i94C-sZ
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699cd0d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=WRMiGO0D-mV3MfwFjRkA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: HfoCANNWeAvgcElZVPQHbRaM4i94C-sZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5MyBTYWx0ZWRfX8G2sP82ksveU
 maZeU8B0kr709KmTBj6CUugPU9Mi3nBxTVuE9wcS8H+24SdKZRLHbFLEGoVf2GEhqa0DFPBFCY5
 ztXi+LtKRpoHpZx+Hmzu6aliIHz2HJn+hwScuyEJ3KyHCKjDyrWC6MXebDIm+kjcZ7VfdIeHZuu
 gt0I+NOT8yfzjHZs2KXlycPB35Az3eUbWseJwjpbcNxrLO3X/okiywTxQoo8YFrrqIcDX1yMs+Q
 wk2VJI8lfg7YSWGcCiyuGFWavM2QWcTtIxuJi8jJf+Px7Td3I3iwmb3i0hj6VplUJmZFD9vSIh3
 Q3zkdBbwFDgTllH7/9i6ZVgtUdIAuMaAc5g8jvb/yEY5clwiNuHa0SHjNfkQgxdkEmZKJ3y4uon
 80zpmpa31tdDcAi7LAq/gOddWYhKdti2x413AG3halse/ZJTvK5PGOBsSm+Fq7t8s3fL8c6mSpX
 YwGgLSjh/JsFJwg4Nog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230193
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DA86717E105
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:50:32PM -0600, Bjorn Andersson wrote:
> On Mon, Feb 23, 2026 at 11:23:13PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> [..]
> > > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> [..]
> > > +/* Error logging - always logs and tracks errors */
> > > +#define qda_err(qdev, fmt, ...) do { \
> > > +	struct device *__dev = qda_get_log_device(qdev); \
> > > +	if (__dev) \
> > > +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> > > +	else \
> > > +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> > 
> > What /why? You are under drm, so you can use drm_* helpers instead.
> > 
> 
> In particular, rather than rolling our own wrappers around standard
> functions, just use dev_err() whenever you have a struct device. And for
> something like fastrpc - life starts at some probe() and ends at some
> remove() so that should be always.

I'd say differently. For the DRM devices the life cycle is centered
around the DRM device (which can outlive platform device for multiple
reasons). So, please start by registering the DRM accel device and using
it for all the logging (and btw for private data management too).

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry
