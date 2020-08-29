Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB65256579
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 08:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753B66E45D;
	Sat, 29 Aug 2020 06:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9BF6E45D
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 06:55:51 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v12so812456lfo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 23:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QxbUIJK5rz60df333qJ3FD8yUc5W6/zx9tVKggK6xO0=;
 b=BdC3bWiv5GAc6OJ33HtGN4nRwnAVvaSAOFVTwD948RIwtnTfyVM3ngSuEYAJorAYtg
 pxl4Vj6Jdjb1hHRDN56/3nIccTae+9VhFpDGguwu0SXzqDg3LSs5MzOo2bmZFkakHYKl
 m67xWzZcHmDIu51W1eBMS9NmKqH9/9idQml78kBRf/NGvRLBLvuHWTaMAINyEupvg61f
 Ql1e42eTZkX72xVG0mRjQWszvtPJrsU3bpcW0VKYm2E2w6YBvZwLtXpMj4d3lMO28eWf
 3x7ozUBHKWJckCj9RLX3QBD8SX3xBV1ihiMO2TjyF/q6jmLCHHpPnSk4yb1GmL5JYD+b
 Bzpw==
X-Gm-Message-State: AOAM532+jmKllu/BgOFhkjsK1ubF+3O/yM+NLGWQt1PBvl4cP9/Qo5x+
 X9iRtCQ/yRWiURZ4TjbnkT99gOec3GFLKQ==
X-Google-Smtp-Source: ABdhPJyXZSWBPGgpkD1GAZukM+FVWY1IRGHEJP00ff2gdpAHqvt1/6FqvXamqges+6jERUFl3GhgVg==
X-Received: by 2002:a05:6512:74b:: with SMTP id
 c11mr988113lfs.119.1598684149004; 
 Fri, 28 Aug 2020 23:55:49 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id k12sm304135ljh.95.2020.08.28.23.55.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 23:55:48 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id u25so820759lfm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 23:55:48 -0700 (PDT)
X-Received: by 2002:ac2:51a7:: with SMTP id f7mr1021376lfk.108.1598684147994; 
 Fri, 28 Aug 2020 23:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
 <100f5fe3391366e9bbc76ebec1edbf8c0aeb715a.1596101672.git-series.maxime@cerno.tech>
In-Reply-To: <100f5fe3391366e9bbc76ebec1edbf8c0aeb715a.1596101672.git-series.maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 29 Aug 2020 14:55:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v64XRGjAmgHTRpmfiM8S244S+RJ0jVvJ07mFU9y4fHO=ww@mail.gmail.com>
Message-ID: <CAGb2v64XRGjAmgHTRpmfiM8S244S+RJ0jVvJ07mFU9y4fHO=ww@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/sun4i: tcon: Support the LVDS Dual-Link on the
 A20
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 5:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The A20 can use its second TCON as the secondary LVDS link in a dual-link
> setup, with the TCON0 being the main link. Extend a bit the parsing code to
> leverage the DRM dual-link code, register only the LVDS output on the
> primary TCON, and add the needed bits to setup the TCON properly.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 36 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  4 +++-
>  2 files changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index d03ad75f9900..ed2abf6eb18b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -487,6 +487,9 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
>         else
>                 reg |= SUN4I_TCON0_LVDS_IF_DATA_POL_NORMAL;
>
> +       if (tcon->lvds_dual_link)
> +               reg |= SUN4I_TCON0_LVDS_IF_DUAL_LINK;
> +
>         if (sun4i_tcon_get_pixel_depth(encoder) == 24)
>                 reg |= SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS;
>         else
> @@ -896,6 +899,16 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
>                 return sun4i_rgb_init(drm, tcon);
>
>         /*
> +        * Only the TCON0 will be relevant for the LVDS output, so if
> +        * our ID is something else, let's prevent our TCON from
> +        * registering its own LVDS output
> +        */
> +       if (tcon->id) {
> +               dev_info(dev, "Secondary TCON, disabling panel output");

Nit: "disabling" is a bit misleading.

Just stating that it is used as a secondary link

> +               return 0;
> +       }
> +
> +       /*
>          * This can only be made optional since we've had DT
>          * nodes without the LVDS reset properties.
>          *
> @@ -941,6 +954,28 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
>                 return -ENODEV;
>         }
>
> +       /*
> +        * If we don't have a second TCON, we will never be able to do
> +        * dual-link LVDS, so we don't have much more to do.
> +        */
> +       companion = of_parse_phandle(dev->of_node, "allwinner,lvds-companion", 0);
> +       if (!companion)
> +               return 0;

I assume you want

                return sun4i_lvds_init(drm, tcon);

otherwise single-link LVDS would not work anymore?


ChenYu

> +
> +       /*
> +        * Let's do a sanity check on the dual-link setup to make sure
> +        * everything is properly described.
> +        */
> +       ret = drm_of_lvds_get_dual_link_pixel_order(dev->of_node, 1, 0,
> +                                                   companion, 1, 0);
> +       if (ret < 0) {
> +               dev_err(dev, "Invalid Dual-Link Configuration.\n");
> +               return ret;
> +       }
> +
> +       dev_info(dev, "Primary TCON, enabling LVDS Dual-Link");
> +       tcon->lvds_dual_link = true;
> +
>         return sun4i_lvds_init(drm, tcon);
>  }
>
> @@ -1500,6 +1535,7 @@ static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
>  };
>
>  static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
> +       .supports_lvds          = true,
>         .has_channel_0          = true,
>         .has_channel_1          = true,
>         .dclk_min_div           = 4,
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> index cfbf4e6c1679..51c4e09cdd13 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> @@ -98,6 +98,7 @@
>
>  #define SUN4I_TCON0_LVDS_IF_REG                        0x84
>  #define SUN4I_TCON0_LVDS_IF_EN                         BIT(31)
> +#define SUN4I_TCON0_LVDS_IF_DUAL_LINK                  BIT(30)
>  #define SUN4I_TCON0_LVDS_IF_BITWIDTH_MASK              BIT(26)
>  #define SUN4I_TCON0_LVDS_IF_BITWIDTH_18BITS            (1 << 26)
>  #define SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS            (0 << 26)
> @@ -274,6 +275,9 @@ struct sun4i_tcon {
>         /* Associated crtc */
>         struct sun4i_crtc               *crtc;
>
> +       /* Is the LVDS link a dual-channel link? */
> +       bool                            lvds_dual_link;
> +
>         int                             id;
>
>         /* TCON list management */
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
