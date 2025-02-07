Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42187A2B900
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DB010E9FD;
	Fri,  7 Feb 2025 02:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ykO+hKMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB6210E9FA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:22:31 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so16351481fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738894949; x=1739499749; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XJ2zkKifpQ89f3hMtzxU+G41sKfC/86q4GHwa2AD6jI=;
 b=ykO+hKMbFMX/m1CFFZfY5P58feZ9cWcAiXWH5FgXEBB5admaD3FeJip8FEx/k0/8PC
 ZZ/bpgudLuF9/1ZOh5nBTwFZtIrwQx14LQW/ofIAU99m/BXhI9g8EHDykoF/PunE6SOo
 FwGL9TWn9tvf9NDs4VqLUaxlLrzpM6lf4/sEOQ99YUuXbPp5qbiXSV4B9OojB4o6lGkv
 KqtS6zNG5p4C5Qd5Uf7prk5a1ver/MHk5FfCDwEzTmMp412+JIG38r4lEMc4DgF0xGQa
 5R/oCO+6lb2aNQ1ckvYZnWTwaK6wED7fc7c7BdqYgU4t3WJtvtVPhTabQ2BDzeWY6gYg
 XEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738894949; x=1739499749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJ2zkKifpQ89f3hMtzxU+G41sKfC/86q4GHwa2AD6jI=;
 b=bVRh6Rz3o5NLKEBPuIviCKybyvB4VDPZV710CFUiNFgNbS+92wsqLxdWdgzPzlakun
 s5PzFFtUjDOzO/bSHb5CgXVv5Hl9NrDiQm8oJVKna1saU7afe54bYaJ27OGUkH4qbTMw
 6QvBdvT4Ei1GygugVBvI0cm1CF0KTLntuZ2RROfwBEGmyHvGo+VW7eMSjkf0baDxy/38
 ocRFisY9yVoxjX5itSEsJR+rk+X47JuJqlbKOE4Yh8/Q1/g8sGnULFebxrRTN/27yE2Y
 gu4nmJ9T91aqQssfxmLswml1iliNYTmKdQ9V7hGYY+IivMAtPMl5GP1rmWiALgTNbuHp
 64kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMcRULALLUqlzzNcnrkgBpSEF7t9DUyXMoekCrhkr+OTmtzMcA0Zq0ljKYACcDH/xyEsW/7Ou/kcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV21TWGefoNUmqvR+ERHQ2rmM7sDmVn9UP2fpwID+a+iDuaAkZ
 J1bA1GnJgHLCdeLqe1rkVpSIg1NL6182gkWahHNyCW+4deFZ+ucMaF88JQzDUks=
X-Gm-Gg: ASbGncs0NRp+7oUC3tHrBmtKnTM2nzzg01TsYc/eC7xUkhXUV+SiA2gTKS4WQj9yDGu
 UKrHgBo3nXNM6GNhH88k2e+O21pEZIkJfFk/hZXkNI9I9wKRa+pY1X13H2Gkej1wJhqcdLbqMrn
 qZkCIXuMn0J2xZd80xE7cmfUzidixmqpMi/p2L6HkRCIEwPunlHDsVqDhR9YSER/wAJ1ueTh/uX
 qRWwQXakREDL2QDWcxkEzmn4KuI0qoR/dde802EClDf59ALUf0Od5x4YSND7DcBqSlWZflYh9dA
 LP9i9CmpHWBZhamXrwqI3UaQgcnFVCDYgz0k4MLg/+RQu4xAW5wNR9In+KE/UqXWOoCuV40=
X-Google-Smtp-Source: AGHT+IGYPeDLkcUcJNuKIyN2Hu1GKaefHM6B17kcLxSwD3vE/zsB8TapdQI7IpzwkzI9FScw1YMjSg==
X-Received: by 2002:a2e:be21:0:b0:300:3de4:ff72 with SMTP id
 38308e7fff4ca-307e5a739e3mr2648431fa.27.1738894949030; 
 Thu, 06 Feb 2025 18:22:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de1a67c9sm2915881fa.48.2025.02.06.18.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:22:27 -0800 (PST)
Date: Fri, 7 Feb 2025 04:22:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 04/26] drm/bridge: panel: drm_panel_bridge_remove:
 warn when called on non-panel bridge
Message-ID: <cpe634qeg46gfph6diw7lshdiolnpmuik3nmd4fpayg4st5r55@5bcfdwjme7z7>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:19PM +0100, Luca Ceresoli wrote:
> This function is for panel_bridge instances only. The silent return when
> invoked on other bridges might hide actual errors, so avoid them to go
> unnoticed.

Is there a real case of something using this function in a wrong way?

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 0c5db13b11dcb90ee88b9932b91aa05fc48d59bd..c57036b06493a6922e2cae38bcd1733930ff0073 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -322,8 +322,10 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
>  	if (!bridge)
>  		return;
>  
> -	if (!drm_bridge_is_panel(bridge))
> +	if (!drm_bridge_is_panel(bridge)) {
> +		drm_warn(bridge->dev, "%s: called on non-panel bridge!\n", __func__);
>  		return;
> +	}
>  
>  	panel_bridge = drm_bridge_to_panel_bridge(bridge);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
