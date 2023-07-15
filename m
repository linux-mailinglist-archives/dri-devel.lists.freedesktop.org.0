Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C50754990
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 17:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BA010E15C;
	Sat, 15 Jul 2023 15:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292AA10E15C
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 15:05:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 766C1E0002;
 Sat, 15 Jul 2023 15:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689433518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5k147YyTR7m+TG5HLa8g5sxazFffEO9aVF1D74wOqk=;
 b=VQ6dlf6ivmTL+ca35id06Lel2KmVR8gJ+2mAzMMSSWscwNaiTfpOZ2rEp8LOm200fLw4lh
 qPp1+BdudlOb2W5WUx6v5rPaMFwoKAXaxtur6raHjiDyv/AAzqrq4ynVT6JirTO1WL46sa
 0HdRyrE4jE5RVye+3VEvR6vQzIepdQ0YAOz4a/Th0p6qMQhTnzjtWxBQpgw9TYwyXD/wT5
 pX83VCBrLo4UroUz08UVJjs3yD9StpMnk6kHV5ilj8PozDMPKA6sQXd9NoU019aKNRj1IW
 pNaB9dpQbBsUiZafPfYmEjVZC2c1veDUGlfnrwiuq+9xn05O+yz3qycBLoX3Qg==
Date: Sat, 15 Jul 2023 17:05:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v3 00/19] Sitronix ST7789V improvements
Message-ID: <20230715170515.637f4f65@xps-13>
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

+ Thomas

sre@kernel.org wrote on Fri, 14 Jul 2023 03:37:37 +0200:

> Hi,
>=20
> This adds panel support for Inanbo T28CP45TN89, which I found inside of a
> handheld thermal camera. The panel is based on the st7789v controller. All
> information is based on reverse engineering. I also appended the series
> from Miquel Raynal adding EDT ET028013DMA panel support, so that I could
> easily test it with my SPI_NO_RX setup. They are slightly different due
> to rebasing.

Thanks a lot! I'll continue following the series and provide my help
when required.

Cheers,
Miqu=C3=A8l

>=20
> Changes since PATCHv2:
>  * https://lore.kernel.org/all/20230422205012.2464933-1-sre@kernel.org/
>  * https://lore.kernel.org/all/20230616163255.2804163-1-miquel.raynal@boo=
tlin.com/
>  * Add Rob Herring's R-b for the DT binding
>  * Make panel info "static const"
>  * Add Michael Riesch's R-b to all my patches
>  * Rebase to 6.5-rc1
>  * Append Miquel's series
>=20
> Changes since PATCHv1:
>  * https://lore.kernel.org/all/20230317232355.1554980-1-sre@kernel.org/
>  * Apply DT binding changes requested by Krzysztof Kozlowski and his Ack
>  * I changed the driver patches to avoid code duplication and splitted
>    the code a bit more
>=20
> Greetings,
>=20
> -- Sebastian
>=20
> Miquel Raynal (6):
>   dt-bindings: display: st7789v: Add the edt,et028013dma panel
>     compatible
>   dt-bindings: display: st7789v: bound the number of Rx data lines
>   drm/panel: sitronix-st7789v: Use 9 bits per spi word by default
>   drm/panel: sitronix-st7789v: Clarify a definition
>   drm/panel: sitronix-st7789v: Add EDT ET028013DMA panel support
>   drm/panel: sitronix-st7789v: Check display ID
>=20
> Sebastian Reichel (13):
>   dt-bindings: vendor-prefixes: add Inanbo
>   dt-bindings: display: st7789v: add Inanbo T28CP45TN89
>   drm/panel: sitronix-st7789v: add SPI ID table
>   drm/panel: sitronix-st7789v: remove unused constants
>   drm/panel: sitronix-st7789v: make reset GPIO optional
>   drm/panel: sitronix-st7789v: simplify st7789v_spi_write
>   drm/panel: sitronix-st7789v: improve error handling
>   drm/panel: sitronix-st7789v: avoid hardcoding mode info
>   drm/panel: sitronix-st7789v: avoid hardcoding panel size
>   drm/panel: sitronix-st7789v: add media bus format
>   drm/panel: sitronix-st7789v: avoid hardcoding invert mode
>   drm/panel: sitronix-st7789v: avoid hardcoding polarity info
>   drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89 support
>=20
>  .../display/panel/sitronix,st7789v.yaml       |  10 +-
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 262 +++++++++++++++---
>  3 files changed, 237 insertions(+), 37 deletions(-)
>=20
