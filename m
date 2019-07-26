Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B477183
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 20:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB306EE28;
	Fri, 26 Jul 2019 18:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3AC6EE28
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 18:46:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C6F622009C;
 Fri, 26 Jul 2019 20:46:50 +0200 (CEST)
Date: Fri, 26 Jul 2019 20:46:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/11] JZ4740 SoC cleanup
Message-ID: <20190726184649.GC14981@ravnborg.org>
References: <20190725220215.460-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=cQNIelrcohPWRCFzBj8A:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bC4KCk9uIFRodSwgSnVsIDI1LCAyMDE5IGF0IDA2OjAyOjA0UE0gLTA0MDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4gSGksCj4gCj4gVGhpcyBwYXRjaHNldCBjb252ZXJ0cyB0aGUgUWkg
TEI2MCBNSVBTIGJvYXJkIHRvIGRldmljZXRyZWUgYW5kIG1ha2VzIGl0Cj4gdXNlIGFsbCB0aGUg
c2hpbnkgbmV3IGRyaXZlcnMgdGhhdCBoYXZlIGJlZW4gZGV2ZWxvcGVkIG9yIHVwZGF0ZWQKPiBy
ZWNlbnRseS4KPiAKPiBBbGwgdGhlIGNyYXBweSBvbGQgZHJpdmVycyBhbmQgY3VzdG9tIGNvZGUg
Y2FuIGJlIGRyb3BwZWQgc2luY2UgdGhleQo+IGhhdmUgYmVlbiByZXBsYWNlZCBieSBiZXR0ZXIg
YWx0ZXJuYXRpdmVzLgoKVGhlIG92ZXJhbGwgZGlmZnN0YXQgaXMgbWlzc2luZy4KSnVzdCBmb3Ig
Y3VyaW9zaXR5IGl0IHdvdWxkIGJlIG5pY2UgdG8gc2VlIHdoYXQgd2FzIGRyb3BwZWQgd2l0aCB0
aGlzCnBhdGNoLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
