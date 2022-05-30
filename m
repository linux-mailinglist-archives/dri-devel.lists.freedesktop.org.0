Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD59E5377A8
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 11:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7F010E375;
	Mon, 30 May 2022 09:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4331D10E375
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1653902877; x=1685438877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=155NhGdnraZCFqCt2JHHnwo5L4WmighXUjo6xDOg0Co=;
 b=OzlTLE+uYTTc0gOuOmQ+vhcosCYaCHM3kHL/rMiNg+OWsQJwfbdO9I1G
 AuQFo6moemkI0wa3ohW04ukUli8Sffqo4E8lCxWVlg7Wk+/T2GZZSzWwH
 ccSLDP9Eia1HZFB4Hu8awWB4HdoOyX5Z4We3d+LvZOXb2i00WYGOA/vNS
 XVcsJFfJypnEJUYkPZT55ppxXdE7cDwSXIc3tLRv3LzpxOrjmTk9jfVRk
 gfXmbP24cIlfbDbeWq8RcVxq0qeQWav6zgRhnvnyIqb1FIQvDI8utcQvT
 hWc/GFf3bHPYoBUPZaWuPt28fdF9l79qzFBfP30LIh6YarnpIXMkei7IG w==;
X-IronPort-AV: E=Sophos;i="5.91,262,1647298800"; d="scan'208";a="24143582"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 30 May 2022 11:27:55 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 30 May 2022 11:27:55 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 30 May 2022 11:27:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1653902875; x=1685438875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=155NhGdnraZCFqCt2JHHnwo5L4WmighXUjo6xDOg0Co=;
 b=cGE7yptHUx/CPoDER/YcXY2GgRB0Ijh6JZT4tlayIFBYucam+VAPLq25
 MjKrrypomXJ0vMFwvKNPoYQsxYbg5B3hVSkyPDwsqbYAV1wVzPMAk0jOE
 VkxXDGQjWZYZ9GPikHuY4MGUylBG1/ocUq1ifmZFGCEREUZbBLc2qVUNb
 feMqcOxrce1F7e/QvNON9V7tU4BAxoKnw26LsBZsWU5mpvEjgPVRrvwHn
 keK2Z/OhLB2p88vEzcVdIxrXsqfbiBlLOfQLwpnvUZOKUDNSjnb+WQ+uP
 DdNGoBEtUMD7fpa/IN5k3JMh2G+YS9xMmMcm5oFYXs/tmyXZICMWFeu4H Q==;
X-IronPort-AV: E=Sophos;i="5.91,262,1647298800"; d="scan'208";a="24143581"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 30 May 2022 11:27:54 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A160B280004;
 Mon, 30 May 2022 11:27:54 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v4 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Date: Mon, 30 May 2022 11:27:52 +0200
Message-ID: <2893424.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <0bf5532b-f4d9-fbf5-0037-61887fc8512e@denx.de>
References: <20220519114849.69918-1-marex@denx.de>
 <4403432.LvFx2qVVIh@steina-w> <0bf5532b-f4d9-fbf5-0037-61887fc8512e@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 martyn.welch@collabora.com, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Am Dienstag, 24. Mai 2022, 09:29:43 CEST schrieb Marek Vasut:
> On 5/24/22 09:09, Alexander Stein wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Am Donnerstag, 19. Mai 2022, 13:48:49 CEST schrieb Marek Vasut:
> >> Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
> >> completely different from the LCDIFv3 found in i.MX23 in that it has
> >> a completely scrambled register layout compared to all previous LCDIF
> >> variants. The new LCDIFv3 also supports 36bit address space.
> >> 
> >> Add a separate driver which is really a fork of MXSFB driver with the
> >> i.MX8MP LCDIF variant handling filled in.
> >> 
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Lucas Stach <l.stach@pengutronix.de>
> >> Cc: Peng Fan <peng.fan@nxp.com>
> >> Cc: Robby Cai <robby.cai@nxp.com>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Stefan Agner <stefan@agner.ch>
> >> ---
> >> V2: - Drop the pitch check from lcdif_fb_create()
> >> 
> >>      - Drop connector caching
> >>      - Wait for shadow load bit to be cleared in IRQ handler
> >>      - Make all clock mandatory and grab them all by name
> >>      - Wait for EN to be cleared in lcdif_disable_controller
> >>      - Rename to imx-lcdif
> >>      - Move shadow load to atomic_flush
> >> 
> >> V3: - Invert DE polarity to match MX8MPRM datasheet
> >> 
> >>      - Enable CSC in RGB to YUV mode for MEDIA_BUS_FMT_UYVY8_1X16
> >> 
> >> V4: - Drop lcdif_overlay_plane_formats, it is unused
> > 
> > Thanks for the update. With your change in V3 my HDMI output works now
> > without that hack mentioned. weston screen as well as 'fb-test -p 5'
> > output seems sensible.
> > Unfortunately this isn't the case for LVDS output on LCDIF2. I somehow
> > managed to get the DT nodes for LCDIF and LDB done. Also the necessary
> > addition to imx8m-blk-ctl. So eventually I can see some output. But the
> > screen is cutoff on the right side of about 15-20% and the screen is
> > flickering slighty. This is especially visible in 'fb-test -p 5'. The red
> > bars are only visible to less than 1/3 and the text as well as the
> > diagonal lines are flickering. Colors are correct though.
> > For the record: I am using a 'tianma,tm070jvhg33' panel.
> 
> Does LDB start working if you apply:
> 
>   static const struct drm_bridge_funcs funcs = {
>          .attach = fsl_ldb_attach,
> -       .atomic_check = fsl_ldb_atomic_check,
>          .atomic_enable = fsl_ldb_atomic_enable,
>          .atomic_disable = fsl_ldb_atomic_disable,
>          .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 
> to
> 
> drivers/gpu/drm/bridge/fsl-ldb.c

I got this working, somehow. The root cause was that the LDB clock was not the 
media_disp2_pix_root_clk clock * 7, which is mandatory for LVDS (single link).

excerpt from clk_summary:
video_pll1_out     2 2 0   594000000          0     0  50000         Y
   media_ldb       1 1 0   594000000          0     0  50000         Y
   media_disp2_pix 1 1 0    66000000          0     0  50000         Y

media_ldb is too high (should be 462000000). I wonder why media_ldb is not a 
child from media_disp2_pix (or vice versa) when there is a hard dependency.
There are several solutions:
1.
Set video_pll1 to 1039500000 and adjust requested pixel clock of the panel 
(74250000 in this case). Now the dividers match hit the clock rates exactly.
But this renders the display list in panel-simple a bit useless.

2.
Adjust video_pll1_out only (e.g. 478757145). Now the calculated clocks comply 
to their mandated ratio. But this might affect other users, e.g. DSI displays

3.
Improve fsl_ldb_atomic_check to set adjusted_mode.clock to an achievable 
clock. This way lcdif will pick the new pixelclock to match their ratio.
But there is more work necessary, e.g. ensure the new pixelclock is in the
valid range of the display.

To summarize:
For both HDMI and LVDS using changes unrelated to this lcdif driver:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>



