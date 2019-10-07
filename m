Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DFCEA66
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEA56E090;
	Mon,  7 Oct 2019 17:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408F86E090
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:16:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67FCFB2D;
 Mon,  7 Oct 2019 19:16:38 +0200 (CEST)
Date: Mon, 7 Oct 2019 20:16:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] drm: panels: fix spi aliases of former omap panels
Message-ID: <20191007171635.GC11781@pendragon.ideasonboard.com>
References: <20191007164130.31534-1-andreas@kemnade.info>
 <20191007170446.yotb24s6jhe6nx3r@earth.universe>
 <20191007191428.016ddcd4@aktux>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007191428.016ddcd4@aktux>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570468598;
 bh=yeGcY0TtxD7c9pfFdsT6/oUxOBZyIhvn1OM7dinxI3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aHiUTT9rltB1HpUJW0LhlBgqYRX5nzr2vv+HTQd5V9+DeM97FL65SdgZ19n0ORsxO
 zrkNz2OJQkoiyFYrKPvB9FsRlemo6YEDDZUhoYYDt3Rx6XbQrtEOZYO+CN9/fOVG8U
 fC9KF0SRLvYp/zjxxgXvKmVSK+jXEhAFH64+JP1U=
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
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, airlied@linux.ie,
 omi Valkeinen <tomi.valkeinen@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, thierry.reding@gmail.com,
 Jyri Sarha <jsarha@ti.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 sam@ravnborg.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmVhcywKCk9uIE1vbiwgT2N0IDA3LCAyMDE5IGF0IDA3OjE0OjI4UE0gKzAyMDAsIEFu
ZHJlYXMgS2VtbmFkZSB3cm90ZToKPiBPbiBNb24sIDcgT2N0IDIwMTkgMTk6MDQ6NDYgKzAyMDAg
U2ViYXN0aWFuIFJlaWNoZWwgd3JvdGU6Cj4gPiBPbiBNb24sIE9jdCAwNywgMjAxOSBhdCAwNjo0
MTozMFBNICswMjAwLCBBbmRyZWFzIEtlbW5hZGUgd3JvdGU6Cj4gPiA+IFdoZW4gdGhlIHBhbmVs
cyB3ZXJlIG1vdmVkIGZyb20gb21hcC9kaXNwbGF5cy8gdG8gcGFuZWwvCj4gPiA+IG9tYXBkc3Mg
cHJlZml4IHdhcyBzdHJpcHBlZCwgd2hpY2ggY2F1c2Ugc3BpIG1vZGFsaWFzCj4gPiA+IHRvIG5v
dCBjb250YWluIHRoZSB2ZW5kb3ItcHJlZml4IGFueW1vcmUuCj4gPiA+IAo+ID4gPiBzbyB3ZSBo
YWQgZS5nLiBpbiBmb3JtZXIgdGltZXM6Cj4gPiA+IGNvbXBhdGlibGU9b21hcGRzcyx0cG8sdGQw
Mjh0dGVjMSAtPiBtb2RhbGlhcz1zcGk6dHBvLHRkMDI4dHRlYzEKPiA+ID4gbm93Ogo+ID4gPiBj
b21wYXRpYmxlPXRwbyx0ZDAyOHR0ZWMxIC0+IG1vZGFsaWFzPXNwaTp0ZDAyOHR0ZWMxCj4gPiA+
IAo+ID4gPiBUaGlzIGlzIGNvbnNpc3RlbnQgd2l0aCBvdGhlciBkcml2ZXJzLiBUZXN0ZWQgdGhl
IHRkMDI4dHRlYy5jCj4gPiA+IG9ubHksIGJ1dCB0aGUgcGF0dGVybiBsb29rcyB0aGUgc2FtZSBm
b3IgdGhlIG90aGVyIG9uZXMuCj4gPiA+IAo+ID4gPiBGaXhlczogNDVmMTZjODJkYjdlOCAoImRy
bS9vbWFwOiBkaXNwbGF5czogUmVtb3ZlIHVudXNlZCBwYW5lbCBkcml2ZXJzIikKPiA+ID4gU2ln
bmVkLW9mZi1ieTogQW5kcmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KPiA+ID4g
LS0tICAKPiA+IAo+ID4gUGF0Y2ggbG9va3MgZ29vZCB0byBtZSwgYnV0IHlvdSBoYXZlIG9uZSBm
YWxzZSBwb3NpdGl2ZS4KPiA+IAo+ID4gPiBbLi4uXQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNoYXJwLWxzMDM3djdkdzAxLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwMzd2N2R3MDEuYwo+ID4gPiBpbmRleCA0NmNk
OWEyNTAxMjk4Li44MzhkMzlhMjYzZjUzIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwMzd2N2R3MDEuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwMzd2N2R3MDEuYwo+ID4gPiBAQCAtMjA0LDcgKzIw
NCw3IEBAIHN0YXRpYyBpbnQgbHMwMzd2N2R3MDFfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIGxzMDM3djdkdzAxX29mX21hdGNoW10gPSB7Cj4gPiA+IC0JeyAuY29tcGF0aWJs
ZSA9ICJzaGFycCxsczAzN3Y3ZHcwMSIsIH0sCj4gPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJsczAz
N3Y3ZHcwMSIsIH0sCj4gPiA+ICAJeyAvKiBzZW50aW5lbCAqLyB9LAo+ID4gPiAgfTsKPiA+IAo+
ID4gVGhlIERUIGNvbXBhdGlibGUgc2hvdWxkIGhhdmUgYSB2ZW5kb3IgcHJlZml4Lgo+IAo+IG9v
cHMsIHNvcnJ5LCBidXQgSSBpdCBzZWVtcyB0aGF0IExhdXJlbnQgYWxyZWFkeSBoYXMgc3VibWl0
dGVkIGEgZml4LgoKU2VlbXMgd2UndmUgYmVlbiByYWNpbmcgZWFjaCBvdGhlciA6LVMgRmVlbCBm
cmVlIHRvIHN1Ym1pdCBhIHYyIG9mIHRoaXMKcGF0Y2ggaWYgeW91IHRoaW5rIGl0J3MgYmV0dGVy
IHRoYW4gbXkgc2VyaWVzLiBBcyBsb25nIGFzIHRoZSBwcm9ibGVtCmdldHMgZml4ZWQsIEknbGwg
YmUgaGFwcHkgOi0pCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
