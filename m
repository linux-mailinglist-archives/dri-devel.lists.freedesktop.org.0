Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28326621F6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F76C10E398;
	Mon,  9 Jan 2023 09:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A53510E398
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:46:33 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id n190so4105543vsc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JD9id90/GBv0rN+b+fEE7qihWEJZMu0XeMc/gEngtnw=;
 b=JxXWwl+eLuaP6fnFCpJj1Lr9KWkQl8r3Rpi0OvHY1f1GNT609qbw8bRS2JM6xzBJk1
 gzZwM3H2vWaM2CUnjzAfWx28LZ9jbXOnDUqsqoqVZPLJ3YveCvlDuFEP71Nhx0PN68te
 1LAah7NX2O0NdZBWtXSO51iFyBpRk9at/6lN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JD9id90/GBv0rN+b+fEE7qihWEJZMu0XeMc/gEngtnw=;
 b=bBuDfmOFlmXI4CHbyKLbtKpQOgQI4v1WFjBwFqw3FzTv4liCrNsa6WwOhszbuZ+LDZ
 ObqeDXcBqf49Gt10fiu3FqPsA0LIuDHLEXWmbk+beODzTLdTbrF+oFpMrxLu3WOeX0uF
 2n2V8amO9Iu1k78cVwxmipP5AqyR8+AcDw9Bm+UCT5CywdFfcfvN4vgZCYY2hEWBiwM/
 V9CD/YV7rwYK+1AdkjA0NAZ7Dt5TT1T2cAwIxY9u4SISRTQHAV6O2yxvpqVl5mduEVDI
 TJDwKSKNo5UCi5ZRPtX6R63mXrNDi+yvTFDJbTk1/qgUC1ftAGw2ea4uYs1GPa9Gj17Q
 Zoig==
X-Gm-Message-State: AFqh2kpQkI4PLksOvkDqHGrbyHWj37vzZjK9oGd2W60DN2Da/OJdbGVu
 6KeT5pepxM3RNgaHEsw9ZVKc+MTBLMeRrIoJwRclow==
X-Google-Smtp-Source: AMrXdXuO0fTMqxwkiZVvH9C4e5gp4mmmQNXabaJ9gGA79i+OpIS1ue3zRzP45wYsOoz3U1RqMDqvFfwghOaBt9YruXE=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr7186588vsv.9.1673257592360; Mon, 09 Jan
 2023 01:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org>
 <20230109084101.265664-2-treapking@chromium.org>
In-Reply-To: <20230109084101.265664-2-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 17:46:21 +0800
Message-ID: <CAGXv+5GG_K8ga_c6mZcyn2y8Ydi3FHs4K6s7e45OeRPdD80g7A@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] device property: Add remote endpoint to devcon
 matcher
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

On Mon, Jan 9, 2023 at 4:41 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> From: Prashant Malani <pmalani@chromium.org>
>
> When searching the device graph for device matches, check the
> remote-endpoint itself for a match.
>
> Some drivers register devices for individual endpoints. This allows
> the matcher code to evaluate those for a match too, instead
> of only looking at the remote parent devices. This is required when a
> device supports two mode switches in its endpoints, so we can't simply
> register the mode switch with the parent node.
>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8192 based Hayato (ASUS Chromebook Flip CM3200).
