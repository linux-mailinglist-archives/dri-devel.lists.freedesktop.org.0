Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD74145E50
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 23:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684906F910;
	Wed, 22 Jan 2020 22:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE426F90F;
 Wed, 22 Jan 2020 22:00:38 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19976085-1500050 for multiple; Wed, 22 Jan 2020 22:00:34 +0000
MIME-Version: 1.0
To: =?utf-8?q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <d5facf06-14d6-0203-f43c-22400588ab70@shipmail.org>
References: <20200122155637.496291-1-chris@chris-wilson.co.uk>
 <d5facf06-14d6-0203-f43c-22400588ab70@shipmail.org>
Message-ID: <157973043337.15024.17688241519297504558@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm: Release filp before global lock
Date: Wed, 22 Jan 2020 22:00:33 +0000
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSAoMjAyMC0wMS0yMiAyMTo1MjoyMykK
PiBIaSwgQ2hyaXMsCj4gCj4gT24gMS8yMi8yMCA0OjU2IFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6
Cj4gPiBUaGUgZmlsZSBpcyBub3QgcGFydCBvZiB0aGUgZ2xvYmFsIGRybSByZXNvdXJjZSBhbmQg
Y2FuIGJlIHJlbGVhc2VkCj4gPiBwcmlvciB0byB0YWtlIHRoZSBnbG9iYWwgbXV0ZXggdG8gZHJv
cCB0aGUgb3Blbl9jb3VudCAoYW5kIHBvdGVudGlhbGx5Cj4gPiBjbG9zZSkgdGhlIGRybSBkZXZp
Y2UuCj4gPgo+ID4gSG93ZXZlciwgaW5zaWRlIGRybV9jbG9zZV9oZWxwZXIoKSB0aGVyZSBhcmUg
YSBudW1iZXIgb2YgZGV2LT5kcml2ZXIKPiA+IGNhbGxiYWNrcyB0aGF0IHRha2UgdGhlIGRybV9k
ZXZpY2UgYXMgdGhlIGZpcnN0IHBhcmFtZXRlci4uLiBXb3JyeWluZ2x5Cj4gPiBzb21lIG9mIHRo
b3NlIGNhbGxiYWNrcyBtYXkgYmUgKGltcGxpY2l0bHkpIGRlcGVuZGluZyBvbiB0aGUgZ2xvYmFs
Cj4gPiBtdXRleC4KPiAKPiBJIHJlYWQgdGhpcyBhcyB5b3Ugc3VzcGVjdCB0aGF0IHRoZXJlIGFy
ZSBkcml2ZXIgY2FsbGJhY2tzIGluc2lkZSAKPiBkcm1fY2xvc2VfaGVscGVyKCkgdGhhdCBtaWdo
dCBuZWVkIHRoZSBnbG9iYWwgbXV0ZXggaGVsZD8gQnV0IHRoZW4gaXQgCj4gd291bGRuJ3QgYmUg
c2FmZSB0byBtb3ZlIHRoZSBsb2NrPyBJcyB0aGVyZSBhIHN0cm9uZyBtb3RpdmF0aW9uIGZvciAK
PiBtb3ZpbmcgdGhlIGxvY2tpbmcgaW4gdGhlIGZpcnN0IHBsYWNlPyBBbHNvIGEgbWlub3Igbml0
IGJlbG93OgoKVGhlIG51bWJlciBvZiBwcm9jZXNzZXMgc3R1Y2sgb24gJ0QnIGR1ZSB0byBtdXRl
eF9sb2NrKCZnbG9iYWwpIGNhdWdodCBteQphdHRlbnRpb24gd2hpbGUgdGhleSB3ZXJlIGNsZWFu
aW5nIHVwIGZpbGVzLiBJIHRoaW5rIGV2ZXJ5b25lIGVsc2Ugd2lsbApiZSBsZXNzIGltcHJlc3Nl
ZCBpZiB0aGVpciBkcml2ZXIgd2FzIHN0dWNrIGJlY2F1c2UgaTkxNSB3YXMgZnJlZWluZyBhCnVz
ZXIncyBmaWxwLgoKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jIHwg
NCArKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9maWxlLmMKPiA+IGluZGV4IDkyZDE2NzI0Zjk0OS4uODRlZDMxM2Vl
MmU5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4gPiBAQCAtNDM4LDEyICs0MzgsMTIgQEAgaW50
IGRybV9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxwKQo+ID4g
ICAgICAgc3RydWN0IGRybV9taW5vciAqbWlub3IgPSBmaWxlX3ByaXYtPm1pbm9yOwo+ID4gICAg
ICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IG1pbm9yLT5kZXY7Cj4gPiAgIAo+ID4gLSAgICAg
bXV0ZXhfbG9jaygmZHJtX2dsb2JhbF9tdXRleCk7Cj4gPiAtCj4gPiAgICAgICBEUk1fREVCVUco
Im9wZW5fY291bnQgPSAlZFxuIiwgZGV2LT5vcGVuX2NvdW50KTsKPiAKPiBUaGUgcmVhZCBvZiBk
ZXYtPm9wZW5fY291bnQgc2hvdWxkIHN0aWxsIGJlIGluc2lkZSB0aGUgbG9jayB0byBiZSAKPiBj
b25zaXN0ZW50IHdpdGggdGhlIHZhbHVlIHRoYXQgaXMgZGVjcmVtZW50ZWQgYmVsb3cuIFBlcmhh
cHMgbW92ZSB0aGUgCj4gRFJNX0RFQlVHKCk/CgpTdXJlLiBJcyBpdCBldmVuIHdvcnRoIGEgZGVi
dWc/Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
