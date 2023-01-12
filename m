Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1D666AA7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 06:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E7910E873;
	Thu, 12 Jan 2023 05:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287C710E873
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 05:08:06 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id p9so8562503iod.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jh12tmNLmhb1OnKgUYkRMPDW2mygi0EIvrRRXI50tXs=;
 b=fb3lIBVeWwwRextTHiK1gp7PtClYIqS2sXPPiOrUElG4bRbSNCRcHQmfkrqhZIHEXG
 13IgfR12eAA0QDzrhIWwVu+Dhx77yNRoxZ++RRtcxJrhgb6UEoHHWl2ndcpeEFl967eX
 y+A9IfXHbGDDmZ0BCCvO7C1VQedUfnIvSMUvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jh12tmNLmhb1OnKgUYkRMPDW2mygi0EIvrRRXI50tXs=;
 b=0lmA2DlLKUlp0ce1mB5kfYTTAHXFDbPHgqAZbC5h0ff87ZomVbjg6DdxawCIVNQYoa
 mBPqDbtwgkgRGmjSjIKtxiQxEmZJNbe/UCioJM9L9IxiZBmxCtau4hN1Lu3/DT0Tgbjm
 gikgCjVm0YUd3sLTr+J3mLp+sXjbiTsz2Fsr9nJB855AhuMTaTF9itOpo2L/7HmfUxJi
 6VrRDdXxgbGhOc8Es6gXoFT0blvIVrfyH8ZcnuPfmylvLYa7bG7Z2VoGMRqTwQi6HpQg
 J/OcoGODyhlnYE1wrZBCpPM5nKaUDlncKxYu8GzAc23nVQxz8Pr73nQpxC0XnoyRJ+Uy
 3OZw==
X-Gm-Message-State: AFqh2koNorm08TkaYu6PbqSDB/PN+UvL2E4tiu8MHhxBL5pbBOdxUMYK
 3k1ZibUoX0WAJPzZTmr3e4nhqmF+DLJ8pJwIgkIqJw==
X-Google-Smtp-Source: AMrXdXvtSakCSG+vvcHya43d56b1WXoGfexMsa7UOT6VgRISZq9Vz8XlFbhcAobzfgZRl06IteKU/yZJHASpwe0/Zhc=
X-Received: by 2002:a6b:7a0a:0:b0:6e9:b3db:b5ce with SMTP id
 h10-20020a6b7a0a000000b006e9b3dbb5cemr6904887iom.179.1673500085158; Wed, 11
 Jan 2023 21:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
 <61ba2880-6784-1014-a7a2-a1eecc4e810e@linaro.org>
In-Reply-To: <61ba2880-6784-1014-a7a2-a1eecc4e810e@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 12 Jan 2023 13:07:54 +0800
Message-ID: <CAEXTbpeFJ-DuxuDk=QbC-hh+KayNY8rpEi7Q6zPge6PRhxkO0w@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] Register Type-C mode-switch in DP bridge endpoints
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 shaomin Deng <dengshaomin@cdjrlc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Thu, Jan 12, 2023 at 12:34 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/01/2023 06:20, Pin-yen Lin wrote:
> >
> > This series introduces bindings for anx7625/it6505 to register Type-C
> > mode-switch in their output endpoints, and use data-lanes property to
> > describe the pin connections.
>
> Please cc everybody on all patches. Having received just a single patch
> made me spend time on having to look them up on lore.

Sorry about that. I'll prevent that in the future series.

>
> >
> > The first two patch modifies fwnode_graph_devcon_matches and
> > cros_typec_init_ports to enable the registration of the switches.
> >
> > Patch 4~6 introduce the bindings for anx7625 and the corresponding driver
> > modifications.
> >
> > Patch 7~9 add similar bindings and driver changes for it6505.
> >
> > v9: https://lore.kernel.org/all/20230109084101.265664-1-treapking@chromium.org/
> > v8: https://lore.kernel.org/all/20230107102231.23682-1-treapking@chromium.org/
> > v7: https://lore.kernel.org/all/20230105132457.4125372-1-treapking@chromium.org/
> > v6: https://lore.kernel.org/all/20221124102056.393220-1-treapking@chromium.org/
> > v5: https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@chromium.org/
> >
> > Changes in v10:
> > - Collected Reviewed-by and Tested-by tags
> > - Replaced "void *" with "typec_mux_set_fn_t" for mux_set callbacks
> > - Print out the node name when errors on parsing DT
> > - Use dev_dbg instead of dev_warn when no Type-C switch nodes available
> > - Made the return path of drm_dp_register_mode_switch clearer
> > - Added a TODO for implementing orientation switch for anx7625
> > - Updated the commit message for the absence of orientation switch
> > - Fixed typo in the commit message
> >
> > Changes in v9:
> > - Collected Reviewed-by tag
> > - Fixed subject prefix again
> > - Changed the naming of the example node for it6505
> >
> > Changes in v8:
> > - Fixed the build issue when CONFIG_TYPEC=m
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
> >    the latest drm-misc patches
> > - Changed the driver implementation to accommodate with the new binding
> > - Dropped typec-switch binding and use endpoints and data-lanes properties
> >    to describe the pin connections
> > - Added new patches (patch 1,2,4) to fix probing issues
> > - Changed the bindings of it6505/anx7625 and modified the drivers
> >    accordingly
> > - Merged it6505/anx7625 driver changes into a single patch
> >
> > Pin-yen Lin (7):
> >    drm/display: Add Type-C switch helpers
> >    dt-bindings: display: bridge: anx7625: Add mode-switch support
> >    drm/bridge: anx7625: Check for Type-C during panel registration
> >    drm/bridge: anx7625: Register Type C mode switches
> >    dt-bindings: display: bridge: it6505: Add mode-switch support
> >    drm/bridge: it6505: Fix Kconfig indentation
> >    drm/bridge: it6505: Register Type C mode switches
> >
> > Prashant Malani (2):
> >    device property: Add remote endpoint to devcon matcher
> >    platform/chrome: cros_ec_typec: Purge blocking switch devlinks
> >
> >   .../display/bridge/analogix,anx7625.yaml      |  99 ++++++++++++-
> >   .../bindings/display/bridge/ite,it6505.yaml   |  93 ++++++++++--
> >   drivers/base/property.c                       |  15 ++
> >   drivers/gpu/drm/bridge/Kconfig                |  21 +--
> >   drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
> >   drivers/gpu/drm/bridge/analogix/anx7625.c     | 105 +++++++++++++-
> >   drivers/gpu/drm/bridge/analogix/anx7625.h     |  13 ++
> >   drivers/gpu/drm/bridge/ite-it6505.c           | 119 +++++++++++++++-
> >   drivers/gpu/drm/display/drm_dp_helper.c       | 134 ++++++++++++++++++
> >   drivers/platform/chrome/cros_ec_typec.c       |  10 ++
> >   include/drm/display/drm_dp_helper.h           |  17 +++
> >   11 files changed, 598 insertions(+), 29 deletions(-)
> >
>
> --
> With best wishes
> Dmitry
>

Thanks and regards,
Pin-yen
