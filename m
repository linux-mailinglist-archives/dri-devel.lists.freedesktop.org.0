Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D9545CA5B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224C789B30;
	Wed, 24 Nov 2021 16:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [85.215.255.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771CC89B30
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637772497;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=icc13YC5mHwE0XQvAD6VEy3MsLwt9uSPlxq+Nx/D1H4=;
 b=YUnGh4OjkMKYt7K5BhVP0dlBbNqMmnci+MORTJkKXQ6y7MlxZrjR9JjuoNqdipnaK9
 nqemSaP1pvW/Cbw77TFiM5LPFoHXE7mjs2/b9LwrH565ebcmWMWr2qMaGNVKvE1w711S
 cL0LYlqGbUhunijvOfMhhcxgDtGnHHThxXQvMzVvT98VN5f+NZHBB7AUtRvzOwOWp4oB
 ewEBmbOCTaJ9iwRyirRd5Ep0V7+ry1cEVl8jZJ3sohImjJw/q5zY+RXR3SG2ErxXD1cR
 Fj9jVhE6K0ntaf4UqxEVEloyda/mdLwW6rk1XJmmlScC+kDdWtsj2u+sfZiOtVts4pl/
 8InQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xAOGmG3vt
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 24 Nov 2021 17:48:16 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 0/8] MIPS: JZ4780 and CI20 HDMI
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <B6B358E8-4395-442F-A353-396D8DC54C66@goldelico.com>
Date: Wed, 24 Nov 2021 17:48:16 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0913ACC-5803-4FF7-AF96-CE8CB3F9F323@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <J4K13R.CGVJ0IY95LC51@crapouillou.net>
 <B6B358E8-4395-442F-A353-396D8DC54C66@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 23.11.2021 um 21:44 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Paul,
>=20
>> Am 23.11.2021 um 21:12 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>> Hi Nikolaus,
>>=20
>> I think if you can fix the last few things I commented on, and I get =
an ACK from Rob for the Device Tree related patches, then it will be =
ready to merge.
>=20
> Fine! Especially for finding the NULL regulator risk.
>=20
> Will do in the next days.
> For the unwedge pinmux I have to check if we need it at all.

No. It is only needed by the driver to take care of for a special =
potential hardware hickup.
The current code does nothing and I have removed it and everything still =
works as
before.

There remains only one question for a v9: can we store the (single) =
regulator reference
in a static variable or should we define a struct and allocate memory in =
patch 4/8?

BR and thanks,
Nikolaus

