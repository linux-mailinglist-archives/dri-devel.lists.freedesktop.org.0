Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF2D771CEA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 11:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2894810E1D9;
	Mon,  7 Aug 2023 09:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D4A10E1D9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 09:12:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 972C940008;
 Mon,  7 Aug 2023 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691399569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEWBfoZqyZeQMVmeGU9GGyI6krNKFQh+jJcXxOpMyCo=;
 b=Mz+ErGr4ZKJlsxrZpeLXQcEw7LPlKwdgdpoY7Ty6qR7zk8S19pnL04Lb9hBpMz33uDExWf
 t2bsNmL0pXyXtdmX4JXjKel8h+R4sYFM06MH8+izD9AuWbRTLkifBG1kifLGB2CtH6lb3h
 OokJensUnk2J5GnOY4FGLJCN3Krkum+Csa1LuLH1Prfk76xI8ap/leEMrwg6Tl9xyTUnfY
 sFCSRzcVJKPZNvuL/01PhSqt+iRaUWA4QXTPNRnQa/fPLpJlFw0JNTP1U+khNW2odnqfaZ
 qi4ZaYdQsXmoirLoOx3dgiwmg/Y6tmj5aR3bdltpgU4HvIdWEr7/RjPMAcDqVw==
Date: Mon, 7 Aug 2023 11:12:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: atmel-hlcdc: Support inverting the pixel clock
 polarity
Message-ID: <20230807111246.663637a6@xps-13>
In-Reply-To: <20230610200515.GA1041001@ravnborg.org>
References: <20230609144843.851327-1-miquel.raynal@bootlin.com>
 <20230610200515.GA1041001@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

sam@ravnborg.org wrote on Sat, 10 Jun 2023 22:05:15 +0200:

> On Fri, Jun 09, 2023 at 04:48:43PM +0200, Miquel Raynal wrote:
> > On the SoC host controller, the pixel clock can be:
> > * standard: data is launched on the rising edge
> > * inverted: data is launched on the falling edge
> >=20
> > Some panels may need the inverted option to be used so let's support
> > this DRM flag.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> Hi Miquel,
>=20
> the patch is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> I hope someone else can pick it up and apply it to drm-misc as
> my drm-misc setup is hopelessly outdated atm.

I haven't been noticed this patch was picked-up, is your tree still
outdated or can you take care of it?

Thanks a lot,
Miqu=C3=A8l
