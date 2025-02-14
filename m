Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444FA35CCF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 12:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B492510EC57;
	Fri, 14 Feb 2025 11:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ULUsCPSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B1810EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 11:46:44 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5450408455dso2171321e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 03:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739533602; x=1740138402; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tMLuBmCSJLZsj1HETCkPpxcy06Evu6XcQE7Hc3tnAWQ=;
 b=ULUsCPSupEK3p3lNJxyUkJNdRwOXJKBxbprhBNTeCw6JcKpH+Wln+CfGZDHDfoAYC8
 mdrTcimXvGwX0yXYwuVD9abs4pqUa4PYG5L2BxlG5MA7b+nmU+C0RrMKNS6xm3poNBt4
 WdtEMjzJS62kQdx3zLezCxkVkbv9uh6FXJMDUo9sk/ZpgJa4RerM6T0g0585lTCaNvam
 eOpC6S1fiYzQrI7AVxd1MxiFKkU8683c90uJt6x+fYYcVXi7AOkgUNN+7rwyH8Gn8UNK
 pKpzLxuVjCsCHV7ofvypVwcT7+SafFL36Bt6AruoYNM0giZSaT2gGiy7oKWA2aRV/dFy
 MS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739533602; x=1740138402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMLuBmCSJLZsj1HETCkPpxcy06Evu6XcQE7Hc3tnAWQ=;
 b=TRw3X7r1C8wUiexfmR31C7/RG97YBSU5Z1sqpfPJNJ03c8seTx335JEifCTAxsbT06
 OQrG23USgJQRvI8ojcg03M5P/EpND3PggJwCOnfz8qzGbJ+TS+wk1J8oMSSiGyadlp/p
 eZqjYh/XRY3E+CVG4UtWDlGH2YCVNhOtFxGGec+05WDVREf+0QUL8l1hf3nD0kAkmwFg
 Qpjj1PNMvDjIltNWZ2z87Lz39mU+I2OLJEm+2r0nSL/dF5f5H/VUYhMalSfcwy2zHlhb
 oJjAlFAK9blHNF2JUGmDnYL77Weq/Eqa5aOxZnT/8ao6ZcFgUeTCO7R2amWpEWYm+jGC
 Iojg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWljQ3OIqenvjEj3Pa5a9HLmgFrwK25P3d4ZOp++BgTZbO4IcgYQ6jDR+clpXU7PEqdGfHn7E0Rch4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0vSFOZNJ8g+0q22E1m4MS54X5ExBUBgHv5Xjx4IIyjT4/iB5m
 3+bmk1TJJDo/xqJ35YjoPHLbjQ+Z38B1yTjDlBmlBfcKuzwiOb741MpbRkvnNmc=
X-Gm-Gg: ASbGncsbJFWYSYRaVI5nGscQRSjK7FTLv3MQ81vWCVDcPWemWzXGGLfXOFdvXieDpeA
 wnSU+JQEk6cTgA09tCbjorz2+dS14zdHfXOxQp6e55mY/YCYfJvTTrdktFxqf+acofMw/O5Et2t
 68nMzYAENJ3LWlD5lxiB/iIwjPLlgRzccrjGK/TPFv8nDBBFVwBKqNeAoUr+IjNgYpdnwAn5LCD
 D5G843+osfvp217tDowVTenX1zgq5SKV8VayxTq6U4Q1l0DxhrseM1LZNpc1hbbQPEDLMKBzjzg
 Etdjk+BxNH64JGdEX2DKGODbPrS42idLhXzuz2gDFv4TPKecM7pOLeBFk5MNFtQJ5zmh2RA=
X-Google-Smtp-Source: AGHT+IGIP5YoApX25EWhEEikIPp8U+9yZf6Pcs7QBNhAtN1dvRKk29O6US3AM0nigIpfNUnTF8c9Pw==
X-Received: by 2002:a05:6512:2244:b0:545:ff1:bcd4 with SMTP id
 2adb3069b0e04-5451dd8900dmr2708834e87.3.1739533602319; 
 Fri, 14 Feb 2025 03:46:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f11ecabsm487425e87.227.2025.02.14.03.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:46:40 -0800 (PST)
Date: Fri, 14 Feb 2025 13:46:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>, 
 "treapking@google.com" <treapking@google.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge:anx7625: Enable DSC feature
Message-ID: <steyswtd6ll6bnolzes2l2k5hyg7e2ycc5bcsgrdt7zzzvpuwk@d6c5i5dbzb4j>
References: <20250213123331.3016824-1-xji@analogixsemi.com>
 <oi3q3xvwcdwps6vhjxubipl7oci5h74ovp4mkhzgcu6gla3zjt@m6yndg7rmp2i>
 <BY5PR04MB6739140435C1CA211419026CC7FE2@BY5PR04MB6739.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR04MB6739140435C1CA211419026CC7FE2@BY5PR04MB6739.namprd04.prod.outlook.com>
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

On Fri, Feb 14, 2025 at 11:20:01AM +0000, Xin Ji wrote:
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Thursday, February 13, 2025 9:04 PM
> > To: Xin Ji <xji@analogixsemi.com>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart
> > <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>;
> > Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Bernie Liang
> > <bliang@analogixsemi.com>; Qilin Wen <qwen@analogixsemi.com>;
> > treapking@google.com; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH] drm/bridge:anx7625: Enable DSC feature

PLease remove such splats, use something more sensible.

> > 
> > 
> > On Thu, Feb 13, 2025 at 08:33:30PM +0800, Xin Ji wrote:
> > > As anx7625 MIPI RX bandwidth(maximum 1.5Gbps per lane) and internal
> > > pixel clock(maximum 300M) limitation. Anx7625 must enable DSC feature
> > > while MIPI source want to output 4K30 resolution.
> > 
> > This commit message is pretty hard to read and understand for a non-native
> > speaker. Please consider rewriting it so that it is easier to understand it.
> > 
> Thanks for the review, sorry about that, I'll rewriting the commit message
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 300
> > > ++++++++++++++++++----  drivers/gpu/drm/bridge/analogix/anx7625.h |
> > > 32 +++
> > >  2 files changed, 284 insertions(+), 48 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 4be34d5c7a3b..7d86ab02f71c 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -22,6 +22,7 @@
> > >
> > >  #include <drm/display/drm_dp_aux_bus.h>  #include
> > > <drm/display/drm_dp_helper.h>
> > > +#include <drm/display/drm_dsc_helper.h>
> > >  #include <drm/display/drm_hdcp_helper.h>  #include
> > > <drm/drm_atomic_helper.h>  #include <drm/drm_bridge.h> @@ -476,6
> > > +477,138 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
> > >                                MIPI_DIGITAL_ADJ_1, 0x3D);  }
> > >
> > > +static int anx7625_set_dsc_params(struct anx7625_data *ctx) {
> > > +     int ret, i;
> > > +     u16 htotal, vtotal;
> > > +
> > > +     if (!ctx->dsc_en)
> > > +             return 0;
> > > +
> > > +     /* Htotal */
> > > +     htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > +             ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > > +     ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                             HORIZONTAL_TOTAL_PIXELS_L, htotal);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
> > > +     /* Hactive */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              HORIZONTAL_ACTIVE_PIXELS_L,
> > > +                              ctx->dt.hactive.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              HORIZONTAL_ACTIVE_PIXELS_H,
> > > +                              ctx->dt.hactive.min >> 8);
> > > +     /* HFP */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              HORIZONTAL_FRONT_PORCH_L,
> > > +                              ctx->dt.hfront_porch.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              HORIZONTAL_FRONT_PORCH_H,
> > > +                              ctx->dt.hfront_porch.min >> 8);
> > > +     /* HWS */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              HORIZONTAL_SYNC_WIDTH_L,
> > > +                              ctx->dt.hsync_len.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              HORIZONTAL_SYNC_WIDTH_H,
> > > +                              ctx->dt.hsync_len.min >> 8);
> > > +     /* HBP */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              HORIZONTAL_BACK_PORCH_L,
> > > +                              ctx->dt.hback_porch.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              HORIZONTAL_BACK_PORCH_H,
> > > +                              ctx->dt.hback_porch.min >> 8);
> > > +     /* Vtotal */
> > > +     vtotal = ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
> > > +              ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_L,
> > > +                              vtotal);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_H,
> > > +                              vtotal >> 8);
> > > +     /* Vactive */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, ACTIVE_LINES_L,
> > > +                              ctx->dt.vactive.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, ACTIVE_LINES_H,
> > > +                              ctx->dt.vactive.min >> 8);
> > > +     /* VFP */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.min);
> > > +     /* VWS */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min);
> > > +     /* VBP */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                              VERTICAL_BACK_PORCH,
> > > + ctx->dt.vback_porch.min);
> > 
> > This code mostly duplicates anx7625_dsi_video_timing_config() with the I2C
> > client being the only difference. Please consider extracting a common helper to
> > write the timings.
> It is hard to extracting a common helper, they are used different I2C slave address
> and timing register need divided by 3 if DSC enabled.

I2C client can be a parameter. Also please comment whether /3 is because
of bpp/bpc ratio or due to some other reason?

Does anx7625 support any mode other than 8bpp / 8bpc?

> > 
> > > +
> > > +     /* Htotal */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_L_7E,
> > > +                              htotal);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_H_7E,
> > > +                              htotal >> 8);
> > > +     /* Hactive */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              ACTIVE_PIXEL_L_7E, ctx->dt.hactive.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min >> 8);
> > > +     /* HFP */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_FRONT_PORCH_L_7E,
> > > +                              ctx->dt.hfront_porch.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_FRONT_PORCH_H_7E,
> > > +                              ctx->dt.hfront_porch.min >> 8);
> > > +     /* HWS */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_SYNC_WIDTH_L_7E,
> > > +                              ctx->dt.hsync_len.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_SYNC_WIDTH_H_7E,
> > > +                              ctx->dt.hsync_len.min >> 8);
> > > +     /* HBP */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_BACK_PORCH_L_7E,
> > > +                              ctx->dt.hback_porch.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_BACK_PORCH_H_7E,
> > > +                              ctx->dt.hback_porch.min >> 8);
> > > +
> > > +     /* Config DSC decoder internal blank timing for decoder to start */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > +                              H_BLANK_L,
> > > +                              dsc_div(htotal - ctx->dt.hactive.min));
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > +                              H_BLANK_H,
> > > +                              dsc_div(htotal - ctx->dt.hactive.min)
> > > + >> 8);
> > > +
> > > +     /* Compress ratio  RATIO bit[7:6] */
> > > +     ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2C_1, 0x3F);
> > > +     ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C_1,
> > > +                             (5 - DSC_COMPRESS_RATIO) << 6);
> > > +     /*PPS table*/
> > > +     for (i = 0; i < PPS_SIZE; i += PPS_BLOCK_SIZE)
> > > +             ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p2_client,
> > > +                                            R_PPS_REG_0 + i, PPS_BLOCK_SIZE,
> > > +                                            &ctx->pps_table[i]);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int anx7625_timing_write(struct anx7625_data *ctx,
> > > +                             struct i2c_client *client,
> > > +                             u8 reg_addr, u16 reg_val, bool
> > > +high_byte) {
> > > +     u8 reg_data;
> > > +
> > > +     if (ctx->dsc_en)
> > > +             reg_val = dsc_div(reg_val);
> > > +
> > > +     reg_data = (high_byte ? (reg_val >> 8) : reg_val) & 0xFF;
> > > +
> > > +     return anx7625_reg_write(ctx, client, reg_addr, reg_data); }
> > 
> > Ugh, no. Calculate htotal in the calling function and call
> > anx7625_reg_write() as you were doing that before.
> > 
> anx7625_timing_write() is a common function, it was called many times,
> so we cannot calculate htotal in it.

On the caller side. I'd suggest to inline anx7625_timing_write() to make
the code more explicit.

> 
> > > +
> > >  static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> > > {
> > >       struct device *dev = ctx->dev;
> > > @@ -506,34 +639,33 @@ static int anx7625_dsi_video_timing_config(struct
> > anx7625_data *ctx)
> > >       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > >                               MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes
> > > - 1);
> > >
> > > -     /* Htotal */
> > >       htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > -             ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
> > > +                      ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > > +     /* Htotal */
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_TOTAL_PIXELS_L, htotal, false);
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_TOTAL_PIXELS_H, htotal, true);
> > >       /* Hactive */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min & 0xFF);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min >> 8);
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min, false);
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min,
> > > + true);
> > >       /* HFP */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.min);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_FRONT_PORCH_H,
> > > -                     ctx->dt.hfront_porch.min >> 8);
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.min, false);
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_FRONT_PORCH_H,
> > > + ctx->dt.hfront_porch.min, true);
> > 
> > Are porches also compressed? I think blanking signal timings are transferred as is,
> > without compression.
> Porches not be compressed, anx7625 internal digital block will multiply by 3 while enable
> DSC feature, so the register must divided by 3.

Ack

> > 
> > >       /* HWS */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min >> 8);
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min, false);
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min,
> > > + true);
> > >       /* HBP */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.min >> 8);
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min, false);
> > > +     ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > +                     HORIZONTAL_BACK_PORCH_H,
> > > + ctx->dt.hback_porch.min, true);
> > >       /* Vactive */
> > >       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_L,
> > >                       ctx->dt.vactive.min); @@ -663,9 +795,15 @@
> > > static int anx7625_dsi_config(struct anx7625_data *ctx)
> > >
> > >       DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
> > >
> > > -     /* DSC disable */
> > > -     ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > -                             R_DSC_CTRL_0, ~DSC_EN);
> > > +     ret = anx7625_set_dsc_params(ctx);
> > > +     if (ctx->dsc_en)
> > > +             /* DSC enable */
> > > +             ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > +                                     R_DSC_CTRL_0, DSC_EN);
> > > +     else
> > > +             /* DSC disable */
> > > +             ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > +                                      R_DSC_CTRL_0, ~DSC_EN);
> > >
> > >       ret |= anx7625_api_dsi_config(ctx);
> > >
> > > @@ -2083,6 +2221,7 @@ static int anx7625_setup_dsi_device(struct
> > anx7625_data *ctx)
> > >               MIPI_DSI_MODE_VIDEO_HSE |
> > >               MIPI_DSI_HS_PKT_END_ALIGNED;
> > >
> > > +     dsi->dsc = &ctx->dsc;
> > >       ctx->dsi = dsi;
> > >
> > >       return 0;
> > > @@ -2186,20 +2325,68 @@ anx7625_bridge_mode_valid(struct drm_bridge
> > *bridge,
> > >       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > >       struct device *dev = ctx->dev;
> > >
> > > -     DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
> > > +     dev_dbg(dev, "drm mode checking\n");
> > > +     if (mode->clock > SUPPORT_PIXEL_CLOCK)
> > > +             return MODE_CLOCK_HIGH;
> > > +
> > > +     if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
> > > +             return MODE_CLOCK_LOW;
> > >
> > > -     /* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
> > > -     if (mode->clock > SUPPORT_PIXEL_CLOCK) {
> > > -             DRM_DEV_DEBUG_DRIVER(dev,
> > > -                                  "drm mode invalid, pixelclock too high.\n");
> > > +     if (mode->clock > DSC_PIXEL_CLOCK && (mode->hdisplay % 3 != 0))
> > 
> > Magic number 3. Also is it actually required? I think DSC standard has no such
> > requirement.
> This is anx7625 limitation, if mode->hdisplay cannot be divided by 3, then display will have
> overlap/shift issue.

Ack, add a comment or extend a commit message please.

> > 
> > >               return MODE_CLOCK_HIGH;
> > > -     }
> > >
> > > -     DRM_DEV_DEBUG_DRIVER(dev, "drm mode valid.\n");
> > > +     dev_dbg(dev, "drm mode valid.\n");
> > >
> > >       return MODE_OK;
> > >  }
> > >
> > > +static void anx7625_dsc_enable(struct anx7625_data *ctx, bool en) {
> > > +     int ret;
> > > +     struct device *dev = ctx->dev;
> > > +
> > > +     ctx->dsc_en = en;
> > > +
> > > +     if (en) {
> > > +             ctx->dsc.dsc_version_major = 1;
> > > +             ctx->dsc.dsc_version_minor = 1;
> > > +             ctx->dsc.slice_height = 8;
> > > +             ctx->dsc.slice_width = ctx->dt.hactive.min / DSC_SLICE_NUM;
> > > +             ctx->dsc.slice_count = DSC_SLICE_NUM;
> > > +             ctx->dsc.bits_per_component = 8;
> > > +             ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
> > > +             ctx->dsc.block_pred_enable = true;
> > > +             ctx->dsc.native_420 = false;
> > > +             ctx->dsc.native_422 = false;
> > > +             ctx->dsc.simple_422 = false;
> > > +             ctx->dsc.vbr_enable = false;
> > > +             ctx->dsc.rc_model_size = DSC_RC_MODEL_SIZE_CONST;

This one is default, please drop.

> > > +             ctx->dsc.pic_width = ctx->dt.hactive.min;
> > > +             ctx->dsc.pic_height = ctx->dt.vactive.min;

These two are set on the DSC encoder side.

> > > +             ctx->dsc.convert_rgb = 1;
> > > +             ctx->dsc.vbr_enable = 0;
> > 
> > A lot of this params should be coming from the sink device. You have to get
> > them from the DPCD.
> These parameter is just MIPI source and anx7625 and used only for DSC feature,
> Anx7625 is bridge IC, sink monitor only receive normal DP signal from anx7625,
> sink device didn't know DSC information, no need read DPCD.

Thanks. From you commit message it is impossible to understand whether
DSC happens between the host and your bridge or between the bridge and
the monitor.

> > 
> > > +
> > > +             drm_dsc_set_rc_buf_thresh(&ctx->dsc);
> > > +             drm_dsc_set_const_params(&ctx->dsc);
> > > +
> > > +             ctx->dsc.initial_scale_value = drm_dsc_initial_scale_value(&ctx->dsc);
> > > +             ctx->dsc.line_buf_depth = ctx->dsc.bits_per_component + 1;
> > > +             ret = drm_dsc_setup_rc_params(&ctx->dsc, DRM_DSC_1_2_444);
> > > +             if (ret < 0)
> > > +                     dev_warn(dev, "drm_dsc_setup_rc_params ret
> > > + %d\n", ret);
> > > +
> > > +             drm_dsc_compute_rc_parameters(&ctx->dsc);
> > 
> > You have ignored return value. Please handle the function returning an error.
> OK

All these functions are to be called on the DSC encoder side as it has
to be able to infer DSC params.

> > 
> > > +
> > > +             drm_dsc_pps_payload_pack((struct drm_dsc_picture_parameter_set
> > *)&ctx->pps_table,
> > > +                                      &ctx->dsc);
> > > +             dev_dbg(dev, "anx7625 enable dsc\n");
> > > +     } else {
> > > +             ctx->dsc.dsc_version_major = 0;
> > > +             ctx->dsc.dsc_version_minor = 0;
> > > +             dev_dbg(dev, "anx7625 disable dsc\n");
> > > +     }
> > > +}
> > > +
> > >  static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
> > >                                   const struct drm_display_mode *old_mode,
> > >                                   const struct drm_display_mode *mode)
> > > @@ -2244,6 +2431,11 @@ static void anx7625_bridge_mode_set(struct
> > drm_bridge *bridge,
> > >       DRM_DEV_DEBUG_DRIVER(dev, "vsync_end(%d),vtotal(%d).\n",
> > >                            mode->vsync_end,
> > >                            mode->vtotal);
> > > +
> > > +     if (mode->clock > DSC_PIXEL_CLOCK)
> > 
> > What if the sink doesn't support DSC? The decision whether to enable DSC or not
> > should be happening in the atomic_check(). Likewise mode_valid should be able
> > to check if your bridge and the sink can agree on DSC params and reject modes if
> > they can not.
> Anx7625 is bridge IC, it receive MIPI data and DP output, DSC only exist between SOC
> and Anx7625, sink monitor only receive normal DP signal from anx7625,
> there is no compression at DP output, so no need to check sink device.

Well. Then the same question applies in the other direction: what if the
host doesnt' support DSC?

> > 
> > > +             anx7625_dsc_enable(ctx, true);
> > > +     else
> > > +             anx7625_dsc_enable(ctx, false);
> > >  }
> > >
> > >  static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge, @@
> > > -2258,26 +2450,33 @@ static bool anx7625_bridge_mode_fixup(struct
> > > drm_bridge *bridge,
> > >
> > >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> > >
> > > -     /* No need fixup for external monitor */
> > > -     if (!ctx->pdata.panel_bridge)
> > > -             return true;
> > > -
> > >       hsync = mode->hsync_end - mode->hsync_start;
> > >       hfp = mode->hsync_start - mode->hdisplay;
> > >       hbp = mode->htotal - mode->hsync_end;
> > >       hblanking = mode->htotal - mode->hdisplay;
> > >
> > > -     DRM_DEV_DEBUG_DRIVER(dev, "before mode fixup\n");
> > > -     DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d),
> > clock(%d)\n",
> > > -                          hsync, hfp, hbp, adj->clock);
> > > -     DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d),
> > htot(%d)\n",
> > > -                          adj->hsync_start, adj->hsync_end, adj->htotal);
> > > -
> > > +     dev_dbg(dev, "before mode fixup\n");
> > > +     dev_dbg(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
> > > +             hsync, hfp, hbp, adj->clock);
> > > +     dev_dbg(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
> > > +             adj->hsync_start, adj->hsync_end, adj->htotal);
> > 
> > No. Please use drm_dbg_driver(), but not dev_dbg(). And anyway, this should go
> > to a separate commit.
> OK, I'll not change it in this patch.
> > 
> > >       adj_hfp = hfp;
> > >       adj_hsync = hsync;
> > >       adj_hbp = hbp;
> > >       adj_hblanking = hblanking;
> > >
> > > +     if (mode->clock > DSC_PIXEL_CLOCK) {
> > > +             adj_hsync = DSC_HSYNC_LEN;
> > > +             adj_hfp = DSC_HFP_LEN;
> > > +             adj_hbp = DSC_HBP_LEN;
> > > +             vref = (u64)adj->clock * 1000 * 1000 / (adj->htotal * adj->vtotal);
> > > +             goto calculate_timing;
> > > +     }
> > > +
> > > +     /* No need fixup for external monitor */
> > > +     if (!ctx->pdata.panel_bridge)
> > > +             return true;
> > > +
> > >       /* HFP needs to be even */
> > >       if (hfp & 0x1) {
> > >               adj_hfp += 1;
> > > @@ -2349,16 +2548,21 @@ static bool anx7625_bridge_mode_fixup(struct
> > drm_bridge *bridge,
> > >                       adj_hfp -= delta_adj;
> > >       }
> > >
> > > -     DRM_DEV_DEBUG_DRIVER(dev, "after mode fixup\n");
> > > -     DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d),
> > clock(%d)\n",
> > > -                          adj_hsync, adj_hfp, adj_hbp, adj->clock);
> > > +calculate_timing:
> > > +
> > > +     dev_dbg(dev, "after mode fixup\n");
> > > +     dev_dbg(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
> > > +             adj_hsync, adj_hfp, adj_hbp, adj->clock);
> > >
> > >       /* Reconstruct timing */
> > >       adj->hsync_start = adj->hdisplay + adj_hfp;
> > >       adj->hsync_end = adj->hsync_start + adj_hsync;
> > >       adj->htotal = adj->hsync_end + adj_hbp;
> > > -     DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d),
> > htot(%d)\n",
> > > -                          adj->hsync_start, adj->hsync_end, adj->htotal);
> > > +     if (mode->clock > DSC_PIXEL_CLOCK)
> > > +             adj->clock = (u64)vref * adj->htotal * adj->vtotal /
> > > + 1000 / 1000;
> > > +
> > > +     dev_dbg(dev, "hsync_start(%d), hsync_end(%d), htot(%d), clock(%d)\n",
> > > +             adj->hsync_start, adj->hsync_end, adj->htotal,
> > > + adj->clock);
> > >
> > >       return true;
> > >  }
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > index eb5580f1ab2f..db931f5800b1 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > @@ -149,6 +149,8 @@
> > >  #define HFP_HBP_DEF          ((HBLANKING_MIN - SYNC_LEN_DEF) / 2)
> > >  #define VIDEO_CONTROL_0      0x08
> > >
> > > +#define  TOTAL_LINES_L          0x12
> > > +#define  TOTAL_LINES_H          0x13
> > >  #define  ACTIVE_LINES_L         0x14
> > >  #define  ACTIVE_LINES_H         0x15  /* Bit[7:6] are reserved */
> > >  #define  VERTICAL_FRONT_PORCH   0x16
> > > @@ -166,6 +168,32 @@
> > >  #define  HORIZONTAL_BACK_PORCH_L      0x21
> > >  #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
> > >
> > > +#define  H_BLANK_L                    0x3E
> > > +#define  H_BLANK_H                    0x3F
> > > +#define  DSC_COMPRESS_RATIO           3
> > > +#define  dsc_div(X)                   ((X) / DSC_COMPRESS_RATIO)
> > 
> > This assumes 1:3 ratio. Does anx7625 support only 8bpp / 8bpc mode? Or does
> > 1:3 come from some other ratio?
> We only tested 1:3 compression ratio, 24bpp compress to 8bpp.

What are hardware limitations?

> > 
> > > +#define  DSC_SLICE_NUM                2
> > > +#define  DSC_PIXEL_CLOCK              250000
> > > +#define  DSC_HSYNC_LEN                90
> > > +#define  DSC_HFP_LEN                  177
> > > +#define  DSC_HBP_LEN                  297
> > > +
> > > +#define  TOTAL_PIXEL_L_7E             0x50
> > > +#define  TOTAL_PIXEL_H_7E             0x51  /* bit[7:6] are reserved */
> > > +#define  ACTIVE_PIXEL_L_7E            0x52
> > > +#define  ACTIVE_PIXEL_H_7E            0x53  /* bit[7:6] are reserved */
> > > +#define  HORIZON_FRONT_PORCH_L_7E     0x54
> > > +#define  HORIZON_FRONT_PORCH_H_7E     0x55
> > > +#define  HORIZON_SYNC_WIDTH_L_7E      0x56
> > > +#define  HORIZON_SYNC_WIDTH_H_7E      0x57
> > > +#define  HORIZON_BACK_PORCH_L_7E      0x58
> > > +#define  HORIZON_BACK_PORCH_H_7E      0x59
> > > +
> > > +#define  PPS_SIZE                     128
> > > +#define  PPS_BLOCK_SIZE               32
> > > +#define  R_PPS_REG_0                  0x80
> > > +#define  R_I2C_1                      0x81
> > > +
> > >  /******** END of I2C Address 0x72 *********/
> > >
> > >
> > /***************************************************************/
> > > @@ -415,6 +443,7 @@ enum audio_wd_len {
> > >  #define MAX_EDID_BLOCK       3
> > >  #define EDID_TRY_CNT 3
> > >  #define SUPPORT_PIXEL_CLOCK  300000
> > > +#define SUPPORT_MIN_PIXEL_CLOCK      50000
> > >
> > >  /***************** Display End *****************/
> > >
> > > @@ -454,6 +483,7 @@ struct anx7625_data {
> > >       int hpd_high_cnt;
> > >       int dp_en;
> > >       int hdcp_cp;
> > > +     bool dsc_en;
> > >       /* Lock for work queue */
> > >       struct mutex lock;
> > >       struct device *dev;
> > > @@ -479,6 +509,8 @@ struct anx7625_data {
> > >       struct drm_connector *connector;
> > >       struct mipi_dsi_device *dsi;
> > >       struct drm_dp_aux aux;
> > > +     struct drm_dsc_config dsc;
> > > +     char pps_table[PPS_SIZE];
> > 
> > pps_table and drm_dsc_config can vary depending on the mode and connected
> > sink. THey should be a part of the atomic state rather than a long-living
> > anx7625_data. So does dsc_en.
> No need to check sink monitor, because DSC only exist between SOC and Anx7625,
> sink monitor only receive normal DP signal from anx7625. Anx7625 is responsible for
> decompression.

The same way, they depend on the selected video mode, don't they?

> > 
> > >  };
> > >
> > >  #endif  /* __ANX7625_H__ */
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
