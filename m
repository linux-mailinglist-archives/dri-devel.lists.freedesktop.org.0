Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64C9591D2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 02:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3706310E3AB;
	Wed, 21 Aug 2024 00:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nh/Ekhqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F7210E6CD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 00:33:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D0D30CE0D3E;
 Wed, 21 Aug 2024 00:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2D7C4AF0E;
 Wed, 21 Aug 2024 00:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724200402;
 bh=2WZVtYSriNEGjwYLbCDt8+szQRWC2FjOcJJ8a9CeCxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nh/Ekhqcv+/tSPLKyozG7C0DMo9SpKtffaid72hpJAkYrBRV8Fn6pNrjIg7GfuCv9
 z7nAMbuVwatHZCEqnvyycdySjC+XOJNvjbxwT3uXsTNlQIJozKymcxjdsjNS3F94AH
 b5b5z9QgM17ETONKWlhsLcZQveW8y1qSaRDuo1q6mvKCMOs0OHnlbHCwoU/Keyjjb/
 rECdlrZHYIG/Gs3E0i8gXRhV2Zelwf+M9o9EPIDh6HHqLsek4VpcnrZzvlIJvHHryo
 65nZr5kgOUuOqwvN5wUPvtxDYsJPorfBNscNVSdC2o3lc5rv4J0TZ2eEbiQepxiF4q
 7yDVCgq6gUt/g==
Date: Tue, 20 Aug 2024 19:33:20 -0500
From: Rob Herring <robh@kernel.org>
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
 Prashant Malani <pmalani@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 11/17] dt-bindings: usb-switch: Extract endpoints to
 defs
Message-ID: <20240821003320.GA2341371-robh@kernel.org>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-12-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819223834.2049862-12-swboyd@chromium.org>
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

On Mon, Aug 19, 2024 at 03:38:25PM -0700, Stephen Boyd wrote:
> Move the usb-switch endpoint bindings to defs so that they can be reused
> by other bindings. Future users of this binding will have more than one
> type-c output node when they're muxing a single DP signal to more than
> one usb-c-connector. Add an example to show how this binding can be used
> and accelerate binding checks.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../devicetree/bindings/usb/usb-switch.yaml   | 74 ++++++++++++++++---
>  1 file changed, 62 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> index da76118e73a5..5fc031b56fad 100644
> --- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> @@ -35,9 +35,13 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Super Speed (SS) Output endpoint to the Type-C connector
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: '#/$defs/usbc-out-endpoint'
> +            unevaluatedProperties: false

You can drop this unevaluatedProperties since the $ref contains one. 
Same elsewhere. Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
