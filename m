Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEA64AF344
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 14:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B42E10E490;
	Wed,  9 Feb 2022 13:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C2110E490
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644414674;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=jA//raiEAQNJt49nn2RrsPVb29dWMlgBK10K+Ak3DxA=;
 b=d6KPdwgPmdMsAhpKpVRJBy9e3u6cVVqGChNYv8v37GPaAuHoW0wuePBR6cxqAFQtss
 Hpfeh+ldKDl3hY0b/kv8GvRNxH1/qtc43nMm5wPj3UjMlOhsy0C5B6fKM6acZ/trBjp3
 dSapsDtabozCAsXYnzxXoiQ5ZNNA2xBamzAYiqQ1KS4ApYZ4SGikXKYhpaS5Wj+F/vDX
 owxbDn2SbWxIECVdvKaYCYkbXKxz9cOf++A8DMOK7i5v2PA0m1pnyjtEV0LphhjOmJYZ
 iVZGOTa/v19A6oYrJygxt2qlOIeAkrkzmV59thD6IgmgNOJIQYHnfida6KmKn3o7LOgm
 jKvQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMYawg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y19DpCguK
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 9 Feb 2022 14:51:12 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v13 0/9] MIPS: JZ4780 and CI20 HDMI
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9ZC17R.T1L0TBAW7MJA3@crapouillou.net>
Date: Wed, 9 Feb 2022 14:51:12 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <4294A500-52EB-4319-9B89-F9DAC48EBF03@goldelico.com>
References: <cover.1643819482.git.hns@goldelico.com>
 <9ZC17R.T1L0TBAW7MJA3@crapouillou.net>
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
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Paul,

> Am 09.02.2022 um 12:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> I tried applying patches 1-2, but they don't apply cleanly on top of =
drm-misc/drm-misc-next.

Ok I had rebased to linux-next some days ago and it appears that patch =
1/9 has now arrived in drm-misc/drm-misc-next.
So we can drop 1/9.

>=20
> Could you rebase on top of that tree?

Sure.

Unfortunatley my v14 breaks the display again. It is not much fun to =
develop on top of such a moving target...
So I have to find out first what was broken this time before I can send =
out a new version.

BR,
Nikolaus=
