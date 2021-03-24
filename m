Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469D434774E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 12:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82B76E9C3;
	Wed, 24 Mar 2021 11:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A199E6E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 11:27:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E80E3580C0B;
 Wed, 24 Mar 2021 07:27:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 24 Mar 2021 07:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=+SEXG0ufgadIG4Yo2GIwO/3hdlh
 +0aN9cWRQ7yIK8i4=; b=Cetj/a5eJDqyOothbmYUA/odLpPdkJtJtGE8ly9cJF8
 0y1g7wdGds08+kYhvLU5DyMNyJ5JrfE0fKcIFbsxoueU+5hYI2Nh7TD1kDo9pQZm
 p2vkRs3fI/bfq0U8n7NyCcCB+FEl42M3TPaCE2R9AEbo/sniR8mII2RKxqszEyjg
 pJeJjtfD2HO5sfOQcVUZhxbyoXvZBv5AaBUcg4vhCBArtcCB1PDCifR+9JzUw/M7
 zU1xpORzxmIE3wGICYgI/dxEXezk+6phvZbPpLyQnGvgN08ARQ1TEe+xuAf7OJjP
 XsJ10lpuW5A4EWuKdELEoBmN04d5LtnjXwMTK8zcHFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+SEXG0
 ufgadIG4Yo2GIwO/3hdlh+0aN9cWRQ7yIK8i4=; b=UkN2vYKB/e9Jgz1w9sExKX
 47h06Q/g93W/rHSctdxH+A1zUPDqtW+AQ6dtzZZK/wHMvXM2lrYnjPEC2n8rlOK2
 bIs0juA7W+9o+Ek1bB/oLdRJlA8JULMRyoa2SXoq0oje+RAKPxFZYtbkghEzF4L8
 Ap6xUHnJX22oN1wPyb3sGdEFN395pe+3HWJZiv1IJml5XAusjyTGibwvwWWRlxjA
 IO+DZvKhXKKg/mWyOl0TMxQUEB9fSNsz1zlShEGZ6xERc6g72PeNZPGpl0+l5B6j
 gkocO6DYt923hxvzuiYK60UYTLxvqRg3m+oY5JfBq9TrltmKt4zSuLJkZSwKJ7yg
 ==
X-ME-Sender: <xms:NCJbYNfHIHZFTVMcQNBBFfKAOvS3_6DG_VnsFs2kUGAhXM6yIKikiA>
 <xme:NCJbYLNcqrPxZpWMiV7MxZtT4fn20J55VE3-9g6fdtDpCbtvX8EPkw0ypIRhsKMdO
 pchSyh6MInKFLxXqIU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepffetueetvdeitedtteeuudfghfdvvdethedvffejhfffhefhjeelkeejkedv
 fffgnecuffhomhgrihhnpegsihhtshdrvhhiuggvohdpsghithhsrdgruhhtohenucfkph
 epledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NCJbYGiiNjVdYxK7WB-34R49q2biUvCWVl5tAxdcfCTvRZpbsjHL2Q>
 <xmx:NCJbYG8C8OqhO7daKn8mXztpXVo4whqQjsMdzMoSbFE_pv91B79Mlw>
 <xmx:NCJbYJuH-Gbil_d_sbHM9vwY0_xSbf6dEULK9QT65h9taZTddFNkOA>
 <xmx:NSJbYPKcVl5wppNFyhxNc6ml6VJu5vdivXPRnXM-aa8KKU-1FXQdig>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EDAD524041F;
 Wed, 24 Mar 2021 07:27:47 -0400 (EDT)
Date: Wed, 24 Mar 2021 12:27:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Message-ID: <20210324112745.n76qhrbhzyfunmkd@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-7-kevin3.tang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210222132822.7830-7-kevin3.tang@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, orsonzhai@gmail.com,
 sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0382322495=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0382322495==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w3cv22m73ksns7zl"
Content-Disposition: inline


--w3cv22m73ksns7zl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 09:28:22PM +0800, Kevin Tang wrote:
> Adds dsi host controller support for the Unisoc's display subsystem.
> Adds dsi phy support for the Unisoc's display subsystem.
> Only MIPI DSI Displays supported, DP/TV/HMDI will be support
> in the feature.
>=20
> v1:
>   - Remove dphy and dsi graph binding, merge the dphy driver into the dsi.
>=20
> v2:
>   - Use drm_xxx to replace all DRM_XXX.
>   - Use kzalloc to replace devm_kzalloc for sprd_dsi structure init.
>=20
> v4:
>   - Use drmm_helpers to allocate encoder.
>   - Move allocate encoder and connector to bind funtion.

You're missing your Signed-off-by

And there's a bunch of errors warnings and (important) checks reported
by checkpatch --strict that you should fix.

> ---
>  drivers/gpu/drm/sprd/Makefile          |    7 +-
>  drivers/gpu/drm/sprd/dw_dsi_ctrl.c     |  794 +++++++++++++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl.h     | 1475 ++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c |  157 +++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h |   26 +
>  drivers/gpu/drm/sprd/megacores_pll.c   |  317 +++++
>  drivers/gpu/drm/sprd/megacores_pll.h   |  146 +++
>  drivers/gpu/drm/sprd/sprd_drm.c        |    1 +
>  drivers/gpu/drm/sprd/sprd_drm.h        |    1 +
>  drivers/gpu/drm/sprd/sprd_dsi.c        | 1132 ++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_dsi.h        |  104 ++
>  11 files changed, 4158 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.c
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.h
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
>  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
>  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
>=20
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
> index 6c25bfa99..d49f4977b 100644
> --- a/drivers/gpu/drm/sprd/Makefile
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -1,5 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
>  obj-y :=3D sprd_drm.o \
> -	sprd_dpu.o
> -
> +	sprd_dpu.o \
> +	sprd_dsi.o \
> +	dw_dsi_ctrl.o \
> +	dw_dsi_ctrl_ppi.o \

So it's a designware IP? There's a driver for it already that seems
fairly similar:
drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c

> +	megacores_pll.o
> diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl.c b/drivers/gpu/drm/sprd/dw=
_dsi_ctrl.c
> new file mode 100644
> index 000000000..1034aba4a
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl.c
> @@ -0,0 +1,794 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +
> +#include "dw_dsi_ctrl.h"
> +
> +/*
> + * Modify power status of DSI Host core
> + */
> +void dsi_power_enable(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(enable, &reg->SOFT_RESET);
> +}
> +/*
> + * Enable/disable DPI video mode
> + */
> +void dsi_video_mode(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(0, &reg->DSI_MODE_CFG);
> +}
> +/*
> + * Enable command mode (Generic interface)
> + */
> +void dsi_cmd_mode(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(1, &reg->DSI_MODE_CFG);
> +}
> +
> +bool dsi_is_cmd_mode(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	return readl(&reg->DSI_MODE_CFG);
> +}
> +/*
> + * Configure the read back virtual channel for the generic interface
> + */
> +void dsi_rx_vcid(struct dsi_context *ctx, u8 vc)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x1C virtual_channel_id;
> +
> +	virtual_channel_id.val =3D readl(&reg->VIRTUAL_CHANNEL_ID);
> +	virtual_channel_id.bits.gen_rx_vcid =3D vc;
> +
> +	writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
> +}
> +/*
> + * Write the DPI video virtual channel destination
> + */
> +void dsi_video_vcid(struct dsi_context *ctx, u8 vc)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x1C virtual_channel_id;
> +
> +	virtual_channel_id.val =3D readl(&reg->VIRTUAL_CHANNEL_ID);
> +	virtual_channel_id.bits.video_pkt_vcid =3D vc;
> +
> +	writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
> +}
> +/*
> + * Set DPI video mode type (burst/non-burst - with sync pulses or events)
> + */
> +void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mode)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x38 vid_mode_cfg;
> +
> +	vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> +	vid_mode_cfg.bits.vid_mode_type =3D mode;
> +
> +	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> +}
> +/*
> + * Set DPI video color coding
> + */
> +void dsi_dpi_color_coding(struct dsi_context *ctx, int coding)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x20 dpi_video_format;
> +
> +	dpi_video_format.val =3D readl(&reg->DPI_VIDEO_FORMAT);
> +	dpi_video_format.bits.dpi_video_mode_format =3D coding;
> +
> +	writel(dpi_video_format.val, &reg->DPI_VIDEO_FORMAT);
> +}
> +/*
> + * Configure the Horizontal Line time
> + * param "byte_cycle" taken to transmit the total of the horizontal line
> + */
> +void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x2C video_line_time;
> +
> +	video_line_time.val =3D readl(&reg->VIDEO_LINE_TIME);
> +	video_line_time.bits.video_line_time =3D byte_cycle;
> +
> +	writel(video_line_time.val, &reg->VIDEO_LINE_TIME);
> +}
> +/*
> + * Configure the Horizontal back porch time
> + * param "byte_cycle" taken to transmit the horizontal back porch
> + */
> +void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x28 video_line_hblk_time;
> +
> +	video_line_hblk_time.val =3D readl(&reg->VIDEO_LINE_HBLK_TIME);
> +	video_line_hblk_time.bits.video_line_hbp_time =3D byte_cycle;
> +
> +	writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
> +}
> +/*
> + * Configure the Horizontal sync time,
> + * param "byte_cycle" taken to transmit the horizontal sync
> + */
> +void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x28 video_line_hblk_time;
> +
> +	video_line_hblk_time.val =3D readl(&reg->VIDEO_LINE_HBLK_TIME);
> +	video_line_hblk_time.bits.video_line_hsa_time =3D byte_cycle;
> +
> +	writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
> +}
> +/*
> + * Configure the vertical active lines of the video stream
> + */
> +void dsi_dpi_vact(struct dsi_context *ctx, u16 lines)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x34 video_active_lines;
> +
> +	video_active_lines.val =3D readl(&reg->VIDEO_VACTIVE_LINES);
> +	video_active_lines.bits.vactive_lines =3D lines;
> +
> +	writel(video_active_lines.val, &reg->VIDEO_VACTIVE_LINES);
> +}
> +
> +void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x30 video_vblk_lines;
> +
> +	video_vblk_lines.val =3D readl(&reg->VIDEO_VBLK_LINES);
> +	video_vblk_lines.bits.vfp_lines =3D lines;
> +
> +	writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
> +}
> +
> +void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x30 video_vblk_lines;
> +
> +	video_vblk_lines.val =3D readl(&reg->VIDEO_VBLK_LINES);
> +	video_vblk_lines.bits.vbp_lines =3D lines;
> +
> +	writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
> +}
> +
> +void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x30 video_vblk_lines;
> +
> +	video_vblk_lines.val =3D readl(&reg->VIDEO_VBLK_LINES);
> +	video_vblk_lines.bits.vsa_lines =3D lines;
> +
> +	writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
> +}
> +
> +void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x38 vid_mode_cfg;
> +
> +	vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> +
> +	vid_mode_cfg.bits.lp_hfp_en =3D enable;
> +	vid_mode_cfg.bits.lp_hbp_en =3D enable;
> +
> +	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> +}
> +/*
> + * Enable return to low power mode inside vertical active lines periods =
when
> + * timing allows
> + */
> +void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x38 vid_mode_cfg;
> +
> +	vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> +
> +	vid_mode_cfg.bits.lp_vact_en =3D enable;
> +	vid_mode_cfg.bits.lp_vfp_en =3D enable;
> +	vid_mode_cfg.bits.lp_vbp_en =3D enable;
> +	vid_mode_cfg.bits.lp_vsa_en =3D enable;
> +
> +	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> +}
> +/*
> + * Enable FRAME BTA ACK
> + */
> +void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x38 vid_mode_cfg;
> +
> +	vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> +	vid_mode_cfg.bits.frame_bta_ack_en =3D enable;
> +
> +	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> +}
> +/*
> + * Write no of chunks to core - taken into consideration only when multi=
 packet
> + * is enabled
> + */
> +void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 num)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x24 video_pkt_config;
> +
> +	video_pkt_config.val =3D readl(&reg->VIDEO_PKT_CONFIG);
> +	video_pkt_config.bits.video_line_chunk_num =3D num;
> +
> +	writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
> +}
> +/*
> + * Write the null packet size - will only be taken into account when null
> + * packets are enabled.
> + */
> +void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 size)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xC0 video_nullpkt_size;
> +
> +	video_nullpkt_size.val =3D readl(&reg->VIDEO_NULLPKT_SIZE);
> +	video_nullpkt_size.bits.video_nullpkt_size =3D size;
> +
> +	writel(video_nullpkt_size.val, &reg->VIDEO_NULLPKT_SIZE);
> +}
> +/*
> + * Write video packet size. obligatory for sending video
> + */
> +void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 size)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x24 video_pkt_config;
> +
> +	video_pkt_config.val =3D readl(&reg->VIDEO_PKT_CONFIG);
> +	video_pkt_config.bits.video_pkt_size =3D size;
> +
> +	writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
> +}
> +/*
> + * Specifiy the size of the packet memory write start/continue
> + */
> +void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xC4 dcs_wm_pkt_size;
> +
> +	dcs_wm_pkt_size.val =3D readl(&reg->DCS_WM_PKT_SIZE);
> +	dcs_wm_pkt_size.bits.dcs_wm_pkt_size =3D size;
> +
> +	writel(dcs_wm_pkt_size.val, &reg->DCS_WM_PKT_SIZE);
> +}
> +/*
> + * Enable tear effect acknowledge
> + */
> +void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x68 cmd_mode_cfg;
> +
> +	cmd_mode_cfg.val =3D readl(&reg->CMD_MODE_CFG);
> +	cmd_mode_cfg.bits.tear_fx_en =3D enable;
> +
> +	writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
> +}
> +/*
> + * Set DCS command packet transmission to transmission type
> + */
> +void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x68 cmd_mode_cfg;
> +
> +	cmd_mode_cfg.val =3D readl(&reg->CMD_MODE_CFG);
> +
> +	cmd_mode_cfg.bits.gen_sw_0p_tx =3D enable;
> +	cmd_mode_cfg.bits.gen_sw_1p_tx =3D enable;
> +	cmd_mode_cfg.bits.gen_sw_2p_tx =3D enable;
> +	cmd_mode_cfg.bits.gen_lw_tx =3D enable;
> +	cmd_mode_cfg.bits.dcs_sw_0p_tx =3D enable;
> +	cmd_mode_cfg.bits.dcs_sw_1p_tx =3D enable;
> +	cmd_mode_cfg.bits.dcs_lw_tx =3D enable;
> +	cmd_mode_cfg.bits.max_rd_pkt_size =3D enable;
> +
> +	cmd_mode_cfg.bits.gen_sr_0p_tx =3D enable;
> +	cmd_mode_cfg.bits.gen_sr_1p_tx =3D enable;
> +	cmd_mode_cfg.bits.gen_sr_2p_tx =3D enable;
> +	cmd_mode_cfg.bits.dcs_sr_0p_tx =3D enable;
> +
> +	writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
> +}
> +/*
> + * Set DCS read command packet transmission to transmission type
> + */
> +void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x38 vid_mode_cfg;
> +
> +	vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> +	vid_mode_cfg.bits.lp_cmd_en =3D enable;
> +
> +	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> +}
> +
> +/*
> + * Write command header in the generic interface (which also sends DCS c=
ommands) as a subset
> + */
> +void dsi_set_packet_header(struct dsi_context *ctx,
> +				   u8 vc,
> +				   u8 type,
> +				   u8 wc_lsb,
> +				   u8 wc_msb)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x6C gen_hdr;
> +
> +	gen_hdr.bits.gen_dt =3D type;
> +	gen_hdr.bits.gen_vc =3D vc;
> +	gen_hdr.bits.gen_wc_lsbyte =3D wc_lsb;
> +	gen_hdr.bits.gen_wc_msbyte =3D wc_msb;
> +
> +	writel(gen_hdr.val, &reg->GEN_HDR);
> +}
> +/*
> + * Write the payload of the long packet commands
> + */
> +void dsi_set_packet_payload(struct dsi_context *ctx, u32 payload)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(payload, &reg->GEN_PLD_DATA);
> +}
> +/*
> + * Read the payload of the long packet commands
> + */
> +u32 dsi_get_rx_payload(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	return readl(&reg->GEN_PLD_DATA);
> +}
> +
> +/*
> + * Enable Bus Turn-around request
> + */
> +void dsi_bta_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(enable, &reg->TA_EN);
> +}
> +/*
> + * Enable EOTp reception
> + */
> +void dsi_eotp_rx_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xBC eotp_en;
> +
> +	eotp_en.val =3D readl(&reg->EOTP_EN);
> +	eotp_en.bits.rx_eotp_en =3D enable;
> +
> +	writel(eotp_en.val, &reg->EOTP_EN);
> +}
> +/*
> + * Enable EOTp transmission
> + */
> +void dsi_eotp_tx_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xBC eotp_en;
> +
> +	eotp_en.val =3D readl(&reg->EOTP_EN);
> +	eotp_en.bits.tx_eotp_en =3D enable;
> +
> +	writel(eotp_en.val, &reg->EOTP_EN);
> +}
> +/*
> + * Enable ECC reception, error correction and reporting
> + */
> +void dsi_ecc_rx_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xB4 rx_pkt_check_config;
> +
> +	rx_pkt_check_config.val =3D readl(&reg->RX_PKT_CHECK_CONFIG);
> +	rx_pkt_check_config.bits.rx_pkt_ecc_en =3D enable;
> +
> +	writel(rx_pkt_check_config.val, &reg->RX_PKT_CHECK_CONFIG);
> +}
> +/*
> + * Enable CRC reception, error reporting
> + */
> +void dsi_crc_rx_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xB4 rx_pkt_check_config;
> +
> +	rx_pkt_check_config.val =3D readl(&reg->RX_PKT_CHECK_CONFIG);
> +	rx_pkt_check_config.bits.rx_pkt_crc_en =3D enable;
> +
> +	writel(rx_pkt_check_config.val, &reg->RX_PKT_CHECK_CONFIG);
> +}
> +/*
> + * Get status of read command
> + */
> +bool dsi_is_bta_returned(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x98 cmd_mode_status;
> +
> +	cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> +
> +	return cmd_mode_status.bits.gen_cmd_rdcmd_done;
> +}
> +/*
> + * Get the FULL status of generic read payload fifo
> + */
> +bool dsi_is_rx_payload_fifo_full(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x98 cmd_mode_status;
> +
> +	cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> +
> +	return cmd_mode_status.bits.gen_cmd_rdata_fifo_full;
> +}
> +/*
> + * Get the EMPTY status of generic read payload fifo
> + */
> +bool dsi_is_rx_payload_fifo_empty(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x98 cmd_mode_status;
> +
> +	cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> +
> +	return cmd_mode_status.bits.gen_cmd_rdata_fifo_empty;
> +}
> +/*
> + * Get the FULL status of generic write payload fifo
> + */
> +bool dsi_is_tx_payload_fifo_full(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x98 cmd_mode_status;
> +
> +	cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> +
> +	return cmd_mode_status.bits.gen_cmd_wdata_fifo_full;
> +}
> +/*
> + * Get the EMPTY status of generic write payload fifo
> + */
> +bool dsi_is_tx_payload_fifo_empty(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x98 cmd_mode_status;
> +
> +	cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> +
> +	return cmd_mode_status.bits.gen_cmd_wdata_fifo_empty;
> +}
> +/*
> + * Get the EMPTY status of generic command fifo
> + */
> +bool dsi_is_tx_cmd_fifo_empty(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x98 cmd_mode_status;
> +
> +	cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> +
> +	return cmd_mode_status.bits.gen_cmd_cmd_fifo_empty;
> +}
> +/*
> + * DPI interface signal delay config
> + * param byte_cycle period for waiting after controller receiving HSYNC =
=66rom
> + * DPI interface to start read pixel data from memory.
> + */
> +void dsi_dpi_sig_delay(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xD0 video_sig_delay_config;
> +
> +	video_sig_delay_config.val =3D readl(&reg->VIDEO_SIG_DELAY_CONFIG);
> +	video_sig_delay_config.bits.video_sig_delay =3D byte_cycle;
> +
> +	writel(video_sig_delay_config.val, &reg->VIDEO_SIG_DELAY_CONFIG);
> +}
> +/*
> + * Configure how many cycles of byte clock would the PHY module take
> + * to switch data lane from high speed to low power
> + */
> +void dsi_datalane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xAC phy_datalane_time_config;
> +
> +	phy_datalane_time_config.val =3D readl(&reg->PHY_DATALANE_TIME_CONFIG);
> +	phy_datalane_time_config.bits.phy_datalane_hs_to_lp_time =3D byte_cycle;
> +
> +	writel(phy_datalane_time_config.val, &reg->PHY_DATALANE_TIME_CONFIG);
> +}
> +/*
> + * Configure how many cycles of byte clock would the PHY module take
> + * to switch the data lane from to low power high speed
> + */
> +void dsi_datalane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xAC phy_datalane_time_config;
> +
> +	phy_datalane_time_config.val =3D readl(&reg->PHY_DATALANE_TIME_CONFIG);
> +	phy_datalane_time_config.bits.phy_datalane_lp_to_hs_time =3D byte_cycle;
> +
> +	writel(phy_datalane_time_config.val, &reg->PHY_DATALANE_TIME_CONFIG);
> +}
> +/*
> + * Configure how many cycles of byte clock would the PHY module take
> + * to switch clock lane from high speed to low power
> + */
> +void dsi_clklane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xA8 phy_clklane_time_config;
> +
> +	phy_clklane_time_config.val =3D readl(&reg->PHY_CLKLANE_TIME_CONFIG);
> +	phy_clklane_time_config.bits.phy_clklane_hs_to_lp_time =3D byte_cycle;
> +
> +	writel(phy_clklane_time_config.val, &reg->PHY_CLKLANE_TIME_CONFIG);
> +}
> +/*
> + * Configure how many cycles of byte clock would the PHY module take
> + * to switch clock lane from to low power high speed
> + */
> +void dsi_clklane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xA8 phy_clklane_time_config;
> +
> +	phy_clklane_time_config.val =3D readl(&reg->PHY_CLKLANE_TIME_CONFIG);
> +	phy_clklane_time_config.bits.phy_clklane_lp_to_hs_time =3D byte_cycle;
> +
> +	writel(phy_clklane_time_config.val, &reg->PHY_CLKLANE_TIME_CONFIG);
> +}
> +/*
> + * Configure how many cycles of byte clock would the PHY module take
> + * to turn the bus around to start receiving
> + */
> +void dsi_max_read_time(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(byte_cycle, &reg->MAX_READ_TIME);
> +}
> +/*
> + * Enable the automatic mechanism to stop providing clock in the clock
> + * lane when time allows
> + */
> +void dsi_nc_clk_en(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x74 phy_clk_lane_lp_ctrl;
> +
> +	phy_clk_lane_lp_ctrl.val =3D readl(&reg->PHY_CLK_LANE_LP_CTRL);
> +	phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en =3D enable;
> +
> +	writel(phy_clk_lane_lp_ctrl.val, &reg->PHY_CLK_LANE_LP_CTRL);
> +}
> +/*
> + * Write transmission escape timeout
> + * a safe guard so that the state machine would reset if transmission
> + * takes too long
> + */
> +void dsi_tx_escape_division(struct dsi_context *ctx, u8 div)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(div, &reg->TX_ESC_CLK_CONFIG);
> +}
> +/*=20
> + * Configure timeout divisions (so they would have more clock ticks)
> + * div no of hs cycles before transiting back to LP in
> + *  (lane_clk / div)
> + */
> +void dsi_timeout_clock_division(struct dsi_context *ctx, u8 div)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(div, &reg->TIMEOUT_CNT_CLK_CONFIG);
> +}
> +/*
> + * Configure the Low power receive time out
> + */
> +void dsi_lp_rx_timeout(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(byte_cycle, &reg->LRX_H_TO_CONFIG);
> +}
> +/*
> + * Configure a high speed transmission time out
> + */
> +void dsi_hs_tx_timeout(struct dsi_context *ctx, u16 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(byte_cycle, &reg->HTX_TO_CONFIG);
> +}
> +/*
> + * Get the error 0 interrupt register status
> + */
> +u32 dsi_int0_status(struct dsi_context *ctx)
> +{
> +	struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x08 protocol_int_sts;
> +
> +	protocol_int_sts.val =3D readl(&reg->PROTOCOL_INT_STS);
> +	writel(protocol_int_sts.val, &reg->PROTOCOL_INT_CLR);
> +
> +	if (protocol_int_sts.bits.dphy_errors_0)
> +		drm_err(dsi->drm, "dphy_err: escape entry error\n");
> +
> +	if (protocol_int_sts.bits.dphy_errors_1)
> +		drm_err(dsi->drm, "dphy_err: lp data transmission sync error\n");
> +
> +	if (protocol_int_sts.bits.dphy_errors_2)
> +		drm_err(dsi->drm, "dphy_err: control error\n");
> +
> +	if (protocol_int_sts.bits.dphy_errors_3)
> +		drm_err(dsi->drm, "dphy_err: LP0 contention error\n");
> +
> +	if (protocol_int_sts.bits.dphy_errors_4)
> +		drm_err(dsi->drm, "dphy_err: LP1 contention error\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_0)
> +		drm_err(dsi->drm, "ack_err: SoT error\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_1)
> +		drm_err(dsi->drm, "ack_err: SoT Sync error\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_2)
> +		drm_err(dsi->drm, "ack_err: EoT Sync error\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_3)
> +		drm_err(dsi->drm, "ack_err: Escape Mode Entry Command error\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_4)
> +		drm_err(dsi->drm, "ack_err: LP Transmit Sync error\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_5)
> +		drm_err(dsi->drm, "ack_err: Peripheral Timeout error\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_6)
> +		drm_err(dsi->drm, "ack_err: False Control error\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_7)
> +		drm_err(dsi->drm, "ack_err: reserved (specific to device)\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_8)
> +		drm_err(dsi->drm, "ack_err: ECC error, single-bit (corrected)\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_9)
> +		drm_err(dsi->drm, "ack_err: ECC error, multi-bit (not corrected)\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_10)
> +		drm_err(dsi->drm, "ack_err: checksum error (long packet only)\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_11)
> +		drm_err(dsi->drm, "ack_err: not recognized DSI data type\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_12)
> +		drm_err(dsi->drm, "ack_err: DSI VC ID Invalid\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_13)
> +		drm_err(dsi->drm, "ack_err: invalid transmission length\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_14)
> +		drm_err(dsi->drm, "ack_err: reserved (specific to device)\n");
> +
> +	if (protocol_int_sts.bits.ack_with_err_15)
> +		drm_err(dsi->drm, "ack_err: DSI protocol violation\n");
> +
> +	return 0;
> +}
> +/*
> + * Get the error 1 interrupt register status
> + */
> +u32 dsi_int1_status(struct dsi_context *ctx)
> +{
> +	struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x10 internal_int_sts;
> +	u32 status =3D 0;
> +
> +	internal_int_sts.val =3D readl(&reg->INTERNAL_INT_STS);
> +	writel(internal_int_sts.val, &reg->INTERNAL_INT_CLR);
> +
> +	if (internal_int_sts.bits.receive_pkt_size_err)
> +		drm_err(dsi->drm, "receive packet size error\n");
> +
> +	if (internal_int_sts.bits.eotp_not_receive_err)
> +		drm_err(dsi->drm, "EoTp packet is not received\n");
> +
> +	if (internal_int_sts.bits.gen_cmd_cmd_fifo_wr_err)
> +		drm_err(dsi->drm, "cmd header-fifo is full\n");
> +
> +	if (internal_int_sts.bits.gen_cmd_rdata_fifo_rd_err)
> +		drm_err(dsi->drm, "cmd read-payload-fifo is empty\n");
> +
> +	if (internal_int_sts.bits.gen_cmd_rdata_fifo_wr_err)
> +		drm_err(dsi->drm, "cmd read-payload-fifo is full\n");
> +
> +	if (internal_int_sts.bits.gen_cmd_wdata_fifo_wr_err)
> +		drm_err(dsi->drm, "cmd write-payload-fifo is full\n");
> +
> +	if (internal_int_sts.bits.gen_cmd_wdata_fifo_rd_err)
> +		drm_err(dsi->drm, "cmd write-payload-fifo is empty\n");
> +
> +	if (internal_int_sts.bits.dpi_pix_fifo_wr_err) {
> +		drm_err(dsi->drm, "DPI pixel-fifo is full\n");
> +		status |=3D DSI_INT_STS_NEED_SOFT_RESET;
> +	}
> +
> +	if (internal_int_sts.bits.ecc_single_err)
> +		drm_err(dsi->drm, "ECC single error in a received packet\n");
> +
> +	if (internal_int_sts.bits.ecc_multi_err)
> +		drm_err(dsi->drm, "ECC multiple error in a received packet\n");
> +
> +	if (internal_int_sts.bits.crc_err)
> +		drm_err(dsi->drm, "CRC error in the received packet payload\n");
> +
> +	if (internal_int_sts.bits.hs_tx_timeout)
> +		drm_err(dsi->drm, "high-speed transmission timeout\n");
> +
> +	if (internal_int_sts.bits.lp_rx_timeout)
> +		drm_err(dsi->drm, "low-power reception timeout\n");
> +
> +	return status;
> +}
> +/*
> + * Configure MASK (hiding) of interrupts coming from error 0 source
> + */
> +void dsi_int0_mask(struct dsi_context *ctx, u32 mask)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(mask, &reg->MASK_PROTOCOL_INT);
> +}
> +/*
> + * Configure MASK (hiding) of interrupts coming from error 1 source
> + */
> +void dsi_int1_mask(struct dsi_context *ctx, u32 mask)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(mask, &reg->MASK_INTERNAL_INT);
> +}
> diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl.h b/drivers/gpu/drm/sprd/dw=
_dsi_ctrl.h
> new file mode 100644
> index 000000000..ffba62130
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl.h
> @@ -0,0 +1,1475 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#ifndef _DW_DSI_CTRL_H_
> +#define _DW_DSI_CTRL_H_
> +
> +#include <asm/types.h>
> +
> +#include "sprd_dsi.h"
> +
> +struct dsi_reg {
> +	union _0x00 {
> +		u32 val;
> +		struct _DSI_VERSION {
> +		u32 dsi_version: 16;
> +		u32 reserved: 16;
> +		} bits;
> +	} DSI_VERSION;
> +
> +	union _0x04 {
> +		u32 val;
> +		struct _SOFT_RESET {
> +		/*
> +		 * This bit configures the core either to work normal or to
> +		 * reset. It's default value is 0. After the core configur-
> +		 * ation, to enable the mipi_dsi_host, set this register to 1.
> +		 * 1: power up     0: reset core
> +		 */
> +		u32 dsi_soft_reset: 1;
> +
> +		u32 reserved: 31;
> +		} bits;
> +	} SOFT_RESET;
> +
> +	union _0x08 {
> +		u32 val;
> +		struct _PROTOCOL_INT_STS {
> +		/* ErrEsc escape entry error from Lane 0 */
> +		u32 dphy_errors_0: 1;
> +
> +		/* ErrSyncEsc low-power data transmission synchronization
> +		 * error from Lane 0
> +		 */
> +		u32 dphy_errors_1: 1;
> +
> +		/* ErrControl error from Lane 0 */
> +		u32 dphy_errors_2: 1;
> +
> +		/* ErrContentionLP0 LP0 contention error from Lane 0 */
> +		u32 dphy_errors_3: 1;
> +
> +		/* ErrContentionLP1 LP1 contention error from Lane 0 */
> +		u32 dphy_errors_4: 1;
> +
> +		/* debug mode protocol errors */
> +		u32 protocol_debug_err: 11;
> +
> +		/* SoT error from the Acknowledge error report */
> +		u32 ack_with_err_0: 1;
> +
> +		/* SoT Sync error from the Acknowledge error report */
> +		u32 ack_with_err_1: 1;
> +
> +		/* EoT Sync error from the Acknowledge error report */
> +		u32 ack_with_err_2: 1;
> +
> +		/* Escape Mode Entry Command error from the Acknowledge
> +		 * error report
> +		 */
> +		u32 ack_with_err_3: 1;
> +
> +		/* LP Transmit Sync error from the Acknowledge error report */
> +		u32 ack_with_err_4: 1;
> +
> +		/* Peripheral Timeout error from the Acknowledge error report */
> +		u32 ack_with_err_5: 1;
> +
> +		/* False Control error from the Acknowledge error report */
> +		u32 ack_with_err_6: 1;
> +
> +		/* reserved (specific to device) from the Acknowledge error
> +		 * report
> +		 */
> +		u32 ack_with_err_7: 1;
> +
> +		/* ECC error, single-bit (detected and corrected) from the
> +		 * Acknowledge error report
> +		 */
> +		u32 ack_with_err_8: 1;
> +
> +		/* ECC error, multi-bit (detected, not corrected) from the
> +		 * Acknowledge error report
> +		 */
> +		u32 ack_with_err_9: 1;
> +
> +		/* checksum error (long packet only) from the Acknowledge
> +		 * error report
> +		 */
> +		u32 ack_with_err_10: 1;
> +
> +		/* not recognized DSI data type from the Acknowledge error
> +		 * report
> +		 */
> +		u32 ack_with_err_11: 1;
> +
> +		/* DSI VC ID Invalid from the Acknowledge error report */
> +		u32 ack_with_err_12: 1;
> +
> +		/* invalid transmission length from the Acknowledge error
> +		 * report
> +		 */
> +		u32 ack_with_err_13: 1;
> +
> +		/* reserved (specific to device) from the Acknowledge error
> +		 * report
> +		 */
> +		u32 ack_with_err_14: 1;
> +
> +		/* DSI protocol violation from the Acknowledge error report */
> +		u32 ack_with_err_15: 1;
> +
> +		} bits;
> +	} PROTOCOL_INT_STS;
> +
> +	union _0x0C {
> +		u32 val;
> +		struct _MASK_PROTOCOL_INT {
> +		u32 mask_dphy_errors_0: 1;
> +		u32 mask_dphy_errors_1: 1;
> +		u32 mask_dphy_errors_2: 1;
> +		u32 mask_dphy_errors_3: 1;
> +		u32 mask_dphy_errors_4: 1;
> +		u32 mask_protocol_debug_err: 11;
> +		u32 mask_ack_with_err_0: 1;
> +		u32 mask_ack_with_err_1: 1;
> +		u32 mask_ack_with_err_2: 1;
> +		u32 mask_ack_with_err_3: 1;
> +		u32 mask_ack_with_err_4: 1;
> +		u32 mask_ack_with_err_5: 1;
> +		u32 mask_ack_with_err_6: 1;
> +		u32 mask_ack_with_err_7: 1;
> +		u32 mask_ack_with_err_8: 1;
> +		u32 mask_ack_with_err_9: 1;
> +		u32 mask_ack_with_err_10: 1;
> +		u32 mask_ack_with_err_11: 1;
> +		u32 mask_ack_with_err_12: 1;
> +		u32 mask_ack_with_err_13: 1;
> +		u32 mask_ack_with_err_14: 1;
> +		u32 mask_ack_with_err_15: 1;
> +		} bits;
> +	} MASK_PROTOCOL_INT;
> +
> +	union _0x10 {
> +		u32 val;
> +		struct _INTERNAL_INT_STS {
> +		/* This bit indicates that the packet size error is detected
> +		 * during the packet reception.
> +		 */
> +		u32 receive_pkt_size_err: 1;
> +
> +		/* This bit indicates that the EoTp packet is not received at
> +		 * the end of the incoming peripheral transmission
> +		 */
> +		u32 eotp_not_receive_err: 1;
> +
> +		/* This bit indicates that the system tried to write a command
> +		 * through the Generic interface and the FIFO is full. There-
> +		 * fore, the command is not written.
> +		 */
> +		u32 gen_cmd_cmd_fifo_wr_err: 1;
> +
> +		/* This bit indicates that during a DCS read data, the payload
> +		 * FIFO becomes	empty and the data sent to the interface is
> +		 * corrupted.
> +		 */
> +		u32 gen_cmd_rdata_fifo_rd_err: 1;
> +
> +		/* This bit indicates that during a generic interface packet
> +		 * read back, the payload FIFO becomes full and the received
> +		 * data is corrupted.
> +		 */
> +		u32 gen_cmd_rdata_fifo_wr_err: 1;
> +
> +		/* This bit indicates that the system tried to write a payload
> +		 * data through the Generic interface and the FIFO is full.
> +		 * Therefore, the payload is not written.
> +		 */
> +		u32 gen_cmd_wdata_fifo_wr_err: 1;
> +
> +		/* This bit indicates that during a Generic interface packet
> +		 * build, the payload FIFO becomes empty and corrupt data is
> +		 * sent.
> +		 */
> +		u32 gen_cmd_wdata_fifo_rd_err: 1;
> +
> +		/* This bit indicates that during a DPI pixel line storage,
> +		 * the payload FIFO becomes full and the data stored is
> +		 * corrupted.
> +		 */
> +		u32 dpi_pix_fifo_wr_err: 1;
> +
> +		/* internal debug error	*/
> +		u32 internal_debug_err: 19;
> +
> +		/* This bit indicates that the ECC single error is detected
> +		 * and corrected in a received packet.
> +		 */
> +		u32 ecc_single_err: 1;
> +
> +		/* This bit indicates that the ECC multiple error is detected
> +		 * in a received packet.
> +		 */
> +		u32 ecc_multi_err: 1;
> +
> +		/* This bit indicates that the CRC error is detected in the
> +		 * received packet payload.
> +		 */
> +		u32 crc_err: 1;
> +
> +		/* This bit indicates that the high-speed transmission timeout
> +		 * counter reached the end and contention is detected.
> +		 */
> +		u32 hs_tx_timeout: 1;
> +
> +		/* This bit indicates that the low-power reception timeout
> +		 * counter reached the end and contention is detected.
> +		 */
> +		u32 lp_rx_timeout: 1;
> +
> +		} bits;
> +	} INTERNAL_INT_STS;
> +
> +	union _0x14 {
> +		u32 val;
> +		struct _MASK_INTERNAL_INT {
> +		u32 mask_receive_pkt_size_err: 1;
> +		u32 mask_eopt_not_receive_err: 1;
> +		u32 mask_gen_cmd_cmd_fifo_wr_err: 1;
> +		u32 mask_gen_cmd_rdata_fifo_rd_err: 1;
> +		u32 mask_gen_cmd_rdata_fifo_wr_err: 1;
> +		u32 mask_gen_cmd_wdata_fifo_wr_err: 1;
> +		u32 mask_gen_cmd_wdata_fifo_rd_err: 1;
> +		u32 mask_dpi_pix_fifo_wr_err: 1;
> +		u32 mask_internal_debug_err: 19;
> +		u32 mask_ecc_single_err: 1;
> +		u32 mask_ecc_multi_err: 1;
> +		u32 mask_crc_err: 1;
> +		u32 mask_hs_tx_timeout: 1;
> +		u32 mask_lp_rx_timeout: 1;
> +		} bits;
> +	} MASK_INTERNAL_INT;
> +
> +	union _0x18 {
> +		u32 val;
> +		struct _DSI_MODE_CFG {
> +		/* This bit configures the operation mode
> +		 * 0: Video mode ;   1: Command mode
> +		 */
> +		u32 cmd_video_mode: 1;
> +
> +		u32 reserved: 31;
> +
> +		} bits;
> +	} DSI_MODE_CFG;
> +
> +	union _0x1C {
> +		u32 val;
> +		struct _VIRTUAL_CHANNEL_ID {
> +		/* This field indicates the Generic interface read-back
> +		 * virtual channel identification
> +		 */
> +		u32 gen_rx_vcid: 2;
> +
> +		/* This field configures the DPI virtual channel id that
> +		 * is indexed to the VIDEO mode packets
> +		 */
> +		u32 video_pkt_vcid: 2;
> +
> +		u32 reserved: 28;
> +
> +		} bits;
> +	} VIRTUAL_CHANNEL_ID;
> +
> +	union _0x20 {
> +		u32 val;
> +		struct _DPI_VIDEO_FORMAT {
> +		/*
> +		 * This field configures the DPI color coding as follows:
> +		 * 0000: 16-bit configuration 1
> +		 * 0001: 16-bit configuration 2
> +		 * 0010: 16-bit configuration 3
> +		 * 0011: 18-bit configuration 1
> +		 * 0100: 18-bit configuration 2
> +		 * 0101: 24-bit
> +		 * 0110: 20-bit YCbCr 4:2:2 loosely packed
> +		 * 0111: 24-bit YCbCr 4:2:2
> +		 * 1000: 16-bit YCbCr 4:2:2
> +		 * 1001: 30-bit
> +		 * 1010: 36-bit
> +		 * 1011: 12-bit YCbCr 4:2:0
> +		 * 1100: Compression Display Stream
> +		 * 1101-1111: 12-bit YCbCr 4:2:0
> +		 */
> +		u32 dpi_video_mode_format: 6;
> +
> +		/* When set to 1, this bit activates loosely packed
> +		 * variant to 18-bit configurations
> +		 */
> +		u32 loosely18_en: 1;
> +
> +		u32 reserved: 25;
> +
> +		} bits;
> +	} DPI_VIDEO_FORMAT;
> +
> +	union _0x24 {
> +		u32 val;
> +		struct _VIDEO_PKT_CONFIG {
> +		/*
> +		 * This field configures the number of pixels in a single
> +		 * video packet. For 18-bit not loosely packed data types,
> +		 * this number must be a multiple of 4. For YCbCr data
> +		 * types, it must be a multiple of 2, as described in the
> +		 * DSI specification.
> +		 */
> +		u32 video_pkt_size: 16;
> +
> +		/*
> +		 * This register configures the number of chunks to be
> +		 * transmitted during a Line period (a chunk consists of
> +		 * a video packet and a null packet). If set to 0 or 1,
> +		 * the video line is transmitted in a single packet. If
> +		 * set to 1, the packet is part of a chunk, so a null packet
> +		 * follows it if vid_null_size > 0. Otherwise, multiple chunks
> +		 * are used to transmit each video line.
> +		 */
> +		u32 video_line_chunk_num: 16;
> +
> +		} bits;
> +	} VIDEO_PKT_CONFIG;
> +
> +	union _0x28 {
> +		u32 val;
> +		struct _VIDEO_LINE_HBLK_TIME {
> +		/* This field configures the Horizontal Back Porch period
> +		 * in lane byte clock cycles
> +		 */
> +		u32 video_line_hbp_time: 16;
> +
> +		/* This field configures the Horizontal Synchronism Active
> +		 * period in lane byte clock cycles
> +		 */
> +		u32 video_line_hsa_time: 16;
> +
> +		} bits;
> +	} VIDEO_LINE_HBLK_TIME;
> +
> +	union _0x2C {
> +		u32 val;
> +		struct _VIDEO_LINE_TIME {
> +		/* This field configures the size of the total line time
> +		 * (HSA+HBP+HACT+HFP) counted in lane byte clock cycles
> +		 */
> +		u32 video_line_time: 16;
> +
> +		u32 reserved: 16;
> +
> +		} bits;
> +	} VIDEO_LINE_TIME;
> +
> +	union _0x30 {
> +		u32 val;
> +		struct _VIDEO_VBLK_LINES {
> +		/* This field configures the Vertical Front Porch period
> +		 * measured in number of horizontal lines
> +		 */
> +		u32 vfp_lines: 10;
> +
> +		/* This field configures the Vertical Back Porch period
> +		 * measured in number of horizontal lines
> +		 */
> +		u32 vbp_lines: 10;
> +
> +		/* This field configures the Vertical Synchronism Active
> +		 * period measured in number of horizontal lines
> +		 */
> +		u32 vsa_lines: 10;
> +
> +		u32 reserved: 2;
> +
> +		} bits;
> +	} VIDEO_VBLK_LINES;
> +
> +	union _0x34 {
> +		u32 val;
> +		struct _VIDEO_VACTIVE_LINES {
> +		/* This field configures the Vertical Active period measured
> +		 * in number of horizontal lines
> +		 */
> +		u32 vactive_lines: 14;
> +
> +		u32 reserved: 18;
> +
> +		} bits;
> +	} VIDEO_VACTIVE_LINES;
> +
> +	union _0x38 {
> +		u32 val;
> +		struct _VID_MODE_CFG {
> +		/*
> +		 * This field indicates the video mode transmission type as
> +		 * follows:
> +		 * 00: Non-burst with sync pulses
> +		 * 01: Non-burst with sync events
> +		 * 10 and 11: Burst mode
> +		 */
> +		u32 vid_mode_type: 2;
> +
> +		u32 reserved_0: 6;
> +
> +		/* When set to 1, this bit enables the return to low-power
> +		 * inside the VSA period when timing allows.
> +		 */
> +		u32 lp_vsa_en: 1;
> +
> +		/* When set to 1, this bit enables the return to low-power
> +		 * inside the VBP period when timing allows.
> +		 */
> +		u32 lp_vbp_en: 1;
> +
> +		/* When set to 1, this bit enables the return to low-power
> +		 * inside the VFP period when timing allows.
> +		 */
> +		u32 lp_vfp_en: 1;
> +
> +		/* When set to 1, this bit enables the return to low-power
> +		 * inside the VACT period when timing allows.
> +		 */
> +		u32 lp_vact_en: 1;
> +
> +		/* When set to 1, this bit enables the return to low-power
> +		 * inside the HBP period when timing allows.
> +		 */
> +		u32 lp_hbp_en: 1;
> +
> +		/* When set to 1, this bit enables the return to low-power
> +		 * inside the HFP period when timing allows.
> +		 */
> +		u32 lp_hfp_en: 1;
> +
> +		/* When set to 1, this bit enables the request for an ack-
> +		 * nowledge response at the end of a frame.
> +		 */
> +		u32 frame_bta_ack_en: 1;
> +
> +		/* When set to 1, this bit enables the command transmission
> +		 * only in low-power mode.
> +		 */
> +		u32 lp_cmd_en: 1;
> +
> +		u32 reserved_1: 16;
> +
> +		} bits;
> +	} VID_MODE_CFG;
> +
> +	union _0x3C {
> +		u32 val;
> +		struct _SDF_MODE_CONFIG {
> +		/*
> +		 * This field defines the 3D mode on/off & display orientation:
> +		 * 00: 3D mode off (2D mode on)
> +		 * 01: 3D mode on, portrait orientation
> +		 * 10: 3D mode on, landscape orientation
> +		 * 11: Reserved
> +		 */
> +		u32 rf_3d_mode: 2;
> +
> +		/*
> +		 * This field defines the 3D image format:
> +		 * 00: Line (alternating lines of left and right data)
> +		 * 01: Frame (alternating frames of left and right data)
> +		 * 10: Pixel (alternating pixels of left and right data)
> +		 * 11: Reserved
> +		 */
> +		u32 rf_3d_format: 2;
> +
> +		/*
> +		 * This field defines whether there is a second VSYNC pulse
> +		 * between Left and Right Images, when 3D Image Format is
> +		 * Frame-based:
> +		 * 0: No sync pulses between left and right data
> +		 * 1: Sync pulse (HSYNC, VSYNC, blanking) between left and
> +		 *    right data
> +		 */
> +		u32 second_vsync_en: 1;
> +
> +		/*
> +		 * This bit defines the left or right order:
> +		 * 0: Left eye data is sent first, and then the right eye data
> +		 *    is sent.
> +		 * 1: Right eye data is sent first, and then the left eye data
> +		 *    is sent.
> +		 */
> +		u32 left_right_order: 1;
> +
> +		u32 reserved_0: 2;
> +
> +		/*
> +		 * When set, causes the next VSS packet to include 3D control
> +		 * payload in every VSS packet.
> +		 */
> +		u32 rf_3d_payload_en: 1;
> +
> +		u32 reserved_1: 23;
> +
> +		} bits;
> +	} SDF_MODE_CONFIG;
> +
> +	union _0x40 {
> +		u32 val;
> +		struct _TIMEOUT_CNT_CLK_CONFIG {
> +		/*
> +		 * This field indicates the division factor for the Time Out
> +		 * clock used as the timing unit in the configuration of HS to
> +		 * LP and LP to HS transition error.
> +		 */
> +		u32 timeout_cnt_clk_config: 16;
> +
> +		u32 reserved: 16;
> +
> +		} bits;
> +	} TIMEOUT_CNT_CLK_CONFIG;
> +
> +	union _0x44 {
> +		u32 val;
> +		struct _HTX_TO_CONFIG {
> +		/*
> +		 * This field configures the timeout counter that triggers
> +		 * a high speed transmission timeout contention detection
> +		 * (measured in TO_CLK_DIVISION cycles).
> +		 *
> +		 * If using the non-burst mode and there is no sufficient
> +		 * time to switch from HS to LP and back in the period which
> +		 * is from one line data finishing to the next line sync
> +		 * start, the DSI link returns the LP state once per frame,
> +		 * then you should configure the TO_CLK_DIVISION and
> +		 * hstx_to_cnt to be in accordance with:
> +		 * hstx_to_cnt * lanebyteclkperiod * TO_CLK_DIVISION >=3D the
> +		 * time of one FRAME data transmission * (1 + 10%)
> +		 *
> +		 * In burst mode, RGB pixel packets are time-compressed,
> +		 * leaving more time during a scan line. Therefore, if in
> +		 * burst mode and there is sufficient time to switch from HS
> +		 * to LP and back in the period of time from one line data
> +		 * finishing to the next line sync start, the DSI link can
> +		 * return LP mode and back in this time interval to save power.
> +		 * For this, configure the TO_CLK_DIVISION and hstx_to_cnt
> +		 * to be in accordance with:
> +		 * hstx_to_cnt * lanebyteclkperiod * TO_CLK_DIVISION >=3D the
> +		 * time of one LINE data transmission * (1 + 10%)
> +		 */
> +		u32 htx_to_cnt_limit: 32;
> +		} bits;
> +	} HTX_TO_CONFIG;
> +
> +	union _0x48 {
> +		u32 val;
> +		struct _LRX_H_TO_CONFIG {
> +		/*
> +		 * This field configures the timeout counter that triggers
> +		 * a low-power reception timeout contention detection (measured
> +		 * in TO_CLK_DIVISION cycles).
> +		 */
> +		u32 lrx_h_to_cnt_limit: 32;
> +		} bits;
> +	} LRX_H_TO_CONFIG;
> +
> +	union _0x4C {
> +		u32 val;
> +		struct _RD_PRESP_TO_CONFIG {
> +		/*
> +		 * This field sets a period for which the DWC_mipi_dsi_host
> +		 * keeps the link still, after sending a low-power read oper-
> +		 * ation. This period is measured in cycles of lanebyteclk.
> +		 * The counting starts when the D-PHY enters the Stop state
> +		 * and causes no interrupts.
> +		 */
> +		u32 lprd_presp_to_cnt_limit: 16;
> +
> +		/*
> +		 * This field sets a period for which the DWC_mipi_dsi_host
> +		 * keeps the link still, after sending a high-speed read oper-
> +		 * ation. This period is measured in cycles of lanebyteclk.
> +		 * The counting starts when the D-PHY enters the Stop state
> +		 * and causes no interrupts.
> +		 */
> +		u32 hsrd_presp_to_cnt_limit: 16;
> +
> +		} bits;
> +	} RD_PRESP_TO_CONFIG;
> +
> +	union _0x50 {
> +		u32 val;
> +		struct _HSWR_PRESP_TO_CONFIG {
> +		/*
> +		 * This field sets a period for which the DWC_mipi_dsi_host
> +		 * keeps the link inactive after sending a high-speed write
> +		 * operation. This period is measured in cycles of lanebyteclk.
> +		 * The counting starts when the D-PHY enters the Stop state
> +		 * and causes no interrupts.
> +		 */
> +		u32 hswr_presp_to_cnt_limit: 16;
> +
> +		u32 reserved_0: 8;
> +
> +		/*
> +		 * When set to 1, this bit ensures that the peripheral response
> +		 * timeout caused by hs_wr_to_cnt is used only once per eDPI
> +		 * frame, when both the following conditions are met:
> +		 * dpivsync_edpiwms has risen and fallen.
> +		 * Packets originated from eDPI have been transmitted and its
> +		 * FIFO is empty again In this scenario no non-eDPI requests
> +		 * are sent to the D-PHY, even if there is traffic from generic
> +		 * or DBI ready to be sent, making it return to stop state.
> +		 * When it does so, PRESP_TO counter is activated and only when
> +		 * it finishes does the controller send any other traffic that
> +		 * is ready.
> +		 */
> +		u32 hswr_presp_to_mode: 1;
> +
> +		u32 reserved_1: 7;
> +
> +		} bits;
> +	} HSWR_PRESP_TO_CONFIG;
> +
> +	union _0x54 {
> +		u32 val;
> +		struct _LPWR_PRESP_TO_CONFIG {
> +		/*
> +		 * This field sets a period for which the DWC_mipi_dsi_host
> +		 * keeps the link still, after sending a low-power write oper-
> +		 * ation. This period is measured in cycles of lanebyteclk.
> +		 * The counting starts when the D-PHY enters the Stop state
> +		 * and causes no interrupts.
> +		 */
> +		u32 lpwr_presp_to_cnt_limit: 16;
> +
> +		u32 reserved: 16;
> +
> +		} bits;
> +	} LPWR_PRESP_TO_CONFIG;
> +
> +	union _0x58 {
> +		u32 val;
> +		struct _BTA_PRESP_TO_CONFIG {
> +		/*
> +		 * This field sets a period for which the DWC_mipi_dsi_host
> +		 * keeps the link still, after completing a Bus Turn-Around.
> +		 * This period is measured in cycles of lanebyteclk. The
> +		 * counting starts when the D-PHY enters the Stop state and
> +		 * causes no interrupts.
> +		 */
> +		u32 bta_presp_to_cnt_limit: 16;
> +
> +		u32 reserved: 16;
> +
> +		} bits;
> +	} BTA_PRESP_TO_CONFIG;
> +
> +	union _0x5C {
> +		u32 val;
> +		struct _TX_ESC_CLK_CONFIG {
> +		/*
> +		 * This field indicates the division factor for the TX Escape
> +		 * clock source (lanebyteclk). The values 0 and 1 stop the
> +		 * TX_ESC clock generation.
> +		 */
> +		u32 tx_esc_clk_config: 16;
> +
> +		u32 reserved: 16;
> +
> +		} bits;
> +	} TX_ESC_CLK_CONFIG;
> +
> +	union _0x60 {
> +		u32 val;
> +		struct _VACT_CMD_TRANS_LIMIT {
> +		/*
> +		 * This field is used for the transmission of commands in
> +		 * low-power mode. It defines the size, in bytes, of the
> +		 * largest packet that can fit in a line during the VACT
> +		 * region.
> +		 */
> +		u32 vact_cmd_trans_limit: 8;
> +
> +		u32 reserved: 24;
> +
> +		} bits;
> +	} VACT_CMD_TRANS_LIMIT;
> +
> +	union _0x64 {
> +		u32 val;
> +		struct _VBLK_CMD_TRANS_LIMIT {
> +		/*
> +		 * This field is used for the transmission of commands in
> +		 * low-power mode. It defines the size, in bytes, of the
> +		 * largest packet that can fit in a line during the VSA, VBP,
> +		 * and VFP regions.
> +		 */
> +		u32 vblk_cmd_trans_limit: 8;
> +
> +		u32 reserved: 24;
> +
> +		} bits;
> +	} VBLK_CMD_TRANS_LIMIT;
> +
> +	union _0x68 {
> +		u32 val;
> +		struct _CMD_MODE_CFG {
> +		/*
> +		 * When set to 1, this bit enables the tearing effect
> +		 * acknowledge request.
> +		 */
> +		u32 tear_fx_en: 1;
> +
> +		/*
> +		 * When set to 1, this bit enables the acknowledge request
> +		 * after each packet transmission.
> +		 */
> +		u32 ack_rqst_en: 1;
> +
> +		u32 reserved_0: 3;
> +
> +		u32 pps_tx: 1;
> +		u32 exq_tx: 1;
> +		u32 cmc_tx: 1;
> +
> +		/*
> +		 * This bit configures the Generic short write packet with
> +		 * zero parameter command transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 gen_sw_0p_tx: 1;
> +
> +		/*
> +		 * This bit configures the Generic short write packet with
> +		 * one parameter command transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 gen_sw_1p_tx: 1;
> +
> +		/*
> +		 * This bit configures the Generic short write packet with
> +		 * two parameters command transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 gen_sw_2p_tx: 1;
> +
> +		/*
> +		 * This bit configures the Generic short read packet with
> +		 * zero parameter command transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 gen_sr_0p_tx: 1;
> +
> +		/*
> +		 * This bit configures the Generic short read packet with
> +		 * one parameter command transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 gen_sr_1p_tx: 1;
> +
> +		/*
> +		 * This bit configures the Generic short read packet with
> +		 * two parameters command transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 gen_sr_2p_tx: 1;
> +
> +		/*
> +		 * This bit configures the Generic long write packet command
> +		 * transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 gen_lw_tx: 1;
> +
> +		u32 reserved_1: 1;
> +
> +		/*
> +		 * This bit configures the DCS short write packet with zero
> +		 * parameter command transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 dcs_sw_0p_tx: 1;
> +
> +		/*
> +		 * This bit configures the DCS short write packet with one
> +		 * parameter command transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 dcs_sw_1p_tx: 1;
> +
> +		/*
> +		 * This bit configures the DCS short read packet with zero
> +		 * parameter command transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 dcs_sr_0p_tx: 1;
> +
> +		/*
> +		 * This bit configures the DCS long write packet command
> +		 * transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 dcs_lw_tx: 1;
> +
> +		u32 reserved_2: 4;
> +
> +		/*
> +		 * This bit configures the maximum read packet size command
> +		 * transmission type:
> +		 * 0: High-speed 1: Low-power
> +		 */
> +		u32 max_rd_pkt_size: 1;
> +
> +		u32 reserved_3: 7;
> +
> +		} bits;
> +	} CMD_MODE_CFG;
> +
> +	union _0x6C {
> +		u32 val;
> +		struct _GEN_HDR {
> +		/*
> +		 * This field configures the packet data type of the header
> +		 * packet.
> +		 */
> +		u32 gen_dt: 6;
> +
> +		/*
> +		 * This field configures the virtual channel id of the header
> +		 * packet.
> +		 */
> +		u32 gen_vc: 2;
> +
> +		/*
> +		 * This field configures the least significant byte of the
> +		 * header packet's Word count for long packets or data 0 for
> +		 * short packets.
> +		 */
> +		u32 gen_wc_lsbyte: 8;
> +
> +		/*
> +		 * This field configures the most significant byte of the
> +		 * header packet's word count for long packets or data 1 for
> +		 * short packets.
> +		 */
> +		u32 gen_wc_msbyte: 8;
> +
> +		u32 reserved: 8;
> +
> +		} bits;
> +	} GEN_HDR;
> +
> +	union _0x70 {
> +		u32 val;
> +		struct _GEN_PLD_DATA {
> +		/* This field indicates byte 1 of the packet payload. */
> +		u32 gen_pld_b1: 8;
> +
> +		/* This field indicates byte 2 of the packet payload. */
> +		u32 gen_pld_b2: 8;
> +
> +		/* This field indicates byte 3 of the packet payload. */
> +		u32 gen_pld_b3: 8;
> +
> +		/* This field indicates byte 4 of the packet payload. */
> +		u32 gen_pld_b4: 8;
> +
> +		} bits;
> +	} GEN_PLD_DATA;
> +
> +	union _0x74 {
> +		u32 val;
> +		struct _PHY_CLK_LANE_LP_CTRL {
> +		/* This bit controls the D-PHY PPI txrequestclkhs signal */
> +		u32 phy_clklane_tx_req_hs: 1;
> +
> +		/* This bit enables the automatic mechanism to stop providing
> +		 * clock in the clock lane when time allows.
> +		 */
> +		u32 auto_clklane_ctrl_en: 1;
> +
> +		u32 reserved: 30;
> +		} bits;
> +	} PHY_CLK_LANE_LP_CTRL;
> +
> +	union _0x78 {
> +		u32 val;
> +		struct _PHY_INTERFACE_CTRL {
> +		/* When set to 0, this bit places the D-PHY macro in power-
> +		 * down state.
> +		 */
> +		u32 rf_phy_shutdown: 1;
> +
> +		/* When set to 0, this bit places the digital section of the
> +		 * D-PHY in the reset state.
> +		 */
> +		u32 rf_phy_reset_n: 1;
> +
> +		/* When set to 1, this bit enables the D-PHY Clock Lane
> +		 * module.
> +		 */
> +		u32 rf_phy_clk_en: 1;
> +
> +		/* When the D-PHY is in ULPS, this bit enables the D-PHY PLL. */
> +		u32 rf_phy_force_pll: 1;
> +
> +		/* ULPS mode Request on clock lane */
> +		u32 rf_phy_clk_txrequlps: 1;
> +
> +		/* ULPS mode Exit on clock lane */
> +		u32 rf_phy_clk_txexitulps: 1;
> +
> +		/* ULPS mode Request on all active data lanes */
> +		u32 rf_phy_data_txrequlps: 1;
> +
> +		/* ULPS mode Exit on all active data lanes */
> +		u32 rf_phy_data_txexitulps: 1;
> +
> +		u32 reserved: 24;
> +		} bits;
> +	} PHY_INTERFACE_CTRL;
> +
> +	union _0x7C {
> +		u32 val;
> +		struct _PHY_TX_TRIGGERS {
> +		/* This field controls the trigger transmissions. */
> +		u32 phy_tx_triggers: 4;
> +
> +		u32 reserved: 28;
> +		} bits;
> +	} PHY_TX_TRIGGERS;
> +
> +	union _0x80 {
> +		u32 val;
> +		struct _DESKEW_START {
> +		u32 deskew_start: 1;
> +		u32 reserved: 31;
> +		} bits;
> +	} DESKEW_START;
> +
> +	union _0x84 {
> +		u32 val;
> +		struct _DESKEW_MODE {
> +		u32 deskew_mode: 2;
> +		u32 reserved: 30;
> +		} bits;
> +	} DESKEW_MODE;
> +
> +	union _0x88 {
> +		u32 val;
> +		struct _DESKEW_TIME {
> +		u32 deskew_time: 32;
> +		} bits;
> +	} DESKEW_TIME;
> +
> +	union _0x8C {
> +		u32 val;
> +		struct _DESKEW_PERIOD {
> +		u32 deskew_period: 32;
> +		} bits;
> +	} DESKEW_PERIOD;
> +
> +	union _0x90 {
> +		u32 val;
> +		struct _DESKEW_BUSY {
> +		u32 deskew_busy: 1;
> +		u32 reserved: 31;
> +		} bits;
> +	} DESKEW_BUSY;
> +
> +	union _0x94 {
> +		u32 val;
> +		struct _DESKEW_LANE_MASK {
> +		u32 deskew_lane0_mask: 1;
> +		u32 deskew_lane1_mask: 1;
> +		u32 deskew_lane2_mask: 1;
> +		u32 deskew_lane3_mask: 1;
> +		u32 reserved: 28;
> +		} bits;
> +	} DESKEW_LANE_MASK;
> +
> +	union _0x98 {
> +		u32 val;
> +		struct _CMD_MODE_STATUS {
> +		/*
> +		 * This bit is set when a read command is issued and cleared
> +		 * when the entire response is stored in the FIFO.
> +		 * Value after reset: 0x0
> +		 *
> +		 * NOTE:
> +		 * For mipi-dsi-r1p0 IP, this bit is set immediately when
> +		 *     the read cmd is set to the GEN_HDR register.
> +		 *
> +		 * For dsi-ctrl-r1p0 IP, this bit is set only after the read
> +		 *     cmd was actually sent out from the controller.
> +		 */
> +		u32 gen_cmd_rdcmd_ongoing: 1;
> +
> +		/*
> +		 * This bit indicates the empty status of the generic read
> +		 * payload FIFO.
> +		 * Value after reset: 0x1
> +		 */
> +		u32 gen_cmd_rdata_fifo_empty: 1;
> +
> +		/*
> +		 * This bit indicates the full status of the generic read
> +		 * payload FIFO.
> +		 * Value after reset: 0x0
> +		 */
> +		u32 gen_cmd_rdata_fifo_full: 1;
> +
> +		/*
> +		 * This bit indicates the empty status of the generic write
> +		 * payload FIFO.
> +		 * Value after reset: 0x1
> +		 */
> +		u32 gen_cmd_wdata_fifo_empty: 1;
> +
> +		/*
> +		 * This bit indicates the full status of the generic write
> +		 * payload FIFO.
> +		 * Value after reset: 0x0
> +		 */
> +		u32 gen_cmd_wdata_fifo_full: 1;
> +
> +		/*
> +		 * This bit indicates the empty status of the generic
> +		 * command FIFO.
> +		 * Value after reset: 0x1
> +		 */
> +		u32 gen_cmd_cmd_fifo_empty: 1;
> +
> +		/*
> +		 * This bit indicates the full status of the generic
> +		 * command FIFO.
> +		 * Value after reset: 0x0
> +		 */
> +		u32 gen_cmd_cmd_fifo_full: 1;
> +
> +		/*
> +		 * This bit is set when the entire response of read is
> +		 * stored in the rx payload FIFO. And it will be cleared
> +		 * automaticlly after read this bit each time.
> +		 * Value after reset: 0x0
> +		 *
> +		 * NOTE: this bit is just supported for dsi-ctrl-r1p0 IP
> +		 */
> +		u32 gen_cmd_rdcmd_done: 1;
> +
> +		u32 reserved : 24;
> +
> +		} bits;
> +	} CMD_MODE_STATUS;
> +
> +	union _0x9C {
> +		u32 val;
> +		struct _PHY_STATUS {
> +		/* the status of phydirection D-PHY signal */
> +		u32 phy_direction: 1;
> +
> +		/* the status of phylock D-PHY signal */
> +		u32 phy_lock: 1;
> +
> +		/* the status of rxulpsesc0lane D-PHY signal */
> +		u32 phy_rxulpsesc0lane: 1;
> +
> +		/* the status of phystopstateclklane D-PHY signal */
> +		u32 phy_stopstateclklane: 1;
> +
> +		/* the status of phystopstate0lane D-PHY signal */
> +		u32 phy_stopstate0lane: 1;
> +
> +		/* the status of phystopstate1lane D-PHY signal */
> +		u32 phy_stopstate1lane: 1;
> +
> +		/* the status of phystopstate2lane D-PHY signal */
> +		u32 phy_stopstate2lane: 1;
> +
> +		/* the status of phystopstate3lane D-PHY signal */
> +		u32 phy_stopstate3lane: 1;
> +
> +		/* the status of phyulpsactivenotclk D-PHY signal */
> +		u32 phy_ulpsactivenotclk: 1;
> +
> +		/* the status of ulpsactivenot0lane D-PHY signal */
> +		u32 phy_ulpsactivenot0lane: 1;
> +
> +		/* the status of ulpsactivenot1lane D-PHY signal */
> +		u32 phy_ulpsactivenot1lane: 1;
> +
> +		/* the status of ulpsactivenot2lane D-PHY signal */
> +		u32 phy_ulpsactivenot2lane: 1;
> +
> +		/* the status of ulpsactivenot3lane D-PHY signal */
> +		u32 phy_ulpsactivenot3lane: 1;
> +
> +		u32 reserved: 19;
> +
> +		} bits;
> +	} PHY_STATUS;
> +
> +	union _0xA0 {
> +		u32 val;
> +		struct _PHY_MIN_STOP_TIME {
> +		/* This field configures the minimum wait period to request
> +		 * a high-speed transmission after the Stop state.
> +		 */
> +		u32 phy_min_stop_time: 8;
> +
> +		u32 reserved: 24;
> +		} bits;
> +	} PHY_MIN_STOP_TIME;
> +
> +	union _0xA4 {
> +		u32 val;
> +		struct _PHY_LANE_NUM_CONFIG {
> +		/*
> +		 * This field configures the number of active data lanes:
> +		 * 00: One data lane (lane 0)
> +		 * 01: Two data lanes (lanes 0 and 1)
> +		 * 10: Three data lanes (lanes 0, 1, and 2)
> +		 * 11: Four data lanes (lanes 0, 1, 2, and 3)
> +		 */
> +		u32 phy_lane_num: 2;
> +
> +		u32 reserved: 30;
> +
> +		} bits;
> +	} PHY_LANE_NUM_CONFIG;
> +
> +	union _0xA8 {
> +		u32 val;
> +		struct _PHY_CLKLANE_TIME_CONFIG {
> +		/*
> +		 * This field configures the maximum time that the D-PHY
> +		 * clock lane takes to go from low-power to high-speed
> +		 * transmission measured in lane byte clock cycles.
> +		 */
> +		u32 phy_clklane_lp_to_hs_time: 16;
> +
> +		/*
> +		 * This field configures the maximum time that the D-PHY
> +		 * clock lane takes to go from high-speed to low-power
> +		 * transmission measured in lane byte clock cycles.
> +		 */
> +		u32 phy_clklane_hs_to_lp_time: 16;
> +
> +		} bits;
> +	} PHY_CLKLANE_TIME_CONFIG;
> +
> +	union _0xAC {
> +		u32 val;
> +		struct _PHY_DATALANE_TIME_CONFIG {
> +		/*
> +		 * This field configures the maximum time that the D-PHY data
> +		 * lanes take to go from low-power to high-speed transmission
> +		 * measured in lane byte clock cycles.
> +		 */
> +		u32 phy_datalane_lp_to_hs_time: 16;
> +
> +		/*
> +		 * This field configures the maximum time that the D-PHY data
> +		 * lanes take to go from high-speed to low-power transmission
> +		 * measured in lane byte clock cycles.
> +		 */
> +		u32 phy_datalane_hs_to_lp_time: 16;
> +
> +		} bits;
> +	} PHY_DATALANE_TIME_CONFIG;
> +
> +	union _0xB0 {
> +		u32 val;
> +		struct _MAX_READ_TIME {
> +		/*
> +		 * This field configures the maximum time required to perform
> +		 * a read command in lane byte clock cycles. This register can
> +		 * only be modified when no read command is in progress.
> +		 */
> +		u32 max_rd_time: 16;
> +
> +		u32 reserved: 16;
> +
> +		} bits;
> +	} MAX_READ_TIME;
> +
> +	union _0xB4 {
> +		u32 val;
> +		struct _RX_PKT_CHECK_CONFIG {
> +		/* When set to 1, this bit enables the ECC reception, error
> +		 * correction, and reporting.
> +		 */
> +		u32 rx_pkt_ecc_en: 1;
> +
> +		/* When set to 1, this bit enables the CRC reception and error
> +		 * reporting.
> +		 */
> +		u32 rx_pkt_crc_en: 1;
> +
> +		u32 reserved: 30;
> +
> +		} bits;
> +	} RX_PKT_CHECK_CONFIG;
> +
> +	union _0xB8 {
> +		u32 val;
> +		struct _TA_EN {
> +		/* When set to 1, this bit enables the Bus Turn-Around (BTA)
> +		 * request.
> +		 */
> +		u32 ta_en: 1;
> +
> +		u32 reserved: 31;
> +
> +		} bits;
> +	} TA_EN;
> +
> +	union _0xBC {
> +		u32 val;
> +		struct _EOTP_EN {
> +		/* When set to 1, this bit enables the EoTp transmission */
> +		u32 tx_eotp_en: 1;
> +
> +		/* When set to 1, this bit enables the EoTp reception. */
> +		u32 rx_eotp_en: 1;
> +
> +		u32 reserved: 30;
> +
> +		} bits;
> +	} EOTP_EN;
> +
> +	union _0xC0 {
> +		u32 val;
> +		struct _VIDEO_NULLPKT_SIZE {
> +		/*
> +		 * This register configures the number of bytes inside a null
> +		 * packet. Setting it to 0 disables the null packets.
> +		 */
> +		u32 video_nullpkt_size: 13;
> +
> +		u32 reserved: 19;
> +
> +		} bits;
> +	} VIDEO_NULLPKT_SIZE;
> +
> +	union _0xC4 {
> +		u32 val;
> +		struct _DCS_WM_PKT_SIZE {
> +		/*
> +		 * This field configures the maximum allowed size for an eDPI
> +		 * write memory command, measured in pixels. Automatic parti-
> +		 * tioning of data obtained from eDPI is permanently enabled.
> +		 */
> +		u32 dcs_wm_pkt_size: 16;
> +
> +		u32 reserved: 16;
> +		} bits;
> +	} DCS_WM_PKT_SIZE;
> +
> +	union _0xC8 {
> +		u32 val;
> +		struct _PROTOCOL_INT_CLR {
> +		u32 clr_dphy_errors_0: 1;
> +		u32 clr_dphy_errors_1: 1;
> +		u32 clr_dphy_errors_2: 1;
> +		u32 clr_dphy_errors_3: 1;
> +		u32 clr_dphy_errors_4: 1;
> +		u32 clr_protocol_debug_err: 11;
> +		u32 clr_ack_with_err_0: 1;
> +		u32 clr_ack_with_err_1: 1;
> +		u32 clr_ack_with_err_2: 1;
> +		u32 clr_ack_with_err_3: 1;
> +		u32 clr_ack_with_err_4: 1;
> +		u32 clr_ack_with_err_5: 1;
> +		u32 clr_ack_with_err_6: 1;
> +		u32 clr_ack_with_err_7: 1;
> +		u32 clr_ack_with_err_8: 1;
> +		u32 clr_ack_with_err_9: 1;
> +		u32 clr_ack_with_err_10: 1;
> +		u32 clr_ack_with_err_11: 1;
> +		u32 clr_ack_with_err_12: 1;
> +		u32 clr_ack_with_err_13: 1;
> +		u32 clr_ack_with_err_14: 1;
> +		u32 clr_ack_with_err_15: 1;
> +		} bits;
> +	} PROTOCOL_INT_CLR;
> +
> +	union _0xCC {
> +		u32 val;
> +		struct _INTERNAL_INT_CLR {
> +		u32 clr_receive_pkt_size_err: 1;
> +		u32 clr_eopt_not_receive_err: 1;
> +		u32 clr_gen_cmd_cmd_fifo_wr_err: 1;
> +		u32 clr_gen_cmd_rdata_fifo_rd_err: 1;
> +		u32 clr_gen_cmd_rdata_fifo_wr_err: 1;
> +		u32 clr_gen_cmd_wdata_fifo_wr_err: 1;
> +		u32 clr_gen_cmd_wdata_fifo_rd_err: 1;
> +		u32 clr_dpi_pix_fifo_wr_err: 1;
> +		u32 clr_internal_debug_err: 19;
> +		u32 clr_ecc_single_err: 1;
> +		u32 clr_ecc_multi_err: 1;
> +		u32 clr_crc_err: 1;
> +		u32 clr_hs_tx_timeout: 1;
> +		u32 clr_lp_rx_timeout: 1;
> +		} bits;
> +	} INTERNAL_INT_CLR;
> +
> +	union _0xD0 {
> +		u32 val;
> +		struct _VIDEO_SIG_DELAY_CONFIG {
> +
> +		/*
> +		 * DPI interface signal delay to be used in clk lanebyte
> +		 * domain for control logic to read video data from pixel
> +		 * memory in mannal mode, measured in clk_lanebyte cycles
> +		 */
> +		u32 video_sig_delay: 24;
> +
> +		/*
> +		 * 1'b1: mannal mode
> +		 *       dsi controller will use video_sig_delay value as
> +		 *       the delay for the packet handle logic to read video
> +		 *       data from pixel memory.
> +		 *
> +		 * 1'b0: auto mode
> +		 *       dsi controller will auto calculate the delay for
> +		 *       the packet handle logic to read video data from
> +		 *       pixel memory.
> +		 */
> +		u32 video_sig_delay_mode: 1;
> +
> +		u32 reserved: 7;
> +		} bits;
> +	} VIDEO_SIG_DELAY_CONFIG;
> +
> +	u32 reservedD4_EC[7];
> +
> +	union _0xF0 {
> +		u32 val;
> +		struct _PHY_TST_CTRL0 {
> +		/* PHY test interface clear (active high) */
> +		u32 phy_testclr: 1;
> +
> +		/* This bit is used to clock the TESTDIN bus into the D-PHY */
> +		u32 phy_testclk: 1;
> +
> +		u32 reserved: 30;
> +		} bits;
> +	} PHY_TST_CTRL0;
> +
> +	union _0xF4 {
> +		u32 val;
> +		struct _PHY_TST_CTRL1 {
> +		/* PHY test interface input 8-bit data bus for internal
> +		 * register programming and test functionalities access.
> +		 */
> +		u32 phy_testdin: 8;
> +
> +		/* PHY output 8-bit data bus for read-back and internal
> +		 * probing functionalities.
> +		 */
> +		u32 phy_testdout: 8;
> +
> +		/*
> +		 * PHY test interface operation selector:
> +		 * 1: The address write operation is set on the falling edge
> +		 *    of the testclk signal.
> +		 * 0: The data write operation is set on the rising edge of
> +		 *    the testclk signal.
> +		 */
> +		u32 phy_testen: 1;
> +
> +		u32 reserved: 15;
> +		} bits;
> +	} PHY_TST_CTRL1;
> +
> +	u32 reservedF8_1FC[66];
> +
> +	union _0x200 {
> +		u32 val;
> +		struct _INT_PLL_STS {
> +		u32 int_pll_sts: 1;
> +		u32 reserved: 31;
> +		} bits;
> +	} INT_PLL_STS;
> +
> +	union _0x204 {
> +		u32 val;
> +		struct _INT_PLL_MSK {
> +		u32 int_pll_msk: 1;
> +		u32 reserved: 31;
> +		} bits;
> +	} INT_PLL_MSK;
> +
> +	union _0x208 {
> +		u32 val;
> +		struct _INT_PLL_CLR {
> +		u32 int_pll_clr: 1;
> +		u32 reserved: 31;
> +		} bits;
> +	} INT_PLL_CLR;
> +
> +};
> +
> +void dsi_power_enable(struct dsi_context *ctx, int enable);
> +void dsi_video_mode(struct dsi_context *ctx);
> +void dsi_cmd_mode(struct dsi_context *ctx);
> +bool dsi_is_cmd_mode(struct dsi_context *ctx);
> +void dsi_rx_vcid(struct dsi_context *ctx, u8 vc);
> +void dsi_video_vcid(struct dsi_context *ctx, u8 vc);
> +void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mode);
> +void dsi_dpi_color_coding(struct dsi_context *ctx, int coding);
> +void dsi_dpi_sig_delay(struct dsi_context *ctx, u16 byte_cycle);
> +void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cycle);
> +void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cycle);
> +void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle);
> +void dsi_dpi_vact(struct dsi_context *ctx, u16 lines);
> +void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines);
> +void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines);
> +void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines);
> +void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable);
> +void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable);
> +void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable);
> +void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 no);
> +void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 size);
> +void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 size);
> +void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size);
> +void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enable);
> +void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enable);
> +void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int enable);
> +void dsi_set_packet_header(struct dsi_context *ctx, u8 vc, u8 type,
> +						u8 wc_lsb, u8 wc_msb);
> +void dsi_set_packet_payload(struct dsi_context *ctx, u32 payload);
> +u32 dsi_get_rx_payload(struct dsi_context *ctx);
> +void dsi_bta_en(struct dsi_context *ctx, int enable);
> +void dsi_eotp_rx_en(struct dsi_context *ctx, int enable);
> +void dsi_eotp_tx_en(struct dsi_context *ctx, int enable);
> +void dsi_ecc_rx_en(struct dsi_context *ctx, int enable);
> +void dsi_crc_rx_en(struct dsi_context *ctx, int enable);
> +bool dsi_is_bta_returned(struct dsi_context *ctx);
> +bool dsi_is_rx_payload_fifo_full(struct dsi_context *ctx);
> +bool dsi_is_rx_payload_fifo_empty(struct dsi_context *ctx);
> +bool dsi_is_tx_payload_fifo_full(struct dsi_context *ctx);
> +bool dsi_is_tx_payload_fifo_empty(struct dsi_context *ctx);
> +bool dsi_is_tx_cmd_fifo_empty(struct dsi_context *ctx);
> +void dsi_datalane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle);
> +void dsi_datalane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle);
> +void dsi_clklane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle);
> +void dsi_clklane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle);
> +void dsi_max_read_time(struct dsi_context *ctx, u16 byte_cycle);
> +void dsi_nc_clk_en(struct dsi_context *ctx, int enable);
> +void dsi_tx_escape_division(struct dsi_context *ctx, u8 div);
> +void dsi_timeout_clock_division(struct dsi_context *ctx, u8 div);
> +void dsi_lp_rx_timeout(struct dsi_context *ctx, u16 count);
> +void dsi_hs_tx_timeout(struct dsi_context *ctx, u16 count);
> +u32 dsi_int0_status(struct dsi_context *ctx);
> +u32 dsi_int1_status(struct dsi_context *ctx);
> +void dsi_int0_mask(struct dsi_context *ctx, u32 mask);
> +void dsi_int1_mask(struct dsi_context *ctx, u32 mask);
> +
> +#endif /* _DW_DSI_CTRL_H_ */
> diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c b/drivers/gpu/drm/spr=
d/dw_dsi_ctrl_ppi.c
> new file mode 100644
> index 000000000..6e28d7cf6
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +
> +#include "dw_dsi_ctrl.h"
> +#include "dw_dsi_ctrl_ppi.h"
> +
> +/*
> + * Reset D-PHY module
> + */
> +void dsi_phy_rstz(struct dsi_context *ctx, int level)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x78 phy_interface_ctrl;
> +
> +	phy_interface_ctrl.val =3D readl(&reg->PHY_INTERFACE_CTRL);
> +	phy_interface_ctrl.bits.rf_phy_reset_n =3D level;
> +
> +	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
> +}
> +
> +/*
> + * Power up/down D-PHY module
> + */
> +void dsi_phy_shutdownz(struct dsi_context *ctx, int level)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x78 phy_interface_ctrl;
> +
> +	phy_interface_ctrl.val =3D readl(&reg->PHY_INTERFACE_CTRL);
> +	phy_interface_ctrl.bits.rf_phy_shutdown =3D level;
> +
> +	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
> +}
> +
> +/*
> + * Configure minimum wait period for HS transmission request after a sto=
p state
> + */
> +void dsi_phy_stop_wait_time(struct dsi_context *ctx, u8 byte_cycle)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(byte_cycle, &reg->PHY_MIN_STOP_TIME);
> +}
> +
> +/*
> + * Set number of active lanes
> + */
> +void dsi_phy_datalane_en(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +
> +	writel(ctx->lanes - 1, &reg->PHY_LANE_NUM_CONFIG);
> +}
> +
> +/*
> + * Enable clock lane module
> + */
> +void dsi_phy_clklane_en(struct dsi_context *ctx, int en)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x78 phy_interface_ctrl;
> +
> +	phy_interface_ctrl.val =3D readl(&reg->PHY_INTERFACE_CTRL);
> +	phy_interface_ctrl.bits.rf_phy_clk_en =3D en;
> +
> +	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
> +}
> +
> +/*
> + * Request the PHY module to start transmission of high speed clock.
> + * This causes the clock lane to start transmitting DDR clock on the
> + * lane interconnect.
> + */
> +void dsi_phy_clk_hs_rqst(struct dsi_context *ctx, int enable)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x74 phy_clk_lane_lp_ctrl;
> +
> +	phy_clk_lane_lp_ctrl.val =3D readl(&reg->PHY_CLK_LANE_LP_CTRL);
> +	phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en =3D 0;
> +	phy_clk_lane_lp_ctrl.bits.phy_clklane_tx_req_hs =3D enable;
> +
> +	writel(phy_clk_lane_lp_ctrl.val, &reg->PHY_CLK_LANE_LP_CTRL);
> +}
> +
> +/*
> + * Get D-PHY PPI status
> + */
> +u8 dsi_phy_is_pll_locked(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0x9C phy_status;
> +
> +	phy_status.val =3D readl(&reg->PHY_STATUS);
> +
> +	return phy_status.bits.phy_lock;
> +}
> +
> +void dsi_phy_test_clk(struct dsi_context *ctx, u8 value)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xF0 phy_tst_ctrl0;
> +
> +	phy_tst_ctrl0.val =3D readl(&reg->PHY_TST_CTRL0);
> +	phy_tst_ctrl0.bits.phy_testclk =3D value;
> +
> +	writel(phy_tst_ctrl0.val, &reg->PHY_TST_CTRL0);
> +}
> +
> +void dsi_phy_test_clr(struct dsi_context *ctx, u8 value)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xF0 phy_tst_ctrl0;
> +
> +	phy_tst_ctrl0.val =3D readl(&reg->PHY_TST_CTRL0);
> +	phy_tst_ctrl0.bits.phy_testclr =3D value;
> +
> +	writel(phy_tst_ctrl0.val, &reg->PHY_TST_CTRL0);
> +}
> +
> +void dsi_phy_test_en(struct dsi_context *ctx, u8 value)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xF4 phy_tst_ctrl1;
> +
> +	phy_tst_ctrl1.val =3D readl(&reg->PHY_TST_CTRL1);
> +	phy_tst_ctrl1.bits.phy_testen =3D value;
> +
> +	writel(phy_tst_ctrl1.val, &reg->PHY_TST_CTRL1);
> +}
> +
> +u8 dsi_phy_test_dout(struct dsi_context *ctx)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xF4 phy_tst_ctrl1;
> +
> +	phy_tst_ctrl1.val =3D readl(&reg->PHY_TST_CTRL1);
> +
> +	return phy_tst_ctrl1.bits.phy_testdout;
> +}
> +
> +void dsi_phy_test_din(struct dsi_context *ctx, u8 data)
> +{
> +	struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> +	union _0xF4 phy_tst_ctrl1;
> +
> +	phy_tst_ctrl1.val =3D readl(&reg->PHY_TST_CTRL1);
> +	phy_tst_ctrl1.bits.phy_testdin =3D data;
> +
> +	writel(phy_tst_ctrl1.val, &reg->PHY_TST_CTRL1);
> +}
> diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h b/drivers/gpu/drm/spr=
d/dw_dsi_ctrl_ppi.h
> new file mode 100644
> index 000000000..d87fb7579
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#ifndef _DW_DSI_CTRL_PPI_H_
> +#define _DW_DSI_CTRL_PPI_H_
> +
> +#include "sprd_dsi.h"
> +
> +void dsi_phy_rstz(struct dsi_context *ctx, int level);
> +void dsi_phy_shutdownz(struct dsi_context *ctx, int level);
> +void dsi_phy_force_pll(struct dsi_context *ctx, int force);
> +void dsi_phy_stop_wait_time(struct dsi_context *ctx, u8 byte_clk);
> +void dsi_phy_datalane_en(struct dsi_context *ctx);
> +void dsi_phy_clklane_en(struct dsi_context *ctx, int en);
> +void dsi_phy_clk_hs_rqst(struct dsi_context *ctx, int en);
> +u8 dsi_phy_is_pll_locked(struct dsi_context *ctx);
> +void dsi_phy_test_clk(struct dsi_context *ctx, u8 level);
> +void dsi_phy_test_clr(struct dsi_context *ctx, u8 level);
> +void dsi_phy_test_en(struct dsi_context *ctx, u8 level);
> +u8 dsi_phy_test_dout(struct dsi_context *ctx);
> +void dsi_phy_test_din(struct dsi_context *ctx, u8 data);
> +void dsi_phy_bist_en(struct dsi_context *ctx, int en);
> +
> +#endif /* _DW_DSI_CTRL_PPI_H_ */
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sprd/=
megacores_pll.c
> new file mode 100644
> index 000000000..03c1f0f00
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/megacores_pll.c
> @@ -0,0 +1,317 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#include <asm/div64.h>
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/regmap.h>
> +#include <linux/string.h>
> +
> +#include "megacores_pll.h"
> +
> +#define L						0
> +#define H						1
> +#define CLK						0
> +#define DATA					1
> +#define INFINITY				0xffffffff
> +#define MIN_OUTPUT_FREQ			(100)
> +
> +#define AVERAGE(a, b) (min(a, b) + abs((b) - (a)) / 2)
> +
> +/* sharkle */
> +#define VCO_BAND_LOW	750
> +#define VCO_BAND_MID	1100
> +#define VCO_BAND_HIGH	1500
> +#define PHY_REF_CLK	26000
> +
> +static int dphy_calc_pll_param(struct dphy_pll *pll)
> +{
> +	const u32 khz =3D 1000;
> +	const u32 mhz =3D 1000000;
> +	const unsigned long long factor =3D 100;
> +	unsigned long long tmp;
> +	int i;
> +
> +	pll->potential_fvco =3D pll->freq / khz;
> +	pll->ref_clk =3D PHY_REF_CLK / khz;
> +
> +	for (i =3D 0; i < 4; ++i) {
> +		if (pll->potential_fvco >=3D VCO_BAND_LOW &&
> +			pll->potential_fvco <=3D VCO_BAND_HIGH) {
> +			pll->fvco =3D pll->potential_fvco;
> +			pll->out_sel =3D BIT(i);
> +			break;
> +		}
> +		pll->potential_fvco <<=3D 1;
> +	}
> +	if (pll->fvco =3D=3D 0)
> +		return -EINVAL;
> +
> +	if (pll->fvco >=3D VCO_BAND_LOW && pll->fvco <=3D VCO_BAND_MID) {
> +		/* vco band control */
> +		pll->vco_band =3D 0x0;
> +		/* low pass filter control */
> +		pll->lpf_sel =3D 1;
> +	} else if (pll->fvco > VCO_BAND_MID && pll->fvco <=3D VCO_BAND_HIGH) {
> +		pll->vco_band =3D 0x1;
> +		pll->lpf_sel =3D 0;
> +	} else
> +		return -EINVAL;
> +
> +	pll->nint =3D pll->fvco / pll->ref_clk;
> +	tmp =3D pll->fvco * factor * mhz;
> +	do_div(tmp, pll->ref_clk);
> +	tmp =3D tmp - pll->nint * factor * mhz;
> +	tmp *=3D BIT(20);
> +	do_div(tmp, 100000000);
> +	pll->kint =3D (u32)tmp;
> +	pll->refin =3D 3; /* pre-divider bypass */
> +	pll->sdm_en =3D true; /* use fraction N PLL */
> +	pll->fdk_s =3D 0x1; /* fraction */
> +	pll->cp_s =3D 0x0;
> +	pll->det_delay =3D 0x1;
> +
> +	return 0;
> +}
> +
> +static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *regmap)
> +{
> +	struct pll_reg *reg =3D &pll->reg;
> +	u8 *val;
> +	int i;
> +
> +	u8 reg_addr[] =3D {
> +		0x03, 0x04, 0x06, 0x08, 0x09,
> +		0x0a, 0x0b, 0x0e, 0x0f
> +	};
> +
> +	reg->_03.bits.prbs_bist =3D 1;
> +	reg->_03.bits.en_lp_treot =3D true;
> +	reg->_03.bits.lpf_sel =3D pll->lpf_sel;
> +	reg->_03.bits.txfifo_bypass =3D 0;
> +	reg->_04.bits.div =3D pll->div;
> +	reg->_04.bits.masterof8lane =3D 1;
> +	reg->_04.bits.cp_s =3D pll->cp_s;
> +	reg->_04.bits.fdk_s =3D pll->fdk_s;
> +	reg->_06.bits.nint =3D pll->nint;
> +	reg->_08.bits.vco_band =3D pll->vco_band;
> +	reg->_08.bits.sdm_en =3D pll->sdm_en;
> +	reg->_08.bits.refin =3D pll->refin;
> +	reg->_09.bits.kint_h =3D pll->kint >> 12;
> +	reg->_0a.bits.kint_m =3D (pll->kint >> 4) & 0xff;
> +	reg->_0b.bits.out_sel =3D pll->out_sel;
> +	reg->_0b.bits.kint_l =3D pll->kint & 0xf;
> +	reg->_0e.bits.pll_pu_byp =3D 0;
> +	reg->_0e.bits.pll_pu =3D 0;
> +	reg->_0e.bits.stopstate_sel =3D 1;
> +	reg->_0f.bits.det_delay =3D pll->det_delay;
> +
> +	val =3D (u8 *)&reg;
> +
> +	for (i =3D 0; i < sizeof(reg_addr); ++i) {
> +		regmap_write(regmap, reg_addr[i], val[i]);
> +		DRM_DEBUG("%02x: %02x\n", reg_addr[i], val[i]);
> +	}
> +}
> +
> +int dphy_pll_config(struct dsi_context *ctx)
> +{
> +	struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> +	struct regmap *regmap =3D ctx->regmap;
> +	struct dphy_pll *pll =3D ctx->pll;
> +	int ret;
> +
> +	pll->freq =3D ctx->byte_clk * 8;
> +
> +	/* FREQ =3D 26M * (NINT + KINT / 2^20) / out_sel */
> +	ret =3D dphy_calc_pll_param(pll);
> +	if (ret) {
> +		drm_err(dsi->drm, "failed to calculate dphy pll parameters\n");
> +		return ret;
> +	}
> +	dphy_set_pll_reg(pll, regmap);
> +
> +	return 0;
> +}
> +
> +static void dphy_set_timing_reg(struct regmap *regmap, int type, u8 val[=
])
> +{
> +	switch (type) {
> +	case REQUEST_TIME:
> +		regmap_write(regmap, 0x31, val[CLK]);
> +		regmap_write(regmap, 0x41, val[DATA]);
> +		regmap_write(regmap, 0x51, val[DATA]);
> +		regmap_write(regmap, 0x61, val[DATA]);
> +		regmap_write(regmap, 0x71, val[DATA]);
> +
> +		regmap_write(regmap, 0x90, val[CLK]);
> +		regmap_write(regmap, 0xa0, val[DATA]);
> +		regmap_write(regmap, 0xb0, val[DATA]);
> +		regmap_write(regmap, 0xc0, val[DATA]);
> +		regmap_write(regmap, 0xd0, val[DATA]);
> +		break;
> +	case PREPARE_TIME:
> +		regmap_write(regmap, 0x32, val[CLK]);
> +		regmap_write(regmap, 0x42, val[DATA]);
> +		regmap_write(regmap, 0x52, val[DATA]);
> +		regmap_write(regmap, 0x62, val[DATA]);
> +		regmap_write(regmap, 0x72, val[DATA]);
> +
> +		regmap_write(regmap, 0x91, val[CLK]);
> +		regmap_write(regmap, 0xa1, val[DATA]);
> +		regmap_write(regmap, 0xb1, val[DATA]);
> +		regmap_write(regmap, 0xc1, val[DATA]);
> +		regmap_write(regmap, 0xd1, val[DATA]);
> +		break;
> +	case ZERO_TIME:
> +		regmap_write(regmap, 0x33, val[CLK]);
> +		regmap_write(regmap, 0x43, val[DATA]);
> +		regmap_write(regmap, 0x53, val[DATA]);
> +		regmap_write(regmap, 0x63, val[DATA]);
> +		regmap_write(regmap, 0x73, val[DATA]);
> +
> +		regmap_write(regmap, 0x92, val[CLK]);
> +		regmap_write(regmap, 0xa2, val[DATA]);
> +		regmap_write(regmap, 0xb2, val[DATA]);
> +		regmap_write(regmap, 0xc2, val[DATA]);
> +		regmap_write(regmap, 0xd2, val[DATA]);
> +		break;
> +	case TRAIL_TIME:
> +		regmap_write(regmap, 0x34, val[CLK]);
> +		regmap_write(regmap, 0x44, val[DATA]);
> +		regmap_write(regmap, 0x54, val[DATA]);
> +		regmap_write(regmap, 0x64, val[DATA]);
> +		regmap_write(regmap, 0x74, val[DATA]);
> +
> +		regmap_write(regmap, 0x93, val[CLK]);
> +		regmap_write(regmap, 0xa3, val[DATA]);
> +		regmap_write(regmap, 0xb3, val[DATA]);
> +		regmap_write(regmap, 0xc3, val[DATA]);
> +		regmap_write(regmap, 0xd3, val[DATA]);
> +		break;
> +	case EXIT_TIME:
> +		regmap_write(regmap, 0x36, val[CLK]);
> +		regmap_write(regmap, 0x46, val[DATA]);
> +		regmap_write(regmap, 0x56, val[DATA]);
> +		regmap_write(regmap, 0x66, val[DATA]);
> +		regmap_write(regmap, 0x76, val[DATA]);
> +
> +		regmap_write(regmap, 0x95, val[CLK]);
> +		regmap_write(regmap, 0xA5, val[DATA]);
> +		regmap_write(regmap, 0xB5, val[DATA]);
> +		regmap_write(regmap, 0xc5, val[DATA]);
> +		regmap_write(regmap, 0xd5, val[DATA]);
> +		break;
> +	case CLKPOST_TIME:
> +		regmap_write(regmap, 0x35, val[CLK]);
> +		regmap_write(regmap, 0x94, val[CLK]);
> +		break;
> +
> +	/* the following just use default value */
> +	case SETTLE_TIME:
> +	case TA_GET:
> +	case TA_GO:
> +	case TA_SURE:
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +void dphy_timing_config(struct dsi_context *ctx)
> +{
> +	struct regmap *regmap =3D ctx->regmap;
> +	struct dphy_pll *pll =3D ctx->pll;
> +	const u32 factor =3D 2;
> +	const u32 scale =3D 100;
> +	u32 t_ui, t_byteck, t_half_byteck;
> +	u32 range[2], constant;
> +	u8 val[2];
> +	u32 tmp =3D 0;
> +
> +	/* t_ui: 1 ui, byteck: 8 ui, half byteck: 4 ui */
> +	t_ui =3D 1000 * scale / (pll->freq / 1000);
> +	t_byteck =3D t_ui << 3;
> +	t_half_byteck =3D t_ui << 2;
> +	constant =3D t_ui << 1;
> +
> +	/* REQUEST_TIME: HS T-LPX: LP-01
> +	 * For T-LPX, mipi spec defined min value is 50ns,
> +	 * but maybe it shouldn't be too small, because BTA,
> +	 * LP-10, LP-00, LP-01, all of this is related to T-LPX.
> +	 */
> +	range[L] =3D 50 * scale;
> +	range[H] =3D INFINITY;
> +	val[CLK] =3D DIV_ROUND_UP(range[L] * (factor << 1), t_byteck) - 2;
> +	val[DATA] =3D val[CLK];
> +	dphy_set_timing_reg(regmap, REQUEST_TIME, val);
> +
> +	/* PREPARE_TIME: HS sequence: LP-00 */
> +	range[L] =3D 38 * scale;
> +	range[H] =3D 95 * scale;
> +	tmp =3D AVERAGE(range[L], range[H]);
> +	val[CLK] =3D DIV_ROUND_UP(AVERAGE(range[L], range[H]),
> +			t_half_byteck) - 1;
> +	range[L] =3D 40 * scale + 4 * t_ui;
> +	range[H] =3D 85 * scale + 6 * t_ui;
> +	tmp |=3D AVERAGE(range[L], range[H]) << 16;
> +	val[DATA] =3D DIV_ROUND_UP(AVERAGE(range[L], range[H]),
> +			t_half_byteck) - 1;
> +	dphy_set_timing_reg(regmap, PREPARE_TIME, val);
> +
> +	/* ZERO_TIME: HS-ZERO */
> +	range[L] =3D 300 * scale;
> +	range[H] =3D INFINITY;
> +	val[CLK] =3D DIV_ROUND_UP(range[L] * factor + (tmp & 0xffff)
> +			- 525 * t_byteck / 100, t_byteck) - 2;
> +	range[L] =3D 145 * scale + 10 * t_ui;
> +	val[DATA] =3D DIV_ROUND_UP(range[L] * factor
> +			+ ((tmp >> 16) & 0xffff) - 525 * t_byteck / 100,
> +			t_byteck) - 2;
> +	dphy_set_timing_reg(regmap, ZERO_TIME, val);
> +
> +	/* TRAIL_TIME: HS-TRAIL */
> +	range[L] =3D 60 * scale;
> +	range[H] =3D INFINITY;
> +	val[CLK] =3D DIV_ROUND_UP(range[L] * factor - constant, t_half_byteck);
> +	range[L] =3D max(8 * t_ui, 60 * scale + 4 * t_ui);
> +	val[DATA] =3D DIV_ROUND_UP(range[L] * 3 / 2 - constant, t_half_byteck) =
- 2;
> +	dphy_set_timing_reg(regmap, TRAIL_TIME, val);
> +
> +	/* EXIT_TIME: */
> +	range[L] =3D 100 * scale;
> +	range[H] =3D INFINITY;
> +	val[CLK] =3D DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
> +	val[DATA] =3D val[CLK];
> +	dphy_set_timing_reg(regmap, EXIT_TIME, val);
> +
> +	/* CLKPOST_TIME: */
> +	range[L] =3D 60 * scale + 52 * t_ui;
> +	range[H] =3D INFINITY;
> +	val[CLK] =3D DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
> +	val[DATA] =3D val[CLK];
> +	dphy_set_timing_reg(regmap, CLKPOST_TIME, val);
> +
> +	/* SETTLE_TIME:
> +	 * This time is used for receiver. So for transmitter,
> +	 * it can be ignored.
> +	 */
> +
> +	/* TA_GO:
> +	 * transmitter drives bridge state(LP-00) before releasing control,
> +	 * reg 0x1f default value: 0x04, which is good.
> +	 */
> +
> +	/* TA_SURE:
> +	 * After LP-10 state and before bridge state(LP-00),
> +	 * reg 0x20 default value: 0x01, which is good.
> +	 */
> +
> +	/* TA_GET:
> +	 * receiver drives Bridge state(LP-00) before releasing control
> +	 * reg 0x21 default value: 0x03, which is good.
> +	 */
> +}
> diff --git a/drivers/gpu/drm/sprd/megacores_pll.h b/drivers/gpu/drm/sprd/=
megacores_pll.h
> new file mode 100644
> index 000000000..750dbbc09
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/megacores_pll.h
> @@ -0,0 +1,146 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#ifndef _MEGACORES_PLL_H_
> +#define _MEGACORES_PLL_H_
> +
> +#include "sprd_dsi.h"
> +
> +enum PLL_TIMING {
> +	NONE,
> +	REQUEST_TIME,
> +	PREPARE_TIME,
> +	SETTLE_TIME,
> +	ZERO_TIME,
> +	TRAIL_TIME,
> +	EXIT_TIME,
> +	CLKPOST_TIME,
> +	TA_GET,
> +	TA_GO,
> +	TA_SURE,
> +	TA_WAIT,
> +};
> +
> +struct pll_reg {
> +	union __reg_03__ {
> +		struct __03 {
> +			u8 prbs_bist: 1;
> +			u8 en_lp_treot: 1;
> +			u8 lpf_sel: 4;
> +			u8 txfifo_bypass: 1;
> +			u8 freq_hopping: 1;
> +		} bits;
> +		u8 val;
> +	} _03;
> +	union __reg_04__ {
> +		struct __04 {
> +			u8 div: 3;
> +			u8 masterof8lane: 1;
> +			u8 hop_trig: 1;
> +			u8 cp_s: 2;
> +			u8 fdk_s: 1;
> +		} bits;
> +		u8 val;
> +	} _04;
> +	union __reg_06__ {
> +		struct __06 {
> +			u8 nint: 7;
> +			u8 mod_en: 1;
> +		} bits;
> +		u8 val;
> +	} _06;
> +	union __reg_07__ {
> +		struct __07 {
> +			u8 kdelta_h: 8;
> +		} bits;
> +		u8 val;
> +	} _07;
> +	union __reg_08__ {
> +		struct __08 {
> +			u8 vco_band: 1;
> +			u8 sdm_en: 1;
> +			u8 refin: 2;
> +			u8 kdelta_l: 4;
> +		} bits;
> +		u8 val;
> +	} _08;
> +	union __reg_09__ {
> +		struct __09 {
> +			u8 kint_h: 8;
> +		} bits;
> +		u8 val;
> +	} _09;
> +	union __reg_0a__ {
> +		struct __0a {
> +			u8 kint_m: 8;
> +		} bits;
> +		u8 val;
> +	} _0a;
> +	union __reg_0b__ {
> +		struct __0b {
> +			u8 out_sel: 4;
> +			u8 kint_l: 4;
> +		} bits;
> +		u8 val;
> +	} _0b;
> +	union __reg_0c__ {
> +		struct __0c {
> +			u8 kstep_h: 8;
> +		} bits;
> +		u8 val;
> +	} _0c;
> +	union __reg_0d__ {
> +		struct __0d {
> +			u8 kstep_m: 8;
> +		} bits;
> +		u8 val;
> +	} _0d;
> +	union __reg_0e__ {
> +		struct __0e {
> +			u8 pll_pu_byp: 1;
> +			u8 pll_pu: 1;
> +			u8 hsbist_len: 2;
> +			u8 stopstate_sel: 1;
> +			u8 kstep_l: 3;
> +		} bits;
> +		u8 val;
> +	} _0e;
> +	union __reg_0f__ {
> +		struct __0f {
> +			u8 det_delay:2;
> +			u8 kdelta: 4;
> +			u8 ldo0p4:2;
> +		} bits;
> +		u8 val;
> +	} _0f;
> +};
> +
> +struct dphy_pll {
> +	u8 refin; /* Pre-divider control signal */
> +	u8 cp_s; /* 00: SDM_EN=3D1, 10: SDM_EN=3D0 */
> +	u8 fdk_s; /* PLL mode control: integer or fraction */
> +	u8 sdm_en;
> +	u8 div;
> +	u8 int_n; /* integer N PLL */
> +	u32 ref_clk; /* dphy reference clock, unit: MHz */
> +	u32 freq; /* panel config, unit: KHz */
> +	u32 fvco;
> +	u32 potential_fvco;
> +	u32 nint; /* sigma delta modulator NINT control */
> +	u32 kint; /* sigma delta modulator KINT control */
> +	u8 lpf_sel; /* low pass filter control */
> +	u8 out_sel; /* post divider control */
> +	u8 vco_band; /* vco range */
> +	u8 det_delay;
> +
> +	struct pll_reg reg;
> +};
> +
> +struct dsi_context;
> +
> +int dphy_pll_config(struct dsi_context *ctx);
> +void dphy_timing_config(struct dsi_context *ctx);
> +
> +#endif /* _MEGACORES_PLL_H_ */
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_=
drm.c
> index c626c6caf..1613b5db3 100644
> --- a/drivers/gpu/drm/sprd/sprd_drm.c
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -192,6 +192,7 @@ static struct platform_driver sprd_drm_driver =3D {
>  static struct platform_driver *sprd_drm_drivers[]  =3D {
>  	&sprd_drm_driver,
>  	&sprd_dpu_driver,
> +	&sprd_dsi_driver,
>  };
> =20
>  static int __init sprd_drm_init(void)
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_=
drm.h
> index 85d4a8b9f..95d1b972f 100644
> --- a/drivers/gpu/drm/sprd/sprd_drm.h
> +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> @@ -14,5 +14,6 @@ struct sprd_drm {
>  };
> =20
>  extern struct platform_driver sprd_dpu_driver;
> +extern struct platform_driver sprd_dsi_driver;
> =20
>  #endif /* _SPRD_DRM_H_ */
> diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_=
dsi.c
> new file mode 100644
> index 000000000..d892b1934
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> @@ -0,0 +1,1132 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_graph.h>
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "sprd_drm.h"
> +#include "sprd_dpu.h"
> +#include "sprd_dsi.h"
> +#include "dw_dsi_ctrl.h"
> +#include "dw_dsi_ctrl_ppi.h"
> +
> +#define encoder_to_dsi(encoder) \
> +	container_of(encoder, struct sprd_dsi, encoder)
> +#define host_to_dsi(host) \
> +	container_of(host, struct sprd_dsi, host)
> +#define connector_to_dsi(connector) \
> +	container_of(connector, struct sprd_dsi, connector)
> +
> +static int regmap_tst_io_write(void *context, u32 reg, u32 val)
> +{
> +	struct sprd_dsi *dsi =3D context;
> +	struct dsi_context *ctx =3D &dsi->ctx;
> +
> +	if (val > 0xff || reg > 0xff)
> +		return -EINVAL;
> +
> +	drm_dbg(dsi->drm, "reg =3D 0x%02x, val =3D 0x%02x\n", reg, val);
> +
> +	dsi_phy_test_en(ctx, 1);
> +	dsi_phy_test_din(ctx, reg);
> +	dsi_phy_test_clk(ctx, 1);
> +	dsi_phy_test_clk(ctx, 0);
> +	dsi_phy_test_en(ctx, 0);
> +	dsi_phy_test_din(ctx, val);
> +	dsi_phy_test_clk(ctx, 1);
> +	dsi_phy_test_clk(ctx, 0);
> +
> +	return 0;
> +}
> +
> +static int regmap_tst_io_read(void *context, u32 reg, u32 *val)
> +{
> +	struct sprd_dsi *dsi =3D context;
> +	struct dsi_context *ctx =3D &dsi->ctx;
> +	int ret;
> +
> +	if (reg > 0xff)
> +		return -EINVAL;
> +
> +	dsi_phy_test_en(ctx, 1);
> +	dsi_phy_test_din(ctx, reg);
> +	dsi_phy_test_clk(ctx, 1);
> +	dsi_phy_test_clk(ctx, 0);
> +	dsi_phy_test_en(ctx, 0);
> +
> +	udelay(1);
> +
> +	ret =3D dsi_phy_test_dout(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D ret;
> +
> +	drm_dbg(dsi->drm, "reg =3D 0x%02x, val =3D 0x%02x\n", reg, *val);
> +	return 0;
> +}
> +
> +static struct regmap_bus regmap_tst_io =3D {
> +	.reg_write =3D regmap_tst_io_write,
> +	.reg_read =3D regmap_tst_io_read,
> +};
> +
> +static const struct regmap_config byte_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +};
> +
> +static int dphy_wait_pll_locked(struct dsi_context *ctx)
> +{
> +	struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> +	int i;
> +
> +	for (i =3D 0; i < 50000; i++) {
> +		if (dsi_phy_is_pll_locked(ctx))
> +			return 0;
> +		udelay(3);
> +	}
> +
> +	drm_err(dsi->drm, "dphy pll can not be locked\n");
> +	return -ETIMEDOUT;
> +}
> +
> +static int dsi_wait_tx_payload_fifo_empty(struct dsi_context *ctx)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < 5000; i++) {
> +		if (dsi_is_tx_payload_fifo_empty(ctx))
> +			return 0;
> +		udelay(1);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int dsi_wait_tx_cmd_fifo_empty(struct dsi_context *ctx)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < 5000; i++) {
> +		if (dsi_is_tx_cmd_fifo_empty(ctx))
> +			return 0;
> +		udelay(1);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int dsi_wait_rd_resp_completed(struct dsi_context *ctx)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < 10000; i++) {
> +		if (dsi_is_bta_returned(ctx))
> +			return 0;
> +		udelay(10);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static u16 calc_bytes_per_pixel_x100(int coding)
> +{
> +	u16 Bpp_x100;
> +
> +	switch (coding) {
> +	case COLOR_CODE_16BIT_CONFIG1:
> +	case COLOR_CODE_16BIT_CONFIG2:
> +	case COLOR_CODE_16BIT_CONFIG3:
> +		Bpp_x100 =3D 200;
> +		break;
> +	case COLOR_CODE_18BIT_CONFIG1:
> +	case COLOR_CODE_18BIT_CONFIG2:
> +		Bpp_x100 =3D 225;
> +		break;
> +	case COLOR_CODE_24BIT:
> +		Bpp_x100 =3D 300;
> +		break;
> +	case COLOR_CODE_COMPRESSTION:
> +		Bpp_x100 =3D 100;
> +		break;
> +	case COLOR_CODE_20BIT_YCC422_LOOSELY:
> +		Bpp_x100 =3D 250;
> +		break;
> +	case COLOR_CODE_24BIT_YCC422:
> +		Bpp_x100 =3D 300;
> +		break;
> +	case COLOR_CODE_16BIT_YCC422:
> +		Bpp_x100 =3D 200;
> +		break;
> +	case COLOR_CODE_30BIT:
> +		Bpp_x100 =3D 375;
> +		break;
> +	case COLOR_CODE_36BIT:
> +		Bpp_x100 =3D 450;
> +		break;
> +	case COLOR_CODE_12BIT_YCC420:
> +		Bpp_x100 =3D 150;
> +		break;
> +	default:
> +		DRM_ERROR("invalid color coding");
> +		Bpp_x100 =3D 0;
> +		break;
> +	}
> +
> +	return Bpp_x100;
> +}
> +
> +static u8 calc_video_size_step(int coding)
> +{
> +	u8 video_size_step;
> +
> +	switch (coding) {
> +	case COLOR_CODE_16BIT_CONFIG1:
> +	case COLOR_CODE_16BIT_CONFIG2:
> +	case COLOR_CODE_16BIT_CONFIG3:
> +	case COLOR_CODE_18BIT_CONFIG1:
> +	case COLOR_CODE_18BIT_CONFIG2:
> +	case COLOR_CODE_24BIT:
> +	case COLOR_CODE_COMPRESSTION:
> +		return video_size_step =3D 1;
> +	case COLOR_CODE_20BIT_YCC422_LOOSELY:
> +	case COLOR_CODE_24BIT_YCC422:
> +	case COLOR_CODE_16BIT_YCC422:
> +	case COLOR_CODE_30BIT:
> +	case COLOR_CODE_36BIT:
> +	case COLOR_CODE_12BIT_YCC420:
> +		return video_size_step =3D 2;
> +	default:
> +		DRM_ERROR("invalid color coding");
> +		return 0;
> +	}
> +}
> +
> +static u16 round_video_size(int coding, u16 video_size)
> +{
> +	switch (coding) {
> +	case COLOR_CODE_16BIT_YCC422:
> +	case COLOR_CODE_24BIT_YCC422:
> +	case COLOR_CODE_20BIT_YCC422_LOOSELY:
> +	case COLOR_CODE_12BIT_YCC420:
> +		/* round up active H pixels to a multiple of 2 */
> +		if ((video_size % 2) !=3D 0)
> +			video_size +=3D 1;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return video_size;
> +}
> +
> +#define SPRD_MIPI_DSI_FMT_DSC 0xff
> +static u32 fmt_to_coding(u32 fmt)
> +{
> +	switch (fmt) {
> +	case MIPI_DSI_FMT_RGB565:
> +		return COLOR_CODE_16BIT_CONFIG1;
> +	case MIPI_DSI_FMT_RGB666:
> +	case MIPI_DSI_FMT_RGB666_PACKED:
> +		return COLOR_CODE_18BIT_CONFIG1;
> +	case MIPI_DSI_FMT_RGB888:
> +		return COLOR_CODE_24BIT;
> +	case SPRD_MIPI_DSI_FMT_DSC:
> +		return COLOR_CODE_COMPRESSTION;
> +	default:
> +		DRM_ERROR("Unsupported format (%d)\n", fmt);
> +		return COLOR_CODE_24BIT;
> +	}
> +}
> +
> +#define ns_to_cycle(ns, byte_clk) \
> +	DIV_ROUND_UP((ns) * (byte_clk), 1000000)
> +
> +static void sprd_dsi_init(struct dsi_context *ctx)
> +{
> +	u16 data_hs2lp, data_lp2hs, clk_hs2lp, clk_lp2hs;
> +	u16 max_rd_time;
> +	int div;
> +
> +	dsi_power_enable(ctx, 0);
> +	dsi_int0_mask(ctx, 0xffffffff);
> +	dsi_int1_mask(ctx, 0xffffffff);
> +	dsi_cmd_mode(ctx);
> +	dsi_eotp_rx_en(ctx, 0);
> +	dsi_eotp_tx_en(ctx, 0);
> +	dsi_ecc_rx_en(ctx, 1);
> +	dsi_crc_rx_en(ctx, 1);
> +	dsi_bta_en(ctx, 1);
> +	dsi_video_vcid(ctx, 0);
> +	dsi_rx_vcid(ctx, 0);
> +
> +	div =3D DIV_ROUND_UP(ctx->byte_clk, ctx->esc_clk);
> +	dsi_tx_escape_division(ctx, div);
> +
> +	max_rd_time =3D ns_to_cycle(ctx->max_rd_time, ctx->byte_clk);
> +	dsi_max_read_time(ctx, max_rd_time);
> +
> +	data_hs2lp =3D ns_to_cycle(ctx->data_hs2lp, ctx->byte_clk);
> +	data_lp2hs =3D ns_to_cycle(ctx->data_lp2hs, ctx->byte_clk);
> +	clk_hs2lp =3D ns_to_cycle(ctx->clk_hs2lp, ctx->byte_clk);
> +	clk_lp2hs =3D ns_to_cycle(ctx->clk_lp2hs, ctx->byte_clk);
> +	dsi_datalane_hs2lp_config(ctx, data_hs2lp);
> +	dsi_datalane_lp2hs_config(ctx, data_lp2hs);
> +	dsi_clklane_hs2lp_config(ctx, clk_hs2lp);
> +	dsi_clklane_lp2hs_config(ctx, clk_lp2hs);
> +
> +	dsi_power_enable(ctx, 1);
> +}
> +
> +/*
> + * Free up resources and shutdown host controller and PHY
> + */
> +static void sprd_dsi_fini(struct dsi_context *ctx)
> +{
> +	dsi_int0_mask(ctx, 0xffffffff);
> +	dsi_int1_mask(ctx, 0xffffffff);
> +	dsi_power_enable(ctx, 0);
> +}
> +
> +/*
> + * If not in burst mode, it will compute the video and null packet sizes
> + * according to necessity.
> + * Configure timers for data lanes and/or clock lane to return to LP when
> + * bandwidth is not filled by data.
> + */
> +static int sprd_dsi_dpi_video(struct dsi_context *ctx)
> +{
> +	struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> +	struct videomode *vm =3D &ctx->vm;

Strictly speaking, there's nothing that guarantees that the preferred
mode is the one you're going to use there. You should use the mode that
is given to you through the connector state.

Maxime

--w3cv22m73ksns7zl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFsiMQAKCRDj7w1vZxhR
xdKkAQDVx3DX9DfvqX3vomhmmuJy+XhrLzBKWaAqrEWZkE0rXwD+NT4jGyH7GmsH
UM7Z7qKhVIsXA+kDPtlyVZs5IUWJpw0=
=vf41
-----END PGP SIGNATURE-----

--w3cv22m73ksns7zl--

--===============0382322495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0382322495==--
