Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5B73D722C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A516E8FC;
	Tue, 27 Jul 2021 09:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDA16E8FC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:42:21 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id f13so11784363edq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8fwQRqMvjgAY6jqV3zlS3GTvqGBBIFqRUeOfjbqNkn4=;
 b=Vgfr+F5s6Bc5u+uBdMFEhmPySf4LlqpmA8B3AA57fdSa5RwUSGJbIA6tW/1gVcaXOU
 Vo7X6tgClf+huAZ2z6IUZubQy5E7JzTpiWc2YEhbw46JuKlohm1vKn3zNdJG5ZAW8UAd
 UsIMO676lnPLuTnVA+C6Na7p2LQ0GHrw5luy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fwQRqMvjgAY6jqV3zlS3GTvqGBBIFqRUeOfjbqNkn4=;
 b=UUosxVHuTyXGDGYXLdFg53LYt2aXEPJ73X9uIDCzCREDNyGv5X6acrXNrmdNRc7JGj
 V/SHixQyxAOpzVgcSC9Re0wTLiGCTgO8m1BHOPmRIkoy0ofOhBFEt5ji8VokB3gvq5tu
 aTgO6guBINCeQASpmYP9YWkUwHGCglhe11fzdFxIsScMC8pKlmzNbWxUn7+1T3rp/8Gz
 XJrJfnO4/X6KAAkH2QK+yM9rAc65K9l8TUfFKaoOyR6n/jW3+NmpFlyb+myE6owDYHHE
 SfWu9eE3MIAjma1r8SKOl3rfOwhWZO1dPay2Zu4FRmBbM/ibA0o/O8OB99/8BrNBTWj9
 XflA==
X-Gm-Message-State: AOAM530vskO9HjaKniGi0T0HbOK7NdBG8Dk6i7WiugCJiASsf/qJ4Rnb
 LT2NIqwodlugUS/Sa0GGRU+pHnvtOyCwNsZW1EJteg==
X-Google-Smtp-Source: ABdhPJyeCw9Vo5e9UrsFOswe3Y1tnwFbw3IAOf1WcRCfMxjGuFl09sckUW6CTR3uJUSW6D+U6LZrWYW/ZJWeDClExRU=
X-Received: by 2002:a05:6402:430b:: with SMTP id
 m11mr7510996edc.55.1627378940202; 
 Tue, 27 Jul 2021 02:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-5-maxime@cerno.tech>
In-Reply-To: <20210720134525.563936-5-maxime@cerno.tech>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 27 Jul 2021 15:12:09 +0530
Message-ID: <CAMty3ZD5rpYHtW-Rs4i=XvBmiVEaeWNu1j=QE3mFJTjSPJTpxQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 7:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Interactions between bridges, panels, MIPI-DSI host and the component
> framework are not trivial and can lead to probing issues when
> implementing a display driver. Let's document the various cases we need
> too consider, and the solution to support all the cases.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/gpu/drm-kms-helpers.rst |  6 +++
>  drivers/gpu/drm/drm_bridge.c          | 60 +++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 10f8df7aecc0..ec2f65b31930 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -157,6 +157,12 @@ Display Driver Integration
>  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>     :doc: display driver integration
>
> +Special Care with MIPI-DSI bridges
> +----------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> +   :doc: special care dsi
> +
>  Bridge Operations
>  -----------------
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c9a950bfdfe5..81f8dac12367 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -95,6 +95,66 @@
>   * documentation of bridge operations for more details).
>   */
>
> +/**
> + * DOC: special care dsi
> + *
> + * The interaction between the bridges and other frameworks involved in
> + * the probing of the display driver and the bridge driver can be
> + * challenging. Indeed, there's multiple cases that needs to be
> + * considered:
> + *
> + * - The display driver doesn't use the component framework and isn't a
> + *   MIPI-DSI host. In this case, the bridge driver will probe at some
> + *   point and the display driver should try to probe again by returning
> + *   EPROBE_DEFER as long as the bridge driver hasn't probed.
> + *
> + * - The display driver doesn't use the component framework, but is a
> + *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> + *   controlled. In this case, the bridge device is a child of the
> + *   display device and when it will probe it's assured that the display
> + *   device (and MIPI-DSI host) is present. The display driver will be
> + *   assured that the bridge driver is connected between the
> + *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operations.
> + *   Therefore, it must run mipi_dsi_host_register() in its probe
> + *   function, and then run drm_bridge_attach() in its
> + *   &mipi_dsi_host_ops.attach hook.
> + *
> + * - The display driver uses the component framework and is a MIPI-DSI
> + *   host. The bridge device uses the MIPI-DCS commands to be
> + *   controlled. This is the same situation than above, and can run
> + *   mipi_dsi_host_register() in either its probe or bind hooks.
> + *
> + * - The display driver uses the component framework and is a MIPI-DSI
> + *   host. The bridge device uses a separate bus (such as I2C) to be
> + *   controlled. In this case, there's no correlation between the probe
> + *   of the bridge and display drivers, so care must be taken to avoid
> + *   an endless EPROBE_DEFER loop, with each driver waiting for the
> + *   other to probe.
> + *
> + * The ideal pattern to cover the last item (and all the others in the
> + * display driver case) is to split the operations like this:
> + *
> + * - In the display driver must run mipi_dsi_host_register() and
> + *   component_add in its probe hook. It will make sure that the
> + *   MIPI-DSI host sticks around, and that the driver's bind can be
> + *   called.
> + *
> + * - In its probe hook, the bridge driver must not try to find its
> + *   MIPI-DSI host or register as a MIPI-DSI device. As far as the
> + *   framework is concerned, it must only call drm_bridge_add().
> + *
> + * - In its bind hook, the display driver must try to find the bridge
> + *   and return -EPROBE_DEFER if it doesn't find it. If it's there, it
> + *   must call drm_bridge_attach(). The MIPI-DSI host is now functional.

There is an another problem occur for this scenario in the case of kms
hotplug driver, sun6i_mipi_dsi.c. When host attach wait till drm
device pointer found and drm device pointer would found only when bind
done, and bind would complete only when &drm_bridge_funcs.attach hooks
are complete. But, If DSI driver is fully bridge driven then this
attach in bind will trigger panel_bridge hook attach and at this point
we cannot get panel_bridge at all which indeed second attach would
would failed.

This is one of the reason I'm trying to use drm_bridge_attach host
attach itself instead of component bind, not yet succeeded.

Thanks,
Jagan.
