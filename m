Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448821DB41C
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 14:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8F86E14E;
	Wed, 20 May 2020 12:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB6D6E14E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:49:27 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21240706-1500050 for multiple; Wed, 20 May 2020 13:49:18 +0100
MIME-Version: 1.0
In-Reply-To: <96a01388-7d91-56b5-4cd4-16052aba7a60@amd.com>
References: <20200520121450.79340-1-nirmoy.das@amd.com>
 <96a01388-7d91-56b5-4cd4-16052aba7a60@amd.com>
Subject: Re: [PATCH 1/1] drm: check for NULL pointer in drm_gem_object_put
To: Christian König <christian.koenig@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158997895740.8153.16875812670855148581@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Wed, 20 May 2020 13:49:17 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDIwLTA1LTIwIDEzOjE5OjQyKQo+IEFtIDIwLjA1
LjIwIHVtIDE0OjE0IHNjaHJpZWIgTmlybW95IERhczoKPiA+IGRybV9nZW1fZmJfZGVzdHJveSgp
IGNhbGxzIGRybV9nZW1fb2JqZWN0X3B1dCgpIHdpdGggTlVMTCBvYmogY2F1c2luZzoKPiA+IFsg
ICAxMS41ODQyMDldIEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVz
czogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgIDExLjU4NDIxM10gI1BGOiBzdXBlcnZpc29yIHdy
aXRlIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQo+ID4gWyAgIDExLjU4NDIxNV0gI1BGOiBlcnJvcl9j
b2RlKDB4MDAwMikgLSBub3QtcHJlc2VudCBwYWdlCj4gPiBbICAgMTEuNTg0MjE2XSBQR0QgMCBQ
NEQgMAo+ID4gWyAgIDExLjU4NDIyMF0gT29wczogMDAwMiBbIzFdIFNNUCBOT1BUSQo+ID4gWyAg
IDExLjU4NDIyM10gQ1BVOiA3IFBJRDogMTU3MSBDb21tOiBnbm9tZS1zaGVsbCBUYWludGVkOiBH
ICAgICAgICAgICAgRSAgICAgNS43LjAtcmMxLTEtZGVmYXVsdCsgIzI3Cj4gPiBbICAgMTEuNTg0
MjI1XSBIYXJkd2FyZSBuYW1lOiBNaWNyby1TdGFyIEludGVybmF0aW9uYWwgQ28uLCBMdGQuIE1T
LTdBMzEvWDM3MCBYUE9XRVIgR0FNSU5HIFRJVEFOSVVNIChNUy03QTMxKSwgQklPUyAxLk1SIDEy
LzAzLzIwMTkKPiA+IFsgICAxMS41ODQyMzddIFJJUDogMDAxMDpkcm1fZ2VtX2ZiX2Rlc3Ryb3kr
MHgyOC8weDcwIFtkcm1fa21zX2hlbHBlcl0KPiA+IDxzbmlwPgo+ID4gWyAgIDExLjU4NDI1Nl0g
Q2FsbCBUcmFjZToKPiA+IFsgICAxMS41ODQyNzldICBkcm1fbW9kZV9ybWZiKzB4MTg5LzB4MWMw
IFtkcm1dCj4gPiBbICAgMTEuNTg0Mjk5XSAgPyBkcm1fbW9kZV9ybWZiKzB4MWMwLzB4MWMwIFtk
cm1dCj4gPiBbICAgMTEuNTg0MzE0XSAgZHJtX2lvY3RsX2tlcm5lbCsweGFhLzB4ZjAgW2RybV0K
PiA+IFsgICAxMS41ODQzMjldICBkcm1faW9jdGwrMHgxZmYvMHgzYjAgW2RybV0KPiA+IFsgICAx
MS41ODQzNDddICA/IGRybV9tb2RlX3JtZmIrMHgxYzAvMHgxYzAgW2RybV0KPiA+IFsgICAxMS41
ODQ0MjFdICBhbWRncHVfZHJtX2lvY3RsKzB4NDkvMHg4MCBbYW1kZ3B1XQo+ID4gWyAgIDExLjU4
NDQyN10gIGtzeXNfaW9jdGwrMHg4Ny8weGMwCj4gPiBbICAgMTEuNTg0NDMwXSAgX194NjRfc3lz
X2lvY3RsKzB4MTYvMHgyMAo+ID4gWyAgIDExLjU4NDQzNF0gIGRvX3N5c2NhbGxfNjQrMHg1Zi8w
eDI0MAo+ID4gWyAgIDExLjU4NDQzOF0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsw
eDQ0LzB4YTkKPiA+IFsgICAxMS41ODQ0NDBdIFJJUDogMDAzMzoweDdmMGVmODBmNzIyNwo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPiAKPiBG
aXhlczogLi4uLiBtaXNzaW5nIGhlcmUuIEFwYXJ0IGZyb20gdGhhdCBSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyAKPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4KPiAKPiBQbGVhc2Ug
cmVzZW5kIHdpdGggdGhlIHRhZyBhZGRlZCwgdGhlbiBJJ20gZ29pbmcgdG8gcHVzaCB0aGlzIHRv
IAo+IGRybS1taXNjLW5leHQgYXNhcC4KPiAKPiBDaHJpc3RpYW4uCj4gCj4gPiAtLS0KPiA+ICAg
aW5jbHVkZS9kcm0vZHJtX2dlbS5oIHwgMyArKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmggYi9p
bmNsdWRlL2RybS9kcm1fZ2VtLmgKPiA+IGluZGV4IDUyMTczYWJkZjUwMC4uYTEzNTEwMzQ2YTli
IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4gPiArKysgYi9pbmNsdWRl
L2RybS9kcm1fZ2VtLmgKPiA+IEBAIC0zNzIsNiArMzcyLDkgQEAgc3RhdGljIGlubGluZSB2b2lk
IGRybV9nZW1fb2JqZWN0X2dldChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiA+ICAgc3Rh
dGljIGlubGluZSB2b2lkCj4gPiAgIGRybV9nZW1fb2JqZWN0X3B1dChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaikKPiA+ICAgewo+ID4gKyAgICAgaWYgKCFvYmopCj4gPiArICAgICAgICAgICAg
IHJldHVybjsKPiA+ICsKClRoaXMgYWRkcyBzZXZlcmFsIHRob3VzYW5kIE5VTEwgY2hlY2tzIHdo
ZXJlIHRoZXJlIHdlcmUgcHJldmlvdXNseSBub25lLgpJIGRvdWJ0IHRoZSBjb21waWxlciBlbGlt
aW5hdGVzIHRoZW0gYWxsLgoKSSdkIHN1Z2dlc3QgcmV2ZXJ0aW5nCmI1ZDI1MDc0NGNjYyAoImRy
bS9nZW06IGZvbGQgZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkIGFuZCBfX2RybV9nZW1fb2Jq
ZWN0X3B1dCgpIikKLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
