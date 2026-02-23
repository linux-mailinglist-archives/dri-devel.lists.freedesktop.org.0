Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH1dM2nXnGkJLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:40:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1217E787
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B3710E314;
	Mon, 23 Feb 2026 22:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIL0pWDy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsWbJ+mM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151EF10E314
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:40:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NJ0uVM3732832
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u/ELNB5NNSNmVG1lAxOxXYaU
 P/G6z2rnLtuVVe2l8Dc=; b=CIL0pWDyAHnR5vXk18SDZA7lb6nyCoTjULcjQfez
 Fd8EZfTPq5EtM25/5Al218WuFiIs1Mds6C/q0/EfPi6fYF11Kjzwx6jCUAbIgDF3
 A1rfdspmIF8aTktTYjxCTIWXiOVT49AQe6OgVD/d7sqgV9sm429j8EW2IRKZz4jR
 fB5J9wnQcdSkjZaVqOSd5qSOwTco8FKnmcALeH23N4obi36U1A7KduH1zlGlZF0v
 fzA8y6OA1hpylxOWNBU4cB3CfpjfygvgTMTuSKgbyOZQlcaUIs+2f9R6JhJfZLxW
 zAHG0AR/GsaSlxM7FdpK2WFea2c5ABblEUPd36w12xuwXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7ta460-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:40:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso95949885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771886431; x=1772491231;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u/ELNB5NNSNmVG1lAxOxXYaUP/G6z2rnLtuVVe2l8Dc=;
 b=NsWbJ+mM4D9mqMnONUpzOYuinZMLglRSZ0mHWP4k09QYotf7wiTwz8Rk2hfgm1Jyxc
 A6sGtt2abw81JmSrj/UQ0j6BHIkPYuRyPnLAtvKPu+TUVvsNkdzBqlKSN6g35ebjduBC
 mMdrUJlMzJbFoRF6z9FgH6mqtBO8bwQ+cu7pfgTkMbta1UQiId0AwHcZteaEaV5mnSQu
 ktfH3CF8zWQ/UUO9wy8t8b3eN0PXA5VfPG7JkLgKPRGEKrDgvslJ1z9RtZgqLdQe9eXu
 lQJYrPq/t3p17ITt/kJCWWGV60ymYB5hpVJqwt6UmyProesJ3Lne0fHFhFpx6/MJJso8
 Mq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771886431; x=1772491231;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/ELNB5NNSNmVG1lAxOxXYaUP/G6z2rnLtuVVe2l8Dc=;
 b=tGAGPe05e8wb9ukJRQxsHqz8onjh7ereXH8+mK1gZBf+HJJwZXXhoSvrGQV2miRivR
 yDgxEyg78kNFk1egcjVisEZUq86iaK3MS2oSj5P9YHtlsIbAE5UqEo9nXtGgjUDdzV/2
 wGCsC5JsD1Jg6NXfECtqlBeBWoToSfQz5TFF634J75CjecRuvyret/uFmLsF7JKTR0ik
 P/yJkyPhx4uz4hrNcDD+6r2i9nMo5hMGzrPNxoWBZW23/h8+5k/6q51/ZsV8mjzDDIUw
 fTH3iQ9mWIfn+65hXpSl40vNzyWk+1F0fVGFrfB0QycC3+V9eukkfvAhBlNY0ZVezNO9
 cfKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzeS6JWuBI7UPETt95xWM1rMe8y1XTqWTYGxVPNwjenc//6K6CWKOq0K0iQ5xbv8OBoI/EbJk9oKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhuuaxjQM7p1yTE6S7VhJJ7I7Sf89gwRCq9h/FE5rD2vf+BNbm
 jKWo8XouV7QXqYIfN5UuwDtVSTjHjwxbpI38J56eEkZgRpQTWSP0M4us2zzL0oPk/a44PtL3Ea/
 6JNkAw0Cyq86KjXE2i/r8O5IiiiQuoFmpsKgayNT+XLNybf8p/++k0fcB77/BJPqnnke8CyM=
X-Gm-Gg: AZuq6aJ3LSXh+iItiwVw59YQByDGd4LRzqE8iVgNUJljJ9+WlIaEspb57kSqfjPag7J
 B+mNHFxw2G1DQCX9gn4HNph1sQDZXW11gjpU+VO4gAMDwpvVagcuTTy9/XeYPhx94XPt6wfV+KQ
 FoQNdZONrSiGSYKVUYV/ipYIRsXHQlXXZdA94lramwlKfJdZNu6ff7/0IKiT55cJzqUvGJdUXaQ
 jM7R/YMVkGFt0JZCcqgLLs7TbMK8fOpZEj4WA1w1+vSIzcH48juojMnQVYf76s8fHjw7PLNKpos
 duy8W+cxJjfhuS9L1EA6mX47hox8a4XUecAequriYuaQXsB9ee6+vOlrtDkZ2VMj8yNCGokJpbd
 JeojOw3sYycgl/dGTny+lcY6IZQAuJaHKpu+Lqg9kS6FeII++CV6JeErojGlBBHucEIzxuvaGer
 6l/+MjgEM5N4Q3nrrSWL+ilQ0BAqJun/iLNl8=
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id
 af79cd13be357-8cb8c9fd576mr1266005485a.25.1771886431273; 
 Mon, 23 Feb 2026 14:40:31 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id
 af79cd13be357-8cb8c9fd576mr1266002285a.25.1771886430804; 
 Mon, 23 Feb 2026 14:40:30 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a78b4a45sm18140691fa.13.2026.02.23.14.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 14:40:28 -0800 (PST)
Date: Tue, 24 Feb 2026 00:40:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
Message-ID: <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699cd760 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=gmMn6fPPSMme9wD3190A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: WAB3bH06ngJBHfrMJ4mfup67MQP_r1JK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfX7cIaCrayNmcC
 QHoOZd9+eork3wFl+yEvJ+toOJv2i7RaJd1rX/O5qaQza5HnTkZS2UlSG9WEUWfWqgQo6CesYDn
 o3pSxdwa2AK/fUNtPrzXKWH61KMyjRPS90pcmxIDq8Xob0UBNrwR3m2H5NwM1ijI+C1A7HdrD1P
 yxaOxFr+JTu07G4sjX6vB7Owuq437wPXBjxUu+9LtSsWUXHeIYdCUqOF1ZS57tptar824U56yyU
 j+3Qq19fcKgGGUJ7DbTSJzG1KAKUleD/m8urJWxLoECIy0moakXI6Q7KHwWUMYif9DX2pZl43WE
 1dXffDMQMnS83dm2atUbkG80GC9jEGHn881mHyWGoAxlUQumqrliy7QXbVfL8H0lXjvktaiJOMl
 1nc6NgLkSz4N8eQXGvTyAClHV2jw1wXEnczdg1ySJMtaSUGrgB8ymWE9ZqNahV47Uimia2qYAOQ
 DhOP72eA/C6CpOwSoSA==
X-Proofpoint-ORIG-GUID: WAB3bH06ngJBHfrMJ4mfup67MQP_r1JK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230197
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[lists.freedesktop.org:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 7AD1217E787
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:12AM +0530, Ekansh Gupta wrote:
> Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
> driver. The entry lists the primary maintainer, the linux-arm-msm and
> dri-devel mailing lists, and covers all source files under
> drivers/accel/qda, Documentation/accel/qda and the UAPI header
> include/uapi/drm/qda_accel.h.
> 
> This ensures that patches to the QDA driver and its public API are
> tracked and routed to the appropriate reviewers as the driver is
> integrated into the DRM accel subsystem.

Please add it in the first patch.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71f76fddebbf..78b8b82a6370 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21691,6 +21691,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>  F:	drivers/crypto/qce/
>  
> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	Documentation/accel/qda/
> +F:	drivers/accel/qda/
> +F:	include/uapi/drm/qda_accel.h
> +
>  QUALCOMM EMAC GIGABIT ETHERNET DRIVER
>  M:	Timur Tabi <timur@kernel.org>
>  L:	netdev@vger.kernel.org
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
