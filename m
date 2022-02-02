Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAEC4A70D4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 13:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787D210E2FF;
	Wed,  2 Feb 2022 12:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [81.169.146.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0C010E2FF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643805197;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=HEKpAL8zUujJk/o0QQVajUy6UBmtafxTCRO7fO2vf5I=;
 b=f4WIYLhe6bdfheCRpkePnaHx3akFvti5kEB/I28gGltL0yaAZEZC014OI1eloEhC4q
 NiusV5G6RoQAkXtMuufjNYgVT48zBANcSkASrQK9FpvsWXkq1mW/Tqmg8MF5Lhl1NkRX
 01A4kEDQxz0GWM3rSSl5RK/jaroLuS4szwwpOrQKInDnzLTN/EskGbmOLvjaQ+6ZhY4e
 j9k0AiZhSy1BUniEnQY7CA6A6upxatu9gwjeZshKBQjmVUrWOXvHpvyEI1raTR0pOmlc
 m3cCw5lQVVZVtuE0n9dRlIUtCaYjnq4IiZZi9LuuuUtfz2ff6877pbN6b2XReSBLrYH8
 eKow==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDCocQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y12CXGAH1
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Feb 2022 13:33:16 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v12 2/9] drm/ingenic: Add support for JZ4780 and HDMI
 output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <5ZFO6R.M6Z7S3EBA1YC1@crapouillou.net>
Date: Wed, 2 Feb 2022 13:33:15 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <78F51BD7-112A-458D-8FCE-6A67572A182B@goldelico.com>
References: <cover.1643632014.git.hns@goldelico.com>
 <6a7b188769a7ad477bf8cb71e1b9bc086b92388d.1643632014.git.hns@goldelico.com>
 <N7AO6R.7I6FABF106MT1@crapouillou.net>
 <1F27171F-DFCA-4707-8F50-D1A343F6D78E@goldelico.com>
 <CYEO6R.2QDXEFO5G1WQ3@crapouillou.net>
 <37CB6D86-4295-4281-BF3E-3E4B40E74196@goldelico.com>
 <5ZFO6R.M6Z7S3EBA1YC1@crapouillou.net>
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



> Am 02.02.2022 um 13:28 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>=20
>=20
> Le mer., f=C3=A9vr. 2 2022 at 13:17:14 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>>> Am 02.02.2022 um 13:06 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Hi Nikolaus,
>>>>>> @@ -446,6 +454,9 @@ static int =
ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>>>>>> 	if (!crtc)
>>>>>> 		return 0;
>>>>>> +	if (plane =3D=3D &priv->f0)
>>>>>> +		return -EINVAL;
>>>>> This will break JZ4725B -> JZ4770 SoCs, the f0 plane is perfectly =
usable there.
>>>> Hm. I think it was your request/proposal to add this [1]?
>>> Because otherwise with your current patchset the f0 plane does not =
work *on JZ4780*.
>> Not that I am eager to fix that, but...
>> maybe it could be better to fix than having the check and -EINVAL =
depend on SoC compatible string
>> (or some new flag in soc_info. plane_f0_not_working)?
>=20
> Totally agree! A proper fix would be much better. A =
"plane_f0_not_working" in the meantime is OK with me.

Ok, then I'll prepare a v13 with plane_f0_not_working.

>=20
> Note that there are other things not working with your current =
implementation, for instance you cannot set the X/Y start position of =
the f1 plane, which means it's only really usable for fullscreen =
desktop/windows.

Is setting x/y possible for the other SoC?

>=20
>>> It does work on older SoCs.
>>>> What I have forgotten is why the f0 plane should not be usable for =
jz4780.
>>> We return an error here to prevent userspace from using the f0 plane =
until it's effectively working on the JZ4780.
>> Well, what would be not working with that plane if user-space would =
try to use it?
>=20
> =46rom what I remember, it wouldn't show anything on screen, and after =
that trying to use the f1 plane wouldn't work either.

Ok. That may become a big project to fix. So let's do step 1 first.

BR and thanks,
NIkolaus

