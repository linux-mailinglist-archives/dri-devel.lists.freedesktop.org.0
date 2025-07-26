Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14745B127DD
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 02:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE6410E39C;
	Sat, 26 Jul 2025 00:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkcdKEWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F69410E0E6
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:12:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PKla8x026216
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DoBs6OVTwFF+JmRKLxgaU515
 KdcbQmUXJDbYvNv8Tsk=; b=AkcdKEWch4hN0ZdD5TgDOmbaOcmN27fIS/ZlHbWe
 3ULXqdAcgmVi41jdu/XZjfaiA3D7okA2KiiMsqLdEVWadDDOTywEvW0cb9vaNYcH
 BZte5R7/RAjP9G30k/XrAEZQoSPGAzuoI1m7cBtt+qwTY0JWPGJSJOIr6Cq+GyFo
 NFbF/T6c/D7WKznCMg8bU3AWiToqyIHXEdleQLztsN9ljT5ZMoeIebuFk4agoqoI
 cSCm9nKK3HTqFL/9Vh/zr3Th+7Z94MSdGtRntAg4M8H66eC/jQzOk0nZrKgO6EOP
 wXNcFxn88yKgJLj8/B3MvF9G6u1enWDcHWWnp4BGwfzSeg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w30uq8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:12:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ab3d27d53cso79861331cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 17:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753488774; x=1754093574;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DoBs6OVTwFF+JmRKLxgaU515KdcbQmUXJDbYvNv8Tsk=;
 b=sKleWSHw+wROiw2P03nVsBLWM2PwDCX5stg8hGwzc1/eH1amtBDWUpxeVDo+NFC4oy
 n1+cwldypWrBuLViJtfWe6ufVmJdWJnkNj1fyxPD1iEUJxEj4byCAs81HmnnQoT/bW2M
 Ha0GDPbsEPa1ajo7TH3y/KglsBUfW6ewXcI1krOggIF6YvHlVRcMON+dIVi/beomSn0J
 HBdZU2VeZsBy/zCsGJJn+j5Z+verA9fXHc3w+1rP8/2SoO9C4XLMMiJCXODJ0C4Klspw
 xCL3QqG9m5Jr0uEl41o+lz5isgZ4ZO+SElY17VgWWdtuUXGYXywtu20gTxWIXmrHFuUm
 ZzmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUEdy334qpEgME6GIf/uUuYDDWBFtG37Bh+8GfKoXV2YZ8rjMcFitp/CjZMrCtC2Eu5p9uOtUEgc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLhgHspN2+zUxzDU2uSulND3iyezNFBavSTtFl6qFBFAIztez/
 yTGmCchhnuv6MbNlc3h8Kc/K8aTNKRGYAHzNwOeajR1egshEhD+j5+dm5ULcVS5mz04kzEi51pw
 qlwMinJ8Lhr/yL1aPf6mITenuTnAvMUvwoOBXq7jwzEZwsdFsDO893H4gLAugXx4hksm1LPY=
X-Gm-Gg: ASbGncualBrN00lNul1BqzntBdMsg8L8+96qkIaMH1iRcL9hfmUlt1I3idVXOyIV5NH
 /A7pinUuCQyVD7MPgTYd3e0I9aoIxWntaXKLb6G6rRxOgOisi8rw1GrSUC05UxP0iBLmFY+2z9M
 1CKVh2BB08fAlUr+BY4V60d53m8pB2tGLjzxtWFCNDDmkCdYi7d7jbBt7Vb/wRk83nnoealOH/j
 XfUjIVnAXmnAdy0Q/x62GzPhbF3xDg9Z29Y2D6+aCLAvn5SD+SBYCiqMORRgNVDSkWQYFXNFXKc
 kHm22FtVPI+q9IBnsM8jhaK6aJsUzW9KWQzN5fLJFsRcfEXazzwnF67IUHGSLz6jcnxHl246xll
 AEkST/hSDzHsfkoh4iO+P7OG8/U5IaHV3uxtN+F5g8uWIV6eS0FEa
X-Received: by 2002:a05:6214:e4a:b0:706:ffcd:d3ef with SMTP id
 6a1803df08f44-707204d91f1mr65699956d6.11.1753488774243; 
 Fri, 25 Jul 2025 17:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbddedN9+X5RQ+51/olzP++4eSaSJsPJ6FulQapEa8W/10AV19KAs7kk0J58zSr+jFJwBgmQ==
X-Received: by 2002:a05:6214:e4a:b0:706:ffcd:d3ef with SMTP id
 6a1803df08f44-707204d91f1mr65699336d6.11.1753488773736; 
 Fri, 25 Jul 2025 17:12:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b633760e6sm186357e87.160.2025.07.25.17.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 17:12:51 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:12:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 03/14] drm/rockchip: analogix_dp: Apply
 drmm_encoder_init() instead of drm_simple_encoder_init()
Message-ID: <6psjcrhbnk7czdrdtxh65kr6qvygkwogvert75dg2svbm2cqd3@uhffyfdxqpec>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-4-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-4-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=WtArMcfv c=1 sm=1 tr=0 ts=68841d87 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=HslhmZ87janovOCoqE8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: HwlmUzmcTWcX3o45KAD5nPyjbH7HIYnH
X-Proofpoint-ORIG-GUID: HwlmUzmcTWcX3o45KAD5nPyjbH7HIYnH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfXxZyMh/wWT2PE
 A1SS+o8rh/UMlzyDm1hWYDscKfjvu/IZIUfV1ABhpH9R81zsnEXpDp9O71DbuY1J56Luz9bj133
 YoKywAWAm2tu1LCmJe9B07+XWdX7WyKdif+QopDk6yB4+wsHAufvmMWJIp8hjFKk1g4oKvu25mS
 elXevWcfFnfH60sfzvBe8QpmsBQr5fNVkapGye7PAyZgqyPWKNl8xY36UhhvUp4s8dO0dehLoR7
 gv6honD8GgymxABnwAq20nAfkkHC7d6AEuBgd16CfryoTKbR3MahyNhByIxUgekyES1B2XmaDPo
 My9LbyQDr5y+v20iGioWcUwWRXI82gRliXGE9/JPgNRLgKJbjmC9W0HrM/5583z9bDLJvtfX4aY
 5AkZmV7IFFbrO/tMAILrlg6fUfA6qv3z1FVmfOKWTd5rMgdGbE71Y2wcvEd8aIFdF7kiNsi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=774 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250208
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

On Thu, Jul 24, 2025 at 04:02:53PM +0800, Damon Ding wrote:
> Compared with drm_simple_encoder_init(), drmm_encoder_init() can handle
> the cleanup automatically through registering drm_encoder_cleanup() with
> drmm_add_action().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index d30f0983a53a..4ed6bf9e5377 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -29,7 +29,6 @@
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  
>  #include "rockchip_drm_drv.h"
>  
> @@ -377,8 +376,7 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
>  							     dev->of_node);
>  	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>  
> -	ret = drm_simple_encoder_init(drm_dev, encoder,
> -				      DRM_MODE_ENCODER_TMDS);
> +	ret = drmm_encoder_init(drm_dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);

It's not possible to use drmm_encoder_init() here. Per the documentation
the encoder data structure should be allocated by drmm_kzalloc().
However this drm_encoder is a part of struct rockchip_dp_device. It's
allocated by rockchip_dp_probe() via devm_kzalloc(). This means that it
can potentially be freed before the drm device is completely released,
creating a use-after-free error.

>  	if (ret) {
>  		DRM_ERROR("failed to initialize encoder with drm\n");
>  		return ret;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
