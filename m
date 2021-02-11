Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38C3186BE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 10:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49576EDA4;
	Thu, 11 Feb 2021 09:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866446ED7D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 09:02:45 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b2so7078175lfq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 01:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qTGM0DFLJrA54ptUuWkzMS4u2X3Ib4icfchW2yaGQC0=;
 b=Dk+yWaXpvYfBTvQ1KwG8eSN3wga755XmxeFQOkLBt17pHwDRkUWi2g2k27kEZ3CnAX
 4jXExWznesoLvDE/gP0wZsQ7lXBVRaLIkTSBkTnCtADq9C3W0Q1Yzl4D/DqTqEbTnjlX
 3bdHMZeDib1+p/jnYl8W53Yrdv9ZYrO00R0CQMPajyySkiE73mtidrnGFh1i9+zbeWfp
 DxVFckaax8HbX2B7LW9fTDuCc0UgKLmT2/m7xqZYWkEbdtRpaOqHnwJjdz7iKeOv2H+6
 Mp0/o5fwoCoR8Fs67eIIFQr1VO3T5hYGRFdsiXkDOQ3Gei309kJKfjTIjZpUWiWlgcPQ
 k+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qTGM0DFLJrA54ptUuWkzMS4u2X3Ib4icfchW2yaGQC0=;
 b=oF9SciU4iHz/IzC/toduk/syMEUGgkU+5c04uvhI0mLS0Ql5wblNOS20KgFunjbeAX
 iAzOY084XUiMCGbb3hcbP6x8pL1+cNm+Nf9kH2h9W6Pi+lb+mFvtJ/YzlDFXObf4hXnn
 mm0MHFZPtTPzAu9VHDhZBsTf0WnCQePG6Qmgn8c7W5IVW8ocO868/xnC9Gkf3KybuqDB
 qg8D86BSlPTD8bacaFFTMblSnenCDhyni1Z8CqMRmoCU3EBrLZNcbVlnl9BdomAPUpT7
 M7wKMPr4YdOzGg6sftdAIcevxVJqEh8ow3IB7miId+/CBJHc73BNjF3VvGILWG32ujD6
 GCpw==
X-Gm-Message-State: AOAM531aKijhRp+YU0sQBD4PxU13Ri6Lqq2NSILUUE+Qabry+HlerW5q
 pd4Qs6egDme1LYb+dCktXj6pJj+mm1U7wKxeVkU=
X-Google-Smtp-Source: ABdhPJyRM7xm2frrYpiXSXup8g17Wc3vWCTIfIe/pb84K3cpwY7bh3ob+wynFFiOaEtPoOhJqGOH2nzx0winflbV3/Y=
X-Received: by 2002:a19:80d1:: with SMTP id b200mr2779729lfd.184.1613034163486; 
 Thu, 11 Feb 2021 01:02:43 -0800 (PST)
MIME-Version: 1.0
References: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
 <1609854367-2720-7-git-send-email-kevin3.tang@gmail.com>
 <YBq1QL9BV1oNLRjv@phenom.ffwll.local>
In-Reply-To: <YBq1QL9BV1oNLRjv@phenom.ffwll.local>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Thu, 11 Feb 2021 17:02:30 +0800
Message-ID: <CAFPSGXa14EXyPoPhqVDEdd7_=mPSfg6G=2MTjjY_Kd9gfNfOWA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
To: Kevin Tang <kevin3.tang@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
X-Mailman-Approved-At: Thu, 11 Feb 2021 09:18:17 +0000
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
Cc: a.hajda@samsung.com, Angelo.Ribeiro@synopsys.com,
 Laurent.pinchart@ideasonboard.com, narmstrong@baylibre.com
Content-Type: multipart/mixed; boundary="===============0260517868=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0260517868==
Content-Type: multipart/alternative; boundary="0000000000005343f805bb0bc869"

--0000000000005343f805bb0bc869
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel@ffwll.ch> =E4=BA=8E2021=E5=B9=B42=E6=9C=883=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=8810:37=E5=86=99=E9=81=93=EF=BC=9A

> On Tue, Jan 05, 2021 at 09:46:07PM +0800, Kevin Tang wrote:
> > Adds dsi host controller support for the Unisoc's display subsystem.
> > Adds dsi phy support for the Unisoc's display subsystem.
> > Only MIPI DSI Displays supported, DP/TV/HMDI will be support
> > in the feature.
> >
> > v1:
> >   - Remove dphy and dsi graph binding, merge the dphy driver into the
> dsi.
> >
> > v2:
> >   - Use drm_xxx to replace all DRM_XXX.
> >   - Use kzalloc to replace devm_kzalloc for sprd_dsi structure init.
>
> Similar comments about kzalloc as with the previous sprd patch. Otherwise
> just two questions:
>
> dw-dsi is named at least like the synopsys driver we have already,
> wouldn't this fit into the drm/bridge driver we have? Ack from bridge
> people (just cc everyone for that dw_dsi driver to get their attention)
> would be good.
>
dw dsi controller is not a standard synopsys ip, we have updated a lot on
the basic ip version, the entire control register is different.
i think this is a good suggestion , i will cc to drm/bridge reviewers and
maintainers, thank you.

>
> Other thing is the header definitions for the registers. bitfields and
> unions are rather unusual for this, and to my understanding might blow up
> on different compilers. Results in rather verbose and unusual code, but
> since you only read/write full bytes at least it should be all save. Imo
> not a worry.
>
 We have been using this way for many years and it seems that we haven=E2=
=80=99t
found any problems,
it does seem that there will be some unused bitfields, i don=E2=80=99t know=
 if this
will be a problem...

>
> See below for the kzalloc comments.
>
Got it.

> -Daniel
>
> > ---
> >  drivers/gpu/drm/sprd/Makefile          |    7 +-
> >  drivers/gpu/drm/sprd/dw_dsi_ctrl.c     |  794 +++++++++++++++++
> >  drivers/gpu/drm/sprd/dw_dsi_ctrl.h     | 1475
> ++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c |  157 ++++
> >  drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h |   26 +
> >  drivers/gpu/drm/sprd/megacores_pll.c   |  317 +++++++
> >  drivers/gpu/drm/sprd/megacores_pll.h   |  146 ++++
> >  drivers/gpu/drm/sprd/sprd_drm.c        |    1 +
> >  drivers/gpu/drm/sprd/sprd_drm.h        |    1 +
> >  drivers/gpu/drm/sprd/sprd_dsi.c        | 1162 ++++++++++++++++++++++++=
+
> >  drivers/gpu/drm/sprd/sprd_dsi.h        |  107 +++
> >  11 files changed, 4191 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.c
> >  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.h
> >  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
> >  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
> >  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
> >  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.h
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
> >
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > index 6c25bfa..d49f497 100644
> > --- a/drivers/gpu/drm/sprd/Makefile
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -1,5 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  obj-y :=3D sprd_drm.o \
> > -     sprd_dpu.o
> > -
> > +     sprd_dpu.o \
> > +     sprd_dsi.o \
> > +     dw_dsi_ctrl.o \
> > +     dw_dsi_ctrl_ppi.o \
> > +     megacores_pll.o
> > diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl.c
> b/drivers/gpu/drm/sprd/dw_dsi_ctrl.c
> > new file mode 100644
> > index 0000000..1034aba
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl.c
> > @@ -0,0 +1,794 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/init.h>
> > +#include <linux/delay.h>
> > +#include <linux/module.h>
> > +
> > +#include "dw_dsi_ctrl.h"
> > +
> > +/*
> > + * Modify power status of DSI Host core
> > + */
> > +void dsi_power_enable(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(enable, &reg->SOFT_RESET);
> > +}
> > +/*
> > + * Enable/disable DPI video mode
> > + */
> > +void dsi_video_mode(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(0, &reg->DSI_MODE_CFG);
> > +}
> > +/*
> > + * Enable command mode (Generic interface)
> > + */
> > +void dsi_cmd_mode(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(1, &reg->DSI_MODE_CFG);
> > +}
> > +
> > +bool dsi_is_cmd_mode(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     return readl(&reg->DSI_MODE_CFG);
> > +}
> > +/*
> > + * Configure the read back virtual channel for the generic interface
> > + */
> > +void dsi_rx_vcid(struct dsi_context *ctx, u8 vc)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x1C virtual_channel_id;
> > +
> > +     virtual_channel_id.val =3D readl(&reg->VIRTUAL_CHANNEL_ID);
> > +     virtual_channel_id.bits.gen_rx_vcid =3D vc;
> > +
> > +     writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
> > +}
> > +/*
> > + * Write the DPI video virtual channel destination
> > + */
> > +void dsi_video_vcid(struct dsi_context *ctx, u8 vc)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x1C virtual_channel_id;
> > +
> > +     virtual_channel_id.val =3D readl(&reg->VIRTUAL_CHANNEL_ID);
> > +     virtual_channel_id.bits.video_pkt_vcid =3D vc;
> > +
> > +     writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
> > +}
> > +/*
> > + * Set DPI video mode type (burst/non-burst - with sync pulses or
> events)
> > + */
> > +void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mode)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x38 vid_mode_cfg;
> > +
> > +     vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> > +     vid_mode_cfg.bits.vid_mode_type =3D mode;
> > +
> > +     writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> > +}
> > +/*
> > + * Set DPI video color coding
> > + */
> > +void dsi_dpi_color_coding(struct dsi_context *ctx, int coding)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x20 dpi_video_format;
> > +
> > +     dpi_video_format.val =3D readl(&reg->DPI_VIDEO_FORMAT);
> > +     dpi_video_format.bits.dpi_video_mode_format =3D coding;
> > +
> > +     writel(dpi_video_format.val, &reg->DPI_VIDEO_FORMAT);
> > +}
> > +/*
> > + * Configure the Horizontal Line time
> > + * param "byte_cycle" taken to transmit the total of the horizontal li=
ne
> > + */
> > +void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x2C video_line_time;
> > +
> > +     video_line_time.val =3D readl(&reg->VIDEO_LINE_TIME);
> > +     video_line_time.bits.video_line_time =3D byte_cycle;
> > +
> > +     writel(video_line_time.val, &reg->VIDEO_LINE_TIME);
> > +}
> > +/*
> > + * Configure the Horizontal back porch time
> > + * param "byte_cycle" taken to transmit the horizontal back porch
> > + */
> > +void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x28 video_line_hblk_time;
> > +
> > +     video_line_hblk_time.val =3D readl(&reg->VIDEO_LINE_HBLK_TIME);
> > +     video_line_hblk_time.bits.video_line_hbp_time =3D byte_cycle;
> > +
> > +     writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
> > +}
> > +/*
> > + * Configure the Horizontal sync time,
> > + * param "byte_cycle" taken to transmit the horizontal sync
> > + */
> > +void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x28 video_line_hblk_time;
> > +
> > +     video_line_hblk_time.val =3D readl(&reg->VIDEO_LINE_HBLK_TIME);
> > +     video_line_hblk_time.bits.video_line_hsa_time =3D byte_cycle;
> > +
> > +     writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
> > +}
> > +/*
> > + * Configure the vertical active lines of the video stream
> > + */
> > +void dsi_dpi_vact(struct dsi_context *ctx, u16 lines)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x34 video_active_lines;
> > +
> > +     video_active_lines.val =3D readl(&reg->VIDEO_VACTIVE_LINES);
> > +     video_active_lines.bits.vactive_lines =3D lines;
> > +
> > +     writel(video_active_lines.val, &reg->VIDEO_VACTIVE_LINES);
> > +}
> > +
> > +void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x30 video_vblk_lines;
> > +
> > +     video_vblk_lines.val =3D readl(&reg->VIDEO_VBLK_LINES);
> > +     video_vblk_lines.bits.vfp_lines =3D lines;
> > +
> > +     writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
> > +}
> > +
> > +void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x30 video_vblk_lines;
> > +
> > +     video_vblk_lines.val =3D readl(&reg->VIDEO_VBLK_LINES);
> > +     video_vblk_lines.bits.vbp_lines =3D lines;
> > +
> > +     writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
> > +}
> > +
> > +void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x30 video_vblk_lines;
> > +
> > +     video_vblk_lines.val =3D readl(&reg->VIDEO_VBLK_LINES);
> > +     video_vblk_lines.bits.vsa_lines =3D lines;
> > +
> > +     writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
> > +}
> > +
> > +void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x38 vid_mode_cfg;
> > +
> > +     vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> > +
> > +     vid_mode_cfg.bits.lp_hfp_en =3D enable;
> > +     vid_mode_cfg.bits.lp_hbp_en =3D enable;
> > +
> > +     writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> > +}
> > +/*
> > + * Enable return to low power mode inside vertical active lines period=
s
> when
> > + * timing allows
> > + */
> > +void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x38 vid_mode_cfg;
> > +
> > +     vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> > +
> > +     vid_mode_cfg.bits.lp_vact_en =3D enable;
> > +     vid_mode_cfg.bits.lp_vfp_en =3D enable;
> > +     vid_mode_cfg.bits.lp_vbp_en =3D enable;
> > +     vid_mode_cfg.bits.lp_vsa_en =3D enable;
> > +
> > +     writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> > +}
> > +/*
> > + * Enable FRAME BTA ACK
> > + */
> > +void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x38 vid_mode_cfg;
> > +
> > +     vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> > +     vid_mode_cfg.bits.frame_bta_ack_en =3D enable;
> > +
> > +     writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> > +}
> > +/*
> > + * Write no of chunks to core - taken into consideration only when
> multi packet
> > + * is enabled
> > + */
> > +void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 num)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x24 video_pkt_config;
> > +
> > +     video_pkt_config.val =3D readl(&reg->VIDEO_PKT_CONFIG);
> > +     video_pkt_config.bits.video_line_chunk_num =3D num;
> > +
> > +     writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
> > +}
> > +/*
> > + * Write the null packet size - will only be taken into account when
> null
> > + * packets are enabled.
> > + */
> > +void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 size)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xC0 video_nullpkt_size;
> > +
> > +     video_nullpkt_size.val =3D readl(&reg->VIDEO_NULLPKT_SIZE);
> > +     video_nullpkt_size.bits.video_nullpkt_size =3D size;
> > +
> > +     writel(video_nullpkt_size.val, &reg->VIDEO_NULLPKT_SIZE);
> > +}
> > +/*
> > + * Write video packet size. obligatory for sending video
> > + */
> > +void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 size)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x24 video_pkt_config;
> > +
> > +     video_pkt_config.val =3D readl(&reg->VIDEO_PKT_CONFIG);
> > +     video_pkt_config.bits.video_pkt_size =3D size;
> > +
> > +     writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
> > +}
> > +/*
> > + * Specifiy the size of the packet memory write start/continue
> > + */
> > +void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xC4 dcs_wm_pkt_size;
> > +
> > +     dcs_wm_pkt_size.val =3D readl(&reg->DCS_WM_PKT_SIZE);
> > +     dcs_wm_pkt_size.bits.dcs_wm_pkt_size =3D size;
> > +
> > +     writel(dcs_wm_pkt_size.val, &reg->DCS_WM_PKT_SIZE);
> > +}
> > +/*
> > + * Enable tear effect acknowledge
> > + */
> > +void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x68 cmd_mode_cfg;
> > +
> > +     cmd_mode_cfg.val =3D readl(&reg->CMD_MODE_CFG);
> > +     cmd_mode_cfg.bits.tear_fx_en =3D enable;
> > +
> > +     writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
> > +}
> > +/*
> > + * Set DCS command packet transmission to transmission type
> > + */
> > +void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x68 cmd_mode_cfg;
> > +
> > +     cmd_mode_cfg.val =3D readl(&reg->CMD_MODE_CFG);
> > +
> > +     cmd_mode_cfg.bits.gen_sw_0p_tx =3D enable;
> > +     cmd_mode_cfg.bits.gen_sw_1p_tx =3D enable;
> > +     cmd_mode_cfg.bits.gen_sw_2p_tx =3D enable;
> > +     cmd_mode_cfg.bits.gen_lw_tx =3D enable;
> > +     cmd_mode_cfg.bits.dcs_sw_0p_tx =3D enable;
> > +     cmd_mode_cfg.bits.dcs_sw_1p_tx =3D enable;
> > +     cmd_mode_cfg.bits.dcs_lw_tx =3D enable;
> > +     cmd_mode_cfg.bits.max_rd_pkt_size =3D enable;
> > +
> > +     cmd_mode_cfg.bits.gen_sr_0p_tx =3D enable;
> > +     cmd_mode_cfg.bits.gen_sr_1p_tx =3D enable;
> > +     cmd_mode_cfg.bits.gen_sr_2p_tx =3D enable;
> > +     cmd_mode_cfg.bits.dcs_sr_0p_tx =3D enable;
> > +
> > +     writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
> > +}
> > +/*
> > + * Set DCS read command packet transmission to transmission type
> > + */
> > +void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x38 vid_mode_cfg;
> > +
> > +     vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
> > +     vid_mode_cfg.bits.lp_cmd_en =3D enable;
> > +
> > +     writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
> > +}
> > +
> > +/*
> > + * Write command header in the generic interface (which also sends DCS
> commands) as a subset
> > + */
> > +void dsi_set_packet_header(struct dsi_context *ctx,
> > +                                u8 vc,
> > +                                u8 type,
> > +                                u8 wc_lsb,
> > +                                u8 wc_msb)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x6C gen_hdr;
> > +
> > +     gen_hdr.bits.gen_dt =3D type;
> > +     gen_hdr.bits.gen_vc =3D vc;
> > +     gen_hdr.bits.gen_wc_lsbyte =3D wc_lsb;
> > +     gen_hdr.bits.gen_wc_msbyte =3D wc_msb;
> > +
> > +     writel(gen_hdr.val, &reg->GEN_HDR);
> > +}
> > +/*
> > + * Write the payload of the long packet commands
> > + */
> > +void dsi_set_packet_payload(struct dsi_context *ctx, u32 payload)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(payload, &reg->GEN_PLD_DATA);
> > +}
> > +/*
> > + * Read the payload of the long packet commands
> > + */
> > +u32 dsi_get_rx_payload(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     return readl(&reg->GEN_PLD_DATA);
> > +}
> > +
> > +/*
> > + * Enable Bus Turn-around request
> > + */
> > +void dsi_bta_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(enable, &reg->TA_EN);
> > +}
> > +/*
> > + * Enable EOTp reception
> > + */
> > +void dsi_eotp_rx_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xBC eotp_en;
> > +
> > +     eotp_en.val =3D readl(&reg->EOTP_EN);
> > +     eotp_en.bits.rx_eotp_en =3D enable;
> > +
> > +     writel(eotp_en.val, &reg->EOTP_EN);
> > +}
> > +/*
> > + * Enable EOTp transmission
> > + */
> > +void dsi_eotp_tx_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xBC eotp_en;
> > +
> > +     eotp_en.val =3D readl(&reg->EOTP_EN);
> > +     eotp_en.bits.tx_eotp_en =3D enable;
> > +
> > +     writel(eotp_en.val, &reg->EOTP_EN);
> > +}
> > +/*
> > + * Enable ECC reception, error correction and reporting
> > + */
> > +void dsi_ecc_rx_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xB4 rx_pkt_check_config;
> > +
> > +     rx_pkt_check_config.val =3D readl(&reg->RX_PKT_CHECK_CONFIG);
> > +     rx_pkt_check_config.bits.rx_pkt_ecc_en =3D enable;
> > +
> > +     writel(rx_pkt_check_config.val, &reg->RX_PKT_CHECK_CONFIG);
> > +}
> > +/*
> > + * Enable CRC reception, error reporting
> > + */
> > +void dsi_crc_rx_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xB4 rx_pkt_check_config;
> > +
> > +     rx_pkt_check_config.val =3D readl(&reg->RX_PKT_CHECK_CONFIG);
> > +     rx_pkt_check_config.bits.rx_pkt_crc_en =3D enable;
> > +
> > +     writel(rx_pkt_check_config.val, &reg->RX_PKT_CHECK_CONFIG);
> > +}
> > +/*
> > + * Get status of read command
> > + */
> > +bool dsi_is_bta_returned(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x98 cmd_mode_status;
> > +
> > +     cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> > +
> > +     return cmd_mode_status.bits.gen_cmd_rdcmd_done;
> > +}
> > +/*
> > + * Get the FULL status of generic read payload fifo
> > + */
> > +bool dsi_is_rx_payload_fifo_full(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x98 cmd_mode_status;
> > +
> > +     cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> > +
> > +     return cmd_mode_status.bits.gen_cmd_rdata_fifo_full;
> > +}
> > +/*
> > + * Get the EMPTY status of generic read payload fifo
> > + */
> > +bool dsi_is_rx_payload_fifo_empty(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x98 cmd_mode_status;
> > +
> > +     cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> > +
> > +     return cmd_mode_status.bits.gen_cmd_rdata_fifo_empty;
> > +}
> > +/*
> > + * Get the FULL status of generic write payload fifo
> > + */
> > +bool dsi_is_tx_payload_fifo_full(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x98 cmd_mode_status;
> > +
> > +     cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> > +
> > +     return cmd_mode_status.bits.gen_cmd_wdata_fifo_full;
> > +}
> > +/*
> > + * Get the EMPTY status of generic write payload fifo
> > + */
> > +bool dsi_is_tx_payload_fifo_empty(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x98 cmd_mode_status;
> > +
> > +     cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> > +
> > +     return cmd_mode_status.bits.gen_cmd_wdata_fifo_empty;
> > +}
> > +/*
> > + * Get the EMPTY status of generic command fifo
> > + */
> > +bool dsi_is_tx_cmd_fifo_empty(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x98 cmd_mode_status;
> > +
> > +     cmd_mode_status.val =3D readl(&reg->CMD_MODE_STATUS);
> > +
> > +     return cmd_mode_status.bits.gen_cmd_cmd_fifo_empty;
> > +}
> > +/*
> > + * DPI interface signal delay config
> > + * param byte_cycle period for waiting after controller receiving HSYN=
C
> from
> > + * DPI interface to start read pixel data from memory.
> > + */
> > +void dsi_dpi_sig_delay(struct dsi_context *ctx, u16 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xD0 video_sig_delay_config;
> > +
> > +     video_sig_delay_config.val =3D readl(&reg->VIDEO_SIG_DELAY_CONFIG=
);
> > +     video_sig_delay_config.bits.video_sig_delay =3D byte_cycle;
> > +
> > +     writel(video_sig_delay_config.val, &reg->VIDEO_SIG_DELAY_CONFIG);
> > +}
> > +/*
> > + * Configure how many cycles of byte clock would the PHY module take
> > + * to switch data lane from high speed to low power
> > + */
> > +void dsi_datalane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle=
)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xAC phy_datalane_time_config;
> > +
> > +     phy_datalane_time_config.val =3D
> readl(&reg->PHY_DATALANE_TIME_CONFIG);
> > +     phy_datalane_time_config.bits.phy_datalane_hs_to_lp_time =3D
> byte_cycle;
> > +
> > +     writel(phy_datalane_time_config.val,
> &reg->PHY_DATALANE_TIME_CONFIG);
> > +}
> > +/*
> > + * Configure how many cycles of byte clock would the PHY module take
> > + * to switch the data lane from to low power high speed
> > + */
> > +void dsi_datalane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle=
)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xAC phy_datalane_time_config;
> > +
> > +     phy_datalane_time_config.val =3D
> readl(&reg->PHY_DATALANE_TIME_CONFIG);
> > +     phy_datalane_time_config.bits.phy_datalane_lp_to_hs_time =3D
> byte_cycle;
> > +
> > +     writel(phy_datalane_time_config.val,
> &reg->PHY_DATALANE_TIME_CONFIG);
> > +}
> > +/*
> > + * Configure how many cycles of byte clock would the PHY module take
> > + * to switch clock lane from high speed to low power
> > + */
> > +void dsi_clklane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xA8 phy_clklane_time_config;
> > +
> > +     phy_clklane_time_config.val =3D readl(&reg->PHY_CLKLANE_TIME_CONF=
IG);
> > +     phy_clklane_time_config.bits.phy_clklane_hs_to_lp_time =3D
> byte_cycle;
> > +
> > +     writel(phy_clklane_time_config.val, &reg->PHY_CLKLANE_TIME_CONFIG=
);
> > +}
> > +/*
> > + * Configure how many cycles of byte clock would the PHY module take
> > + * to switch clock lane from to low power high speed
> > + */
> > +void dsi_clklane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xA8 phy_clklane_time_config;
> > +
> > +     phy_clklane_time_config.val =3D readl(&reg->PHY_CLKLANE_TIME_CONF=
IG);
> > +     phy_clklane_time_config.bits.phy_clklane_lp_to_hs_time =3D
> byte_cycle;
> > +
> > +     writel(phy_clklane_time_config.val, &reg->PHY_CLKLANE_TIME_CONFIG=
);
> > +}
> > +/*
> > + * Configure how many cycles of byte clock would the PHY module take
> > + * to turn the bus around to start receiving
> > + */
> > +void dsi_max_read_time(struct dsi_context *ctx, u16 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(byte_cycle, &reg->MAX_READ_TIME);
> > +}
> > +/*
> > + * Enable the automatic mechanism to stop providing clock in the clock
> > + * lane when time allows
> > + */
> > +void dsi_nc_clk_en(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x74 phy_clk_lane_lp_ctrl;
> > +
> > +     phy_clk_lane_lp_ctrl.val =3D readl(&reg->PHY_CLK_LANE_LP_CTRL);
> > +     phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en =3D enable;
> > +
> > +     writel(phy_clk_lane_lp_ctrl.val, &reg->PHY_CLK_LANE_LP_CTRL);
> > +}
> > +/*
> > + * Write transmission escape timeout
> > + * a safe guard so that the state machine would reset if transmission
> > + * takes too long
> > + */
> > +void dsi_tx_escape_division(struct dsi_context *ctx, u8 div)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(div, &reg->TX_ESC_CLK_CONFIG);
> > +}
> > +/*
> > + * Configure timeout divisions (so they would have more clock ticks)
> > + * div no of hs cycles before transiting back to LP in
> > + *  (lane_clk / div)
> > + */
> > +void dsi_timeout_clock_division(struct dsi_context *ctx, u8 div)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(div, &reg->TIMEOUT_CNT_CLK_CONFIG);
> > +}
> > +/*
> > + * Configure the Low power receive time out
> > + */
> > +void dsi_lp_rx_timeout(struct dsi_context *ctx, u16 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(byte_cycle, &reg->LRX_H_TO_CONFIG);
> > +}
> > +/*
> > + * Configure a high speed transmission time out
> > + */
> > +void dsi_hs_tx_timeout(struct dsi_context *ctx, u16 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(byte_cycle, &reg->HTX_TO_CONFIG);
> > +}
> > +/*
> > + * Get the error 0 interrupt register status
> > + */
> > +u32 dsi_int0_status(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x08 protocol_int_sts;
> > +
> > +     protocol_int_sts.val =3D readl(&reg->PROTOCOL_INT_STS);
> > +     writel(protocol_int_sts.val, &reg->PROTOCOL_INT_CLR);
> > +
> > +     if (protocol_int_sts.bits.dphy_errors_0)
> > +             drm_err(dsi->drm, "dphy_err: escape entry error\n");
> > +
> > +     if (protocol_int_sts.bits.dphy_errors_1)
> > +             drm_err(dsi->drm, "dphy_err: lp data transmission sync
> error\n");
> > +
> > +     if (protocol_int_sts.bits.dphy_errors_2)
> > +             drm_err(dsi->drm, "dphy_err: control error\n");
> > +
> > +     if (protocol_int_sts.bits.dphy_errors_3)
> > +             drm_err(dsi->drm, "dphy_err: LP0 contention error\n");
> > +
> > +     if (protocol_int_sts.bits.dphy_errors_4)
> > +             drm_err(dsi->drm, "dphy_err: LP1 contention error\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_0)
> > +             drm_err(dsi->drm, "ack_err: SoT error\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_1)
> > +             drm_err(dsi->drm, "ack_err: SoT Sync error\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_2)
> > +             drm_err(dsi->drm, "ack_err: EoT Sync error\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_3)
> > +             drm_err(dsi->drm, "ack_err: Escape Mode Entry Command
> error\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_4)
> > +             drm_err(dsi->drm, "ack_err: LP Transmit Sync error\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_5)
> > +             drm_err(dsi->drm, "ack_err: Peripheral Timeout error\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_6)
> > +             drm_err(dsi->drm, "ack_err: False Control error\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_7)
> > +             drm_err(dsi->drm, "ack_err: reserved (specific to
> device)\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_8)
> > +             drm_err(dsi->drm, "ack_err: ECC error, single-bit
> (corrected)\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_9)
> > +             drm_err(dsi->drm, "ack_err: ECC error, multi-bit (not
> corrected)\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_10)
> > +             drm_err(dsi->drm, "ack_err: checksum error (long packet
> only)\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_11)
> > +             drm_err(dsi->drm, "ack_err: not recognized DSI data
> type\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_12)
> > +             drm_err(dsi->drm, "ack_err: DSI VC ID Invalid\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_13)
> > +             drm_err(dsi->drm, "ack_err: invalid transmission
> length\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_14)
> > +             drm_err(dsi->drm, "ack_err: reserved (specific to
> device)\n");
> > +
> > +     if (protocol_int_sts.bits.ack_with_err_15)
> > +             drm_err(dsi->drm, "ack_err: DSI protocol violation\n");
> > +
> > +     return 0;
> > +}
> > +/*
> > + * Get the error 1 interrupt register status
> > + */
> > +u32 dsi_int1_status(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x10 internal_int_sts;
> > +     u32 status =3D 0;
> > +
> > +     internal_int_sts.val =3D readl(&reg->INTERNAL_INT_STS);
> > +     writel(internal_int_sts.val, &reg->INTERNAL_INT_CLR);
> > +
> > +     if (internal_int_sts.bits.receive_pkt_size_err)
> > +             drm_err(dsi->drm, "receive packet size error\n");
> > +
> > +     if (internal_int_sts.bits.eotp_not_receive_err)
> > +             drm_err(dsi->drm, "EoTp packet is not received\n");
> > +
> > +     if (internal_int_sts.bits.gen_cmd_cmd_fifo_wr_err)
> > +             drm_err(dsi->drm, "cmd header-fifo is full\n");
> > +
> > +     if (internal_int_sts.bits.gen_cmd_rdata_fifo_rd_err)
> > +             drm_err(dsi->drm, "cmd read-payload-fifo is empty\n");
> > +
> > +     if (internal_int_sts.bits.gen_cmd_rdata_fifo_wr_err)
> > +             drm_err(dsi->drm, "cmd read-payload-fifo is full\n");
> > +
> > +     if (internal_int_sts.bits.gen_cmd_wdata_fifo_wr_err)
> > +             drm_err(dsi->drm, "cmd write-payload-fifo is full\n");
> > +
> > +     if (internal_int_sts.bits.gen_cmd_wdata_fifo_rd_err)
> > +             drm_err(dsi->drm, "cmd write-payload-fifo is empty\n");
> > +
> > +     if (internal_int_sts.bits.dpi_pix_fifo_wr_err) {
> > +             drm_err(dsi->drm, "DPI pixel-fifo is full\n");
> > +             status |=3D DSI_INT_STS_NEED_SOFT_RESET;
> > +     }
> > +
> > +     if (internal_int_sts.bits.ecc_single_err)
> > +             drm_err(dsi->drm, "ECC single error in a received
> packet\n");
> > +
> > +     if (internal_int_sts.bits.ecc_multi_err)
> > +             drm_err(dsi->drm, "ECC multiple error in a received
> packet\n");
> > +
> > +     if (internal_int_sts.bits.crc_err)
> > +             drm_err(dsi->drm, "CRC error in the received packet
> payload\n");
> > +
> > +     if (internal_int_sts.bits.hs_tx_timeout)
> > +             drm_err(dsi->drm, "high-speed transmission timeout\n");
> > +
> > +     if (internal_int_sts.bits.lp_rx_timeout)
> > +             drm_err(dsi->drm, "low-power reception timeout\n");
> > +
> > +     return status;
> > +}
> > +/*
> > + * Configure MASK (hiding) of interrupts coming from error 0 source
> > + */
> > +void dsi_int0_mask(struct dsi_context *ctx, u32 mask)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(mask, &reg->MASK_PROTOCOL_INT);
> > +}
> > +/*
> > + * Configure MASK (hiding) of interrupts coming from error 1 source
> > + */
> > +void dsi_int1_mask(struct dsi_context *ctx, u32 mask)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(mask, &reg->MASK_INTERNAL_INT);
> > +}
> > diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl.h
> b/drivers/gpu/drm/sprd/dw_dsi_ctrl.h
> > new file mode 100644
> > index 0000000..ffba621
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl.h
> > @@ -0,0 +1,1475 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#ifndef _DW_DSI_CTRL_H_
> > +#define _DW_DSI_CTRL_H_
> > +
> > +#include <asm/types.h>
> > +
> > +#include "sprd_dsi.h"
> > +
> > +struct dsi_reg {
> > +     union _0x00 {
> > +             u32 val;
> > +             struct _DSI_VERSION {
> > +             u32 dsi_version: 16;
> > +             u32 reserved: 16;
> > +             } bits;
> > +     } DSI_VERSION;
> > +
> > +     union _0x04 {
> > +             u32 val;
> > +             struct _SOFT_RESET {
> > +             /*
> > +              * This bit configures the core either to work normal or =
to
> > +              * reset. It's default value is 0. After the core configu=
r-
> > +              * ation, to enable the mipi_dsi_host, set this register
> to 1.
> > +              * 1: power up     0: reset core
> > +              */
> > +             u32 dsi_soft_reset: 1;
> > +
> > +             u32 reserved: 31;
> > +             } bits;
> > +     } SOFT_RESET;
> > +
> > +     union _0x08 {
> > +             u32 val;
> > +             struct _PROTOCOL_INT_STS {
> > +             /* ErrEsc escape entry error from Lane 0 */
> > +             u32 dphy_errors_0: 1;
> > +
> > +             /* ErrSyncEsc low-power data transmission synchronization
> > +              * error from Lane 0
> > +              */
> > +             u32 dphy_errors_1: 1;
> > +
> > +             /* ErrControl error from Lane 0 */
> > +             u32 dphy_errors_2: 1;
> > +
> > +             /* ErrContentionLP0 LP0 contention error from Lane 0 */
> > +             u32 dphy_errors_3: 1;
> > +
> > +             /* ErrContentionLP1 LP1 contention error from Lane 0 */
> > +             u32 dphy_errors_4: 1;
> > +
> > +             /* debug mode protocol errors */
> > +             u32 protocol_debug_err: 11;
> > +
> > +             /* SoT error from the Acknowledge error report */
> > +             u32 ack_with_err_0: 1;
> > +
> > +             /* SoT Sync error from the Acknowledge error report */
> > +             u32 ack_with_err_1: 1;
> > +
> > +             /* EoT Sync error from the Acknowledge error report */
> > +             u32 ack_with_err_2: 1;
> > +
> > +             /* Escape Mode Entry Command error from the Acknowledge
> > +              * error report
> > +              */
> > +             u32 ack_with_err_3: 1;
> > +
> > +             /* LP Transmit Sync error from the Acknowledge error
> report */
> > +             u32 ack_with_err_4: 1;
> > +
> > +             /* Peripheral Timeout error from the Acknowledge error
> report */
> > +             u32 ack_with_err_5: 1;
> > +
> > +             /* False Control error from the Acknowledge error report =
*/
> > +             u32 ack_with_err_6: 1;
> > +
> > +             /* reserved (specific to device) from the Acknowledge err=
or
> > +              * report
> > +              */
> > +             u32 ack_with_err_7: 1;
> > +
> > +             /* ECC error, single-bit (detected and corrected) from th=
e
> > +              * Acknowledge error report
> > +              */
> > +             u32 ack_with_err_8: 1;
> > +
> > +             /* ECC error, multi-bit (detected, not corrected) from th=
e
> > +              * Acknowledge error report
> > +              */
> > +             u32 ack_with_err_9: 1;
> > +
> > +             /* checksum error (long packet only) from the Acknowledge
> > +              * error report
> > +              */
> > +             u32 ack_with_err_10: 1;
> > +
> > +             /* not recognized DSI data type from the Acknowledge erro=
r
> > +              * report
> > +              */
> > +             u32 ack_with_err_11: 1;
> > +
> > +             /* DSI VC ID Invalid from the Acknowledge error report */
> > +             u32 ack_with_err_12: 1;
> > +
> > +             /* invalid transmission length from the Acknowledge error
> > +              * report
> > +              */
> > +             u32 ack_with_err_13: 1;
> > +
> > +             /* reserved (specific to device) from the Acknowledge err=
or
> > +              * report
> > +              */
> > +             u32 ack_with_err_14: 1;
> > +
> > +             /* DSI protocol violation from the Acknowledge error
> report */
> > +             u32 ack_with_err_15: 1;
> > +
> > +             } bits;
> > +     } PROTOCOL_INT_STS;
> > +
> > +     union _0x0C {
> > +             u32 val;
> > +             struct _MASK_PROTOCOL_INT {
> > +             u32 mask_dphy_errors_0: 1;
> > +             u32 mask_dphy_errors_1: 1;
> > +             u32 mask_dphy_errors_2: 1;
> > +             u32 mask_dphy_errors_3: 1;
> > +             u32 mask_dphy_errors_4: 1;
> > +             u32 mask_protocol_debug_err: 11;
> > +             u32 mask_ack_with_err_0: 1;
> > +             u32 mask_ack_with_err_1: 1;
> > +             u32 mask_ack_with_err_2: 1;
> > +             u32 mask_ack_with_err_3: 1;
> > +             u32 mask_ack_with_err_4: 1;
> > +             u32 mask_ack_with_err_5: 1;
> > +             u32 mask_ack_with_err_6: 1;
> > +             u32 mask_ack_with_err_7: 1;
> > +             u32 mask_ack_with_err_8: 1;
> > +             u32 mask_ack_with_err_9: 1;
> > +             u32 mask_ack_with_err_10: 1;
> > +             u32 mask_ack_with_err_11: 1;
> > +             u32 mask_ack_with_err_12: 1;
> > +             u32 mask_ack_with_err_13: 1;
> > +             u32 mask_ack_with_err_14: 1;
> > +             u32 mask_ack_with_err_15: 1;
> > +             } bits;
> > +     } MASK_PROTOCOL_INT;
> > +
> > +     union _0x10 {
> > +             u32 val;
> > +             struct _INTERNAL_INT_STS {
> > +             /* This bit indicates that the packet size error is
> detected
> > +              * during the packet reception.
> > +              */
> > +             u32 receive_pkt_size_err: 1;
> > +
> > +             /* This bit indicates that the EoTp packet is not receive=
d
> at
> > +              * the end of the incoming peripheral transmission
> > +              */
> > +             u32 eotp_not_receive_err: 1;
> > +
> > +             /* This bit indicates that the system tried to write a
> command
> > +              * through the Generic interface and the FIFO is full.
> There-
> > +              * fore, the command is not written.
> > +              */
> > +             u32 gen_cmd_cmd_fifo_wr_err: 1;
> > +
> > +             /* This bit indicates that during a DCS read data, the
> payload
> > +              * FIFO becomes empty and the data sent to the interface =
is
> > +              * corrupted.
> > +              */
> > +             u32 gen_cmd_rdata_fifo_rd_err: 1;
> > +
> > +             /* This bit indicates that during a generic interface
> packet
> > +              * read back, the payload FIFO becomes full and the
> received
> > +              * data is corrupted.
> > +              */
> > +             u32 gen_cmd_rdata_fifo_wr_err: 1;
> > +
> > +             /* This bit indicates that the system tried to write a
> payload
> > +              * data through the Generic interface and the FIFO is ful=
l.
> > +              * Therefore, the payload is not written.
> > +              */
> > +             u32 gen_cmd_wdata_fifo_wr_err: 1;
> > +
> > +             /* This bit indicates that during a Generic interface
> packet
> > +              * build, the payload FIFO becomes empty and corrupt data
> is
> > +              * sent.
> > +              */
> > +             u32 gen_cmd_wdata_fifo_rd_err: 1;
> > +
> > +             /* This bit indicates that during a DPI pixel line storag=
e,
> > +              * the payload FIFO becomes full and the data stored is
> > +              * corrupted.
> > +              */
> > +             u32 dpi_pix_fifo_wr_err: 1;
> > +
> > +             /* internal debug error */
> > +             u32 internal_debug_err: 19;
> > +
> > +             /* This bit indicates that the ECC single error is detect=
ed
> > +              * and corrected in a received packet.
> > +              */
> > +             u32 ecc_single_err: 1;
> > +
> > +             /* This bit indicates that the ECC multiple error is
> detected
> > +              * in a received packet.
> > +              */
> > +             u32 ecc_multi_err: 1;
> > +
> > +             /* This bit indicates that the CRC error is detected in t=
he
> > +              * received packet payload.
> > +              */
> > +             u32 crc_err: 1;
> > +
> > +             /* This bit indicates that the high-speed transmission
> timeout
> > +              * counter reached the end and contention is detected.
> > +              */
> > +             u32 hs_tx_timeout: 1;
> > +
> > +             /* This bit indicates that the low-power reception timeou=
t
> > +              * counter reached the end and contention is detected.
> > +              */
> > +             u32 lp_rx_timeout: 1;
> > +
> > +             } bits;
> > +     } INTERNAL_INT_STS;
> > +
> > +     union _0x14 {
> > +             u32 val;
> > +             struct _MASK_INTERNAL_INT {
> > +             u32 mask_receive_pkt_size_err: 1;
> > +             u32 mask_eopt_not_receive_err: 1;
> > +             u32 mask_gen_cmd_cmd_fifo_wr_err: 1;
> > +             u32 mask_gen_cmd_rdata_fifo_rd_err: 1;
> > +             u32 mask_gen_cmd_rdata_fifo_wr_err: 1;
> > +             u32 mask_gen_cmd_wdata_fifo_wr_err: 1;
> > +             u32 mask_gen_cmd_wdata_fifo_rd_err: 1;
> > +             u32 mask_dpi_pix_fifo_wr_err: 1;
> > +             u32 mask_internal_debug_err: 19;
> > +             u32 mask_ecc_single_err: 1;
> > +             u32 mask_ecc_multi_err: 1;
> > +             u32 mask_crc_err: 1;
> > +             u32 mask_hs_tx_timeout: 1;
> > +             u32 mask_lp_rx_timeout: 1;
> > +             } bits;
> > +     } MASK_INTERNAL_INT;
> > +
> > +     union _0x18 {
> > +             u32 val;
> > +             struct _DSI_MODE_CFG {
> > +             /* This bit configures the operation mode
> > +              * 0: Video mode ;   1: Command mode
> > +              */
> > +             u32 cmd_video_mode: 1;
> > +
> > +             u32 reserved: 31;
> > +
> > +             } bits;
> > +     } DSI_MODE_CFG;
> > +
> > +     union _0x1C {
> > +             u32 val;
> > +             struct _VIRTUAL_CHANNEL_ID {
> > +             /* This field indicates the Generic interface read-back
> > +              * virtual channel identification
> > +              */
> > +             u32 gen_rx_vcid: 2;
> > +
> > +             /* This field configures the DPI virtual channel id that
> > +              * is indexed to the VIDEO mode packets
> > +              */
> > +             u32 video_pkt_vcid: 2;
> > +
> > +             u32 reserved: 28;
> > +
> > +             } bits;
> > +     } VIRTUAL_CHANNEL_ID;
> > +
> > +     union _0x20 {
> > +             u32 val;
> > +             struct _DPI_VIDEO_FORMAT {
> > +             /*
> > +              * This field configures the DPI color coding as follows:
> > +              * 0000: 16-bit configuration 1
> > +              * 0001: 16-bit configuration 2
> > +              * 0010: 16-bit configuration 3
> > +              * 0011: 18-bit configuration 1
> > +              * 0100: 18-bit configuration 2
> > +              * 0101: 24-bit
> > +              * 0110: 20-bit YCbCr 4:2:2 loosely packed
> > +              * 0111: 24-bit YCbCr 4:2:2
> > +              * 1000: 16-bit YCbCr 4:2:2
> > +              * 1001: 30-bit
> > +              * 1010: 36-bit
> > +              * 1011: 12-bit YCbCr 4:2:0
> > +              * 1100: Compression Display Stream
> > +              * 1101-1111: 12-bit YCbCr 4:2:0
> > +              */
> > +             u32 dpi_video_mode_format: 6;
> > +
> > +             /* When set to 1, this bit activates loosely packed
> > +              * variant to 18-bit configurations
> > +              */
> > +             u32 loosely18_en: 1;
> > +
> > +             u32 reserved: 25;
> > +
> > +             } bits;
> > +     } DPI_VIDEO_FORMAT;
> > +
> > +     union _0x24 {
> > +             u32 val;
> > +             struct _VIDEO_PKT_CONFIG {
> > +             /*
> > +              * This field configures the number of pixels in a single
> > +              * video packet. For 18-bit not loosely packed data types=
,
> > +              * this number must be a multiple of 4. For YCbCr data
> > +              * types, it must be a multiple of 2, as described in the
> > +              * DSI specification.
> > +              */
> > +             u32 video_pkt_size: 16;
> > +
> > +             /*
> > +              * This register configures the number of chunks to be
> > +              * transmitted during a Line period (a chunk consists of
> > +              * a video packet and a null packet). If set to 0 or 1,
> > +              * the video line is transmitted in a single packet. If
> > +              * set to 1, the packet is part of a chunk, so a null
> packet
> > +              * follows it if vid_null_size > 0. Otherwise, multiple
> chunks
> > +              * are used to transmit each video line.
> > +              */
> > +             u32 video_line_chunk_num: 16;
> > +
> > +             } bits;
> > +     } VIDEO_PKT_CONFIG;
> > +
> > +     union _0x28 {
> > +             u32 val;
> > +             struct _VIDEO_LINE_HBLK_TIME {
> > +             /* This field configures the Horizontal Back Porch period
> > +              * in lane byte clock cycles
> > +              */
> > +             u32 video_line_hbp_time: 16;
> > +
> > +             /* This field configures the Horizontal Synchronism Activ=
e
> > +              * period in lane byte clock cycles
> > +              */
> > +             u32 video_line_hsa_time: 16;
> > +
> > +             } bits;
> > +     } VIDEO_LINE_HBLK_TIME;
> > +
> > +     union _0x2C {
> > +             u32 val;
> > +             struct _VIDEO_LINE_TIME {
> > +             /* This field configures the size of the total line time
> > +              * (HSA+HBP+HACT+HFP) counted in lane byte clock cycles
> > +              */
> > +             u32 video_line_time: 16;
> > +
> > +             u32 reserved: 16;
> > +
> > +             } bits;
> > +     } VIDEO_LINE_TIME;
> > +
> > +     union _0x30 {
> > +             u32 val;
> > +             struct _VIDEO_VBLK_LINES {
> > +             /* This field configures the Vertical Front Porch period
> > +              * measured in number of horizontal lines
> > +              */
> > +             u32 vfp_lines: 10;
> > +
> > +             /* This field configures the Vertical Back Porch period
> > +              * measured in number of horizontal lines
> > +              */
> > +             u32 vbp_lines: 10;
> > +
> > +             /* This field configures the Vertical Synchronism Active
> > +              * period measured in number of horizontal lines
> > +              */
> > +             u32 vsa_lines: 10;
> > +
> > +             u32 reserved: 2;
> > +
> > +             } bits;
> > +     } VIDEO_VBLK_LINES;
> > +
> > +     union _0x34 {
> > +             u32 val;
> > +             struct _VIDEO_VACTIVE_LINES {
> > +             /* This field configures the Vertical Active period
> measured
> > +              * in number of horizontal lines
> > +              */
> > +             u32 vactive_lines: 14;
> > +
> > +             u32 reserved: 18;
> > +
> > +             } bits;
> > +     } VIDEO_VACTIVE_LINES;
> > +
> > +     union _0x38 {
> > +             u32 val;
> > +             struct _VID_MODE_CFG {
> > +             /*
> > +              * This field indicates the video mode transmission type =
as
> > +              * follows:
> > +              * 00: Non-burst with sync pulses
> > +              * 01: Non-burst with sync events
> > +              * 10 and 11: Burst mode
> > +              */
> > +             u32 vid_mode_type: 2;
> > +
> > +             u32 reserved_0: 6;
> > +
> > +             /* When set to 1, this bit enables the return to low-powe=
r
> > +              * inside the VSA period when timing allows.
> > +              */
> > +             u32 lp_vsa_en: 1;
> > +
> > +             /* When set to 1, this bit enables the return to low-powe=
r
> > +              * inside the VBP period when timing allows.
> > +              */
> > +             u32 lp_vbp_en: 1;
> > +
> > +             /* When set to 1, this bit enables the return to low-powe=
r
> > +              * inside the VFP period when timing allows.
> > +              */
> > +             u32 lp_vfp_en: 1;
> > +
> > +             /* When set to 1, this bit enables the return to low-powe=
r
> > +              * inside the VACT period when timing allows.
> > +              */
> > +             u32 lp_vact_en: 1;
> > +
> > +             /* When set to 1, this bit enables the return to low-powe=
r
> > +              * inside the HBP period when timing allows.
> > +              */
> > +             u32 lp_hbp_en: 1;
> > +
> > +             /* When set to 1, this bit enables the return to low-powe=
r
> > +              * inside the HFP period when timing allows.
> > +              */
> > +             u32 lp_hfp_en: 1;
> > +
> > +             /* When set to 1, this bit enables the request for an ack=
-
> > +              * nowledge response at the end of a frame.
> > +              */
> > +             u32 frame_bta_ack_en: 1;
> > +
> > +             /* When set to 1, this bit enables the command transmissi=
on
> > +              * only in low-power mode.
> > +              */
> > +             u32 lp_cmd_en: 1;
> > +
> > +             u32 reserved_1: 16;
> > +
> > +             } bits;
> > +     } VID_MODE_CFG;
> > +
> > +     union _0x3C {
> > +             u32 val;
> > +             struct _SDF_MODE_CONFIG {
> > +             /*
> > +              * This field defines the 3D mode on/off & display
> orientation:
> > +              * 00: 3D mode off (2D mode on)
> > +              * 01: 3D mode on, portrait orientation
> > +              * 10: 3D mode on, landscape orientation
> > +              * 11: Reserved
> > +              */
> > +             u32 rf_3d_mode: 2;
> > +
> > +             /*
> > +              * This field defines the 3D image format:
> > +              * 00: Line (alternating lines of left and right data)
> > +              * 01: Frame (alternating frames of left and right data)
> > +              * 10: Pixel (alternating pixels of left and right data)
> > +              * 11: Reserved
> > +              */
> > +             u32 rf_3d_format: 2;
> > +
> > +             /*
> > +              * This field defines whether there is a second VSYNC pul=
se
> > +              * between Left and Right Images, when 3D Image Format is
> > +              * Frame-based:
> > +              * 0: No sync pulses between left and right data
> > +              * 1: Sync pulse (HSYNC, VSYNC, blanking) between left an=
d
> > +              *    right data
> > +              */
> > +             u32 second_vsync_en: 1;
> > +
> > +             /*
> > +              * This bit defines the left or right order:
> > +              * 0: Left eye data is sent first, and then the right eye
> data
> > +              *    is sent.
> > +              * 1: Right eye data is sent first, and then the left eye
> data
> > +              *    is sent.
> > +              */
> > +             u32 left_right_order: 1;
> > +
> > +             u32 reserved_0: 2;
> > +
> > +             /*
> > +              * When set, causes the next VSS packet to include 3D
> control
> > +              * payload in every VSS packet.
> > +              */
> > +             u32 rf_3d_payload_en: 1;
> > +
> > +             u32 reserved_1: 23;
> > +
> > +             } bits;
> > +     } SDF_MODE_CONFIG;
> > +
> > +     union _0x40 {
> > +             u32 val;
> > +             struct _TIMEOUT_CNT_CLK_CONFIG {
> > +             /*
> > +              * This field indicates the division factor for the Time
> Out
> > +              * clock used as the timing unit in the configuration of
> HS to
> > +              * LP and LP to HS transition error.
> > +              */
> > +             u32 timeout_cnt_clk_config: 16;
> > +
> > +             u32 reserved: 16;
> > +
> > +             } bits;
> > +     } TIMEOUT_CNT_CLK_CONFIG;
> > +
> > +     union _0x44 {
> > +             u32 val;
> > +             struct _HTX_TO_CONFIG {
> > +             /*
> > +              * This field configures the timeout counter that trigger=
s
> > +              * a high speed transmission timeout contention detection
> > +              * (measured in TO_CLK_DIVISION cycles).
> > +              *
> > +              * If using the non-burst mode and there is no sufficient
> > +              * time to switch from HS to LP and back in the period
> which
> > +              * is from one line data finishing to the next line sync
> > +              * start, the DSI link returns the LP state once per fram=
e,
> > +              * then you should configure the TO_CLK_DIVISION and
> > +              * hstx_to_cnt to be in accordance with:
> > +              * hstx_to_cnt * lanebyteclkperiod * TO_CLK_DIVISION >=3D=
 the
> > +              * time of one FRAME data transmission * (1 + 10%)
> > +              *
> > +              * In burst mode, RGB pixel packets are time-compressed,
> > +              * leaving more time during a scan line. Therefore, if in
> > +              * burst mode and there is sufficient time to switch from
> HS
> > +              * to LP and back in the period of time from one line dat=
a
> > +              * finishing to the next line sync start, the DSI link ca=
n
> > +              * return LP mode and back in this time interval to save
> power.
> > +              * For this, configure the TO_CLK_DIVISION and hstx_to_cn=
t
> > +              * to be in accordance with:
> > +              * hstx_to_cnt * lanebyteclkperiod * TO_CLK_DIVISION >=3D=
 the
> > +              * time of one LINE data transmission * (1 + 10%)
> > +              */
> > +             u32 htx_to_cnt_limit: 32;
> > +             } bits;
> > +     } HTX_TO_CONFIG;
> > +
> > +     union _0x48 {
> > +             u32 val;
> > +             struct _LRX_H_TO_CONFIG {
> > +             /*
> > +              * This field configures the timeout counter that trigger=
s
> > +              * a low-power reception timeout contention detection
> (measured
> > +              * in TO_CLK_DIVISION cycles).
> > +              */
> > +             u32 lrx_h_to_cnt_limit: 32;
> > +             } bits;
> > +     } LRX_H_TO_CONFIG;
> > +
> > +     union _0x4C {
> > +             u32 val;
> > +             struct _RD_PRESP_TO_CONFIG {
> > +             /*
> > +              * This field sets a period for which the DWC_mipi_dsi_ho=
st
> > +              * keeps the link still, after sending a low-power read
> oper-
> > +              * ation. This period is measured in cycles of lanebytecl=
k.
> > +              * The counting starts when the D-PHY enters the Stop sta=
te
> > +              * and causes no interrupts.
> > +              */
> > +             u32 lprd_presp_to_cnt_limit: 16;
> > +
> > +             /*
> > +              * This field sets a period for which the DWC_mipi_dsi_ho=
st
> > +              * keeps the link still, after sending a high-speed read
> oper-
> > +              * ation. This period is measured in cycles of lanebytecl=
k.
> > +              * The counting starts when the D-PHY enters the Stop sta=
te
> > +              * and causes no interrupts.
> > +              */
> > +             u32 hsrd_presp_to_cnt_limit: 16;
> > +
> > +             } bits;
> > +     } RD_PRESP_TO_CONFIG;
> > +
> > +     union _0x50 {
> > +             u32 val;
> > +             struct _HSWR_PRESP_TO_CONFIG {
> > +             /*
> > +              * This field sets a period for which the DWC_mipi_dsi_ho=
st
> > +              * keeps the link inactive after sending a high-speed wri=
te
> > +              * operation. This period is measured in cycles of
> lanebyteclk.
> > +              * The counting starts when the D-PHY enters the Stop sta=
te
> > +              * and causes no interrupts.
> > +              */
> > +             u32 hswr_presp_to_cnt_limit: 16;
> > +
> > +             u32 reserved_0: 8;
> > +
> > +             /*
> > +              * When set to 1, this bit ensures that the peripheral
> response
> > +              * timeout caused by hs_wr_to_cnt is used only once per
> eDPI
> > +              * frame, when both the following conditions are met:
> > +              * dpivsync_edpiwms has risen and fallen.
> > +              * Packets originated from eDPI have been transmitted and
> its
> > +              * FIFO is empty again In this scenario no non-eDPI
> requests
> > +              * are sent to the D-PHY, even if there is traffic from
> generic
> > +              * or DBI ready to be sent, making it return to stop stat=
e.
> > +              * When it does so, PRESP_TO counter is activated and onl=
y
> when
> > +              * it finishes does the controller send any other traffic
> that
> > +              * is ready.
> > +              */
> > +             u32 hswr_presp_to_mode: 1;
> > +
> > +             u32 reserved_1: 7;
> > +
> > +             } bits;
> > +     } HSWR_PRESP_TO_CONFIG;
> > +
> > +     union _0x54 {
> > +             u32 val;
> > +             struct _LPWR_PRESP_TO_CONFIG {
> > +             /*
> > +              * This field sets a period for which the DWC_mipi_dsi_ho=
st
> > +              * keeps the link still, after sending a low-power write
> oper-
> > +              * ation. This period is measured in cycles of lanebytecl=
k.
> > +              * The counting starts when the D-PHY enters the Stop sta=
te
> > +              * and causes no interrupts.
> > +              */
> > +             u32 lpwr_presp_to_cnt_limit: 16;
> > +
> > +             u32 reserved: 16;
> > +
> > +             } bits;
> > +     } LPWR_PRESP_TO_CONFIG;
> > +
> > +     union _0x58 {
> > +             u32 val;
> > +             struct _BTA_PRESP_TO_CONFIG {
> > +             /*
> > +              * This field sets a period for which the DWC_mipi_dsi_ho=
st
> > +              * keeps the link still, after completing a Bus
> Turn-Around.
> > +              * This period is measured in cycles of lanebyteclk. The
> > +              * counting starts when the D-PHY enters the Stop state a=
nd
> > +              * causes no interrupts.
> > +              */
> > +             u32 bta_presp_to_cnt_limit: 16;
> > +
> > +             u32 reserved: 16;
> > +
> > +             } bits;
> > +     } BTA_PRESP_TO_CONFIG;
> > +
> > +     union _0x5C {
> > +             u32 val;
> > +             struct _TX_ESC_CLK_CONFIG {
> > +             /*
> > +              * This field indicates the division factor for the TX
> Escape
> > +              * clock source (lanebyteclk). The values 0 and 1 stop th=
e
> > +              * TX_ESC clock generation.
> > +              */
> > +             u32 tx_esc_clk_config: 16;
> > +
> > +             u32 reserved: 16;
> > +
> > +             } bits;
> > +     } TX_ESC_CLK_CONFIG;
> > +
> > +     union _0x60 {
> > +             u32 val;
> > +             struct _VACT_CMD_TRANS_LIMIT {
> > +             /*
> > +              * This field is used for the transmission of commands in
> > +              * low-power mode. It defines the size, in bytes, of the
> > +              * largest packet that can fit in a line during the VACT
> > +              * region.
> > +              */
> > +             u32 vact_cmd_trans_limit: 8;
> > +
> > +             u32 reserved: 24;
> > +
> > +             } bits;
> > +     } VACT_CMD_TRANS_LIMIT;
> > +
> > +     union _0x64 {
> > +             u32 val;
> > +             struct _VBLK_CMD_TRANS_LIMIT {
> > +             /*
> > +              * This field is used for the transmission of commands in
> > +              * low-power mode. It defines the size, in bytes, of the
> > +              * largest packet that can fit in a line during the VSA,
> VBP,
> > +              * and VFP regions.
> > +              */
> > +             u32 vblk_cmd_trans_limit: 8;
> > +
> > +             u32 reserved: 24;
> > +
> > +             } bits;
> > +     } VBLK_CMD_TRANS_LIMIT;
> > +
> > +     union _0x68 {
> > +             u32 val;
> > +             struct _CMD_MODE_CFG {
> > +             /*
> > +              * When set to 1, this bit enables the tearing effect
> > +              * acknowledge request.
> > +              */
> > +             u32 tear_fx_en: 1;
> > +
> > +             /*
> > +              * When set to 1, this bit enables the acknowledge reques=
t
> > +              * after each packet transmission.
> > +              */
> > +             u32 ack_rqst_en: 1;
> > +
> > +             u32 reserved_0: 3;
> > +
> > +             u32 pps_tx: 1;
> > +             u32 exq_tx: 1;
> > +             u32 cmc_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the Generic short write packet wit=
h
> > +              * zero parameter command transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 gen_sw_0p_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the Generic short write packet wit=
h
> > +              * one parameter command transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 gen_sw_1p_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the Generic short write packet wit=
h
> > +              * two parameters command transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 gen_sw_2p_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the Generic short read packet with
> > +              * zero parameter command transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 gen_sr_0p_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the Generic short read packet with
> > +              * one parameter command transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 gen_sr_1p_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the Generic short read packet with
> > +              * two parameters command transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 gen_sr_2p_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the Generic long write packet
> command
> > +              * transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 gen_lw_tx: 1;
> > +
> > +             u32 reserved_1: 1;
> > +
> > +             /*
> > +              * This bit configures the DCS short write packet with ze=
ro
> > +              * parameter command transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 dcs_sw_0p_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the DCS short write packet with on=
e
> > +              * parameter command transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 dcs_sw_1p_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the DCS short read packet with zer=
o
> > +              * parameter command transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 dcs_sr_0p_tx: 1;
> > +
> > +             /*
> > +              * This bit configures the DCS long write packet command
> > +              * transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 dcs_lw_tx: 1;
> > +
> > +             u32 reserved_2: 4;
> > +
> > +             /*
> > +              * This bit configures the maximum read packet size comma=
nd
> > +              * transmission type:
> > +              * 0: High-speed 1: Low-power
> > +              */
> > +             u32 max_rd_pkt_size: 1;
> > +
> > +             u32 reserved_3: 7;
> > +
> > +             } bits;
> > +     } CMD_MODE_CFG;
> > +
> > +     union _0x6C {
> > +             u32 val;
> > +             struct _GEN_HDR {
> > +             /*
> > +              * This field configures the packet data type of the head=
er
> > +              * packet.
> > +              */
> > +             u32 gen_dt: 6;
> > +
> > +             /*
> > +              * This field configures the virtual channel id of the
> header
> > +              * packet.
> > +              */
> > +             u32 gen_vc: 2;
> > +
> > +             /*
> > +              * This field configures the least significant byte of th=
e
> > +              * header packet's Word count for long packets or data 0
> for
> > +              * short packets.
> > +              */
> > +             u32 gen_wc_lsbyte: 8;
> > +
> > +             /*
> > +              * This field configures the most significant byte of the
> > +              * header packet's word count for long packets or data 1
> for
> > +              * short packets.
> > +              */
> > +             u32 gen_wc_msbyte: 8;
> > +
> > +             u32 reserved: 8;
> > +
> > +             } bits;
> > +     } GEN_HDR;
> > +
> > +     union _0x70 {
> > +             u32 val;
> > +             struct _GEN_PLD_DATA {
> > +             /* This field indicates byte 1 of the packet payload. */
> > +             u32 gen_pld_b1: 8;
> > +
> > +             /* This field indicates byte 2 of the packet payload. */
> > +             u32 gen_pld_b2: 8;
> > +
> > +             /* This field indicates byte 3 of the packet payload. */
> > +             u32 gen_pld_b3: 8;
> > +
> > +             /* This field indicates byte 4 of the packet payload. */
> > +             u32 gen_pld_b4: 8;
> > +
> > +             } bits;
> > +     } GEN_PLD_DATA;
> > +
> > +     union _0x74 {
> > +             u32 val;
> > +             struct _PHY_CLK_LANE_LP_CTRL {
> > +             /* This bit controls the D-PHY PPI txrequestclkhs signal =
*/
> > +             u32 phy_clklane_tx_req_hs: 1;
> > +
> > +             /* This bit enables the automatic mechanism to stop
> providing
> > +              * clock in the clock lane when time allows.
> > +              */
> > +             u32 auto_clklane_ctrl_en: 1;
> > +
> > +             u32 reserved: 30;
> > +             } bits;
> > +     } PHY_CLK_LANE_LP_CTRL;
> > +
> > +     union _0x78 {
> > +             u32 val;
> > +             struct _PHY_INTERFACE_CTRL {
> > +             /* When set to 0, this bit places the D-PHY macro in powe=
r-
> > +              * down state.
> > +              */
> > +             u32 rf_phy_shutdown: 1;
> > +
> > +             /* When set to 0, this bit places the digital section of
> the
> > +              * D-PHY in the reset state.
> > +              */
> > +             u32 rf_phy_reset_n: 1;
> > +
> > +             /* When set to 1, this bit enables the D-PHY Clock Lane
> > +              * module.
> > +              */
> > +             u32 rf_phy_clk_en: 1;
> > +
> > +             /* When the D-PHY is in ULPS, this bit enables the D-PHY
> PLL. */
> > +             u32 rf_phy_force_pll: 1;
> > +
> > +             /* ULPS mode Request on clock lane */
> > +             u32 rf_phy_clk_txrequlps: 1;
> > +
> > +             /* ULPS mode Exit on clock lane */
> > +             u32 rf_phy_clk_txexitulps: 1;
> > +
> > +             /* ULPS mode Request on all active data lanes */
> > +             u32 rf_phy_data_txrequlps: 1;
> > +
> > +             /* ULPS mode Exit on all active data lanes */
> > +             u32 rf_phy_data_txexitulps: 1;
> > +
> > +             u32 reserved: 24;
> > +             } bits;
> > +     } PHY_INTERFACE_CTRL;
> > +
> > +     union _0x7C {
> > +             u32 val;
> > +             struct _PHY_TX_TRIGGERS {
> > +             /* This field controls the trigger transmissions. */
> > +             u32 phy_tx_triggers: 4;
> > +
> > +             u32 reserved: 28;
> > +             } bits;
> > +     } PHY_TX_TRIGGERS;
> > +
> > +     union _0x80 {
> > +             u32 val;
> > +             struct _DESKEW_START {
> > +             u32 deskew_start: 1;
> > +             u32 reserved: 31;
> > +             } bits;
> > +     } DESKEW_START;
> > +
> > +     union _0x84 {
> > +             u32 val;
> > +             struct _DESKEW_MODE {
> > +             u32 deskew_mode: 2;
> > +             u32 reserved: 30;
> > +             } bits;
> > +     } DESKEW_MODE;
> > +
> > +     union _0x88 {
> > +             u32 val;
> > +             struct _DESKEW_TIME {
> > +             u32 deskew_time: 32;
> > +             } bits;
> > +     } DESKEW_TIME;
> > +
> > +     union _0x8C {
> > +             u32 val;
> > +             struct _DESKEW_PERIOD {
> > +             u32 deskew_period: 32;
> > +             } bits;
> > +     } DESKEW_PERIOD;
> > +
> > +     union _0x90 {
> > +             u32 val;
> > +             struct _DESKEW_BUSY {
> > +             u32 deskew_busy: 1;
> > +             u32 reserved: 31;
> > +             } bits;
> > +     } DESKEW_BUSY;
> > +
> > +     union _0x94 {
> > +             u32 val;
> > +             struct _DESKEW_LANE_MASK {
> > +             u32 deskew_lane0_mask: 1;
> > +             u32 deskew_lane1_mask: 1;
> > +             u32 deskew_lane2_mask: 1;
> > +             u32 deskew_lane3_mask: 1;
> > +             u32 reserved: 28;
> > +             } bits;
> > +     } DESKEW_LANE_MASK;
> > +
> > +     union _0x98 {
> > +             u32 val;
> > +             struct _CMD_MODE_STATUS {
> > +             /*
> > +              * This bit is set when a read command is issued and
> cleared
> > +              * when the entire response is stored in the FIFO.
> > +              * Value after reset: 0x0
> > +              *
> > +              * NOTE:
> > +              * For mipi-dsi-r1p0 IP, this bit is set immediately when
> > +              *     the read cmd is set to the GEN_HDR register.
> > +              *
> > +              * For dsi-ctrl-r1p0 IP, this bit is set only after the
> read
> > +              *     cmd was actually sent out from the controller.
> > +              */
> > +             u32 gen_cmd_rdcmd_ongoing: 1;
> > +
> > +             /*
> > +              * This bit indicates the empty status of the generic rea=
d
> > +              * payload FIFO.
> > +              * Value after reset: 0x1
> > +              */
> > +             u32 gen_cmd_rdata_fifo_empty: 1;
> > +
> > +             /*
> > +              * This bit indicates the full status of the generic read
> > +              * payload FIFO.
> > +              * Value after reset: 0x0
> > +              */
> > +             u32 gen_cmd_rdata_fifo_full: 1;
> > +
> > +             /*
> > +              * This bit indicates the empty status of the generic wri=
te
> > +              * payload FIFO.
> > +              * Value after reset: 0x1
> > +              */
> > +             u32 gen_cmd_wdata_fifo_empty: 1;
> > +
> > +             /*
> > +              * This bit indicates the full status of the generic writ=
e
> > +              * payload FIFO.
> > +              * Value after reset: 0x0
> > +              */
> > +             u32 gen_cmd_wdata_fifo_full: 1;
> > +
> > +             /*
> > +              * This bit indicates the empty status of the generic
> > +              * command FIFO.
> > +              * Value after reset: 0x1
> > +              */
> > +             u32 gen_cmd_cmd_fifo_empty: 1;
> > +
> > +             /*
> > +              * This bit indicates the full status of the generic
> > +              * command FIFO.
> > +              * Value after reset: 0x0
> > +              */
> > +             u32 gen_cmd_cmd_fifo_full: 1;
> > +
> > +             /*
> > +              * This bit is set when the entire response of read is
> > +              * stored in the rx payload FIFO. And it will be cleared
> > +              * automaticlly after read this bit each time.
> > +              * Value after reset: 0x0
> > +              *
> > +              * NOTE: this bit is just supported for dsi-ctrl-r1p0 IP
> > +              */
> > +             u32 gen_cmd_rdcmd_done: 1;
> > +
> > +             u32 reserved : 24;
> > +
> > +             } bits;
> > +     } CMD_MODE_STATUS;
> > +
> > +     union _0x9C {
> > +             u32 val;
> > +             struct _PHY_STATUS {
> > +             /* the status of phydirection D-PHY signal */
> > +             u32 phy_direction: 1;
> > +
> > +             /* the status of phylock D-PHY signal */
> > +             u32 phy_lock: 1;
> > +
> > +             /* the status of rxulpsesc0lane D-PHY signal */
> > +             u32 phy_rxulpsesc0lane: 1;
> > +
> > +             /* the status of phystopstateclklane D-PHY signal */
> > +             u32 phy_stopstateclklane: 1;
> > +
> > +             /* the status of phystopstate0lane D-PHY signal */
> > +             u32 phy_stopstate0lane: 1;
> > +
> > +             /* the status of phystopstate1lane D-PHY signal */
> > +             u32 phy_stopstate1lane: 1;
> > +
> > +             /* the status of phystopstate2lane D-PHY signal */
> > +             u32 phy_stopstate2lane: 1;
> > +
> > +             /* the status of phystopstate3lane D-PHY signal */
> > +             u32 phy_stopstate3lane: 1;
> > +
> > +             /* the status of phyulpsactivenotclk D-PHY signal */
> > +             u32 phy_ulpsactivenotclk: 1;
> > +
> > +             /* the status of ulpsactivenot0lane D-PHY signal */
> > +             u32 phy_ulpsactivenot0lane: 1;
> > +
> > +             /* the status of ulpsactivenot1lane D-PHY signal */
> > +             u32 phy_ulpsactivenot1lane: 1;
> > +
> > +             /* the status of ulpsactivenot2lane D-PHY signal */
> > +             u32 phy_ulpsactivenot2lane: 1;
> > +
> > +             /* the status of ulpsactivenot3lane D-PHY signal */
> > +             u32 phy_ulpsactivenot3lane: 1;
> > +
> > +             u32 reserved: 19;
> > +
> > +             } bits;
> > +     } PHY_STATUS;
> > +
> > +     union _0xA0 {
> > +             u32 val;
> > +             struct _PHY_MIN_STOP_TIME {
> > +             /* This field configures the minimum wait period to reque=
st
> > +              * a high-speed transmission after the Stop state.
> > +              */
> > +             u32 phy_min_stop_time: 8;
> > +
> > +             u32 reserved: 24;
> > +             } bits;
> > +     } PHY_MIN_STOP_TIME;
> > +
> > +     union _0xA4 {
> > +             u32 val;
> > +             struct _PHY_LANE_NUM_CONFIG {
> > +             /*
> > +              * This field configures the number of active data lanes:
> > +              * 00: One data lane (lane 0)
> > +              * 01: Two data lanes (lanes 0 and 1)
> > +              * 10: Three data lanes (lanes 0, 1, and 2)
> > +              * 11: Four data lanes (lanes 0, 1, 2, and 3)
> > +              */
> > +             u32 phy_lane_num: 2;
> > +
> > +             u32 reserved: 30;
> > +
> > +             } bits;
> > +     } PHY_LANE_NUM_CONFIG;
> > +
> > +     union _0xA8 {
> > +             u32 val;
> > +             struct _PHY_CLKLANE_TIME_CONFIG {
> > +             /*
> > +              * This field configures the maximum time that the D-PHY
> > +              * clock lane takes to go from low-power to high-speed
> > +              * transmission measured in lane byte clock cycles.
> > +              */
> > +             u32 phy_clklane_lp_to_hs_time: 16;
> > +
> > +             /*
> > +              * This field configures the maximum time that the D-PHY
> > +              * clock lane takes to go from high-speed to low-power
> > +              * transmission measured in lane byte clock cycles.
> > +              */
> > +             u32 phy_clklane_hs_to_lp_time: 16;
> > +
> > +             } bits;
> > +     } PHY_CLKLANE_TIME_CONFIG;
> > +
> > +     union _0xAC {
> > +             u32 val;
> > +             struct _PHY_DATALANE_TIME_CONFIG {
> > +             /*
> > +              * This field configures the maximum time that the D-PHY
> data
> > +              * lanes take to go from low-power to high-speed
> transmission
> > +              * measured in lane byte clock cycles.
> > +              */
> > +             u32 phy_datalane_lp_to_hs_time: 16;
> > +
> > +             /*
> > +              * This field configures the maximum time that the D-PHY
> data
> > +              * lanes take to go from high-speed to low-power
> transmission
> > +              * measured in lane byte clock cycles.
> > +              */
> > +             u32 phy_datalane_hs_to_lp_time: 16;
> > +
> > +             } bits;
> > +     } PHY_DATALANE_TIME_CONFIG;
> > +
> > +     union _0xB0 {
> > +             u32 val;
> > +             struct _MAX_READ_TIME {
> > +             /*
> > +              * This field configures the maximum time required to
> perform
> > +              * a read command in lane byte clock cycles. This registe=
r
> can
> > +              * only be modified when no read command is in progress.
> > +              */
> > +             u32 max_rd_time: 16;
> > +
> > +             u32 reserved: 16;
> > +
> > +             } bits;
> > +     } MAX_READ_TIME;
> > +
> > +     union _0xB4 {
> > +             u32 val;
> > +             struct _RX_PKT_CHECK_CONFIG {
> > +             /* When set to 1, this bit enables the ECC reception, err=
or
> > +              * correction, and reporting.
> > +              */
> > +             u32 rx_pkt_ecc_en: 1;
> > +
> > +             /* When set to 1, this bit enables the CRC reception and
> error
> > +              * reporting.
> > +              */
> > +             u32 rx_pkt_crc_en: 1;
> > +
> > +             u32 reserved: 30;
> > +
> > +             } bits;
> > +     } RX_PKT_CHECK_CONFIG;
> > +
> > +     union _0xB8 {
> > +             u32 val;
> > +             struct _TA_EN {
> > +             /* When set to 1, this bit enables the Bus Turn-Around
> (BTA)
> > +              * request.
> > +              */
> > +             u32 ta_en: 1;
> > +
> > +             u32 reserved: 31;
> > +
> > +             } bits;
> > +     } TA_EN;
> > +
> > +     union _0xBC {
> > +             u32 val;
> > +             struct _EOTP_EN {
> > +             /* When set to 1, this bit enables the EoTp transmission =
*/
> > +             u32 tx_eotp_en: 1;
> > +
> > +             /* When set to 1, this bit enables the EoTp reception. */
> > +             u32 rx_eotp_en: 1;
> > +
> > +             u32 reserved: 30;
> > +
> > +             } bits;
> > +     } EOTP_EN;
> > +
> > +     union _0xC0 {
> > +             u32 val;
> > +             struct _VIDEO_NULLPKT_SIZE {
> > +             /*
> > +              * This register configures the number of bytes inside a
> null
> > +              * packet. Setting it to 0 disables the null packets.
> > +              */
> > +             u32 video_nullpkt_size: 13;
> > +
> > +             u32 reserved: 19;
> > +
> > +             } bits;
> > +     } VIDEO_NULLPKT_SIZE;
> > +
> > +     union _0xC4 {
> > +             u32 val;
> > +             struct _DCS_WM_PKT_SIZE {
> > +             /*
> > +              * This field configures the maximum allowed size for an
> eDPI
> > +              * write memory command, measured in pixels. Automatic
> parti-
> > +              * tioning of data obtained from eDPI is permanently
> enabled.
> > +              */
> > +             u32 dcs_wm_pkt_size: 16;
> > +
> > +             u32 reserved: 16;
> > +             } bits;
> > +     } DCS_WM_PKT_SIZE;
> > +
> > +     union _0xC8 {
> > +             u32 val;
> > +             struct _PROTOCOL_INT_CLR {
> > +             u32 clr_dphy_errors_0: 1;
> > +             u32 clr_dphy_errors_1: 1;
> > +             u32 clr_dphy_errors_2: 1;
> > +             u32 clr_dphy_errors_3: 1;
> > +             u32 clr_dphy_errors_4: 1;
> > +             u32 clr_protocol_debug_err: 11;
> > +             u32 clr_ack_with_err_0: 1;
> > +             u32 clr_ack_with_err_1: 1;
> > +             u32 clr_ack_with_err_2: 1;
> > +             u32 clr_ack_with_err_3: 1;
> > +             u32 clr_ack_with_err_4: 1;
> > +             u32 clr_ack_with_err_5: 1;
> > +             u32 clr_ack_with_err_6: 1;
> > +             u32 clr_ack_with_err_7: 1;
> > +             u32 clr_ack_with_err_8: 1;
> > +             u32 clr_ack_with_err_9: 1;
> > +             u32 clr_ack_with_err_10: 1;
> > +             u32 clr_ack_with_err_11: 1;
> > +             u32 clr_ack_with_err_12: 1;
> > +             u32 clr_ack_with_err_13: 1;
> > +             u32 clr_ack_with_err_14: 1;
> > +             u32 clr_ack_with_err_15: 1;
> > +             } bits;
> > +     } PROTOCOL_INT_CLR;
> > +
> > +     union _0xCC {
> > +             u32 val;
> > +             struct _INTERNAL_INT_CLR {
> > +             u32 clr_receive_pkt_size_err: 1;
> > +             u32 clr_eopt_not_receive_err: 1;
> > +             u32 clr_gen_cmd_cmd_fifo_wr_err: 1;
> > +             u32 clr_gen_cmd_rdata_fifo_rd_err: 1;
> > +             u32 clr_gen_cmd_rdata_fifo_wr_err: 1;
> > +             u32 clr_gen_cmd_wdata_fifo_wr_err: 1;
> > +             u32 clr_gen_cmd_wdata_fifo_rd_err: 1;
> > +             u32 clr_dpi_pix_fifo_wr_err: 1;
> > +             u32 clr_internal_debug_err: 19;
> > +             u32 clr_ecc_single_err: 1;
> > +             u32 clr_ecc_multi_err: 1;
> > +             u32 clr_crc_err: 1;
> > +             u32 clr_hs_tx_timeout: 1;
> > +             u32 clr_lp_rx_timeout: 1;
> > +             } bits;
> > +     } INTERNAL_INT_CLR;
> > +
> > +     union _0xD0 {
> > +             u32 val;
> > +             struct _VIDEO_SIG_DELAY_CONFIG {
> > +
> > +             /*
> > +              * DPI interface signal delay to be used in clk lanebyte
> > +              * domain for control logic to read video data from pixel
> > +              * memory in mannal mode, measured in clk_lanebyte cycles
> > +              */
> > +             u32 video_sig_delay: 24;
> > +
> > +             /*
> > +              * 1'b1: mannal mode
> > +              *       dsi controller will use video_sig_delay value as
> > +              *       the delay for the packet handle logic to read
> video
> > +              *       data from pixel memory.
> > +              *
> > +              * 1'b0: auto mode
> > +              *       dsi controller will auto calculate the delay for
> > +              *       the packet handle logic to read video data from
> > +              *       pixel memory.
> > +              */
> > +             u32 video_sig_delay_mode: 1;
> > +
> > +             u32 reserved: 7;
> > +             } bits;
> > +     } VIDEO_SIG_DELAY_CONFIG;
> > +
> > +     u32 reservedD4_EC[7];
> > +
> > +     union _0xF0 {
> > +             u32 val;
> > +             struct _PHY_TST_CTRL0 {
> > +             /* PHY test interface clear (active high) */
> > +             u32 phy_testclr: 1;
> > +
> > +             /* This bit is used to clock the TESTDIN bus into the
> D-PHY */
> > +             u32 phy_testclk: 1;
> > +
> > +             u32 reserved: 30;
> > +             } bits;
> > +     } PHY_TST_CTRL0;
> > +
> > +     union _0xF4 {
> > +             u32 val;
> > +             struct _PHY_TST_CTRL1 {
> > +             /* PHY test interface input 8-bit data bus for internal
> > +              * register programming and test functionalities access.
> > +              */
> > +             u32 phy_testdin: 8;
> > +
> > +             /* PHY output 8-bit data bus for read-back and internal
> > +              * probing functionalities.
> > +              */
> > +             u32 phy_testdout: 8;
> > +
> > +             /*
> > +              * PHY test interface operation selector:
> > +              * 1: The address write operation is set on the falling
> edge
> > +              *    of the testclk signal.
> > +              * 0: The data write operation is set on the rising edge =
of
> > +              *    the testclk signal.
> > +              */
> > +             u32 phy_testen: 1;
> > +
> > +             u32 reserved: 15;
> > +             } bits;
> > +     } PHY_TST_CTRL1;
> > +
> > +     u32 reservedF8_1FC[66];
> > +
> > +     union _0x200 {
> > +             u32 val;
> > +             struct _INT_PLL_STS {
> > +             u32 int_pll_sts: 1;
> > +             u32 reserved: 31;
> > +             } bits;
> > +     } INT_PLL_STS;
> > +
> > +     union _0x204 {
> > +             u32 val;
> > +             struct _INT_PLL_MSK {
> > +             u32 int_pll_msk: 1;
> > +             u32 reserved: 31;
> > +             } bits;
> > +     } INT_PLL_MSK;
> > +
> > +     union _0x208 {
> > +             u32 val;
> > +             struct _INT_PLL_CLR {
> > +             u32 int_pll_clr: 1;
> > +             u32 reserved: 31;
> > +             } bits;
> > +     } INT_PLL_CLR;
> > +
> > +};
> > +
> > +void dsi_power_enable(struct dsi_context *ctx, int enable);
> > +void dsi_video_mode(struct dsi_context *ctx);
> > +void dsi_cmd_mode(struct dsi_context *ctx);
> > +bool dsi_is_cmd_mode(struct dsi_context *ctx);
> > +void dsi_rx_vcid(struct dsi_context *ctx, u8 vc);
> > +void dsi_video_vcid(struct dsi_context *ctx, u8 vc);
> > +void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mode);
> > +void dsi_dpi_color_coding(struct dsi_context *ctx, int coding);
> > +void dsi_dpi_sig_delay(struct dsi_context *ctx, u16 byte_cycle);
> > +void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cycle);
> > +void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cycle);
> > +void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle);
> > +void dsi_dpi_vact(struct dsi_context *ctx, u16 lines);
> > +void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines);
> > +void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines);
> > +void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines);
> > +void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable);
> > +void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable);
> > +void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable);
> > +void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 no);
> > +void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 size);
> > +void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 size);
> > +void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size);
> > +void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enable);
> > +void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enable);
> > +void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int enable);
> > +void dsi_set_packet_header(struct dsi_context *ctx, u8 vc, u8 type,
> > +                                             u8 wc_lsb, u8 wc_msb);
> > +void dsi_set_packet_payload(struct dsi_context *ctx, u32 payload);
> > +u32 dsi_get_rx_payload(struct dsi_context *ctx);
> > +void dsi_bta_en(struct dsi_context *ctx, int enable);
> > +void dsi_eotp_rx_en(struct dsi_context *ctx, int enable);
> > +void dsi_eotp_tx_en(struct dsi_context *ctx, int enable);
> > +void dsi_ecc_rx_en(struct dsi_context *ctx, int enable);
> > +void dsi_crc_rx_en(struct dsi_context *ctx, int enable);
> > +bool dsi_is_bta_returned(struct dsi_context *ctx);
> > +bool dsi_is_rx_payload_fifo_full(struct dsi_context *ctx);
> > +bool dsi_is_rx_payload_fifo_empty(struct dsi_context *ctx);
> > +bool dsi_is_tx_payload_fifo_full(struct dsi_context *ctx);
> > +bool dsi_is_tx_payload_fifo_empty(struct dsi_context *ctx);
> > +bool dsi_is_tx_cmd_fifo_empty(struct dsi_context *ctx);
> > +void dsi_datalane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle=
);
> > +void dsi_datalane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle=
);
> > +void dsi_clklane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle)=
;
> > +void dsi_clklane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle)=
;
> > +void dsi_max_read_time(struct dsi_context *ctx, u16 byte_cycle);
> > +void dsi_nc_clk_en(struct dsi_context *ctx, int enable);
> > +void dsi_tx_escape_division(struct dsi_context *ctx, u8 div);
> > +void dsi_timeout_clock_division(struct dsi_context *ctx, u8 div);
> > +void dsi_lp_rx_timeout(struct dsi_context *ctx, u16 count);
> > +void dsi_hs_tx_timeout(struct dsi_context *ctx, u16 count);
> > +u32 dsi_int0_status(struct dsi_context *ctx);
> > +u32 dsi_int1_status(struct dsi_context *ctx);
> > +void dsi_int0_mask(struct dsi_context *ctx, u32 mask);
> > +void dsi_int1_mask(struct dsi_context *ctx, u32 mask);
> > +
> > +#endif /* _DW_DSI_CTRL_H_ */
> > diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
> b/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
> > new file mode 100644
> > index 0000000..6e28d7c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
> > @@ -0,0 +1,157 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +
> > +#include "dw_dsi_ctrl.h"
> > +#include "dw_dsi_ctrl_ppi.h"
> > +
> > +/*
> > + * Reset D-PHY module
> > + */
> > +void dsi_phy_rstz(struct dsi_context *ctx, int level)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x78 phy_interface_ctrl;
> > +
> > +     phy_interface_ctrl.val =3D readl(&reg->PHY_INTERFACE_CTRL);
> > +     phy_interface_ctrl.bits.rf_phy_reset_n =3D level;
> > +
> > +     writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
> > +}
> > +
> > +/*
> > + * Power up/down D-PHY module
> > + */
> > +void dsi_phy_shutdownz(struct dsi_context *ctx, int level)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x78 phy_interface_ctrl;
> > +
> > +     phy_interface_ctrl.val =3D readl(&reg->PHY_INTERFACE_CTRL);
> > +     phy_interface_ctrl.bits.rf_phy_shutdown =3D level;
> > +
> > +     writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
> > +}
> > +
> > +/*
> > + * Configure minimum wait period for HS transmission request after a
> stop state
> > + */
> > +void dsi_phy_stop_wait_time(struct dsi_context *ctx, u8 byte_cycle)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(byte_cycle, &reg->PHY_MIN_STOP_TIME);
> > +}
> > +
> > +/*
> > + * Set number of active lanes
> > + */
> > +void dsi_phy_datalane_en(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +
> > +     writel(ctx->lanes - 1, &reg->PHY_LANE_NUM_CONFIG);
> > +}
> > +
> > +/*
> > + * Enable clock lane module
> > + */
> > +void dsi_phy_clklane_en(struct dsi_context *ctx, int en)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x78 phy_interface_ctrl;
> > +
> > +     phy_interface_ctrl.val =3D readl(&reg->PHY_INTERFACE_CTRL);
> > +     phy_interface_ctrl.bits.rf_phy_clk_en =3D en;
> > +
> > +     writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
> > +}
> > +
> > +/*
> > + * Request the PHY module to start transmission of high speed clock.
> > + * This causes the clock lane to start transmitting DDR clock on the
> > + * lane interconnect.
> > + */
> > +void dsi_phy_clk_hs_rqst(struct dsi_context *ctx, int enable)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x74 phy_clk_lane_lp_ctrl;
> > +
> > +     phy_clk_lane_lp_ctrl.val =3D readl(&reg->PHY_CLK_LANE_LP_CTRL);
> > +     phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en =3D 0;
> > +     phy_clk_lane_lp_ctrl.bits.phy_clklane_tx_req_hs =3D enable;
> > +
> > +     writel(phy_clk_lane_lp_ctrl.val, &reg->PHY_CLK_LANE_LP_CTRL);
> > +}
> > +
> > +/*
> > + * Get D-PHY PPI status
> > + */
> > +u8 dsi_phy_is_pll_locked(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0x9C phy_status;
> > +
> > +     phy_status.val =3D readl(&reg->PHY_STATUS);
> > +
> > +     return phy_status.bits.phy_lock;
> > +}
> > +
> > +void dsi_phy_test_clk(struct dsi_context *ctx, u8 value)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xF0 phy_tst_ctrl0;
> > +
> > +     phy_tst_ctrl0.val =3D readl(&reg->PHY_TST_CTRL0);
> > +     phy_tst_ctrl0.bits.phy_testclk =3D value;
> > +
> > +     writel(phy_tst_ctrl0.val, &reg->PHY_TST_CTRL0);
> > +}
> > +
> > +void dsi_phy_test_clr(struct dsi_context *ctx, u8 value)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xF0 phy_tst_ctrl0;
> > +
> > +     phy_tst_ctrl0.val =3D readl(&reg->PHY_TST_CTRL0);
> > +     phy_tst_ctrl0.bits.phy_testclr =3D value;
> > +
> > +     writel(phy_tst_ctrl0.val, &reg->PHY_TST_CTRL0);
> > +}
> > +
> > +void dsi_phy_test_en(struct dsi_context *ctx, u8 value)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xF4 phy_tst_ctrl1;
> > +
> > +     phy_tst_ctrl1.val =3D readl(&reg->PHY_TST_CTRL1);
> > +     phy_tst_ctrl1.bits.phy_testen =3D value;
> > +
> > +     writel(phy_tst_ctrl1.val, &reg->PHY_TST_CTRL1);
> > +}
> > +
> > +u8 dsi_phy_test_dout(struct dsi_context *ctx)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xF4 phy_tst_ctrl1;
> > +
> > +     phy_tst_ctrl1.val =3D readl(&reg->PHY_TST_CTRL1);
> > +
> > +     return phy_tst_ctrl1.bits.phy_testdout;
> > +}
> > +
> > +void dsi_phy_test_din(struct dsi_context *ctx, u8 data)
> > +{
> > +     struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
> > +     union _0xF4 phy_tst_ctrl1;
> > +
> > +     phy_tst_ctrl1.val =3D readl(&reg->PHY_TST_CTRL1);
> > +     phy_tst_ctrl1.bits.phy_testdin =3D data;
> > +
> > +     writel(phy_tst_ctrl1.val, &reg->PHY_TST_CTRL1);
> > +}
> > diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
> b/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
> > new file mode 100644
> > index 0000000..d87fb75
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#ifndef _DW_DSI_CTRL_PPI_H_
> > +#define _DW_DSI_CTRL_PPI_H_
> > +
> > +#include "sprd_dsi.h"
> > +
> > +void dsi_phy_rstz(struct dsi_context *ctx, int level);
> > +void dsi_phy_shutdownz(struct dsi_context *ctx, int level);
> > +void dsi_phy_force_pll(struct dsi_context *ctx, int force);
> > +void dsi_phy_stop_wait_time(struct dsi_context *ctx, u8 byte_clk);
> > +void dsi_phy_datalane_en(struct dsi_context *ctx);
> > +void dsi_phy_clklane_en(struct dsi_context *ctx, int en);
> > +void dsi_phy_clk_hs_rqst(struct dsi_context *ctx, int en);
> > +u8 dsi_phy_is_pll_locked(struct dsi_context *ctx);
> > +void dsi_phy_test_clk(struct dsi_context *ctx, u8 level);
> > +void dsi_phy_test_clr(struct dsi_context *ctx, u8 level);
> > +void dsi_phy_test_en(struct dsi_context *ctx, u8 level);
> > +u8 dsi_phy_test_dout(struct dsi_context *ctx);
> > +void dsi_phy_test_din(struct dsi_context *ctx, u8 data);
> > +void dsi_phy_bist_en(struct dsi_context *ctx, int en);
> > +
> > +#endif /* _DW_DSI_CTRL_PPI_H_ */
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/sprd/megacores_pll.c
> b/drivers/gpu/drm/sprd/megacores_pll.c
> > new file mode 100644
> > index 0000000..03c1f0f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/megacores_pll.c
> > @@ -0,0 +1,317 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <asm/div64.h>
> > +#include <linux/delay.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/regmap.h>
> > +#include <linux/string.h>
> > +
> > +#include "megacores_pll.h"
> > +
> > +#define L                                            0
> > +#define H                                            1
> > +#define CLK                                          0
> > +#define DATA                                 1
> > +#define INFINITY                             0xffffffff
> > +#define MIN_OUTPUT_FREQ                      (100)
> > +
> > +#define AVERAGE(a, b) (min(a, b) + abs((b) - (a)) / 2)
> > +
> > +/* sharkle */
> > +#define VCO_BAND_LOW 750
> > +#define VCO_BAND_MID 1100
> > +#define VCO_BAND_HIGH        1500
> > +#define PHY_REF_CLK  26000
> > +
> > +static int dphy_calc_pll_param(struct dphy_pll *pll)
> > +{
> > +     const u32 khz =3D 1000;
> > +     const u32 mhz =3D 1000000;
> > +     const unsigned long long factor =3D 100;
> > +     unsigned long long tmp;
> > +     int i;
> > +
> > +     pll->potential_fvco =3D pll->freq / khz;
> > +     pll->ref_clk =3D PHY_REF_CLK / khz;
> > +
> > +     for (i =3D 0; i < 4; ++i) {
> > +             if (pll->potential_fvco >=3D VCO_BAND_LOW &&
> > +                     pll->potential_fvco <=3D VCO_BAND_HIGH) {
> > +                     pll->fvco =3D pll->potential_fvco;
> > +                     pll->out_sel =3D BIT(i);
> > +                     break;
> > +             }
> > +             pll->potential_fvco <<=3D 1;
> > +     }
> > +     if (pll->fvco =3D=3D 0)
> > +             return -EINVAL;
> > +
> > +     if (pll->fvco >=3D VCO_BAND_LOW && pll->fvco <=3D VCO_BAND_MID) {
> > +             /* vco band control */
> > +             pll->vco_band =3D 0x0;
> > +             /* low pass filter control */
> > +             pll->lpf_sel =3D 1;
> > +     } else if (pll->fvco > VCO_BAND_MID && pll->fvco <=3D VCO_BAND_HI=
GH)
> {
> > +             pll->vco_band =3D 0x1;
> > +             pll->lpf_sel =3D 0;
> > +     } else
> > +             return -EINVAL;
> > +
> > +     pll->nint =3D pll->fvco / pll->ref_clk;
> > +     tmp =3D pll->fvco * factor * mhz;
> > +     do_div(tmp, pll->ref_clk);
> > +     tmp =3D tmp - pll->nint * factor * mhz;
> > +     tmp *=3D BIT(20);
> > +     do_div(tmp, 100000000);
> > +     pll->kint =3D (u32)tmp;
> > +     pll->refin =3D 3; /* pre-divider bypass */
> > +     pll->sdm_en =3D true; /* use fraction N PLL */
> > +     pll->fdk_s =3D 0x1; /* fraction */
> > +     pll->cp_s =3D 0x0;
> > +     pll->det_delay =3D 0x1;
> > +
> > +     return 0;
> > +}
> > +
> > +static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap
> *regmap)
> > +{
> > +     struct pll_reg *reg =3D &pll->reg;
> > +     u8 *val;
> > +     int i;
> > +
> > +     u8 reg_addr[] =3D {
> > +             0x03, 0x04, 0x06, 0x08, 0x09,
> > +             0x0a, 0x0b, 0x0e, 0x0f
> > +     };
> > +
> > +     reg->_03.bits.prbs_bist =3D 1;
> > +     reg->_03.bits.en_lp_treot =3D true;
> > +     reg->_03.bits.lpf_sel =3D pll->lpf_sel;
> > +     reg->_03.bits.txfifo_bypass =3D 0;
> > +     reg->_04.bits.div =3D pll->div;
> > +     reg->_04.bits.masterof8lane =3D 1;
> > +     reg->_04.bits.cp_s =3D pll->cp_s;
> > +     reg->_04.bits.fdk_s =3D pll->fdk_s;
> > +     reg->_06.bits.nint =3D pll->nint;
> > +     reg->_08.bits.vco_band =3D pll->vco_band;
> > +     reg->_08.bits.sdm_en =3D pll->sdm_en;
> > +     reg->_08.bits.refin =3D pll->refin;
> > +     reg->_09.bits.kint_h =3D pll->kint >> 12;
> > +     reg->_0a.bits.kint_m =3D (pll->kint >> 4) & 0xff;
> > +     reg->_0b.bits.out_sel =3D pll->out_sel;
> > +     reg->_0b.bits.kint_l =3D pll->kint & 0xf;
> > +     reg->_0e.bits.pll_pu_byp =3D 0;
> > +     reg->_0e.bits.pll_pu =3D 0;
> > +     reg->_0e.bits.stopstate_sel =3D 1;
> > +     reg->_0f.bits.det_delay =3D pll->det_delay;
> > +
> > +     val =3D (u8 *)&reg;
> > +
> > +     for (i =3D 0; i < sizeof(reg_addr); ++i) {
> > +             regmap_write(regmap, reg_addr[i], val[i]);
> > +             DRM_DEBUG("%02x: %02x\n", reg_addr[i], val[i]);
> > +     }
> > +}
> > +
> > +int dphy_pll_config(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     struct regmap *regmap =3D ctx->regmap;
> > +     struct dphy_pll *pll =3D ctx->pll;
> > +     int ret;
> > +
> > +     pll->freq =3D ctx->byte_clk * 8;
> > +
> > +     /* FREQ =3D 26M * (NINT + KINT / 2^20) / out_sel */
> > +     ret =3D dphy_calc_pll_param(pll);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "failed to calculate dphy pll
> parameters\n");
> > +             return ret;
> > +     }
> > +     dphy_set_pll_reg(pll, regmap);
> > +
> > +     return 0;
> > +}
> > +
> > +static void dphy_set_timing_reg(struct regmap *regmap, int type, u8
> val[])
> > +{
> > +     switch (type) {
> > +     case REQUEST_TIME:
> > +             regmap_write(regmap, 0x31, val[CLK]);
> > +             regmap_write(regmap, 0x41, val[DATA]);
> > +             regmap_write(regmap, 0x51, val[DATA]);
> > +             regmap_write(regmap, 0x61, val[DATA]);
> > +             regmap_write(regmap, 0x71, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x90, val[CLK]);
> > +             regmap_write(regmap, 0xa0, val[DATA]);
> > +             regmap_write(regmap, 0xb0, val[DATA]);
> > +             regmap_write(regmap, 0xc0, val[DATA]);
> > +             regmap_write(regmap, 0xd0, val[DATA]);
> > +             break;
> > +     case PREPARE_TIME:
> > +             regmap_write(regmap, 0x32, val[CLK]);
> > +             regmap_write(regmap, 0x42, val[DATA]);
> > +             regmap_write(regmap, 0x52, val[DATA]);
> > +             regmap_write(regmap, 0x62, val[DATA]);
> > +             regmap_write(regmap, 0x72, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x91, val[CLK]);
> > +             regmap_write(regmap, 0xa1, val[DATA]);
> > +             regmap_write(regmap, 0xb1, val[DATA]);
> > +             regmap_write(regmap, 0xc1, val[DATA]);
> > +             regmap_write(regmap, 0xd1, val[DATA]);
> > +             break;
> > +     case ZERO_TIME:
> > +             regmap_write(regmap, 0x33, val[CLK]);
> > +             regmap_write(regmap, 0x43, val[DATA]);
> > +             regmap_write(regmap, 0x53, val[DATA]);
> > +             regmap_write(regmap, 0x63, val[DATA]);
> > +             regmap_write(regmap, 0x73, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x92, val[CLK]);
> > +             regmap_write(regmap, 0xa2, val[DATA]);
> > +             regmap_write(regmap, 0xb2, val[DATA]);
> > +             regmap_write(regmap, 0xc2, val[DATA]);
> > +             regmap_write(regmap, 0xd2, val[DATA]);
> > +             break;
> > +     case TRAIL_TIME:
> > +             regmap_write(regmap, 0x34, val[CLK]);
> > +             regmap_write(regmap, 0x44, val[DATA]);
> > +             regmap_write(regmap, 0x54, val[DATA]);
> > +             regmap_write(regmap, 0x64, val[DATA]);
> > +             regmap_write(regmap, 0x74, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x93, val[CLK]);
> > +             regmap_write(regmap, 0xa3, val[DATA]);
> > +             regmap_write(regmap, 0xb3, val[DATA]);
> > +             regmap_write(regmap, 0xc3, val[DATA]);
> > +             regmap_write(regmap, 0xd3, val[DATA]);
> > +             break;
> > +     case EXIT_TIME:
> > +             regmap_write(regmap, 0x36, val[CLK]);
> > +             regmap_write(regmap, 0x46, val[DATA]);
> > +             regmap_write(regmap, 0x56, val[DATA]);
> > +             regmap_write(regmap, 0x66, val[DATA]);
> > +             regmap_write(regmap, 0x76, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x95, val[CLK]);
> > +             regmap_write(regmap, 0xA5, val[DATA]);
> > +             regmap_write(regmap, 0xB5, val[DATA]);
> > +             regmap_write(regmap, 0xc5, val[DATA]);
> > +             regmap_write(regmap, 0xd5, val[DATA]);
> > +             break;
> > +     case CLKPOST_TIME:
> > +             regmap_write(regmap, 0x35, val[CLK]);
> > +             regmap_write(regmap, 0x94, val[CLK]);
> > +             break;
> > +
> > +     /* the following just use default value */
> > +     case SETTLE_TIME:
> > +     case TA_GET:
> > +     case TA_GO:
> > +     case TA_SURE:
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +}
> > +
> > +void dphy_timing_config(struct dsi_context *ctx)
> > +{
> > +     struct regmap *regmap =3D ctx->regmap;
> > +     struct dphy_pll *pll =3D ctx->pll;
> > +     const u32 factor =3D 2;
> > +     const u32 scale =3D 100;
> > +     u32 t_ui, t_byteck, t_half_byteck;
> > +     u32 range[2], constant;
> > +     u8 val[2];
> > +     u32 tmp =3D 0;
> > +
> > +     /* t_ui: 1 ui, byteck: 8 ui, half byteck: 4 ui */
> > +     t_ui =3D 1000 * scale / (pll->freq / 1000);
> > +     t_byteck =3D t_ui << 3;
> > +     t_half_byteck =3D t_ui << 2;
> > +     constant =3D t_ui << 1;
> > +
> > +     /* REQUEST_TIME: HS T-LPX: LP-01
> > +      * For T-LPX, mipi spec defined min value is 50ns,
> > +      * but maybe it shouldn't be too small, because BTA,
> > +      * LP-10, LP-00, LP-01, all of this is related to T-LPX.
> > +      */
> > +     range[L] =3D 50 * scale;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * (factor << 1), t_byteck) - 2=
;
> > +     val[DATA] =3D val[CLK];
> > +     dphy_set_timing_reg(regmap, REQUEST_TIME, val);
> > +
> > +     /* PREPARE_TIME: HS sequence: LP-00 */
> > +     range[L] =3D 38 * scale;
> > +     range[H] =3D 95 * scale;
> > +     tmp =3D AVERAGE(range[L], range[H]);
> > +     val[CLK] =3D DIV_ROUND_UP(AVERAGE(range[L], range[H]),
> > +                     t_half_byteck) - 1;
> > +     range[L] =3D 40 * scale + 4 * t_ui;
> > +     range[H] =3D 85 * scale + 6 * t_ui;
> > +     tmp |=3D AVERAGE(range[L], range[H]) << 16;
> > +     val[DATA] =3D DIV_ROUND_UP(AVERAGE(range[L], range[H]),
> > +                     t_half_byteck) - 1;
> > +     dphy_set_timing_reg(regmap, PREPARE_TIME, val);
> > +
> > +     /* ZERO_TIME: HS-ZERO */
> > +     range[L] =3D 300 * scale;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * factor + (tmp & 0xffff)
> > +                     - 525 * t_byteck / 100, t_byteck) - 2;
> > +     range[L] =3D 145 * scale + 10 * t_ui;
> > +     val[DATA] =3D DIV_ROUND_UP(range[L] * factor
> > +                     + ((tmp >> 16) & 0xffff) - 525 * t_byteck / 100,
> > +                     t_byteck) - 2;
> > +     dphy_set_timing_reg(regmap, ZERO_TIME, val);
> > +
> > +     /* TRAIL_TIME: HS-TRAIL */
> > +     range[L] =3D 60 * scale;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * factor - constant,
> t_half_byteck);
> > +     range[L] =3D max(8 * t_ui, 60 * scale + 4 * t_ui);
> > +     val[DATA] =3D DIV_ROUND_UP(range[L] * 3 / 2 - constant,
> t_half_byteck) - 2;
> > +     dphy_set_timing_reg(regmap, TRAIL_TIME, val);
> > +
> > +     /* EXIT_TIME: */
> > +     range[L] =3D 100 * scale;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
> > +     val[DATA] =3D val[CLK];
> > +     dphy_set_timing_reg(regmap, EXIT_TIME, val);
> > +
> > +     /* CLKPOST_TIME: */
> > +     range[L] =3D 60 * scale + 52 * t_ui;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
> > +     val[DATA] =3D val[CLK];
> > +     dphy_set_timing_reg(regmap, CLKPOST_TIME, val);
> > +
> > +     /* SETTLE_TIME:
> > +      * This time is used for receiver. So for transmitter,
> > +      * it can be ignored.
> > +      */
> > +
> > +     /* TA_GO:
> > +      * transmitter drives bridge state(LP-00) before releasing contro=
l,
> > +      * reg 0x1f default value: 0x04, which is good.
> > +      */
> > +
> > +     /* TA_SURE:
> > +      * After LP-10 state and before bridge state(LP-00),
> > +      * reg 0x20 default value: 0x01, which is good.
> > +      */
> > +
> > +     /* TA_GET:
> > +      * receiver drives Bridge state(LP-00) before releasing control
> > +      * reg 0x21 default value: 0x03, which is good.
> > +      */
> > +}
> > diff --git a/drivers/gpu/drm/sprd/megacores_pll.h
> b/drivers/gpu/drm/sprd/megacores_pll.h
> > new file mode 100644
> > index 0000000..750dbbc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/megacores_pll.h
> > @@ -0,0 +1,146 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#ifndef _MEGACORES_PLL_H_
> > +#define _MEGACORES_PLL_H_
> > +
> > +#include "sprd_dsi.h"
> > +
> > +enum PLL_TIMING {
> > +     NONE,
> > +     REQUEST_TIME,
> > +     PREPARE_TIME,
> > +     SETTLE_TIME,
> > +     ZERO_TIME,
> > +     TRAIL_TIME,
> > +     EXIT_TIME,
> > +     CLKPOST_TIME,
> > +     TA_GET,
> > +     TA_GO,
> > +     TA_SURE,
> > +     TA_WAIT,
> > +};
> > +
> > +struct pll_reg {
> > +     union __reg_03__ {
> > +             struct __03 {
> > +                     u8 prbs_bist: 1;
> > +                     u8 en_lp_treot: 1;
> > +                     u8 lpf_sel: 4;
> > +                     u8 txfifo_bypass: 1;
> > +                     u8 freq_hopping: 1;
> > +             } bits;
> > +             u8 val;
> > +     } _03;
> > +     union __reg_04__ {
> > +             struct __04 {
> > +                     u8 div: 3;
> > +                     u8 masterof8lane: 1;
> > +                     u8 hop_trig: 1;
> > +                     u8 cp_s: 2;
> > +                     u8 fdk_s: 1;
> > +             } bits;
> > +             u8 val;
> > +     } _04;
> > +     union __reg_06__ {
> > +             struct __06 {
> > +                     u8 nint: 7;
> > +                     u8 mod_en: 1;
> > +             } bits;
> > +             u8 val;
> > +     } _06;
> > +     union __reg_07__ {
> > +             struct __07 {
> > +                     u8 kdelta_h: 8;
> > +             } bits;
> > +             u8 val;
> > +     } _07;
> > +     union __reg_08__ {
> > +             struct __08 {
> > +                     u8 vco_band: 1;
> > +                     u8 sdm_en: 1;
> > +                     u8 refin: 2;
> > +                     u8 kdelta_l: 4;
> > +             } bits;
> > +             u8 val;
> > +     } _08;
> > +     union __reg_09__ {
> > +             struct __09 {
> > +                     u8 kint_h: 8;
> > +             } bits;
> > +             u8 val;
> > +     } _09;
> > +     union __reg_0a__ {
> > +             struct __0a {
> > +                     u8 kint_m: 8;
> > +             } bits;
> > +             u8 val;
> > +     } _0a;
> > +     union __reg_0b__ {
> > +             struct __0b {
> > +                     u8 out_sel: 4;
> > +                     u8 kint_l: 4;
> > +             } bits;
> > +             u8 val;
> > +     } _0b;
> > +     union __reg_0c__ {
> > +             struct __0c {
> > +                     u8 kstep_h: 8;
> > +             } bits;
> > +             u8 val;
> > +     } _0c;
> > +     union __reg_0d__ {
> > +             struct __0d {
> > +                     u8 kstep_m: 8;
> > +             } bits;
> > +             u8 val;
> > +     } _0d;
> > +     union __reg_0e__ {
> > +             struct __0e {
> > +                     u8 pll_pu_byp: 1;
> > +                     u8 pll_pu: 1;
> > +                     u8 hsbist_len: 2;
> > +                     u8 stopstate_sel: 1;
> > +                     u8 kstep_l: 3;
> > +             } bits;
> > +             u8 val;
> > +     } _0e;
> > +     union __reg_0f__ {
> > +             struct __0f {
> > +                     u8 det_delay:2;
> > +                     u8 kdelta: 4;
> > +                     u8 ldo0p4:2;
> > +             } bits;
> > +             u8 val;
> > +     } _0f;
> > +};
> > +
> > +struct dphy_pll {
> > +     u8 refin; /* Pre-divider control signal */
> > +     u8 cp_s; /* 00: SDM_EN=3D1, 10: SDM_EN=3D0 */
> > +     u8 fdk_s; /* PLL mode control: integer or fraction */
> > +     u8 sdm_en;
> > +     u8 div;
> > +     u8 int_n; /* integer N PLL */
> > +     u32 ref_clk; /* dphy reference clock, unit: MHz */
> > +     u32 freq; /* panel config, unit: KHz */
> > +     u32 fvco;
> > +     u32 potential_fvco;
> > +     u32 nint; /* sigma delta modulator NINT control */
> > +     u32 kint; /* sigma delta modulator KINT control */
> > +     u8 lpf_sel; /* low pass filter control */
> > +     u8 out_sel; /* post divider control */
> > +     u8 vco_band; /* vco range */
> > +     u8 det_delay;
> > +
> > +     struct pll_reg reg;
> > +};
> > +
> > +struct dsi_context;
> > +
> > +int dphy_pll_config(struct dsi_context *ctx);
> > +void dphy_timing_config(struct dsi_context *ctx);
> > +
> > +#endif /* _MEGACORES_PLL_H_ */
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
> > index ca93be2..5323e23 100644
> > --- a/drivers/gpu/drm/sprd/sprd_drm.c
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -197,6 +197,7 @@ static struct platform_driver sprd_drm_driver =3D {
> >  static struct platform_driver *sprd_drm_drivers[]  =3D {
> >       &sprd_drm_driver,
> >       &sprd_dpu_driver,
> > +     &sprd_dsi_driver,
> >  };
> >
> >  static int __init sprd_drm_init(void)
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
> b/drivers/gpu/drm/sprd/sprd_drm.h
> > index 85d4a8b..95d1b97 100644
> > --- a/drivers/gpu/drm/sprd/sprd_drm.h
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> > @@ -14,5 +14,6 @@ struct sprd_drm {
> >  };
> >
> >  extern struct platform_driver sprd_dpu_driver;
> > +extern struct platform_driver sprd_dsi_driver;
> >
> >  #endif /* _SPRD_DRM_H_ */
> > diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c
> b/drivers/gpu/drm/sprd/sprd_dsi.c
> > new file mode 100644
> > index 0000000..4ebc1aa
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> > @@ -0,0 +1,1162 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <linux/component.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_graph.h>
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "sprd_drm.h"
> > +#include "sprd_dpu.h"
> > +#include "sprd_dsi.h"
> > +#include "dw_dsi_ctrl.h"
> > +#include "dw_dsi_ctrl_ppi.h"
> > +
> > +#define encoder_to_dsi(encoder) \
> > +     container_of(encoder, struct sprd_dsi, encoder)
> > +#define host_to_dsi(host) \
> > +     container_of(host, struct sprd_dsi, host)
> > +#define connector_to_dsi(connector) \
> > +     container_of(connector, struct sprd_dsi, connector)
> > +
> > +static int regmap_tst_io_write(void *context, u32 reg, u32 val)
> > +{
> > +     struct sprd_dsi *dsi =3D context;
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +
> > +     if (val > 0xff || reg > 0xff)
> > +             return -EINVAL;
> > +
> > +     drm_dbg(dsi->drm, "reg =3D 0x%02x, val =3D 0x%02x\n", reg, val);
> > +
> > +     dsi_phy_test_en(ctx, 1);
> > +     dsi_phy_test_din(ctx, reg);
> > +     dsi_phy_test_clk(ctx, 1);
> > +     dsi_phy_test_clk(ctx, 0);
> > +     dsi_phy_test_en(ctx, 0);
> > +     dsi_phy_test_din(ctx, val);
> > +     dsi_phy_test_clk(ctx, 1);
> > +     dsi_phy_test_clk(ctx, 0);
> > +
> > +     return 0;
> > +}
> > +
> > +static int regmap_tst_io_read(void *context, u32 reg, u32 *val)
> > +{
> > +     struct sprd_dsi *dsi =3D context;
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +     int ret;
> > +
> > +     if (reg > 0xff)
> > +             return -EINVAL;
> > +
> > +     dsi_phy_test_en(ctx, 1);
> > +     dsi_phy_test_din(ctx, reg);
> > +     dsi_phy_test_clk(ctx, 1);
> > +     dsi_phy_test_clk(ctx, 0);
> > +     dsi_phy_test_en(ctx, 0);
> > +
> > +     udelay(1);
> > +
> > +     ret =3D dsi_phy_test_dout(ctx);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     *val =3D ret;
> > +
> > +     drm_dbg(dsi->drm, "reg =3D 0x%02x, val =3D 0x%02x\n", reg, *val);
> > +     return 0;
> > +}
> > +
> > +static struct regmap_bus regmap_tst_io =3D {
> > +     .reg_write =3D regmap_tst_io_write,
> > +     .reg_read =3D regmap_tst_io_read,
> > +};
> > +
> > +static const struct regmap_config byte_config =3D {
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 8,
> > +};
> > +
> > +static int dphy_wait_pll_locked(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     int i;
> > +
> > +     for (i =3D 0; i < 50000; i++) {
> > +             if (dsi_phy_is_pll_locked(ctx))
> > +                     return 0;
> > +             udelay(3);
> > +     }
> > +
> > +     drm_err(dsi->drm, "dphy pll can not be locked\n");
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static int dsi_wait_tx_payload_fifo_empty(struct dsi_context *ctx)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < 5000; i++) {
> > +             if (dsi_is_tx_payload_fifo_empty(ctx))
> > +                     return 0;
> > +             udelay(1);
> > +     }
> > +
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static int dsi_wait_tx_cmd_fifo_empty(struct dsi_context *ctx)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < 5000; i++) {
> > +             if (dsi_is_tx_cmd_fifo_empty(ctx))
> > +                     return 0;
> > +             udelay(1);
> > +     }
> > +
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static int dsi_wait_rd_resp_completed(struct dsi_context *ctx)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < 10000; i++) {
> > +             if (dsi_is_bta_returned(ctx))
> > +                     return 0;
> > +             udelay(10);
> > +     }
> > +
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static u16 calc_bytes_per_pixel_x100(int coding)
> > +{
> > +     u16 Bpp_x100;
> > +
> > +     switch (coding) {
> > +     case COLOR_CODE_16BIT_CONFIG1:
> > +     case COLOR_CODE_16BIT_CONFIG2:
> > +     case COLOR_CODE_16BIT_CONFIG3:
> > +             Bpp_x100 =3D 200;
> > +             break;
> > +     case COLOR_CODE_18BIT_CONFIG1:
> > +     case COLOR_CODE_18BIT_CONFIG2:
> > +             Bpp_x100 =3D 225;
> > +             break;
> > +     case COLOR_CODE_24BIT:
> > +             Bpp_x100 =3D 300;
> > +             break;
> > +     case COLOR_CODE_COMPRESSTION:
> > +             Bpp_x100 =3D 100;
> > +             break;
> > +     case COLOR_CODE_20BIT_YCC422_LOOSELY:
> > +             Bpp_x100 =3D 250;
> > +             break;
> > +     case COLOR_CODE_24BIT_YCC422:
> > +             Bpp_x100 =3D 300;
> > +             break;
> > +     case COLOR_CODE_16BIT_YCC422:
> > +             Bpp_x100 =3D 200;
> > +             break;
> > +     case COLOR_CODE_30BIT:
> > +             Bpp_x100 =3D 375;
> > +             break;
> > +     case COLOR_CODE_36BIT:
> > +             Bpp_x100 =3D 450;
> > +             break;
> > +     case COLOR_CODE_12BIT_YCC420:
> > +             Bpp_x100 =3D 150;
> > +             break;
> > +     default:
> > +             DRM_ERROR("invalid color coding");
> > +             Bpp_x100 =3D 0;
> > +             break;
> > +     }
> > +
> > +     return Bpp_x100;
> > +}
> > +
> > +static u8 calc_video_size_step(int coding)
> > +{
> > +     u8 video_size_step;
> > +
> > +     switch (coding) {
> > +     case COLOR_CODE_16BIT_CONFIG1:
> > +     case COLOR_CODE_16BIT_CONFIG2:
> > +     case COLOR_CODE_16BIT_CONFIG3:
> > +     case COLOR_CODE_18BIT_CONFIG1:
> > +     case COLOR_CODE_18BIT_CONFIG2:
> > +     case COLOR_CODE_24BIT:
> > +     case COLOR_CODE_COMPRESSTION:
> > +             return video_size_step =3D 1;
> > +     case COLOR_CODE_20BIT_YCC422_LOOSELY:
> > +     case COLOR_CODE_24BIT_YCC422:
> > +     case COLOR_CODE_16BIT_YCC422:
> > +     case COLOR_CODE_30BIT:
> > +     case COLOR_CODE_36BIT:
> > +     case COLOR_CODE_12BIT_YCC420:
> > +             return video_size_step =3D 2;
> > +     default:
> > +             DRM_ERROR("invalid color coding");
> > +             return 0;
> > +     }
> > +}
> > +
> > +static u16 round_video_size(int coding, u16 video_size)
> > +{
> > +     switch (coding) {
> > +     case COLOR_CODE_16BIT_YCC422:
> > +     case COLOR_CODE_24BIT_YCC422:
> > +     case COLOR_CODE_20BIT_YCC422_LOOSELY:
> > +     case COLOR_CODE_12BIT_YCC420:
> > +             /* round up active H pixels to a multiple of 2 */
> > +             if ((video_size % 2) !=3D 0)
> > +                     video_size +=3D 1;
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return video_size;
> > +}
> > +
> > +#define SPRD_MIPI_DSI_FMT_DSC 0xff
> > +static u32 fmt_to_coding(u32 fmt)
> > +{
> > +     switch (fmt) {
> > +     case MIPI_DSI_FMT_RGB565:
> > +             return COLOR_CODE_16BIT_CONFIG1;
> > +     case MIPI_DSI_FMT_RGB666:
> > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > +             return COLOR_CODE_18BIT_CONFIG1;
> > +     case MIPI_DSI_FMT_RGB888:
> > +             return COLOR_CODE_24BIT;
> > +     case SPRD_MIPI_DSI_FMT_DSC:
> > +             return COLOR_CODE_COMPRESSTION;
> > +     default:
> > +             DRM_ERROR("Unsupported format (%d)\n", fmt);
> > +             return COLOR_CODE_24BIT;
> > +     }
> > +}
> > +
> > +#define ns_to_cycle(ns, byte_clk) \
> > +     DIV_ROUND_UP((ns) * (byte_clk), 1000000)
> > +
> > +static void sprd_dsi_init(struct dsi_context *ctx)
> > +{
> > +     u16 data_hs2lp, data_lp2hs, clk_hs2lp, clk_lp2hs;
> > +     u16 max_rd_time;
> > +     int div;
> > +
> > +     dsi_power_enable(ctx, 0);
> > +     dsi_int0_mask(ctx, 0xffffffff);
> > +     dsi_int1_mask(ctx, 0xffffffff);
> > +     dsi_cmd_mode(ctx);
> > +     dsi_eotp_rx_en(ctx, 0);
> > +     dsi_eotp_tx_en(ctx, 0);
> > +     dsi_ecc_rx_en(ctx, 1);
> > +     dsi_crc_rx_en(ctx, 1);
> > +     dsi_bta_en(ctx, 1);
> > +     dsi_video_vcid(ctx, 0);
> > +     dsi_rx_vcid(ctx, 0);
> > +
> > +     div =3D DIV_ROUND_UP(ctx->byte_clk, ctx->esc_clk);
> > +     dsi_tx_escape_division(ctx, div);
> > +
> > +     max_rd_time =3D ns_to_cycle(ctx->max_rd_time, ctx->byte_clk);
> > +     dsi_max_read_time(ctx, max_rd_time);
> > +
> > +     data_hs2lp =3D ns_to_cycle(ctx->data_hs2lp, ctx->byte_clk);
> > +     data_lp2hs =3D ns_to_cycle(ctx->data_lp2hs, ctx->byte_clk);
> > +     clk_hs2lp =3D ns_to_cycle(ctx->clk_hs2lp, ctx->byte_clk);
> > +     clk_lp2hs =3D ns_to_cycle(ctx->clk_lp2hs, ctx->byte_clk);
> > +     dsi_datalane_hs2lp_config(ctx, data_hs2lp);
> > +     dsi_datalane_lp2hs_config(ctx, data_lp2hs);
> > +     dsi_clklane_hs2lp_config(ctx, clk_hs2lp);
> > +     dsi_clklane_lp2hs_config(ctx, clk_lp2hs);
> > +
> > +     dsi_power_enable(ctx, 1);
> > +}
> > +
> > +/*
> > + * Free up resources and shutdown host controller and PHY
> > + */
> > +static void sprd_dsi_fini(struct dsi_context *ctx)
> > +{
> > +     dsi_int0_mask(ctx, 0xffffffff);
> > +     dsi_int1_mask(ctx, 0xffffffff);
> > +     dsi_power_enable(ctx, 0);
> > +}
> > +
> > +/*
> > + * If not in burst mode, it will compute the video and null packet siz=
es
> > + * according to necessity.
> > + * Configure timers for data lanes and/or clock lane to return to LP
> when
> > + * bandwidth is not filled by data.
> > + */
> > +static int sprd_dsi_dpi_video(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     struct videomode *vm =3D &ctx->vm;
> > +     u16 Bpp_x100;
> > +     u16 video_size;
> > +     u32 ratio_x1000;
> > +     u16 null_pkt_size =3D 0;
> > +     u8 video_size_step;
> > +     u32 hs_to;
> > +     u32 total_bytes;
> > +     u32 bytes_per_chunk;
> > +     u32 chunks =3D 0;
> > +     u32 bytes_left =3D 0;
> > +     u32 chunk_overhead;
> > +     const u8 pkt_header =3D 6;
> > +     u8 coding;
> > +     int div;
> > +     u16 hline;
> > +
> > +     coding =3D fmt_to_coding(ctx->format);
> > +     video_size =3D round_video_size(coding, vm->hactive);
> > +     Bpp_x100 =3D calc_bytes_per_pixel_x100(coding);
> > +     video_size_step =3D calc_video_size_step(coding);
> > +     ratio_x1000 =3D ctx->byte_clk * 1000 / (vm->pixelclock / 1000);
> > +     hline =3D vm->hactive + vm->hsync_len + vm->hfront_porch +
> > +             vm->hback_porch;
> > +
> > +     dsi_power_enable(ctx, 0);
> > +     dsi_dpi_frame_ack_en(ctx, ctx->frame_ack_en);
> > +     dsi_dpi_color_coding(ctx, coding);
> > +     dsi_dpi_video_burst_mode(ctx, ctx->burst_mode);
> > +     dsi_dpi_sig_delay(ctx, 95 * hline * ratio_x1000 / 100000);
> > +     dsi_dpi_hline_time(ctx, hline * ratio_x1000 / 1000);
> > +     dsi_dpi_hsync_time(ctx, vm->hsync_len * ratio_x1000 / 1000);
> > +     dsi_dpi_hbp_time(ctx, vm->hback_porch * ratio_x1000 / 1000);
> > +     dsi_dpi_vact(ctx, vm->vactive);
> > +     dsi_dpi_vfp(ctx, vm->vfront_porch);
> > +     dsi_dpi_vbp(ctx, vm->vback_porch);
> > +     dsi_dpi_vsync(ctx, vm->vsync_len);
> > +     dsi_dpi_hporch_lp_en(ctx, 1);
> > +     dsi_dpi_vporch_lp_en(ctx, 1);
> > +
> > +     hs_to =3D (hline * vm->vactive) + (2 * Bpp_x100) / 100;
> > +     for (div =3D 0x80; (div < hs_to) && (div > 2); div--) {
> > +             if ((hs_to % div) =3D=3D 0) {
> > +                     dsi_timeout_clock_division(ctx, div);
> > +                     dsi_lp_rx_timeout(ctx, hs_to / div);
> > +                     dsi_hs_tx_timeout(ctx, hs_to / div);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (ctx->burst_mode =3D=3D VIDEO_BURST_WITH_SYNC_PULSES) {
> > +             dsi_dpi_video_packet_size(ctx, video_size);
> > +             dsi_dpi_null_packet_size(ctx, 0);
> > +             dsi_dpi_chunk_num(ctx, 0);
> > +     } else {
> > +             /* non burst transmission */
> > +             null_pkt_size =3D 0;
> > +
> > +             /* bytes to be sent - first as one chunk */
> > +             bytes_per_chunk =3D vm->hactive * Bpp_x100 / 100 +
> pkt_header;
> > +
> > +             /* hline total bytes from the DPI interface */
> > +             total_bytes =3D (vm->hactive + vm->hfront_porch) *
> > +                             ratio_x1000 / ctx->lanes / 1000;
> > +
> > +             /* check if the pixels actually fit on the DSI link */
> > +             if (total_bytes < bytes_per_chunk) {
> > +                     drm_err(dsi->drm, "current resolution can not be
> set\n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             chunk_overhead =3D total_bytes - bytes_per_chunk;
> > +
> > +             /* overhead higher than 1 -> enable multi packets */
> > +             if (chunk_overhead > 1) {
> > +
> > +                     /* multi packets */
> > +                     for (video_size =3D video_size_step;
> > +                          video_size < vm->hactive;
> > +                          video_size +=3D video_size_step) {
> > +
> > +                             if (vm->hactive * 1000 / video_size % 100=
0)
> > +                                     continue;
> > +
> > +                             chunks =3D vm->hactive / video_size;
> > +                             bytes_per_chunk =3D Bpp_x100 * video_size=
 /
> 100
> > +                                               + pkt_header;
> > +                             if (total_bytes >=3D (bytes_per_chunk *
> chunks)) {
> > +                                     bytes_left =3D total_bytes -
> > +                                                  bytes_per_chunk *
> chunks;
> > +                                     break;
> > +                             }
> > +                     }
> > +
> > +                     /* prevent overflow (unsigned - unsigned) */
> > +                     if (bytes_left > (pkt_header * chunks)) {
> > +                             null_pkt_size =3D (bytes_left -
> > +                                             pkt_header * chunks) /
> chunks;
> > +                             /* avoid register overflow */
> > +                             if (null_pkt_size > 1023)
> > +                                     null_pkt_size =3D 1023;
> > +                     }
> > +
> > +             } else {
> > +
> > +                     /* single packet */
> > +                     chunks =3D 1;
> > +
> > +                     /* must be a multiple of 4 except 18 loosely */
> > +                     for (video_size =3D vm->hactive;
> > +                         (video_size % video_size_step) !=3D 0;
> > +                          video_size++)
> > +                             ;
> > +             }
> > +
> > +             dsi_dpi_video_packet_size(ctx, video_size);
> > +             dsi_dpi_null_packet_size(ctx, null_pkt_size);
> > +             dsi_dpi_chunk_num(ctx, chunks);
> > +     }
> > +
> > +     dsi_int0_mask(ctx, ctx->int0_mask);
> > +     dsi_int1_mask(ctx, ctx->int1_mask);
> > +     dsi_power_enable(ctx, 1);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_dsi_edpi_video(struct dsi_context *ctx)
> > +{
> > +     const u32 fifo_depth =3D 1096;
> > +     const u32 word_length =3D 4;
> > +     u32 hactive =3D ctx->vm.hactive;
> > +     u32 Bpp_x100;
> > +     u32 max_fifo_len;
> > +     u8 coding;
> > +
> > +     coding =3D fmt_to_coding(ctx->format);
> > +     Bpp_x100 =3D calc_bytes_per_pixel_x100(coding);
> > +     max_fifo_len =3D word_length * fifo_depth * 100 / Bpp_x100;
> > +
> > +     dsi_power_enable(ctx, 0);
> > +     dsi_dpi_color_coding(ctx, coding);
> > +     dsi_tear_effect_ack_en(ctx, ctx->te_ack_en);
> > +
> > +     if (max_fifo_len > hactive)
> > +             dsi_edpi_max_pkt_size(ctx, hactive);
> > +     else
> > +             dsi_edpi_max_pkt_size(ctx, max_fifo_len);
> > +
> > +     dsi_int0_mask(ctx, ctx->int0_mask);
> > +     dsi_int1_mask(ctx, ctx->int1_mask);
> > +     dsi_power_enable(ctx, 1);
> > +}
> > +
> > +/*
> > + * Send a packet on the generic interface,
> > + * this function has an active delay to wait for the buffer to clear.
> > + * The delay is limited to:
> > + * (param_length / 4) x DSIH_FIFO_ACTIVE_WAIT x register access time
> > + * the controller restricts the sending of.
> > + *
> > + * This function will not be able to send Null and Blanking packets du=
e
> to
> > + * controller restriction
> > + */
> > +static int sprd_dsi_wr_pkt(struct dsi_context *ctx, u8 vc, u8 type,
> > +                     const u8 *param, u16 len)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     u8 wc_lsbyte, wc_msbyte;
> > +     u32 payload;
> > +     int i, j, ret;
> > +
> > +     if (vc > 3)
> > +             return -EINVAL;
> > +
> > +
> > +     /* 1st: for long packet, must config payload first */
> > +     ret =3D dsi_wait_tx_payload_fifo_empty(ctx);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "tx payload fifo is not empty\n");
> > +             return ret;
> > +     }
> > +
> > +     if (len > 2) {
> > +             for (i =3D 0, j =3D 0; i < len; i +=3D j) {
> > +                     payload =3D 0;
> > +                     for (j =3D 0; (j < 4) && ((j + i) < (len)); j++)
> > +                             payload |=3D param[i + j] << (j * 8);
> > +
> > +                     dsi_set_packet_payload(ctx, payload);
> > +             }
> > +             wc_lsbyte =3D len & 0xff;
> > +             wc_msbyte =3D len >> 8;
> > +     } else {
> > +             wc_lsbyte =3D (len > 0) ? param[0] : 0;
> > +             wc_msbyte =3D (len > 1) ? param[1] : 0;
> > +     }
> > +
> > +     /* 2nd: then set packet header */
> > +     ret =3D dsi_wait_tx_cmd_fifo_empty(ctx);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "tx cmd fifo is not empty\n");
> > +             return ret;
> > +     }
> > +
> > +     dsi_set_packet_header(ctx, vc, type, wc_lsbyte, wc_msbyte);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * Send READ packet to peripheral using the generic interface,
> > + * this will force command mode and stop video mode (because of BTA).
> > + *
> > + * This function has an active delay to wait for the buffer to clear,
> > + * the delay is limited to 2 x DSIH_FIFO_ACTIVE_WAIT
> > + * (waiting for command buffer, and waiting for receiving)
> > + * @note this function will enable BTA
> > + */
> > +static int sprd_dsi_rd_pkt(struct dsi_context *ctx, u8 vc, u8 type,
> > +                     u8 msb_byte, u8 lsb_byte,
> > +                     u8 *buffer, u8 bytes_to_read)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     int i, ret;
> > +     int count =3D 0;
> > +     u32 temp;
> > +
> > +     if (vc > 3)
> > +             return -EINVAL;
> > +
> > +     /* 1st: send read command to peripheral */
> > +     if (!dsi_is_tx_cmd_fifo_empty(ctx))
> > +             return -EIO;
> > +
> > +     dsi_set_packet_header(ctx, vc, type, lsb_byte, msb_byte);
> > +
> > +     /* 2nd: wait peripheral response completed */
> > +     ret =3D dsi_wait_rd_resp_completed(ctx);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "wait read response time out\n");
> > +             return ret;
> > +     }
> > +
> > +     /* 3rd: get data from rx payload fifo */
> > +     if (dsi_is_rx_payload_fifo_empty(ctx)) {
> > +             drm_err(dsi->drm, "rx payload fifo empty\n");
> > +             return -EIO;
> > +     }
> > +
> > +     for (i =3D 0; i < 100; i++) {
> > +             temp =3D dsi_get_rx_payload(ctx);
> > +
> > +             if (count < bytes_to_read)
> > +                     buffer[count++] =3D temp & 0xff;
> > +             if (count < bytes_to_read)
> > +                     buffer[count++] =3D (temp >> 8) & 0xff;
> > +             if (count < bytes_to_read)
> > +                     buffer[count++] =3D (temp >> 16) & 0xff;
> > +             if (count < bytes_to_read)
> > +                     buffer[count++] =3D (temp >> 24) & 0xff;
> > +
> > +             if (dsi_is_rx_payload_fifo_empty(ctx))
> > +                     return count;
> > +             else {
> > +                     drm_err(dsi->drm, "read too many buffers\n");
> > +                     return -EIO;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_dsi_set_work_mode(struct dsi_context *ctx, u8 mode)
> > +{
> > +     if (mode =3D=3D DSI_MODE_CMD)
> > +             dsi_cmd_mode(ctx);
> > +     else
> > +             dsi_video_mode(ctx);
> > +}
> > +
> > +static void sprd_dsi_lp_cmd_enable(struct dsi_context *ctx, bool enabl=
e)
> > +{
> > +     if (dsi_is_cmd_mode(ctx))
> > +             dsi_cmd_mode_lp_cmd_en(ctx, enable);
> > +     else
> > +             dsi_video_mode_lp_cmd_en(ctx, enable);
> > +}
> > +
> > +static void sprd_dsi_state_reset(struct dsi_context *ctx)
> > +{
> > +     dsi_power_enable(ctx, 0);
> > +     udelay(100);
> > +     dsi_power_enable(ctx, 1);
> > +}
> > +
> > +static u32 sprd_dsi_int_status(struct dsi_context *ctx, int index)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     u32 status;
> > +
> > +     if (0 =3D=3D index)
> > +             status =3D dsi_int0_status(ctx);
> > +     else if (1 =3D=3D index)
> > +             status =3D dsi_int1_status(ctx);
> > +     else {
> > +             drm_err(dsi->drm, "invalid dsi IRQ index %d\n", index);
> > +             status =3D -EINVAL;
> > +     }
> > +
> > +     return status;
> > +}
> > +
> > +static int sprd_dphy_init(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     int ret;
> > +
> > +     dsi_phy_rstz(ctx, 0);
> > +     dsi_phy_shutdownz(ctx, 0);
> > +     dsi_phy_clklane_en(ctx, 0);
> > +
> > +     dsi_phy_test_clr(ctx, 0);
> > +     dsi_phy_test_clr(ctx, 1);
> > +     dsi_phy_test_clr(ctx, 0);
> > +
> > +     dphy_pll_config(ctx);
> > +     dphy_timing_config(ctx);
> > +
> > +     dsi_phy_shutdownz(ctx, 1);
> > +     dsi_phy_rstz(ctx, 1);
> > +     dsi_phy_stop_wait_time(ctx, 0x1C);
> > +     dsi_phy_clklane_en(ctx, 1);
> > +     dsi_phy_datalane_en(ctx);
> > +
> > +     ret =3D dphy_wait_pll_locked(ctx);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "dphy initial failed\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_dphy_fini(struct dsi_context *ctx)
> > +{
> > +     dsi_phy_rstz(ctx, 0);
> > +     dsi_phy_shutdownz(ctx, 0);
> > +     dsi_phy_rstz(ctx, 1);
> > +}
> > +
> > +static void sprd_dsi_encoder_enable(struct drm_encoder *encoder)
> > +{
> > +     struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(encoder->crtc);
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +
> > +     if (ctx->enabled) {
> > +             drm_warn(dsi->drm, "dsi is initialized\n");
> > +             return;
> > +     }
> > +
> > +     sprd_dsi_init(ctx);
> > +     if (ctx->work_mode =3D=3D DSI_MODE_VIDEO)
> > +             sprd_dsi_dpi_video(ctx);
> > +     else
> > +             sprd_dsi_edpi_video(ctx);
> > +
> > +     sprd_dphy_init(ctx);
> > +
> > +     sprd_dsi_lp_cmd_enable(ctx, true);
> > +
> > +     if (dsi->panel) {
> > +             drm_panel_prepare(dsi->panel);
> > +             drm_panel_enable(dsi->panel);
> > +     }
> > +
> > +     sprd_dsi_set_work_mode(ctx, ctx->work_mode);
> > +     sprd_dsi_state_reset(ctx);
> > +
> > +     if (ctx->nc_clk_en)
> > +             dsi_nc_clk_en(ctx, true);
> > +     else {
> > +             dsi_phy_clk_hs_rqst(ctx, true);
> > +             dphy_wait_pll_locked(ctx);
> > +     }
> > +
> > +     sprd_dpu_run(dpu);
> > +
> > +     ctx->enabled =3D true;
> > +}
> > +
> > +static void sprd_dsi_encoder_disable(struct drm_encoder *encoder)
> > +{
> > +     struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(encoder->crtc);
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +
> > +     if (!ctx->enabled) {
> > +             drm_warn(dsi->drm, "dsi isn't initialized\n");
> > +             return;
> > +     }
> > +
> > +     sprd_dpu_stop(dpu);
> > +     sprd_dsi_set_work_mode(ctx, DSI_MODE_CMD);
> > +     sprd_dsi_lp_cmd_enable(ctx, true);
> > +
> > +     if (dsi->panel) {
> > +             drm_panel_disable(dsi->panel);
> > +             drm_panel_unprepare(dsi->panel);
> > +     }
> > +
> > +     sprd_dphy_fini(ctx);
> > +     sprd_dsi_fini(ctx);
> > +
> > +     ctx->enabled =3D false;
> > +}
> > +
> > +static void sprd_dsi_encoder_mode_set(struct drm_encoder *encoder,
> > +                              struct drm_display_mode *mode,
> > +                              struct drm_display_mode *adj_mode)
> > +{
> > +     struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);
> > +
> > +     drm_dbg(dsi->drm, "%s() set mode: %s\n", __func__,
> dsi->mode->name);
> > +}
> > +
> > +static int sprd_dsi_encoder_atomic_check(struct drm_encoder *encoder,
> > +                                 struct drm_crtc_state *crtc_state,
> > +                                 struct drm_connector_state *conn_stat=
e)
> > +{
> > +     return 0;
> > +}
> > +
> > +static const struct drm_encoder_helper_funcs sprd_encoder_helper_funcs
> =3D {
> > +     .atomic_check   =3D sprd_dsi_encoder_atomic_check,
> > +     .mode_set       =3D sprd_dsi_encoder_mode_set,
> > +     .enable         =3D sprd_dsi_encoder_enable,
> > +     .disable        =3D sprd_dsi_encoder_disable
> > +};
> > +
> > +static const struct drm_encoder_funcs sprd_encoder_funcs =3D {
> > +     .destroy =3D drm_encoder_cleanup,
> > +};
> > +
> > +static int sprd_dsi_encoder_init(struct drm_device *drm,
> > +                            struct sprd_dsi *dsi)
> > +{
> > +     struct drm_encoder *encoder =3D &dsi->encoder;
> > +     struct device *dev =3D dsi->host.dev;
> > +     u32 crtc_mask;
> > +     int ret;
> > +
> > +     crtc_mask =3D drm_of_find_possible_crtcs(drm, dev->of_node);
> > +     if (!crtc_mask) {
> > +             drm_err(drm, "failed to find crtc mask\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     drm_dbg(dsi->drm, "find possible crtcs: 0x%08x\n", crtc_mask);
> > +
> > +     encoder->possible_crtcs =3D crtc_mask;
> > +     ret =3D drm_encoder_init(drm, encoder, &sprd_encoder_funcs,
> > +                            DRM_MODE_ENCODER_DSI, NULL);
> > +     if (ret) {
> > +             drm_err(drm, "failed to init dsi encoder\n");
> > +             return ret;
> > +     }
> > +
> > +     drm_encoder_helper_add(encoder, &sprd_encoder_helper_funcs);
> > +
> > +     return 0;
> > +}
> > +
> > +static int sprd_dsi_find_panel(struct sprd_dsi *dsi)
> > +{
> > +     struct device *dev =3D dsi->host.dev;
> > +     struct device_node *child, *lcds_node;
> > +     struct drm_panel *panel;
> > +
> > +     /* search /lcds child node first */
> > +     lcds_node =3D of_find_node_by_path("/lcds");
> > +     for_each_child_of_node(lcds_node, child) {
> > +             panel =3D of_drm_find_panel(child);
> > +             if (!IS_ERR(panel)) {
> > +                     dsi->panel =3D panel;
> > +                     return 0;
> > +             }
> > +     }
> > +
> > +     /*
> > +      * If /lcds child node search failed, we search
> > +      * the child of dsi host node.
> > +      */
> > +     for_each_child_of_node(dev->of_node, child) {
> > +             panel =3D of_drm_find_panel(child);
> > +             if (!IS_ERR(panel)) {
> > +                     dsi->panel =3D panel;
> > +                     return 0;
> > +             }
> > +     }
> > +
> > +     drm_err(dsi->drm, "of_drm_find_panel() failed\n");
> > +     return -ENODEV;
> > +}
> > +
> > +static int sprd_dsi_host_attach(struct mipi_dsi_host *host,
> > +                        struct mipi_dsi_device *slave)
> > +{
> > +     struct sprd_dsi *dsi =3D host_to_dsi(host);
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +     int ret;
> > +
> > +     dsi->slave =3D slave;
> > +     ctx->lanes =3D slave->lanes;
> > +     ctx->format =3D slave->format;
> > +     ctx->byte_clk =3D slave->hs_rate / 8;
> > +     ctx->esc_clk =3D slave->lp_rate;
> > +
> > +     if (slave->mode_flags & MIPI_DSI_MODE_VIDEO)
> > +             ctx->work_mode =3D DSI_MODE_VIDEO;
> > +     else
> > +             ctx->work_mode =3D DSI_MODE_CMD;
> > +
> > +     if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> > +             ctx->burst_mode =3D VIDEO_BURST_WITH_SYNC_PULSES;
> > +     else if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> > +             ctx->burst_mode =3D VIDEO_NON_BURST_WITH_SYNC_PULSES;
> > +     else
> > +             ctx->burst_mode =3D VIDEO_NON_BURST_WITH_SYNC_EVENTS;
> > +
> > +     if (slave->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> > +             ctx->nc_clk_en =3D true;
> > +
> > +     ret =3D sprd_dsi_find_panel(dsi);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int sprd_dsi_host_detach(struct mipi_dsi_host *host,
> > +                        struct mipi_dsi_device *slave)
> > +{
> > +     /* do nothing */
> > +     return 0;
> > +}
> > +
> > +static ssize_t sprd_dsi_host_transfer(struct mipi_dsi_host *host,
> > +                             const struct mipi_dsi_msg *msg)
> > +{
> > +     struct sprd_dsi *dsi =3D host_to_dsi(host);
> > +     const u8 *tx_buf =3D msg->tx_buf;
> > +
> > +     if (msg->rx_buf && msg->rx_len) {
> > +             u8 lsb =3D (msg->tx_len > 0) ? tx_buf[0] : 0;
> > +             u8 msb =3D (msg->tx_len > 1) ? tx_buf[1] : 0;
> > +
> > +             return sprd_dsi_rd_pkt(&dsi->ctx, msg->channel, msg->type=
,
> > +                             msb, lsb, msg->rx_buf, msg->rx_len);
> > +     }
> > +
> > +     if (msg->tx_buf && msg->tx_len)
> > +             return sprd_dsi_wr_pkt(&dsi->ctx, msg->channel, msg->type=
,
> > +                                     tx_buf, msg->tx_len);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops sprd_dsi_host_ops =3D {
> > +     .attach =3D sprd_dsi_host_attach,
> > +     .detach =3D sprd_dsi_host_detach,
> > +     .transfer =3D sprd_dsi_host_transfer,
> > +};
> > +
> > +static int sprd_dsi_host_init(struct sprd_dsi *dsi, struct device *dev=
)
> > +{
> > +     int ret;
> > +
> > +     dsi->host.dev =3D dev;
> > +     dsi->host.ops =3D &sprd_dsi_host_ops;
> > +
> > +     ret =3D mipi_dsi_host_register(&dsi->host);
> > +     if (ret)
> > +             drm_err(dsi->drm, "failed to register dsi host\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static int sprd_dsi_connector_get_modes(struct drm_connector *connecto=
r)
> > +{
> > +     struct sprd_dsi *dsi =3D connector_to_dsi(connector);
> > +
> > +     return drm_panel_get_modes(dsi->panel, connector);
> > +}
> > +
> > +static enum drm_mode_status
> > +sprd_dsi_connector_mode_valid(struct drm_connector *connector,
> > +                      struct drm_display_mode *mode)
> > +{
> > +     struct sprd_dsi *dsi =3D connector_to_dsi(connector);
> > +
> > +     drm_dbg(dsi->drm, "%s() mode: "DRM_MODE_FMT"\n", __func__,
> DRM_MODE_ARG(mode));
> > +
> > +     if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> > +             dsi->mode =3D mode;
> > +             drm_display_mode_to_videomode(dsi->mode, &dsi->ctx.vm);
> > +     }
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static struct drm_encoder *
> > +sprd_dsi_connector_best_encoder(struct drm_connector *connector)
> > +{
> > +     struct sprd_dsi *dsi =3D connector_to_dsi(connector);
> > +
> > +     return &dsi->encoder;
> > +}
> > +
> > +static struct drm_connector_helper_funcs
> sprd_dsi_connector_helper_funcs =3D {
> > +     .get_modes =3D sprd_dsi_connector_get_modes,
> > +     .mode_valid =3D sprd_dsi_connector_mode_valid,
> > +     .best_encoder =3D sprd_dsi_connector_best_encoder,
> > +};
> > +
> > +static enum drm_connector_status
> > +sprd_dsi_connector_detect(struct drm_connector *connector, bool force)
> > +{
> > +     struct sprd_dsi *dsi =3D connector_to_dsi(connector);
> > +
> > +     if (dsi->panel) {
> > +             drm_panel_add(dsi->panel);
> > +             return connector_status_connected;
> > +     }
> > +
> > +     return connector_status_disconnected;
> > +}
> > +
> > +static void sprd_dsi_connector_destroy(struct drm_connector *connector=
)
> > +{
> > +     drm_connector_unregister(connector);
> > +     drm_connector_cleanup(connector);
> > +}
> > +
> > +static const struct drm_connector_funcs sprd_dsi_atomic_connector_func=
s
> =3D {
> > +     .fill_modes =3D drm_helper_probe_single_connector_modes,
> > +     .detect =3D sprd_dsi_connector_detect,
> > +     .destroy =3D sprd_dsi_connector_destroy,
> > +     .reset =3D drm_atomic_helper_connector_reset,
> > +     .atomic_duplicate_state =3D
> drm_atomic_helper_connector_duplicate_state,
> > +     .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
> > +};
> > +
> > +static int sprd_dsi_connector_init(struct drm_device *drm, struct
> sprd_dsi *dsi)
> > +{
> > +     struct drm_encoder *encoder =3D &dsi->encoder;
> > +     struct drm_connector *connector =3D &dsi->connector;
> > +     int ret;
> > +
> > +     connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> > +
> > +     ret =3D drm_connector_init(drm, connector,
> > +                              &sprd_dsi_atomic_connector_funcs,
> > +                              DRM_MODE_CONNECTOR_DSI);
> > +     if (ret) {
> > +             drm_err(drm, "drm_connector_init() failed\n");
> > +             return ret;
> > +     }
> > +
> > +     drm_connector_helper_add(connector,
> > +                              &sprd_dsi_connector_helper_funcs);
> > +
> > +     drm_connector_attach_encoder(connector, encoder);
> > +
> > +     return 0;
> > +}
> > +
> > +static irqreturn_t sprd_dsi_isr(int irq, void *data)
> > +{
> > +     struct sprd_dsi *dsi =3D data;
> > +     u32 status =3D 0;
> > +
> > +     if (dsi->ctx.irq0 =3D=3D irq)
> > +             status =3D sprd_dsi_int_status(&dsi->ctx, 0);
> > +     else if (dsi->ctx.irq1 =3D=3D irq)
> > +             status =3D sprd_dsi_int_status(&dsi->ctx, 1);
> > +
> > +     if (status & DSI_INT_STS_NEED_SOFT_RESET)
> > +             sprd_dsi_state_reset(&dsi->ctx);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int sprd_dsi_bind(struct device *dev, struct device *master,
> void *data)
> > +{
> > +     struct drm_device *drm =3D data;
> > +     struct sprd_dsi *dsi =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     ret =3D sprd_dsi_encoder_init(drm, dsi);
> > +     if (ret)
> > +             goto cleanup_host;
> > +
> > +     ret =3D sprd_dsi_connector_init(drm, dsi);
> > +     if (ret)
> > +             goto cleanup_encoder;
> > +
> > +     dsi->drm =3D drm;
> > +
> > +     return 0;
> > +
> > +cleanup_encoder:
> > +     drm_encoder_cleanup(&dsi->encoder);
> > +cleanup_host:
> > +     mipi_dsi_host_unregister(&dsi->host);
> > +     return ret;
> > +}
> > +
> > +static void sprd_dsi_unbind(struct device *dev,
> > +                     struct device *master, void *data)
> > +{
> > +     struct drm_device *drm =3D data;
> > +
> > +     /* do nothing */
> > +     drm_dbg(drm, "%s()\n", __func__);
> > +
> > +}
> > +
> > +static const struct component_ops dsi_component_ops =3D {
> > +     .bind   =3D sprd_dsi_bind,
> > +     .unbind =3D sprd_dsi_unbind,
> > +};
> > +
> > +static int sprd_dsi_context_init(struct sprd_dsi *dsi,
> > +                     struct device *dev)
> > +{
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +     struct resource *res;
> > +     int ret;
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     ctx->base =3D devm_ioremap(dev, res->start, resource_size(res));
> > +     if (!ctx->base) {
> > +             drm_err(dsi->drm, "failed to map dsi host registers\n");
> > +             return -ENXIO;
> > +     }
> > +
> > +     ctx->pll =3D devm_kzalloc(dev, sizeof(*ctx->pll), GFP_KERNEL);
>
> You probably want to use drmm_kzalloc here, just to be on the safe side.
>
> > +     if (!ctx->pll) {
> > +             drm_err(dsi->drm, "failed to allocate dphy pll data.\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     ctx->regmap =3D devm_regmap_init(dev, &regmap_tst_io, dsi,
> &byte_config);
> > +     if (IS_ERR(ctx->regmap)) {
> > +             drm_err(dsi->drm, "dphy regmap init failed\n");
> > +             return PTR_ERR(ctx->regmap);
> > +     }
> > +
> > +     ctx->irq0 =3D platform_get_irq(pdev, 0);
> > +     if (ctx->irq0 > 0) {
> > +             ret =3D request_irq(ctx->irq0, sprd_dsi_isr, 0, "DSI_INT0=
",
> dsi);
> > +             if (ret) {
> > +                     drm_err(dsi->drm, "failed to request dsi irq
> int0!\n");
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     ctx->irq1 =3D platform_get_irq(pdev, 1);
> > +     if (ctx->irq1 > 0) {
> > +             ret =3D request_irq(ctx->irq1, sprd_dsi_isr, 0, "DSI_INT1=
",
> dsi);
> > +             if (ret) {
> > +                     drm_err(dsi->drm, "failed to request dsi irq
> int1!\n");
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     ctx->data_hs2lp =3D 120;
> > +     ctx->data_lp2hs =3D 500;
> > +     ctx->clk_hs2lp =3D 4;
> > +     ctx->clk_lp2hs =3D 15;
> > +     ctx->max_rd_time =3D 6000;
> > +     ctx->int0_mask =3D 0xffffffff;
> > +     ctx->int1_mask =3D 0xffffffff;
> > +
> > +     dsi->ctx.enabled =3D true;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id dsi_match_table[] =3D {
> > +     { .compatible =3D "sprd,sharkl3-dsi-host" },
> > +     { /* sentinel */ },
> > +};
> > +
> > +static int sprd_dsi_probe(struct platform_device *pdev)
> > +{
> > +     struct sprd_dsi *dsi;
> > +     int ret;
> > +
> > +     dsi =3D kzalloc(sizeof(*dsi), GFP_KERNEL);
> > +     if (!dsi) {
> > +             dev_err(&pdev->dev, "failed to allocate dsi data.\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     dsi->dev =3D &pdev->dev;
> > +
> > +     ret =3D sprd_dsi_context_init(dsi, &pdev->dev);
> > +     if (ret)
> > +             goto err;
> > +
> > +     ret =3D sprd_dsi_host_init(dsi, &pdev->dev);
> > +     if (ret)
> > +             goto err;
>
> Same comment as with the previous patch for planes/crtc: If you move this
> into the bind function then you can use the drmm_ functions and ditch the
> kfree.
>
> > +
> > +     platform_set_drvdata(pdev, dsi);
> > +
> > +     return component_add(&pdev->dev, &dsi_component_ops);
> > +
> > +err:
> > +     kfree(dsi);
> > +     return ret;
> > +}
> > +
> > +static int sprd_dsi_remove(struct platform_device *pdev)
> > +{
> > +     struct sprd_dsi *dsi =3D platform_get_drvdata(pdev);
> > +
> > +     component_del(&pdev->dev, &dsi_component_ops);
> > +
> > +     kfree(dsi);
> > +     return 0;
> > +}
> > +
> > +struct platform_driver sprd_dsi_driver =3D {
> > +     .probe =3D sprd_dsi_probe,
> > +     .remove =3D sprd_dsi_remove,
> > +     .driver =3D {
> > +             .name =3D "sprd-dsi-drv",
> > +             .of_match_table =3D dsi_match_table,
> > +     },
> > +};
> > +
> > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> > +MODULE_DESCRIPTION("Unisoc MIPI DSI HOST Controller Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/sprd/sprd_dsi.h
> b/drivers/gpu/drm/sprd/sprd_dsi.h
> > new file mode 100644
> > index 0000000..e07cd12
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dsi.h
> > @@ -0,0 +1,107 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#ifndef __SPRD_DSI_H__
> > +#define __SPRD_DSI_H__
> > +
> > +#include <linux/of.h>
> > +#include <linux/device.h>
> > +#include <linux/regmap.h>
> > +#include <video/videomode.h>
> > +
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_encoder.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#include "megacores_pll.h"
> > +
> > +#define DSI_INT_STS_NEED_SOFT_RESET  BIT(0)
> > +#define DSI_INT_STS_NEED_HARD_RESET  BIT(1)
> > +
> > +enum dsi_work_mode {
> > +     DSI_MODE_CMD =3D 0,
> > +     DSI_MODE_VIDEO
> > +};
> > +
> > +enum video_burst_mode {
> > +     VIDEO_NON_BURST_WITH_SYNC_PULSES =3D 0,
> > +     VIDEO_NON_BURST_WITH_SYNC_EVENTS,
> > +     VIDEO_BURST_WITH_SYNC_PULSES
> > +};
> > +
> > +enum dsi_color_coding {
> > +     COLOR_CODE_16BIT_CONFIG1 =3D 0,
> > +     COLOR_CODE_16BIT_CONFIG2,
> > +     COLOR_CODE_16BIT_CONFIG3,
> > +     COLOR_CODE_18BIT_CONFIG1,
> > +     COLOR_CODE_18BIT_CONFIG2,
> > +     COLOR_CODE_24BIT,
> > +     COLOR_CODE_20BIT_YCC422_LOOSELY,
> > +     COLOR_CODE_24BIT_YCC422,
> > +     COLOR_CODE_16BIT_YCC422,
> > +     COLOR_CODE_30BIT,
> > +     COLOR_CODE_36BIT,
> > +     COLOR_CODE_12BIT_YCC420,
> > +     COLOR_CODE_COMPRESSTION,
> > +     COLOR_CODE_MAX
> > +};
> > +
> > +struct dsi_context {
> > +     void __iomem *base;
> > +     struct regmap *regmap;
> > +     struct dphy_pll *pll;
> > +     struct videomode vm;
> > +     bool enabled;
> > +
> > +     u8 lanes;
> > +     u32 format;
> > +     u8 work_mode;
> > +     u8 burst_mode;
> > +
> > +     int irq0;
> > +     int irq1;
> > +     u32 int0_mask;
> > +     u32 int1_mask;
> > +
> > +     /* byte clock [KHz] */
> > +     u32 byte_clk;
> > +     /* escape clock [KHz] */
> > +     u32 esc_clk;
> > +     /* maximum time (ns) for data lanes from HS to LP */
> > +     u16 data_hs2lp;
> > +     /* maximum time (ns) for data lanes from LP to HS */
> > +     u16 data_lp2hs;
> > +     /* maximum time (ns) for clk lanes from HS to LP */
> > +     u16 clk_hs2lp;
> > +     /* maximum time (ns) for clk lanes from LP to HS */
> > +     u16 clk_lp2hs;
> > +     /* maximum time (ns) for BTA operation - REQUIRED */
> > +     u16 max_rd_time;
> > +     /* is 18-bit loosely packets (valid only when BPP =3D=3D 18) */
> > +     bool is_18_loosely;
> > +     /* enable receiving frame ack packets - for video mode */
> > +     bool frame_ack_en;
> > +     /* enable receiving tear effect ack packets - for cmd mode */
> > +     bool te_ack_en;
> > +     /* enable non coninuous clock for energy saving */
> > +     bool nc_clk_en;
> > +};
> > +
> > +struct sprd_dsi {
> > +     struct device *dev;
> > +     struct drm_device *drm;
> > +     struct mipi_dsi_host host;
> > +     struct mipi_dsi_device *slave;
> > +     struct drm_encoder encoder;
> > +     struct drm_connector connector;
> > +     struct drm_panel *panel;
> > +     struct drm_display_mode *mode;
> > +     struct dsi_context ctx;
> > +};
> > +
> > +#endif /* __SPRD_DSI_H__ */
> > --
> > 2.7.4
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000005343f805bb0bc869
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Daniel Vetter &lt;<a href=3D"mailto:d=
aniel@ffwll.ch">daniel@ffwll.ch</a>&gt; =E4=BA=8E2021=E5=B9=B42=E6=9C=883=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=8810:37=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jan =
05, 2021 at 09:46:07PM +0800, Kevin Tang wrote:<br>
&gt; Adds dsi host controller support for the Unisoc&#39;s display subsyste=
m.<br>
&gt; Adds dsi phy support for the Unisoc&#39;s display subsystem.<br>
&gt; Only MIPI DSI Displays supported, DP/TV/HMDI will be support<br>
&gt; in the feature.<br>
&gt; <br>
&gt; v1:<br>
&gt;=C2=A0 =C2=A0- Remove dphy and dsi graph binding, merge the dphy driver=
 into the dsi.<br>
&gt; <br>
&gt; v2:<br>
&gt;=C2=A0 =C2=A0- Use drm_xxx to replace all DRM_XXX.<br>
&gt;=C2=A0 =C2=A0- Use kzalloc to replace devm_kzalloc for sprd_dsi structu=
re init.<br>
<br>
Similar comments about kzalloc as with the previous sprd patch. Otherwise<b=
r>
just two questions:<br>
<br>
dw-dsi is named at least like the synopsys driver we have already,<br>
wouldn&#39;t this fit into the drm/bridge driver we have? Ack from bridge<b=
r>
people (just cc everyone for that dw_dsi driver to get their attention)<br>
would be good.<br></blockquote><div>dw dsi controller is not a standard syn=
opsys ip, we have updated a lot on the basic ip version, the entire control=
 register is different. <br></div><div><span class=3D"gmail-VIiyi" lang=3D"=
en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VI=
iyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>i think th=
is is a good suggestion</span></span></span> , i will cc to drm/bridge revi=
ewers and maintainers, thank you.<br></span></span></span> </div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Other thing is the header definitions for the registers. bitfields and<br>
unions are rather unusual for this, and to my understanding might blow up<b=
r>
on different compilers. Results in rather verbose and unusual code, but<br>
since you only read/write full bytes at least it should be all save. Imo<br=
>
not a worry.<br></blockquote><div>=C2=A0<span class=3D"gmail-VIiyi" lang=3D=
"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>We have been using thi=
s way for many years and it seems that we haven=E2=80=99t found any problem=
s,</span></span></span></div><div><span class=3D"gmail-VIiyi" lang=3D"en"><=
span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" =
lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>it does seem th=
at there will be some unused bitfields,<span class=3D"gmail-VIiyi" lang=3D"=
en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span> i don=E2=80=99t know i=
f this will be a problem...</span></span></span> </span></span></span> </sp=
an></span></span>  </div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
See below for the kzalloc comments.<br></blockquote><div>Got it. <br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
-Daniel<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 7 +-<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dw_dsi_ctrl.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 79=
4 +++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dw_dsi_ctrl.h=C2=A0 =C2=A0 =C2=A0| 1475 +++=
+++++++++++++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c |=C2=A0 157 ++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h |=C2=A0 =C2=A026 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/megacores_pll.c=C2=A0 =C2=A0|=C2=A0 317 +++=
++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/megacores_pll.h=C2=A0 =C2=A0|=C2=A0 146 +++=
+<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 1 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 1 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dsi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 116=
2 +++++++++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dsi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 107 +++<br>
&gt;=C2=A0 11 files changed, 4191 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.h<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/megacores_pll.h<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; index 6c25bfa..d49f497 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/Makefile<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -1,5 +1,8 @@<br>
&gt;=C2=A0 # SPDX-License-Identifier: GPL-2.0<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 obj-y :=3D sprd_drm.o \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sprd_dpu.o<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpu.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dsi.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dw_dsi_ctrl.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dw_dsi_ctrl_ppi.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0megacores_pll.o<br>
&gt; diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl.c b/drivers/gpu/drm/sprd=
/dw_dsi_ctrl.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..1034aba<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl.c<br>
&gt; @@ -0,0 +1,794 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;dw_dsi_ctrl.h&quot;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Modify power status of DSI Host core<br>
&gt; + */<br>
&gt; +void dsi_power_enable(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(enable, &amp;reg-&gt;SOFT_RESET);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable/disable DPI video mode<br>
&gt; + */<br>
&gt; +void dsi_video_mode(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0, &amp;reg-&gt;DSI_MODE_CFG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable command mode (Generic interface)<br>
&gt; + */<br>
&gt; +void dsi_cmd_mode(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(1, &amp;reg-&gt;DSI_MODE_CFG);<br>
&gt; +}<br>
&gt; +<br>
&gt; +bool dsi_is_cmd_mode(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return readl(&amp;reg-&gt;DSI_MODE_CFG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure the read back virtual channel for the generic interface<=
br>
&gt; + */<br>
&gt; +void dsi_rx_vcid(struct dsi_context *ctx, u8 vc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x1C virtual_channel_id;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0virtual_channel_id.val =3D readl(&amp;reg-&gt;VIR=
TUAL_CHANNEL_ID);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0virtual_channel_id.bits.gen_rx_vcid =3D vc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(virtual_channel_id.val, &amp;reg-&gt;VIRTU=
AL_CHANNEL_ID);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Write the DPI video virtual channel destination<br>
&gt; + */<br>
&gt; +void dsi_video_vcid(struct dsi_context *ctx, u8 vc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x1C virtual_channel_id;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0virtual_channel_id.val =3D readl(&amp;reg-&gt;VIR=
TUAL_CHANNEL_ID);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0virtual_channel_id.bits.video_pkt_vcid =3D vc;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(virtual_channel_id.val, &amp;reg-&gt;VIRTU=
AL_CHANNEL_ID);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Set DPI video mode type (burst/non-burst - with sync pulses or eve=
nts)<br>
&gt; + */<br>
&gt; +void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x38 vid_mode_cfg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.val =3D readl(&amp;reg-&gt;VID_MODE_=
CFG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.bits.vid_mode_type =3D mode;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(vid_mode_cfg.val, &amp;reg-&gt;VID_MODE_CF=
G);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Set DPI video color coding<br>
&gt; + */<br>
&gt; +void dsi_dpi_color_coding(struct dsi_context *ctx, int coding)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x20 dpi_video_format;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpi_video_format.val =3D readl(&amp;reg-&gt;DPI_V=
IDEO_FORMAT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpi_video_format.bits.dpi_video_mode_format =3D c=
oding;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(dpi_video_format.val, &amp;reg-&gt;DPI_VID=
EO_FORMAT);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure the Horizontal Line time<br>
&gt; + * param &quot;byte_cycle&quot; taken to transmit the total of the ho=
rizontal line<br>
&gt; + */<br>
&gt; +void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cycle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x2C video_line_time;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_line_time.val =3D readl(&amp;reg-&gt;VIDEO_=
LINE_TIME);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_line_time.bits.video_line_time =3D byte_cyc=
le;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_line_time.val, &amp;reg-&gt;VIDEO_LI=
NE_TIME);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure the Horizontal back porch time<br>
&gt; + * param &quot;byte_cycle&quot; taken to transmit the horizontal back=
 porch<br>
&gt; + */<br>
&gt; +void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x28 video_line_hblk_time;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_line_hblk_time.val =3D readl(&amp;reg-&gt;V=
IDEO_LINE_HBLK_TIME);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_line_hblk_time.bits.video_line_hbp_time =3D=
 byte_cycle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_line_hblk_time.val, &amp;reg-&gt;VID=
EO_LINE_HBLK_TIME);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure the Horizontal sync time,<br>
&gt; + * param &quot;byte_cycle&quot; taken to transmit the horizontal sync=
<br>
&gt; + */<br>
&gt; +void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cycle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x28 video_line_hblk_time;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_line_hblk_time.val =3D readl(&amp;reg-&gt;V=
IDEO_LINE_HBLK_TIME);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_line_hblk_time.bits.video_line_hsa_time =3D=
 byte_cycle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_line_hblk_time.val, &amp;reg-&gt;VID=
EO_LINE_HBLK_TIME);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure the vertical active lines of the video stream<br>
&gt; + */<br>
&gt; +void dsi_dpi_vact(struct dsi_context *ctx, u16 lines)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x34 video_active_lines;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_active_lines.val =3D readl(&amp;reg-&gt;VID=
EO_VACTIVE_LINES);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_active_lines.bits.vactive_lines =3D lines;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_active_lines.val, &amp;reg-&gt;VIDEO=
_VACTIVE_LINES);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x30 video_vblk_lines;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_vblk_lines.val =3D readl(&amp;reg-&gt;VIDEO=
_VBLK_LINES);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_vblk_lines.bits.vfp_lines =3D lines;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_vblk_lines.val, &amp;reg-&gt;VIDEO_V=
BLK_LINES);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x30 video_vblk_lines;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_vblk_lines.val =3D readl(&amp;reg-&gt;VIDEO=
_VBLK_LINES);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_vblk_lines.bits.vbp_lines =3D lines;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_vblk_lines.val, &amp;reg-&gt;VIDEO_V=
BLK_LINES);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x30 video_vblk_lines;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_vblk_lines.val =3D readl(&amp;reg-&gt;VIDEO=
_VBLK_LINES);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_vblk_lines.bits.vsa_lines =3D lines;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_vblk_lines.val, &amp;reg-&gt;VIDEO_V=
BLK_LINES);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x38 vid_mode_cfg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.val =3D readl(&amp;reg-&gt;VID_MODE_=
CFG);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.bits.lp_hfp_en =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.bits.lp_hbp_en =3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(vid_mode_cfg.val, &amp;reg-&gt;VID_MODE_CF=
G);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable return to low power mode inside vertical active lines perio=
ds when<br>
&gt; + * timing allows<br>
&gt; + */<br>
&gt; +void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x38 vid_mode_cfg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.val =3D readl(&amp;reg-&gt;VID_MODE_=
CFG);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.bits.lp_vact_en =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.bits.lp_vfp_en =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.bits.lp_vbp_en =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.bits.lp_vsa_en =3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(vid_mode_cfg.val, &amp;reg-&gt;VID_MODE_CF=
G);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable FRAME BTA ACK<br>
&gt; + */<br>
&gt; +void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x38 vid_mode_cfg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.val =3D readl(&amp;reg-&gt;VID_MODE_=
CFG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.bits.frame_bta_ack_en =3D enable;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(vid_mode_cfg.val, &amp;reg-&gt;VID_MODE_CF=
G);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Write no of chunks to core - taken into consideration only when mu=
lti packet<br>
&gt; + * is enabled<br>
&gt; + */<br>
&gt; +void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 num)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x24 video_pkt_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_pkt_config.val =3D readl(&amp;reg-&gt;VIDEO=
_PKT_CONFIG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_pkt_config.bits.video_line_chunk_num =3D nu=
m;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_pkt_config.val, &amp;reg-&gt;VIDEO_P=
KT_CONFIG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Write the null packet size - will only be taken into account when =
null<br>
&gt; + * packets are enabled.<br>
&gt; + */<br>
&gt; +void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xC0 video_nullpkt_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_nullpkt_size.val =3D readl(&amp;reg-&gt;VID=
EO_NULLPKT_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_nullpkt_size.bits.video_nullpkt_size =3D si=
ze;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_nullpkt_size.val, &amp;reg-&gt;VIDEO=
_NULLPKT_SIZE);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Write video packet size. obligatory for sending video<br>
&gt; + */<br>
&gt; +void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x24 video_pkt_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_pkt_config.val =3D readl(&amp;reg-&gt;VIDEO=
_PKT_CONFIG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_pkt_config.bits.video_pkt_size =3D size;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_pkt_config.val, &amp;reg-&gt;VIDEO_P=
KT_CONFIG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Specifiy the size of the packet memory write start/continue<br>
&gt; + */<br>
&gt; +void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xC4 dcs_wm_pkt_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcs_wm_pkt_size.val =3D readl(&amp;reg-&gt;DCS_WM=
_PKT_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcs_wm_pkt_size.bits.dcs_wm_pkt_size =3D size;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(dcs_wm_pkt_size.val, &amp;reg-&gt;DCS_WM_P=
KT_SIZE);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable tear effect acknowledge<br>
&gt; + */<br>
&gt; +void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x68 cmd_mode_cfg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.val =3D readl(&amp;reg-&gt;CMD_MODE_=
CFG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.tear_fx_en =3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(cmd_mode_cfg.val, &amp;reg-&gt;CMD_MODE_CF=
G);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Set DCS command packet transmission to transmission type<br>
&gt; + */<br>
&gt; +void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x68 cmd_mode_cfg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.val =3D readl(&amp;reg-&gt;CMD_MODE_=
CFG);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.gen_sw_0p_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.gen_sw_1p_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.gen_sw_2p_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.gen_lw_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.dcs_sw_0p_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.dcs_sw_1p_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.dcs_lw_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.max_rd_pkt_size =3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.gen_sr_0p_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.gen_sr_1p_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.gen_sr_2p_tx =3D enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_cfg.bits.dcs_sr_0p_tx =3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(cmd_mode_cfg.val, &amp;reg-&gt;CMD_MODE_CF=
G);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Set DCS read command packet transmission to transmission type<br>
&gt; + */<br>
&gt; +void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int enable)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x38 vid_mode_cfg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.val =3D readl(&amp;reg-&gt;VID_MODE_=
CFG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vid_mode_cfg.bits.lp_cmd_en =3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(vid_mode_cfg.val, &amp;reg-&gt;VID_MODE_CF=
G);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Write command header in the generic interface (which also sends DC=
S commands) as a subset<br>
&gt; + */<br>
&gt; +void dsi_set_packet_header(struct dsi_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 vc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 wc_lsb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 wc_msb)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x6C gen_hdr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gen_hdr.bits.gen_dt =3D type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gen_hdr.bits.gen_vc =3D vc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gen_hdr.bits.gen_wc_lsbyte =3D wc_lsb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gen_hdr.bits.gen_wc_msbyte =3D wc_msb;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(gen_hdr.val, &amp;reg-&gt;GEN_HDR);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Write the payload of the long packet commands<br>
&gt; + */<br>
&gt; +void dsi_set_packet_payload(struct dsi_context *ctx, u32 payload)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(payload, &amp;reg-&gt;GEN_PLD_DATA);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Read the payload of the long packet commands<br>
&gt; + */<br>
&gt; +u32 dsi_get_rx_payload(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return readl(&amp;reg-&gt;GEN_PLD_DATA);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Enable Bus Turn-around request<br>
&gt; + */<br>
&gt; +void dsi_bta_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(enable, &amp;reg-&gt;TA_EN);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable EOTp reception<br>
&gt; + */<br>
&gt; +void dsi_eotp_rx_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xBC eotp_en;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0eotp_en.val =3D readl(&amp;reg-&gt;EOTP_EN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0eotp_en.bits.rx_eotp_en =3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(eotp_en.val, &amp;reg-&gt;EOTP_EN);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable EOTp transmission<br>
&gt; + */<br>
&gt; +void dsi_eotp_tx_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xBC eotp_en;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0eotp_en.val =3D readl(&amp;reg-&gt;EOTP_EN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0eotp_en.bits.tx_eotp_en =3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(eotp_en.val, &amp;reg-&gt;EOTP_EN);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable ECC reception, error correction and reporting<br>
&gt; + */<br>
&gt; +void dsi_ecc_rx_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xB4 rx_pkt_check_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rx_pkt_check_config.val =3D readl(&amp;reg-&gt;RX=
_PKT_CHECK_CONFIG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rx_pkt_check_config.bits.rx_pkt_ecc_en =3D enable=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(rx_pkt_check_config.val, &amp;reg-&gt;RX_P=
KT_CHECK_CONFIG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable CRC reception, error reporting<br>
&gt; + */<br>
&gt; +void dsi_crc_rx_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xB4 rx_pkt_check_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rx_pkt_check_config.val =3D readl(&amp;reg-&gt;RX=
_PKT_CHECK_CONFIG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rx_pkt_check_config.bits.rx_pkt_crc_en =3D enable=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(rx_pkt_check_config.val, &amp;reg-&gt;RX_P=
KT_CHECK_CONFIG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Get status of read command<br>
&gt; + */<br>
&gt; +bool dsi_is_bta_returned(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x98 cmd_mode_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_status.val =3D readl(&amp;reg-&gt;CMD_MO=
DE_STATUS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return cmd_mode_status.bits.gen_cmd_rdcmd_done;<b=
r>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Get the FULL status of generic read payload fifo<br>
&gt; + */<br>
&gt; +bool dsi_is_rx_payload_fifo_full(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x98 cmd_mode_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_status.val =3D readl(&amp;reg-&gt;CMD_MO=
DE_STATUS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return cmd_mode_status.bits.gen_cmd_rdata_fifo_fu=
ll;<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Get the EMPTY status of generic read payload fifo<br>
&gt; + */<br>
&gt; +bool dsi_is_rx_payload_fifo_empty(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x98 cmd_mode_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_status.val =3D readl(&amp;reg-&gt;CMD_MO=
DE_STATUS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return cmd_mode_status.bits.gen_cmd_rdata_fifo_em=
pty;<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Get the FULL status of generic write payload fifo<br>
&gt; + */<br>
&gt; +bool dsi_is_tx_payload_fifo_full(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x98 cmd_mode_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_status.val =3D readl(&amp;reg-&gt;CMD_MO=
DE_STATUS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return cmd_mode_status.bits.gen_cmd_wdata_fifo_fu=
ll;<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Get the EMPTY status of generic write payload fifo<br>
&gt; + */<br>
&gt; +bool dsi_is_tx_payload_fifo_empty(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x98 cmd_mode_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_status.val =3D readl(&amp;reg-&gt;CMD_MO=
DE_STATUS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return cmd_mode_status.bits.gen_cmd_wdata_fifo_em=
pty;<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Get the EMPTY status of generic command fifo<br>
&gt; + */<br>
&gt; +bool dsi_is_tx_cmd_fifo_empty(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x98 cmd_mode_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd_mode_status.val =3D readl(&amp;reg-&gt;CMD_MO=
DE_STATUS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return cmd_mode_status.bits.gen_cmd_cmd_fifo_empt=
y;<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * DPI interface signal delay config<br>
&gt; + * param byte_cycle period for waiting after controller receiving HSY=
NC from<br>
&gt; + * DPI interface to start read pixel data from memory.<br>
&gt; + */<br>
&gt; +void dsi_dpi_sig_delay(struct dsi_context *ctx, u16 byte_cycle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xD0 video_sig_delay_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_sig_delay_config.val =3D readl(&amp;reg-&gt=
;VIDEO_SIG_DELAY_CONFIG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_sig_delay_config.bits.video_sig_delay =3D b=
yte_cycle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(video_sig_delay_config.val, &amp;reg-&gt;V=
IDEO_SIG_DELAY_CONFIG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure how many cycles of byte clock would the PHY module take<=
br>
&gt; + * to switch data lane from high speed to low power<br>
&gt; + */<br>
&gt; +void dsi_datalane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycl=
e)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xAC phy_datalane_time_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_datalane_time_config.val =3D readl(&amp;reg-&=
gt;PHY_DATALANE_TIME_CONFIG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_datalane_time_config.bits.phy_datalane_hs_to_=
lp_time =3D byte_cycle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_datalane_time_config.val, &amp;reg-&gt=
;PHY_DATALANE_TIME_CONFIG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure how many cycles of byte clock would the PHY module take<=
br>
&gt; + * to switch the data lane from to low power high speed<br>
&gt; + */<br>
&gt; +void dsi_datalane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycl=
e)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xAC phy_datalane_time_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_datalane_time_config.val =3D readl(&amp;reg-&=
gt;PHY_DATALANE_TIME_CONFIG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_datalane_time_config.bits.phy_datalane_lp_to_=
hs_time =3D byte_cycle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_datalane_time_config.val, &amp;reg-&gt=
;PHY_DATALANE_TIME_CONFIG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure how many cycles of byte clock would the PHY module take<=
br>
&gt; + * to switch clock lane from high speed to low power<br>
&gt; + */<br>
&gt; +void dsi_clklane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xA8 phy_clklane_time_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_clklane_time_config.val =3D readl(&amp;reg-&g=
t;PHY_CLKLANE_TIME_CONFIG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_clklane_time_config.bits.phy_clklane_hs_to_lp=
_time =3D byte_cycle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_clklane_time_config.val, &amp;reg-&gt;=
PHY_CLKLANE_TIME_CONFIG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure how many cycles of byte clock would the PHY module take<=
br>
&gt; + * to switch clock lane from to low power high speed<br>
&gt; + */<br>
&gt; +void dsi_clklane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xA8 phy_clklane_time_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_clklane_time_config.val =3D readl(&amp;reg-&g=
t;PHY_CLKLANE_TIME_CONFIG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_clklane_time_config.bits.phy_clklane_lp_to_hs=
_time =3D byte_cycle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_clklane_time_config.val, &amp;reg-&gt;=
PHY_CLKLANE_TIME_CONFIG);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure how many cycles of byte clock would the PHY module take<=
br>
&gt; + * to turn the bus around to start receiving<br>
&gt; + */<br>
&gt; +void dsi_max_read_time(struct dsi_context *ctx, u16 byte_cycle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(byte_cycle, &amp;reg-&gt;MAX_READ_TIME);<b=
r>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Enable the automatic mechanism to stop providing clock in the cloc=
k<br>
&gt; + * lane when time allows<br>
&gt; + */<br>
&gt; +void dsi_nc_clk_en(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x74 phy_clk_lane_lp_ctrl;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_clk_lane_lp_ctrl.val =3D readl(&amp;reg-&gt;P=
HY_CLK_LANE_LP_CTRL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en =
=3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_clk_lane_lp_ctrl.val, &amp;reg-&gt;PHY=
_CLK_LANE_LP_CTRL);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Write transmission escape timeout<br>
&gt; + * a safe guard so that the state machine would reset if transmission=
<br>
&gt; + * takes too long<br>
&gt; + */<br>
&gt; +void dsi_tx_escape_division(struct dsi_context *ctx, u8 div)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(div, &amp;reg-&gt;TX_ESC_CLK_CONFIG);<br>
&gt; +}<br>
&gt; +/* <br>
&gt; + * Configure timeout divisions (so they would have more clock ticks)<=
br>
&gt; + * div no of hs cycles before transiting back to LP in<br>
&gt; + *=C2=A0 (lane_clk / div)<br>
&gt; + */<br>
&gt; +void dsi_timeout_clock_division(struct dsi_context *ctx, u8 div)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(div, &amp;reg-&gt;TIMEOUT_CNT_CLK_CONFIG);=
<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure the Low power receive time out<br>
&gt; + */<br>
&gt; +void dsi_lp_rx_timeout(struct dsi_context *ctx, u16 byte_cycle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(byte_cycle, &amp;reg-&gt;LRX_H_TO_CONFIG);=
<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure a high speed transmission time out<br>
&gt; + */<br>
&gt; +void dsi_hs_tx_timeout(struct dsi_context *ctx, u16 byte_cycle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(byte_cycle, &amp;reg-&gt;HTX_TO_CONFIG);<b=
r>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Get the error 0 interrupt register status<br>
&gt; + */<br>
&gt; +u32 dsi_int0_status(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D container_of(ctx, struct=
 sprd_dsi, ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x08 protocol_int_sts;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0protocol_int_sts.val =3D readl(&amp;reg-&gt;PROTO=
COL_INT_STS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(protocol_int_sts.val, &amp;reg-&gt;PROTOCO=
L_INT_CLR);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.dphy_errors_0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;dphy_err: escape entry error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.dphy_errors_1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;dphy_err: lp data transmission sync error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.dphy_errors_2)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;dphy_err: control error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.dphy_errors_3)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;dphy_err: LP0 contention error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.dphy_errors_4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;dphy_err: LP1 contention error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: SoT error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: SoT Sync error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_2)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: EoT Sync error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_3)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: Escape Mode Entry Command error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: LP Transmit Sync error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_5)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: Peripheral Timeout error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_6)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: False Control error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_7)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: reserved (specific to device)\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_8)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: ECC error, single-bit (corrected)\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_9)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: ECC error, multi-bit (not corrected)\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_10)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: checksum error (long packet only)\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_11)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: not recognized DSI data type\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_12)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: DSI VC ID Invalid\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_13)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: invalid transmission length\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_14)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: reserved (specific to device)\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (protocol_int_sts.bits.ack_with_err_15)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ack_err: DSI protocol violation\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Get the error 1 interrupt register status<br>
&gt; + */<br>
&gt; +u32 dsi_int1_status(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D container_of(ctx, struct=
 sprd_dsi, ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x10 internal_int_sts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 status =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0internal_int_sts.val =3D readl(&amp;reg-&gt;INTER=
NAL_INT_STS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(internal_int_sts.val, &amp;reg-&gt;INTERNA=
L_INT_CLR);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.receive_pkt_size_err)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;receive packet size error\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.eotp_not_receive_err)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;EoTp packet is not received\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.gen_cmd_cmd_fifo_wr_err=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;cmd header-fifo is full\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.gen_cmd_rdata_fifo_rd_e=
rr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;cmd read-payload-fifo is empty\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.gen_cmd_rdata_fifo_wr_e=
rr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;cmd read-payload-fifo is full\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.gen_cmd_wdata_fifo_wr_e=
rr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;cmd write-payload-fifo is full\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.gen_cmd_wdata_fifo_rd_e=
rr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;cmd write-payload-fifo is empty\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.dpi_pix_fifo_wr_err) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;DPI pixel-fifo is full\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status |=3D DSI_INT_S=
TS_NEED_SOFT_RESET;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.ecc_single_err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ECC single error in a received packet\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.ecc_multi_err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;ECC multiple error in a received packet\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.crc_err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;CRC error in the received packet payload\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.hs_tx_timeout)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;high-speed transmission timeout\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (internal_int_sts.bits.lp_rx_timeout)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;low-power reception timeout\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure MASK (hiding) of interrupts coming from error 0 source<b=
r>
&gt; + */<br>
&gt; +void dsi_int0_mask(struct dsi_context *ctx, u32 mask)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(mask, &amp;reg-&gt;MASK_PROTOCOL_INT);<br>
&gt; +}<br>
&gt; +/*<br>
&gt; + * Configure MASK (hiding) of interrupts coming from error 1 source<b=
r>
&gt; + */<br>
&gt; +void dsi_int1_mask(struct dsi_context *ctx, u32 mask)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(mask, &amp;reg-&gt;MASK_INTERNAL_INT);<br>
&gt; +}<br>
&gt; diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl.h b/drivers/gpu/drm/sprd=
/dw_dsi_ctrl.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..ffba621<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl.h<br>
&gt; @@ -0,0 +1,1475 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _DW_DSI_CTRL_H_<br>
&gt; +#define _DW_DSI_CTRL_H_<br>
&gt; +<br>
&gt; +#include &lt;asm/types.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_dsi.h&quot;<br>
&gt; +<br>
&gt; +struct dsi_reg {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x00 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DSI_VERSION {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dsi_version: 16;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DSI_VERSION;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x04 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _SOFT_RESET {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the core either to work normal or to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * reset. It&#39;s de=
fault value is 0. After the core configur-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ation, to enable t=
he mipi_dsi_host, set this register to 1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1: power up=C2=A0 =
=C2=A0 =C2=A00: reset core<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dsi_soft_reset: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 31;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} SOFT_RESET;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x08 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PROTOCOL_INT_=
STS {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ErrEsc escape entr=
y error from Lane 0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dphy_errors_0: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ErrSyncEsc low-pow=
er data transmission synchronization<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * error from Lane 0<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dphy_errors_1: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ErrControl error f=
rom Lane 0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dphy_errors_2: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ErrContentionLP0 L=
P0 contention error from Lane 0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dphy_errors_3: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ErrContentionLP1 L=
P1 contention error from Lane 0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dphy_errors_4: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* debug mode protoco=
l errors */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 protocol_debug_er=
r: 11;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* SoT error from the=
 Acknowledge error report */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_0: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* SoT Sync error fro=
m the Acknowledge error report */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_1: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* EoT Sync error fro=
m the Acknowledge error report */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_2: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Escape Mode Entry =
Command error from the Acknowledge<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * error report<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_3: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* LP Transmit Sync e=
rror from the Acknowledge error report */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_4: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Peripheral Timeout=
 error from the Acknowledge error report */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_5: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* False Control erro=
r from the Acknowledge error report */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_6: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* reserved (specific=
 to device) from the Acknowledge error<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * report<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_7: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ECC error, single-=
bit (detected and corrected) from the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Acknowledge error =
report<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_8: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ECC error, multi-b=
it (detected, not corrected) from the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Acknowledge error =
report<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_9: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* checksum error (lo=
ng packet only) from the Acknowledge<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * error report<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_10: =
1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* not recognized DSI=
 data type from the Acknowledge error<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * report<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_11: =
1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* DSI VC ID Invalid =
from the Acknowledge error report */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_12: =
1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* invalid transmissi=
on length from the Acknowledge error<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * report<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_13: =
1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* reserved (specific=
 to device) from the Acknowledge error<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * report<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_14: =
1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* DSI protocol viola=
tion from the Acknowledge error report */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_with_err_15: =
1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PROTOCOL_INT_STS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x0C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _MASK_PROTOCOL=
_INT {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_dphy_errors_=
0: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_dphy_errors_=
1: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_dphy_errors_=
2: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_dphy_errors_=
3: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_dphy_errors_=
4: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_protocol_deb=
ug_err: 11;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_0: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_1: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_2: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_3: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_4: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_5: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_6: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_7: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_8: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_9: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_10: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_11: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_12: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_13: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_14: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ack_with_err=
_15: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} MASK_PROTOCOL_INT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x10 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _INTERNAL_INT_=
STS {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that the packet size error is detected<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * during the packet =
reception.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 receive_pkt_size_=
err: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that the EoTp packet is not received at<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the end of the inc=
oming peripheral transmission<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 eotp_not_receive_=
err: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that the system tried to write a command<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * through the Generi=
c interface and the FIFO is full. There-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * fore, the command =
is not written.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_cmd_fifo_=
wr_err: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that during a DCS read data, the payload<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * FIFO becomes empty=
 and the data sent to the interface is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * corrupted.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_rdata_fif=
o_rd_err: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that during a generic interface packet<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * read back, the pay=
load FIFO becomes full and the received<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * data is corrupted.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_rdata_fif=
o_wr_err: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that the system tried to write a payload<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * data through the G=
eneric interface and the FIFO is full.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Therefore, the pay=
load is not written.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_wdata_fif=
o_wr_err: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that during a Generic interface packet<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * build, the payload=
 FIFO becomes empty and corrupt data is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * sent.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_wdata_fif=
o_rd_err: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that during a DPI pixel line storage,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the payload FIFO b=
ecomes full and the data stored is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * corrupted.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpi_pix_fifo_wr_e=
rr: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* internal debug err=
or */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 internal_debug_er=
r: 19;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that the ECC single error is detected<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * and corrected in a=
 received packet.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ecc_single_err: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that the ECC multiple error is detected<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in a received pack=
et.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ecc_multi_err: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that the CRC error is detected in the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * received packet pa=
yload.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 crc_err: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that the high-speed transmission timeout<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * counter reached th=
e end and contention is detected.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hs_tx_timeout: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit indicates=
 that the low-power reception timeout<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * counter reached th=
e end and contention is detected.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lp_rx_timeout: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} INTERNAL_INT_STS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x14 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _MASK_INTERNAL=
_INT {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_receive_pkt_=
size_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_eopt_not_rec=
eive_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_gen_cmd_cmd_=
fifo_wr_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_gen_cmd_rdat=
a_fifo_rd_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_gen_cmd_rdat=
a_fifo_wr_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_gen_cmd_wdat=
a_fifo_wr_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_gen_cmd_wdat=
a_fifo_rd_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_dpi_pix_fifo=
_wr_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_internal_deb=
ug_err: 19;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ecc_single_e=
rr: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_ecc_multi_er=
r: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_crc_err: 1;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_hs_tx_timeou=
t: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask_lp_rx_timeou=
t: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} MASK_INTERNAL_INT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x18 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DSI_MODE_CFG =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit configure=
s the operation mode<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: Video mode ;=C2=
=A0 =C2=A01: Command mode<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cmd_video_mode: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 31;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DSI_MODE_CFG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x1C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VIRTUAL_CHANN=
EL_ID {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field indicat=
es the Generic interface read-back<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * virtual channel id=
entification<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_rx_vcid: 2;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field configu=
res the DPI virtual channel id that<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is indexed to the =
VIDEO mode packets<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 video_pkt_vcid: 2=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 28;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VIRTUAL_CHANNEL_ID;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x20 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DPI_VIDEO_FOR=
MAT {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the DPI color coding as follows:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0000: 16-bit confi=
guration 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0001: 16-bit confi=
guration 2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0010: 16-bit confi=
guration 3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0011: 18-bit confi=
guration 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0100: 18-bit confi=
guration 2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0101: 24-bit<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0110: 20-bit YCbCr=
 4:2:2 loosely packed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0111: 24-bit YCbCr=
 4:2:2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1000: 16-bit YCbCr=
 4:2:2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1001: 30-bit<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1010: 36-bit<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1011: 12-bit YCbCr=
 4:2:0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1100: Compression =
Display Stream<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1101-1111: 12-bit =
YCbCr 4:2:0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpi_video_mode_fo=
rmat: 6;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit activates loosely packed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * variant to 18-bit =
configurations<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 loosely18_en: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 25;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DPI_VIDEO_FORMAT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x24 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VIDEO_PKT_CON=
FIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the number of pixels in a single<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * video packet. For =
18-bit not loosely packed data types,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * this number must b=
e a multiple of 4. For YCbCr data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * types, it must be =
a multiple of 2, as described in the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * DSI specification.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 video_pkt_size: 1=
6;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This register conf=
igures the number of chunks to be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * transmitted during=
 a Line period (a chunk consists of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * a video packet and=
 a null packet). If set to 0 or 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the video line is =
transmitted in a single packet. If<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * set to 1, the pack=
et is part of a chunk, so a null packet<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * follows it if vid_=
null_size &gt; 0. Otherwise, multiple chunks<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * are used to transm=
it each video line.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 video_line_chunk_=
num: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VIDEO_PKT_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x28 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VIDEO_LINE_HB=
LK_TIME {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field configu=
res the Horizontal Back Porch period<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in lane byte clock=
 cycles<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 video_line_hbp_ti=
me: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field configu=
res the Horizontal Synchronism Active<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * period in lane byt=
e clock cycles<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 video_line_hsa_ti=
me: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VIDEO_LINE_HBLK_TIME;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x2C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VIDEO_LINE_TI=
ME {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field configu=
res the size of the total line time<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (HSA+HBP+HACT+HFP)=
 counted in lane byte clock cycles<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 video_line_time: =
16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VIDEO_LINE_TIME;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x30 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VIDEO_VBLK_LI=
NES {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field configu=
res the Vertical Front Porch period<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * measured in number=
 of horizontal lines<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vfp_lines: 10;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field configu=
res the Vertical Back Porch period<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * measured in number=
 of horizontal lines<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vbp_lines: 10;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field configu=
res the Vertical Synchronism Active<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * period measured in=
 number of horizontal lines<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vsa_lines: 10;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VIDEO_VBLK_LINES;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x34 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VIDEO_VACTIVE=
_LINES {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field configu=
res the Vertical Active period measured<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in number of horiz=
ontal lines<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vactive_lines: 14=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 18;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VIDEO_VACTIVE_LINES;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x38 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VID_MODE_CFG =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field indicat=
es the video mode transmission type as<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * follows:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 00: Non-burst with=
 sync pulses<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 01: Non-burst with=
 sync events<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 10 and 11: Burst m=
ode<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vid_mode_type: 2;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0: 6;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the return to low-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * inside the VSA per=
iod when timing allows.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lp_vsa_en: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the return to low-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * inside the VBP per=
iod when timing allows.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lp_vbp_en: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the return to low-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * inside the VFP per=
iod when timing allows.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lp_vfp_en: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the return to low-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * inside the VACT pe=
riod when timing allows.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lp_vact_en: 1;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the return to low-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * inside the HBP per=
iod when timing allows.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lp_hbp_en: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the return to low-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * inside the HFP per=
iod when timing allows.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lp_hfp_en: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the request for an ack-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * nowledge response =
at the end of a frame.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 frame_bta_ack_en:=
 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the command transmission<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * only in low-power =
mode.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lp_cmd_en: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_1: 16;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VID_MODE_CFG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x3C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _SDF_MODE_CONF=
IG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field defines=
 the 3D mode on/off &amp; display orientation:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 00: 3D mode off (2=
D mode on)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 01: 3D mode on, po=
rtrait orientation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 10: 3D mode on, la=
ndscape orientation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 11: Reserved<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_3d_mode: 2;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field defines=
 the 3D image format:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 00: Line (alternat=
ing lines of left and right data)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 01: Frame (alterna=
ting frames of left and right data)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 10: Pixel (alterna=
ting pixels of left and right data)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 11: Reserved<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_3d_format: 2;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field defines=
 whether there is a second VSYNC pulse<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * between Left and R=
ight Images, when 3D Image Format is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Frame-based:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: No sync pulses =
between left and right data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1: Sync pulse (HSY=
NC, VSYNC, blanking) between left and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 right=
 data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 second_vsync_en: =
1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit defines t=
he left or right order:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: Left eye data i=
s sent first, and then the right eye data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 is se=
nt.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1: Right eye data =
is sent first, and then the left eye data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 is se=
nt.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 left_right_order:=
 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0: 2;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * When set, causes t=
he next VSS packet to include 3D control<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * payload in every V=
SS packet.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_3d_payload_en:=
 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_1: 23;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} SDF_MODE_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x40 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _TIMEOUT_CNT_C=
LK_CONFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field indicat=
es the division factor for the Time Out<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * clock used as the =
timing unit in the configuration of HS to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * LP and LP to HS tr=
ansition error.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 timeout_cnt_clk_c=
onfig: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} TIMEOUT_CNT_CLK_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x44 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _HTX_TO_CONFIG=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the timeout counter that triggers<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * a high speed trans=
mission timeout contention detection<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (measured in TO_CL=
K_DIVISION cycles).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If using the non-b=
urst mode and there is no sufficient<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * time to switch fro=
m HS to LP and back in the period which<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is from one line d=
ata finishing to the next line sync<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * start, the DSI lin=
k returns the LP state once per frame,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * then you should co=
nfigure the TO_CLK_DIVISION and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * hstx_to_cnt to be =
in accordance with:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * hstx_to_cnt * lane=
byteclkperiod * TO_CLK_DIVISION &gt;=3D the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * time of one FRAME =
data transmission * (1 + 10%)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * In burst mode, RGB=
 pixel packets are time-compressed,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * leaving more time =
during a scan line. Therefore, if in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * burst mode and the=
re is sufficient time to switch from HS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * to LP and back in =
the period of time from one line data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * finishing to the n=
ext line sync start, the DSI link can<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * return LP mode and=
 back in this time interval to save power.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * For this, configur=
e the TO_CLK_DIVISION and hstx_to_cnt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * to be in accordanc=
e with:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * hstx_to_cnt * lane=
byteclkperiod * TO_CLK_DIVISION &gt;=3D the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * time of one LINE d=
ata transmission * (1 + 10%)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 htx_to_cnt_limit:=
 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} HTX_TO_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x48 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _LRX_H_TO_CONF=
IG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the timeout counter that triggers<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * a low-power recept=
ion timeout contention detection (measured<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in TO_CLK_DIVISION=
 cycles).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lrx_h_to_cnt_limi=
t: 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} LRX_H_TO_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x4C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _RD_PRESP_TO_C=
ONFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field sets a =
period for which the DWC_mipi_dsi_host<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * keeps the link sti=
ll, after sending a low-power read oper-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ation. This period=
 is measured in cycles of lanebyteclk.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The counting start=
s when the D-PHY enters the Stop state<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * and causes no inte=
rrupts.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lprd_presp_to_cnt=
_limit: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field sets a =
period for which the DWC_mipi_dsi_host<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * keeps the link sti=
ll, after sending a high-speed read oper-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ation. This period=
 is measured in cycles of lanebyteclk.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The counting start=
s when the D-PHY enters the Stop state<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * and causes no inte=
rrupts.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hsrd_presp_to_cnt=
_limit: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} RD_PRESP_TO_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x50 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _HSWR_PRESP_TO=
_CONFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field sets a =
period for which the DWC_mipi_dsi_host<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * keeps the link ina=
ctive after sending a high-speed write<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * operation. This pe=
riod is measured in cycles of lanebyteclk.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The counting start=
s when the D-PHY enters the Stop state<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * and causes no inte=
rrupts.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hswr_presp_to_cnt=
_limit: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0: 8;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * When set to 1, thi=
s bit ensures that the peripheral response<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * timeout caused by =
hs_wr_to_cnt is used only once per eDPI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * frame, when both t=
he following conditions are met:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * dpivsync_edpiwms h=
as risen and fallen.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Packets originated=
 from eDPI have been transmitted and its<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * FIFO is empty agai=
n In this scenario no non-eDPI requests<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * are sent to the D-=
PHY, even if there is traffic from generic<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * or DBI ready to be=
 sent, making it return to stop state.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * When it does so, P=
RESP_TO counter is activated and only when<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * it finishes does t=
he controller send any other traffic that<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is ready.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hswr_presp_to_mod=
e: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_1: 7;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} HSWR_PRESP_TO_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x54 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _LPWR_PRESP_TO=
_CONFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field sets a =
period for which the DWC_mipi_dsi_host<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * keeps the link sti=
ll, after sending a low-power write oper-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ation. This period=
 is measured in cycles of lanebyteclk.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The counting start=
s when the D-PHY enters the Stop state<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * and causes no inte=
rrupts.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lpwr_presp_to_cnt=
_limit: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} LPWR_PRESP_TO_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x58 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _BTA_PRESP_TO_=
CONFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field sets a =
period for which the DWC_mipi_dsi_host<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * keeps the link sti=
ll, after completing a Bus Turn-Around.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This period is mea=
sured in cycles of lanebyteclk. The<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * counting starts wh=
en the D-PHY enters the Stop state and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * causes no interrup=
ts.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 bta_presp_to_cnt_=
limit: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} BTA_PRESP_TO_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x5C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _TX_ESC_CLK_CO=
NFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field indicat=
es the division factor for the TX Escape<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * clock source (lane=
byteclk). The values 0 and 1 stop the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * TX_ESC clock gener=
ation.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tx_esc_clk_config=
: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} TX_ESC_CLK_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x60 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VACT_CMD_TRAN=
S_LIMIT {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field is used=
 for the transmission of commands in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * low-power mode. It=
 defines the size, in bytes, of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * largest packet tha=
t can fit in a line during the VACT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * region.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vact_cmd_trans_li=
mit: 8;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 24;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VACT_CMD_TRANS_LIMIT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x64 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VBLK_CMD_TRAN=
S_LIMIT {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field is used=
 for the transmission of commands in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * low-power mode. It=
 defines the size, in bytes, of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * largest packet tha=
t can fit in a line during the VSA, VBP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * and VFP regions.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vblk_cmd_trans_li=
mit: 8;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 24;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VBLK_CMD_TRANS_LIMIT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x68 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _CMD_MODE_CFG =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * When set to 1, thi=
s bit enables the tearing effect<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * acknowledge reques=
t.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tear_fx_en: 1;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * When set to 1, thi=
s bit enables the acknowledge request<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * after each packet =
transmission.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ack_rqst_en: 1;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0: 3;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pps_tx: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 exq_tx: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cmc_tx: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the Generic short write packet with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * zero parameter com=
mand transmission type:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_sw_0p_tx: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the Generic short write packet with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * one parameter comm=
and transmission type:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_sw_1p_tx: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the Generic short write packet with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * two parameters com=
mand transmission type:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_sw_2p_tx: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the Generic short read packet with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * zero parameter com=
mand transmission type:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_sr_0p_tx: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the Generic short read packet with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * one parameter comm=
and transmission type:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_sr_1p_tx: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the Generic short read packet with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * two parameters com=
mand transmission type:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_sr_2p_tx: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the Generic long write packet command<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * transmission type:=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_lw_tx: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_1: 1;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the DCS short write packet with zero<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * parameter command =
transmission type:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dcs_sw_0p_tx: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the DCS short write packet with one<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * parameter command =
transmission type:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dcs_sw_1p_tx: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the DCS short read packet with zero<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * parameter command =
transmission type:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dcs_sr_0p_tx: 1;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the DCS long write packet command<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * transmission type:=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dcs_lw_tx: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_2: 4;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit configure=
s the maximum read packet size command<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * transmission type:=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: High-speed 1: L=
ow-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 max_rd_pkt_size: =
1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_3: 7;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} CMD_MODE_CFG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x6C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _GEN_HDR {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the packet data type of the header<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * packet.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_dt: 6;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the virtual channel id of the header<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * packet.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_vc: 2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the least significant byte of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * header packet&#39;=
s Word count for long packets or data 0 for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * short packets.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_wc_lsbyte: 8;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the most significant byte of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * header packet&#39;=
s word count for long packets or data 1 for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * short packets.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_wc_msbyte: 8;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 8;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} GEN_HDR;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x70 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _GEN_PLD_DATA =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field indicat=
es byte 1 of the packet payload. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_pld_b1: 8;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field indicat=
es byte 2 of the packet payload. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_pld_b2: 8;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field indicat=
es byte 3 of the packet payload. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_pld_b3: 8;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field indicat=
es byte 4 of the packet payload. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_pld_b4: 8;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} GEN_PLD_DATA;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x74 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_CLK_LANE_=
LP_CTRL {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit controls =
the D-PHY PPI txrequestclkhs signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_clklane_tx_re=
q_hs: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit enables t=
he automatic mechanism to stop providing<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * clock in the clock=
 lane when time allows.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 auto_clklane_ctrl=
_en: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 30;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_CLK_LANE_LP_CTRL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x78 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_INTERFACE=
_CTRL {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 0, thi=
s bit places the D-PHY macro in power-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * down state.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_phy_shutdown: =
1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 0, thi=
s bit places the digital section of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * D-PHY in the reset=
 state.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_phy_reset_n: 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the D-PHY Clock Lane<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * module.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_phy_clk_en: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When the D-PHY is =
in ULPS, this bit enables the D-PHY PLL. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_phy_force_pll:=
 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ULPS mode Request =
on clock lane */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_phy_clk_txrequ=
lps: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ULPS mode Exit on =
clock lane */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_phy_clk_txexit=
ulps: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ULPS mode Request =
on all active data lanes */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_phy_data_txreq=
ulps: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ULPS mode Exit on =
all active data lanes */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_phy_data_txexi=
tulps: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 24;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_INTERFACE_CTRL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x7C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_TX_TRIGGE=
RS {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field control=
s the trigger transmissions. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_tx_triggers: =
4;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 28;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_TX_TRIGGERS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x80 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DESKEW_START =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 deskew_start: 1;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 31;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DESKEW_START;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x84 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DESKEW_MODE {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 deskew_mode: 2;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 30;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DESKEW_MODE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x88 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DESKEW_TIME {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 deskew_time: 32;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DESKEW_TIME;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x8C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DESKEW_PERIOD=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 deskew_period: 32=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DESKEW_PERIOD;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x90 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DESKEW_BUSY {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 deskew_busy: 1;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 31;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DESKEW_BUSY;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x94 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DESKEW_LANE_M=
ASK {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 deskew_lane0_mask=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 deskew_lane1_mask=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 deskew_lane2_mask=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 deskew_lane3_mask=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 28;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DESKEW_LANE_MASK;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x98 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _CMD_MODE_STAT=
US {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit is set wh=
en a read command is issued and cleared<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * when the entire re=
sponse is stored in the FIFO.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value after reset:=
 0x0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * NOTE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * For mipi-dsi-r1p0 =
IP, this bit is set immediately when<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0the read cmd is set to the GEN_HDR register.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * For dsi-ctrl-r1p0 =
IP, this bit is set only after the read<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0cmd was actually sent out from the controller.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_rdcmd_ong=
oing: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit indicates=
 the empty status of the generic read<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * payload FIFO.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value after reset:=
 0x1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_rdata_fif=
o_empty: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit indicates=
 the full status of the generic read<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * payload FIFO.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value after reset:=
 0x0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_rdata_fif=
o_full: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit indicates=
 the empty status of the generic write<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * payload FIFO.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value after reset:=
 0x1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_wdata_fif=
o_empty: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit indicates=
 the full status of the generic write<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * payload FIFO.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value after reset:=
 0x0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_wdata_fif=
o_full: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit indicates=
 the empty status of the generic<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * command FIFO.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value after reset:=
 0x1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_cmd_fifo_=
empty: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit indicates=
 the full status of the generic<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * command FIFO.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value after reset:=
 0x0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_cmd_fifo_=
full: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This bit is set wh=
en the entire response of read is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * stored in the rx p=
ayload FIFO. And it will be cleared<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * automaticlly after=
 read this bit each time.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value after reset:=
 0x0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * NOTE: this bit is =
just supported for dsi-ctrl-r1p0 IP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gen_cmd_rdcmd_don=
e: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved : 24;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} CMD_MODE_STATUS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x9C {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_STATUS {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of phyd=
irection D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_direction: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of phyl=
ock D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_lock: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of rxul=
psesc0lane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_rxulpsesc0lan=
e: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of phys=
topstateclklane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_stopstateclkl=
ane: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of phys=
topstate0lane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_stopstate0lan=
e: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of phys=
topstate1lane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_stopstate1lan=
e: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of phys=
topstate2lane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_stopstate2lan=
e: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of phys=
topstate3lane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_stopstate3lan=
e: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of phyu=
lpsactivenotclk D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_ulpsactivenot=
clk: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of ulps=
activenot0lane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_ulpsactivenot=
0lane: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of ulps=
activenot1lane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_ulpsactivenot=
1lane: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of ulps=
activenot2lane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_ulpsactivenot=
2lane: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the status of ulps=
activenot3lane D-PHY signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_ulpsactivenot=
3lane: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 19;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_STATUS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xA0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_MIN_STOP_=
TIME {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This field configu=
res the minimum wait period to request<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * a high-speed trans=
mission after the Stop state.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_min_stop_time=
: 8;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 24;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_MIN_STOP_TIME;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xA4 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_LANE_NUM_=
CONFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the number of active data lanes:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 00: One data lane =
(lane 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 01: Two data lanes=
 (lanes 0 and 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 10: Three data lan=
es (lanes 0, 1, and 2)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 11: Four data lane=
s (lanes 0, 1, 2, and 3)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_lane_num: 2;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 30;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_LANE_NUM_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xA8 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_CLKLANE_T=
IME_CONFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the maximum time that the D-PHY<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * clock lane takes t=
o go from low-power to high-speed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * transmission measu=
red in lane byte clock cycles.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_clklane_lp_to=
_hs_time: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the maximum time that the D-PHY<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * clock lane takes t=
o go from high-speed to low-power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * transmission measu=
red in lane byte clock cycles.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_clklane_hs_to=
_lp_time: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_CLKLANE_TIME_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xAC {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_DATALANE_=
TIME_CONFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the maximum time that the D-PHY data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * lanes take to go f=
rom low-power to high-speed transmission<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * measured in lane b=
yte clock cycles.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_datalane_lp_t=
o_hs_time: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the maximum time that the D-PHY data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * lanes take to go f=
rom high-speed to low-power transmission<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * measured in lane b=
yte clock cycles.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_datalane_hs_t=
o_lp_time: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_DATALANE_TIME_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xB0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _MAX_READ_TIME=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the maximum time required to perform<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * a read command in =
lane byte clock cycles. This register can<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * only be modified w=
hen no read command is in progress.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 max_rd_time: 16;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} MAX_READ_TIME;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xB4 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _RX_PKT_CHECK_=
CONFIG {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the ECC reception, error<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * correction, and re=
porting.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rx_pkt_ecc_en: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the CRC reception and error<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * reporting.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rx_pkt_crc_en: 1;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 30;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} RX_PKT_CHECK_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xB8 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _TA_EN {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the Bus Turn-Around (BTA)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * request.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ta_en: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 31;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} TA_EN;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xBC {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _EOTP_EN {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the EoTp transmission */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tx_eotp_en: 1;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* When set to 1, thi=
s bit enables the EoTp reception. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rx_eotp_en: 1;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 30;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} EOTP_EN;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xC0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VIDEO_NULLPKT=
_SIZE {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This register conf=
igures the number of bytes inside a null<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * packet. Setting it=
 to 0 disables the null packets.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 video_nullpkt_siz=
e: 13;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 19;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VIDEO_NULLPKT_SIZE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xC4 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _DCS_WM_PKT_SI=
ZE {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This field configu=
res the maximum allowed size for an eDPI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * write memory comma=
nd, measured in pixels. Automatic parti-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * tioning of data ob=
tained from eDPI is permanently enabled.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dcs_wm_pkt_size: =
16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} DCS_WM_PKT_SIZE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xC8 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PROTOCOL_INT_=
CLR {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_dphy_errors_0=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_dphy_errors_1=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_dphy_errors_2=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_dphy_errors_3=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_dphy_errors_4=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_protocol_debu=
g_err: 11;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
0: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
1: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
2: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
3: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
4: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
5: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
6: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
7: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
8: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
9: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
10: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
11: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
12: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
13: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
14: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ack_with_err_=
15: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PROTOCOL_INT_CLR;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xCC {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _INTERNAL_INT_=
CLR {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_receive_pkt_s=
ize_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_eopt_not_rece=
ive_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_gen_cmd_cmd_f=
ifo_wr_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_gen_cmd_rdata=
_fifo_rd_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_gen_cmd_rdata=
_fifo_wr_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_gen_cmd_wdata=
_fifo_wr_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_gen_cmd_wdata=
_fifo_rd_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_dpi_pix_fifo_=
wr_err: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_internal_debu=
g_err: 19;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ecc_single_er=
r: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_ecc_multi_err=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_crc_err: 1;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_hs_tx_timeout=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clr_lp_rx_timeout=
: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} INTERNAL_INT_CLR;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xD0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _VIDEO_SIG_DEL=
AY_CONFIG {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * DPI interface sign=
al delay to be used in clk lanebyte<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * domain for control=
 logic to read video data from pixel<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * memory in mannal m=
ode, measured in clk_lanebyte cycles<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 video_sig_delay: =
24;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1&#39;b1: mannal m=
ode<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 =C2=A0dsi controller will use video_sig_delay value as<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 =C2=A0the delay for the packet handle logic to read video<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 =C2=A0data from pixel memory.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1&#39;b0: auto mod=
e<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 =C2=A0dsi controller will auto calculate the delay for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 =C2=A0the packet handle logic to read video data from<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 =C2=A0pixel memory.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 video_sig_delay_m=
ode: 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 7;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} VIDEO_SIG_DELAY_CONFIG;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 reservedD4_EC[7];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xF0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_TST_CTRL0=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PHY test interface=
 clear (active high) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_testclr: 1;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit is used t=
o clock the TESTDIN bus into the D-PHY */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_testclk: 1;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 30;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_TST_CTRL0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xF4 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _PHY_TST_CTRL1=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PHY test interface=
 input 8-bit data bus for internal<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * register programmi=
ng and test functionalities access.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_testdin: 8;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PHY output 8-bit d=
ata bus for read-back and internal<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * probing functional=
ities.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_testdout: 8;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * PHY test interface=
 operation selector:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1: The address wri=
te operation is set on the falling edge<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 of th=
e testclk signal.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0: The data write =
operation is set on the rising edge of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 the t=
estclk signal.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 phy_testen: 1;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 15;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} PHY_TST_CTRL1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 reservedF8_1FC[66];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x200 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _INT_PLL_STS {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 int_pll_sts: 1;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 31;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} INT_PLL_STS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x204 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _INT_PLL_MSK {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 int_pll_msk: 1;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 31;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} INT_PLL_MSK;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x208 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _INT_PLL_CLR {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 int_pll_clr: 1;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved: 31;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} INT_PLL_CLR;<br>
&gt; +<br>
&gt; +};<br>
&gt; +<br>
&gt; +void dsi_power_enable(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_video_mode(struct dsi_context *ctx);<br>
&gt; +void dsi_cmd_mode(struct dsi_context *ctx);<br>
&gt; +bool dsi_is_cmd_mode(struct dsi_context *ctx);<br>
&gt; +void dsi_rx_vcid(struct dsi_context *ctx, u8 vc);<br>
&gt; +void dsi_video_vcid(struct dsi_context *ctx, u8 vc);<br>
&gt; +void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mode);<br>
&gt; +void dsi_dpi_color_coding(struct dsi_context *ctx, int coding);<br>
&gt; +void dsi_dpi_sig_delay(struct dsi_context *ctx, u16 byte_cycle);<br>
&gt; +void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cycle);<br>
&gt; +void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cycle);<br>
&gt; +void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle);<br>
&gt; +void dsi_dpi_vact(struct dsi_context *ctx, u16 lines);<br>
&gt; +void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines);<br>
&gt; +void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines);<br>
&gt; +void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines);<br>
&gt; +void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 no);<br>
&gt; +void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 size);<br>
&gt; +void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 size);<br=
>
&gt; +void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size);<br>
&gt; +void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int enable);<b=
r>
&gt; +void dsi_set_packet_header(struct dsi_context *ctx, u8 vc, u8 type,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0u8 wc_lsb, u8 wc_msb);<br>
&gt; +void dsi_set_packet_payload(struct dsi_context *ctx, u32 payload);<br=
>
&gt; +u32 dsi_get_rx_payload(struct dsi_context *ctx);<br>
&gt; +void dsi_bta_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_eotp_rx_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_eotp_tx_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_ecc_rx_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_crc_rx_en(struct dsi_context *ctx, int enable);<br>
&gt; +bool dsi_is_bta_returned(struct dsi_context *ctx);<br>
&gt; +bool dsi_is_rx_payload_fifo_full(struct dsi_context *ctx);<br>
&gt; +bool dsi_is_rx_payload_fifo_empty(struct dsi_context *ctx);<br>
&gt; +bool dsi_is_tx_payload_fifo_full(struct dsi_context *ctx);<br>
&gt; +bool dsi_is_tx_payload_fifo_empty(struct dsi_context *ctx);<br>
&gt; +bool dsi_is_tx_cmd_fifo_empty(struct dsi_context *ctx);<br>
&gt; +void dsi_datalane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycl=
e);<br>
&gt; +void dsi_datalane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycl=
e);<br>
&gt; +void dsi_clklane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle=
);<br>
&gt; +void dsi_clklane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle=
);<br>
&gt; +void dsi_max_read_time(struct dsi_context *ctx, u16 byte_cycle);<br>
&gt; +void dsi_nc_clk_en(struct dsi_context *ctx, int enable);<br>
&gt; +void dsi_tx_escape_division(struct dsi_context *ctx, u8 div);<br>
&gt; +void dsi_timeout_clock_division(struct dsi_context *ctx, u8 div);<br>
&gt; +void dsi_lp_rx_timeout(struct dsi_context *ctx, u16 count);<br>
&gt; +void dsi_hs_tx_timeout(struct dsi_context *ctx, u16 count);<br>
&gt; +u32 dsi_int0_status(struct dsi_context *ctx);<br>
&gt; +u32 dsi_int1_status(struct dsi_context *ctx);<br>
&gt; +void dsi_int0_mask(struct dsi_context *ctx, u32 mask);<br>
&gt; +void dsi_int1_mask(struct dsi_context *ctx, u32 mask);<br>
&gt; +<br>
&gt; +#endif /* _DW_DSI_CTRL_H_ */<br>
&gt; diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c b/drivers/gpu/drm/=
sprd/dw_dsi_ctrl_ppi.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..6e28d7c<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c<br>
&gt; @@ -0,0 +1,157 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;dw_dsi_ctrl.h&quot;<br>
&gt; +#include &quot;dw_dsi_ctrl_ppi.h&quot;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Reset D-PHY module<br>
&gt; + */<br>
&gt; +void dsi_phy_rstz(struct dsi_context *ctx, int level)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x78 phy_interface_ctrl;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_interface_ctrl.val =3D readl(&amp;reg-&gt;PHY=
_INTERFACE_CTRL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_interface_ctrl.bits.rf_phy_reset_n =3D level;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_interface_ctrl.val, &amp;reg-&gt;PHY_I=
NTERFACE_CTRL);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Power up/down D-PHY module<br>
&gt; + */<br>
&gt; +void dsi_phy_shutdownz(struct dsi_context *ctx, int level)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x78 phy_interface_ctrl;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_interface_ctrl.val =3D readl(&amp;reg-&gt;PHY=
_INTERFACE_CTRL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_interface_ctrl.bits.rf_phy_shutdown =3D level=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_interface_ctrl.val, &amp;reg-&gt;PHY_I=
NTERFACE_CTRL);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Configure minimum wait period for HS transmission request after a =
stop state<br>
&gt; + */<br>
&gt; +void dsi_phy_stop_wait_time(struct dsi_context *ctx, u8 byte_cycle)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(byte_cycle, &amp;reg-&gt;PHY_MIN_STOP_TIME=
);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Set number of active lanes<br>
&gt; + */<br>
&gt; +void dsi_phy_datalane_en(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(ctx-&gt;lanes - 1, &amp;reg-&gt;PHY_LANE_N=
UM_CONFIG);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Enable clock lane module<br>
&gt; + */<br>
&gt; +void dsi_phy_clklane_en(struct dsi_context *ctx, int en)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x78 phy_interface_ctrl;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_interface_ctrl.val =3D readl(&amp;reg-&gt;PHY=
_INTERFACE_CTRL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_interface_ctrl.bits.rf_phy_clk_en =3D en;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_interface_ctrl.val, &amp;reg-&gt;PHY_I=
NTERFACE_CTRL);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Request the PHY module to start transmission of high speed clock.<=
br>
&gt; + * This causes the clock lane to start transmitting DDR clock on the<=
br>
&gt; + * lane interconnect.<br>
&gt; + */<br>
&gt; +void dsi_phy_clk_hs_rqst(struct dsi_context *ctx, int enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x74 phy_clk_lane_lp_ctrl;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_clk_lane_lp_ctrl.val =3D readl(&amp;reg-&gt;P=
HY_CLK_LANE_LP_CTRL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en =
=3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_clk_lane_lp_ctrl.bits.phy_clklane_tx_req_hs =
=3D enable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_clk_lane_lp_ctrl.val, &amp;reg-&gt;PHY=
_CLK_LANE_LP_CTRL);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Get D-PHY PPI status<br>
&gt; + */<br>
&gt; +u8 dsi_phy_is_pll_locked(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0x9C phy_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_status.val =3D readl(&amp;reg-&gt;PHY_STATUS)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return phy_status.bits.phy_lock;<br>
&gt; +}<br>
&gt; +<br>
&gt; +void dsi_phy_test_clk(struct dsi_context *ctx, u8 value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xF0 phy_tst_ctrl0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_tst_ctrl0.val =3D readl(&amp;reg-&gt;PHY_TST_=
CTRL0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_tst_ctrl0.bits.phy_testclk =3D value;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_tst_ctrl0.val, &amp;reg-&gt;PHY_TST_CT=
RL0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void dsi_phy_test_clr(struct dsi_context *ctx, u8 value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xF0 phy_tst_ctrl0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_tst_ctrl0.val =3D readl(&amp;reg-&gt;PHY_TST_=
CTRL0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_tst_ctrl0.bits.phy_testclr =3D value;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_tst_ctrl0.val, &amp;reg-&gt;PHY_TST_CT=
RL0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void dsi_phy_test_en(struct dsi_context *ctx, u8 value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xF4 phy_tst_ctrl1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_tst_ctrl1.val =3D readl(&amp;reg-&gt;PHY_TST_=
CTRL1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_tst_ctrl1.bits.phy_testen =3D value;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_tst_ctrl1.val, &amp;reg-&gt;PHY_TST_CT=
RL1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +u8 dsi_phy_test_dout(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xF4 phy_tst_ctrl1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_tst_ctrl1.val =3D readl(&amp;reg-&gt;PHY_TST_=
CTRL1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return phy_tst_ctrl1.bits.phy_testdout;<br>
&gt; +}<br>
&gt; +<br>
&gt; +void dsi_phy_test_din(struct dsi_context *ctx, u8 data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_reg *reg =3D (struct dsi_reg *)ctx-&gt=
;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union _0xF4 phy_tst_ctrl1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_tst_ctrl1.val =3D readl(&amp;reg-&gt;PHY_TST_=
CTRL1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy_tst_ctrl1.bits.phy_testdin =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(phy_tst_ctrl1.val, &amp;reg-&gt;PHY_TST_CT=
RL1);<br>
&gt; +}<br>
&gt; diff --git a/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h b/drivers/gpu/drm/=
sprd/dw_dsi_ctrl_ppi.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d87fb75<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _DW_DSI_CTRL_PPI_H_<br>
&gt; +#define _DW_DSI_CTRL_PPI_H_<br>
&gt; +<br>
&gt; +#include &quot;sprd_dsi.h&quot;<br>
&gt; +<br>
&gt; +void dsi_phy_rstz(struct dsi_context *ctx, int level);<br>
&gt; +void dsi_phy_shutdownz(struct dsi_context *ctx, int level);<br>
&gt; +void dsi_phy_force_pll(struct dsi_context *ctx, int force);<br>
&gt; +void dsi_phy_stop_wait_time(struct dsi_context *ctx, u8 byte_clk);<br=
>
&gt; +void dsi_phy_datalane_en(struct dsi_context *ctx);<br>
&gt; +void dsi_phy_clklane_en(struct dsi_context *ctx, int en);<br>
&gt; +void dsi_phy_clk_hs_rqst(struct dsi_context *ctx, int en);<br>
&gt; +u8 dsi_phy_is_pll_locked(struct dsi_context *ctx);<br>
&gt; +void dsi_phy_test_clk(struct dsi_context *ctx, u8 level);<br>
&gt; +void dsi_phy_test_clr(struct dsi_context *ctx, u8 level);<br>
&gt; +void dsi_phy_test_en(struct dsi_context *ctx, u8 level);<br>
&gt; +u8 dsi_phy_test_dout(struct dsi_context *ctx);<br>
&gt; +void dsi_phy_test_din(struct dsi_context *ctx, u8 data);<br>
&gt; +void dsi_phy_bist_en(struct dsi_context *ctx, int en);<br>
&gt; +<br>
&gt; +#endif /* _DW_DSI_CTRL_PPI_H_ */<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sp=
rd/megacores_pll.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..03c1f0f<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/megacores_pll.c<br>
&gt; @@ -0,0 +1,317 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;asm/div64.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/string.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;megacores_pll.h&quot;<br>
&gt; +<br>
&gt; +#define L=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0<br>
&gt; +#define H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 1<br>
&gt; +#define CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt; +#define DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; +#define INFINITY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xffffffff<br>
&gt; +#define MIN_OUTPUT_FREQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (100)<br>
&gt; +<br>
&gt; +#define AVERAGE(a, b) (min(a, b) + abs((b) - (a)) / 2)<br>
&gt; +<br>
&gt; +/* sharkle */<br>
&gt; +#define VCO_BAND_LOW 750<br>
&gt; +#define VCO_BAND_MID 1100<br>
&gt; +#define VCO_BAND_HIGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 1500<br>
&gt; +#define PHY_REF_CLK=C2=A0 26000<br>
&gt; +<br>
&gt; +static int dphy_calc_pll_param(struct dphy_pll *pll)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const u32 khz =3D 1000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const u32 mhz =3D 1000000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const unsigned long long factor =3D 100;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long long tmp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;potential_fvco =3D pll-&gt;freq / khz;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;ref_clk =3D PHY_REF_CLK / khz;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 4; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pll-&gt;potential=
_fvco &gt;=3D VCO_BAND_LOW &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pll-&gt;potential_fvco &lt;=3D VCO_BAND_HIGH) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pll-&gt;fvco =3D pll-&gt;potential_fvco;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pll-&gt;out_sel =3D BIT(i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;potential_fvc=
o &lt;&lt;=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pll-&gt;fvco =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pll-&gt;fvco &gt;=3D VCO_BAND_LOW &amp;&amp; =
pll-&gt;fvco &lt;=3D VCO_BAND_MID) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* vco band control *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;vco_band =3D =
0x0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* low pass filter co=
ntrol */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;lpf_sel =3D 1=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (pll-&gt;fvco &gt; VCO_BAND_MID &amp;&a=
mp; pll-&gt;fvco &lt;=3D VCO_BAND_HIGH) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;vco_band =3D =
0x1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;lpf_sel =3D 0=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;nint =3D pll-&gt;fvco / pll-&gt;ref_clk;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0tmp =3D pll-&gt;fvco * factor * mhz;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0do_div(tmp, pll-&gt;ref_clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tmp =3D tmp - pll-&gt;nint * factor * mhz;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tmp *=3D BIT(20);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0do_div(tmp, 100000000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;kint =3D (u32)tmp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;refin =3D 3; /* pre-divider bypass */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;sdm_en =3D true; /* use fraction N PLL */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;fdk_s =3D 0x1; /* fraction */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;cp_s =3D 0x0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;det_delay =3D 0x1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *reg=
map)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pll_reg *reg =3D &amp;pll-&gt;reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 *val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 reg_addr[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x03, 0x04, 0x06, 0x0=
8, 0x09,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0a, 0x0b, 0x0e, 0x0=
f<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_03.bits.prbs_bist =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_03.bits.en_lp_treot =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_03.bits.lpf_sel =3D pll-&gt;lpf_sel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_03.bits.txfifo_bypass =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_04.bits.div =3D pll-&gt;div;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_04.bits.masterof8lane =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_04.bits.cp_s =3D pll-&gt;cp_s;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_04.bits.fdk_s =3D pll-&gt;fdk_s;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_06.bits.nint =3D pll-&gt;nint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_08.bits.vco_band =3D pll-&gt;vco_band;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_08.bits.sdm_en =3D pll-&gt;sdm_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_08.bits.refin =3D pll-&gt;refin;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_09.bits.kint_h =3D pll-&gt;kint &gt;&gt;=
 12;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_0a.bits.kint_m =3D (pll-&gt;kint &gt;&gt=
; 4) &amp; 0xff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_0b.bits.out_sel =3D pll-&gt;out_sel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_0b.bits.kint_l =3D pll-&gt;kint &amp; 0x=
f;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_0e.bits.pll_pu_byp =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_0e.bits.pll_pu =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_0e.bits.stopstate_sel =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-&gt;_0f.bits.det_delay =3D pll-&gt;det_delay;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D (u8 *)&amp;reg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; sizeof(reg_addr); ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
reg_addr[i], val[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%02x:=
 %02x\n&quot;, reg_addr[i], val[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +int dphy_pll_config(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D container_of(ctx, struct=
 sprd_dsi, ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *regmap =3D ctx-&gt;regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dphy_pll *pll =3D ctx-&gt;pll;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;freq =3D ctx-&gt;byte_clk * 8;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* FREQ =3D 26M * (NINT + KINT / 2^20) / out_sel =
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dphy_calc_pll_param(pll);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;failed to calculate dphy pll parameters\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dphy_set_pll_reg(pll, regmap);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dphy_set_timing_reg(struct regmap *regmap, int type, u8 v=
al[])<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case REQUEST_TIME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x31, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x41, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x51, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x61, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x71, val[DATA]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x90, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xa0, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xb0, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xc0, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xd0, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case PREPARE_TIME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x32, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x42, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x52, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x62, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x72, val[DATA]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x91, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xa1, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xb1, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xc1, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xd1, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case ZERO_TIME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x33, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x43, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x53, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x63, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x73, val[DATA]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x92, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xa2, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xb2, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xc2, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xd2, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case TRAIL_TIME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x34, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x44, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x54, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x64, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x74, val[DATA]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x93, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xa3, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xb3, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xc3, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xd3, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case EXIT_TIME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x36, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x46, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x56, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x66, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x76, val[DATA]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x95, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xA5, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xB5, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xc5, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0xd5, val[DATA]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case CLKPOST_TIME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x35, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(regmap, =
0x94, val[CLK]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* the following just use default value */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case SETTLE_TIME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case TA_GET:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case TA_GO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case TA_SURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +void dphy_timing_config(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *regmap =3D ctx-&gt;regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dphy_pll *pll =3D ctx-&gt;pll;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const u32 factor =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const u32 scale =3D 100;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 t_ui, t_byteck, t_half_byteck;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 range[2], constant;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 val[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 tmp =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* t_ui: 1 ui, byteck: 8 ui, half byteck: 4 ui */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0t_ui =3D 1000 * scale / (pll-&gt;freq / 1000);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0t_byteck =3D t_ui &lt;&lt; 3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0t_half_byteck =3D t_ui &lt;&lt; 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0constant =3D t_ui &lt;&lt; 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* REQUEST_TIME: HS T-LPX: LP-01<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * For T-LPX, mipi spec defined min value is 50ns=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * but maybe it shouldn&#39;t be too small, becau=
se BTA,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * LP-10, LP-00, LP-01, all of this is related to=
 T-LPX.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[L] =3D 50 * scale;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[H] =3D INFINITY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[CLK] =3D DIV_ROUND_UP(range[L] * (factor &lt;=
&lt; 1), t_byteck) - 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[DATA] =3D val[CLK];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dphy_set_timing_reg(regmap, REQUEST_TIME, val);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* PREPARE_TIME: HS sequence: LP-00 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[L] =3D 38 * scale;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[H] =3D 95 * scale;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tmp =3D AVERAGE(range[L], range[H]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[CLK] =3D DIV_ROUND_UP(AVERAGE(range[L], range=
[H]),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0t_half_byteck) - 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[L] =3D 40 * scale + 4 * t_ui;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[H] =3D 85 * scale + 6 * t_ui;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tmp |=3D AVERAGE(range[L], range[H]) &lt;&lt; 16;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[DATA] =3D DIV_ROUND_UP(AVERAGE(range[L], rang=
e[H]),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0t_half_byteck) - 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dphy_set_timing_reg(regmap, PREPARE_TIME, val);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* ZERO_TIME: HS-ZERO */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[L] =3D 300 * scale;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[H] =3D INFINITY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[CLK] =3D DIV_ROUND_UP(range[L] * factor + (tm=
p &amp; 0xffff)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0- 525 * t_byteck / 100, t_byteck) - 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[L] =3D 145 * scale + 10 * t_ui;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[DATA] =3D DIV_ROUND_UP(range[L] * factor<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0+ ((tmp &gt;&gt; 16) &amp; 0xffff) - 525 * t_byteck / 100,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0t_byteck) - 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dphy_set_timing_reg(regmap, ZERO_TIME, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* TRAIL_TIME: HS-TRAIL */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[L] =3D 60 * scale;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[H] =3D INFINITY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[CLK] =3D DIV_ROUND_UP(range[L] * factor - con=
stant, t_half_byteck);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[L] =3D max(8 * t_ui, 60 * scale + 4 * t_ui)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[DATA] =3D DIV_ROUND_UP(range[L] * 3 / 2 - con=
stant, t_half_byteck) - 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dphy_set_timing_reg(regmap, TRAIL_TIME, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* EXIT_TIME: */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[L] =3D 100 * scale;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[H] =3D INFINITY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[CLK] =3D DIV_ROUND_UP(range[L] * factor, t_by=
teck) - 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[DATA] =3D val[CLK];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dphy_set_timing_reg(regmap, EXIT_TIME, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* CLKPOST_TIME: */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[L] =3D 60 * scale + 52 * t_ui;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0range[H] =3D INFINITY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[CLK] =3D DIV_ROUND_UP(range[L] * factor, t_by=
teck) - 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val[DATA] =3D val[CLK];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dphy_set_timing_reg(regmap, CLKPOST_TIME, val);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* SETTLE_TIME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * This time is used for receiver. So for transmi=
tter,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * it can be ignored.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* TA_GO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * transmitter drives bridge state(LP-00) before =
releasing control,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * reg 0x1f default value: 0x04, which is good.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* TA_SURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * After LP-10 state and before bridge state(LP-0=
0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * reg 0x20 default value: 0x01, which is good.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* TA_GET:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * receiver drives Bridge state(LP-00) before rel=
easing control<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * reg 0x21 default value: 0x03, which is good.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +}<br>
&gt; diff --git a/drivers/gpu/drm/sprd/megacores_pll.h b/drivers/gpu/drm/sp=
rd/megacores_pll.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..750dbbc<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/megacores_pll.h<br>
&gt; @@ -0,0 +1,146 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _MEGACORES_PLL_H_<br>
&gt; +#define _MEGACORES_PLL_H_<br>
&gt; +<br>
&gt; +#include &quot;sprd_dsi.h&quot;<br>
&gt; +<br>
&gt; +enum PLL_TIMING {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NONE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0REQUEST_TIME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PREPARE_TIME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SETTLE_TIME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ZERO_TIME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TRAIL_TIME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0EXIT_TIME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CLKPOST_TIME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TA_GET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TA_GO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TA_SURE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TA_WAIT,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct pll_reg {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_03__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __03 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 prbs_bist: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 en_lp_treot: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 lpf_sel: 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 txfifo_bypass: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 freq_hopping: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _03;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_04__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __04 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 div: 3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 masterof8lane: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 hop_trig: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 cp_s: 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 fdk_s: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _04;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_06__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __06 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 nint: 7;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 mod_en: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _06;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_07__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __07 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 kdelta_h: 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _07;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_08__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __08 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 vco_band: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 sdm_en: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 refin: 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 kdelta_l: 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _08;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_09__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __09 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 kint_h: 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _09;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_0a__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __0a {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 kint_m: 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _0a;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_0b__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __0b {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 out_sel: 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 kint_l: 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _0b;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_0c__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __0c {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 kstep_h: 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _0c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_0d__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __0d {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 kstep_m: 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _0d;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_0e__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __0e {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 pll_pu_byp: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 pll_pu: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 hsbist_len: 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 stopstate_sel: 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 kstep_l: 3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _0e;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union __reg_0f__ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __0f {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 det_delay:2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 kdelta: 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 ldo0p4:2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} _0f;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct dphy_pll {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 refin; /* Pre-divider control signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 cp_s; /* 00: SDM_EN=3D1, 10: SDM_EN=3D0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 fdk_s; /* PLL mode control: integer or fractio=
n */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 sdm_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 div;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 int_n; /* integer N PLL */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ref_clk; /* dphy reference clock, unit: MHz *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 freq; /* panel config, unit: KHz */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 fvco;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 potential_fvco;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 nint; /* sigma delta modulator NINT control *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 kint; /* sigma delta modulator KINT control *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 lpf_sel; /* low pass filter control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 out_sel; /* post divider control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 vco_band; /* vco range */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 det_delay;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pll_reg reg;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct dsi_context;<br>
&gt; +<br>
&gt; +int dphy_pll_config(struct dsi_context *ctx);<br>
&gt; +void dphy_timing_config(struct dsi_context *ctx);<br>
&gt; +<br>
&gt; +#endif /* _MEGACORES_PLL_H_ */<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sp=
rd_drm.c<br>
&gt; index ca93be2..5323e23 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; @@ -197,6 +197,7 @@ static struct platform_driver sprd_drm_driver =3D =
{<br>
&gt;=C2=A0 static struct platform_driver *sprd_drm_drivers[]=C2=A0 =3D {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sprd_drm_driver,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sprd_dpu_driver,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;sprd_dsi_driver,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int __init sprd_drm_init(void)<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sp=
rd_drm.h<br>
&gt; index 85d4a8b..95d1b97 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; @@ -14,5 +14,6 @@ struct sprd_drm {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 extern struct platform_driver sprd_dpu_driver;<br>
&gt; +extern struct platform_driver sprd_dsi_driver;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif /* _SPRD_DRM_H_ */<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sp=
rd_dsi.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..4ebc1aa<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dsi.c<br>
&gt; @@ -0,0 +1,1162 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/component.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of_address.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/of_irq.h&gt;<br>
&gt; +#include &lt;linux/of_graph.h&gt;<br>
&gt; +#include &lt;video/mipi_display.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_of.h&gt;<br>
&gt; +#include &lt;drm/drm_probe_helper.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +#include &quot;sprd_dpu.h&quot;<br>
&gt; +#include &quot;sprd_dsi.h&quot;<br>
&gt; +#include &quot;dw_dsi_ctrl.h&quot;<br>
&gt; +#include &quot;dw_dsi_ctrl_ppi.h&quot;<br>
&gt; +<br>
&gt; +#define encoder_to_dsi(encoder) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0container_of(encoder, struct sprd_dsi, encoder)<b=
r>
&gt; +#define host_to_dsi(host) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0container_of(host, struct sprd_dsi, host)<br>
&gt; +#define connector_to_dsi(connector) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0container_of(connector, struct sprd_dsi, connecto=
r)<br>
&gt; +<br>
&gt; +static int regmap_tst_io_write(void *context, u32 reg, u32 val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D context;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_context *ctx =3D &amp;dsi-&gt;ctx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (val &gt; 0xff || reg &gt; 0xff)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg(dsi-&gt;drm, &quot;reg =3D 0x%02x, val =
=3D 0x%02x\n&quot;, reg, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_en(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_din(ctx, reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_clk(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_clk(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_en(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_din(ctx, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_clk(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_clk(ctx, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int regmap_tst_io_read(void *context, u32 reg, u32 *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D context;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_context *ctx =3D &amp;dsi-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg &gt; 0xff)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_en(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_din(ctx, reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_clk(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_clk(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_en(ctx, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0udelay(1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dsi_phy_test_dout(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*val =3D ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg(dsi-&gt;drm, &quot;reg =3D 0x%02x, val =
=3D 0x%02x\n&quot;, reg, *val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct regmap_bus regmap_tst_io =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_write =3D regmap_tst_io_write,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_read =3D regmap_tst_io_read,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct regmap_config byte_config =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_bits =3D 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.val_bits =3D 8,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int dphy_wait_pll_locked(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D container_of(ctx, struct=
 sprd_dsi, ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 50000; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi_phy_is_pll_lo=
cked(ctx))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, &quot;dphy pll can not be lo=
cked\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dsi_wait_tx_payload_fifo_empty(struct dsi_context *ctx)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 5000; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi_is_tx_payload=
_fifo_empty(ctx))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dsi_wait_tx_cmd_fifo_empty(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 5000; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi_is_tx_cmd_fif=
o_empty(ctx))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dsi_wait_rd_resp_completed(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 10000; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi_is_bta_return=
ed(ctx))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u16 calc_bytes_per_pixel_x100(int coding)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 Bpp_x100;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (coding) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_16BIT_CONFIG1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_16BIT_CONFIG2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_16BIT_CONFIG3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 200;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_18BIT_CONFIG1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_18BIT_CONFIG2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 225;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_24BIT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 300;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_COMPRESSTION:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 100;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_20BIT_YCC422_LOOSELY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 250;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_24BIT_YCC422:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 300;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_16BIT_YCC422:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 200;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_30BIT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 375;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_36BIT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 450;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_12BIT_YCC420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 150;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;inval=
id color coding&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return Bpp_x100;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u8 calc_video_size_step(int coding)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 video_size_step;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (coding) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_16BIT_CONFIG1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_16BIT_CONFIG2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_16BIT_CONFIG3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_18BIT_CONFIG1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_18BIT_CONFIG2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_24BIT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_COMPRESSTION:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return video_size_ste=
p =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_20BIT_YCC422_LOOSELY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_24BIT_YCC422:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_16BIT_YCC422:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_30BIT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_36BIT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_12BIT_YCC420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return video_size_ste=
p =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;inval=
id color coding&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u16 round_video_size(int coding, u16 video_size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (coding) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_16BIT_YCC422:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_24BIT_YCC422:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_20BIT_YCC422_LOOSELY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COLOR_CODE_12BIT_YCC420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* round up active H =
pixels to a multiple of 2 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((video_size % 2) =
!=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0video_size +=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return video_size;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define SPRD_MIPI_DSI_FMT_DSC 0xff<br>
&gt; +static u32 fmt_to_coding(u32 fmt)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (fmt) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIPI_DSI_FMT_RGB565:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return COLOR_CODE_16B=
IT_CONFIG1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIPI_DSI_FMT_RGB666:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIPI_DSI_FMT_RGB666_PACKED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return COLOR_CODE_18B=
IT_CONFIG1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIPI_DSI_FMT_RGB888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return COLOR_CODE_24B=
IT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case SPRD_MIPI_DSI_FMT_DSC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return COLOR_CODE_COM=
PRESSTION;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Unsup=
ported format (%d)\n&quot;, fmt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return COLOR_CODE_24B=
IT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define ns_to_cycle(ns, byte_clk) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP((ns) * (byte_clk), 1000000)<br>
&gt; +<br>
&gt; +static void sprd_dsi_init(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 data_hs2lp, data_lp2hs, clk_hs2lp, clk_lp2hs;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 max_rd_time;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int div;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_power_enable(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_int0_mask(ctx, 0xffffffff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_int1_mask(ctx, 0xffffffff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_cmd_mode(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_eotp_rx_en(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_eotp_tx_en(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_ecc_rx_en(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_crc_rx_en(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_bta_en(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_video_vcid(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_rx_vcid(ctx, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0div =3D DIV_ROUND_UP(ctx-&gt;byte_clk, ctx-&gt;es=
c_clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_tx_escape_division(ctx, div);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0max_rd_time =3D ns_to_cycle(ctx-&gt;max_rd_time, =
ctx-&gt;byte_clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_max_read_time(ctx, max_rd_time);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0data_hs2lp =3D ns_to_cycle(ctx-&gt;data_hs2lp, ct=
x-&gt;byte_clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0data_lp2hs =3D ns_to_cycle(ctx-&gt;data_lp2hs, ct=
x-&gt;byte_clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_hs2lp =3D ns_to_cycle(ctx-&gt;clk_hs2lp, ctx-=
&gt;byte_clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_lp2hs =3D ns_to_cycle(ctx-&gt;clk_lp2hs, ctx-=
&gt;byte_clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_datalane_hs2lp_config(ctx, data_hs2lp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_datalane_lp2hs_config(ctx, data_lp2hs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_clklane_hs2lp_config(ctx, clk_hs2lp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_clklane_lp2hs_config(ctx, clk_lp2hs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_power_enable(ctx, 1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Free up resources and shutdown host controller and PHY<br>
&gt; + */<br>
&gt; +static void sprd_dsi_fini(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_int0_mask(ctx, 0xffffffff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_int1_mask(ctx, 0xffffffff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_power_enable(ctx, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * If not in burst mode, it will compute the video and null packet si=
zes<br>
&gt; + * according to necessity.<br>
&gt; + * Configure timers for data lanes and/or clock lane to return to LP =
when<br>
&gt; + * bandwidth is not filled by data.<br>
&gt; + */<br>
&gt; +static int sprd_dsi_dpi_video(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D container_of(ctx, struct=
 sprd_dsi, ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct videomode *vm =3D &amp;ctx-&gt;vm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 Bpp_x100;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 video_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ratio_x1000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 null_pkt_size =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 video_size_step;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 hs_to;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 total_bytes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 bytes_per_chunk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 chunks =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 bytes_left =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 chunk_overhead;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const u8 pkt_header =3D 6;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 coding;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int div;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 hline;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0coding =3D fmt_to_coding(ctx-&gt;format);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0video_size =3D round_video_size(coding, vm-&gt;ha=
ctive);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D calc_bytes_per_pixel_x100(coding);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0video_size_step =3D calc_video_size_step(coding);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ratio_x1000 =3D ctx-&gt;byte_clk * 1000 / (vm-&gt=
;pixelclock / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hline =3D vm-&gt;hactive + vm-&gt;hsync_len + vm-=
&gt;hfront_porch +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm-&gt;hback_porch;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_power_enable(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_frame_ack_en(ctx, ctx-&gt;frame_ack_en);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_color_coding(ctx, coding);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_video_burst_mode(ctx, ctx-&gt;burst_mode)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_sig_delay(ctx, 95 * hline * ratio_x1000 /=
 100000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_hline_time(ctx, hline * ratio_x1000 / 100=
0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_hsync_time(ctx, vm-&gt;hsync_len * ratio_=
x1000 / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_hbp_time(ctx, vm-&gt;hback_porch * ratio_=
x1000 / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_vact(ctx, vm-&gt;vactive);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_vfp(ctx, vm-&gt;vfront_porch);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_vbp(ctx, vm-&gt;vback_porch);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_vsync(ctx, vm-&gt;vsync_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_hporch_lp_en(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_vporch_lp_en(ctx, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hs_to =3D (hline * vm-&gt;vactive) + (2 * Bpp_x10=
0) / 100;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (div =3D 0x80; (div &lt; hs_to) &amp;&amp; (d=
iv &gt; 2); div--) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((hs_to % div) =3D=
=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dsi_timeout_clock_division(ctx, div);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dsi_lp_rx_timeout(ctx, hs_to / div);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dsi_hs_tx_timeout(ctx, hs_to / div);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;burst_mode =3D=3D VIDEO_BURST_WITH_SY=
NC_PULSES) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_dpi_video_packet_=
size(ctx, video_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_dpi_null_packet_s=
ize(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_dpi_chunk_num(ctx=
, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* non burst transmis=
sion */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0null_pkt_size =3D 0;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* bytes to be sent -=
 first as one chunk */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes_per_chunk =3D v=
m-&gt;hactive * Bpp_x100 / 100 + pkt_header;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* hline total bytes =
from the DPI interface */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total_bytes =3D (vm-&=
gt;hactive + vm-&gt;hfront_porch) *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ratio_x1000 / ctx-&gt;lanes / 1000;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* check if the pixel=
s actually fit on the DSI link */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (total_bytes &lt; =
bytes_per_chunk) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(dsi-&gt;drm, &quot;current resolution can not be set\n&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunk_overhead =3D to=
tal_bytes - bytes_per_chunk;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* overhead higher th=
an 1 -&gt; enable multi packets */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (chunk_overhead &g=
t; 1) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* multi packets */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0for (video_size =3D video_size_step;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 video_size &lt; vm-&gt;hactive;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 video_size +=3D video_size_step) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vm-&gt;hactive * 1000 / video_size %=
 1000)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunks =3D vm-&gt;hactive / video_size;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes_per_chunk =3D Bpp_x100 * video_siz=
e / 100<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0+ pkt_header;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (total_bytes &gt;=3D (bytes_per_chunk=
 * chunks)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes_left =
=3D total_bytes -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes_per_chunk * chunks;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* prevent overflow (unsigned - unsigned) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (bytes_left &gt; (pkt_header * chunks)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0null_pkt_size =3D (bytes_left -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0pkt_header * chunks) / chunks;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* avoid register overflow */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (null_pkt_size &gt; 1023)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0null_pkt_siz=
e =3D 1023;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* single packet */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0chunks =3D 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* must be a multiple of 4 except 18 loosely */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0for (video_size =3D vm-&gt;hactive;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(video_size % video_size_step) !=3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 video_size++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_dpi_video_packet_=
size(ctx, video_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_dpi_null_packet_s=
ize(ctx, null_pkt_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_dpi_chunk_num(ctx=
, chunks);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_int0_mask(ctx, ctx-&gt;int0_mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_int1_mask(ctx, ctx-&gt;int1_mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_power_enable(ctx, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dsi_edpi_video(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const u32 fifo_depth =3D 1096;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const u32 word_length =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 hactive =3D ctx-&gt;vm.hactive;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 Bpp_x100;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 max_fifo_len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 coding;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0coding =3D fmt_to_coding(ctx-&gt;format);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Bpp_x100 =3D calc_bytes_per_pixel_x100(coding);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0max_fifo_len =3D word_length * fifo_depth * 100 /=
 Bpp_x100;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_power_enable(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dpi_color_coding(ctx, coding);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_tear_effect_ack_en(ctx, ctx-&gt;te_ack_en);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (max_fifo_len &gt; hactive)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_edpi_max_pkt_size=
(ctx, hactive);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_edpi_max_pkt_size=
(ctx, max_fifo_len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_int0_mask(ctx, ctx-&gt;int0_mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_int1_mask(ctx, ctx-&gt;int1_mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_power_enable(ctx, 1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Send a packet on the generic interface,<br>
&gt; + * this function has an active delay to wait for the buffer to clear.=
<br>
&gt; + * The delay is limited to:<br>
&gt; + * (param_length / 4) x DSIH_FIFO_ACTIVE_WAIT x register access time<=
br>
&gt; + * the controller restricts the sending of.<br>
&gt; + * <br>
&gt; + * This function will not be able to send Null and Blanking packets d=
ue to<br>
&gt; + * controller restriction<br>
&gt; + */<br>
&gt; +static int sprd_dsi_wr_pkt(struct dsi_context *ctx, u8 vc, u8 type,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const u8 *param, u16 len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D container_of(ctx, struct=
 sprd_dsi, ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 wc_lsbyte, wc_msbyte;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 payload;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i, j, ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (vc &gt; 3)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* 1st: for long packet, must config payload firs=
t */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dsi_wait_tx_payload_fifo_empty(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;tx payload fifo is not empty\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (len &gt; 2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0, j =3D 0=
; i &lt; len; i +=3D j) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0payload =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0for (j =3D 0; (j &lt; 4) &amp;&amp; ((j + i) &lt; (len)); j++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0payload |=3D param[i + j] &lt;&lt; (j * =
8);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dsi_set_packet_payload(ctx, payload);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wc_lsbyte =3D len &am=
p; 0xff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wc_msbyte =3D len &gt=
;&gt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wc_lsbyte =3D (len &g=
t; 0) ? param[0] : 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wc_msbyte =3D (len &g=
t; 1) ? param[1] : 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* 2nd: then set packet header */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dsi_wait_tx_cmd_fifo_empty(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;tx cmd fifo is not empty\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_set_packet_header(ctx, vc, type, wc_lsbyte, w=
c_msbyte);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Send READ packet to peripheral using the generic interface,<br>
&gt; + * this will force command mode and stop video mode (because of BTA).=
<br>
&gt; + * <br>
&gt; + * This function has an active delay to wait for the buffer to clear,=
<br>
&gt; + * the delay is limited to 2 x DSIH_FIFO_ACTIVE_WAIT<br>
&gt; + * (waiting for command buffer, and waiting for receiving)<br>
&gt; + * @note this function will enable BTA<br>
&gt; + */<br>
&gt; +static int sprd_dsi_rd_pkt(struct dsi_context *ctx, u8 vc, u8 type,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 msb_byte, u8 lsb_byte,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u8 *buffer, u8 bytes_to_read)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D container_of(ctx, struct=
 sprd_dsi, ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i, ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int count =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 temp;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (vc &gt; 3)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* 1st: send read command to peripheral */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!dsi_is_tx_cmd_fifo_empty(ctx))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIO;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_set_packet_header(ctx, vc, type, lsb_byte, ms=
b_byte);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* 2nd: wait peripheral response completed */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dsi_wait_rd_resp_completed(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;wait read response time out\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* 3rd: get data from rx payload fifo */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dsi_is_rx_payload_fifo_empty(ctx)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;rx payload fifo empty\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 100; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D dsi_get_rx_p=
ayload(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &lt; bytes_=
to_read)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0buffer[count++] =3D temp &amp; 0xff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &lt; bytes_=
to_read)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0buffer[count++] =3D (temp &gt;&gt; 8) &amp; 0xff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &lt; bytes_=
to_read)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0buffer[count++] =3D (temp &gt;&gt; 16) &amp; 0xff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &lt; bytes_=
to_read)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0buffer[count++] =3D (temp &gt;&gt; 24) &amp; 0xff;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi_is_rx_payload=
_fifo_empty(ctx))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(dsi-&gt;drm, &quot;read too many buffers\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EIO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dsi_set_work_mode(struct dsi_context *ctx, u8 mode)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mode =3D=3D DSI_MODE_CMD)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_cmd_mode(ctx);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_video_mode(ctx);<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dsi_lp_cmd_enable(struct dsi_context *ctx, bool enab=
le)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dsi_is_cmd_mode(ctx))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_cmd_mode_lp_cmd_e=
n(ctx, enable);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_video_mode_lp_cmd=
_en(ctx, enable);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dsi_state_reset(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_power_enable(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0udelay(100);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_power_enable(ctx, 1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 sprd_dsi_int_status(struct dsi_context *ctx, int index)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D container_of(ctx, struct=
 sprd_dsi, ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (0 =3D=3D index)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D dsi_int0_s=
tatus(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (1 =3D=3D index)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D dsi_int1_s=
tatus(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;invalid dsi IRQ index %d\n&quot;, index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D -EINVAL;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dphy_init(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D container_of(ctx, struct=
 sprd_dsi, ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_rstz(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_shutdownz(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_clklane_en(ctx, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_clr(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_clr(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_test_clr(ctx, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dphy_pll_config(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dphy_timing_config(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_shutdownz(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_rstz(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_stop_wait_time(ctx, 0x1C);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_clklane_en(ctx, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_datalane_en(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dphy_wait_pll_locked(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;dphy initial failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dphy_fini(struct dsi_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_rstz(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_shutdownz(ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_phy_rstz(ctx, 1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dsi_encoder_enable(struct drm_encoder *encoder)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(encoder-&gt=
;crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_context *ctx =3D &amp;dsi-&gt;ctx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_warn(dsi-&gt;drm,=
 &quot;dsi is initialized\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dsi_init(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;work_mode =3D=3D DSI_MODE_VIDEO)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_dsi_dpi_video(ct=
x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_dsi_edpi_video(c=
tx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dphy_init(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dsi_lp_cmd_enable(ctx, true);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dsi-&gt;panel) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_panel_prepare(dsi=
-&gt;panel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_panel_enable(dsi-=
&gt;panel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dsi_set_work_mode(ctx, ctx-&gt;work_mode);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dsi_state_reset(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;nc_clk_en)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_nc_clk_en(ctx, tr=
ue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi_phy_clk_hs_rqst(c=
tx, true);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dphy_wait_pll_locked(=
ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpu_run(dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;enabled =3D true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dsi_encoder_disable(struct drm_encoder *encoder)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(encoder-&gt=
;crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_context *ctx =3D &amp;dsi-&gt;ctx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_warn(dsi-&gt;drm,=
 &quot;dsi isn&#39;t initialized\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpu_stop(dpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dsi_set_work_mode(ctx, DSI_MODE_CMD);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dsi_lp_cmd_enable(ctx, true);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dsi-&gt;panel) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_panel_disable(dsi=
-&gt;panel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_panel_unprepare(d=
si-&gt;panel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dphy_fini(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dsi_fini(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;enabled =3D false;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dsi_encoder_mode_set(struct drm_encoder *encoder,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_display_mode *mode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_display_mode *adj_mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg(dsi-&gt;drm, &quot;%s() set mode: %s\n&qu=
ot;, __func__, dsi-&gt;mode-&gt;name);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dsi_encoder_atomic_check(struct drm_encoder *encoder,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc_state *crt=
c_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector_state=
 *conn_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_encoder_helper_funcs sprd_encoder_helper_func=
s =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_check=C2=A0 =C2=A0=3D sprd_dsi_encoder_at=
omic_check,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode_set=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D sprd_dsi_=
encoder_mode_set,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.enable=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D sprd=
_dsi_encoder_enable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.disable=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sprd_dsi_=
encoder_disable<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct drm_encoder_funcs sprd_encoder_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.destroy =3D drm_encoder_cleanup,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dsi_encoder_init(struct drm_device *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sprd_dsi *dsi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_encoder *encoder =3D &amp;dsi-&gt;enco=
der;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D dsi-&gt;<a href=3D"http://=
host.dev" rel=3D"noreferrer" target=3D"_blank">host.dev</a>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 crtc_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0crtc_mask =3D drm_of_find_possible_crtcs(drm, dev=
-&gt;of_node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!crtc_mask) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to find crtc mask\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg(dsi-&gt;drm, &quot;find possible crtcs: 0=
x%08x\n&quot;, crtc_mask);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0encoder-&gt;possible_crtcs =3D crtc_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_encoder_init(drm, encoder, &amp;sprd_=
encoder_funcs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_MODE_ENCODER_DSI, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to init dsi encoder\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_encoder_helper_add(encoder, &amp;sprd_encoder=
_helper_funcs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dsi_find_panel(struct sprd_dsi *dsi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D dsi-&gt;<a href=3D"http://=
host.dev" rel=3D"noreferrer" target=3D"_blank">host.dev</a>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *child, *lcds_node;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel *panel;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* search /lcds child node first */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lcds_node =3D of_find_node_by_path(&quot;/lcds&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for_each_child_of_node(lcds_node, child) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panel =3D of_drm_find=
_panel(child);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_ERR(panel)) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dsi-&gt;panel =3D panel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If /lcds child node search failed, we search<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 * the child of dsi host node.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for_each_child_of_node(dev-&gt;of_node, child) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panel =3D of_drm_find=
_panel(child);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_ERR(panel)) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dsi-&gt;panel =3D panel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, &quot;of_drm_find_panel() fa=
iled\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dsi_host_attach(struct mipi_dsi_host *host,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 struct mipi_dsi_device *slave)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D host_to_dsi(host);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_context *ctx =3D &amp;dsi-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;slave =3D slave;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;lanes =3D slave-&gt;lanes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;format =3D slave-&gt;format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;byte_clk =3D slave-&gt;hs_rate / 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;esc_clk =3D slave-&gt;lp_rate;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (slave-&gt;mode_flags &amp; MIPI_DSI_MODE_VIDE=
O)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;work_mode =3D=
 DSI_MODE_VIDEO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;work_mode =3D=
 DSI_MODE_CMD;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (slave-&gt;mode_flags &amp; MIPI_DSI_MODE_VIDE=
O_BURST)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;burst_mode =
=3D VIDEO_BURST_WITH_SYNC_PULSES;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (slave-&gt;mode_flags &amp; MIPI_DSI_MODE=
_VIDEO_SYNC_PULSE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;burst_mode =
=3D VIDEO_NON_BURST_WITH_SYNC_PULSES;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;burst_mode =
=3D VIDEO_NON_BURST_WITH_SYNC_EVENTS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (slave-&gt;mode_flags &amp; MIPI_DSI_CLOCK_NON=
_CONTINUOUS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;nc_clk_en =3D=
 true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D sprd_dsi_find_panel(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dsi_host_detach(struct mipi_dsi_host *host,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 struct mipi_dsi_device *slave)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* do nothing */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t sprd_dsi_host_transfer(struct mipi_dsi_host *host,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct mipi_dsi_msg *msg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D host_to_dsi(host);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const u8 *tx_buf =3D msg-&gt;tx_buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (msg-&gt;rx_buf &amp;&amp; msg-&gt;rx_len) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 lsb =3D (msg-&gt;t=
x_len &gt; 0) ? tx_buf[0] : 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 msb =3D (msg-&gt;t=
x_len &gt; 1) ? tx_buf[1] : 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sprd_dsi_rd_pk=
t(&amp;dsi-&gt;ctx, msg-&gt;channel, msg-&gt;type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msb, lsb, msg-&gt;rx_buf, msg-&gt;rx_len=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (msg-&gt;tx_buf &amp;&amp; msg-&gt;tx_len)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sprd_dsi_wr_pk=
t(&amp;dsi-&gt;ctx, msg-&gt;channel, msg-&gt;type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tx_buf, msg-=
&gt;tx_len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct mipi_dsi_host_ops sprd_dsi_host_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.attach =3D sprd_dsi_host_attach,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.detach =3D sprd_dsi_host_detach,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.transfer =3D sprd_dsi_host_transfer,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dsi_host_init(struct sprd_dsi *dsi, struct device *de=
v)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;<a href=3D"http://host.dev" rel=3D"norefe=
rrer" target=3D"_blank">host.dev</a> =3D dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;host.ops =3D &amp;sprd_dsi_host_ops;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_host_register(&amp;dsi-&gt;host)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;failed to register dsi host\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dsi_connector_get_modes(struct drm_connector *connect=
or)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D connector_to_dsi(connect=
or);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return drm_panel_get_modes(dsi-&gt;panel, connect=
or);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static enum drm_mode_status<br>
&gt; +sprd_dsi_connector_mode_valid(struct drm_connector *connector,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 struct drm_display_mode *mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D connector_to_dsi(connect=
or);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg(dsi-&gt;drm, &quot;%s() mode: &quot;DRM_M=
ODE_FMT&quot;\n&quot;, __func__, DRM_MODE_ARG(mode));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mode-&gt;type &amp; DRM_MODE_TYPE_PREFERRED) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;mode =3D mode=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_display_mode_to_v=
ideomode(dsi-&gt;mode, &amp;dsi-&gt;ctx.vm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct drm_encoder *<br>
&gt; +sprd_dsi_connector_best_encoder(struct drm_connector *connector)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D connector_to_dsi(connect=
or);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &amp;dsi-&gt;encoder;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct drm_connector_helper_funcs sprd_dsi_connector_helper_fu=
ncs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_modes =3D sprd_dsi_connector_get_modes,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode_valid =3D sprd_dsi_connector_mode_valid,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0.best_encoder =3D sprd_dsi_connector_best_encoder=
,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static enum drm_connector_status<br>
&gt; +sprd_dsi_connector_detect(struct drm_connector *connector, bool force=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D connector_to_dsi(connect=
or);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dsi-&gt;panel) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_panel_add(dsi-&gt=
;panel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return connector_stat=
us_connected;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return connector_status_disconnected;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dsi_connector_destroy(struct drm_connector *connecto=
r)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_connector_unregister(connector);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_connector_cleanup(connector);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_connector_funcs sprd_dsi_atomic_connector_fun=
cs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.fill_modes =3D drm_helper_probe_single_connector=
_modes,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.detect =3D sprd_dsi_connector_detect,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.destroy =3D sprd_dsi_connector_destroy,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reset =3D drm_atomic_helper_connector_reset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_atomic_helper_con=
nector_duplicate_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_destroy_state =3D drm_atomic_helper_conne=
ctor_destroy_state,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dsi_connector_init(struct drm_device *drm, struct spr=
d_dsi *dsi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_encoder *encoder =3D &amp;dsi-&gt;enco=
der;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_connector *connector =3D &amp;dsi-&gt;=
connector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0connector-&gt;polled =3D DRM_CONNECTOR_POLL_HPD;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_connector_init(drm, connector,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sprd_dsi_atomic_connector_funcs,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_MODE_CONNECTOR_DSI);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;dr=
m_connector_init() failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_connector_helper_add(connector,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sprd_dsi_connector_helper_funcs);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_connector_attach_encoder(connector, encoder);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static irqreturn_t sprd_dsi_isr(int irq, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 status =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dsi-&gt;ctx.irq0 =3D=3D irq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D sprd_dsi_i=
nt_status(&amp;dsi-&gt;ctx, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (dsi-&gt;ctx.irq1 =3D=3D irq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D sprd_dsi_i=
nt_status(&amp;dsi-&gt;ctx, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (status &amp; DSI_INT_STS_NEED_SOFT_RESET)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_dsi_state_reset(=
&amp;dsi-&gt;ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dsi_bind(struct device *dev, struct device *master, v=
oid *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D dev_get_drvdata(dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D sprd_dsi_encoder_init(drm, dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup_host;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D sprd_dsi_connector_init(drm, dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup_encoder;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;drm =3D drm;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +cleanup_encoder:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_encoder_cleanup(&amp;dsi-&gt;encoder);<br>
&gt; +cleanup_host:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_host_unregister(&amp;dsi-&gt;host);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dsi_unbind(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0struct device *master, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* do nothing */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg(drm, &quot;%s()\n&quot;, __func__);<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct component_ops dsi_component_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bind=C2=A0 =C2=A0=3D sprd_dsi_bind,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_dsi_unbind,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dsi_context_init(struct sprd_dsi *dsi,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_devi=
ce(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_context *ctx =3D &amp;dsi-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;base =3D devm_ioremap(dev, res-&gt;start,=
 resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;base) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;failed to map dsi host registers\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;pll =3D devm_kzalloc(dev, sizeof(*ctx-&gt=
;pll), GFP_KERNEL);<br>
<br>
You probably want to use drmm_kzalloc here, just to be on the safe side.<br=
>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;pll) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;failed to allocate dphy pll data.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;regmap =3D devm_regmap_init(dev, &amp;reg=
map_tst_io, dsi, &amp;byte_config);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ctx-&gt;regmap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dsi-&gt;drm, =
&quot;dphy regmap init failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ctx-&g=
t;regmap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;irq0 =3D platform_get_irq(pdev, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;irq0 &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D request_irq(c=
tx-&gt;irq0, sprd_dsi_isr, 0, &quot;DSI_INT0&quot;, dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(dsi-&gt;drm, &quot;failed to request dsi irq int0!\n&quot;);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;irq1 =3D platform_get_irq(pdev, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;irq1 &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D request_irq(c=
tx-&gt;irq1, sprd_dsi_isr, 0, &quot;DSI_INT1&quot;, dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(dsi-&gt;drm, &quot;failed to request dsi irq int1!\n&quot;);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;data_hs2lp =3D 120;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;data_lp2hs =3D 500;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;clk_hs2lp =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;clk_lp2hs =3D 15;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;max_rd_time =3D 6000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;int0_mask =3D 0xffffffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;int1_mask =3D 0xffffffff;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;ctx.enabled =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id dsi_match_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sprd,sharkl3-dsi-host&quo=
t; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ /* sentinel */ },<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dsi_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi =3D kzalloc(sizeof(*dsi), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!dsi) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to allocate dsi data.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;dev =3D &amp;pdev-&gt;dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D sprd_dsi_context_init(dsi, &amp;pdev-&gt;=
dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D sprd_dsi_host_init(dsi, &amp;pdev-&gt;dev=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
<br>
Same comment as with the previous patch for planes/crtc: If you move this<b=
r>
into the bind function then you can use the drmm_ functions and ditch the<b=
r>
kfree.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, dsi);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return component_add(&amp;pdev-&gt;dev, &amp;dsi_=
component_ops);<br>
&gt; +<br>
&gt; +err:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dsi_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dsi *dsi =3D platform_get_drvdata(pde=
v);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_del(&amp;pdev-&gt;dev, &amp;dsi_compone=
nt_ops);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct platform_driver sprd_dsi_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D sprd_dsi_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D sprd_dsi_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;sprd-=
dsi-drv&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D d=
si_match_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Leon He &lt;<a href=3D"mailto:leon.he@unisoc.com"=
 target=3D"_blank">leon.he@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Kevin Tang &lt;<a href=3D"mailto:kevin.tang@uniso=
c.com" target=3D"_blank">kevin.tang@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;Unisoc MIPI DSI HOST Controller Driver&quot;=
);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_dsi.h b/drivers/gpu/drm/sprd/sp=
rd_dsi.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e07cd12<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dsi.h<br>
&gt; @@ -0,0 +1,107 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __SPRD_DSI_H__<br>
&gt; +#define __SPRD_DSI_H__<br>
&gt; +<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;video/videomode.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_bridge.h&gt;<br>
&gt; +#include &lt;drm/drm_connector.h&gt;<br>
&gt; +#include &lt;drm/drm_encoder.h&gt;<br>
&gt; +#include &lt;drm/drm_mipi_dsi.h&gt;<br>
&gt; +#include &lt;drm/drm_print.h&gt;<br>
&gt; +#include &lt;drm/drm_panel.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;megacores_pll.h&quot;<br>
&gt; +<br>
&gt; +#define DSI_INT_STS_NEED_SOFT_RESET=C2=A0 BIT(0)<br>
&gt; +#define DSI_INT_STS_NEED_HARD_RESET=C2=A0 BIT(1)<br>
&gt; +<br>
&gt; +enum dsi_work_mode {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DSI_MODE_CMD =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DSI_MODE_VIDEO<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum video_burst_mode {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0VIDEO_NON_BURST_WITH_SYNC_PULSES =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0VIDEO_NON_BURST_WITH_SYNC_EVENTS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0VIDEO_BURST_WITH_SYNC_PULSES<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum dsi_color_coding {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_16BIT_CONFIG1 =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_16BIT_CONFIG2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_16BIT_CONFIG3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_18BIT_CONFIG1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_18BIT_CONFIG2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_24BIT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_20BIT_YCC422_LOOSELY,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_24BIT_YCC422,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_16BIT_YCC422,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_30BIT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_36BIT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_12BIT_YCC420,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_COMPRESSTION,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COLOR_CODE_MAX<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct dsi_context {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dphy_pll *pll;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct videomode vm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool enabled;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 lanes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 work_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 burst_mode;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int irq0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int irq1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 int0_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 int1_mask;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* byte clock [KHz] */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 byte_clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* escape clock [KHz] */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 esc_clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* maximum time (ns) for data lanes from HS to LP=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 data_hs2lp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* maximum time (ns) for data lanes from LP to HS=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 data_lp2hs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* maximum time (ns) for clk lanes from HS to LP =
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 clk_hs2lp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* maximum time (ns) for clk lanes from LP to HS =
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 clk_lp2hs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* maximum time (ns) for BTA operation - REQUIRED=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 max_rd_time;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* is 18-bit loosely packets (valid only when BPP=
 =3D=3D 18) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool is_18_loosely;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable receiving frame ack packets - for video=
 mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool frame_ack_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable receiving tear effect ack packets - for=
 cmd mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool te_ack_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable non coninuous clock for energy saving *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool nc_clk_en;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_dsi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_host host;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *slave;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_encoder encoder;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_connector connector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel *panel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_display_mode *mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dsi_context ctx;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#endif /* __SPRD_DSI_H__ */<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--0000000000005343f805bb0bc869--

--===============0260517868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0260517868==--
