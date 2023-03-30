Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C4B6CFBD2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 08:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8A310E10D;
	Thu, 30 Mar 2023 06:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FB110E10D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:46:02 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id i6so22291424ybu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 23:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680158761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9KvtDBDjnJJEqpcZjjyzTKCX1rkB36TxwhuGzvhZPc=;
 b=bt6C87APwyUX1JWG2oRItuviKVBrMHw3USsuZx8wsxFNZ16hHSgB9jqvVzth8JfDAc
 nCKeHwTTHh/atvFf0BOOJwm6q9GvyC/A8TnZcm+tFv6pwFpd1/6TQEFZrxrKImHm/vEF
 2Q6U14wyjnzNbfB7KrxWRBqOEAThwA7ExMtq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680158761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9KvtDBDjnJJEqpcZjjyzTKCX1rkB36TxwhuGzvhZPc=;
 b=eLEqH9yJN8Y/CANwwVzatUnNfpY+ukJJ26aX2fKZjeXmfZ62fUJfypjE4rowJNNdbH
 REEzbG0MbcrnCc2j3PmVmon+vEpXOjugGDR/RGzuox+mqNwspJgdvKC6hzNLLXVsMpEY
 6SdODSACykIhyAEfxflcgsCurfw3dg7AwwJnssZgf4aGcQlFEzE83k/3vZ6FZB4SwWIh
 i0kdq6di8sdFkPDjXoVVW5rdrDxxRnwgI8fdim8cS46xeMIwiXARxfrh1QnLzQcq1FcV
 0JQuhyCIAm7pbSX/8u8FNkKzZC5BGovjm45MHCL4pu4T2X3g2pkro9LXh2fykVOGyZoj
 jeag==
X-Gm-Message-State: AAQBX9cX0GXZ90EmE/qolasipykgl17ukFJTmna1QBke6j0AMI75Wgb1
 OYsg7FTNK+KfQe/JvTKmMXngc1zEL7Zvv/5k6fzzQg==
X-Google-Smtp-Source: AKy350akHF5ZJtdSHsp/EicclOQgIOG1PqepWwCthsk5hLwQa4/j37Q/HX7g3wekmsrvapGpdWWusB+vmhPMm/2t6q0=
X-Received: by 2002:a05:6902:1141:b0:b73:caa7:f06f with SMTP id
 p1-20020a056902114100b00b73caa7f06fmr14621745ybu.5.1680158761113; Wed, 29 Mar
 2023 23:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <20230329131929.1328612-3-jagan@amarulasolutions.com>
 <20230329145939.7zcex4x2pipivuj4@penduick>
 <CAMty3ZDWK0xVe7E+gER+TihHf1yv3YAWgZc1GCJQ2V5KD_mN-g@mail.gmail.com>
 <20230329160652.7gel5qvckzwihjx4@penduick>
In-Reply-To: <20230329160652.7gel5qvckzwihjx4@penduick>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 30 Mar 2023 12:15:49 +0530
Message-ID: <CAMty3ZB=R0RfU+o7LZWpS=4-ny00ocCxBu-M6yicY4q0-eYL9A@mail.gmail.com>
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

On Wed, Mar 29, 2023 at 9:36=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> On Wed, Mar 29, 2023 at 09:08:17PM +0530, Jagan Teki wrote:
> > On Wed, Mar 29, 2023 at 8:29=E2=80=AFPM Maxime Ripard <maxime@cerno.tec=
h> wrote:
> > >
> > > Hi,
> > >
> > > The patch prefix should be drm/sun4i:
> >
> > I did follow my previous prefix, I will update this.
> >
> > >
> > > On Wed, Mar 29, 2023 at 06:49:29PM +0530, Jagan Teki wrote:
> > > > Convert the encoder to bridge driver in order to standardize on a
> > > > single API by supporting all varients of downstream bridge devices.
> > >
> > > Which variant, and why do we need to convert to a bridge to support a=
ll of them?
> >
> > Downstream bridge variants like DSI panel, DSI bridge and
> > I2C-Configured DSI bridges. Bridge conversion would be required for
> > the DSI host to access the more variety and complex downstream bridges
> > in a standardized bridge chain way which is indeed complex for encoder
> > driven DSI hosts.
> >
> > >
> > > > The drm_encoder can't be removed as it's exposed to userspace, so i=
t
> > > > then becomes a dumb encoder, without any operation implemented.
> > > >
> > > > Tested on DSI Panel, DSI Bridge, I2C-Configured DSI Bridge.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > [...]
> > >
> > > > +static const struct component_ops sun6i_dsi_ops;
> > > > +
> > > >  static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> > > >                           struct mipi_dsi_device *device)
> > > >  {
> > > >       struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> > > > -     struct drm_panel *panel =3D of_drm_find_panel(device->dev.of_=
node);
> > >
> > > That one looks unrelated. Why do you need that change?
> >
> > This was replaced with drmm_of_dsi_get_bridge for lookup of both panel
> > and bridge. I think I will separate this into another patch.
>
> So, it looks to me that you're doing two (unrelated) things in that patch=
:

Correct.

>
>   - You modify the existing driver to be a bridge

Yes, Convert to bridge driver - register drm_bridge_add and replace
encoder ops with bridge ops.

>
>   - And you support downstream device being bridges.

Yes, Support the downstream bridge. (If I'm correct we can still use
encoder ops with this).

If we see the hierarchy of support it would
1. support the downstream bridge.
2. convert to the bridge driver.

>
> Both are orthogonal, can (and should!) be done separately, and I'm
> pretty sure you don't actually need to do the former at all.

Do you mean converting to bridge driver is not needed?

Thanks,
Jagan.
