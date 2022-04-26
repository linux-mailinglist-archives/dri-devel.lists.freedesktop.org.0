Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 506CD50F2F1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 09:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A5C10E438;
	Tue, 26 Apr 2022 07:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4934610E438
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 07:48:08 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id kc12so8386574qvb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 00:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/HcCRayH9FTvIwf3k7iht/16cHP0/OgYGNAx63jifwo=;
 b=jRjeVcvB/mmRTgRdYmmLAsqhC0yzA6XYr+l5q2xLmoUl0OenzntsQIssNLWoDXUlBV
 dgRrMC+GN1GJvW04yGM5WLaISJcHJPuf52nyd7JjtqvCTW6Bazy+gqfeMOK/5TaK7uMZ
 yGZlP3Xcn/+sON/SwOZVACCenROtT/G03iqiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/HcCRayH9FTvIwf3k7iht/16cHP0/OgYGNAx63jifwo=;
 b=4ek1DP6508CT13jSFdSJBOTULaoKFaRl8Q4bcxAsbUn8SbpSzedc2pnBcwbyg36He0
 eHRBpK11EXQXRdt+5wKnEVOC7c7Tp7I9M9dVbhvCvqyppDSfgxLNaeEgIfLt+7MOIKr+
 XHAOQMV4Qdh08562mw1AHrz7YgF+M9E7wlrcNTBWamy37wvKqd62sv+bIJuv6oeIPY9L
 i8v1iB6CD0zIdT/kUiTUpqwJosbdpWd5ngPfDbKOaIqKedOAw1QZN3St+gq38u4CBF2i
 ekYMDyNDQQfQYUO4Aggi6/05uMGNsmOO9FUCCwNta3dfSwe6sizbGAPvpu9zT89LUi78
 kVbA==
X-Gm-Message-State: AOAM533tukNnhugp8/VYSevGLytVZWa/qGdwt0AZLQCDT0YomVKkRjt+
 FB6zyMyjRkatbN+/4SehqGC2ZVcmX+a5udIyBbc=
X-Google-Smtp-Source: ABdhPJykzCFSUPtDPLs6rZ2wQSHdoWgRVitQaTZVkCsoG5s+fBHsIlRpGH0AZ3D+cG+gYZMqtockZmxk3lfWlcVEou8=
X-Received: by 2002:ad4:53c5:0:b0:42d:7bb4:a8e8 with SMTP id
 k5-20020ad453c5000000b0042d7bb4a8e8mr15099369qvv.8.1650959287059; Tue, 26 Apr
 2022 00:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220304063137.12970-1-tommy_huang@aspeedtech.com>
 <20220304063137.12970-3-tommy_huang@aspeedtech.com>
In-Reply-To: <20220304063137.12970-3-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 26 Apr 2022 07:47:55 +0000
Message-ID: <CACPK8XfeRGU4ZySfO8vMf71wy-=PcdetvFAwAE9gaSz-NPK6Fg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/aspeed: Add 1024x768 mode for AST2600
To: Tommy Haung <tommy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 06:32, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
>
> Update the aspeed_gfx_set_clk with display width.
> At AST2600, the display clock could be coming from
> HPLL clock / 16 = 75MHz. It would fit 1024x768@70Hz.
> Another chip will still keep 800x600.
>
> Signed-off-by: Tommy Haung <tommy_huang@aspeedtech.com>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx.h      | 12 ++++++----
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 29 ++++++++++++++++++++----
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 16 +++++++++++--
>  drivers/gpu/drm/aspeed/aspeed_gfx_out.c  | 14 +++++++++++-
>  4 files changed, 60 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> index eb4c267cde5e..c7aefee0657a 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> @@ -109,11 +109,15 @@ int aspeed_gfx_create_output(struct drm_device *drm);
>  #define CRT_THROD_HIGH(x)              ((x) << 8)
>
>  /* SCU control */
> -#define SCU_G6_CLK_COURCE              0x300
> +#define G6_CLK_SOURCE                  0x300
> +#define G6_CLK_SOURCE_MASK             (BIT(8) | BIT(9) | BIT(10))
> +#define G6_CLK_SOURCE_HPLL             (BIT(8) | BIT(9) | BIT(10))
> +#define G6_CLK_SOURCE_USB              BIT(9)
> +#define G6_CLK_SEL3                    0x308
> +#define G6_CLK_DIV_MASK                        0x3F000

This register is defined in the data sheet as:

17:12 SOC Display clock selection when source is from DisplayPort PHY

That doesn't match with what the code is doing. Can you clarify the
register definition?

> +#define G6_CLK_DIV_16                  (BIT(16)|BIT(15)|BIT(13)|BIT(12))
> +#define G6_USB_40_CLK                  BIT(9)
>
>  /* GFX FLAGS */
>  #define CLK_MASK                       BIT(0)
>  #define CLK_G6                         BIT(0)
> -
> -#define G6_CLK_MASK                    (BIT(8) | BIT(9) | BIT(10))
> -#define G6_USB_40_CLK                  BIT(9)
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> index a24fab22eac4..5829be9c7c67 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -23,6 +23,28 @@ drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
>         return container_of(pipe, struct aspeed_gfx, pipe);
>  }
>
> +static void aspeed_gfx_set_clock_source(struct aspeed_gfx *priv, int mode_width)
> +{
> +       regmap_update_bits(priv->scu, G6_CLK_SOURCE, G6_CLK_SOURCE_MASK, 0x0);
> +       regmap_update_bits(priv->scu, G6_CLK_SEL3, G6_CLK_DIV_MASK, 0x0);
> +
> +       switch (mode_width) {
> +       case 1024:
> +               /* hpll div 16 = 75Mhz */
> +               regmap_update_bits(priv->scu, G6_CLK_SOURCE,
> +               G6_CLK_SOURCE_MASK, G6_CLK_SOURCE_HPLL);
> +               regmap_update_bits(priv->scu, G6_CLK_SEL3,
> +               G6_CLK_DIV_MASK, G6_CLK_DIV_16);
> +               break;
> +       case 800:
> +       default:
> +               /* usb 40Mhz */
> +               regmap_update_bits(priv->scu, G6_CLK_SOURCE,
> +               G6_CLK_SOURCE_MASK, G6_CLK_SOURCE_USB);
> +               break;
> +       }
> +}
> +
>  static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
>  {
>         struct drm_crtc *crtc = &priv->pipe.crtc;
> @@ -77,12 +99,11 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
>         regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), 0);
>  }
>
> -static void aspeed_gfx_set_clk(struct aspeed_gfx *priv)
> +static void aspeed_gfx_set_clk(struct aspeed_gfx *priv, int mode_width)
>  {
>         switch (priv->flags & CLK_MASK) {
>         case CLK_G6:
> -               regmap_update_bits(priv->scu, SCU_G6_CLK_COURCE, G6_CLK_MASK, 0x0);
> -               regmap_update_bits(priv->scu, SCU_G6_CLK_COURCE, G6_CLK_MASK, G6_USB_40_CLK);
> +               aspeed_gfx_set_clock_source(priv, mode_width);
>                 break;
>         default:
>                 break;
> @@ -99,7 +120,7 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
>         if (err)
>                 return;
>
> -       aspeed_gfx_set_clk(priv);
> +       aspeed_gfx_set_clk(priv, m->hdisplay);
>
>  #if 0
>         /* TODO: we have only been able to test with the 40MHz USB clock. The
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index af56ffdccc65..e1a814aebc2d 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -110,6 +110,7 @@ static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
>
>  static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
>  {
> +       struct aspeed_gfx *priv = to_aspeed_gfx(drm);
>         int ret;
>
>         ret = drmm_mode_config_init(drm);
> @@ -118,8 +119,18 @@ static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
>
>         drm->mode_config.min_width = 0;
>         drm->mode_config.min_height = 0;
> -       drm->mode_config.max_width = 800;
> -       drm->mode_config.max_height = 600;
> +
> +       switch (priv->flags & CLK_MASK) {
> +       case CLK_G6:
> +               drm->mode_config.max_width = 1024;
> +               drm->mode_config.max_height = 768;
> +               break;
> +       default:
> +               drm->mode_config.max_width = 800;
> +               drm->mode_config.max_height = 600;
> +               break;
> +       }
> +
>         drm->mode_config.funcs = &aspeed_gfx_mode_config_funcs;
>
>         return ret;
> @@ -167,6 +178,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
>         priv->vga_scratch_reg = config->vga_scratch_reg;
>         priv->throd_val = config->throd_val;
>         priv->scan_line_max = config->scan_line_max;
> +       priv->flags = config->gfx_flags;
>
>         priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
>         if (IS_ERR(priv->scu)) {
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> index 6759cb88415a..5d5e04f15c59 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> @@ -10,7 +10,19 @@
>
>  static int aspeed_gfx_get_modes(struct drm_connector *connector)
>  {
> -       return drm_add_modes_noedid(connector, 800, 600);
> +       struct aspeed_gfx *priv = container_of(connector, struct aspeed_gfx, connector);
> +       int mode_count = 0;
> +
> +       switch (priv->flags & CLK_MASK) {
> +       case CLK_G6:
> +               mode_count = drm_add_modes_noedid(connector, 1024, 768);
> +               break;
> +       default:
> +               mode_count = drm_add_modes_noedid(connector, 800, 600);
> +               break;
> +       }
> +
> +       return mode_count;
>  }
>
>  static const struct
> --
> 2.17.1
>
