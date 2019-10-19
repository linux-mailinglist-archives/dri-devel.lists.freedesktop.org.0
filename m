Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C38FDDA98
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 21:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94CB89CF4;
	Sat, 19 Oct 2019 19:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629AB89CF4
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 19:04:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,316,1566856800"; d="scan'208";a="323314015"
Received: from ip-121.net-89-2-166.rev.numericable.fr (HELO hadrien)
 ([89.2.166.121])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Oct 2019 21:04:31 +0200
Date: Sat, 19 Oct 2019 21:04:31 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Wambui Karuga <wambui@karuga.xyz>
Subject: Re: [Outreachy kernel] [PATCH] drm: remove unnecessary return variable
In-Reply-To: <20191019071840.16877-1-wambui@karuga.xyz>
Message-ID: <alpine.DEB.2.21.1910192102410.5888@hadrien>
References: <20191019071840.16877-1-wambui@karuga.xyz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 sean@poorly.run, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiBTYXQsIDE5IE9jdCAyMDE5LCBXYW1idWkgS2FydWdhIHdyb3RlOgoKPiBGcm9tOiBXYW1i
dWkgS2FydWdhIDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+Cj4KPiBSZW1vdmUgdW5uZWNlc3Nh
cnkgdmFyaWFibGUgYHJldGAgaW4gZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMoKQo+IG9u
bHkgdXNlZCB0byBob2xkIHRoZSBmdW5jdGlvbiByZXR1cm4gdmFsdWUgYW5kIGhhdmUgdGhlIGZ1
bmN0aW9uCj4gcmV0dXJuIHRoZSB2YWx1ZSBkaXJlY3RseS4KClRoaXMgcGF0Y2ggYXBwbGllcyBm
b3IgbWUsIGJ1dCB3aXRoIGEgaHVnZSBvZmZzZXQuICBXaGF0IHRyZWUgYXJlIHlvdQp1c2luZz8K
CkFsc28sIEdyZWcgd29uJ3QgYXBwbHkgdGhpcywgYmVjYXVzZSBpdCdzIG5vdCB0YXJnZXRpbmcg
c3RhZ2luZy4gIElzIHRoaXMKZm9yIGEgc3BlY2lmaWMgb3V0cmVhY2h5IHByb2plY3Q/CgpqdWxp
YQoKCj4gSXNzdWUgZm91bmQgYnkgY29jY2luZWxsZToKPiBAQAo+IGxvY2FsIGlkZXhwcmVzc2lv
biByZXQ7Cj4gZXhwcmVzc2lvbiBlOwo+IEBACj4KPiAtcmV0ID0KPiArcmV0dXJuCj4gICAgICBl
Owo+IC1yZXR1cm4gcmV0Owo+Cj4gU2lnbmVkLW9mZi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVp
LmthcnVnYXhAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5k
ZXggOWNjY2M1ZTYzMzA5Li5iODU0YTQyMmE1MjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKPiBAQCAtMzU0MCw3ICszNTQwLDcgQEAgaW50IGRybV9kcF9hdG9taWNf
ZmluZF92Y3BpX3Nsb3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKPiAgewo+ICAJ
c3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGUgKnRvcG9sb2d5X3N0YXRlOwo+ICAJc3Ry
dWN0IGRybV9kcF92Y3BpX2FsbG9jYXRpb24gKnBvcywgKnZjcGkgPSBOVUxMOwo+IC0JaW50IHBy
ZXZfc2xvdHMsIHJlcV9zbG90cywgcmV0Owo+ICsJaW50IHByZXZfc2xvdHMsIHJlcV9zbG90czsK
Pgo+ICAJdG9wb2xvZ3lfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUo
c3RhdGUsIG1ncik7Cj4gIAlpZiAoSVNfRVJSKHRvcG9sb2d5X3N0YXRlKSkKPiBAQCAtMzU4Nyw4
ICszNTg3LDcgQEAgaW50IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzKHN0cnVjdCBkcm1f
YXRvbWljX3N0YXRlICpzdGF0ZSwKPiAgCX0KPiAgCXZjcGktPnZjcGkgPSByZXFfc2xvdHM7Cj4K
PiAtCXJldCA9IHJlcV9zbG90czsKPiAtCXJldHVybiByZXQ7Cj4gKwlyZXR1cm4gcmVxX3Nsb3Rz
Owo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMpOwo+
Cj4gLS0KPiAyLjIzLjAKPgo+IC0tCj4gWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNl
IHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAib3V0cmVhY2h5LWtlcm5l
bCIgZ3JvdXAuCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2Vp
dmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBvdXRyZWFjaHkta2VybmVsK3Vu
c3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20uCj4gVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24g
dGhlIHdlYiB2aXNpdCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvb3V0cmVhY2h5
LWtlcm5lbC8yMDE5MTAxOTA3MTg0MC4xNjg3Ny0xLXdhbWJ1aSU0MGthcnVnYS54eXouCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
