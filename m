Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38297F12
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 17:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074FC6E974;
	Wed, 21 Aug 2019 15:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873226E974
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 15:39:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C566F28AF75;
 Wed, 21 Aug 2019 16:39:12 +0100 (BST)
Date: Wed, 21 Aug 2019 17:39:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC 02/19] drm: Support custom encoder/bridge
 enable/disable sequences officially
Message-ID: <20190821173909.31fafe28@collabora.com>
In-Reply-To: <20190821082107.GI11147@phenom.ffwll.local>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-3-boris.brezillon@collabora.com>
 <20190820190505.GP10820@pendragon.ideasonboard.com>
 <20190821082107.GI11147@phenom.ffwll.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMSBBdWcgMjAxOSAxMDoyMTowNyArMDIwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgoKPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAxMDowNTowNVBNICsw
MzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gSGkgQm9yaXMsCj4gPiAKPiA+IFRoYW5r
IHlvdSBmb3IgdGhlIHBhdGNoLgo+ID4gCj4gPiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwNTox
MTozM1BNICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6ICAKPiA+ID4gVGhlIFZDNCBhbmQg
RXh5bm9zIERTSSBlbmNvZGVyIGRyaXZlcnMgbmVlZCBhIGN1c3RvbSBlbmFibGUvZGlzYWJsZQo+
ID4gPiBzZXF1ZW5jZSBhbmQgbWFudWFsbHkgc2V0IGVuY29kZXItPmJyaWRnZSB0byBOVUxMIHRv
IHByZXZlbnQgdGhlIGNvcmUKPiA+ID4gZnJvbSBjYWxsaW5nIHRoZSBicmlkZ2UgaG9va3MuCj4g
PiA+IAo+ID4gPiBMZXQncyBwcm92aWRlIGEgbW9yZSBvZmZpY2lhbCB3YXkgdG8gc3VwcG9ydCBj
dXN0b20gYnJpZGdlL2VuY29kZXIKPiA+ID4gZW5hYmxlL2Rpc2FibGUgc2VxdWVuY2VzLiAgCj4g
PiAKPiA+IFNvLCB3aGlsZSBJJ20gbm90IG9wcG9zZWQgdG8gdGhpcywgSSB0aGluayBpdCdzIGEg
Yml0IG9mIGEgaGFjaywgYW5kIEknZAo+ID4gbGlrZSB0byBzaGFyZSBteSB2aXNpb24gb2YgaG93
IEknZCBsaWtlIHRvIHNlZSB0aGlzIGJlaW5nIGltcGxlbWVudGVkIGluCj4gPiB0aGUgbW9yZSBk
aXN0YW50IGZ1dHVyZSAoYW5kIHRodXMgcG9zc2libHkgb24gdG9wIG9mIHRoaXMgY2hhbmdlKS4g
IAo+IAo+IEkgdGhpbmsgaXQncyBhbHNvIGNvdW50ZXIgdG8gaG93IHRoZSBhdG9taWMgaGVscGVy
cyBhcmUgbWVhbnQgdG8gYmUgdXNlZC4KPiBJIG1lYW4geW91J3JlIGFkZGluZyBhIHBpbGUgbmV3
IGhvb2tzIGhlcmUgYWxsIGZvciBlc3NlbnRpYWxseSBub3QgaGF2aW5nCj4gdG8gdHlwZSBhIGZl
dyBsaW5lcyBvZiBoZWxwZXIgY29kZS4gSWYgeW91IGxvb2sgYXJvdW5kIGF0IGJpZyBkcml2ZXJz
Cj4gKGk5MTUsIGFtZGdwdSwgbm91dmVhdSkgX25vbmVfIG9mIHRoZW0gdXNlIHRoZSBtb2Rlc2V0
c19lbmFibGVzL2Rpc2FibGVzCj4gaGVscGVycy4gRXhhY3RseSBmb3IgcmVhc29ucyBsaWtlIHRo
aXMgd2hlcmUgeW91IG5lZWQgYSBjdXN0b20gc2VxdWVuY2UuCj4gCj4gU28gcHJvcGVyIHJlY29t
bWVuZGF0aW9uIGlzIHRvIGp1c3QgdHlwZSB5b3VyIG93biwgeW91J2xsIGJlIGhhcHBpZXIuCj4g
Cj4gPiBJdCBoYXMgYmVlbiBlc3RhYmxpc2hlZCBmb3IgcXVpdGUgc29tZSB0aW1lIG5vdyB0aGF0
IGV4cG9zaW5nCj4gPiBkcm1fZW5jb2RlciB0byB1c2Vyc3BhY2Ugd2FzIGxpa2VseSBhIG1pc3Rh
a2UsIGFuZCB0aGF0IGl0IHNob3VsZCBoYXZlCj4gPiBzdGF5ZWQgYSBrZXJuZWwtb25seSBvYmpl
Y3QuIFdpdGggdGhlIGdlbmVyYWxpc2VkIHVzYWdlIG9mIGRybV9icmlkZ2UsIEkKPiA+IHdvdWxk
IGdvIG9uZSBzdGVwIGZ1cnRoZXI6IGRybV9lbmNvZGVyIHNob3VsZG4ndCBtYXR0ZXIgZm9yIERS
TS9LTVMKPiA+IGRyaXZlcnMgYXQgYWxsLgo+ID4gCj4gPiBkcm1fYnJpZGdlIGhhcyBiZWVuIGlu
dHJvZHVjZWQgdG8gbW9kZWwgY2hhaW5lZCBlbmNvZGVycywgd2hlcmUgdGhlCj4gPiBzZWNvbmQg
KGFuZCBzdWJzZXF1ZW50KSBlbmNvZGVycyBjb3VsZG4ndCBlYXNpbHkgYmUgc3VwcG9ydGVkIGlu
IGEKPiA+IHN0YW5kYXJkIGFuZCByZXVzYWJsZSB3YXkgd2l0aCBqdXN0IGRybV9lbmNvZGVyLiBB
IGJyaWRnZSAod2l0aCB0aGUKPiA+IGV4Y2VwdGlvbiBvZiB0aGUgcGFuZWwgYnJpZGdlKSBpcyBq
dXN0IGFuIGVuY29kZXIuIEl0IHNob3VsZG4ndCBtYXR0ZXIKPiA+IHdoZXRoZXIgZW5jb2RlcnMg
YXJlIGludGVybmFsIHRvIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIsIHNlcGFyYXRlIElQcyBpbgo+
ID4gdGhlIFNvQyBvciBleHRlcm5hbCBjb21wb25lbnRzLCB0aGV5IGNvdWxkIGFsbCBiZSBtb2Rl
bGxlZCBhcyBicmlkZ2VzLgo+ID4gV2UgZG8gaGF2ZSBicmlkZ2VzIGZvciBEU0kgZW5jb2RlciBJ
UHMsIGFuZCBEU0kgKGFuZCBvdGhlcikgYnJpZGdlcwo+ID4gcG90ZW50aWFsbHkgbmVlZCBzaW1p
bGFyIGN1c3RvbSBlbmFibGUvZGlzYWJsZSBzZXF1ZW5jZXMuIEkgd291bGQgdGh1cwo+ID4gaWRl
YWxseSBsaWtlIHRvIHNlZSB0aGUgVkM0IGFuZCBFeHlub3MgRFNJIGVuY29kZXJzIGJlaW5nIGlt
cGxlbWVudGVkIGFzCj4gPiBicmlkZ2VzLCB3aXRoIHN1cHBvcnQgZm9yIGN1c3RvbSBlbmFibGUv
ZGlzYWJsZSBzZXF1ZW5jZXMgaW4gYnJpZGdlcywKPiA+IGFuZCBkcm9wIHN1cHBvcnQgZm9yIGN1
c3RvbSBlbmFibGUvZGlzYWJsZSBzZXF1ZW5jZXMgaW4gZHJtX2VuY29kZXIuCj4gPiAKPiA+IERv
ZXMgdGhpcyBtYWtlIHNlbnNlIHRvIHlvdSA/IFdoaWxlIEkgd291bGQgbG92ZSB0byBzZWUgdGhp
cyBiZWluZwo+ID4gaW1wbGVtZW50ZWQgcmlnaHQgYXdheSwgaXQgbWF5IGJlIHRvbyBtdWNoIHdv
cmsgYXMgYSBwcmVyZXF1aXNpdGUgZm9yCj4gPiB0aGlzIGJ1cyBmb3JtYXQgbmVnb3RpYXRpb24g
c2VyaWVzLCBzbyBJIGRvbid0IHdhbnQgdG8gcmVqZWN0IHRoaXMKPiA+IHBhdGNoLiBJIHdvdWxk
IGhvd2V2ZXIgbGlrZSB0byBhbHJlYWR5IG1ha2Ugc3VyZSB3ZSBhZ3JlZSBvbiB0aGUgd2F5Cj4g
PiBmb3J3YXJkIGZvciB0aGUgbmV4dCBzdGVwcy4gIAo+IAo+IFllYWggdGhlIG90aGVyIGJpdCBp
cyB0aGF0IGJyaWRnZXMgYXJlIHN1cHBvc2VkIHRvIGJlIHNvbWUga2luZCBvZgo+IHN0YW5kYXJk
LiBJIGRvIHdvbmRlciAoSSBoYXZlbid0IGxvb2tlZCBhdCB0aGUgc2VyaWVzKSB3aGV0aGVyIHRo
ZSBwcm9ibGVtCj4gaGVyZSBpcyB0aGF0IGVuY29kZXJzIGRvbid0IGhhdmUgdGhlaXIgb3duIGZ1
bGwgc2V0IG9mIHByZS9wb3N0IGVuYWJsZQo+IGhvb2tzIGxpa2UgYnJpZGdlcyAoZXNzZW50aWFs
bHkgdGhhdCdzIHdoYXQgeW91J3JlIGFkZGluZyBoZXJlKSwgb3IKPiB3aGV0aGVyIHRoZSBpZGVh
IGJlaGluZCBwcmUvcG9zdCBlbmFibGUvZGlzYWJsZSBob29rcyBpcyBub3QgZ29vZCBlbm91Z2gu
CgpJdCdzIGp1c3QgdGhhdCB3ZSBsYWNrIHRoZSBwcmUvcG9zdCBlbmFibGUgaG9va3MgYXQgdGhl
IGVuY29kZXIgbGV2ZWwuCkJ1dCBJJ20gYWRkcmVzc2luZyB0aGlzIGxpbWl0YXRpb24gc2xpZ2h0
bHkgZGlmZmVyZW50bHkgaW4gdGhlIHYyIEknbQp3b3JraW5nIG9uLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
