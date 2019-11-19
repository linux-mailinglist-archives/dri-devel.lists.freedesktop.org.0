Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A31024A9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 13:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A3D6E8ED;
	Tue, 19 Nov 2019 12:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745986E8AA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 12:40:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,322,1569276000"; d="scan'208";a="412492065"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 13:40:06 +0100
Date: Tue, 19 Nov 2019 13:40:06 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
In-Reply-To: <87tv70xevg.fsf@intel.com>
Message-ID: <alpine.DEB.2.21.1911191339500.2818@hadrien>
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
 <20191118132357.GC2246533@ulmo> <87wobwxf95.fsf@intel.com>
 <87tv70xevg.fsf@intel.com>
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
Cc: airlied@linux.ie, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 zhengbin <zhengbin13@huawei.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, treding@nvidia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiBUdWUsIDE5IE5vdiAyMDE5LCBKYW5pIE5pa3VsYSB3cm90ZToKCj4gT24gVHVlLCAxOSBO
b3YgMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
Cj4gPiBPbiBNb24sIDE4IE5vdiAyMDE5LCBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPiB3cm90ZToKPiA+PiBPbiBNb24sIE5vdiAxOCwgMjAxOSBhdCAwNzo0NjoxMFBN
ICswODAwLCB6aGVuZ2JpbiB3cm90ZToKPiA+Pj4gemhlbmdiaW4gKDIpOgo+ID4+PiAgIGRybS90
ZWdyYTogVXNlIFBUUl9FUlJfT1JfWkVSTygpIHRvIHNpbXBsaWZ5IGNvZGUgaW4KPiA+Pj4gICAg
IHRlZ3JhX2JvX2R1bWJfY3JlYXRlCj4gPj4+ICAgZHJtL3RlZ3JhOiBVc2UgUFRSX0VSUl9PUl9a
RVJPKCkgdG8gc2ltcGxpZnkgY29kZSBpbiB0ZWdyYV9nZW1fY3JlYXRlCj4gPj4+Cj4gPj4+ICBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgfCA1ICstLS0tCj4gPj4+ICBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvZ2VtLmMgfCA1ICstLS0tCj4gPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IEFzIEkgZXhwbGFpbmVkIGluIHJlc3Bv
bnNlIHRvIHRoZSBzYW1lIHBhdGNoZXMgc2VudCBmb3Igb3RoZXIgZHJpdmVycwo+ID4+IGFscmVh
ZHksIEkgZG9uJ3QgdGhpbmsgdGhpcyBoYXMgYW55IG1lcml0Lgo+ID4KPiA+IEkgYWdyZWUgY29t
cGxldGVseS4KPiA+Cj4gPiBBcHBhcmVudGx5IHRoZXJlJ3MgYSBjb2NjaWNoZWNrIGZsYWdnaW5n
IGNvbnN0cnVjdHMgbGlrZSB0aGlzOyBwZXJoYXBzCj4gPiB0aGF0IHNob3VsZCBiZSBhZGRyZXNz
ZWQuIEp1bGlhPwo+ID4KPiA+IFRoaW5ncyBsaWtlOgo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS90
ZWdyYS9nZW0uYzo0NTc6MS0zOiBXQVJOSU5HOiBQVFJfRVJSX09SX1pFUk8gY2FuIGJlIHVzZWQK
PiA+Cj4gPiBsZWFkaW5nIHRvOgo+ID4KPiA+ICAtCWlmIChJU19FUlIoYm8pKQo+ID4gIC0JCXJl
dHVybiBQVFJfRVJSKGJvKTsKPiA+ICAtCj4gPiAgLQlyZXR1cm4gMDsKPiA+ICArCXJldHVybiBQ
VFJfRVJSX09SX1pFUk8oYm8pOwo+ID4KPiA+IEkgdGhpbmsgd2UgaGF2ZSBjb25zZW5zdXMgdGhl
IGVycm9yIHBhdGggYW5kIHRoZSBoYXBweSBkYXkgc2NlbmFyaW9zCj4gPiBzaG91bGQgcmVtYWlu
IGRpc3RpbmN0LiBNb3Jlb3ZlciwgSSBmaW5kIFBUUl9FUlJfT1JfWkVSTygpIGNhdXNlcyBtZSB0
bwo+ID4gcGF1c2UgZm9yIGEgbW9tZW50IHdoaWxlIHRoZSBvcmlnaW5hbCBpcyBhIGNyeXN0YWwg
Y2xlYXIgaW1tZWRpYXRlbHkuCj4KPiBSZSBjb25zZW5zdXMsIFsxXVsyXSBhbmQgcHJvYmFibHkg
bW9yZS4gUGVyIGFuIGVtYWlsIHNlYXJjaCwgdGhpcyBwb3BzCj4gdXAgZm9yIHRoZSBzYW1lIHN0
dWZmIG92ZXIgYW5kIG92ZXIgYWdhaW4uIENhbiB3ZSBwbGVhc2UganVzdCByZW1vdmUgdGhlCj4g
Y29jY2kgY2hlY2s/CgpPSy4KCmp1bGlhCgo+Cj4gQlIsCj4gSmFuaS4KPgo+Cj4gWzFdIGh0dHA6
Ly9taWQubWFpbC1hcmNoaXZlLmNvbS9kYWFkZTUyZC0wZGZjLTkzNjUtYjE3Yy0wMmU3ZTc4NWFm
YWRAdGkuY29tCj4gWzJdIGh0dHA6Ly9taWQubWFpbC1hcmNoaXZlLmNvbS8yMDE5MTExODEzMDAy
Mi5HTTQzNDVAZ2lsbW91ci5sYW4KPgo+IC0tCj4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291
cmNlIEdyYXBoaWNzIENlbnRlcgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
