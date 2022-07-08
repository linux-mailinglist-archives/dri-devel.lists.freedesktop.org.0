Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DEA56BB8E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 16:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F9610E2AE;
	Fri,  8 Jul 2022 14:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D866710E2AE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 14:14:42 +0000 (UTC)
Received: from [IPv6:2a00:23c6:c30a:1501:84f:2f6d:f5:3e2a] (unknown
 [IPv6:2a00:23c6:c30a:1501:84f:2f6d:f5:3e2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: martyn)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 635EC66019E8;
 Fri,  8 Jul 2022 15:14:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657289681;
 bh=9L9iu1gJuSz4jRo2H0YxO9ZOlWMeRewR777BrTZiu7Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=QcHZT7g0VTXA8KC9Ua8PSDULLFLI0TtrjY+wCOsyyJvFOweDnMrtv8FJ154NE3aXh
 hq/iRMr51n0TLgs0FwGmMSO+8ozTfPaOd/SMW2EmXg7U0uAiWRMX8KvlHi54msqsJE
 OeVvRaZcaeW9E4mTdElFOJFC0cNY3eNtT8n4XhuoDWdRIrs6G1PSBXVpWbFks/Z+0w
 DhWBU++lW4OPPDfvtyvJI8mArPUt5tAR/WZm78ElkkERH/7WJfUdqXnW5n87SrzLFM
 n5RJNj8DYvla7oDQPAsKqyoNSeDBahTqvLSXSyJCtCkhn4bGCf9jK74udJXnY701RV
 oFSJy7u/NzHmQ==
Message-ID: <f1b75c180e3da15d3f3d3c7cbd289a96b201e170.camel@collabora.com>
Subject: Re: [PATCH 1/4] drm/lcdif: Clean up headers
From: Martyn Welch <martyn.welch@collabora.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 08 Jul 2022 15:14:39 +0100
In-Reply-To: <20220630205728.128127-1-marex@denx.de>
References: <20220630205728.128127-1-marex@denx.de>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2-1 
MIME-Version: 1.0
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Liu Ying <victor.liu@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-06-30 at 22:57 +0200, Marek Vasut wrote:
> Drop unneeded headers, sort rest alphabetically, no functional
> change.
>=20

Series boot tested on top of drm-misc-next-2022-06-30 using Innolux
g121x1 LVDS panel connected to NXP i.MX8MP EVK.

Tested in combination with other patches, tree found here:
https://gitlab.collabora.com/martyn/linux/-/tree/6a4cccf50ea793d9e608ccda13=
468f8645aff6ad

Tested-by: Martyn Welch <martyn.welch@collabora.com>

> Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF
> variant")
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
> =C2=A0drivers/gpu/drm/mxsfb/lcdif_drv.c | 3 ---
> =C2=A0drivers/gpu/drm/mxsfb/lcdif_drv.h | 1 +
> =C2=A0drivers/gpu/drm/mxsfb/lcdif_kms.c | 2 +-
> =C2=A03 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index befad33dcb959..1370889c6d687 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -8,7 +8,6 @@
> =C2=A0#include <linux/clk.h>
> =C2=A0#include <linux/dma-mapping.h>
> =C2=A0#include <linux/io.h>
> -#include <linux/iopoll.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of_device.h>
> =C2=A0#include <linux/platform_device.h>
> @@ -16,10 +15,8 @@
> =C2=A0
> =C2=A0#include <drm/drm_atomic_helper.h>
> =C2=A0#include <drm/drm_bridge.h>
> -#include <drm/drm_connector.h>
> =C2=A0#include <drm/drm_drv.h>
> =C2=A0#include <drm/drm_fb_helper.h>
> -#include <drm/drm_fourcc.h>
> =C2=A0#include <drm/drm_gem_cma_helper.h>
> =C2=A0#include <drm/drm_gem_framebuffer_helper.h>
> =C2=A0#include <drm/drm_mode_config.h>
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> index cb916341e8454..6cdba6e20c02b 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> @@ -8,6 +8,7 @@
> =C2=A0#ifndef __LCDIF_DRV_H__
> =C2=A0#define __LCDIF_DRV_H__
> =C2=A0
> +#include <drm/drm_bridge.h>
> =C2=A0#include <drm/drm_crtc.h>
> =C2=A0#include <drm/drm_device.h>
> =C2=A0#include <drm/drm_encoder.h>
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index 4005660b0ced8..c9224126e2d54 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -16,9 +16,9 @@
> =C2=A0#include <drm/drm_bridge.h>
> =C2=A0#include <drm/drm_crtc.h>
> =C2=A0#include <drm/drm_encoder.h>
> -#include <drm/drm_framebuffer.h>
> =C2=A0#include <drm/drm_fb_cma_helper.h>
> =C2=A0#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> =C2=A0#include <drm/drm_gem_atomic_helper.h>
> =C2=A0#include <drm/drm_gem_cma_helper.h>
> =C2=A0#include <drm/drm_plane.h>

