Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 897267A298
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C544A6E430;
	Tue, 30 Jul 2019 07:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jul 2019 18:15:58 UTC
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA4A89DE6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 18:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E832A60632C0;
 Mon, 29 Jul 2019 20:08:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ehX5VuQgnl7G; Mon, 29 Jul 2019 20:08:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 70E276083139;
 Mon, 29 Jul 2019 20:08:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XjNoOe8nauWF; Mon, 29 Jul 2019 20:08:38 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D590B608311C;
 Mon, 29 Jul 2019 20:08:37 +0200 (CEST)
Date: Mon, 29 Jul 2019 20:08:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <339409106.53616.1564423717793.JavaMail.zimbra@nod.at>
In-Reply-To: <1564419921.1759.1@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
 <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
 <1564419921.1759.1@crapouillou.net>
Subject: Re: [PATCH 00/11] JZ4740 SoC cleanup
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: JZ4740 SoC cleanup
Thread-Index: pyW9XJwx/g8VXIVrZC/ODWU++joHAw==
X-Mailman-Approved-At: Tue, 30 Jul 2019 07:55:03 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 alsa-devel <alsa-devel@alsa-project.org>, James Hogan <jhogan@kernel.org>,
 linux-fbdev@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBXYXMgdGhpcyBzZXJpZXMgdGVzdGVk
IHdpdGggdGhlIEJlbiBOYW5vbm90ZSBkZXZpY2U/Cj4+IEkgaGF2ZSBvbmUgb2YgdGhlc2UgYW5k
IGZyb20gdGltZSB0byB0aW1lIEkgdXBncmFkZSB0aGUga2VybmVsIG9uIGl0Lgo+IAo+IFllcyEg
QXJ0dXIgKENjJ2QpIHRlc3RlZCBpdC4KPiAKPiBZb3UgY2FuIHRlc3QgaXQgeW91cnNlbGYsIGFm
dGVyIG1lcmdpbmcgdGhpcyBwYXRjaHNldCB3aXRoOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Zrb3VsL3NsYXZlLWRtYS5naXQKPiBicmFuY2ggbmV4
dCwKPiBnaXQ6Ly9naXQuZnJlZWRlc2t0b3Aub3JnL2dpdC9kcm0tbWlzYyBicmFuY2ggZHJtLW1p
c2MtbmV4dC4KPiAKPiBUaGVzZSB3aWxsIGJlIGluIDUuNC1yYzEuCgpBd2Vzb21lISBUaGFua3Mg
YSBsb3QgZm9yIGNsZWFuaW5nIHRoaXMgdXAuCgpUaGFua3MsCi8vcmljaGFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
