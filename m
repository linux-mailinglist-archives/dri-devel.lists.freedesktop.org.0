Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE3465363
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 17:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5DE6E523;
	Wed,  1 Dec 2021 16:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E996E523
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638377585;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=IrLqeXQ7cnKmOP13b28CuGf9NhUY4ybFFkNm3lBDdyo=;
 b=cwvV9r0cfsuiCVIDsFf+gsOiOZF2MIZ+8JrpB08rAyftCZMzf/t0j5XO31u//9JMy/
 eQirRIPZN9oUQ9ADd0gC//++YlflpmOR2jfpz8QcOq4KBXlH+YlUGp/+8sxlIaFcE5Tt
 jLD/beSSzkw3Sg1zcDQAVWe05xCpYpL/uwGXCqGwtI/gW6K+1uL7yYmQGG8dsWECdI7o
 eHPbCT9oWVV38jrE0+V/Nb7Pd92TY7PXUSnbliI/91bOA4TqKGCtTQmW54ftNnGmgHWC
 foV60zyyOZlUaQ9p08IY+JYhyrYK6ybWduR+rtkFlOFFILCP49f283jnGR3YRbLhB8gM
 FhUg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u22M="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 SBL|AUTH)
 with ESMTPSA id e05ed8xB1Gr4YRR
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 1 Dec 2021 17:53:04 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v10 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <YaeQW/akoLE6SpEi@sirena.org.uk>
Date: Wed, 1 Dec 2021 17:53:03 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <3174DA41-EB38-4C30-8752-0D9C894C74A7@goldelico.com>
References: <cover.1638307601.git.hns@goldelico.com>
 <4daf0c5dbed2c47c97003ab8de0a7dbd2a335dc3.1638307601.git.hns@goldelico.com>
 <LKTF3R.YREPOCHOSMQN2@crapouillou.net> <Yad69aTXcGixXvy3@sirena.org.uk>
 <46070A95-0FA9-43F9-A9A9-52A7B58B88F5@goldelico.com>
 <EDWF3R.CMVWMJL42OH9@crapouillou.net>
 <58C550A4-A21E-47BA-8BAE-00B927DC7A2E@goldelico.com>
 <YaeQW/akoLE6SpEi@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,


> Am 01.12.2021 um 16:10 schrieb Mark Brown <broonie@kernel.org>:
>=20
> On Wed, Dec 01, 2021 at 03:33:24PM +0100, H. Nikolaus Schaller wrote:
>>> Am 01.12.2021 um 15:03 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>>> Please make it mandatory in DTS then, and use devm_regulator_get() =
in the driver.
>=20
>> Well, I just wonder why the elegant devm_regulator_get_optional() =
exists at all
>> and seems to be used in ca. 80 places.
>=20
> Frankly because half of them are broken usages like this since people
> seem determined to have the most fragile error handling they can :/

I see. I had made the mistake myself to not check for NULL pointer on
regulator_disable here...

> There are valid use cases for it, with things like SD cards where some
> supplies are genuinely optional and simply constrain what features are
> available if they're omitted from the design.  You also see some =
devices
> with the ability to replace internal regulators with external ones.
>=20
>> And if it is not allowed, why some DTS should be forced to add not =
physically existing dummy-regulators.
>=20
> Again, if the supply can be physically absent that is a sensible use
> case but that means completely absent, not just not software
> controllable.  We can represent fixed voltage regulators just fine.

The question may be how we can know for a more generic driver that there =
is always a regulator.
In the present case we know the schematics but it is just one example.

>=20
>> AFAIR drivers should implement functionality defined by DTS but not =
the other way round: enforce DTS style.
>> BTW: there is no +5 mains dummy regulator defined in ci20.dts.
>=20
> It wouldn't be the first time a DTS were incomplete, and I'm sure it
> won't be the last.
>=20
>> What I fear is that if we always have to define the mains +5V (which =
is for example not
>> defined in ci20.dts), which rules stops us from asking to add a =
dummy-regulator from 110/230V to +5V as well.
>=20
> It is good practice to specify the full tree of supplies all the way =
to
> the main supply rail of the board, this ensures that if we need the
> information for something we've got it (even if that thing is just =
that
> we've got to the root of the tree).  There's potential applications in
> battery supplied devices for managing very low power situations.

Indeed. So let's modify it as you have suggested.

BR and thanks,
Nikolaus

