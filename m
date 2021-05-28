Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266A73943B7
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 16:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02596E156;
	Fri, 28 May 2021 14:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ABE6E156
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 14:01:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SDqN6v032433; Fri, 28 May 2021 16:01:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sm24cA2zEfcJexsSN/4wut2e6Xb1GhYhh0sMYqJJil8=;
 b=uRF1qkrItmVll5rTwkYKYzbOGlC1MiH45m9mc0ZFqCLNEykuHXlkhc1YOI/CTeUPU608
 a/nEDyoDLDfbu3ko8LtpaGHbC6x9hlo2ba+tkmUH32v0/SaOWk/49FlPRWbH222G4SZA
 XJwh7gUIkRGq2q2mzhR1Kevm6ktstsHIC3ERb7ebZUqnMEoBZPL4gCI2TbESkhyUZke0
 UWptztS5UGlXSjCwdD7n6mUvxyZENPA+EQyaXFW+KVBtAuQ33mwaX0UXftW+eTFDeRrE
 4rOhwjxukLDPObdbLRKCPMFvvy7cpLTz2cSMN8PvULk1GagDU4slfcKC4D3PYQd6RNGA Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38tsq0juum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 16:01:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D6D710002A;
 Fri, 28 May 2021 16:01:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECF5822D619;
 Fri, 28 May 2021 16:01:30 +0200 (CEST)
Received: from lmecxl0951.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 16:01:30 +0200
Subject: Re: [PATCH] drm/stm: Remove usage of drm_display_mode_to_videomode()
To: Philippe Cornu <philippe.cornu@foss.st.com>, Antonio Borneo
 <antonio.borneo@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Marek Vasut" <marex@denx.de>
References: <20210528080513.8168-1-yannick.fertre@foss.st.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <7f99af28-f4ef-303b-2844-89dc266d1ace@foss.st.com>
Date: Fri, 28 May 2021 16:01:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210528080513.8168-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_05:2021-05-27,
 2021-05-28 signatures=0
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


Hi Philippe,
I have already reviewed this patch on January 7, 2020.
(https://lore.kernel.org/dri-devel/0ab4ee45-4437-3b02-cf63-0e3b1b53920f@st.com/)
Could you please review it and merge it?

Best regards

Yannick

On 5/28/21 10:05 AM, Yannick Fertre wrote:
> There is not much value in the extra conversion step, the calculations
> required for the LTDC IP are different than what is used in the
> drm_display_mode_to_videomode(), so just do the right ones in the LTDC
> driver right away.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 32 +++++++++++++++++---------------
>   1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index e99771b947b6..d113b9be12c0 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -570,31 +570,33 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
>   		}
>   	}
>   
> -	drm_display_mode_to_videomode(mode, &vm);
> -
>   	DRM_DEBUG_DRIVER("CRTC:%d mode:%s\n", crtc->base.id, mode->name);
> -	DRM_DEBUG_DRIVER("Video mode: %dx%d", vm.hactive, vm.vactive);
> +	DRM_DEBUG_DRIVER("Video mode: %dx%d", mode->hdisplay, mode->vdisplay);
>   	DRM_DEBUG_DRIVER(" hfp %d hbp %d hsl %d vfp %d vbp %d vsl %d\n",
> -			 vm.hfront_porch, vm.hback_porch, vm.hsync_len,
> -			 vm.vfront_porch, vm.vback_porch, vm.vsync_len);
> +			 mode->hsync_start - mode->hdisplay,
> +			 mode->htotal - mode->hsync_end,
> +			 mode->hsync_end - mode->hsync_start,
> +			 mode->vsync_start - mode->vdisplay,
> +			 mode->vtotal - mode->vsync_end,
> +			 mode->vsync_end - mode->vsync_start);
>   
>   	/* Convert video timings to ltdc timings */
> -	hsync = vm.hsync_len - 1;
> -	vsync = vm.vsync_len - 1;
> -	accum_hbp = hsync + vm.hback_porch;
> -	accum_vbp = vsync + vm.vback_porch;
> -	accum_act_w = accum_hbp + vm.hactive;
> -	accum_act_h = accum_vbp + vm.vactive;
> -	total_width = accum_act_w + vm.hfront_porch;
> -	total_height = accum_act_h + vm.vfront_porch;
> +	hsync = mode->hsync_end - mode->hsync_start - 1;
> +	vsync = mode->vsync_end - mode->vsync_start - 1;
> +	accum_hbp = mode->htotal - mode->hsync_start - 1;
> +	accum_vbp = mode->vtotal - mode->vsync_start - 1;
> +	accum_act_w = accum_hbp + mode->hdisplay;
> +	accum_act_h = accum_vbp + mode->vdisplay;
> +	total_width = mode->htotal - 1;
> +	total_height = mode->vtotal - 1;
>   
>   	/* Configures the HS, VS, DE and PC polarities. Default Active Low */
>   	val = 0;
>   
> -	if (vm.flags & DISPLAY_FLAGS_HSYNC_HIGH)
> +	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
>   		val |= GCR_HSPOL;
>   
> -	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
>   		val |= GCR_VSPOL;
>   
>   	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> 
