Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0526CED1E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68C510E174;
	Wed, 29 Mar 2023 15:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393FF10E174
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:38:29 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-544f7c176easo299864227b3.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680104308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjRFa9g3onI1kC4K0Bhev7+GmSoMwaeDzlNBL5jHj68=;
 b=Mi6YU1rgntanGu1TnibK+PJaPy357W/mJA63yHdPw3nBV3U0TjPaqtjgyzXcQm1xtO
 6NMzWsRdpwuqTKCcNbr1TIFRMaxoWQElKew/F6Bo5LPjY8XdkphGmXPwUBH916LfOhQ5
 rK7ls+5F9RiRE7hN6V/acBEF7evVuF5i1WnGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680104308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjRFa9g3onI1kC4K0Bhev7+GmSoMwaeDzlNBL5jHj68=;
 b=vQ50wvMY7+MCU/0n7OvTWBpOxCzO5PKalRLZfdvenOrLgsor2nv18Y5RCfoP5XpiyD
 GeSY7jVTSVrSM2ohlTHvGVkSM3NeLb41oPpFKqxD2dWX/pgoLYLkP4H/sXJnhgaZx33E
 cE5fPBpSv5Q2pT/LITsBhW/wtBEhF12t1K5F3jw7QcaECX8a1eXn/usHJolQXQewUtji
 azvVKwjvA2F+grKZi8cVXb8nCBWTOS5UWUt5B7+BWR3riwFD+zQjoJBpsK9/+R8B4m21
 KXO8dvQFfFWPKnGTaHHc9heArx1eUUl04T+rqVy0UIvhPXPJhgn3wMkFtraCjFZ69Vdr
 8IKQ==
X-Gm-Message-State: AAQBX9cACddQvtdgv5N00+xy3AnZgbrhy28ifPH+sGmKx7O9mdkGygJH
 dsERa7Uf1GcVzMC8SBPVvgvO7MapwL+WJmtdSS49Cg==
X-Google-Smtp-Source: AKy350YYUvrbMDF7TvuD73hFUqxg7MO1EfxmBpZ8yOwn2fCl7O3CFbZEtrIBZxvqLWsEjX5aIvD6D8tDlprGjyT23Xg=
X-Received: by 2002:a05:690c:b94:b0:541:698b:7bdb with SMTP id
 ck20-20020a05690c0b9400b00541698b7bdbmr1644187ywb.2.1680104308357; Wed, 29
 Mar 2023 08:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <20230329131929.1328612-3-jagan@amarulasolutions.com>
 <20230329145939.7zcex4x2pipivuj4@penduick>
In-Reply-To: <20230329145939.7zcex4x2pipivuj4@penduick>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 21:08:17 +0530
Message-ID: <CAMty3ZDWK0xVe7E+gER+TihHf1yv3YAWgZc1GCJQ2V5KD_mN-g@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] drm: sun4: dsi: Convert to bridge driver
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 8:29=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> Hi,
>
> The patch prefix should be drm/sun4i:

I did follow my previous prefix, I will update this.

>
> On Wed, Mar 29, 2023 at 06:49:29PM +0530, Jagan Teki wrote:
> > Convert the encoder to bridge driver in order to standardize on a
> > single API by supporting all varients of downstream bridge devices.
>
> Which variant, and why do we need to convert to a bridge to support all o=
f them?

Downstream bridge variants like DSI panel, DSI bridge and
I2C-Configured DSI bridges. Bridge conversion would be required for
the DSI host to access the more variety and complex downstream bridges
in a standardized bridge chain way which is indeed complex for encoder
driven DSI hosts.

>
> > The drm_encoder can't be removed as it's exposed to userspace, so it
> > then becomes a dumb encoder, without any operation implemented.
> >
> > Tested on DSI Panel, DSI Bridge, I2C-Configured DSI Bridge.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> [...]
>
> > +static const struct component_ops sun6i_dsi_ops;
> > +
> >  static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> >                           struct mipi_dsi_device *device)
> >  {
> >       struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> > -     struct drm_panel *panel =3D of_drm_find_panel(device->dev.of_node=
);
>
> That one looks unrelated. Why do you need that change?

This was replaced with drmm_of_dsi_get_bridge for lookup of both panel
and bridge. I think I will separate this into another patch.

Thanks,
Jagan.
