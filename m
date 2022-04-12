Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF894FD2BF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4554A10FB98;
	Tue, 12 Apr 2022 07:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B6210FB8F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:50:39 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1neBIL-0001w7-Eo; Tue, 12 Apr 2022 09:50:37 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1neBII-0007M1-Dw; Tue, 12 Apr 2022 09:50:34 +0200
Date: Tue, 12 Apr 2022 09:50:34 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Message-ID: <20220412075034.GS4012@pengutronix.de>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
 <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
 <20220408080748.GA2387@pengutronix.de>
 <20220408120021.GO4012@pengutronix.de>
 <B3E76A7A-9B62-4E6F-9472-00B6298689C5@gmail.com>
 <20220411090800.GR4012@pengutronix.de>
 <5929E7A7-776E-4BCB-92C8-A1CE05774FE3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5929E7A7-776E-4BCB-92C8-A1CE05774FE3@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:28:34 up 12 days, 19:58, 64 users,  load average: 0.17, 0.16, 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Lucas Stach <lst@pengutronix.de>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 01:07:56PM +0200, Piotr Oniszczuk wrote:
> this is DRI state when there is no any Qt.vars overwrites.
> (so all is autodetected/setup like in other  working SoCs; VOP2 gives here black screen UI):
> 
> 2022-04-08 17:47:57.035668 I /dev/dri/card0 Qt EGLFS/KMS Fd:5 Crtc id:49 Connector id:51 Atomic: 1
> 2022-04-08 17:47:57.035806 I /dev/dri/card0: Authenticated
> 2022-04-08 17:47:57.145447 I /dev/dri/card0: Found 3 planes; 3 for this CRTC
> 2022-04-08 17:47:57.145469 I /dev/dri/card0: Selected Plane #37 Overlay for video
> 2022-04-08 17:47:57.145515 I /dev/dri/card0: Supported DRM video formats: NV12,NV16,NV24,YVYU,VYUY
> 2022-04-08 17:47:57.145523 I /dev/dri/card0: Selected Plane #43 Overlay for GUI
> 2022-04-08 17:47:57.145567 I /dev/dri/card0: DRM device retrieved from Qt
> 2022-04-08 17:47:57.145574 I /dev/dri/card0: Multi-plane setup: Requested: 1 Setup: 1
> 
> plane[31]: Smart0-win0
>         crtc=video_port0
>         fb=53
>                 allocated by = [fbcon]
>                 refcount=2
>                 format=XR24 little-endian (0x34325258)
>                 modifier=0x0
>                 size=1920x1080
>                 layers:
>                         size[0]=1920x1080
>                         pitch[0]=7680
>                         offset[0]=0
>                         obj[0]:
>                                 name=0
>                                 refcount=3
>                                 start=00000000
>                                 size=8294400
>                                 imported=no
>         crtc-pos=1920x1080+0+0
>         src-pos=1920.000000x1080.000000+0.000000+0.000000
>         rotation=1
>         normalized-zpos=0
>         color-encoding=ITU-R BT.601 YCbCr
>         color-range=YCbCr limited range
> plane[37]: Esmart0-win0
>         crtc=(null)
>         fb=0
>         crtc-pos=0x0+0+0
>         src-pos=0.000000x0.000000+0.000000+0.000000
>         rotation=1
>         normalized-zpos=0
>         color-encoding=ITU-R BT.601 YCbCr
>         color-range=YCbCr limited range
> plane[43]: Cluster0-win0
>         crtc=video_port0
>         fb=58
>                 allocated by = mythfrontend
>                 refcount=2
>                 format=AR24 little-endian (0x34325241)

Here is your problem. The cluster windows only allow AFBC compressed
formats. AR24 is supported by the cluster windows, but not by the GPU,
see panfrost_afbc_format() in Mesa:

> enum pipe_format
> panfrost_afbc_format(const struct panfrost_device *dev, enum pipe_format format)
> {
>         /* Don't allow swizzled formats on v7 */
>         switch (format) {
>         case PIPE_FORMAT_B8G8R8A8_UNORM:
>         case PIPE_FORMAT_B8G8R8X8_UNORM:
>         case PIPE_FORMAT_A8R8G8B8_UNORM:
>         case PIPE_FORMAT_X8R8G8B8_UNORM:
>         case PIPE_FORMAT_X8B8G8R8_UNORM:
>         case PIPE_FORMAT_A8B8G8R8_UNORM:
>         case PIPE_FORMAT_B8G8R8_UNORM:
>         case PIPE_FORMAT_B5G6R5_UNORM:
>                 if (dev->arch >= 7)
>                         return PIPE_FORMAT_NONE;
> 
>                 break;
>         default:
>                 break;
>         }
> 

Somehow negotiation of the format goes wrong. Applications shouldn't
pick these formats when the GPU is used for rendering. I don't know how
and where this should be fixed properly, but your application should use
DRM_FORMAT_ABGR8888 aka AB24 aka PIPE_FORMAT_R8G8B8A8_UNORM instead of
DRM_FORMAT_ARGB8888 aka AR24 aka PIPE_FORMAT_B8G8R8A8_UNORM.

Could you try the following patch? It removed the formats in question
from the list of supported formats in the hope that your application
then picks one of the supported formats.

Sascha

-----------------------8<-----------------------------

From 7427109cfd16803902b55cd5536b9212abd09665 Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 12 Apr 2022 09:42:32 +0200
Subject: [PATCH] fixup! drm: rockchip: Add VOP2 driver

The cluster windows only allow AFBC compressed formats. Not all of the
offered formats are supported by the GPU though. Applications pick one
of the formats and assume that this is also supported by the GPU they
use to render on them, but this is not the case for all formats.
Particularly DRM_FORMAT_XRGB8888 and DRM_FORMAT_ARGB8888 are not
supported by the GPU and choosing them results in a black screen.
Drop these formats for now.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 9bf0637bf8e26..38412766e3659 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -16,8 +16,6 @@
 #include "rockchip_drm_vop2.h"
 
 static const uint32_t formats_win_full_10bit[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_RGB888,
-- 
2.30.2


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
