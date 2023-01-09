Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E90766220B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4E010E39E;
	Mon,  9 Jan 2023 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A92710E39E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:49:38 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id 186so2712140vsz.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D5ahGc+OvNs5WM9eaB6chHv07ET6UjHeKRyotHsgAjM=;
 b=Gpk1v2ZnmWgGcRSYw/UCvPVHlUAizncukxu/U3iy5e90X10p4sPxOeaTBy/IgZiWiA
 695lU071VeiTqW+ry4mUWMgctnJqzd7m6V3oXk/QY0JyzBN+saxHeNBi+bNS5UstZqmK
 XPn6dUrYFHrph5UApKtdK4HkMF1JNZbn9/6bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D5ahGc+OvNs5WM9eaB6chHv07ET6UjHeKRyotHsgAjM=;
 b=uawIJFdW9O/doglxJZdqfqjC0wlTibb4/Np3F56EsXQH79sqY0KmKK74j+5vzitblI
 RwBNhRPZjClVokoXPZ13TClXW23UzG0hVYHZbw1N1V/NXD96/mr7txVLq5NeZ42KCv3F
 h7F3qSiZ1lG7ZuL2rDZqMxvgBgZ9NVKxvIsqUsCoptX5egFOn9JGCle9u38I21vDkwqW
 4PXPzJFDk52URcfRI6v2mYaFtV14WL9ELfnRLOMn4nFqpCnDAxLRR1+KHeKaYfWC5E8k
 WVLImq/3FI7s//z1ybq6oFDo8zOcAXADIdwiOlWGCWOnQ20qI5iIxw9QIsS33VonHcwv
 Br+Q==
X-Gm-Message-State: AFqh2kohDtQlXLTRRRJJwfaKTN6MrziYNWiKwWEobRjqjOhOkeimulWI
 /NxQwWtg3re1wEyZMRvl0tyTd+CB4D+R+fyj96FYaA==
X-Google-Smtp-Source: AMrXdXvtT35ihskXX2g1gPIg+h8WjTir+1IBQq2gkg2Z1k7ClRuUMhLNc3woSUYbDnwMhV5JuPAWZz/dN1mL6/Xm590=
X-Received: by 2002:a67:447:0:b0:3ce:d0ae:f6f6 with SMTP id
 68-20020a670447000000b003ced0aef6f6mr2967367vse.26.1673257777595; Mon, 09 Jan
 2023 01:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org>
 <20230109084101.265664-5-treapking@chromium.org>
In-Reply-To: <20230109084101.265664-5-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 17:49:26 +0800
Message-ID: <CAGXv+5HY6qn8QpvPasAh90f7pfzQcLfbP3_GSdk73mucU6ctsw@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 4:41 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Analogix 7625 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
>
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
>
> Also include the link to the product brief in the bindings.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8192 based Hayato (ASUS Chromebook Flip CM3200).
