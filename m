Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E44C666A58
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 05:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E79510E86F;
	Thu, 12 Jan 2023 04:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1693710E86F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 04:34:56 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j17so26714475lfr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 20:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0JjWYRu/kVfVhVMQzk2HzUkqzGw62vTtAvDUcCRIg2Q=;
 b=xnCH+90vro8HMqVxbQWy0+QpP1RoJllaC7vgNWkMXosA1sjMcQG3WXug2Xm3w1gWDc
 54BbU2npxmYPjPpuB4OM00Jqjm+OGTqeM4yH6GTJgMDjBtfiZ2anhtAcR8WL+USGjN+w
 oPt5/OL1Gu24THz9dqppSYQ8wW3dkFnerIrZezOK87RIIyA89U29icART7QawzY+TyZr
 n6DFmUYUR3I4xTs3LtU+5DS3R4zrE/XEbY4kzSa99C8m7Z/mUBkxtJwOmYs/mB1ssces
 AyCzScDZf/LHR/rSv3T4+gedsPtapZ1b3DyzjV2bUO8zKXEAjMA2ikUhwkB4+PDLshed
 W5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0JjWYRu/kVfVhVMQzk2HzUkqzGw62vTtAvDUcCRIg2Q=;
 b=hkmSbwM1kBdODrCBVQy3HblVK6mzoUBQG5co8M7pVMbf6xGO8m3dORJeyWPOpQ+T2e
 nMu0JpPYLqqundyc6zpQfwfVxMBYQt02+dfM7yKdlDEE1A6rM4GQXoGyEFSyqXqqUlDO
 gET08uRPQ1XkxnexbIGQ+8xbpvNwED9ujjbSPGBlSnyIR572CB+ZdT+WtJqbQrYg717X
 QL2W381ZHmOkwTXJzSG+GsRKe2ZMS0ZJVyALOIotS6F6wfcozcwWMvyAHJkDrA1iOlOf
 mYlAq5jWxLhqds3YbNQKymd+FC8fWVRIV0pvsgIr/FB58u0awg1GxKXNV0u8sa7loeAr
 LxqQ==
X-Gm-Message-State: AFqh2krhEL4yR5xvRkiqwJkoBGpMYIdYZ1WMiVoTTvBUG4wJy3usqpaz
 ++4s1cS+t0lcG/pfa9YDOIabwg==
X-Google-Smtp-Source: AMrXdXvswYjzkwcjW1IFhBRPRCljQyY1mVGS2bVSnl2yzozkT8fVqnMJ/f+zrekqCZdDq6TGM/o/JA==
X-Received: by 2002:a05:6512:c03:b0:4b5:a4ef:fca3 with SMTP id
 z3-20020a0565120c0300b004b5a4effca3mr24625783lfu.38.1673498094415; 
 Wed, 11 Jan 2023 20:34:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a0565123f9600b004b52aed44besm3078302lfa.25.2023.01.11.20.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 20:34:53 -0800 (PST)
Message-ID: <61ba2880-6784-1014-a7a2-a1eecc4e810e@linaro.org>
Date: Thu, 12 Jan 2023 06:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 0/9] Register Type-C mode-switch in DP bridge endpoints
Content-Language: en-GB
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
References: <20230112042104.4107253-1-treapking@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112042104.4107253-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, linux-acpi@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 shaomin Deng <dengshaomin@cdjrlc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2023 06:20, Pin-yen Lin wrote:
> 
> This series introduces bindings for anx7625/it6505 to register Type-C
> mode-switch in their output endpoints, and use data-lanes property to
> describe the pin connections.

Please cc everybody on all patches. Having received just a single patch 
made me spend time on having to look them up on lore.

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
> 
> Changes in v6:
> - Changed it6505_typec_mux_set callback function to accommodate with
>    the latest drm-misc patches
> - Changed the driver implementation to accommodate with the new binding
> - Dropped typec-switch binding and use endpoints and data-lanes properties
>    to describe the pin connections
> - Added new patches (patch 1,2,4) to fix probing issues
> - Changed the bindings of it6505/anx7625 and modified the drivers
>    accordingly
> - Merged it6505/anx7625 driver changes into a single patch
> 
> Pin-yen Lin (7):
>    drm/display: Add Type-C switch helpers
>    dt-bindings: display: bridge: anx7625: Add mode-switch support
>    drm/bridge: anx7625: Check for Type-C during panel registration
>    drm/bridge: anx7625: Register Type C mode switches
>    dt-bindings: display: bridge: it6505: Add mode-switch support
>    drm/bridge: it6505: Fix Kconfig indentation
>    drm/bridge: it6505: Register Type C mode switches
> 
> Prashant Malani (2):
>    device property: Add remote endpoint to devcon matcher
>    platform/chrome: cros_ec_typec: Purge blocking switch devlinks
> 
>   .../display/bridge/analogix,anx7625.yaml      |  99 ++++++++++++-
>   .../bindings/display/bridge/ite,it6505.yaml   |  93 ++++++++++--
>   drivers/base/property.c                       |  15 ++
>   drivers/gpu/drm/bridge/Kconfig                |  21 +--
>   drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>   drivers/gpu/drm/bridge/analogix/anx7625.c     | 105 +++++++++++++-
>   drivers/gpu/drm/bridge/analogix/anx7625.h     |  13 ++
>   drivers/gpu/drm/bridge/ite-it6505.c           | 119 +++++++++++++++-
>   drivers/gpu/drm/display/drm_dp_helper.c       | 134 ++++++++++++++++++
>   drivers/platform/chrome/cros_ec_typec.c       |  10 ++
>   include/drm/display/drm_dp_helper.h           |  17 +++
>   11 files changed, 598 insertions(+), 29 deletions(-)
> 

-- 
With best wishes
Dmitry

