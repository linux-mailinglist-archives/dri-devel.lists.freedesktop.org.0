Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF8847C725
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10220112B2E;
	Tue, 21 Dec 2021 18:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CD4112B2E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:59:23 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 2ce1b75c-6290-11ec-ac19-0050568cd888;
 Tue, 21 Dec 2021 18:59:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 7F74B194B54;
 Tue, 21 Dec 2021 19:59:23 +0100 (CET)
Date: Tue, 21 Dec 2021 19:59:18 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Add SPI peripheral schema to SPI
 based displays
Message-ID: <YcIkBlSH8+G1vdQ3@ravnborg.org>
References: <20211221125209.1195932-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221125209.1195932-1-robh@kernel.org>
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Marek Belisko <marek@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 21, 2021 at 08:52:09AM -0400, Rob Herring wrote:
> With 'unevaluatedProperties' support enabled, several SPI based display
> binding examples have warnings:
> 
> Documentation/devicetree/bindings/display/panel/samsung,ld9040.example.dt.yaml: lcd@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
> Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency', 'spi-3wire' were unexpected)
> Documentation/devicetree/bindings/display/panel/ilitek,ili9322.example.dt.yaml: display@0: Unevaluated properties are not allowed ('reg' was unexpected)
> Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.example.dt.yaml: display@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
> Documentation/devicetree/bindings/display/panel/abt,y030xx067a.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
> Documentation/devicetree/bindings/display/panel/sony,acx565akm.example.dt.yaml: panel@2: Unevaluated properties are not allowed ('spi-max-frequency', 'reg' were unexpected)
> Documentation/devicetree/bindings/display/panel/tpo,td.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
> Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('reg', 'spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
> Documentation/devicetree/bindings/display/panel/innolux,ej030na.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
> Documentation/devicetree/bindings/display/panel/sitronix,st7789v.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
> 
> Fix all of these by adding a reference to spi-peripheral-props.yaml.
> With this, the description that the binding must follow
> spi-controller.yaml is both a bit out of date and redundant, so remove
> it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
