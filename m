Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8C8C2248
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 12:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1472010E4A4;
	Fri, 10 May 2024 10:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pxKg9ilE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDE510E4A4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 10:37:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92529E0008;
 Fri, 10 May 2024 10:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715337441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDoiNwoii/qxjT77o/j0b4b+dq8b/9g1u0a5i+nOs94=;
 b=pxKg9ilEFyj+MjnvdsxaawKTc/71y4mfiays6/uP89nhdZCPgTSzPxKqOU1qD1YJCmwLXI
 1cx3CaLdieq2d5Ft73Ox5XAnV0V7cf8ae6rYtj5X205BwbVfmMK2dBbzt/fZcpAYPuY1C+
 JX1z0CaLoazA169azpGi0OTg5bSfchq/qOAegPiAQDey1UmRYtrej1NRSqeSjf5HtZXuuM
 3ClcLEgb6nEAhp/pQbdB1e1KX00m+W8NxsWJ0zTm52RwIh/xBNKvsLGtYQRlhA+fgycaUV
 zeLMVppJY9VI5G01FGM4SeoXBgc62FQv5V8Ift1NrTevKctAYVJpjCmPutKKCg==
Date: Fri, 10 May 2024 12:37:17 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Maxime Ripard <mripard@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Robert Foss <rfoss@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Derek Kiernan
 <derek.kiernan@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Saravana Kannan <saravanak@google.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Paul Kocialkowski
 <contact@paulk.fr>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Jonas
 Karlman <jonas@kwiboo.se>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: connector: add GE SUNH hotplug
 addon connector
Message-ID: <20240510123717.437ffe6e@booty>
In-Reply-To: <171533049583.3304069.11759668175103213313.robh@kernel.org>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com>
 <171533049583.3304069.11759668175103213313.robh@kernel.org>
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

On Fri, 10 May 2024 03:41:35 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> On Fri, 10 May 2024 09:10:37 +0200, Luca Ceresoli wrote:
> > Add bindings for the GE SUNH add-on connector. This is a physical,
> > hot-pluggable connector that allows to attach and detach at runtime an
> > add-on adding peripherals on non-discoverable busses.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > NOTE: the second and third examples fail 'make dt_binding_check' because
> >       they are example of DT overlay code -- I'm not aware of a way to
> >       validate overlay examples as of now

As mentioned here...

> > 
> > This patch is new in v2.
> > ---
> >  .../connector/ge,sunh-addon-connector.yaml         | 197 +++++++++++++++++++++
> >  MAINTAINERS                                        |   5 +
> >  2 files changed, 202 insertions(+)
> >   
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dts:49.9-14 syntax error
> FATAL ERROR: Unable to parse input tree

...this is expected.

Any hints on how this can be managed in bindings examples would be very
useful.

Best regards,

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
