Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CBFA9D7B1
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 07:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7238610E11A;
	Sat, 26 Apr 2025 05:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="STeY3nIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E88B10E11A
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 05:52:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4lxvs012252
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 05:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wPJiynUC5KrcChLqRhN+do2f
 Q7u3TtFrtBAAerVGWrE=; b=STeY3nIhQbk54o0P6ireoWGeLAsgBSWr6NRaWQ1j
 g4fKz8JnZXytwXe3hDg+7QZC4rN9pR0Q6VctYSRfSogq92bWCKNWyikjRVaeoTVi
 ltVBVQOOWOLnjbzh62fozs1rFzhjhVUkmRKiQio8PUZaSPWIaAq7G0lHInuNjdkn
 cmiVFXM3qBlYggT3rG/BfEzW7VlQITRSLc5OPwYTU6nilBtEdIytV0x14nVMgp0v
 ZkribfDVy0T5l8hX7KC5Fp4dlXOPRFY84i9t30Um0/+bLAxXTBZOO8lC7RG0q9Aq
 pRbTWFMnZiJiKePP9gJC+mEg0kjZFX4pCCv09wLqfyMuXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb04gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 05:52:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e9083404b7so52290266d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 22:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745646763; x=1746251563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPJiynUC5KrcChLqRhN+do2fQ7u3TtFrtBAAerVGWrE=;
 b=NYBaHaLNYEFCjjTeQnKaxkHhWxktG8gJUg5Mz3RI/y0p/zYZ7NgFCnX8pbMMP6kYhJ
 VeNvxOZ+MGzI4Y2nnLHDEKicebvky+ZrofCmtfYI3AcszgNaTUm7TSktGG06WGjD1ojk
 K9MCra5wVBKmvKAzQDdgnnxx4ykr1QlAxtzEi+a6cJ3mAeje8fZWexYbbLaRlOEC6crV
 CvgI0mwN/lCbjcx9hI0ZmnjP/6KkJFkeS7tpyEUSVs9J0OTCugALY8cln5xcUQ1nfqyQ
 mSID5WwMhse0hsV14EaH27VnfKR6BbUx81O6ssRyMcGOh0RoQXiyse/nw5FE7aJXoglh
 L8VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT4a6zOd81eQOMLWbxvStgA659a2SMWB4nVH5kNCQ8fmq7vF4J45PQQE/XRd12Zwk+couWXpLMsEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX3AMXTvFpOsqr+ROiS0IuXm3yXauPMpckg8/O8hZlEA0Qz8CC
 0MbtEzZqYaFdV3xppT6/vqnuzQrKReJUOnGys7+Qq1i0R7jJ/sBCCYK7nso7f9VfHOQeaZImCSr
 4uLMVo6RdUfsFfy7EwzK/4GG2RNcIzA0SZ1LiQZ2KDpOM++/4zDPG1/Cq0OnowfZTQHo=
X-Gm-Gg: ASbGnctka1HfIQzhl9U/DboQfATf79W3yU3L42YTcMNFwthu0iq+A64D4nIDole0vu6
 oipHc4MvK/cIdNHmN202sXYfzUaVlaa5afprwG18QfWdugUcBhxT9R7wsVBGJTs09EkD9PVtPFE
 D0shY6Fcvow9u2inyGa5q+g/0WAR3B+KXwHJrTdYgiwUPWxl3yKgfABZ/qX9QXiGdK4uC/Owu8S
 vnEaWSQqTJAGETKiDIQDgm6dQ0F15pNAxKM7wxzYC6QDuHPHsU8nxN5jl0tlm7YolcCE0u74OLG
 8ESyZxZgTxvK10rdu9bUQWdCBzyVWIFwMb2pF8SmoDYxesbbYOuLlWq0EE6kLC39EKxKpRkzNWw
 =
X-Received: by 2002:a05:6214:29ca:b0:6d8:a7e1:e270 with SMTP id
 6a1803df08f44-6f4cbb5893bmr70485356d6.40.1745646763444; 
 Fri, 25 Apr 2025 22:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGfnM89hyAQV0jPbK7IhI4wD6nEJfo4E+eFt6OFBoKATt5UnIfwc6pP9Q3dfmcI6nbIsPN2w==
X-Received: by 2002:a05:6214:29ca:b0:6d8:a7e1:e270 with SMTP id
 6a1803df08f44-6f4cbb5893bmr70485266d6.40.1745646763120; 
 Fri, 25 Apr 2025 22:52:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b96d27sm10503671fa.107.2025.04.25.22.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 22:52:42 -0700 (PDT)
Date: Sat, 26 Apr 2025 08:52:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/fbdev-client: Ignore EOPNOTSUPP errors
Message-ID: <tqvzgt3cyf453x6eovhe2ox5n7w4wacmdjzxpclxsubq3ub7ld@a6fzvt2is2sa>
References: <20250412070047.6725-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412070047.6725-1-thierry.reding@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMyBTYWx0ZWRfX0L17W1Z4vU2c
 I17IamQjCDs4tbYQSm4Iabc1eXpDDwjOoCZvQQGLXkQJ7f3Rx5FnoFfe7ReT70J4y7E15b2Wo+K
 UH9bP5Ch8GjO7BWzYG6JCP/KZ8QCipsycwCQZt8+brf4JY+TVMQ3TNiAGUWxPx3sm1FUSKGop4N
 NxaVN0dxK5vQgFPK8pCK/bQw4A2g1EvS1RqdbjzaTJJZHZA/USBgOt2d+6r/ORg/osX+8NslxeM
 mFBdLAzHWKB62rvdWrZZZxIDo3QUW+qOOcCL09nWQ/RoVAUVnI/C0hM+BKD4UMwfMdm10QxEaLH
 b2EKBmtTH8eLNwvey2HgC0dVLjjBH03JWkxNevig0ZpqizI436gCpUZHJ1cptGOClRURvLgoTnZ
 TPGyYr29aqZVG6VUzFiRo0GD2c5t3v8CgMRmFEgeKydRckLt6RRds8n2OM/XAhFieEJlmypI
X-Proofpoint-GUID: dqS1tiwAuY5BOEEuTbl_uAPqSB5qzU-o
X-Proofpoint-ORIG-GUID: dqS1tiwAuY5BOEEuTbl_uAPqSB5qzU-o
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680c74ac cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=Ikd4Dj_1AAAA:8 a=IgeXuqktetCwhAi8AUwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260033
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

On Sat, Apr 12, 2025 at 09:00:47AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Recent generations of Tegra have moved the display components outside of
> host1x, leading to a device that has no CRTCs attached and hence doesn't
> support any of the modesetting functionality. When this is detected, the
> driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.
> 
> Unfortunately, this causes the following errors during boot:
> 
>     [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to register client: -95
>     [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM client; error -95
> 
> These originate from the fbdev client checking for the presence of the
> DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
> not support DRIVER_MODESET this is entirely expected and the error isn't
> helpful.
> 
> One solution would have been to conditionally call drm_client_setup()
> only if modesetting is supported. This seems a bit redundant, however,
> and could further complicate things if ever any DRM clients are added
> that do not rely on modesetting.
> 
> Instead, simply add an extra check to ignore this expected error and
> skip the fbdev client registration.
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> index f894ba52bdb5..8c8552ed912e 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -152,7 +152,11 @@ int drm_fbdev_client_setup(struct drm_device *dev, const struct drm_format_info
>  
>  	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
>  	if (ret) {
> -		drm_err(dev, "Failed to register client: %d\n", ret);
> +		if (ret != -EOPNOTSUPP)
> +			drm_err(dev, "Failed to register client: %d\n", ret);
> +		else
> +			ret = 0;
> +

Wouldn't it be better to explicitly return 0 in the beginning of the
function if !drm_core_check_feature(dev, DRIVER_MODESET) ?

>  		goto err_drm_client_init;
>  	}
>  
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
