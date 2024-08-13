Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103469500D6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2F410E272;
	Tue, 13 Aug 2024 09:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YZPOp+Cy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A996A10E272
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:07:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EFD71C0003;
 Tue, 13 Aug 2024 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723540025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuigKssXYiPCEK+V39HggWwcnvNgqn3KueYYJ6PbxGQ=;
 b=YZPOp+CykyQGKIQivmGaH1s94KMe4kQsroHSg2DMg1QzYxPPFCtGrzmcy/NPVmlwc+JLm+
 QBfZiuXK5wp9wocsq/PmUBY5BXSlHr9SKWNe0Lt5ylrJWhFYrLFFpHnE3kBv30gnWtApfa
 gCh0hqzV6qTpCNQluwzKtWm/krKcBKwY/LPD/vVyAdG+MWOiyThyjuaholGs+1bYA6u1hS
 r/BgXMxVnjLADPYxXahdWg628mMIJIjnTZodHt/WJfFVIghKTiuxidM8Bpg0on0n2/Y+Um
 7IQYZbFfzvs9ZIgocR1XRFLbcOLBHHYJ2BfQQk+p5Qzz3elwXDSWlxBW1rylTQ==
Date: Tue, 13 Aug 2024 11:06:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: connector: add GE SUNH hotplug
 addon connector
Message-ID: <20240813110659.65f2ab72@booty>
In-Reply-To: <20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
 <20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello,

On Fri, 09 Aug 2024 17:34:49 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Add bindings for the GE SUNH add-on connector. This is a physical,
> hot-pluggable connector that allows to attach and detach at runtime an
> add-on adding peripherals on non-discoverable busses.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

> +examples:
> +  # This is the description of the connector as it should appear in the
> +  # main DTS describing the "main" board up to the connector.

The comment from now on has outdated content referring to v2 and which I
forgot to remove before sending v3:

>      This is
> +  # supposed to be used together with the overlays in the two following
> +  # examples. The addon_connector and hotplug_conn_dsi_out labels are
> +  # referenced by the overlays in those examples.

Fixed locally.

> +  - |
> +    / {
> +        #include <dt-bindings/gpio/gpio.h>

I also removed the root node which is not needed and cause bot warnings,
and with that done the #include went back to a correct position.

The above are queued for v4.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
