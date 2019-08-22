Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4049C9904B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 12:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9006E472;
	Thu, 22 Aug 2019 10:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1746E472
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 10:04:03 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1i0jwj-00045d-JA; Thu, 22 Aug 2019 12:03:57 +0200
Message-ID: <1566468231.3653.8.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] arm64: imx8mq: add imx8mq iomux-gpr field defines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Arnd Bergmann
 <arnd@arndb.de>
Date: Thu, 22 Aug 2019 12:03:51 +0200
In-Reply-To: <20190821174208.GA9486@bogon.m.sigxcpu.org>
References: <cover.1565367567.git.agx@sigxcpu.org>
 <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
 <CAK8P3a3Vrd+sttJrQwD-jA9p_egG4x-hc41eGK8H-_aVm-uoYw@mail.gmail.com>
 <20190813101057.GB10751@bogon.m.sigxcpu.org>
 <CAK8P3a1q9G8VKgNKh+6khzoW3bFTVR_Zorygy=Qqsq-PYzM4=g@mail.gmail.com>
 <20190821174208.GA9486@bogon.m.sigxcpu.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA4LTIxIGF0IDE5OjQyICswMjAwLCBHdWlkbyBHw7xudGhlciB3cm90ZToK
PiBIaSwKPiBPbiBUdWUsIEF1ZyAxMywgMjAxOSBhdCAwMTowNzo1MlBNICswMjAwLCBBcm5kIEJl
cmdtYW5uIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTI6MTAgUE0gR3VpZG8g
R8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgQXVnIDEzLCAy
MDE5IGF0IDEwOjA4OjQ0QU0gKzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiA+ID4gT24g
RnJpLCBBdWcgOSwgMjAxOSBhdCA2OjI0IFBNIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5v
cmc+IHdyb3RlOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGlzIGFkZHMgYWxsIHRoZSBncHIgcmVn
aXN0ZXJzIGFuZCB0aGUgZGVmaW5lIG5lZWRlZCBmb3Igc2VsZWN0aW5nCj4gPiA+ID4gPiB0aGUg
aW5wdXQgc291cmNlIGluIHRoZSBpbXgtbndsIGRybSBicmlkZ2UuCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArI2RlZmluZSBJT01VWENfR1BSMCAgICAweDAwCj4gPiA+ID4gPiAr
I2RlZmluZSBJT01VWENfR1BSMSAgICAweDA0Cj4gPiA+ID4gPiArI2RlZmluZSBJT01VWENfR1BS
MiAgICAweDA4Cj4gPiA+ID4gPiArI2RlZmluZSBJT01VWENfR1BSMyAgICAweDBjCj4gPiA+ID4g
PiArI2RlZmluZSBJT01VWENfR1BSNCAgICAweDEwCj4gPiA+ID4gPiArI2RlZmluZSBJT01VWENf
R1BSNSAgICAweDE0Cj4gPiA+ID4gPiArI2RlZmluZSBJT01VWENfR1BSNiAgICAweDE4Cj4gPiA+
ID4gPiArI2RlZmluZSBJT01VWENfR1BSNyAgICAweDFjCj4gPiA+ID4gCj4gPiA+ID4gKG1vcmUg
b2YgdGhlIHNhbWUpCj4gPiA+ID4gCj4gPiA+ID4gaHVoPwo+ID4gPiAKPiA+ID4gVGhlc2UgYXJl
IHRoZSBuYW1lcyBmcm9tIHRoZSBpbXg4TVEgcmVmZXJlbmNlIG1hbnVhbCAoZ2VuZXJhbCBwdXJw
b3NlCj4gPiA+IHJlZ2lzdGVycywgdGhleSBsdW1wIHRvZ2V0aGVyIGFsbCBzb3J0cyBvZiB0aGlu
Z3MpLCBpdCdzIHRoZSBzYW1lIG9uCj4gPiA+IGlteDYvaW14Nyk6Cj4gPiA+IAo+ID4gPiAgICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDZxLWlvbXV4Yy1ncHIu
aAo+ID4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDct
aW9tdXhjLWdwci5oCj4gPiA+IAo+ID4gPiA+ID4gKy8qIGkuTVg4TXEgaW9tdXggZ3ByIHJlZ2lz
dGVyIGZpZWxkIGRlZmluZXMgKi8KPiA+ID4gPiA+ICsjZGVmaW5lIElNWDhNUV9HUFIxM19NSVBJ
X01VWF9TRUwgICAgICAgICAgICAgIEJJVCgyKQo+ID4gPiA+IAo+ID4gPiA+IEkgdGhpbmsgdGhp
cyBkZWZpbmUgc2hvdWxkIHByb2JhYmx5IGJlIGxvY2FsIHRvIHRoZSBwaW5jdHJsIGRyaXZlciwg
dG8KPiA+ID4gPiBlbnN1cmUgdGhhdCBubyBvdGhlciBkcml2ZXJzIGZpZGRsZSB3aXRoIHRoZSBy
ZWdpc3RlcnMgbWFudWFsbHkuCj4gPiA+IAo+ID4gPiBUaGUgcHVycG9zZSBvZiB0aGVzZSBiaXRz
IGlzIGZvciBhIGRyaXZlciB0byBmaWRkbGUgd2l0aCB0aGVtIHRvIHNlbGVjdAo+ID4gPiB0aGUg
aW5wdXQgc291cmNlLiBTaW1pbGFyIG9uIGlteDcgaXQncyBhbHJlYWR5IHVzZWQgZm9yIGUuZy4g
dGhlIHBoeQo+ID4gPiByZWZjbGsgaW4gdGhlIHBjaSBjb250cm9sbGVyOgo+ID4gPiAKPiA+ID4g
ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZh
bGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1pbXg2LmMj
bjYzOAo+ID4gCj4gPiBUaGF0IG9uZSBzaG91bGQgbGlrZWx5IHVzZSBlaXRoZXIgdGhlIGNsayBp
bnRlcmZhY2Ugb3IgdGhlIHBoeQo+ID4gaW50ZXJmYWNlIGluc3RlYWQuCj4gPiAKPiA+ID4gVGhl
IEdQUnMgYXJlIG5vdCBhYm91dCBwYWQgY29uZmlndXJhdGlvbiBidXQgZ2F0aGVyIGFsbCBzb3J0
cyBvZiB0aGluZ3MKPiA+ID4gKHNlY3Rpb24gOC4yLjQgb2YgdGhlIGlteDhtcSByZWZlcmVuY2Ug
bWFudWFsKTogcGNpZSBzZXR1cCwgZHNpIHJlbGF0ZWQKPiA+ID4gYml0cyBzbyBJIGRvbid0IHRo
aW5rIHRoaXMgc2hvdWxkIGJlIGRvbmUgdmlhIGEgcGluY3RybAo+ID4gPiBkcml2ZXIuIFNob3Vs
ZCB3ZSBoYW5kbGUgdGhhdCBkaWZmZXJlbnRseSB0aGFuIG9uIGlteDYvNz8KPiA+IAo+ID4gSXQg
d291bGQgYmUgbmljZSB0byBmaXggdGhlIGV4aXN0aW5nIGNvZGUgYXMgd2VsbCwgYnV0IGZvciB0
aGUgbW9tZW50LAo+ID4gSSBvbmx5IHRoaW5rIHdlIHNob3VsZCBub3QgYWRkIG1vcmUgb2YgdGhh
dC4KPiA+IAo+ID4gR2VuZXJhbGx5IHNwZWFraW5nLCB3ZSBjYW4gdXNlIHN5c2NvbiB0byBkbyBy
YW5kb20gdGhpbmdzIHRoYXQgZG9uJ3QKPiA+IGhhdmUgYSBzdWJzeXN0ZW0gb2YgdGhlaXIgb3du
LCBidXQgd2Ugc2hvdWxkIG5vdCB1c2UgaXQgdG8gZG8gdGhpbmdzCj4gPiB0aGF0IGhhdmUgYW4g
ZXhpc3RpbmcgZHJpdmVyIGZyYW1ld29yayBsaWtlIHBpbmN0cmwsIGNsb2NrLCByZXNldCwgcGh5
Cj4gPiBldGMuCj4gCj4gU2luY2UgaXQncyBub3QgYW4gZXh0ZXJuYWwgcGluIGkgb3B0ZWQgdG8g
dXNlIE1VWF9NTUlPIGluc3RlYWQgd2hpY2gKPiBzZWVtcyBsaWtlIGEgZ29vZCBmaXQgaGVyZS4g
RG9lcyB0aGF0IG1ha2Ugc2Vuc2U/CgpZZXMsIEkgYWdyZWUuIFRoZSBpLk1YNiBkaXNwbGF5IHN1
YnN5c3RlbSBwcmVkYXRlcyB0aGUgbXV4IGZyYW1ld29yaywKb3RoZXJ3aXNlIEkgd291bGQgaGF2
ZSB1c2VkIGl0IGZvciB0aGUgTFZEUyBhbmQgSERNSSBtdXhlcyBpbiB0aGUgZmlyc3QKcGxhY2Uu
IFdlIHNob3VsZCBwcm9iYWJseSBzd2l0Y2ggaW14LWRybSBvdmVyIGFzIHdlbGwsIGluIGEgYmFj
a3dhcmRzCmNvbXBhdGlibGUgZmFzaGlvbi4gVGhlICZtdXggZGVmaW5pdGlvbnMgYXJlIGFscmVh
ZHkgdGhlcmUgaW4KYXJjaC9hcm0vYm9vdC9kdHMvaW14NnEuZHRzaS4KCnJlZ2FyZHMKUGhpbGlw
cApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
