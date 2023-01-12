Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE2667240
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 13:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7B210E8DB;
	Thu, 12 Jan 2023 12:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE2E10E8DB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 12:33:10 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id n190so14979970vsc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 04:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lmMMKRN2mYFSKBWdfS4KEk8FcK8S7SAJEuBn9XGJN0Y=;
 b=gFe2+58oQUeTne9Zkfg/uZ9QWaIynLRPo7PQDJ5C/B/JiBw/x/ytir+8cc2ShEVEpM
 h1jAtFbbp7ClBkAXMOF0BppMfBNqixsIgnHhR3ykhKHeUymrnYCtxiYLGCoe2TjT9Bmt
 XMEDeAyOFogPrwD8JuhSHAK3nr+cnt+udZNp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lmMMKRN2mYFSKBWdfS4KEk8FcK8S7SAJEuBn9XGJN0Y=;
 b=8R54ULw9u6TM/+tV3ekB492kPGNqU3EmKCmqw+v/skb2l+kPu5B1aENEkB+TLC4u2U
 NuKG24j0na/Zo2GfeBXY12yzuGwXTdGzKix1aSxDJiHQ267q4OiAOZ7H2DVV9mo12Ztt
 WamA3L+3bzqZx6zHc4Br1EvLcZMsD0azjIytpUTLtExR8qaDZjcKKjOZFJwe7VF1zwlx
 oIJsh3URuQuEGou7hEqh87nSIsHobAIBZ34FTlygcu/VpgEWHPXSuAb0nW0gSBZ0UvyO
 K0ylFrDl9QD+YU6bkhUuHBcRlynMBnLJkJY2rIJNwXcrGmxi1eaI5+h5KNp6X5JVq+iB
 qvfg==
X-Gm-Message-State: AFqh2kp5GtANB6OnIc38/8IMJvWhAJSVYM0EK9OIqRyGXHlDuvVGausn
 ZdrUQH0VN7rrVCt49/oUpjCziPvDF3KSej7hLi7xpQ==
X-Google-Smtp-Source: AMrXdXtCB2FwlHoY21KCpYVwLL1xj0HeaIsLRbFONUmvlRokBMQ/nNZG1R0mfhDYTDrxpXmDZBtfE8Cd1Wy2420mG2Q=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr9078574vsv.9.1673526789365; Thu, 12 Jan
 2023 04:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-10-treapking@chromium.org>
In-Reply-To: <20230112042104.4107253-10-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Jan 2023 20:32:58 +0800
Message-ID: <CAGXv+5ErwJFmu3tFX5RjB9jj-2YWH6mabnHFxnRWv+oAZud=1Q@mail.gmail.com>
Subject: Re: [PATCH v10 9/9] drm/bridge: it6505: Register Type C mode switches
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
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

On Thu, Jan 12, 2023 at 12:22 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the "lane_swap"
> state based on the entered alternate mode for a specific Type-C
> connector, which ends up updating the lane swap registers of the it6505
> chip.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
