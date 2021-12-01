Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF2464EAB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 14:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B566FAA6;
	Wed,  1 Dec 2021 13:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759046FA85
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 13:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638364685;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=4c3epF2ScffUjNFE7pqyVEAU/QWj/7JeeA6yeKVR/Xw=;
 b=ed5XJ6A0DHDOixvsBEnMCR/tZI4nrM6770k+bAgJ/0JHUnyN+x7zhyk/nrEGbiiBE4
 +00amMPfU8SLs0KhySY3C6FHXQLohYA51L3nFcggRaxRoQ2FB7FUZzEWXaH8wn+cmH0x
 PI4l4kQ2BBVPKL30u7py2gHXByEAyDlhFRpdcQbyShx+Jop3mq7nHsG/WFULSxnNck0W
 rojwHKwQdYNG2wSegzNxoep9lnttsWGoJircnP7KFGKRgQnwlk9/ksXXLDwxaMlsOass
 8MAkSsL6jm8JyJ5NMhSqLoBXCjc596a7MMhRZm4L6JCdIm8lvYaOLl94w4DOiW1EuKgM
 PotA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u22M="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 SBL|AUTH)
 with ESMTPSA id e05ed8xB1DI4XDF
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 1 Dec 2021 14:18:04 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v10 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <LKTF3R.YREPOCHOSMQN2@crapouillou.net>
Date: Wed, 1 Dec 2021 14:18:02 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <F852C647-7368-4BC1-A3C6-CE40F5A757F9@goldelico.com>
References: <cover.1638307601.git.hns@goldelico.com>
 <4daf0c5dbed2c47c97003ab8de0a7dbd2a335dc3.1638307601.git.hns@goldelico.com>
 <LKTF3R.YREPOCHOSMQN2@crapouillou.net>
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


> Am 01.12.2021 um 14:02 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mar., nov. 30 2021 at 22:26:37 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>> A specialisation of the generic Synopsys HDMI driver is employed for
>> JZ4780 HDMI support. This requires a new driver, plus device tree and
>> configuration modifications.
>> Here we add Kconfig DRM_INGENIC_DW_HDMI, Makefile and driver code.
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/ingenic/Kconfig           |   9 ++
>> drivers/gpu/drm/ingenic/Makefile          |   1 +
>> drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 138 =
++++++++++++++++++++++
>> 3 files changed, 148 insertions(+)
>> create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>> diff --git a/drivers/gpu/drm/ingenic/Kconfig =
b/drivers/gpu/drm/ingenic/Kconfig
>> index 3b57f8be007c4..4efc709d77b0a 100644
>> --- a/drivers/gpu/drm/ingenic/Kconfig
>> +++ b/drivers/gpu/drm/ingenic/Kconfig
>>=20


>> +	}
>> +
>> +	if (!regulator)
>> +		return 0;
>=20
> Blank line here.

It is one of these cases where checkpatch doesn't complain although it =
should be improved...

>=20
> But I can add it myself when applying.

Yes, please. So that we are not wasting mailing list bandwidth...

> I'll just wait for Rob's ack first.

Indeed. Fortunately he had the right hint how to fix 3/8 quickly.

BR and thanks,
NIkolaus

