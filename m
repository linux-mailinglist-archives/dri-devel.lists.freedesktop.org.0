Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9D750D45
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00F510E586;
	Wed, 12 Jul 2023 15:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F2610E586
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:57:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 693F0E000E;
 Wed, 12 Jul 2023 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689177471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Emj6O5VzwRAW23o4/ZZ5q4gcOp7uJIiUitDXvX5kCrc=;
 b=jw4tjRJw29w1i2I7SE52yuv4Nf+ETTf4fnc/gSiXGHa3ZAwt7C8lF0olbkRC8Eoh3UUjYw
 yrZutfXVvFSKFJpVPr7SVKGgi5HzRQlyI1GP9UDGTUudq3pvmy3CVvAO3lofCWy955us4i
 1j7NDgRLs/tHZ+6AZNw4XpJY3JwWGkUHg4L0ZuFCcOKALc+683HyveFOiyWiavZAYq2hoz
 /FsgTTZT67EDKeN5Xy9CKbNHeuPOCd1Yt3vvSGiirj6qAaAXnj/dwXkF60qJPf8V9jOQ6L
 mshB7OBDwj3wfxY7wI1tz6x1+So+YMF75cxmh24D12bzeAOSU3ZN35+zcw8IKw==
Date: Wed, 12 Jul 2023 17:57:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: atmel-hlcdc: Support inverting the pixel clock
 polarity
Message-ID: <20230712175747.09754861@xps-13>
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

Hello,

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

Looks like nobody picked this up yet, can someone take it? Let me know
if you want me to send it again.

Thanks,
Miqu=C3=A8l
