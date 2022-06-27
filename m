Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E373755BA53
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87710FDCA;
	Mon, 27 Jun 2022 14:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2300910FDCA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:12:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RDU9iF019780;
 Mon, 27 Jun 2022 16:12:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fLqgEUtgLQ8lVAfp8ZG2jhKWEHztetknTXBKAQnmq3M=;
 b=NSwu6VaYMtq+dl/8iQ971tpH3Kcfq3KhTl+DsWmMkKBJsDQjrRVdEwLh0+osjoUgGDt9
 sDTXO1V3XMOR943wSSSv/xn2ao6AkYTnot6VjaJZhM8Rz30CsOJLlIag65Mb8xl70kaA
 6G+ZvPTee2ipWK0dpCVYk5mSyoAC0bjx1nKyVrNifLPFij9eTaSYFQ5E6ibTvsFNcrqN
 ST7gn0I+2TEjVtVbDBmOtuflMoKVsg9goGKTf8XQ11t84Uex/VZSmhf5XW2RjsHVcXT1
 ECEQnSUE1D34BXV856s2HmgYkl4f55Q7r7BMEr5piZdeqvaXHCcUe57bFGPYFyqzA/aB rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gy9mr1r0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 16:12:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 233AB100034;
 Mon, 27 Jun 2022 16:12:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1ED02221778;
 Mon, 27 Jun 2022 16:12:38 +0200 (CEST)
Received: from [10.48.1.86] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 16:12:37 +0200
Message-ID: <5255f936-e064-b7a4-ef50-5486c0afa983@foss.st.com>
Date: Mon, 27 Jun 2022 16:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/stm: ltdc: add support of the dynamic z-order
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220603134459.593379-1-yannick.fertre@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20220603134459.593379-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
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



On 6/3/22 15:44, Yannick Fertre wrote:
> Zpos property is immutable for all hardware versions except the last
> version (0x40100) which support the blending order feature
> (dynamic z-order).
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/drv.c  |  1 +
>   drivers/gpu/drm/stm/ltdc.c | 23 ++++++++++++++++++++---
>   drivers/gpu/drm/stm/ltdc.h |  1 +
>   3 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 0da7cce2a1a2..c63945dc2260 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -95,6 +95,7 @@ static int drv_load(struct drm_device *ddev)
>   	ddev->mode_config.max_width = STM_MAX_FB_WIDTH;
>   	ddev->mode_config.max_height = STM_MAX_FB_HEIGHT;
>   	ddev->mode_config.funcs = &drv_mode_config_funcs;
> +	ddev->mode_config.normalize_zpos = true;
>   
>   	ret = ltdc_load(ddev);
>   	if (ret)
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 6a9f613839b5..00a6bc1b1d7c 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -194,6 +194,7 @@
>   
>   #define LXBFCR_BF2	GENMASK(2, 0)	/* Blending Factor 2 */
>   #define LXBFCR_BF1	GENMASK(10, 8)	/* Blending Factor 1 */
> +#define LXBFCR_BOR	GENMASK(18, 16) /* Blending ORder */
>   
>   #define LXCFBLR_CFBLL	GENMASK(12, 0)	/* Color Frame Buffer Line Length */
>   #define LXCFBLR_CFBP	GENMASK(28, 16)	/* Color Frame Buffer Pitch in bytes */
> @@ -1309,7 +1310,14 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   	    plane->type != DRM_PLANE_TYPE_PRIMARY)
>   		val = BF1_PAXCA | BF2_1PAXCA;
>   
> -	regmap_write_bits(ldev->regmap, LTDC_L1BFCR + lofs, LXBFCR_BF2 | LXBFCR_BF1, val);
> +	if (ldev->caps.dynamic_zorder) {
> +		val |= (newstate->normalized_zpos << 16);
> +		regmap_write_bits(ldev->regmap, LTDC_L1BFCR + lofs,
> +				  LXBFCR_BF2 | LXBFCR_BF1 | LXBFCR_BOR, val);
> +	} else {
> +		regmap_write_bits(ldev->regmap, LTDC_L1BFCR + lofs,
> +				  LXBFCR_BF2 | LXBFCR_BF1, val);
> +	}
>   
>   	/* Configures the frame buffer line number */
>   	line_number = y1 - y0 + 1;
> @@ -1578,7 +1586,10 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   		return -EINVAL;
>   	}
>   
> -	drm_plane_create_zpos_immutable_property(primary, 0);
> +	if (ldev->caps.dynamic_zorder)
> +		drm_plane_create_zpos_property(primary, 0, 0, ldev->caps.nb_layers - 1);
> +	else
> +		drm_plane_create_zpos_immutable_property(primary, 0);
>   
>   	/* Init CRTC according to its hardware features */
>   	if (ldev->caps.crc)
> @@ -1607,7 +1618,10 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   			DRM_ERROR("Can not create overlay plane %d\n", i);
>   			goto cleanup;
>   		}
> -		drm_plane_create_zpos_immutable_property(overlay, i);
> +		if (ldev->caps.dynamic_zorder)
> +			drm_plane_create_zpos_property(overlay, i, 0, ldev->caps.nb_layers - 1);
> +		else
> +			drm_plane_create_zpos_immutable_property(overlay, i);
>   	}
>   
>   	return 0;
> @@ -1737,6 +1751,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.ycbcr_output = false;
>   		ldev->caps.plane_reg_shadow = false;
>   		ldev->caps.crc = false;
> +		ldev->caps.dynamic_zorder = false;
>   		break;
>   	case HWVER_20101:
>   		ldev->caps.layer_ofs = LAY_OFS_0;
> @@ -1752,6 +1767,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.ycbcr_output = false;
>   		ldev->caps.plane_reg_shadow = false;
>   		ldev->caps.crc = false;
> +		ldev->caps.dynamic_zorder = false;
>   		break;
>   	case HWVER_40100:
>   		ldev->caps.layer_ofs = LAY_OFS_1;
> @@ -1767,6 +1783,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.ycbcr_output = true;
>   		ldev->caps.plane_reg_shadow = true;
>   		ldev->caps.crc = true;
> +		ldev->caps.dynamic_zorder = true;
>   		break;
>   	default:
>   		return -ENODEV;
> diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
> index 59fc5d1bbbab..4855898bd4c0 100644
> --- a/drivers/gpu/drm/stm/ltdc.h
> +++ b/drivers/gpu/drm/stm/ltdc.h
> @@ -28,6 +28,7 @@ struct ltdc_caps {
>   	bool ycbcr_output;	/* ycbcr output converter supported */
>   	bool plane_reg_shadow;	/* plane shadow registers ability */
>   	bool crc;		/* cyclic redundancy check supported */
> +	bool dynamic_zorder;	/* dynamic z-order */
>   };
>   
>   #define LTDC_MAX_LAYER	4
Dear Yannick,
Many thanks for your patch,
Applied on drm-misc-next.
Have a good day
Philippe :-)
