Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426734ACC11
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5298D10E46E;
	Mon,  7 Feb 2022 22:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D4D10E46E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:33:00 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id s18so18814440ioa.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TBuMhQ9J/HHSmVfW6x5aEvvGFLCxXNYYTMZL7wOdYn0=;
 b=CgdoxSWRx5sEiaOweje6vzthUgeip1YKzxTglYqYSTwUeqi3VtX9zFUv7v9SPlh8m3
 Z625mvEo6tiS82Zg7w+yJeZJFWkB4gxD/EON7MohR2MSiskwYr72APr+KXiZsL/EAzi/
 5MzbSQfVb1qej41unUB2Yreay7CgDNWFw4IJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TBuMhQ9J/HHSmVfW6x5aEvvGFLCxXNYYTMZL7wOdYn0=;
 b=L/M7H0pgVbPabl1YmkPTIltzgl6Lry/7WAxmt0IBDytTPdag1WyHrVfiIJ7jDzg50u
 R0Ru0iWczJWiLpEJ+X2feF6S3RCkJAxhjwkQronSNaZo4Alzu/ydlWjZQ09WCf9gOyJM
 HAzsVsBXG3nuKOACjTwcRYrGwtgvIPU8YwCXNLDvzm/6iz/u9ckihlaGlziBRisQxK6b
 g1Xz5mwkl4SPPBHZZnE9aqP08EkPgj9fJ6p5HxXt/Hoa0NqLmWTCwA5yTwa1dczTlWkT
 fybI/hAbaMqRi4CdLdnOAHhTaS5ydnXDz8kWAvgW9YIaDfAOLdkDobfhF4t8kkKqMiyH
 9E7A==
X-Gm-Message-State: AOAM533trChItpWA66RBqz3XKF//PqnUrUchm5ACsz/s7NL05wOhGCjr
 GOIIVNzGBoaSd5yPeAvtk/PQ+DmChYNiVg==
X-Google-Smtp-Source: ABdhPJwS/BiFwEdUOKc2neKqXjO3D23ifT0/DPqaWcoIbT8aCGuyiFUTN1rfY479iY3S6w5Tnh5Klg==
X-Received: by 2002:a05:6602:15c6:: with SMTP id
 f6mr785467iow.178.1644273179878; 
 Mon, 07 Feb 2022 14:32:59 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id p10sm5172427iln.3.2022.02.07.14.32.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 14:32:59 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id 9so18927108iou.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:32:59 -0800 (PST)
X-Received: by 2002:a05:6602:2a4b:: with SMTP id
 k11mr772398iov.136.1644273178907; 
 Mon, 07 Feb 2022 14:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-4-sam@ravnborg.org>
In-Reply-To: <20220206154405.1243333-4-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Feb 2022 14:32:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U2MnR895FDw79ATQr0TCjQzAxiZbXVr7sL5hXxH3fz6g@mail.gmail.com>
Message-ID: <CAD=FV=U2MnR895FDw79ATQr0TCjQzAxiZbXVr7sL5hXxH3fz6g@mail.gmail.com>
Subject: Re: [PATCH v1 3/9] drm: add drm_atomic_helper_bridge_dsi_input_bus_fmt
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Feb 6, 2022 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> There is a number of bridge drivers that supports a single media bus
> format for DSI. Add a helper to avoid duplicating the code.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
>  include/drm/drm_atomic_helper.h     |  7 +++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index a7a05e1e26bb..94f313dc196f 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3549,3 +3549,44 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
>         return input_fmts;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
> +
> +/**
> + * drm_atomic_helper_bridge_dsi_input_bus_fmt - Define one DSI output format

Is the description right? It's called "input" format but it defines an
output format?


> + * @bridge: bridge control structure
> + * @bridge_state: new bridge state
> + * @crtc_state: new CRTC state
> + * @conn_state: new connector state
> + * @output_fmt: tested output bus format
> + * @num_input_fmts: will contain the size of the returned array

Maybe indicate that it's always 1 in the comments?

> + *
> + * This helper is an implementation of the
> + * &drm_bridge_funcs.atomic_get_input_bus_fmts operation for bridges that supports
> + * a single DSI media bus format MEDIA_BUS_FMT_RGB888_1X24.
> + *
> + * RETURNS

kernel-doc can't parse this return syntax and warns:

warning: No description found for return value of
'drm_atomic_helper_bridge_dsi_input_bus_fmt'


> + * A format array with one entry containing MEDIA_BUS_FMT_RGB888_1X24,
> + * or NULL if the allocation failed
> + */
> +u32 *
> +drm_atomic_helper_bridge_dsi_input_bus_fmt(struct drm_bridge *bridge,
> +                                          struct drm_bridge_state *bridge_state,
> +                                          struct drm_crtc_state *crtc_state,
> +                                          struct drm_connector_state *conn_state,
> +                                          u32 output_fmt,
> +                                          unsigned int *num_input_fmts)
> +{
> +       u32 *input_fmts;
> +
> +       *num_input_fmts = 0;
> +
> +       input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);

I probably wouldn't have bothered with `kcalloc` for something that's
always just one value and you're setting it. Why not just

input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);

...also MAX_INPUT_SEL_FORMATS isn't defined. I guess that's why you
said it didn't compile?

Also: if it was common for others to want to provide fixed formats, I
wonder about adding a helper function that did most of the work here?
Dunno what it would be named since it's already a bit a of handful,
but I'd expect to call it like:

static const u32 formats[] = { MEDIA_BUS_FMT_RGB888_1X24 };
return my_neat_helper(formats, ARRAY_SIZE(formats), num_output_formats)

Then my_neat_helper() could do kmemdup() on the array passed and fill
in "num_output_formats" to be either the array size of 0 (if the
kmemdup failed).


> +       if (!input_fmts)
> +               return NULL;
> +
> +       /* This is the DSI-end bus format */
> +       input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;

I'm not an expert, but I'm curious. Can't DSI run in other formats?
...or maybe I'm misunderstanding what this is for. I guess I'm not
sure how it relates to:

enum mipi_dsi_pixel_format {
  MIPI_DSI_FMT_RGB888,
  MIPI_DSI_FMT_RGB666,
  MIPI_DSI_FMT_RGB666_PACKED,
  MIPI_DSI_FMT_RGB565,
};


-Doug
