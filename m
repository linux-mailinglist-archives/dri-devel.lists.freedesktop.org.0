Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F072697B1A4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 16:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E0710E488;
	Tue, 17 Sep 2024 14:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XGnm3fEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720D310E488
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 14:55:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74DE520002;
 Tue, 17 Sep 2024 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726584902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9y4PhvPPYKJA/AewGxCFBNSuD776TKUVC2KAG8adeQ=;
 b=XGnm3fEPbAKuxZk692s1diXeawdOArDgn4ol9Jc3J3gM8u3beWr6l6cxp+w4pLt74NPCo3
 yYnA+Oo1NnLB8OsA1kAltKs56qbbGdbFiMYwtg2GdtGhaXRx1GMScDwgt6NjzNUiwC5sWZ
 4gzvjAGOLoZ1Hcxnp97oVJacEkGoYgXYf6+dDrfoPCTzs2QXq2P8TEf5fJrfKICbGUlgbW
 hdVy0bJLVHvXHrsf4HYLiU+OQ3BcXJSzFfkQPdOe6xm9Qr6cXiA6YvPfgLcfDGXtykMtjI
 NgbZE1joQw+eyac8RKDZb4AT/gOW3VVU7HWPHwttZaiR7oZhoHidQlk2oX0tww==
Date: Tue, 17 Sep 2024 16:54:53 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, linux-fbdev@vger.kernel.org, Dragan Cvetic
 <dragan.cvetic@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Derek Kiernan
 <derek.kiernan@amd.com>, Maxime Ripard <mripard@kernel.org>, Robert Foss
 <rfoss@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jingoo
 Han <jingoohan1@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org, Paul
 Kocialkowski <contact@paulk.fr>, linux-i2c@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Lee Jones <lee@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: [PATCH v4 1/8] dt-bindings: connector: add GE SUNH hotplug
 addon connector
Message-ID: <20240917165453.7aef4fda@booty>
In-Reply-To: <172656899099.2713363.6775764159513105143.robh@kernel.org>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
 <20240917-hotplug-drm-bridge-v4-1-bc4dfee61be6@bootlin.com>
 <172656899099.2713363.6775764159513105143.robh@kernel.org>
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

Hi,

On Tue, 17 Sep 2024 05:29:51 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dtb: addon-connector: Unevaluated properties are not allowed ('powergood-gpios' was unexpected)

Ouch, a leftover from v3. Fixed queued for v5.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
