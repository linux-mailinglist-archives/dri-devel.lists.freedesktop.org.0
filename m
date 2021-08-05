Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C03E1912
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 18:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFA06E575;
	Thu,  5 Aug 2021 16:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F79D6E575
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 16:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628179642;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=TK4Z4SGFS8N8geJ9iPm+eTLiTkHLkJnX7aTss4SlKQM=;
 b=ZXlkVoOBf575FzjuzPu7Z2k0mk6nsQYnpyymLg0ZhYe/I2KvVNqvKOVZa0uZ4tZQMP
 gjFq6HmGXTQB+AcaNXcMG5FkwvkEo4QLWA4Wps/ewyASgGhtu306yP22re/vCGABvWOA
 3Rq8dKeFNu0D2t76f/RdtWHkmCY1p2OvjofJrwNgLnaFcJ0mswQYykyVYyBCBA8pBSoY
 E3EeSkfYoX3qz5mkhOU4Z8Kpfa0QlkTUAiLgJ6mHnzoNeM8UlQoFhfEH6lOGe7qYMIsU
 z7bDicNTYPmpZGk51rIfXtKK1Y7mmDpklLF6L7A6A3N5JMfP5WEOdVd+xfPFbJ+hc0oF
 BEPg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw4rovw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x75G7L7X8
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 5 Aug 2021 18:07:21 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2 8/8] [RFC] drm/ingenic: convert to component framework
 for jz4780 hdmi
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <YQv+DC5yTEGlJYuD@pendragon.ideasonboard.com>
Date: Thu, 5 Aug 2021 18:07:20 +0200
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BDF501D1-BA1D-4866-8EAF-3862F6CEC6F4@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
 <77554dd2612f418f6ab74a8be06c82b71410e0e6.1628172477.git.hns@goldelico.com>
 <YQv+DC5yTEGlJYuD@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

> Am 05.08.2021 um 17:04 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> Hi Nikolaus,
>=20
> Thank you for the patch.
>=20
> On Thu, Aug 05, 2021 at 04:07:57PM +0200, H. Nikolaus Schaller wrote:
>> This patch attempts to convert the ingenic-dw-hdmi driver
>> into a version that uses the component framework.
>=20
> Why ? What problem would this solve ?

Well, it was suggested in a v1 we did post several months ago. I have =
not
looked up by whom and do not exactly remember the reasons.

We now simply thought that it is common style since dome dw-hdmi drivers
make use of it but some others don't. And we got it working without.

If it is not needed/requested by anyone, we can drop it from v3 (or add =
later).

BR and thanks,
Nikolaus=
