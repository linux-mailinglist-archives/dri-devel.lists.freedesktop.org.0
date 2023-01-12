Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9BA668728
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A361210E94C;
	Thu, 12 Jan 2023 22:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EEF10E954
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 22:44:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AF61621DB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 22:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F60FC433A0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673563472;
 bh=RZLYtFJIoNIntNiCGOCc4lXxK6kyJFOWbJdlQl+orIw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Og3eCJpXAW9+ZU38sof7CYWlrMf7Rt6Bcb04DBOHbSKcTeD3ixNxj/ufyh/YOEKFA
 FZT9K/srjZ+rTDR6Ia7szASNz3c10bv+Ao/MvH/Oi57VWFx555XIIenukiESIzCw7m
 eqxlTlhfr689fZyep3R5ZqnHlepkB8Je0MT5dy4M5pglGR7u9D8eTNSqvnkTJwwBC/
 jH3EvLwBkaz9qKG/cF7IMZN7sDtNxEY0ar0nKookA4amAzPsXgfVRISaykLnx3Aw2p
 HmjR7bNa6AxvCQ7v0RltC3rlUH6USDdzSgNMug+vTNF9LzVx9t5jKkymxw/In/8TZU
 vGZp+ShjJNadg==
Received: by mail-ua1-f44.google.com with SMTP id f26so4650569uab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 14:44:32 -0800 (PST)
X-Gm-Message-State: AFqh2koEiUEAq5lVwgc4gV802Aqb2PgRBSa9VuQhooIiMeTCsV7759uL
 OZMMHt9OOT+m7cFff8e+NrwatJyruZh8KipxQg==
X-Google-Smtp-Source: AMrXdXtZFoVEyDLRv9F7lmdnJWvJEcg8OkSGQmcET+vTNr5A9PdUpV3f5sKnSRP8h0PLVSDCnsxex9XK6NUvoE/hp8Y=
X-Received: by 2002:ab0:76c1:0:b0:419:145a:dd46 with SMTP id
 w1-20020ab076c1000000b00419145add46mr8969043uaq.77.1673563471032; Thu, 12 Jan
 2023 14:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
In-Reply-To: <20230112042104.4107253-1-treapking@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 12 Jan 2023 16:44:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+KGQH2qTpB6NmmOzid39-oKTzZZJNPF1ybKQu72LbJLw@mail.gmail.com>
Message-ID: <CAL_Jsq+KGQH2qTpB6NmmOzid39-oKTzZZJNPF1ybKQu72LbJLw@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] Register Type-C mode-switch in DP bridge endpoints
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
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 shaomin Deng <dengshaomin@cdjrlc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 10:21 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
>
> This series introduces bindings for anx7625/it6505 to register Type-C
> mode-switch in their output endpoints, and use data-lanes property to
> describe the pin connections.
>
> The first two patch modifies fwnode_graph_devcon_matches and
> cros_typec_init_ports to enable the registration of the switches.
>
> Patch 4~6 introduce the bindings for anx7625 and the corresponding driver
> modifications.
>
> Patch 7~9 add similar bindings and driver changes for it6505.
>
> v9: https://lore.kernel.org/all/20230109084101.265664-1-treapking@chromium.org/
> v8: https://lore.kernel.org/all/20230107102231.23682-1-treapking@chromium.org/
> v7: https://lore.kernel.org/all/20230105132457.4125372-1-treapking@chromium.org/
> v6: https://lore.kernel.org/all/20221124102056.393220-1-treapking@chromium.org/
> v5: https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@chromium.org/
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

4 versions in a week! Please slow down your pace. When you send a new
version, you move to the end of my review queue.

IIRC, these 2 chips are a bit different in what the mode switch or
muxing looks like. One had a built-in mux and the other doesn't? Do I
have to go research this again? No, you need to explain all this in
this series.

Rob
