Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912AAAD6C4D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 11:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDAA10E723;
	Thu, 12 Jun 2025 09:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IODf2t9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768A610E723
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 09:33:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D04257E4;
 Thu, 12 Jun 2025 11:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1749720825;
 bh=6dRei3ZosXB8ENiNImH8iJ3Wad/iOoe28y6eMm7mJL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IODf2t9Jy+7F3cYY8TCQ80z9zr8C9ks2u44UfObyPFWI8svEDO4AKnMrq6uu1s7JK
 GBm9OS1pn+432vPlvPbJ0cCzvpPK5bAt04Fp2eoW+jcEg1Mi/JpSyaL2rLKeKqQcKh
 o0J/DChrImDrKG2aoeqikmJ08LoAqCSZRs9D+0ZU=
Date: Thu, 12 Jun 2025 12:33:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 biju.das.jz@bp.renesas.com, luca.ceresoli@bootlin.com,
 tommaso.merciai.xr@bp.renesas.com, aford173@gmail.com,
 jesseevg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Convert comma to semicolon
Message-ID: <20250612093339.GC25137@pendragon.ideasonboard.com>
References: <20250612055218.1517952-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612055218.1517952-1-nichen@iscas.ac.cn>
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

Hi Chen,

Thank you for the patch.

On Thu, Jun 12, 2025 at 01:52:18PM +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

This should have

Fixes: ae01d3183d27 ("drm/bridge: adv7511: switch to the HDMI connector helpers")

While at it, I would also remove the parentheses. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 9df18a8f2e37..418a403586f6 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1278,7 +1278,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  						  SNDRV_PCM_FMTBIT_S20_3LE |
>  						  SNDRV_PCM_FMTBIT_S24_3LE |
>  						  SNDRV_PCM_FMTBIT_S24_LE |
> -						  SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
> +						  SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE);
>  	adv7511->bridge.hdmi_audio_spdif_playback = 1;
>  	adv7511->bridge.hdmi_audio_dai_port = 2;
>  #endif

-- 
Regards,

Laurent Pinchart
