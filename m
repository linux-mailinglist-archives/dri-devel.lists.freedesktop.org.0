Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115A4A708C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 13:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1215710EB09;
	Wed,  2 Feb 2022 12:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469A810EB09
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 12:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643804235;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=WWwsGqi+NRGxnCYP532R+aZUVKmZ56mL3SC+CquYdxA=;
 b=oS0Ye5SsysbA2dkMwlc985ZOhg25qvwTvi0/RvnmDVMqM+S/MjjNPDdXDNQGD4EmKs
 P1JHCLFDWG1eu2tGrKHfLDN7M29OWV1ckxYFsscoXfN0CInnQGC79lyv0PMxlWKdnfS+
 xrVUgVVckIpbW+W+XEgkXlOOVSttMA3e60qNivYfGiVuFcdT0tBldY9pqbyqvrOikDu6
 D59XIImz3wAj3icZ1RE5TKuAwHxllNZsq9+PgQg/Dlj4oivdpMPDc5G4zjNdkIhrt7di
 aUfU0itAj+RHUFLZxBjdpMgPZ3KyUQqjmN+2KbHB8CfGP9B2qkHoXHZ3RZfBugF8muWd
 8/qQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDCocQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y12CHE9xV
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Feb 2022 13:17:14 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v12 2/9] drm/ingenic: Add support for JZ4780 and HDMI
 output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CYEO6R.2QDXEFO5G1WQ3@crapouillou.net>
Date: Wed, 2 Feb 2022 13:17:14 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <37CB6D86-4295-4281-BF3E-3E4B40E74196@goldelico.com>
References: <cover.1643632014.git.hns@goldelico.com>
 <6a7b188769a7ad477bf8cb71e1b9bc086b92388d.1643632014.git.hns@goldelico.com>
 <N7AO6R.7I6FABF106MT1@crapouillou.net>
 <1F27171F-DFCA-4707-8F50-D1A343F6D78E@goldelico.com>
 <CYEO6R.2QDXEFO5G1WQ3@crapouillou.net>
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
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 02.02.2022 um 13:06 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>>>> @@ -446,6 +454,9 @@ static int =
ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>>>> 	if (!crtc)
>>>> 		return 0;
>>>> +	if (plane =3D=3D &priv->f0)
>>>> +		return -EINVAL;
>>> This will break JZ4725B -> JZ4770 SoCs, the f0 plane is perfectly =
usable there.
>> Hm. I think it was your request/proposal to add this [1]?
>=20
> Because otherwise with your current patchset the f0 plane does not =
work *on JZ4780*.

Not that I am eager to fix that, but...
maybe it could be better to fix than having the check and -EINVAL depend =
on SoC compatible string
(or some new flag in soc_info. plane_f0_not_working)?

> It does work on older SoCs.
>=20
>> What I have forgotten is why the f0 plane should not be usable for =
jz4780.
>=20
> We return an error here to prevent userspace from using the f0 plane =
until it's effectively working on the JZ4780.

Well, what would be not working with that plane if user-space would try =
to use it?

>=20
> Cheers,
> -Paul

BR and thanks,
Nikolaus=
