Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF813E18FF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 18:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502336EA46;
	Thu,  5 Aug 2021 16:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EA26EA46
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628179296;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=kz7en5zl8fiteD+7Oum9C7YsAgoEzeXk8l+oEFfizAo=;
 b=sZu6BlP6OpE75L0Oqdx3CmyEW36PC4r0dt8PPRWad0sdlneMMt5MUP+cvZ+Ua/RBCo
 uORUfbbbf5w294rJ66uvHvvCRp2oy7wk1DtMqKhX0eV5pCTD2N78eLD9vZl0hmo3QZKB
 uLmUSfp4poDsYCRIgvtBLu4iYG7KbNFdfoGt1/wEaNAZofwFoZTfCV1U7/qj0a69nV+l
 hLG1LqSsVLC9I+tELJ6I5xsIboL2oC7RWv8ipZt2BtsfSwv0usc/48U1l9LUjnst2K8e
 7kSCGNG3qtcyT/W4UvOcdcGmBY78g7e53FCkYlIIHQ0DNxhlpvAvfHqo6CPS7+nEFe5b
 R1qQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw4rovw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x75G1W7WQ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 5 Aug 2021 18:01:32 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2 3/8] drm/ingenic: Add support for JZ4780 and HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CDHDXQ.QTKW3N6WINVB2@crapouillou.net>
Date: Thu, 5 Aug 2021 18:01:31 +0200
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0F96C1D5-D98B-4461-B691-20A0C3C38C18@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
 <263a207d2aeb8bc95aa8464212dcc9b225548f4f.1628172477.git.hns@goldelico.com>
 <CDHDXQ.QTKW3N6WINVB2@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 05.08.2021 um 17:22 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus & Paul,
>=20
> Le jeu., ao=C3=BBt 5 2021 at 16:07:52 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>> Add support for the LCD controller present on JZ4780 SoCs.
>> This SoC uses 8-byte descriptors which extend the current
>> 4-byte descriptors used for other Ingenic SoCs.
>> Also, add special handling for HDMI-A connectors.
>> For some reason, only the primary planes are working
>> properly. As soon as the overlay plane is enabled
>> things go south :P
>> Tested on MIPS Creator CI20 board.
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 163 =
++++++++++++++++++++--

... snip ...

>=20
> We already have these in ingenic-drm.h...
>=20
> Please only add the macros that you need and are missing.
>=20
> Cheers,
> -Paul


all are valid comments. We'll add them for v3 or find answers
if some code fragments are needed (even if we don't know why)
or not.

BR and thanks,
Nikolaus
