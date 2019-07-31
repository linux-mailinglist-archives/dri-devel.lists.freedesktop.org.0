Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523347C93C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 18:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D48A89D5F;
	Wed, 31 Jul 2019 16:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180FB89D5F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 16:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id AF4D4FB03;
 Wed, 31 Jul 2019 18:54:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqV7ea2juLfn; Wed, 31 Jul 2019 18:54:01 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9B60D46D8A; Wed, 31 Jul 2019 18:54:00 +0200 (CEST)
Date: Wed, 31 Jul 2019 18:54:00 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
Message-ID: <20190731165400.GA30745@bogon.m.sigxcpu.org>
References: <cover.1563983037.git.agx@sigxcpu.org>
 <3158f4f8c97c21f98c394e5631d74bc60d796522.1563983037.git.agx@sigxcpu.org>
 <CAOMZO5BRbV_1du1b9eJqcBvvXSE2Mon3yxSPJxPpZgBqYNjBSg@mail.gmail.com>
 <20190731143532.GA1935@bogon.m.sigxcpu.org>
 <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Chris Healy <cphealy@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDExOjQzOjQ3QU0gLTAzMDAsIEZhYmlvIEVzdGV2
YW0gd3JvdGU6Cj4gSGkgR3VpZG8sCj4gCj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTE6MzUg
QU0gR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4gd3JvdGU6Cj4gCj4gPiBUaGUgaWRl
YSBpcyB0byBoYXZlCj4gPgo+ID4gICAgICIlc2FibGluZyBwbGF0Zm9ybSBjbG9ja3MiLCBlbmFi
bGUgPyAiZW4iIDogImRpcyIpOwo+ID4KPiA+IGRlcGVuZGluZyB3aGV0aGVyIGNsb2NrcyBhcmUg
ZW5hYmxlZC9kaXNhYmxlZC4KPiAKPiBZZXMsIEkgdW5kZXJzdG9vZCB0aGUgaWRlYSwgYnV0IHRo
aXMgd291bGQgcHJpbnQ6Cj4gCj4gZW5zYWJsaW5nIG9yIGRpc3NhYmxpbmcgOi0pCgpUaGUgJ3Mn
IGlzIGZyb20gdGhlICclcycgZm9ybWF0IHNwZWNpZmllcjoKClsgMjYxMC44MDQxNzRdIGlteC1u
d2wtZHNpIDMwYTAwMDAwLm1pcGlfZHNpOiBbZHJtOmlteF9ud2xfZHNpX2JyaWRnZV9kaXNhYmxl
XSBkaXNhYmxpbmcgcGxhdGZvcm0gY2xvY2tzClsgMjcxMC45OTYyNzldIGlteC1ud2wtZHNpIDMw
YTAwMDAwLm1pcGlfZHNpOiBbZHJtOmlteF9ud2xfZHNpX2JyaWRnZV9wcmVfZW5hYmxlXSBlbmFi
bGluZyBwbGF0Zm9ybSBjbG9ja3MKCkknbGwgY2hhbmdlIHRoYXQgdG8gdXNlIHRoZSBmdWxsIHN0
cmluZ3MgdGhvdWdoIHNpbmNlIGkgYWxzbyBoYWQgdG8gbG9vawp0d2ljZSB0byBiZSBzdXJlIHRo
ZXJlJ3Mgbm8gZG91YmxlICdzJy4KCj4gCj4gPiA+IFNhbWUgaGVyZS4gUGxlYXNlIHJldHVybiAn
aW50JyBpbnN0ZWFkLgo+ID4KPiA+IFRoaXMgaXMgZnJvbSBkcm1fYnJpZGdlX2Z1bmNzIHNvIHRo
ZSBwcm90b3R5cGUgaXMgZml4ZWQuIEknbSBub3Qgc3VyZQo+ID4gaG93IHdoYXQncyB0aGUgYmVz
dCB3YXkgdG8gYnViYmxlIHVwIGZhdGFsIGVycm9ycyB0aHJvdWdoIHRoZSBkcm0gbGF5ZXI/Cj4g
Cj4gT2ssIHNvIGxldCdzIG5vdCBjaGFuZ2UgdGhpcyBvbmUuCj4gCj4gPiBJIHdlbnQgZm9yIERS
TV9ERVZfRVJST1IoKSBzaW5jZSB0aGF0IHdoYXQgaSB1c2VkIGluIHRoZSByZXN0IG9mIHRoZQo+
ID4gZHJpdmVyIGFuZCB0aGVzZSBvbmVzIHdlcmUgb21pc3Npb24uIEhvcGUgdGhhdCdzIG8uay4K
PiAKPiBObyBzdHJvbmcgcHJlZmVyZW5jZXMgaGVyZS4gSSBqdXN0IHRoaW5rIGRldl9lcnIoKSBl
YXNpZXIgdG8gdHlwZSBhbmQgc2hvcnRlci4KPiAKPiBUaGFua3MgZm9yIHRoaXMgd29yayEKClRo
YW5rcyBhZ2FpbiBmb3IgaGF2aW5nIGEgbG9vayEKIC0tIEd1aWRvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
