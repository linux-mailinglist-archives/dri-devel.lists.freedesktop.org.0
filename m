Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB32747C608
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FC510E8D4;
	Tue, 21 Dec 2021 18:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCCA10E8D4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:13:01 +0000 (UTC)
Date: Tue, 21 Dec 2021 18:12:50 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] dt-bindings: display: Add SPI peripheral schema to SPI
 based displays
To: Rob Herring <robh@kernel.org>
Message-Id: <E99H4R.USZAFSZ7ENW71@crapouillou.net>
In-Reply-To: <20211221125209.1195932-1-robh@kernel.org>
References: <20211221125209.1195932-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Marek Belisko <marek@goldelico.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonathan Bakker <xc-racer2@live.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Le mar., d=E9c. 21 2021 at 08:52:09 -0400, Rob Herring <robh@kernel.org>=20
a =E9crit :
> With 'unevaluatedProperties' support enabled, several SPI based=20
> display
> binding examples have warnings:
>=20
> Documentation/devicetree/bindings/display/panel/samsung,ld9040.example.dt=
.yaml:=20
> lcd@0: Unevaluated properties are not allowed ('#address-cells',=20
> '#size-cells', 'spi-max-frequency', 'spi-cpol', 'spi-cpha' were=20
> unexpected)
> Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.=
example.dt.yaml:=20
> panel@0: Unevaluated properties are not allowed ('spi-max-frequency',=20
> 'spi-3wire' were unexpected)
> Documentation/devicetree/bindings/display/panel/ilitek,ili9322.example.dt=
.yaml:=20
> display@0: Unevaluated properties are not allowed ('reg' was=20
> unexpected)
> Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.example.d=
t.yaml:=20
> display@0: Unevaluated properties are not allowed=20
> ('spi-max-frequency' was unexpected)
> Documentation/devicetree/bindings/display/panel/abt,y030xx067a.example.dt=
.yaml:=20
> panel@0: Unevaluated properties are not allowed ('spi-max-frequency'=20
> was unexpected)
> Documentation/devicetree/bindings/display/panel/sony,acx565akm.example.dt=
.yaml:=20
> panel@2: Unevaluated properties are not allowed ('spi-max-frequency',=20
> 'reg' were unexpected)
> Documentation/devicetree/bindings/display/panel/tpo,td.example.dt.yaml:=20
> panel@0: Unevaluated properties are not allowed ('spi-max-frequency',=20
> 'spi-cpol', 'spi-cpha' were unexpected)
> Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.exampl=
e.dt.yaml:=20
> panel@0: Unevaluated properties are not allowed ('reg',=20
> 'spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
> Documentation/devicetree/bindings/display/panel/innolux,ej030na.example.d=
t.yaml:=20
> panel@0: Unevaluated properties are not allowed ('spi-max-frequency'=20
> was unexpected)
> Documentation/devicetree/bindings/display/panel/sitronix,st7789v.example.=
dt.yaml:=20
> panel@0: Unevaluated properties are not allowed ('spi-max-frequency',=20
> 'spi-cpol', 'spi-cpha' were unexpected)
>=20
> Fix all of these by adding a reference to spi-peripheral-props.yaml.
> With this, the description that the binding must follow
> spi-controller.yaml is both a bit out of date and redundant, so remove
> it.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


