Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E0339FCED
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 18:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14D6E105;
	Tue,  8 Jun 2021 16:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7619B6E105
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 16:56:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 158GpTtB008149; Tue, 8 Jun 2021 18:56:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xmXXy0WciX654IwlpzmNZ/gVDr1D3/TyBFil1GVZFBY=;
 b=gskQBmP72sCEyBu8AD764fnP5x4b1XUc3ETw4WCBMPta73SdkH+tsugwBgA7W6MVDPXP
 4HBkswgPDFllrEjDcEM41QnE3IE8lMOXMylFxxRZRRHW1XCvUWBRbG/RZDlHvb3vi2Jy
 1Y71LaPSC+aT6UsmWkr4uQItpFBBQnftNO0dfuV+TcMomUxS/uElDYHAdD5e57bm9TlA
 iIIfEwcXbDZ+sQgxAaPwSOgV4A8AjjLGCCK9ff4RRMESUonJdZ3fCouCCBV/dPM88Ycv
 MBHHudSBo9es0N2We16yD2CYcG2BIyHY2Ikk/fTktnNg1d4gs9jeTdzi4lOqTAdfP6bZ Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3924rmjyge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 18:56:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FEDD100034;
 Tue,  8 Jun 2021 18:56:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FC5322E7E5;
 Tue,  8 Jun 2021 18:56:31 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 18:56:30 +0200
Subject: Re: [PATCH] drm/stm: Remove usage of drm_display_mode_to_videomode()
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20210607172457.14471-1-marex@denx.de>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <695b7ef5-480f-dc3e-74f5-99148add22d7@foss.st.com>
Date: Tue, 8 Jun 2021 18:56:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210607172457.14471-1-marex@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_11:2021-06-04,
 2021-06-08 signatures=0
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Abriou <vincent.abriou@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,
Applied on drm-misc-next.
Note: I added Yannick Tested-by from the last (identical) December 
version https://patchwork.freedesktop.org/patch/409968
Many thanks for your patch,
Philippe :-)

On 6/7/21 7:24 PM, Marek Vasut wrote:
> There is not much value in the extra conversion step, the calculations
> required for the LTDC IP are different than what is used in the
> drm_display_mode_to_videomode(), so just do the right ones in the LTDC
> driver right away.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@foss.st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/stm/ltdc.c | 33 +++++++++++++++++----------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index e99771b947b6..08b71248044d 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -531,7 +531,6 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
>   	struct drm_encoder *encoder = NULL;
>   	struct drm_bridge *bridge = NULL;
>   	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> -	struct videomode vm;
>   	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
>   	u32 total_width, total_height;
>   	u32 bus_flags = 0;
> @@ -570,31 +569,33 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
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
