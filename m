Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A53C5C4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 10:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F218908E;
	Tue, 11 Jun 2019 08:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5648908E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:16:05 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1habwb-0003K3-2W; Tue, 11 Jun 2019 10:15:49 +0200
Message-ID: <1560240943.13886.1.camel@pengutronix.de>
Subject: Re: [PATCH 5/8] drivers: media: coda: fix warning same module names
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Matt Redfearn <matt.redfearn@thinci.com>, Anders Roxell
 <anders.roxell@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>
Date: Tue, 11 Jun 2019 10:15:43 +0200
In-Reply-To: <c2ff2c77-5c14-4bc4-f59c-7012d272ec76@thinci.com>
References: <20190606094722.23816-1-anders.roxell@linaro.org>
 <d6b79ee0-07c6-ad81-16b0-8cf929cc214d@xs4all.nl>
 <CADYN=9KY5=FzrkC7MKj9QnG-eM1NVuL00w8Xv4yU2r05rhr7WQ@mail.gmail.com>
 <c2ff2c77-5c14-4bc4-f59c-7012d272ec76@thinci.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, "marex@denx.de" <marex@denx.de>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "vivien.didelot@gmail.com" <vivien.didelot@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Networking <netdev@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 David Miller <davem@davemloft.net>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIDIwMTktMDYtMTAgYXQgMTM6MTQgKzAwMDAsIE1hdHQgUmVkZmVhcm4gd3Jv
dGU6Cj4gCj4gT24gMTAvMDYvMjAxOSAxNDowMywgQW5kZXJzIFJveGVsbCB3cm90ZToKPiA+IE9u
IFRodSwgNiBKdW4gMjAxOSBhdCAxMjoxMywgSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwu
bmw+IHdyb3RlOgo+ID4gPiAKPiA+ID4gT24gNi82LzE5IDExOjQ3IEFNLCBBbmRlcnMgUm94ZWxs
IHdyb3RlOgo+ID4gPiA+IFdoZW4gYnVpbGRpbmcgd2l0aCBDT05GSUdfVklERU9fQ09EQSBhbmQg
Q09ORklHX0NPREFfRlMgZW5hYmxlZCBhcwo+ID4gPiA+IGxvYWRhYmxlIG1vZHVsZXMsIHdlIHNl
ZSB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gPiA+ID4gCj4gPiA+ID4gd2FybmluZzogc2FtZSBt
b2R1bGUgbmFtZXMgZm91bmQ6Cj4gPiA+ID4gICAgZnMvY29kYS9jb2RhLmtvCj4gPiA+ID4gICAg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL2NvZGEua28KPiA+ID4gPiAKPiA+ID4gPiBSZXdv
cmsgc28gbWVkaWEgY29kYSBtYXRjaGVzIHRoZSBjb25maWcgZnJhZ21lbnQuIExlYXZpbmcgQ09E
QV9GUyBhcyBpcwo+ID4gPiA+IHNpbmNlIHRoYXRzIGEgd2VsbCBrbm93biBtb2R1bGUuCj4gPiA+
ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBs
aW5hcm8ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9j
b2RhL01ha2VmaWxlIHwgNCArKy0tCj4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L2NvZGEvTWFrZWZpbGUKPiA+ID4gPiBpbmRleCA1NGU5YTczYTkyYWIuLjU4OGU2YmY3YzE5MCAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUK
PiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUKPiA+ID4g
PiBAQCAtMSw2ICsxLDYgQEAKPiA+ID4gPiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQo+ID4gPiA+IAo+ID4gPiA+IC1jb2RhLW9ianMgOj0gY29kYS1jb21tb24ubyBj
b2RhLWJpdC5vIGNvZGEtZ2RpLm8gY29kYS1oMjY0Lm8gY29kYS1tcGVnMi5vIGNvZGEtbXBlZzQu
byBjb2RhLWpwZWcubwo+ID4gPiA+ICt2aWRlby1jb2RhLW9ianMgOj0gY29kYS1jb21tb24ubyBj
b2RhLWJpdC5vIGNvZGEtZ2RpLm8gY29kYS1oMjY0Lm8gY29kYS1tcGVnMi5vIGNvZGEtbXBlZzQu
byBjb2RhLWpwZWcubwo+ID4gPiA+IAo+ID4gPiA+IC1vYmotJChDT05GSUdfVklERU9fQ09EQSkg
Kz0gY29kYS5vCj4gPiA+ID4gK29iai0kKENPTkZJR19WSURFT19DT0RBKSArPSB2aWRlby1jb2Rh
Lm8KPiA+ID4gCj4gPiA+IEhvdyBhYm91dCBpbXgtY29kYT8gdmlkZW8tY29kYSBzdWdnZXN0cyBp
dCBpcyBwYXJ0IG9mIHRoZSB2aWRlbyBzdWJzeXN0ZW0sCj4gPiA+IHdoaWNoIGl0IGlzbid0Lgo+
ID4gCj4gPiBJJ2xsIHJlc2VuZCBhIHYyIHNob3J0bHkgd2l0aCBpbXgtY29kYSBpbnN0ZWFkLgoK
SSdkIGJlIGluIGZhdm9yIG9mIGNhbGxpbmcgaXQgImNvZGEtdnB1IiBpbnN0ZWFkLgoKPiBXaGF0
IGFib3V0IG90aGVyIHZlbmRvciBTb0NzIGltcGxlbWVudGluZyB0aGUgQ29kYSBJUCBibG9jayB3
aGljaCBhcmUgCj4gbm90IGFuIGlteD8gSSdkIHByZWZlciBhIG1vcmUgZ2VuZXJpYyBuYW1lIC0g
bWF5YmUgbWVkaWEtY29kYS4KClJpZ2h0LCB0aGlzIGRyaXZlciBjYW4gYmUgdXNlZCBvbiBvdGhl
ciBTb0NzIFsxXS4KClsxXSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2xpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZy9tc2cxNDY0OTguaHRtbAoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
