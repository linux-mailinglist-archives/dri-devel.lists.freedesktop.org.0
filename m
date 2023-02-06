Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22A68B77D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 09:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C24010E31F;
	Mon,  6 Feb 2023 08:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D41310E31F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 08:40:20 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id m1so10000000vst.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 00:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bxGBUMpZ6MlCuOf4ZGY5be1Z/6HawqxmEV6A7eKd+x8=;
 b=eb4aSDL3eeoPKmPKagfqCIsDqkldstB0QqhkBdstr/XyIHyHdDPeWkcERZl4gZP4wW
 aYh0I54j0tapjkNd4VT8+FGZJFNpZ0ySFiXDxg9vYibrt5bZt21LE1q6a++C7CFmbdRc
 AtL+ZeigRmZ3hIG2gZ3K2kRFcgoJVA130tk68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bxGBUMpZ6MlCuOf4ZGY5be1Z/6HawqxmEV6A7eKd+x8=;
 b=JZuth7gzrHKH+yKQ616sCwiLx0YGRGAUhz7PSod6CJS6vG5epjBI4eTauCoeiqMPN2
 cL+vdCiQgdNPk6YSQiuaey2YaLtTVXSI345JdmXk4zxgE6PkBKl+I6Vj/tARavQsdRx6
 OVOlbFfF4UzK+8kfRNevRW1PVUKw/8zj5eZRCssu2TfLnRC+/2kvTfy+29Lg9lUNp+So
 dURPwESvOfA9zuHjZ0avuWkEqo5Otey7rqtnd+VeoyDCU3wsbi4LvYN7Cd2Zp0RwRr+f
 hLoYmdiEetwx1I/wU2d2wOTwu1VeK8W6f+t6pWUWLknZdfFFa3gfx0GvmHmyw9Upp83e
 5uJg==
X-Gm-Message-State: AO0yUKVAKjRYKqwPCTOvGCLRas9IsS33/pdad+K2QeZQGkhB4/n+RXGo
 QbdiPovF5RPq3brMeCvtqrB2CCejgHKfdkLdRSU20A==
X-Google-Smtp-Source: AK7set/Nc+tRekf0h+tZTWStnrZoa/GmrslGQquHlfY8WRs6V9iTEWlJuxYA3EIydNHfm7RtpJMuutQEZD210Ih9vcw=
X-Received: by 2002:a05:6102:322a:b0:3fe:ae88:d22 with SMTP id
 x10-20020a056102322a00b003feae880d22mr2856750vsf.65.1675672819238; Mon, 06
 Feb 2023 00:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
In-Reply-To: <20230204133040.1236799-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Feb 2023 16:40:07 +0800
Message-ID: <CAGXv+5FW8qYnBYJsf+gLEaEGnwunPFdjjVF9YUqDqCVAjXWuKA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] Register Type-C mode-switch in DP bridge endpoints
To: Pin-yen Lin <treapking@chromium.org>
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
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 4, 2023 at 9:30 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
>
> This series introduces bindings for anx7625/it6505 to register Type-C
> mode-switch in their output endpoints, and use data-lanes property to
> describe the pin connections.
>
> This series is not directly related to the built-in mux in anx7625,
> which automatically switches between the two orientations of a single
> Type-C connector. This series adds support of registering mode switches
> for two downstream devices, while we use orientation switches for two
> orientations of the Type-C connector.
>
> The first two patch modifies fwnode_graph_devcon_matches and
> cros_typec_init_ports to enable the registration of the switches.
>
> Patch 4~6 introduce the bindings for anx7625 and the corresponding driver
> modifications.
>
> Patch 7~9 add similar bindings and driver changes for it6505.
>
> v10: https://lore.kernel.org/all/20230112042104.4107253-1-treapking@chromium.org/
> v9: https://lore.kernel.org/all/20230109084101.265664-1-treapking@chromium.org/
> v8: https://lore.kernel.org/all/20230107102231.23682-1-treapking@chromium.org/
> v7: https://lore.kernel.org/all/20230105132457.4125372-1-treapking@chromium.org/
> v6: https://lore.kernel.org/all/20221124102056.393220-1-treapking@chromium.org/
> v5: https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@chromium.org/
>
> Changes in v11:
> - Added missing fwnode_handle_put in drivers/base/property.c
> - Collected Acked-by tag
> - Use fwnode helpers instead of DT
> - Moved the helpers to a new file
> - Use "reg" instead of "data-lanes" to determine the port number
> - Updated the description of the endpoints in the bindings
> - Referenced video-interfaces.yaml instead for the endpoints binding
> - Removed duplicated definitions from inherited schema
> - Moved the "data-lanes" parsing logics to bridge drivers
> - Removed Kconfig dependencies for the bridge drivers
> - Updated the usage of the private bridge driver data
> - Added a clarification on the anx7625 built-in mux in the cover letter
>
> Changes in v10:
> - Collected Reviewed-by and Tested-by tags
> - Replaced "void *" with "typec_mux_set_fn_t" for mux_set callbacks
> - Print out the node name when errors on parsing DT
> - Use dev_dbg instead of dev_warn when no Type-C switch nodes available
> - Made the return path of drm_dp_register_mode_switch clearer
> - Added a TODO for implementing orientation switch for anx7625
> - Updated the commit message for the absence of orientation switch
> - Fixed typo in the commit message
>
> Changes in v9:
> - Collected Reviewed-by tag
> - Fixed subject prefix again
> - Changed the naming of the example node for it6505
>
> Changes in v8:
> - Fixed the build issue when CONFIG_TYPEC=m
> - Fixed some style issues
> - Fixed the subject prefixes for the bindings patch
> - Fixed the bindings for data-lanes properties
>
> Changes in v7:
> - Fix the long comment lines
> - Extracted the common codes to a helper function
> - Fixed style issues in anx7625 driver
> - Removed DT property validation in anx7625 driver.
> - Fixed style issues in it6505 driver
> - Removed the redundant sleep in it6505 driver
> - Removed DT property validation in it6505 driver
> - Rebased to drm-misc-next
> - Fixed indentations in bindings patches
> - Added a new patch to fix indentations in Kconfig
>
> Changes in v6:
> - Changed it6505_typec_mux_set callback function to accommodate with
>   the latest drm-misc patches
> - Changed the driver implementation to accommodate with the new binding
> - Dropped typec-switch binding and use endpoints and data-lanes properties
>   to describe the pin connections
> - Added new patches (patch 1,2,4) to fix probing issues
> - Changed the bindings of it6505/anx7625 and modified the drivers
>   accordingly
> - Merged it6505/anx7625 driver changes into a single patch
>
> Pin-yen Lin (7):
>   drm/display: Add Type-C switch helpers
>   dt-bindings: display: bridge: anx7625: Add mode-switch support
>   drm/bridge: anx7625: Check for Type-C during panel registration
>   drm/bridge: anx7625: Register Type C mode switches
>   dt-bindings: display: bridge: it6505: Add mode-switch support
>   drm/bridge: it6505: Fix Kconfig indentation
>   drm/bridge: it6505: Register Type C mode switches
>
> Prashant Malani (2):
>   device property: Add remote endpoint to devcon matcher
>   platform/chrome: cros_ec_typec: Purge blocking switch devlinks

Whole series is

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8192-based Hayato for anx7625 and not-yet-upstreamed MT8186 device
for it6505.
