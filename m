Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242B59017FF
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 21:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A0210E239;
	Sun,  9 Jun 2024 19:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mIcXL9T5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D3110E22D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 19:35:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D33E4D1;
 Sun,  9 Jun 2024 21:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1717961698;
 bh=AWtqR2VbAumqdvm+ZWXQiQTgemgZ0fRFk3THB2JrSkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mIcXL9T585XWm53gTG9AoHJ0urQc4bmSQIifwZNbsZmXdti/B5o5815lH+hdPL35K
 A3boVx+4A9tHf9JHwdn0yclFQ4uohH+XD4lKmmNE+ajxWPj1FKWwBYUnNjGGoADe+v
 MWnCuOeuD8k3ZgGdbstCixb4VJ30OqtEFqFiGW6w=
Date: Sun, 9 Jun 2024 22:34:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: add missing MODULE_DESCRIPTION() macros
Message-ID: <20240609193450.GI18479@pendragon.ideasonboard.com>
References: <20240609-md-drivers-gpu-drm-bridge-v1-1-b582c5c815d7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240609-md-drivers-gpu-drm-bridge-v1-1-b582c5c815d7@quicinc.com>
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

Hi Jeff,

Thank you for the patch.

On Sun, Jun 09, 2024 at 10:06:17AM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611uxc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sil-sii8620.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sii9234.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 1 +
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
>  drivers/gpu/drm/bridge/sii9234.c           | 1 +
>  drivers/gpu/drm/bridge/sil-sii8620.c       | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index b99fe87ec738..73983f9b50cb 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1195,4 +1195,5 @@ static struct i2c_driver lt9611_driver = {
>  };
>  module_i2c_driver(lt9611_driver);
>  
> +MODULE_DESCRIPTION("Lontium LT9611 DSI/HDMI bridge driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index ab702471f3ab..724a08f526db 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -1021,6 +1021,7 @@ static struct i2c_driver lt9611uxc_driver = {
>  module_i2c_driver(lt9611uxc_driver);
>  
>  MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> +MODULE_DESCRIPTION("Lontium LT9611UXC DSI/HDMI bridge driver");
>  MODULE_LICENSE("GPL v2");
>  
>  MODULE_FIRMWARE(FW_FILE);
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index d8373d918324..0c74cdc07032 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -961,4 +961,5 @@ static struct i2c_driver sii9234_driver = {
>  };
>  
>  module_i2c_driver(sii9234_driver);
> +MODULE_DESCRIPTION("Silicon Image SII9234 HDMI/MHL bridge driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index 599164e3877d..6bb755e9f0a5 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -2384,4 +2384,5 @@ static struct i2c_driver sii8620_driver = {
>  };
>  
>  module_i2c_driver(sii8620_driver);
> +MODULE_DESCRIPTION("Silicon Image SiI8620 HDMI/MHL bridge driver");
>  MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240609-md-drivers-gpu-drm-bridge-6ab32656df86
> 

-- 
Regards,

Laurent Pinchart
