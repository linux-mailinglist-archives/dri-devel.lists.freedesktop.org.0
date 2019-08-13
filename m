Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D18E714
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF59A6E942;
	Thu, 15 Aug 2019 08:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230D36E0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 10:02:00 +0000 (UTC)
Date: Tue, 13 Aug 2019 12:01:48 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
To: Philippe =?iso-8859-1?q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-Id: <1565690508.1856.0@crapouillou.net>
In-Reply-To: <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net> <20190812081640.GA26727@dell>
 <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1565690517; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZbzHVM6ENaR4P/6+oOoubZ60cH5LA2N4J6V2DJChuP0=;
 b=pFFfezQjKuJRCyCrZ9/ijjroaefD35Husngjhtv0sS9eRbULkJZieHwFjjUUwZHaOSMVhv
 Jym9DJW3vwQNxQw4SI21TSkg5AYgp4PLMnIjtp7Fi2rteFN9o2S3rSBW+rrUXddKsUjfoL
 iN4pdyxvhjsec4lYAWRoFxESQB5CuEc=
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
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGhpbGlwcGUsCgoKTGUgbWFyLiAxMyBhb8O7dCAyMDE5IMOgIDEwOjQ0LCBQaGlsaXBwZSAK
PT9pc28tODg1OS0xP3E/TWF0aGlldS1EYXVkPUU5Pz0gPGY0YnVnQGFtc2F0Lm9yZz4gYSDDqWNy
aXQgOgo+IEhpIExlZSwKPiAKPiBPbiA4LzEyLzE5IDEwOjE2IEFNLCBMZWUgSm9uZXMgd3JvdGU6
Cj4+ICBPbiBUaHUsIDI1IEp1bCAyMDE5LCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+PiAKPj4+ICBJ
dCBoYXMgYmVlbiByZXBsYWNlZCB3aXRoIHRoZSBpbmdlbmljLWlpbyBkcml2ZXIgZm9yIHRoZSBB
REMuCj4+PiAKPj4+ICBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWls
bG91Lm5ldD4KPj4+ICBUZXN0ZWQtYnk6IEFydHVyIFJvamVrIDxjb250YWN0QGFydHVyLXJvamVr
LmV1Pgo+Pj4gIC0tLQo+Pj4gICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgfCAgIDkgLS0KPj4+
ICAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgIHwgICAxIC0KPj4+ICAgZHJpdmVycy9tZmQvano0
NzQwLWFkYy5jIHwgMzI0IAo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMzM0IGRlbGV0aW9ucygtKQo+Pj4gICBkZWxldGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvano0NzQwLWFkYy5jCj4+IAo+PiAgQXBwbGllZCwgdGhh
bmtzLgo+IAo+IEl0IHNlZW1zIHRoZSByZXBsYWNlbWVudCBpcyBkb25lIGluICJNSVBTOiBxaV9s
YjYwOiBNaWdyYXRlIHRvCj4gZGV2aWNldHJlZSIgd2hpY2ggaXMgbm90IHlldCBtZXJnZWQuCgpJ
dCdzIG1lcmdlZCBpbiB0aGUgTUlQUyB0cmVlLCB0aG91Z2gsIHNvIGl0J2xsIGJsZW5kIHRvZ2V0
aGVyIGp1c3QKZmluZSBpbiBsaW51eC1uZXh0LgoKPiAKPiBQcm9iYWJseSBlYXNpZXIgaWYgdGhp
cyBwYXRjaCBnb2VzIHRocnUgdGhlIE1JUFMgdHJlZSBhcyBwYXJ0IG9mIHRoZQo+ICJKWjQ3NDAg
U29DIGNsZWFudXAiIHNlcmllcy4KPiAKPiBSZWdhcmRzLAo+IAo+IFBoaWwuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
