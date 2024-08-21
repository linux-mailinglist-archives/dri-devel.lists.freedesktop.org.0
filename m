Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017B99591F0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 02:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7C210E0D0;
	Wed, 21 Aug 2024 00:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H9RNHwUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 408 seconds by postgrey-1.36 at gabe;
 Wed, 21 Aug 2024 00:41:39 UTC
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC24810E827
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 00:41:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C7F01A40BC2;
 Wed, 21 Aug 2024 00:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B451C4AF0E;
 Wed, 21 Aug 2024 00:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724200490;
 bh=fUJI4jZmft/izpLYURRjAmm97Z8N86Ii30QM5siTy/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H9RNHwURn4F9TVrLMI9zpvovJ5R8Jqn2JPWT2QB8WbMbJn11pD1vZJUtenhL+zZdg
 B4AvbIJuWjmRPb53zH1Kp0qAU7g9g1GheQ7KhEOYHniT9sQONL+3/AKnSmo91RF9aq
 zV5Al3qjDXo2bPR9Ob4+lCxNfXIXdExtSLWhuOiIqzBGmKPLtxgOvFgcB635gLgMvo
 DovglIz4Y5Q96tT78/Xr8f64uBtfRGVI95ylLCIivF228NRw1Er85sboSfcZgKA+8D
 GHFDh5MGS1oCHhmFOm+G9NgU5bsFQa5wAOd+4BJxbB0AR0/POi0G5Q3BaIPBOLd0tl
 CnjvPwsQNvhVA==
Date: Tue, 20 Aug 2024 19:34:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Daniel Scally <djrscally@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Benson Leung <bleung@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, patches@lists.linux.dev,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Pin-yen Lin <treapking@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Ivan Orlov <ivan.orlov0322@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-acpi@vger.kernel.org,
 chrome-platform@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Lee Jones <lee@kernel.org>,
 devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v3 14/17] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
Message-ID: <172420048648.2348348.16719987576551800332.robh@kernel.org>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-15-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819223834.2049862-15-swboyd@chromium.org>
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


On Mon, 19 Aug 2024 15:38:28 -0700, Stephen Boyd wrote:
> Add a DT graph binding to google,cros-ec-typec so that it can combine
> DisplayPort (DP) and USB SuperSpeed (SS) data into a USB type-c endpoint
> that is connected to the usb-c-connector node's SS endpoint. This also
> allows us to connect the DP and USB nodes in the graph to the USB type-c
> connectors, providing the full picture of the USB type-c data flows in
> the system.
> 
> Allow there to be multiple typec nodes underneath the EC node so that
> one DT graph exists per DP bridge. The EC is actually controlling TCPCs
> and redrivers that combine the DP and USB signals together so this more
> accurately reflects the hardware design without introducing yet another
> DT node underneath the EC for USB type-c.
> 
> If the type-c ports are being shared between a single DP controller then
> the ports need to know about each other and determine a policy to drive
> DP to one type-c port. If the type-c ports each have their own dedicated
> DP controller then they're able to operate independently and enter/exit
> DP altmode independently as well. We can't connect the DP controller's
> endpoint to one usb-c-connector port@1 endpoint and the USB controller's
> endpoint to another usb-c-connector port@1 endpoint either because the
> DP muxing case would have DP connected to two usb-c-connector endpoints
> which the graph binding doesn't support.
> 
> Therefore, one typec node is required per the capabilities of the type-c
> port(s) being managed. This also lets us indicate which type-c ports the
> DP controller is wired to. For example, if DP was connected to ports 0
> and 2, while port 1 was connected to another DP controller we wouldn't
> be able to implement that without having some other DT property to
> indicate which output ports are connected to the DP endpoint.
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
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/mfd/google,cros-ec.yaml          |   7 +-
>  .../bindings/usb/google,cros-ec-typec.yaml    | 229 ++++++++++++++++++
>  2 files changed, 233 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

