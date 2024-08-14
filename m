Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57B951D76
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ED010E4BA;
	Wed, 14 Aug 2024 14:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RwZwsCTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD24510E4BA
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:42:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9C711C0006;
 Wed, 14 Aug 2024 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCe2Kac2K1pnqt6534QtxlYkCGpJDN6y+35zQbSjIf4=;
 b=RwZwsCTYIhhY66AzsCf/dIWofDh57t1TnYqLpP0zuRDkXUvGAjgmT/xFwvT8qxDhvS82P8
 Wh7KEWkuvwSt7oqIEnct+74WUjV818QqHvqS+FybWehsgeZt+5r3lP+qYJptRpOms/ENy5
 0hlxH7POiA+QjgixWJrak45FLVuI4SI0a9uB9CtI/45LvpXQypH1KAaGvfJUFK6+C+Lrjs
 0f9Idhlzg3/uTQYolP7HSzWzi2avLrdLa1/2513IhtsR00R13GhOLhATEteT9qKkHpcxPe
 L6Tft1OOp1Yy2fajeOTv8azmQk5d6xTQ9WFhYJ14BYjf27DH4Yzen9LoIdMKPA==
Date: Wed, 14 Aug 2024 16:42:44 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan
 <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Paul Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: connector: add GE SUNH hotplug
 addon connector
Message-ID: <20240814164244.25e9b3f4@booty>
In-Reply-To: <20240813151901.GA953664-robh@kernel.org>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
 <20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>
 <20240813151901.GA953664-robh@kernel.org>
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

Hello Rob,

On Tue, 13 Aug 2024 09:19:01 -0600
Rob Herring <robh@kernel.org> wrote:

> On Fri, Aug 09, 2024 at 05:34:49PM +0200, Luca Ceresoli wrote:
> > Add bindings for the GE SUNH add-on connector. This is a physical,
> > hot-pluggable connector that allows to attach and detach at runtime an
> > add-on adding peripherals on non-discoverable busses.  
> 
> Overall, looks pretty good.

Thanks, I'm very glad it does.

> > +    maxItems: 1
> > +
> > +  nobus-devices:  
> 
> Just 'devices'.

Sure, simple enough.

> > +    description:
> > +      A container for devices not accessible via any data bus. Common use
> > +      cases include fixed and GPIO regulators, simple video panels and LED
> > +      or GPIO backlight devices. When not hot-pluggable, nodes such devices
> > +      are children of the root node.
> > +
> > +      This node should not be present in the connector description in the
> > +      base device tree. It should be added by overlays along with a subnode
> > +      per device.
> > +
> > +    type: object
> > +    additionalProperties: false  
> 
> The schema needs to work with the overlay applied too. 'true' is fine 
> here.

Does additionalProperties apply to nodes as well? No properties are
supposed to be added inside this node, only nodes, so I'm not sure what
to do about additionalProperties.

Queued all other changes for v4.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
