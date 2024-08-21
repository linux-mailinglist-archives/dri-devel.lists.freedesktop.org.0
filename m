Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E351B9591DB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 02:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686D310E561;
	Wed, 21 Aug 2024 00:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IfzQwByI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE60610E561
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 00:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A3F65CE0CF0;
 Wed, 21 Aug 2024 00:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C612C4AF0E;
 Wed, 21 Aug 2024 00:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724200434;
 bh=Xf3imji96YqaMFd4fO6kQzmpIvadXk3qPXsC/skPVVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IfzQwByIP0BAG/fURq6B1rZ6UXueihVrnguj20bZII+z1M6RiesR/JB+tBe4S5pji
 265mnvtx235ji3oR5NFvFGbNdRCiP/KbSV7wyZ6cTXPMF0k8g8bIAG+YxsNaLhgnl1
 lSxkQPtaTL5q4ILYNszYFR3xdq9mMu5PczDAZoDXnEJ6tFXrdb/W08r/HlUnJpwkJ8
 QL4REKBpLyJIw1I+7pW6AMUStdrkSIORTtW9vSZjhvhO1O8vHi8uvm34+Cu0mrq82u
 nrqjZIjZQZPq6aayjdDYzMyPdA2GAWSAKYkf0SkRFqnNl5s49ncqLQeKbISNbhSV4i
 CnhF8L9gLkZfA==
Date: Tue, 20 Aug 2024 19:33:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Prashant Malani <pmalani@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 patches@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v3 13/17] dt-bindings: Move google,cros-ec-typec binding
 to usb
Message-ID: <172420043081.2347279.17919615150697401810.robh@kernel.org>
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


On Mon, 19 Aug 2024 15:38:27 -0700, Stephen Boyd wrote:
> This binding is about USB type-c control. Move the binding to the usb
> directory as it's a better home than chrome.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml     | 2 +-
>  .../bindings/{chrome => usb}/google,cros-ec-typec.yaml        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/{chrome => usb}/google,cros-ec-typec.yaml (90%)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

