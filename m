Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449E1DB4C9
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1D46E83E;
	Wed, 20 May 2020 13:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CD06E83E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:17:44 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21241065-1500050 for multiple; Wed, 20 May 2020 14:17:30 +0100
MIME-Version: 1.0
In-Reply-To: <b2284cd6-56cb-847a-1b6f-e4825c4ec1d3@amd.com>
References: <20200520121450.79340-1-nirmoy.das@amd.com>
 <96a01388-7d91-56b5-4cd4-16052aba7a60@amd.com>
 <158997895740.8153.16875812670855148581@build.alporthouse.com>
 <b2284cd6-56cb-847a-1b6f-e4825c4ec1d3@amd.com>
Subject: Re: [PATCH 1/1] drm: check for NULL pointer in drm_gem_object_put
To: Christian König <christian.koenig@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158998064926.8153.3458194049597605952@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Wed, 20 May 2020 14:17:29 +0100
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDIwLTA1LTIwIDEzOjU0OjU1KQo+IEFtIDIwLjA1
LjIwIHVtIDE0OjQ5IHNjaHJpZWIgQ2hyaXMgV2lsc29uOgo+ID4gUXVvdGluZyBDaHJpc3RpYW4g
S8O2bmlnICgyMDIwLTA1LTIwIDEzOjE5OjQyKQo+ID4+IEFtIDIwLjA1LjIwIHVtIDE0OjE0IHNj
aHJpZWIgTmlybW95IERhczoKPiA+Pj4gZHJtX2dlbV9mYl9kZXN0cm95KCkgY2FsbHMgZHJtX2dl
bV9vYmplY3RfcHV0KCkgd2l0aCBOVUxMIG9iaiBjYXVzaW5nOgo+ID4+PiBbICAgMTEuNTg0MjA5
XSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAw
MDAwMDAwMDAKPiA+Pj4gWyAgIDExLjU4NDIxM10gI1BGOiBzdXBlcnZpc29yIHdyaXRlIGFjY2Vz
cyBpbiBrZXJuZWwgbW9kZQo+ID4+PiBbICAgMTEuNTg0MjE1XSAjUEY6IGVycm9yX2NvZGUoMHgw
MDAyKSAtIG5vdC1wcmVzZW50IHBhZ2UKPiA+Pj4gWyAgIDExLjU4NDIxNl0gUEdEIDAgUDREIDAK
PiA+Pj4gWyAgIDExLjU4NDIyMF0gT29wczogMDAwMiBbIzFdIFNNUCBOT1BUSQo+ID4+PiBbICAg
MTEuNTg0MjIzXSBDUFU6IDcgUElEOiAxNTcxIENvbW06IGdub21lLXNoZWxsIFRhaW50ZWQ6IEcg
ICAgICAgICAgICBFICAgICA1LjcuMC1yYzEtMS1kZWZhdWx0KyAjMjcKPiA+Pj4gWyAgIDExLjU4
NDIyNV0gSGFyZHdhcmUgbmFtZTogTWljcm8tU3RhciBJbnRlcm5hdGlvbmFsIENvLiwgTHRkLiBN
Uy03QTMxL1gzNzAgWFBPV0VSIEdBTUlORyBUSVRBTklVTSAoTVMtN0EzMSksIEJJT1MgMS5NUiAx
Mi8wMy8yMDE5Cj4gPj4+IFsgICAxMS41ODQyMzddIFJJUDogMDAxMDpkcm1fZ2VtX2ZiX2Rlc3Ry
b3krMHgyOC8weDcwIFtkcm1fa21zX2hlbHBlcl0KPiA+Pj4gPHNuaXA+Cj4gPj4+IFsgICAxMS41
ODQyNTZdIENhbGwgVHJhY2U6Cj4gPj4+IFsgICAxMS41ODQyNzldICBkcm1fbW9kZV9ybWZiKzB4
MTg5LzB4MWMwIFtkcm1dCj4gPj4+IFsgICAxMS41ODQyOTldICA/IGRybV9tb2RlX3JtZmIrMHgx
YzAvMHgxYzAgW2RybV0KPiA+Pj4gWyAgIDExLjU4NDMxNF0gIGRybV9pb2N0bF9rZXJuZWwrMHhh
YS8weGYwIFtkcm1dCj4gPj4+IFsgICAxMS41ODQzMjldICBkcm1faW9jdGwrMHgxZmYvMHgzYjAg
W2RybV0KPiA+Pj4gWyAgIDExLjU4NDM0N10gID8gZHJtX21vZGVfcm1mYisweDFjMC8weDFjMCBb
ZHJtXQo+ID4+PiBbICAgMTEuNTg0NDIxXSAgYW1kZ3B1X2RybV9pb2N0bCsweDQ5LzB4ODAgW2Ft
ZGdwdV0KPiA+Pj4gWyAgIDExLjU4NDQyN10gIGtzeXNfaW9jdGwrMHg4Ny8weGMwCj4gPj4+IFsg
ICAxMS41ODQ0MzBdICBfX3g2NF9zeXNfaW9jdGwrMHgxNi8weDIwCj4gPj4+IFsgICAxMS41ODQ0
MzRdICBkb19zeXNjYWxsXzY0KzB4NWYvMHgyNDAKPiA+Pj4gWyAgIDExLjU4NDQzOF0gIGVudHJ5
X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKPiA+Pj4gWyAgIDExLjU4NDQ0MF0g
UklQOiAwMDMzOjB4N2YwZWY4MGY3MjI3Cj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IE5pcm1v
eSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPiA+PiBGaXhlczogLi4uLiBtaXNzaW5nIGhlcmUu
IEFwYXJ0IGZyb20gdGhhdCBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZwo+ID4+IDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Lgo+ID4+Cj4gPj4gUGxlYXNlIHJlc2VuZCB3aXRoIHRoZSB0
YWcgYWRkZWQsIHRoZW4gSSdtIGdvaW5nIHRvIHB1c2ggdGhpcyB0bwo+ID4+IGRybS1taXNjLW5l
eHQgYXNhcC4KPiA+Pgo+ID4+IENocmlzdGlhbi4KPiA+Pgo+ID4+PiAtLS0KPiA+Pj4gICAgaW5j
bHVkZS9kcm0vZHJtX2dlbS5oIHwgMyArKysKPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5o
IGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4gPj4+IGluZGV4IDUyMTczYWJkZjUwMC4uYTEzNTEw
MzQ2YTliIDEwMDY0NAo+ID4+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPiA+Pj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4gPj4+IEBAIC0zNzIsNiArMzcyLDkgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGRybV9nZW1fb2JqZWN0X2dldChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9i
aikKPiA+Pj4gICAgc3RhdGljIGlubGluZSB2b2lkCj4gPj4+ICAgIGRybV9nZW1fb2JqZWN0X3B1
dChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiA+Pj4gICAgewo+ID4+PiArICAgICBpZiAo
IW9iaikKPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPj4+ICsKPiA+IFRoaXMgYWRkcyBz
ZXZlcmFsIHRob3VzYW5kIE5VTEwgY2hlY2tzIHdoZXJlIHRoZXJlIHdlcmUgcHJldmlvdXNseSBu
b25lLgo+ID4gSSBkb3VidCB0aGUgY29tcGlsZXIgZWxpbWluYXRlcyB0aGVtIGFsbC4KPiA+Cj4g
PiBJJ2Qgc3VnZ2VzdCByZXZlcnRpbmcKPiA+IGI1ZDI1MDc0NGNjYyAoImRybS9nZW06IGZvbGQg
ZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkIGFuZCBfX2RybV9nZW1fb2JqZWN0X3B1dCgpIikK
PiAKPiBJIGRpZG4ndCBsb29rZWQgaW50byB0aGlzIHBhdGNoIGluIGRldGFpbCwgYnV0IGFsbG93
aW5nIHRvIGNhbGwgKl9wdXQoKSAKPiBmdW5jdGlvbnMgd2l0aCBOVUxMIGFuZCBub3RoaW5nIGJh
ZCBoYXBwZW5zIGlzIHJhdGhlciBjb21tb24gcHJhY3RpY2UuCj4gCj4gT24gdGhlIG90aGVyIGhh
bmQgSSBhZ3JlZSB0aGF0IHRoaXMgbWlnaHQgY2F1c2UgYSBwZXJmb3JtYW5jZSBwcm9ibGVtLiAK
PiBIb3cgbWFueSBzaXRlcyBkbyB3ZSBoYXZlIHdoaWNoIGNvdWxkIGNhbGwgZHJtX2dlbV9vYmpl
Y3RfcHV0KCkgd2l0aCBOVUxMPwoKSnVzdCB0byBwdXQgdGhpcyBpbiBhIHRpbnkgYml0IG9mIHBl
cnNwZWN0aXZlLCBmb3IgaTkxNS5rbwoKYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAxNDEv
MjAgdXAvZG93bjogMjIxMS8tNTI1ICgxNjg2KQoKV2UndmUgaGFkIGZsYW1lIHdhcnMgZm9yIGxl
c3MuIChCZWNhdXNlIGl0J3MgZWFzeSB0byBhcmd1ZSBvdmVyIGxpdHRsZQpjaGFuZ2VzLikgTm93
IHRoaXMgaXMganVzdCBmcm9tIHRoaXMgcGF0Y2ggYW5kIG5vdCB0aGUgcmV2ZXJ0Li4uClRoZSBy
ZXZlcnQgaGFzIG5vIGVmZmVjdCBvbiBjb2RlIHNpemUuCi1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
