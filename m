Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C85348C138
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 10:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3A1113578;
	Wed, 12 Jan 2022 09:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A518B1131F5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 09:45:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C7J52B019096;
 Wed, 12 Jan 2022 10:44:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QKXUvjkTnqfyuuJJ/9fLbLqUbNNWBj6UxoTZSD1VgXg=;
 b=0g/MsK1OiOZU3dq3G+D9GapTzmQoW0YuFw/h5Ckk73elOP3+Le70B19CLQZcWzaRyP+A
 CJJBRhXPyMms72FMVYJk3TOCHFDbI5dWJ6SRMK37GhUNW+Xo/92x3ZUQYRTNMetn/plf
 qJcjWFbMshrfUEyUXbAa96a9pb1pTnOQFHy/Va4Cm9oO1XzV1IU5a26vFN/B3CzB+UHH
 zpD3IaZSjYd4SMqVYH1WdlcLmzjSoZLij/SvntyI0C2GCNkF7D3DQ9W2G9qqPfn8IGo9
 LUnkfzMr0E40eeuyzSNluk4L97Pk3TSMlhXoXbFvXqZctksW32DqKb/1XyS2fsZah23f aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhtg9s0m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:44:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81091100034;
 Wed, 12 Jan 2022 10:44:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72E2D218120;
 Wed, 12 Jan 2022 10:44:28 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan
 2022 10:44:27 +0100
Subject: Re: [PATCH v2 6/6] drm/stm: ltdc: Drop format_mod_supported function
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 <contact@emersion.fr>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-7-jose.exposito89@gmail.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <c5ffa201-4811-b070-75b5-85064cd78506@foss.st.com>
Date: Wed, 12 Jan 2022 10:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222090552.25972-7-jose.exposito89@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
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
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 marex@denx.de, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, s.hauer@pengutronix.de, rodrigo.vivi@intel.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello José,
thanks for your patch.

Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>


On 12/22/21 10:05 AM, José Expósito wrote:
> The "drm_plane_funcs.format_mod_supported" can be removed in favor of
> the default implementation.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index dbdee954692a..ef909e50f0e4 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -925,16 +925,6 @@ static void ltdc_plane_atomic_print_state(struct drm_printer *p,
>   	fpsi->counter = 0;
>   }
>   
> -static bool ltdc_plane_format_mod_supported(struct drm_plane *plane,
> -					    u32 format,
> -					    u64 modifier)
> -{
> -	if (modifier == DRM_FORMAT_MOD_LINEAR)
> -		return true;
> -
> -	return false;
> -}
> -
>   static const struct drm_plane_funcs ltdc_plane_funcs = {
>   	.update_plane = drm_atomic_helper_update_plane,
>   	.disable_plane = drm_atomic_helper_disable_plane,
> @@ -943,7 +933,6 @@ static const struct drm_plane_funcs ltdc_plane_funcs = {
>   	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>   	.atomic_print_state = ltdc_plane_atomic_print_state,
> -	.format_mod_supported = ltdc_plane_format_mod_supported,
>   };
>   
>   static const struct drm_plane_helper_funcs ltdc_plane_helper_funcs = {
> 
