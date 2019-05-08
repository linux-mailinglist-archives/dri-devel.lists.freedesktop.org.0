Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424E173FA
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0FB8926F;
	Wed,  8 May 2019 08:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151B48926F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 08:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D5F24FB03;
 Wed,  8 May 2019 10:36:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXuJkEUUAiLW; Wed,  8 May 2019 10:36:22 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 403EA47B7D; Wed,  8 May 2019 10:36:22 +0200 (CEST)
Date: Wed, 8 May 2019 10:36:22 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v10 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
Message-ID: <20190508083622.GA3948@bogon.m.sigxcpu.org>
References: <cover.1557215047.git.agx@sigxcpu.org>
 <299e28042e0a24c0cde593873bdfb15e18187a92.1557215047.git.agx@sigxcpu.org>
 <20190507181223.GC15122@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507181223.GC15122@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Abel Vesa <abel.vesa@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFR1ZSwgTWF5IDA3LCAyMDE5IGF0IDA4OjEyOjIzUE0gKzAyMDAsIFNhbSBSYXZuYm9y
ZyB3cm90ZToKPiBIaSBHdWlkby4KPiAKPiBMb29rcyBnb29kIG5vdywgc3R1bWJsZWQgdXBvbiBh
IGZldyBkZXRhaWxzIEkgbWlzc2VkIGluIGxhc3Qgcm91bmQuCj4gV2l0aCB0aGVzZSBjb25zaWRl
cmVkIC8gZml4ZWQgeW91IGNhbiBhZGQgbXkKPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgo+IAo+IAlTYW0KPiAKPiA+ICsjZGVmaW5lIENNKHgpCSgJCQkJXAo+
ID4gKwkJKCh4KSA8CTMyKT8weGUwfCgoeCktMTYpIDoJXAo+ID4gKwkJKCh4KSA8CTY0KT8weGMw
fCgoeCktMzIpIDoJXAo+ID4gKwkJKCh4KSA8IDEyOCk/MHg4MHwoKHgpLTY0KSA6CVwKPiA+ICsJ
CSgoeCkgLSAxMjgpKQo+ID4gKyNkZWZpbmUgQ04oeCkJKCgoeCkgPT0gMSk/MHgxZiA6ICgoKENO
X0JVRik+PigoeCktMSkpJjB4MWYpKQo+ID4gKyNkZWZpbmUgQ08oeCkJKChDT19CVUYpPj4oOC0o
eCkpJjB4MykKPiAKPiBBIGZldyBzcGFjZXMgYXJvdW5kIHRoZSBvcGVyYXRvcnMgbWF5IGhlbHAg
cmVhZGFiaWxpdHkgYSBsaXR0bGUuCj4gCj4gPiArc3RhdGljIGludCBwaHlfd3JpdGUoc3RydWN0
IHBoeSAqcGh5LCB1MzIgdmFsdWUsIHVuc2lnbmVkIGludCByZWcpCj4gPiArewo+ID4gKwlzdHJ1
Y3QgbWl4ZWxfZHBoeV9wcml2ICpwcml2ID0gcGh5X2dldF9kcnZkYXRhKHBoeSk7Cj4gPiArCWlu
dCByZXQ7Cj4gPiArCj4gPiArCXJldCA9IHJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIHJlZywg
dmFsdWUpOwo+ID4gKwlpZiAocmV0IDwgMCkKPiA+ICsJCWRldl9lcnIoJnBoeS0+ZGV2LCAiRmFp
bGVkIHRvIHdyaXRlIERQSFkgcmVnICVkOiAlZCIsIHJlZywgcmV0KTsKPiAKPiBJIGhhdmUgcmVj
ZW50bHkgbGVhcm5lZCB0aGF0IG9uZSBoYXMgdG8gcmVtZW1iZXIgdHJhaWxpZ24gIlxuIi0gcGxl
YXNlCj4gYWRkLgo+IENoZWNrIGFsbCBvdGhlciBkZXZfeHh4IGFzIEkgbm90aWNlZCB0aGUgbmV3
bGluZSBpcyBtaXNzaW5nIGluIGEgZmV3Cj4gbW9yZSBwbGFjZXMuCgpBcmdoLi4uSSB0aG91Z2h0
IEkndmUgZml4ZWQgdGhlc2UgdXAgYWxyZWFkeSBidXQgdGhhdCB3YXMgaW4gdGhlCmNvcnJlc3Bv
bmRpbmcgTldMIGRyaXZlciBvbmx5LiBGaXhlZCBub3csIHRoYW5rcy4KCj4gCj4gPiArCj4gPiAr
CWRldl9kYmcoJnBoeS0+ZGV2LCAiaHNfY2xrL3JlZl9jbGs9JWxkLyVsZCDiqbAgJWQvJWRcbiIs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+
IAo+IFRoZXJlIHdhcyBhbm90aGVyIG9mIHRoZSBzeW1ib2xzIG15IHRlcm1pbmFsIGNhbm5vdCBz
aG93Lgo+IAoKVGhhbmtzISBJJ3ZlIGluY29ycG9yYXRlZCB5b3VyIHN1Z2dlc3Rpb25zIGFuZCB3
aWxsIHNlbmQgb3V0IGEgdjExIGJ5CnRoZSBlbmQgb2YgdGhlIHdlZWsgaW4gY2FzZSB0aGVyZSdz
IG1vcmUgY29tbWVudHMgY29taW5nIGluLgpDaGVlcnMsCiAtLSBHdWlkbwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
