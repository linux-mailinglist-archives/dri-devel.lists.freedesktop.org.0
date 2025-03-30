Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA67A75B88
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F352110E32F;
	Sun, 30 Mar 2025 17:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXY44235";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A78B10E32F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:49:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UCq43T008073
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=a6c8O64kMkPK5grfJVnb+sUd
 ExGl9BPB8K69PHPnsYA=; b=YXY44235edBcqRe+WQ0DQa+T+m88HKtWSRTv5M/A
 HhfnHyC/umGU0dp3lQygH9dXd16ttULMCLMTAH05jZlV+FeX5jyTXK7MaNJw8hIe
 GMiTTjy6gaoGqs4A5fowbAQwZEIoQfcq7W/4Ou7MHB3owkgCZ7Z7VmTRYnq8bS34
 3fv7+9cIro44yYd3O9UX0MzDbvtwOGpPGfNXm6VzRrOZ8HqUJMjZ4ESR1Lcg/UJP
 JKRK/E54WT/2u8p17EaCR4VV/5d6RYyEkcHC9YrYXneSg0w/H+xzREUaGZhrhuXu
 AMin4kRQB6GR1Dlhabk8XqNR94Xx9nSmnwpd7VvaJqKGCA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhjs65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:49:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8ed78717eso62138966d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743356956; x=1743961756;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6c8O64kMkPK5grfJVnb+sUdExGl9BPB8K69PHPnsYA=;
 b=rqD7oe+pBMWvxG+T/ITjqo0sVaN+bCwM6cew5lhg+usVH4pvT+n3HdoJx9Lajfgx2J
 R01UaqwGDZ8BqpczVxUkNaE4cARO9Ra0FOVJuhNasMsdN9zUz87DZUNiDChNbzuL3M3+
 SHbCAbdVFiVWIoa33JgWhVlSgvV2HauUnnLwW+RKmBHd7h4DOB0UjWLDCAmRpPzI7As+
 aR30gJtev1CoIfS5QxKUzb7dEPRyxXXWN4h+oqIoY3Ff9NQKYIXe24IdHsCYhoxOvswj
 c0fZKFR7sbiVbyDYXn3SWDnjF/NNchiEEPafK08VtGbubxbJ13K6Z+Bs5kvy4UIpxRCm
 t23g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBRyDPk88s2BqOtveXFIP8PsgMfWPzoXlK2EMvk4DJmuerQGy6TGDqW4NzB8ZLUwNQcChAiV7bZJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxSYZagkm4JGsN0K/UpuJSbMhlUxuU++MPeOcXzaUhIvx8jnjc
 yKcELxdfuGAYn2WlJnZbeE1r8h1nPDIZVSCJWnWpMLomKQnyXRLZNSoIcW2fuqUAVvwpwvXjyPp
 lrgViniGzhz+X9XpTDN1qEOcmZtWuxpJzXiAaUUpI+jUEIOENLwkJW8KHYYPVpJDSACM=
X-Gm-Gg: ASbGnctXQL1+HUgkyIUNvJT6QZbs4+BbWFxw1iDJ6AqE7lYKQLXyIJoBaDr5Kx3onfQ
 V7Anjx3ZOu30pFtatgMALrjHsEHP/inly0n2lIpxwmLSWJ+W0qBI9gft31D6nxKP72oVUBdAtm5
 xFHonH9KzQVMQskX/5uAjVy/J7V585h249R2epzDIOf7uMVxMscWW0WjElN5rCl5a929rSSfIF8
 dDWfKAuoVbE1T/uoBQhDjsU4Z/dB7ng7v3P0xjMKW9UfImCH098P+bWTXdqJFCuLHJJWEvxfeJJ
 2fWKI0TQ4S6NWJ6hnzK9bgbd/uyvLKgy+K7RibU7VeB5ZrxTzq0P0iPCzvvOaUw+yjmjrQdcCGq
 7Iwo=
X-Received: by 2002:ad4:5c41:0:b0:6e8:9bcd:bba6 with SMTP id
 6a1803df08f44-6eed663fc22mr145390676d6.7.1743356956566; 
 Sun, 30 Mar 2025 10:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMlFUimnqvaMI/KBKLcwVGgh9bJ2ue2vODFiTU6iF6C9DgBHuqfEpaKoh3wsMU2In1hVIkPw==
X-Received: by 2002:ad4:5c41:0:b0:6e8:9bcd:bba6 with SMTP id
 6a1803df08f44-6eed663fc22mr145390096d6.7.1743356955961; 
 Sun, 30 Mar 2025 10:49:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2b59686sm11889761fa.97.2025.03.30.10.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:49:13 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:49:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
Message-ID: <7giy3wpm4xyth6ol7wvfg5r446lmmdftw656vwdhbyzs6xrewh@25etguysdhqh>
References: <20250320101455.2538835-1-shiyongbang@huawei.com>
 <20250320101455.2538835-6-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320101455.2538835-6-shiyongbang@huawei.com>
X-Proofpoint-GUID: IcFuc75HvE0nPOyswnu5gG_VLJT742yf
X-Proofpoint-ORIG-GUID: IcFuc75HvE0nPOyswnu5gG_VLJT742yf
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67e9841d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=i0EeH86SAAAA:8 a=KKAkSRfTAAAA:8 a=zjCg_pdqLbO7AXn0O-4A:9
 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300124
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

On Thu, Mar 20, 2025 at 06:14:51PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add registering drm_aux and use it to get connector edid with drm
> functions. Add ddc channel in connector initialization to put drm_aux
> in drm_connector.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> ChangeLog:
> v7 -> v8:
>   - use drm_edid_read() in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
> v6 -> v7:
>   - add if statement about drm aux in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
> v5 -> v6:
>   - move the detect_ctx() to the patch 7/9.
> v2 -> v3:
>   - Capitalized EDID and AUX, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - deleting type conversion, suggested by Dmitry Baryshkov.
>   - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  3 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 31 ++++++++++++++++---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  5 +++
>  3 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> index ded9e7ce887a..e0bb9b14d9d8 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> @@ -161,7 +161,8 @@ void hibmc_dp_aux_init(struct hibmc_dp *dp)
>  				 HIBMC_DP_MIN_PULSE_NUM);
>  
>  	dp->aux.transfer = hibmc_dp_aux_xfer;
> -	dp->aux.is_remote = 0;
> +	dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");

As being discussed in the feedback for v7, this is a memory leak. Can
you simply assign the string here?

> +	dp->aux.drm_dev = dp->drm_dev;
>  	drm_dp_aux_init(&dp->aux);
>  	dp->dp_dev->aux = &dp->aux;
>  }

-- 
With best wishes
Dmitry
