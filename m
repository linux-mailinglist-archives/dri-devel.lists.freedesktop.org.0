Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F7F256522
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 08:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867806E19A;
	Sat, 29 Aug 2020 06:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0316E19A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 06:44:09 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id c8so815728lfh.9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 23:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X76JMzhQdfjLKl2wMk/NvZFWieBI7eVxqXcIZgcoIVk=;
 b=dsF+ee3pPVEds94TRsFaVY34fdJTGG5xJ61wk+4p6Y0EqG+E2r0OmeZMchj2/q+W/l
 mH93lVj3rue5NGAuMCdEBKKzJdUUvuTPPpKbBgsO8q0tUOjaYXUfsq6nkO/pD7OIzFkm
 0odRbHAeuxjKyDY5KKu2gXE7bFTcBCU2hXbLfS1+Ye3Dc7RFrnM2I/HevfQMtgKiFuBe
 yygUhIby5mrJH6VPo4aUBiq4mRhjBfW91b1w19pv29SFfoVkuwjsGuYOVzRE0LqBZBb0
 OetOCsGTs4+7aB85mj4yRXUDubpvOmSsUheC/z7we/2KX+XcUP4AEOnHrla7D1B3Eqqf
 S+QA==
X-Gm-Message-State: AOAM532XE1TSX+dX+aD13STe0/EORxq+neRC4IOdAkG/P6SGJoDZSV+Z
 S+KDCNgpZD9A5G5R3Kc8m3lJdEo5SAmLWQ==
X-Google-Smtp-Source: ABdhPJwL833WvroMdPGvzBdCqISZXOjf7tcdZ7uoSC7kQo45FQpjFA5IFn85/OgTissmLybdktq/jg==
X-Received: by 2002:a19:3:: with SMTP id 3mr993239lfa.121.1598683447640;
 Fri, 28 Aug 2020 23:44:07 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id n24sm392878lfe.38.2020.08.28.23.44.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 23:44:06 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id h19so1195245ljg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 23:44:06 -0700 (PDT)
X-Received: by 2002:a2e:9047:: with SMTP id n7mr1021857ljg.125.1598683445896; 
 Fri, 28 Aug 2020 23:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
 <1df5a7bcafa091e008edb439ee9de4262ae4d5d1.1596101672.git-series.maxime@cerno.tech>
In-Reply-To: <1df5a7bcafa091e008edb439ee9de4262ae4d5d1.1596101672.git-series.maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 29 Aug 2020 14:43:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v64dsqavVYL4UvjWw=DzpbE-Egwso1Ma8xH3qYgS2Te9zg@mail.gmail.com>
Message-ID: <CAGb2v64dsqavVYL4UvjWw=DzpbE-Egwso1Ma8xH3qYgS2Te9zg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/sun4i: tcon: Refactor the LVDS and panel
 probing
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
> The current code to parse the DT, deal with the older device trees, and
> register either the RGB or LVDS output has so far grown organically into
> the bind function and has become quite hard to extend properly.
>
> Let's move it into a single function that grabs all the resources it needs
> and registers the proper panel output.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 139 +++++++++++++++---------------
>  1 file changed, 70 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 2a5a9903c4c6..d03ad75f9900 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -875,6 +875,75 @@ static int sun4i_tcon_init_regmap(struct device *dev,
>         return 0;
>  }
>
> +static int sun4i_tcon_register_panel(struct drm_device *drm,
> +                                    struct sun4i_tcon *tcon)
> +{
> +       struct device_node *companion;
> +       struct device_node *remote;
> +       struct device *dev = tcon->dev;
> +       bool has_lvds_alt;
> +       bool has_lvds_rst;
> +       int ret;
> +
> +       /*
> +        * If we have an LVDS panel connected to the TCON, we should
> +        * just probe the LVDS connector. Otherwise, let's just register
> +        * an RGB panel.
> +        */
> +       remote = of_graph_get_remote_node(dev->of_node, 1, 0);
> +       if (!tcon->quirks->supports_lvds ||
> +           !of_device_is_compatible(remote, "panel-lvds"))
> +               return sun4i_rgb_init(drm, tcon);

Slightly related: IIRC there are a few LVDS panels supported in panel-simple
so they don't use the panel-lvds compatible. Any idea how to deal with those?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
