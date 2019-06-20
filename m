Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CA4DA7A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 21:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500786E570;
	Thu, 20 Jun 2019 19:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084F46E570
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 19:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A23C0FB06;
 Thu, 20 Jun 2019 21:43:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v9DpMwBc1fMx; Thu, 20 Jun 2019 21:43:14 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 087FA47322; Thu, 20 Jun 2019 21:43:14 +0200 (CEST)
Date: Thu, 20 Jun 2019 21:43:13 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v11 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
Message-ID: <20190620194313.GA13015@bogon.m.sigxcpu.org>
References: <cover.1557657814.git.agx@sigxcpu.org>
 <2000bc4564175abd7966207a5e9fbb9bb7d82059.1557657814.git.agx@sigxcpu.org>
 <CAOMZO5BaFYJxh1v46n2mdPyc+-jg6LgvoGR1rTE+yHZg_0Z8PA@mail.gmail.com>
 <69fcb327-8b51-df9e-12d9-d75751974bce@ti.com>
 <9a872f5b-1544-32a0-bd93-1d6333468114@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a872f5b-1544-32a0-bd93-1d6333468114@ti.com>
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Abel Vesa <abel.vesa@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Thierry Reding <treding@nvidia.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFRodSwgSnVuIDIwLCAyMDE5IGF0IDAyOjE4OjUzUE0gKzA1MzAsIEtpc2hvbiBWaWph
eSBBYnJhaGFtIEkgd3JvdGU6Cj4gSGksCj4gCj4gT24gMjQvMDUvMTkgOTozMSBQTSwgS2lzaG9u
IFZpamF5IEFicmFoYW0gSSB3cm90ZToKPiA+IEhpLAo+ID4gCj4gPiBPbiAyNC8wNS8xOSA1OjUz
IFBNLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+ID4+IEhpIEtpc2hvbiwKPiA+Pgo+ID4+IE9uIFN1
biwgTWF5IDEyLCAyMDE5IGF0IDc6NDkgQU0gR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9y
Zz4gd3JvdGU6Cj4gPj4+Cj4gPj4+IFRoaXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgTWl4ZWwgRFBI
WSBhcyBmb3VuZCBvbiBpLk1YOCBDUFVzIGJ1dCBzaW5jZQo+ID4+PiB0aGlzIGlzIGFuIElQIGNv
cmUgaXQgd2lsbCBsaWtlbHkgYmUgZm91bmQgb24gb3RoZXJzIGluIHRoZSBmdXR1cmUuIFNvCj4g
Pj4+IGluc3RlYWQgb2YgYWRkaW5nIHRoaXMgdG8gdGhlIG53bCBob3N0IGRyaXZlciBtYWtlIGl0
IGEgZ2VuZXJpYyBQSFkKPiA+Pj4gZHJpdmVyLgo+ID4+Pgo+ID4+PiBUaGUgZHJpdmVyIHN1cHBv
cnRzIHRoZSBpLk1YOE1RLiBTdXBwb3J0IGZvciBpLk1YOFFNIGFuZCBpLk1YOFFYUCBjYW4gYmUK
PiA+Pj4gYWRkZWQgb25jZSB0aGUgbmVjZXNzYXJ5IHN5c3RlbSBjb250cm9sbGVyIGJpdHMgYXJl
IGluIHZpYQo+ID4+PiBtaXhlbF9kcGh5X2RldmRhdGEuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYt
Ynk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4gPj4+IENvLWRldmVsb3BlZC1i
eTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPgo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4gPj4+IFJldmlld2Vk
LWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4gPj4+IFJldmlld2VkLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPj4KPiA+PiBXb3VsZCB5b3UgaGF2
ZSBhbnkgY29tbWVudHMgb24gdGhpcyBzZXJpZXMsIHBsZWFzZT8KPiA+IAo+ID4gSSBkb24ndCBo
YXZlIGFueSBjb21tZW50cy4gSSdsbCBxdWV1ZSB0aGlzIG9uY2UgSSBzdGFydCBxdWV1aW5nIHBh
dGNoZXMgZm9yIHRoZQo+ID4gbmV4dCBtZXJnZSB3aW5kb3cuCj4gCj4gQ2FuIHlvdSBmaXggdGhl
IGZvbGxvd2luZyBjaGVja3BhdGNoIHdhcm5pbmcgYW5kIHJlcG9zdD8KPiBXQVJOSU5HOiBxdW90
ZWQgc3RyaW5nIHNwbGl0IGFjcm9zcyBsaW5lcwo+ICM0MjA6IEZJTEU6IGRyaXZlcnMvcGh5L2Zy
ZWVzY2FsZS9waHktZnNsLWlteDgtbWlwaS1kcGh5LmM6MjgwOgo+ICsJZGV2X2RiZygmcGh5LT5k
ZXYsICJoc19wcmVwYXJlOiAldSwgY2xrX3ByZXBhcmU6ICV1LCAiCj4gKwkJImhzX3plcm86ICV1
LCBjbGtfemVybzogJXUsICIKPiAKPiBXQVJOSU5HOiBxdW90ZWQgc3RyaW5nIHNwbGl0IGFjcm9z
cyBsaW5lcwo+ICM0MjE6IEZJTEU6IGRyaXZlcnMvcGh5L2ZyZWVzY2FsZS9waHktZnNsLWlteDgt
bWlwaS1kcGh5LmM6MjgxOgo+ICsJCSJoc196ZXJvOiAldSwgY2xrX3plcm86ICV1LCAiCj4gKwkJ
ImhzX3RyYWlsOiAldSwgY2xrX3RyYWlsOiAldSwgIgo+IAo+IFdBUk5JTkc6IHF1b3RlZCBzdHJp
bmcgc3BsaXQgYWNyb3NzIGxpbmVzCj4gIzQyMjogRklMRTogZHJpdmVycy9waHkvZnJlZXNjYWxl
L3BoeS1mc2wtaW14OC1taXBpLWRwaHkuYzoyODI6Cj4gKwkJImhzX3RyYWlsOiAldSwgY2xrX3Ry
YWlsOiAldSwgIgo+ICsJCSJyeGhzX3NldHRsZTogJXVcbiIsCgpGaXhlZCBpbiB2MTIuClRoYW5r
cywKIC0tIEd1aWRvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
