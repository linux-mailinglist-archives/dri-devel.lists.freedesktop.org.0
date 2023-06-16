Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D2C732C86
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 11:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE69910E58F;
	Fri, 16 Jun 2023 09:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D3110E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 09:56:16 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686909373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/T4ahbYYhg9xGxNTufEKBAfGkusYwd6bc/dclvufaU=;
 b=Sx1FgyZNi7Iq7mGdv/wHgfG3TQOPJHaRKmm5BPiZaOayV6HAUct1qvoWRvhHe29vP9/iIY
 Lb1aACB10guksm0QOI/OGB3PeNyGR9HiakjV4CzVGU1AHvU5cdnmTi7jmH8E2Ggv76R97C
 9mOcAvgpGMooOz7fMVusUl9PYZ3BnpBph7/WuwCh7OD7Um+WRRWDcMAYQutW9AEGmhc0pZ
 SNX275wOJb8ZUQF0SZiafa5xptpHXPOdmc0khHqJUAJd7UyndInwJPLT2MxKuvU1e2Jq7s
 e0LXaaHlT/vIxV8UuOf3/fEMVQwNcLYfDbB/mMBtJp/F8ovIfFjhB0b0hibapA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA3BF1C0003;
 Fri, 16 Jun 2023 09:56:12 +0000 (UTC)
Date: Fri, 16 Jun 2023 11:56:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/7] drm/panel: sitronix-st7789v: Specify the expected
 bus format
Message-ID: <20230616115611.77b8aff9@xps-13>
In-Reply-To: <20230610201246.GD1041001@ravnborg.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-4-miquel.raynal@bootlin.com>
 <20230610201246.GD1041001@ravnborg.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

sam@ravnborg.org wrote on Sat, 10 Jun 2023 22:12:46 +0200:

> On Fri, Jun 09, 2023 at 04:59:47PM +0200, Miquel Raynal wrote:
> > The LCD controller supports RGB444, RGB565 and RGB888. The value that is
> > written in the COLMOD register indicates using RGB888, so let's clearly
> > specify the in-use bus format. =20
>=20
> Confused.
> MEDIA_BUS_FMT_RGB666_1X18 assumes 6 bits per color.
> But RGB888 is 8 bits per color.
>=20
> Something that I have forgotten, or is this inconsistent?

That is a typo indeed, I meant RBG666.

Thanks, Miqu=C3=A8l
