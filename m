Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C809F464F27
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 14:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F052F6FFC4;
	Wed,  1 Dec 2021 13:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312476FFBE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638366712;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=W7f70RtAqaN1N5sEJzpG4MwxOjQDczfgFM/pcj4SZUg=;
 b=m6qEaWMvpMOGS7wxZArT2XOzRwNOwE/M+CTSsX45yLUg9uo2FNBaPFxWgZkYlGUAAk
 aMPhRo4cJWVOJZLLHYtFb9ipQMmm0BRcv+Zv9Mg4777Ve9WYbZgljWlRKqY4nbIYrcA2
 6wXicjW7vrFiawIOTQfoB4Tu9AbJyQ/t1uFrWlo3XAo1vHvQyFMbb88YA/gqHgAhQmhB
 oWJhcWX+nEGNJh0nJ0jmnfZktiJH+tLrwSNrgkTX1XRwU6sGF3cZnCqm1KqWyxwBIMrW
 TrVsINl6JXTvACY8NC2WKPX2hWZ2y0JD7VGdjXu84E6Wl8CyOuKjYveOt5eg6PGjRihA
 wZhQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u22M="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 SBL|AUTH)
 with ESMTPSA id e05ed8xB1DppXQf
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 1 Dec 2021 14:51:51 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v10 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <Yad69aTXcGixXvy3@sirena.org.uk>
Date: Wed, 1 Dec 2021 14:51:51 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <46070A95-0FA9-43F9-A9A9-52A7B58B88F5@goldelico.com>
References: <cover.1638307601.git.hns@goldelico.com>
 <4daf0c5dbed2c47c97003ab8de0a7dbd2a335dc3.1638307601.git.hns@goldelico.com>
 <LKTF3R.YREPOCHOSMQN2@crapouillou.net> <Yad69aTXcGixXvy3@sirena.org.uk>
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

Hi,

> Am 01.12.2021 um 14:39 schrieb Mark Brown <broonie@kernel.org>:
>=20
> On Wed, Dec 01, 2021 at 01:02:45PM +0000, Paul Cercueil wrote:
>> Le mar., nov. 30 2021 at 22:26:37 +0100, H. Nikolaus Schaller
>=20
>>> +	regulator =3D devm_regulator_get_optional(&pdev->dev, =
"hdmi-5v");
>>> +	if (IS_ERR(regulator)) {
>>> +		ret =3D PTR_ERR(regulator);
>=20
> Why is this using _optional()?  This should only be done when the =
supply
> can be physically absent

There can be +5V for HDMI but without a regulator that is visible to or =
controllable
by the driver.

So hdmi-5v can be simply missing in DTS in which case the driver does =
not need to
care about. The driver just can't turn it on or off.

> (in which case I'd expect to see special
> handling).

The special case is to not enable/disable the regulator if it does not =
exist
and assume that there is hardware providing it otherwise (the driver =
can't know
that except by using get_optional). This is done by the code below

>>> +	if (IS_ERR(regulator)) {

...

> +	if (!regulator)
> +		return 0;
>=20
> +	ret =3D regulator_enable(regulator);

...

BR and thanks,
Nikolaus




