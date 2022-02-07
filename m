Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B334ACC0A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485A110E213;
	Mon,  7 Feb 2022 22:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A356210E213
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:26:57 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id p63so18819564iod.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WC+e3sntQzPVsqKr/g9FTl7VXF3QM5fUVChep5JBZMg=;
 b=AgtWCBnVNMH4uc7IUNHvlSyQV5m4CFhrcMgbHtDAsvJJXRSmc1ZyRUZg76s6H0rXxj
 Q3EpODirfHs0KAGyFo3wsba9BOn3qIlezbCsz5YTWP+mbxfJoCLHfVbwcSL1twllH3px
 PyBuSInd2xjk7CDKvba/tQvFcaU3LCpH9yZvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WC+e3sntQzPVsqKr/g9FTl7VXF3QM5fUVChep5JBZMg=;
 b=CLR8MW+jva1DZIBUQRIZQsP8qNhZaEuKzPmuVWAAgAURYhDO/nQyhj/3ewd0xjvzfh
 5lekC2/SrCEDhuRpq/dHDtvon0fNj2lwdUugzcrvBeCbQp/iz8sKlD12pCbVisUwjzG7
 i/iRRO+Jd1Q3W0dmnJqax957P6mwydXGVOuQ8UhnYiwrISf/rUzv7KaFRxl1LB6ABOy8
 9GDBgXIksHslqofZhB3oeY5cb2lJvgJx9KX2iH+qz5Qkqj3iYNNFc8E73h5ISn53pGEh
 pRZS1pnvIc7jQr2LDDg3hGC5YVtE8PSBWU0A7PnSw4LrwZ3RImhM/L6W4QogFKoi0hEs
 sy2w==
X-Gm-Message-State: AOAM533Pd/GuGs6HAS47x6/gN2B54EzDyn9elHEgXU14Fg2+zUlPJ3IC
 dfO2AeWFO4n4MRg+o0AooWtgapkfWT/B0Q==
X-Google-Smtp-Source: ABdhPJwEMDXIfsCcwfbuZNy/lElXvAE7cPL6E3NAPtTa6Mi7TmYfCxF97nwQIHVEZyXoEDGsZQ0+YQ==
X-Received: by 2002:a05:6602:15c6:: with SMTP id
 f6mr776919iow.178.1644272816569; 
 Mon, 07 Feb 2022 14:26:56 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id t6sm7035167iov.39.2022.02.07.14.26.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 14:26:56 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id s18so18797086ioa.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:26:56 -0800 (PST)
X-Received: by 2002:a05:6602:3411:: with SMTP id
 n17mr750018ioz.128.1644272489347; 
 Mon, 07 Feb 2022 14:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-3-sam@ravnborg.org>
In-Reply-To: <20220206154405.1243333-3-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Feb 2022 14:21:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ukt5urBO=dbAieR2AYZ-u-4X5m87-3_cRDmwPYf1z6gQ@mail.gmail.com>
Message-ID: <CAD=FV=Ukt5urBO=dbAieR2AYZ-u-4X5m87-3_cRDmwPYf1z6gQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] drm: add drm specific media-bus-format header file
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
> For now the header file includes a single method to retreive the bpc
> from the bus format.
> The supported MEDIA_BUS_* codes are the ones used for the current panels
> in DRM. The list can be extended as there are a need for more formats.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  include/drm/media-bus-format.h | 53 ++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 include/drm/media-bus-format.h
>
> diff --git a/include/drm/media-bus-format.h b/include/drm/media-bus-forma=
t.h
> new file mode 100644
> index 000000000000..d4d18f19a70f
> --- /dev/null
> +++ b/include/drm/media-bus-format.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2022 Sam Ravnborg
> + */
> +
> +#ifndef __LINUX_DRM_MEDIA_BUS_FORMAT
> +#define __LINUX_DRM_MEDIA_BUS_FORMAT
> +
> +#include <linux/bug.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/types.h>
> +
> +/**
> + * media_bus_format_to_bpc - The bits per color channel for the bus_form=
at
> + *
> + * Based on the supplied bus_format return the maximum number of bits
> + * per color channel.
> + *
> + * RETURNS
> + * The number of bits per color channel, or -EINVAL if the bus_format
> + * is unknown.

kernel-doc doesn't like your syntax quite right. Try running:

./scripts/kernel-doc -rst -v include/drm/media-bus-format.h

It will tell you that you're missing a description of the parameter
and the way you're describing the return value isn't in a way that it
can parse...

> + */
> +static inline int media_bus_format_to_bpc(u32 bus_format)
> +{
> +       switch (bus_format) {
> +       /* DPI */
> +       case MEDIA_BUS_FMT_RGB565_1X16:
> +       case MEDIA_BUS_FMT_RGB666_1X18:
> +               return 6;
> +
> +       /* DPI */
> +       case MEDIA_BUS_FMT_RGB888_1X24:
> +       case MEDIA_BUS_FMT_RGB888_3X8:
> +       case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
> +       case MEDIA_BUS_FMT_Y8_1X8:
> +               return 8;
> +
> +       /* LVDS */
> +       case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +               return 6;
> +
> +       /* LVDS */

When applying your patches, I got a warning that both of your "/* LVDS
*/" comments have spaces before the tab.

I'm also not sure what the "sections" are supposed to mean. Are you
saying that the bus formats are only for the given transport type?
...so we can't use MEDIA_BUS_FMT_RGB666_1X18 for eDP?

-Doug
