Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6612E71
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D51489F89;
	Fri,  3 May 2019 12:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60A889F89
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:48:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C2F231E;
 Fri,  3 May 2019 14:48:38 +0200 (CEST)
Date: Fri, 3 May 2019 15:48:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 03/22] drm/bridge: tc358767: fix ansi 8b10b use
Message-ID: <20190503124825.GF4912@pendragon.ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-4-tomi.valkeinen@ti.com>
 <20190420211353.GF4964@pendragon.ideasonboard.com>
 <CAFmnZc3hHt62TPa5_Fq7rbuynFAEhy3QcFHzqxzP_ac9eatygg@mail.gmail.com>
 <20190423145632.GC16111@pendragon.ideasonboard.com>
 <85c349f3-c96d-7db3-5446-5c0d9539580e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85c349f3-c96d-7db3-5446-5c0d9539580e@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1556887718;
 bh=2ECYeSUrRoNn+2huVxuhMvCydKCAzJ/ZVQAWtVWU+tI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TDS7XgNS6IviRDnF7zO725qxDHHDqpiWweirIV3Kkp4J8lBwqIieAdJqrgAS6oPuz
 5u7S/fqgnOyMR4As81ctWtQI5ulk5YD300wOyh8HmS1v/5tqRdGsDpYSfLpFI/xGE7
 wPD1W9yggKZUs3++z2MGzcjcMRYToIdggd4TURqs=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDAyOjQzOjUxUE0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDIzLzA0LzIwMTkgMTc6NTYsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gCj4gPj4gRHVyaW5nIGluaXRpYWwgZHJpdmVyIGRldmVsb3BtZW50IEkgaGFkIG9u
ZSBlRFAgZGlzcGxheSB0aGF0IHJlcG9ydHMgMCBpbiBCaXQgMAo+ID4+IChBTlNJIDhCLzEwQikg
b2YgRFBDRCByZWcgMHgwMDA2IChNQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkcpLgo+ID4+IEFsc28g
aXQgZG9lcyBub3QgcmVhY3Qgb24gc2V0dGluZyBCaXQgMCAoU0VUX0FOU0kgOEIxMEIpIGluIDB4
MDEwOAo+ID4+IChNQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkdfU0VUKSAtIGFmdGVyIHJlYWRpbmcg
YmFjayBpdCB3YXMgMCBhZ2Fpbi4KPiA+PiBTbyBJIGhhZCB0byBkaXNhYmxlIDhCMTAgZW5jb2Rp
bmcgb24gdGMzNTg3Njcgc2lkZSB0byBtYWtlIHRoaXMgZGlzcGxheQo+ID4+IHdvcmsuCj4gPiAK
PiA+IE91dCBvZiBjdXJpb3NpdHksIGhvdyBkb2VzIHRoZSBlRFAgZGlzcGxheSByZWNvdmVyIHRo
ZSBjbG9jayB3aXRob3V0Cj4gPiA4Qi8xMEIgZW5jb2RpbmcgPwo+ID4gCj4gPj4gT24gb3RoZXIg
aGFuZCBpZiB0aGVyZSBhcmUgZGlzcGxheXMgdGhhdCByZXBvcnQgemVybyBiaXQgMCBpbgo+ID4+
IE1BSU5fTElOS19DSEFOTkVMX0NPRElORyB3aGlsZSBuZWVkaW5nIDhiMTBiIHRoZW4gdGhpcyBw
YXRjaCBsb29rcwo+ID4+IHJlYXNvbmFibGUuCj4gPj4KPiA+PiBNYXkgYmUgZHJpdmVyIHNob3Vs
ZCByZWFkIGJhY2sgTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HX1NFVAo+ID4+IHJlZ2lzdGVyIGFm
dGVyIHNldHRpbmcgaXQgYW5kIGNoZWNrIGlmIDhiMTBiIGFjdHVhbGx5IGVuYWJsZWQ/Cj4gPiAK
PiA+IFRoaXMgc291bmRzIGxpa2UgYSByZWFzb25hYmxlIHRoaW5nIHRvIHRyeS4gVG9taSwgZG8g
eW91IHN0aWxsIGhhdmUKPiA+IGFjY2Vzc3MgdG8gdGhvc2UgZmF1bHR5IG1vbml0b3JzID8KPiAK
PiBPbiBteSBtb25pdG9yIGl0IGRvZXMgbm90IHNlZW0gdG8gbWF0dGVyIHdoZXRoZXIgSSB3cml0
ZSAwIG9yIDEgdG8KPiBNQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkdfU0VULCBhcyBsb25nIGFzIEkg
aGF2ZSA4YjEwYiBlbmFibGVkIG9uCj4gVEMzNTg3Njcgc2lkZS4gVGhlIHdyaXRlcyBkbyBnbyB0
aHJvdWdoLCBhbmQgSSBjYW4gcmVhZCB0aGUgd3JpdHRlbiBiaXQKPiBiYWNrLgo+IAo+IFNvLi4u
IEkgZ3Vlc3Mgd2hlbiB3ZSB0YWxrIGFib3V0IGVEUCBwYW5lbHMsIHRoZXJlIG1heSBiZSBhbGwg
a2luZHMgb2YKPiBvZGRpdGllcywgYXMgdGhleSdyZSB1c3VhbGx5IG1lYW50IHRvIGJlIHVzZWQg
d2l0aCBhIGNlcnRhaW4gY29uZmlndXJhdGlvbi4KPiAKPiBCdXQgaWYgZXZlcnlvbmUgYWdyZWVz
IHRoYXQgOEIxMEIgaXMgYSBub3JtYWwsIHJlcXVpcmVkIGZlYXR1cmUgb2YgRFAsCj4gYW5kIHRo
ZXJlIGlzIGFuIGVEUCBwYW5lbCB0aGF0IG5lZWRzIDhCMTBCIGRpc2FibGVkLCBtYXliZSB0aGF0
IHBhbmVsCj4gaGFzIHRvIGJlIGhhbmRsZWQgc2VwYXJhdGVseSBhcyBhIHNwZWNpYWwgY2FzZT8g
QSBkdHMgZW50cnkgdG8gZGlzYWJsZQo+IDhCMTBCPyBPciBzb21ldGhpbmcuIEJ1dCBpdCBkb2Vz
IG5vdCBzb3VuZCBsaWtlIGEgZ29vZCBpZGVhIGZvciB0aGUKPiBkcml2ZXIgdG8gdHJ5IHRvIGd1
ZXNzIHRoaXMuCgpBcyByZXBvcnRlZCBieSBBbmRyZXksIHRoZXJlIGlzIGF0IGxlYXN0IG9uZSBw
YW5lbCB0aGF0IHdvdWxkIGJyZWFrIHdpdGgKdGhpcyBwYXRjaC4gSSBhZ3JlZSA4YjEwYiBzaG91
bGQgYmUgdGhlIGRlZmF1bHQsIGJ1dCBpZiB0aGUgYWJvdmUKcHJvY2VkdXJlIHdvcmtzIGZvciBh
bGwgdGhlIHBhbmVscyB3ZSBrbm93IGFib3V0LCBpcyB0aGVyZSBhbiBpc3N1ZQppbXBsZW1lbnRp
bmcgaXQgPwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
