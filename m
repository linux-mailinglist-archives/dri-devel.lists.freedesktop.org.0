Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA2E59B921
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 08:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1703099E1C;
	Mon, 22 Aug 2022 06:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D0A99E12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 06:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1661149166; x=1692685166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c/LNuuXCR/frANI74rKFcw8WnKOES9roDgS9gI/jD2A=;
 b=R26/rvgPpa3VIf3zshOVUovgX8brsF7cE3u8T3GvG6n2qLuCzz9xeYPH
 2rHWw7E1qMuFVC8syD6+QVqpOPG1VhxBzTDrvt9qELvmaLEnBFjyvL0cB
 oIJVnP3jIsviDnEvFxsfDFToHLFKltusS6xxjnZHcgFZTNwHl7Bdu8cRl
 pFSx5L4TGV+QDou321FBkPEFEaWePGVBRtXKwc7BUx2C7Z0X+zgxnv5xO
 PDwEBaLJO7/hkhGhhnFPuaJansNZF9iMJxvPxUoPYowMN3xNoEjkKCvn5
 qX+9QXpYK2Q/kKi9KC/Usu1i2nDGfeUR4VErWuDkHgoAvij4e6GUtW4s2 Q==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654552800"; d="scan'208";a="25716886"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 22 Aug 2022 08:19:23 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 22 Aug 2022 08:19:23 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 22 Aug 2022 08:19:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1661149163; x=1692685163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c/LNuuXCR/frANI74rKFcw8WnKOES9roDgS9gI/jD2A=;
 b=IY2fYK2ap+yvd2GcR7iuiEHjiL1pnSxX+4qubvPPRkiWS7ZJTTfxxHG8
 dmCS2ZnZ1lp0fnMlnL7XFqxM4JK694PaKYMjn2uu5hMxeCVRT5WH+xdSw
 LmGjX4Di/7WbxxBLwQSOq/m8yHFeNJuKm6gJo3GNVp5JHlvaC+Uh1Yp6G
 57r9AT9HJ3Rj29d8NHdIJhs2lu7IdBYwsNXHGcV0UTUvfSUnHYxIyNnF2
 TZ2ed/+hFDv8RTKkhFH1QY64OaeWAD92l/FliXhF9vO00N16KsB2oHfG3
 cNCuZR1QwGReTDy/Sc+kWoYMEoJ3g801F+wAxtH87Q6AqpymOPmuI/6bI g==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654552800"; d="scan'208";a="25716885"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 22 Aug 2022 08:19:23 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8D878280056;
 Mon, 22 Aug 2022 08:19:23 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v5 1/4] drm/lcdif: Clean up headers
Date: Mon, 22 Aug 2022 08:19:21 +0200
Message-ID: <12043706.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220819140852.255187-1-marex@denx.de>
References: <20220819140852.255187-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, robert.foss@linaro.org,
 Liu Ying <victor.liu@oss.nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Marek,

Am Freitag, 19. August 2022, 16:08:49 CEST schrieb Marek Vasut:
> Drop unneeded headers, sort rest alphabetically, no functional change.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reported-by: Liu Ying <victor.liu@oss.nxp.com>
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: Add RB from Liu
> V3: Add TB from Martyn from V1
> V4: Add AB from Sam from V2
> V5: Rebase on current drm-misc-next
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 3 ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.h | 1 +
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 2 +-
>  3 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c index 05db135800db0..4f16947212b60
> 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -8,7 +8,6 @@
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> -#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -16,10 +15,8 @@
> 
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> -#include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
> -#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_mode_config.h>
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> b/drivers/gpu/drm/mxsfb/lcdif_drv.h index cb916341e8454..6cdba6e20c02b
> 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> @@ -8,6 +8,7 @@
>  #ifndef __LCDIF_DRV_H__
>  #define __LCDIF_DRV_H__
> 
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_encoder.h>
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c index c7efc0d27f0e3..750e7e7ea8e81
> 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -17,9 +17,9 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
> -#include <drm/drm_framebuffer.h>
>  #include <drm/drm_fb_dma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_plane.h>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



