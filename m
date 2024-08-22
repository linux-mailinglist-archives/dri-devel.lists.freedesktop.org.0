Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775495B883
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B680110EAEF;
	Thu, 22 Aug 2024 14:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o30hDNjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB6710EAEF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:34:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 69722A4049D;
 Thu, 22 Aug 2024 14:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B7DC32782;
 Thu, 22 Aug 2024 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724337280;
 bh=TijZddx52s7dHM9dVKH3FQOQGg37tHlZWJ7WwnRJDz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o30hDNjICLJUBuoyylRk4f1P6fyz268BRyUz/tzs8AmEo2LJqaUdpuwY1/DCTLSbd
 NExh2Pk6Jj/7Fy54LtoOM3nnYAXw7TEM23JNcbw5jlbwDCeu5Alg4Uiw6Ej9cbN2Ge
 qpw/+b4X2GNqjD5j7J+0C4cka8NlTnVQKV0VH7oyoZTTqeSDJ9GMaKdcBMbnCGz0oK
 W4uplrEpYu6xavlLKTKEmzVAaZI8ZmJCz+EmMoBcVEr/EJ1qNVQKziaZzyoACjVglL
 bpwXXn32E2lf1uZGdH6GNI1LnxnLk/3jwwgvDWTlduFv7KADBpKed2z8LxX6QD+/eP
 TV0nHHTNpyJWA==
Date: Thu, 22 Aug 2024 22:34:31 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 13/17] dt-bindings: Move google,cros-ec-typec binding
 to usb
Message-ID: <ZsdMd7Ywa2b-GDT6@tzungbi-laptop>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-14-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819223834.2049862-14-swboyd@chromium.org>
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

On Mon, Aug 19, 2024 at 03:38:27PM -0700, Stephen Boyd wrote:
> -title: Google Chrome OS EC(Embedded Controller) Type C port driver.
> +title: Google Chrome OS Embedded Controller (EC) USB type-c port driver

Given that it gets chance to modify, how about s/Chrome OS/ChromeOS/?
