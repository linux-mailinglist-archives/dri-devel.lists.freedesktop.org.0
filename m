Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DA149351D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 07:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F5310E83C;
	Wed, 19 Jan 2022 06:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6E310E801
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 06:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1642574425;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=soxn4qgkDsTZ0oHmNOMh5qyy1VH0WMra/yBF1KFdkyA=;
 b=mDhwJ6A64h1u9LKK91u8VrQk1niBls3lKkpkpSbsdonYHAbR2zvclGS4ElY+YlQE6X
 fdxktMrEev2PpoaFbcDAfvKyz7p/5WGRLIPykNQlp4JGybb+DUwJrriEcRTJmp6rl0iK
 AGTQicUwQEAN2gzfGzeIIYDtRgbl3RY/Z0NlxJ8jngZ+nRiTUT+S/9RpF7R8n9Q+/FYe
 cqioEpmJzUVviuwTRMzFBG5LqoYZfrUHD1IKM0suKDpyDI3Nq8yk77dLqKzs2jlm26Zp
 8ZeT/QrooqXvw2LpQGw9H+bl14ilb2yJq2uyv/UH3F8VUsBEsIioNgbTJhQ7NS1HPHpZ
 zUDg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw4TlkQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.37.6 DYNA|AUTH)
 with ESMTPSA id D61423y0J6eNjFW
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 19 Jan 2022 07:40:23 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <13356060.GkHXLIg068@jason>
Date: Wed, 19 Jan 2022 07:40:22 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0989ACA-F6DB-4E16-8D95-5ACBAD90AACD@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <C846BAFB-473D-41D8-93B9-B9ECDD1846C1@goldelico.com>
 <AI0X5R.YWIZO63QXTF4@crapouillou.net> <13356060.GkHXLIg068@jason>
To: Paul Boddie <paul@boddie.org.uk>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 18.01.2022 um 23:59 schrieb Paul Boddie <paul@boddie.org.uk>:
>=20
> On Tuesday, 18 January 2022 17:58:58 CET Paul Cercueil wrote:
>>=20
>> Not at all. If the clock is disabled, the LCD controller is disabled,
>> so all the registers read zero, this makes sense. You can only read =
the
>> registers when the clock is enabled. On some SoCs, reading disabled
>> registers can even cause a complete lockup.
>=20
> My concern was that something might be accessing the registers before =
the=20
> clock had been enabled. It seems unlikely, given that the clock is =
enabled in=20
> the bind function, and I would have thought that nothing would invoke =
the=20
> different driver operations ("funcs") until bind has been called, nor =
should=20
> anything called from within bind itself be accessing registers.
>=20
>> Why is this JZ_LCD_OSDC_ALPHAEN bit needed now? I remember it working
>> fine last time I tried, and now I indeed get a black screen unless =
this
>> bit is set. The PM doesn't make it obvious that the bit is required,
>> but that wouldn't be surprising.
>=20
> It isn't actually needed. If the DMA descriptors are set up =
appropriately, the=20
> OSD alpha bit seems to be set as a consequence. In my non-Linux =
testing=20
> environment I don't even set any OSD registers explicitly, but the OSD =
alpha=20
> and enable flags become set when the display is active.

Is it set by DMA descriptors or by explicit code?

We did have an explicit setting of JZ_LCD_OSDC_ALPHAEN

https://www.spinics.net/lists/devicetree/msg438447.html

but that was postponed for further discussion. And now if we
add it (from basic functionality) back, it is fine again.

BR,
Nikolaus=
