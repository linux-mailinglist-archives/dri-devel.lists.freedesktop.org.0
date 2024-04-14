Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49528A450B
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 22:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5187C10E82F;
	Sun, 14 Apr 2024 20:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VGoWBVEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr
 [80.12.242.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481E710E82F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 20:22:36 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.17.157]) by smtp.orange.fr with ESMTPA
 id w6MwrHBLldcyQw6MwrhVIY; Sun, 14 Apr 2024 22:22:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1713126154;
 bh=KkvTV2uGL6FKiAI+4rZ2c43iMm1IAPg5puJ5Da/2gmA=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=VGoWBVEbO8e8ObnKMMAiI23HFBK4+2cTBNwTBBv5Kpy7FfPiND7324CbPJ81PY2ih
 q2KU1txjPuXceK0t39bR64biSeI44UGoWoV30lcr786MM+3bZ2dlmBY4wasbn7omlq
 /WolJSFN90P2J2pueY0OG48fPgvLY5b4Sjfo/sRTk+gFk61kYFWUS62urj9Bc7DVGw
 SGLfX9M+VMF8LAre/8fxVVjB6eBrLJwno8kUrrvx9Rm9jb51iyPvtRMBOAHTBiWBVq
 4WrVnl21vt2XY/b4zxCS7NuYkGeMZnLDqQCZly4H4JHV8WJVBktSL6owB+iojK3Ryp
 PZyo6shu+hPVw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Apr 2024 22:22:34 +0200
X-ME-IP: 86.243.17.157
Message-ID: <d0db78dd-c915-41f3-b1be-b30a0266741d@wanadoo.fr>
Date: Sun, 14 Apr 2024 22:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: Add driver for EDO RM69380 OLED panel
To: david@mainlining.org
Cc: airlied@gmail.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, marijn.suijten@somainline.org,
 mripard@kernel.org, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 robh@kernel.org, sam@ravnborg.org, tzimmermann@suse.de,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240414-raydium-rm69380-driver-v1-0-5e86ba2490b5@mainlining.org>
 <20240414-raydium-rm69380-driver-v1-2-5e86ba2490b5@mainlining.org>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240414-raydium-rm69380-driver-v1-2-5e86ba2490b5@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 14/04/2024 à 17:22, David Wronek a écrit :
> Add support for the 2560x1600@90Hz OLED panel by EDO bundled with a
> Raydium RM69380 controller, as found on the Lenovo Xiaoxin Pad Pro 2021.
> 
> Signed-off-by: David Wronek <david-vu3DzTD92ROXwddmVfQv5g@public.gmane.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  14 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-raydium-rm69380.c | 378 ++++++++++++++++++++++++++
>   3 files changed, 393 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 154f5bf82980..84cbd838f57e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -542,6 +542,20 @@ config DRM_PANEL_RAYDIUM_RM692E5
>   	  Say Y here if you want to enable support for Raydium RM692E5-based
>   	  display panels, such as the one found in the Fairphone 5 smartphone.
>   
> +config DRM_PANEL_RAYDIUM_RM69380
> +	tristate "Raydium RM69380-based DSI panel"
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on DRM_DISPLAY_DP_HELPER
> +	depends on DRM_DISPLAY_HELPER
> +	depends on DRM_MIPI_DSI
> +	depends on OF
> +	help
> +	  Say Y here if you want to enable support for Raydium RM69380-based
> +	  display panels.
> +
> +	  This panel controller can be found in the Lenovo Xiaoxin Pad Pro 2021
> +	  in combiantion with an EDO OLED panel.

combination?

> +
>   config DRM_PANEL_RONBO_RB070D30
>   	tristate "Ronbo Electronics RB070D30 panel"
>   	depends on OF

