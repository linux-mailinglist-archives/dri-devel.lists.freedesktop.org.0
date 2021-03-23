Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E55A3469C1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 21:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE1C6E944;
	Tue, 23 Mar 2021 20:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBEE6E944
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 20:23:42 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lOnYy-00038X-C9; Tue, 23 Mar 2021 21:23:40 +0100
Message-ID: <d0d0a19f8e2176f86f7e0aaa19f3672a473cd8ca.camel@pengutronix.de>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Date: Tue, 23 Mar 2021 21:23:39 +0100
In-Reply-To: <4f96f825f90836066dd89ab33e0c71e3cb922d91.camel@pengutronix.de>
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
 <CAH9NwWdOSiWTNpyzxXHasjcNrhOtK3Su66kaQsGA_kz7AUp53A@mail.gmail.com>
 <CAKMK7uH-X6KzxfrMLgzhhYdoceLgygtKvzZWbFt+ZztY_BCC5A@mail.gmail.com>
 <CAH9NwWeYO_WsYTtsri6E5dRfWYhD0FrUohK99jx_gZHVHJRukA@mail.gmail.com>
 <4f96f825f90836066dd89ab33e0c71e3cb922d91.camel@pengutronix.de>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTW9udGFnLCBkZW0gMjIuMDMuMjAyMSB1bSAxMDoyMCArMDEwMCBzY2hyaWViIEx1Y2FzIFN0
YWNoOgo+IEhpIENocmlzdGlhbiwKPiAKPiBBbSBNb250YWcsIGRlbSAyMi4wMy4yMDIxIHVtIDA5
OjU0ICswMTAwIHNjaHJpZWIgQ2hyaXN0aWFuIEdtZWluZXI6Cj4gPiBBbSBTYS4sIDIwLiBNw6Ry
eiAyMDIxIHVtIDIwOjExIFVociBzY2hyaWViIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD46Cj4gPiA+IAo+ID4gPiBPbiBTYXQsIE1hciAyMCwgMjAyMSBhdCAxMDoyOCBBTSBDaHJpc3Rp
YW4gR21laW5lcgo+ID4gPiA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4gPiAKPiA+ID4gPiBIaSBMdWNhcwo+ID4gPiA+IAo+ID4gPiA+IEFtIEZyLiwgMTkuIE3DpHJ6
IDIwMjEgdW0gMjA6MDYgVWhyIHNjaHJpZWIgTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+Ogo+ID4gPiA+ID4gCj4gPiA+ID4gPiBWaXZhbnRlIFRTICh0aWxlLXN0YXR1cykgYnVm
ZmVyIG1vZGlmaWVycy4gVGhleSBjYW4gYmUgY29tYmluZWQgd2l0aCBhbGwgb2YKPiA+ID4gPiA+
IHRoZSBWaXZhbnRlIGNvbG9yIGJ1ZmZlciB0aWxpbmcgbW9kaWZpZXJzLCBzbyB0aGV5IGFyZSBr
aW5kIG9mIGEgbW9kaWZpZXIKPiA+ID4gPiA+IG1vZGlmaWVyLiBJZiBhIFRTIG1vZGlmaWVyIGlz
IHByZXNlbnQgd2UgaGF2ZSBhIGFkZGl0aW9uYWwgcGxhbmUgZm9yIHRoZQo+ID4gPiA+ID4gVFMg
YnVmZmVyIGFuZCB0aGUgbW9kaWZpZXIgZGVmaW5lcyB0aGUgbGF5b3V0IG9mIHRoaXMgVFMgYnVm
ZmVyLgo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gSSBhbSB1bnN1cmUgd2h5IHlvdSB3YW50
IHRvIGhhdmUgdGhlIFRTIG1vZGlmaWVycyBpbiBkcm1fZm91cmNjLmguIENhbgo+ID4gPiA+IHlv
dSBzaGFyZSBzb21lIGluc2lnaHQgb24gdGhpcz8KPiA+ID4gCj4gPiA+IEl0J3MgdGhlIG9mZmlj
aWFsIHJlZ2lzdHJ5IGZvciBkcm1fZm91cmNjIGNvZGVzIGFuZCBkcm0gbW9kaWZpZXJzLgo+ID4g
PiBXaGV0aGVyIHRoZSBrZXJuZWwgZXZlciB1c2VzIGl0IG9yIG5vdCBkb2Vzbid0IG1hdHRlci4K
PiA+IAo+ID4gRmFpciBwb2ludC4uIGJ1dCBJIGRvIG5vdCBzZWUgYW55IHVzYWdlIG9mIHRoZXNl
IFRTIG1vZGlmaWVycyBpbiBtZXNhCj4gPiAtIHRoYXQncyB3aHkgSSBhbSBhc2tpbmcuCj4gCj4g
SSBoYXZlIGEgTWVzYSBzZXJpZXMgdXNpbmcgdGhvc2UgbW9kaWZpZXJzLCB3aGljaCBJJ20gY3Vy
cmVudGx5Cj4gcmViYXNpbmcgYW5kIHdpbGwgYmUgcG9zdGVkIHNob3J0bHkuIEhvd2V2ZXIsIHRo
ZSB3YXkgdGhpbmdzIHdvcmsgaXM6Cj4gZmlyc3QgZ2V0IHRoZSBtb2RpZmllciBpbnRvIGRybV9m
b3VyY2MuaCwgdGhlbiBtZXJnZSBhbnkgY29kZSB1c2luZyB0aGUKPiBuZXcgbW9kaWZpZXJzLCBz
byBJIGZpZ3VyZWQgaXQgd291bGQgYmUgZmFpciBnYW1lIHRvIHBvc3QgdGhpcyBwYXRjaAo+IGJl
Zm9yZSBJIGZ1bGx5IGZpbmlzaGVkIHJld29ya2luZyB0aGUgTWVzYSBzZXJpZXMuCgpSZWJhc2lu
ZyBhbmQgcmUtdGVzdGluZyBkaWQgdGFrZSBhIGJpdCBtb3JlIHRpbWUgdGhhbiBJIGV4cGVjdGVk
LCBidXQKdXNlcnNwYWNlIGJpdHMgYXJlIG5vdyBhdmFpbGFibGUgYXQ6Cmh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy85NzgwCgpJIGFsc28g
aGF2ZSBwYXRjaGVzIGZvciBEQ1NTIHRvIGVuYWJsZSBjb21wcmVzc2lvbiBzdXBwb3J0IGFsbCB0
aGUgd2F5CnRvIHRoZSBkaXNwbGF5IG9uIGkuTVg4TSwgYnV0IHRob3NlIGFsc28gbmVlZCByZWJh
c2luZyBhbmQgcmUtdGVzdGluZy4KSSdsbCBzZW5kIHRoZW0gb3V0IHdoZW4gcmVhZHkuCgpSZWdh
cmRzLApMdWNhcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
