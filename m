Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231BA310DBB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C286F485;
	Fri,  5 Feb 2021 16:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FC36F485
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 16:18:51 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1l83oi-00056A-OL; Fri, 05 Feb 2021 17:18:44 +0100
Message-ID: <b01fefdd8b6fa7c8f1f863daf18a25b32f6ac29c.camel@pengutronix.de>
Subject: Re: [PATCH] drm/i915: Autoselect CONFIG_CHECKPOINT_RESTORE for
 SYS_kcmp
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>, Chris Wilson
 <chris@chris-wilson.co.uk>,  Dave Airlie <airlied@gmail.com>
Date: Fri, 05 Feb 2021 17:18:42 +0100
In-Reply-To: <YB1rUCQoa+wCEh1o@phenom.ffwll.local>
References: <20210205130307.8294-1-chris@chris-wilson.co.uk>
 <YB1rKLGvpnFDom11@phenom.ffwll.local> <YB1rUCQoa+wCEh1o@phenom.ffwll.local>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVtIDA1LjAyLjIwMjEgdW0gMTY6NTkgKzAxMDAgc2NocmllYiBEYW5pZWwg
VmV0dGVyOgo+IE9uIEZyaSwgRmViIDA1LCAyMDIxIGF0IDA0OjU4OjMyUE0gKzAxMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBGcmksIEZlYiAwNSwgMjAyMSBhdCAwMTowMzowN1BNICsw
MDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiA+IGdhbGxpdW0gKGlyaXMpIGRlcGVuZHMgb24g
b3Nfc2FtZV9maWxlX2Rlc2NyaXB0aW9uKCkgdG8gZGlzYW1iaWd1YXRlCj4gPiA+IHNjcmVlbnMg
YW5kIHNvIGF2b2lkIGltcG9ydGluZyB0aGUgc2FtZSBzY3JlZW4gZmQgdHdpY2UgYXMgdHdvIGRp
c3RpbmN0Cj4gPiA+IGVudGl0aWVzICh0aGF0IHNoYXJlIGFsbCB0aGUga2VybmVsIHJlc291cmNl
cywgc28gYWN0aW9ucyBvbiBzY3JlZW4KPiA+ID4gYWZmZWN0IHRoZSBvdGhlciBhbmQgd291bGQg
Y2F1c2UgcmFuZG9tIGZhaXVyZSkuIEFzIHRoZXkgZGVwZW5kIG9uIGl0LAo+ID4gPiBzbyBtdXN0
IHdlLiBvc19zYW1lX2ZpbGVfZGVzY3JpcHRpb24oKSB1c2VzIFNZU19rY21wIHRvIGNoZWNrIHRo
ZSBmaWxlCj4gPiA+IHRhYmxlcyBmb3IgdGhlIGVxdWl2YWxlbnQgc3RydWN0IGZpbGUsIGJ1dCBT
WVNfa2NtcCBpcyBoaWRkZW4gYmVoaW5kCj4gPiA+IENPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkUu
IEFzIHRoaXMgaXMgbm90IGRlZmF1bHQsIHdlIG11c3Qgc2VsZWN0IGl0IGZvcgo+ID4gPiBvdXJz
ZWx2ZXMgdG8gZW5zdXJlIHRoYXQgb3VyIHVzZXJzcGFjZSBpcyBmdWxseSBzdXBwb3J0ZWQuCj4g
PiA+IAo+ID4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaW50
ZWwvLS9pc3N1ZXMvMzA0Ngo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KPiA+ID4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+Cj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
Pgo+ID4gCj4gPiBIbSBzaG91bGRuJ3Qgd2UgY3JhbmsgdGhpcyB1cCB0byBDT05GSUdfRFJNPwo+
ID4gCj4gPiBPciBlbWJlZGRlZCBmb2xrcyBnb2luZyB0byBiZSB1bmhhcHB5IGFib3V0IHRoYXQ/
IElmIHNvIEkgZ3Vlc3Mgd2UnZCBuZWVkCj4gPiB0byBwdWxsIG91dCBqdXN0IHRoZSBTWVNfa2Nt
cCBwYXJ0IC4uLgo+ID4gCj4gPiBBc2tpbmcgYmVjYXVzZSBJIHRoaW5rIEJhcyBpcyBhbHNvIGxv
b2tpbmcgYXQgdGhpcywgYW5kIGl0J3Mgbm90IGdyZWF0IGlmCj4gPiB3ZSdyZSBidWlsZGluZyBv
biB0aGlzIGFuZCB0aGVuIHVzZXJzIGVuZCB1cCB3aXRoIHZlcnkgc3VidGx5IGJyb2tlbiBnbC92
awo+ID4gc3RhY2tzIDotLwoKYW1kZ3B1IGdhbGxpdW0gd2luc3lzIHNlZW1zIHRvIGFsc28gcmVx
dWlyZSB0aGlzLCBzbyBzZWxlY3RpbmcgaXQgZnJvbQpoaWdoZXIgdXAgaW4gdGhlIEtjb25maWcg
dHJlZSBtYWtlcyBzZW5zZSBhbmQgSSBkb24ndCB0aGluayBlbWJlZGRlZAp3b3VsZCBiZSBtYXNz
aXZlbHkgdW5oYXBweSBhYm91dCB0aGlzLiBIb3dldmVyIGtjbXAgc2VlbXMgdG8gYmUgdXNlZnVs
Cm9uIGl0cyBvd24gYW5kIHB1bGxpbmcgaXQgb3V0IG9mIENIRUNLUE9JTlRfUkVTVE9SRSBzb3Vu
ZHMgbGlrZSB0aGUKcmlnaHQgdGhpbmcgdG8gZG8uCgpSZWdhcmRzLApMdWNhcwoKPiAKPiA+IC1E
YW5pZWwKPiA+IAo+ID4gPiAtLS0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmln
IHwgMSArCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+IAo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L0tjb25maWcKPiA+ID4gaW5kZXggMWUxY2IyNDVmY2E3Li40NzBhNTIxNGJkMzMg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcKPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZwo+ID4gPiBAQCAtMjEsNiArMjEsNyBAQCBj
b25maWcgRFJNX0k5MTUKPiA+ID4gwqAJc2VsZWN0IEFDUElfVklERU8gaWYgQUNQSQo+ID4gPiDC
oAlzZWxlY3QgQUNQSV9CVVRUT04gaWYgQUNQSQo+ID4gPiDCoAlzZWxlY3QgU1lOQ19GSUxFCj4g
PiA+ICsJc2VsZWN0IENIRUNLUE9JTlRfUkVTVE9SRSAjIGdhbGxpdW0gZGVwZW5kcyBvbiBTWVNf
a2NtcAo+ID4gPiDCoAlzZWxlY3QgSU9TRl9NQkkKPiA+ID4gwqAJc2VsZWN0IENSQzMyCj4gPiA+
IMKgCXNlbGVjdCBTTkRfSERBX0k5MTUgaWYgU05EX0hEQV9DT1JFCj4gPiA+IC0tIAo+ID4gPiAy
LjIwLjEKPiA+ID4gCj4gPiAKPiA+IC0tIAo+ID4gRGFuaWVsIFZldHRlcgo+ID4gU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiBodHRwOi8vYmxvZy5mZndsbC5jaAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
