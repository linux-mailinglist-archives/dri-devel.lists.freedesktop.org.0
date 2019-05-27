Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4BB2B9C4
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 20:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533F989812;
	Mon, 27 May 2019 18:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7743089812;
 Mon, 27 May 2019 18:05:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7CF3C20021;
 Mon, 27 May 2019 20:05:48 +0200 (CEST)
Date: Mon, 27 May 2019 20:05:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/7] drm: make headers self-contained and drop drmP.h
Message-ID: <20190527180546.GA21925@ravnborg.org>
References: <20190526173535.32701-1-sam@ravnborg.org>
 <20190527061835.GH21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527061835.GH21222@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=dhQdzHBUYkDFEHG2kKAA:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDg6MTg6MzVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBTdW4sIE1heSAyNiwgMjAxOSBhdCAwNzozNToyOFBNICswMjAwLCBTYW0gUmF2
bmJvcmcgd3JvdGU6Cj4gPiBXaGlsZSByZW1vdmluZyB1c2Ugb2YgZHJtUC5oIGZyb20gZmlsZXMg
aW4gZHJtLyogSQo+ID4gbm90aWNlZCB0aGF0IEkgaGFkIHRvIGFkZCB0aGUgc2FtZSBpbmNsdWRl
IGZpbGVzIGR1ZSB0bwo+ID4gZGVwZW5kZW5jaWVzIGluIHRoZSBoZWFkZXIgZmlsZXMuCj4gPiAK
PiA+IEl0IGlzIGJldHRlciB0byBsZXQgdGhlIGhlYWRlciBmaWxlcyBiZSBzZWxmLWNvbnRhaW5l
ZCBhbmQKPiA+IGxldCB0aGUgdXNlcnMgcHVsbCBpbiBvbmx5IHRoZSBhZGRpdGlvbmFsIGhlYWRl
cnMgZmlsZXMgcmVxdWlyZWQuCj4gPiBTbyBJIHdlbnQgYWhlYWQgYW5kIG1hZGUgdGhlIHJlbGV2
YW50IGhlYWRlciBmaWxlcyBzZWxmLWNvbnRhaW5lZC4KPiA+IChJIGRpZCBub3QgY2hlY2sgaWYg
dGhpcyBtYWRlIGFueSBpbmNsdWRlcyByZWR1bmRhbnQgaW4gc29tZSBmaWxlcywKPiA+IEkgZG8g
bm90IGhhdmUgdG9vbGluZyBpbiBwbGFjZSB0byBkbyBzbykuCj4gPiAKPiA+IERhbmllbCBzdWdn
ZXN0ZWQgdG8gYWRkIHN1cHBvcnQgZm9yIHRlc3RpbmcgdGhhdCB0aGV5IHN0YXkKPiA+IHNlbGYg
Y29udGFpbmVkLgo+ID4gSmFuaSBOaWt1bGEgaGFzIHNlbnQgYSBwYXRjaCB0byBrYnVpbGQgdG8g
bWFrZSB0aGlzIHBhcnQgb2YgdGhlCj4gPiBrYnVpbGQgbWFjaGluZXJ5LiBJIGhhdmUgdXNlZCBp
dCBsb2NhbGx5IGFuZCBhcyBzb29uIGFzIGl0Cj4gPiBsYW5kcyBpbiBrYnVpbGQgSSB3aWxsIHN0
YXJ0IHVzaW5nIGl0IGZvciBkcm0uCj4gPiBXZSBjb3VsZCBoYXZlIGR1cGxpY2F0ZWQgdGhlIGlu
ZnJhc3RydWN0dXJlIG5vdyBidXQgdGhhdCBzZWVtZWQKPiA+IHRvbyBtdWNoIGNvZGUgY2hydW5j
aC4KPiA+IAo+ID4gVGhpcyBwYXRjaHNldCBpbmNsdWRlIHRoZSBhY3R1YWwgcmVtb3ZhbCBvZiBk
cm1QLmggYXMgb25lIGJpZyBwYXRjaC4KPiA+IFRoaXMgaXMgYnVpbGQgdGVzdGVkIG9uIGFscGhh
IChhbHdheXMgaW50ZXJlc3RpbmcpLCBhcm0sIGFybTY0LCB4ODYgZXRjLgo+ID4gCj4gPiBGb3Ig
YWxsIGZpbGVzIHRvdWNoZWQgdGhlIGZvbGxvd2luZyB3YXMgZG9uZToKPiA+IC0gaW5jbHVkZSBm
aWxlcyBkaXZpZGVkIHVwIGluIGJsb2NrcyBpbiBmb2xsb3dpbmcgb3JkZXI6Cj4gPiAgICAgCWxp
bnV4LyoKPiA+IAl2aWRlby8qCj4gPiAJZHJtLyoKPiA+IAkiIgo+ID4gLSB3aXRoaW4gZWFjaCBi
bG9jayB0aGUgaW5jbHVkZSBmaWxlcyBhcmUgc29ydGVkIGFscGhhYmV0aWNhbGx5Cj4gPiAKPiA+
IHYyOgo+ID4gLSB1c2Ugc2FtZSBvcmRlcmluZyBhZiBibG9ja3MKPiA+IC0gbW92ZSBpbmNsdWRl
cyBkb3duIGJlbG93IGxpY2Vuc2UgdGV4dAo+ID4gLSBhZGRlZCBwYXRjaCB3aXRoIGFjdHVhbCBk
cm1QLmggcmVtb3ZhbAo+ID4gLSByZXdvcmRlZCBzb21lIHN1YmplY3RzIHRvIG1ha2UgdGhlbSBt
b3JlIGRlc2NyaXB0aXZlCj4gPiAtIGZpeGVkIGEgZmV3IHNwZWxsaW5nIGVycm9zIGluIGNoYW5n
ZWxvZ3MgKGJ1dCBhIGZldyBtYXkgcmVtYWluKQo+ID4gCj4gPiAgICAgICAgIFNhbQo+IAo+IE9u
IHRoZSBzZXJpZXM6Cj4gCj4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cj4gCj4gRGlkIGEgYml0IG9mIHNjcm9sbGluZywgbG9va3MgYWxsIHJlYXNvbmFi
bGUsIGJ1dCBkZWZpbml0ZWx5IGRpZG4ndCBjaGVjawo+IHRoaW5ncyBpbi1kZXB0aC4KVGhhbmtz
LCBhcHBsaWVkIGFuZCB3aWxsIGJlIHB1c2hlZCBvdXQgaW4gYSBtaW51dGUuCgoJU2FtCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
