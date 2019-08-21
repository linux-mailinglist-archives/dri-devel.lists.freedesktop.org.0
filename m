Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE9C98D50
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382C56EAC3;
	Thu, 22 Aug 2019 08:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Wed, 21 Aug 2019 20:32:30 UTC
Received: from emh04.mail.saunalahti.fi (emh04.mail.saunalahti.fi
 [62.142.5.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C0F6E995
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 20:32:30 +0000 (UTC)
Received: from darkstar.musicnaut.iki.fi (85-76-66-34-nat.elisa-mobile.fi
 [85.76.66.34])
 by emh04.mail.saunalahti.fi (Postfix) with ESMTP id 9459A30049;
 Wed, 21 Aug 2019 23:26:27 +0300 (EEST)
Date: Wed, 21 Aug 2019 23:26:27 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/omap: Fix port lookup for SDI output
Message-ID: <20190821202627.GD30291@darkstar.musicnaut.iki.fi>
References: <20190818140838.GC30291@darkstar.musicnaut.iki.fi>
 <20190821183226.13784-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821183226.13784-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
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
Cc: linux-omap@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAwOTozMjoyNlBNICswMzAwLCBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOgo+IFdoZW4gcmVmYWN0b3JpbmcgcG9ydCBsb29rdXAgZm9yIERTUyBvdXRw
dXRzLCBjb21taXQgZDE3ZWI0NTM3YTdlCj4gKCJkcm0vb21hcDogRmFjdG9yIG91dCBjb21tb24g
aW5pdC9jbGVhbnVwIGNvZGUgZm9yIG91dHB1dCBkZXZpY2VzIikKPiBpbmNvcnJlY3RseSBoYXJk
Y29kZWQgdXNhZ2Ugb2YgRFQgcG9ydCAwLiBUaGlzIGJyZWFrcyBvcGVyYXRpb24gZm9yIFNESQo+
ICh3aGljaCB1c2VzIHRoZSBEVCBwb3J0IDEpIGFuZCBEUEkgb3V0cHV0cyBvdGhlciB0aGFuIERQ
STAgKHdoaWNoIGFyZQo+IG5vdCB1c2VkIGluIG1haW5saW5lIERUIHNvdXJjZXMpLgo+IAo+IEZp
eCB0aGlzIGJ5IHVzaW5nIHRoZSBwb3J0IG51bWJlciBmcm9tIHRoZSBvdXRwdXQgb21hcF9kc3Nf
ZGV2aWNlCj4gb2ZfcG9ydHMgZmllbGQuCj4gCj4gRml4ZXM6IGQxN2ViNDUzN2E3ZSAoImRybS9v
bWFwOiBGYWN0b3Igb3V0IGNvbW1vbiBpbml0L2NsZWFudXAgY29kZSBmb3Igb3V0cHV0IGRldmlj
ZXMiKQo+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KClRlc3RlZC1ieTogQWFybyBLb3NraW5lbiA8YWFyby5rb3NraW5l
bkBpa2kuZmk+CgpUaGFua3MsIHRoaXMgZml4ZXMgdGhlIGRpc3BsYXkgaXNzdWUgb24gTjkwMC4K
CkEuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb3V0cHV0LmMgfCA0ICsr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb3V0cHV0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb3V0cHV0LmMKPiBpbmRleCBkZTBmODgyZjBmN2IuLjE0
YjQxZGU0NGViYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb3V0
cHV0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb3V0cHV0LmMKPiBAQCAt
NCw2ICs0LDcgQEAKPiAgICogQXV0aG9yOiBBcmNoaXQgVGFuZWphIDxhcmNoaXRAdGkuY29tPgo+
ICAgKi8KPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiBAQCAtMjAsNyArMjEsOCBAQCBpbnQgb21hcGRzc19kZXZp
Y2VfaW5pdF9vdXRwdXQoc3RydWN0IG9tYXBfZHNzX2RldmljZSAqb3V0KQo+ICB7Cj4gIAlzdHJ1
Y3QgZGV2aWNlX25vZGUgKnJlbW90ZV9ub2RlOwo+ICAKPiAtCXJlbW90ZV9ub2RlID0gb2ZfZ3Jh
cGhfZ2V0X3JlbW90ZV9ub2RlKG91dC0+ZGV2LT5vZl9ub2RlLCAwLCAwKTsKPiArCXJlbW90ZV9u
b2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9ub2RlKG91dC0+ZGV2LT5vZl9ub2RlLAo+ICsJCQkJ
CSAgICAgICBmZnMob3V0LT5vZl9wb3J0cykgLSAxLCAwKTsKPiAgCWlmICghcmVtb3RlX25vZGUp
IHsKPiAgCQlkZXZfZGJnKG91dC0+ZGV2LCAiZmFpbGVkIHRvIGZpbmQgdmlkZW8gc2lua1xuIik7
Cj4gIAkJcmV0dXJuIDA7Cj4gLS0gCj4gUmVnYXJkcywKPiAKPiBMYXVyZW50IFBpbmNoYXJ0Cj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
