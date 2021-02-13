Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE20D31ABF1
	for <lists+dri-devel@lfdr.de>; Sat, 13 Feb 2021 14:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8EC6E83A;
	Sat, 13 Feb 2021 13:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633426E83A
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 13:53:42 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ot7so1376196ejb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 05:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m8jBg82vAvSE5pklGltx6cAUSQoJMcnupvcxpvBunOY=;
 b=AdYD9OnRN9RDlHu7qf4zBTbbK1fopi/MD+mZp6/O4jp1wN5LI2SjLU3axGdwaiuztl
 hnB9O5lyDR/DXszVoA+lfQwxo6Qw+uZUswc2qHssGSCAnUuEOKvaYS/6TeRbYvb56re9
 dcDznn7f+NrknfIEHJAu4GAWhPLijQd7KtXraQ7Yt7yrwaSgz0RdJc0+vQExA9/Zl5Am
 11lNvqOJmRZse8ZJsjLJxqNhn9WA86RTlOW+P9Ecvrx7IyMUDMRfzzmFjUZa13InkEJN
 NkA9kupFZRko81+6gmodN6Ij/yMT/AV9oGP+KCioItIIELsAlYTVZmH5/2AKDFtI6Nsv
 dSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m8jBg82vAvSE5pklGltx6cAUSQoJMcnupvcxpvBunOY=;
 b=n5B4sACw5Ohdy67LuLHqr6S+FwmhA0xQwmNWRiW7T9mD91/ckY/d1gWeVZWs0FWfbi
 FiX8HEfOES1t3SFjemRVmuHzG5U4SFEvZJzuuFKGvWQXIyJIuq49SPVoOQOFeE9iF7nR
 MfMzFjftyXYPI7naq28Xdu6xw6oTgOK7283yhXPs9AjWg7l5LS+kir9k09IpuHhn55z+
 WlbvOuu5mU4ezs6qZaPffqcMA+OhX0+ISzzcvi4Wos7oWgCtXxS6CsCB1RQbCVtmRdOT
 63VdqOaaD7XQ4vf66p//h+PGTnJJcuffzIdiq9vg1DUw/6wuQFNPgH6R2zgMU2TWW2sx
 MHbg==
X-Gm-Message-State: AOAM530N+B4hjlaZCMvyF5CGcwAPr0Ikf56FkVa7Mi+oiRs5+KVyi8KF
 uDoRwC3g557MchA1HXJ1EpqRHUozL72iPw6fXc4jFg==
X-Google-Smtp-Source: ABdhPJxHJjMHJpZHaMZ9P++5S5SXpea5j7YxgnUWAmly6d2WYxPgGQXyb8nbrzF/iiKfW1C1Qyz5m/rr5Knwzkl5Q70=
X-Received: by 2002:a17:906:32d1:: with SMTP id
 k17mr7696149ejk.141.1613224420855; 
 Sat, 13 Feb 2021 05:53:40 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR06MB53424F1D31DCA0F038842EB7A58B9@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB53424F1D31DCA0F038842EB7A58B9@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 13 Feb 2021 10:53:30 -0300
Message-ID: <CAAEAJfBXg6R_P9wskFf2eh+jqHT8EJdUXJdub1yd-oqCHfg6qA@mail.gmail.com>
Subject: Odroid GO Advance display in mainline (Re: [PATCH 1/2] drm/panel: add
 rotation support for Elida KD35T133 panels)
To: Chris Morgan <macromorgan@hotmail.com>
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
Cc: David Airlie <airlied@linux.ie>, HHheiko@sntech.de,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

I'm hijacking this discussion a bit.

I recently tried to boot maline on my Odroid GOA, which I managed to do,
except the display wasn't displaying anything :-)

Everything looks good on a quick look, the Inno PHY driver is here,
and there's a DRM card registered with the right mode 320x240 and
connected status (which I suppose doesn't mean much in this case).
Also, the backlight is on.

Looks like this is working for you, so I was wondering if maybe
this would ring a bell, or perhaps you're aware of any patches
we are missing in v5.11-rc7 (which is what I'm basing on).
Or maybe I'm missing some config?...

Any ideas would be welcome!

Ezequiel

On Fri, 12 Feb 2021 at 12:51, Chris Morgan <macromorgan@hotmail.com> wrote:
>
> Update the panel to allow setting the rotation value in device tree.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index bc36aa3c1123..d8534406d1ef 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -42,6 +42,7 @@ struct kd35t133 {
>         struct gpio_desc *reset_gpio;
>         struct regulator *vdd;
>         struct regulator *iovcc;
> +       enum drm_panel_orientation orientation;
>         bool prepared;
>  };
>
> @@ -216,6 +217,7 @@ static int kd35t133_get_modes(struct drm_panel *panel,
>         connector->display_info.width_mm = mode->width_mm;
>         connector->display_info.height_mm = mode->height_mm;
>         drm_mode_probed_add(connector, mode);
> +       drm_connector_set_panel_orientation(connector, ctx->orientation);
>
>         return 1;
>  }
> @@ -258,6 +260,12 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>                 return ret;
>         }
>
> +       ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +       if (ret < 0) {
> +               dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
> +               return ret;
> +       }
> +
>         mipi_dsi_set_drvdata(dsi, ctx);
>
>         ctx->dev = dev;
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
