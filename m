Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A668D3BD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ED210E10D;
	Tue,  7 Feb 2023 10:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF28310E10D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 10:11:29 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id k17so3062998ilq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 02:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGLVt33QptT1V9qlTmndDyVUdkEPlh9MnwGhnG7S+Dw=;
 b=DdPR3zQi3FaRq/0DUytEr3pdQZJXEYAcVrcD7V59G77SlXPd4u49tC+gyGBwFJPFYy
 67/fa4FaZDJ7/nKp9i2do2fWQFcMfJbHpGPfUq6HvZUZF4UBEooUGXVzWBqMFMEnYZwN
 rAaICWHuS5XF+Lo2bO8pVyMaqko727E+MSi7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGLVt33QptT1V9qlTmndDyVUdkEPlh9MnwGhnG7S+Dw=;
 b=bT20z87YKIhxO4sB6ef5CturUacGssjEuS4oE1an+TRx81RUmdrMxfUSQFPG+aF8FQ
 O3n4dW+SC2IkojrRjkFmMkgtgvN9gRCovMN6aKrPuXSFCLr/+pPcizsx119NLUFnip/E
 dET71AmV//9kkQxtfEjNH/fLQYV6GTs/f8Omr6aHjQpHyJsZf1z7LcGNLCq39mVI5aFC
 Y6aM2oBAU2LQhJaCd3s2i5D3raqGU8Sc45iHWfcT79Oo3zW3HYqteeXVrE4BMhEgJ7RB
 Qq12IKMF/aqNY7keBWTKM+wJB0RAk921GFD3+YhYcjIRX5fD12ItCKWFHD6pe0kPuyAp
 2siA==
X-Gm-Message-State: AO0yUKU8zzDv7a3CUl6HNA/cZeYdMm9LFL7c/JoHm/FkjVK7r2q0el0z
 KiJvM5V43B+cUIDsRvynhyVGhHh34Nls25yGGl9I0w==
X-Google-Smtp-Source: AK7set+p9iSJUXF22CkwOZYUk1RTPFJALAKMX1xeE+pdWvWYe6DHfPcl7VfcfJVnxubu8xcpOm0LxJ22zFQvIXxeTUg=
X-Received: by 2002:a92:4412:0:b0:310:fd95:6d81 with SMTP id
 r18-20020a924412000000b00310fd956d81mr1835895ila.42.1675764689078; Tue, 07
 Feb 2023 02:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org>
 <e620862840bcac9dcd46dd63e247966424af060f.camel@redhat.com>
In-Reply-To: <e620862840bcac9dcd46dd63e247966424af060f.camel@redhat.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 7 Feb 2023 18:11:18 +0800
Message-ID: <CAEXTbpcEo1O3YYWjdYKMEotir8KoDEvsRtcD4SOvjGB08vhZ_Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] Register Type-C mode-switch in DP bridge endpoints
To: Lyude Paul <lyude@redhat.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude,

Thanks for letting me know!

I just sent out a v11 and already received some review comments, but
reviews are always welcomed if you have time to take a look.

Regards,
Pin-yen

On Tue, Jan 31, 2023 at 7:10 AM Lyude Paul <lyude@redhat.com> wrote:
>
> Don't know if this still needs reviews from me (feel free to respond if i=
t
> does!), but I wanted to say nice work! This is something I've wanted to s=
ee
> added to DRM for a while =E2=99=A5
>
>
> On Mon, 2023-01-09 at 16:40 +0800, Pin-yen Lin wrote:
> > This series introduces bindings for anx7625/it6505 to register Type-C
> > mode-switch in their output endpoints, and use data-lanes property to
> > describe the pin connections.
> >
> > The first two patch modifies fwnode_graph_devcon_matches and
> > cros_typec_init_ports to enable the registration of the switches.
> >
> > Patch 4~6 introduce the bindings for anx7625 and the corresponding driv=
er
> > modifications.
> >
> > Patch 7~9 add similar bindings and driver changes for it6505.
> >
> > v7: https://lore.kernel.org/all/20230105132457.4125372-1-treapking@chro=
mium.org/
> > v6: https://lore.kernel.org/all/20221124102056.393220-1-treapking@chrom=
ium.org/
> > v5: https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@=
chromium.org/
> >
> > Changes in v9:
> > - Collected Reviewed-by tag
> > - Fixed subject prefix again
> > - Changed the naming of the example node for it6505
> >
> > Changes in v8:
> > - Fixed the build issue when CONFIG_TYPEC=3Dm
> > - Fixed some style issues
> > - Fixed the subject prefixes for the bindings patch
> > - Fixed the bindings for data-lanes properties
> >
> > Changes in v7:
> > - Fix the long comment lines
> > - Extracted the common codes to a helper function
> > - Fixed style issues in anx7625 driver
> > - Removed DT property validation in anx7625 driver.
> > - Fixed style issues in it6505 driver
> > - Removed the redundant sleep in it6505 driver
> > - Removed DT property validation in it6505 driver
> > - Rebased to drm-misc-next
> > - Fixed indentations in bindings patches
> > - Added a new patch to fix indentations in Kconfig
> >
> > Changes in v6:
> > - Changed it6505_typec_mux_set callback function to accommodate with
> >   the latest drm-misc patches
> > - Changed the driver implementation to accommodate with the new binding
> > - Dropped typec-switch binding and use endpoints and data-lanes propert=
ies
> >   to describe the pin connections
> > - Added new patches (patch 1,2,4) to fix probing issues
> > - Changed the bindings of it6505/anx7625 and modified the drivers
> >   accordingly
> > - Merged it6505/anx7625 driver changes into a single patch
> >
> > Pin-yen Lin (7):
> >   drm/display: Add Type-C switch helpers
> >   dt-bindings: display: bridge: anx7625: Add mode-switch support
> >   drm/bridge: anx7625: Check for Type-C during panel registration
> >   drm/bridge: anx7625: Register Type C mode switches
> >   dt-bindings: display: bridge: it6505: Add mode-switch support
> >   drm/bridge: it6505: Fix Kconfig indentation
> >   drm/bridge: it6505: Register Type C mode switches
> >
> > Prashant Malani (2):
> >   device property: Add remote endpoint to devcon matcher
> >   platform/chrome: cros_ec_typec: Purge blocking switch devlinks
> >
> >  .../display/bridge/analogix,anx7625.yaml      |  99 ++++++++++++-
> >  .../bindings/display/bridge/ite,it6505.yaml   |  93 ++++++++++--
> >  drivers/base/property.c                       |  15 ++
> >  drivers/gpu/drm/bridge/Kconfig                |  21 +--
> >  drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
> >  drivers/gpu/drm/bridge/analogix/anx7625.c     | 101 +++++++++++++-
> >  drivers/gpu/drm/bridge/analogix/anx7625.h     |  13 ++
> >  drivers/gpu/drm/bridge/ite-it6505.c           | 119 +++++++++++++++-
> >  drivers/gpu/drm/display/drm_dp_helper.c       | 132 ++++++++++++++++++
> >  drivers/platform/chrome/cros_ec_typec.c       |  10 ++
> >  include/drm/display/drm_dp_helper.h           |  16 +++
> >  11 files changed, 591 insertions(+), 29 deletions(-)
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>
