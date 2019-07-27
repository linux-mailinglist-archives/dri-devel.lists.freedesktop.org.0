Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7E78618
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E211389CAF;
	Mon, 29 Jul 2019 07:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C07A6EE86
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 03:20:17 +0000 (UTC)
Date: Fri, 26 Jul 2019 23:19:45 -0400
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/11] JZ4740 SoC cleanup
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <1564197585.6472.0@crapouillou.net>
In-Reply-To: <20190726184649.GC14981@ravnborg.org>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190726184649.GC14981@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1564197613; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYjAC67ZYcDwtcnIBpp0BzLOMVIg3F/G58/tAsJimxs=;
 b=ORUDr6CuY7vpgmdik7Ldm16UXWRFBr6Ee4ABQbj6tTfLvxBPwmhKA6bLpfcQxX+exzomjP
 TDrZy1fzdFeQCmOXR6cIQOjxRV8Q06DX/kYE2jocswD/4JlyOxJP5kSuaV94FjAfM/JVnu
 CJlyiJfb7/kikgxqr4FsYUPCYzzFns0=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSB2ZW4uIDI2IGp1aWwuIDIwMTkgw6AgMTQ6NDYsIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4gYSAKw6ljcml0IDoKPiBIaSBQYXVsLgo+IAo+IE9uIFRodSwgSnVsIDI1LCAyMDE5
IGF0IDA2OjAyOjA0UE0gLTA0MDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4+ICBIaSwKPj4gCj4+
ICBUaGlzIHBhdGNoc2V0IGNvbnZlcnRzIHRoZSBRaSBMQjYwIE1JUFMgYm9hcmQgdG8gZGV2aWNl
dHJlZSBhbmQgCj4+IG1ha2VzIGl0Cj4+ICB1c2UgYWxsIHRoZSBzaGlueSBuZXcgZHJpdmVycyB0
aGF0IGhhdmUgYmVlbiBkZXZlbG9wZWQgb3IgdXBkYXRlZAo+PiAgcmVjZW50bHkuCj4+IAo+PiAg
QWxsIHRoZSBjcmFwcHkgb2xkIGRyaXZlcnMgYW5kIGN1c3RvbSBjb2RlIGNhbiBiZSBkcm9wcGVk
IHNpbmNlIHRoZXkKPj4gIGhhdmUgYmVlbiByZXBsYWNlZCBieSBiZXR0ZXIgYWx0ZXJuYXRpdmVz
Lgo+IAo+IFRoZSBvdmVyYWxsIGRpZmZzdGF0IGlzIG1pc3NpbmcuCj4gSnVzdCBmb3IgY3VyaW9z
aXR5IGl0IHdvdWxkIGJlIG5pY2UgdG8gc2VlIHdoYXQgd2FzIGRyb3BwZWQgd2l0aCB0aGlzCj4g
cGF0Y2guCj4gCj4gCVNhbQoKRGlmZnN0YXQ6CgogYXJjaC9taXBzL2Jvb3QvZHRzL2luZ2VuaWMv
ano0NzQwLmR0c2kgICAgICAgICB8ICA4NCArKysrKysrKysrKysKIGFyY2gvbWlwcy9ib290L2R0
cy9pbmdlbmljL3FpX2xiNjAuZHRzICAgICAgICAgfCAyOTUgCisrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystCiBhcmNoL21pcHMvY29uZmlncy9xaV9sYjYwX2RlZmNvbmZp
ZyAgICAgICAgICAgIHwgIDQ0ICsrKy0tLQogYXJjaC9taXBzL2luY2x1ZGUvYXNtL21hY2gtano0
NzQwL2dwaW8uaCAgICAgICB8ICAxNSAtLS0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9tYWNoLWp6
NDc0MC9qejQ3NDBfZmIuaCAgfCAgNTggLS0tLS0tLS0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9t
YWNoLWp6NDc0MC9qejQ3NDBfbW1jLmggfCAgMTIgLS0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9t
YWNoLWp6NDc0MC9wbGF0Zm9ybS5oICAgfCAgMjYgLS0tLQogYXJjaC9taXBzL2p6NDc0MC9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogYXJjaC9taXBzL2p6NDc0MC9ib2Fy
ZC1xaV9sYjYwLmMgICAgICAgICAgICAgICB8IDQ5MSAKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9taXBzL2p6
NDc0MC9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICAgICB8IDI1MCAKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvbWlwcy9qejQ3NDAvcHJvbS5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDUgLQogYXJjaC9taXBzL2p6NDc0MC9zZXR1cC5jICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMyArLQogZHJpdmVycy9kbWEvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgNiAtCiBkcml2ZXJzL2RtYS9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxIC0KIGRyaXZlcnMvZG1hL2RtYS1qejQ3NDAuYyAgICAgICAgICAgICAg
ICAgICAgICAgfCA2MjMgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvaHdt
b24vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgLS0KIGRyaXZlcnMvaHdt
b24vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgLQogZHJpdmVycy9od21v
bi9qejQ3NDAtaHdtb24uYyAgICAgICAgICAgICAgICAgICB8IDEzNSAKLS0tLS0tLS0tLS0tLS0t
LS0tLQogZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
OSAtLQogZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSAtCiBkcml2ZXJzL21mZC9qejQ3NDAtYWRjLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMzI0
IAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2luZ2VuaWMvS2NvbmZpZyAgICAgICAgICAgfCAgIDcgLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvaW5nZW5pYy9NYWtlZmlsZSAgICAgICAgICB8ICAgMSAtCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDc0MF9uYW5kLmMgICAgIHwgNTM2IAotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogZHJpdmVycy9wb3dlci9zdXBwbHkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAx
MSAtLQogZHJpdmVycy9wb3dlci9zdXBwbHkvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAg
MSAtCiBkcml2ZXJzL3Bvd2VyL3N1cHBseS9qejQ3NDAtYmF0dGVyeS5jICAgICAgICAgIHwgNDIx
IAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgICA5
IC0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgICAx
IC0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvano0NzQwX2ZiLmMgICAgICAgICAgICAgICAgfCA2OTAg
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBzb3VuZC9zb2Mvano0NzQw
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDI1ICstLS0KIHNvdW5kL3NvYy9qejQ3
NDAvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgLQogc291bmQvc29jL2p6NDc0
MC9xaV9sYjYwLmMgICAgICAgICAgICAgICAgICAgICB8IDEwNiAtLS0tLS0tLS0tLS0tLS0KIDMz
IGZpbGVzIGNoYW5nZWQsIDQwNCBpbnNlcnRpb25zKCspLCAzODA5IGRlbGV0aW9ucygtKQoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
