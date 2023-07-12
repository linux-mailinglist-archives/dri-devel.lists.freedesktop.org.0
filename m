Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2ED750E97
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 18:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7764F10E593;
	Wed, 12 Jul 2023 16:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9935510E593
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 16:31:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5336FF802;
 Wed, 12 Jul 2023 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689179464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4I7KqMlGQ1jWsPHpCvnpP3x5qLJt8ehVJksZQDgy4Q4=;
 b=kbOWBmv3V/Hpg9K2nq6/gdiXQqeTc6XG6mhSwoSP4xxQMpzzIeFH0eaAR3TkYmbxkpAi23
 C8YQfn60PsEWz1mnXbdTPTY+ZF+bZzIkODW5adoUYUgf/AjGPD0RdB5ZA9Uw25fMGSzT8Z
 jlgQ/eTVvxU3AsradvGIBgTrLc994AzFahLqeHEoRfWVZFtStnGsxtPC4gVdC/tcHp10cM
 8Z1IXWSjSBmauEAwlocXfZVP77emoHD748l2IsDWZ60bdyDW2EbunyRi8fwHuIYXPAEWGS
 MJzFG7E8SH0BHEIZV0auqfcfNmJ03jCDlAj94KtpQ6DjE5S5mBZOmgAnwUfOFw==
Date: Wed, 12 Jul 2023 18:31:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v2 00/13] Add Inanbo T28CP45TN89 panel support
Message-ID: <20230712183100.690b33c5@xps-13>
In-Reply-To: <20230422205012.2464933-1-sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
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

sre@kernel.org wrote on Sat, 22 Apr 2023 22:49:59 +0200:

> Hi,
>=20
> This adds panel support for Inanbo T28CP45TN89, which I found inside of a
> handheld thermal camera. The panel is based on the st7789v controller. All
> information is based on reverse engineering.

I haven't seen another version for this series so I assume it is still
the one to look at. As you already know, I also want to add support for
a panel based on the st7789 display controller. As discussed, I rebased
my changes on top of yours as you actually sent them upstream
much earlier than I did.

As a single minor comment was made to this version of the series, I
would like to know if you wanted to send a new version soon? Or if it
would make sense to send a bigger series with all our common patches in
one single shot (mine should apply cleanly without further work on
yours). Let me know how we can move forward.

For the record, here are my patches.

Link: https://lore.kernel.org/all/20230619155958.3119181-1-miquel.raynal@bo=
otlin.com/

Thanks a lot,
Miqu=C3=A8l

>=20
> Changes since PATCHv1:
>  * https://lore.kernel.org/all/20230317232355.1554980-1-sre@kernel.org/
>  * Apply DT binding changes requested by Krzysztof Kozlowski and his Ack
>  * I changed the driver patches to avoid code duplication and splitted
>    the code a bit more
>=20
> -- Sebastian
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
>  .../display/panel/sitronix,st7789v.yaml       |   5 +-
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 148 ++++++++++++++----
>  3 files changed, 120 insertions(+), 35 deletions(-)
>=20

