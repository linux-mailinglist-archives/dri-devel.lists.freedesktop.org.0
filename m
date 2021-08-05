Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800C3E1498
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 14:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F086E85A;
	Thu,  5 Aug 2021 12:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826536E85A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 12:19:29 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x14so8030020edr.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CbCDXu5F8o2pipEqw/ORWrNWtlk7d/lKZiGIharZTQM=;
 b=kM2TkqugolbKb2wWPw/UbONB57ocZI7YH4TyRJ2eXd2RFOwvDyGNqHNPmL5WPy2V80
 Uxhi1O2dCD6R38Z/tgApAWKKjjz8zNWMcgsYfsEuGeYU2wUDy7mxypU54CVC7Wp2cLqo
 b7CeGV1+LMABJ696DiURwEASBQiLvOmr753iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CbCDXu5F8o2pipEqw/ORWrNWtlk7d/lKZiGIharZTQM=;
 b=C0vL/SI88iaCQwq6RUiC3TZPRaLjuyB7o/YxNfalvmUdw6+lZ23jvSqqMEiyVVQPwL
 1a8qt/t/O1BkA0aWnm00LSyUZ4TLqfRTbiJjc85v7sxKZpfrMnapo26FeOLusFkMItxB
 TXTAW45RNU1UxB7x6jlrRk/5/JMtagwOlNe3nlqfHQd0rcGdzctLZjhvEDdtv2XIaxG3
 n6h1xJPP0XwLoUPIcpwwRt4UJz9gWVzh0gbvpJvq0uOdXOOU17rjoxdyUvQvzxSxv7Lz
 bZ6zW0d5tN8sr3eDHmzya7Qs+VIyMZePtNwzi+PuNkuUeayT+Mk6DvURXdV6V9pTjCQG
 jkzw==
X-Gm-Message-State: AOAM530yGrco8KlEmFCHz8zZu3Jt2mWrsm8qLfl+oV0wa6fpYd44XR0f
 kYFhHpgM0OP4B1wMSYX+K+iBFpBS4i0tDzZi7eoxYA==
X-Google-Smtp-Source: ABdhPJyP0Qv/iLG1/KORL16r4bbOe3/ozpue/t2zcmGeQVqgFJTrdQdJ/+AMBerjj1wQuO5M31Lo7Pu2+oKsAxA4/Bc=
X-Received: by 2002:a05:6402:cab:: with SMTP id
 cn11mr6050890edb.369.1628165967971; 
 Thu, 05 Aug 2021 05:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-5-maxime@cerno.tech>
 <CAMty3ZD5rpYHtW-Rs4i=XvBmiVEaeWNu1j=QE3mFJTjSPJTpxQ@mail.gmail.com>
 <20210728133531.yzamhx5fhrofxwee@gilmour>
In-Reply-To: <20210728133531.yzamhx5fhrofxwee@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 5 Aug 2021 17:49:16 +0530
Message-ID: <CAMty3ZBbsSdmgVgwaWuAhGiyLAKN8tLfOUE-MFmRtniWcEAM7Q@mail.gmail.com>
Subject: Re: [PATCH 04/10] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
To: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, Jul 28, 2021 at 7:05 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Jagan,
>
> On Tue, Jul 27, 2021 at 03:12:09PM +0530, Jagan Teki wrote:
> > On Tue, Jul 20, 2021 at 7:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Interactions between bridges, panels, MIPI-DSI host and the component
> > > framework are not trivial and can lead to probing issues when
> > > implementing a display driver. Let's document the various cases we need
> > > too consider, and the solution to support all the cases.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  Documentation/gpu/drm-kms-helpers.rst |  6 +++
> > >  drivers/gpu/drm/drm_bridge.c          | 60 +++++++++++++++++++++++++++
> > >  2 files changed, 66 insertions(+)
> > >
> > > diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> > > index 10f8df7aecc0..ec2f65b31930 100644
> > > --- a/Documentation/gpu/drm-kms-helpers.rst
> > > +++ b/Documentation/gpu/drm-kms-helpers.rst
> > > @@ -157,6 +157,12 @@ Display Driver Integration
> > >  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> > >     :doc: display driver integration
> > >
> > > +Special Care with MIPI-DSI bridges
> > > +----------------------------------
> > > +
> > > +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> > > +   :doc: special care dsi
> > > +
> > >  Bridge Operations
> > >  -----------------
> > >
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index c9a950bfdfe5..81f8dac12367 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -95,6 +95,66 @@
> > >   * documentation of bridge operations for more details).
> > >   */
> > >
> > > +/**
> > > + * DOC: special care dsi
> > > + *
> > > + * The interaction between the bridges and other frameworks involved in
> > > + * the probing of the display driver and the bridge driver can be
> > > + * challenging. Indeed, there's multiple cases that needs to be
> > > + * considered:
> > > + *
> > > + * - The display driver doesn't use the component framework and isn't a
> > > + *   MIPI-DSI host. In this case, the bridge driver will probe at some
> > > + *   point and the display driver should try to probe again by returning
> > > + *   EPROBE_DEFER as long as the bridge driver hasn't probed.
> > > + *
> > > + * - The display driver doesn't use the component framework, but is a
> > > + *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> > > + *   controlled. In this case, the bridge device is a child of the
> > > + *   display device and when it will probe it's assured that the display
> > > + *   device (and MIPI-DSI host) is present. The display driver will be
> > > + *   assured that the bridge driver is connected between the
> > > + *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operations.
> > > + *   Therefore, it must run mipi_dsi_host_register() in its probe
> > > + *   function, and then run drm_bridge_attach() in its
> > > + *   &mipi_dsi_host_ops.attach hook.
> > > + *
> > > + * - The display driver uses the component framework and is a MIPI-DSI
> > > + *   host. The bridge device uses the MIPI-DCS commands to be
> > > + *   controlled. This is the same situation than above, and can run
> > > + *   mipi_dsi_host_register() in either its probe or bind hooks.
> > > + *
> > > + * - The display driver uses the component framework and is a MIPI-DSI
> > > + *   host. The bridge device uses a separate bus (such as I2C) to be
> > > + *   controlled. In this case, there's no correlation between the probe
> > > + *   of the bridge and display drivers, so care must be taken to avoid
> > > + *   an endless EPROBE_DEFER loop, with each driver waiting for the
> > > + *   other to probe.
> > > + *
> > > + * The ideal pattern to cover the last item (and all the others in the
> > > + * display driver case) is to split the operations like this:
> > > + *
> > > + * - In the display driver must run mipi_dsi_host_register() and
> > > + *   component_add in its probe hook. It will make sure that the
> > > + *   MIPI-DSI host sticks around, and that the driver's bind can be
> > > + *   called.
> > > + *
> > > + * - In its probe hook, the bridge driver must not try to find its
> > > + *   MIPI-DSI host or register as a MIPI-DSI device. As far as the
> > > + *   framework is concerned, it must only call drm_bridge_add().
> > > + *
> > > + * - In its bind hook, the display driver must try to find the bridge
> > > + *   and return -EPROBE_DEFER if it doesn't find it. If it's there, it
> > > + *   must call drm_bridge_attach(). The MIPI-DSI host is now functional.
> >
> > There is an another problem occur for this scenario in the case of kms
> > hotplug driver, sun6i_mipi_dsi.c. When host attach wait till drm
> > device pointer found and drm device pointer would found only when bind
> > done, and bind would complete only when &drm_bridge_funcs.attach hooks
> > are complete. But, If DSI driver is fully bridge driven then this
> > attach in bind will trigger panel_bridge hook attach and at this point
> > we cannot get panel_bridge at all which indeed second attach would
> > would failed.
> >
> > This is one of the reason I'm trying to use drm_bridge_attach host
> > attach itself instead of component bind, not yet succeeded.
>
> I'm not really sure what you mean, but if you mention the code we have
> in the DSI driver to make sure we can probe without our panel, then it's
> not something that we really can support. Bridges cannot be hotplugged
> in DRM and having some inconsistencies between drivers (since none of
> them behave the same way there) and between what's plugged on the other
> side of the DSI bus feels weird.

Yes, but for associated bridges to attach on component base DSI
drivers the panel_bridge or bridge pointer look necessary.

Here is the pseudo code for sun6i_mipi_dsi which support the DSI probe
without panel, by waiting for drm pointer to found, but the same seems
not possible for bridge cases.

static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
                                   enum drm_bridge_attach_flags flags)
{
        return drm_bridge_attach(bridge->encoder, dsi->bridge, bridge, flags);
}

static int sun6i_dsi_attach(struct mipi_dsi_host *host,
                            struct mipi_dsi_device *device)
{
   ...
   if (!dsi->drm || !dsi->drm->registered)
                return -EPROBE_DEFER;

   panel = of_drm_find_panel(device->dev.of_node);
        if (IS_ERR(panel)) {
                panel = NULL;

                bridge = of_drm_find_bridge(device->dev.of_node);
                if (IS_ERR(bridge)) {
                        dev_err(dsi->dev, "failed to find bridge\n");
                        return PTR_ERR(bridge);
                }
        } else {
                bridge = NULL;
    }

    dsi->panel = panel;
    dsi->bridge = bridge;
    ....
}

static int sun6i_dsi_bind(struct device *dev, struct device *master,
                         void *data)
{
   ...
   ret = drm_bridge_attach(&dsi->encoder, dsi->bridge, NULL, 0);
   ..
   dsi->drm = drm;
}

I believe some-sort bridge handling in hotpulg would necessary to keep
the hotplug probing happens for bridge pointers as well.

Thanks,
Jagan.
