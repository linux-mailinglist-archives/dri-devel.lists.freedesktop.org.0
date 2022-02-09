Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D28B4AF38E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22A010E53A;
	Wed,  9 Feb 2022 14:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32EB10E53A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:02:59 +0000 (UTC)
Date: Wed, 09 Feb 2022 14:02:39 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v13 0/9] MIPS: JZ4780 and CI20 HDMI
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <F0J17R.I8VTR1ZGV2Z2@crapouillou.net>
In-Reply-To: <4294A500-52EB-4319-9B89-F9DAC48EBF03@goldelico.com>
References: <cover.1643819482.git.hns@goldelico.com>
 <9ZC17R.T1L0TBAW7MJA3@crapouillou.net>
 <4294A500-52EB-4319-9B89-F9DAC48EBF03@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mer., f=E9vr. 9 2022 at 14:51:12 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Paul,
>=20
>>  Am 09.02.2022 um 12:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  I tried applying patches 1-2, but they don't apply cleanly on top=20
>> of drm-misc/drm-misc-next.
>=20
> Ok I had rebased to linux-next some days ago and it appears that=20
> patch 1/9 has now arrived in drm-misc/drm-misc-next.
> So we can drop 1/9.

Yes, some weeks ago I did apply patch 1/9 from one of your previous=20
patchsets. Patch 2 was applied as well (commit b807fd2c43fe=20
("drm/ingenic: Add support for JZ4780 and HDMI output")), but you then=20
said that it didn't work and needed a fix.

For this patchset you should always base on top of=20
drm-misc/drm-misc-next, and not on linux-next; they have different=20
schedules. You can drop patch #1, and rework patch #2 so that it only=20
fixes the previously incorrect behaviour.

>=20
>>=20
>>  Could you rebase on top of that tree?
>=20
> Sure.
>=20
> Unfortunatley my v14 breaks the display again. It is not much fun to=20
> develop on top of such a moving target...

I can imagine...

Cheers,
-Paul

> So I have to find out first what was broken this time before I can=20
> send out a new version.
>=20
> BR,
> Nikolaus


