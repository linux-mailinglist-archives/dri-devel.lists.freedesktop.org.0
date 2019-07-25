Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB1074E71
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 14:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5876E736;
	Thu, 25 Jul 2019 12:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C3F6E73D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 12:46:14 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64077
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hqd8N-00079A-VE; Thu, 25 Jul 2019 14:46:11 +0200
Subject: Re: [PATCH 0/3] drm/tinydrm: Rename to drm/tiny
To: Daniel Vetter <daniel@ffwll.ch>, sam@ravnborg.org
References: <20190725105132.22545-1-noralf@tronnes.org>
 <20190725120632.GC15868@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9783d219-d044-83a9-66d2-f7f36713f9eb@tronnes.org>
Date: Thu, 25 Jul 2019 14:46:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725120632.GC15868@phenom.ffwll.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=3vpd1GB053BAtrJXaIPJertUWHAuEDSKje6hSUmNC7U=; 
 b=lFHu3aGrKlAMczZ3JoVaouDLnsbe1z71xaYvihEclLNDh2daekfl53g1M+kbGW6fTIgeVgjfqU8X95xwiStsRc4olhWBCCipKryBuFKGv0a3vKdL3Z1qOqQiEU/3sTe5j8lHTuud9RNLtjgkVMMu0fQK2GKlmj3iBNdjoh7jyXW+o0yTflzOJSmmZExiugfSOtBk+zj2ViwNFljhTMtai8zq2O2syrfjIcyFMvxXOy7BUWqGL4GpJ2nj2irk+7o6yPBsWuFHbv2cORbjM4r4Ce667IkJVSa3zGybUvHkPdza7G48hHBretwb7oKP+8CH3jN7PrYXHLjp/W4cGPMYGA==;
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjUuMDcuMjAxOSAxNC4wNiwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBUaHUsIEp1
bCAyNSwgMjAxOSBhdCAxMjo1MToyOVBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
IFRoaXMgaXMgdGhlIGZpbmFsIHBvbGlzaCBvbiB0aW55ZHJtIHR1cm5pbmcgaXQgaW50byBfdGhl
XyBwbGFjZSBmb3IgdGlueQo+PiBEUk0gZHJpdmVycy4KPj4KPj4gTm9yYWxmLgo+Pgo+PiBOb3Jh
bGYgVHLDuG5uZXMgKDMpOgo+PiAgIGRybS90aW55ZHJtL0tjb25maWc6IFJlbW92ZSBtZW51Y29u
ZmlnIERSTV9USU5ZRFJNCj4+ICAgZHJtL3Rpbnlkcm06IFJlbmFtZSBmb2xkZXIgdG8gdGlueQo+
PiAgIGRybS9nbTEydTMyMDogTW92ZSBkcml2ZXIgdG8gZHJtL3RpbnkKPiAKPiBJIHdvbmRlciB3
aGV0aGVyIHdlIGNvdWxkIHBsYWNlIGEgZG9jdW1lbnRhdGlvbiBoaW50IHNvbWV3aGVyZSB0byBw
dXQKPiB0aW55IGRybSBkcml2ZXJzIChpLmUuIG9uZSBmaWxlIG9ubHksIGFuZCB0aGF0IG9uZSBw
cmV0dHkgc21hbGwpIGludG8KPiBkcm0vdGlueS4gQnV0IEkgY291bGRuJ3QgY29tZSB1cCB3aXRo
IGEgZ29vZCBwbGFjZS4gTWF5YmUgcmUtYWRkIHRpbnkucnN0Cj4gd2l0aCBhIHNob3J0IG92ZXJ2
aWV3IHBhcmFncmFwaCB0aGF0IHBvaW50cyBhdCB0aGUgbW9zdCB1c2VmdWwgaGVscGVycyBmb3IK
PiB0aW55IGRyaXZlcnMsIHBsdXMgaG93IHRvIGludGVncmF0ZSB0aGVtPyBLaW5kYSBhcyBhIEZB
USB0byB0aGUgIkkgd2FudCB0bwo+IHBvcnQgYW4gZmJkZXYgZHJpdmVyLCBoYWxwIHBscz8iIHF1
ZXN0aW9uLgo+IAoKU2FtLCBpcyB0aGlzIHNvbWV0aGluZyB5b3UgY291bGQgZG8sIHlvdSBnaXZp
bmcgYSB0YWxrIGFib3V0IHRoaXMgYW5kCmV2ZXJ5dGhpbmcgOi0pCgpBIGxpbmsgdG8gdGhlIGRy
aXZlciBleGFtcGxlIGluIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmM6ICJET0M6IGRyaXZlcgpp
bnN0YW5jZSBvdmVydmlldyIgd291bGQgbWFrZSBzZW5zZSBpbiBzdWNoIGEgZG9jLgoKTm9yYWxm
LgoKPiBBbnl3YXkgdGhhdCdzIGp1c3QgYW4gaWRlYSBhc2lkZSwgb24gdGhlIHNlcmllczoKPiAK
PiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAKPj4K
Pj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE0ICsr
Ky0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8
ICA0ICstCj4+ICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
fCAgMyArLQo+PiAgZHJpdmVycy9ncHUvZHJtL2dtMTJ1MzIwL0tjb25maWcgICAgICAgICAgICAg
IHwgIDkgLS0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2dtMTJ1MzIwL01ha2VmaWxlICAgICAgICAg
ICAgIHwgIDIgLQo+PiAgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L0tjb25maWcg
ICAgIHwgNDEgKysrKysrKysrKysrKy0tLS0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJt
ID0+IHRpbnl9L01ha2VmaWxlICAgIHwgIDEgKwo+PiAgZHJpdmVycy9ncHUvZHJtL3tnbTEydTMy
MCA9PiB0aW55fS9nbTEydTMyMC5jIHwgIDAKPj4gIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9
PiB0aW55fS9oeDgzNTdkLmMgICB8ICAwCj4+ICBkcml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4g
dGlueX0vaWxpOTIyNS5jICAgfCAgMAo+PiAgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRp
bnl9L2lsaTkzNDEuYyAgIHwgIDAKPj4gIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55
fS9taTAyODNxdC5jICB8ICAwCj4+ICBkcml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0v
cmVwYXBlci5jICAgfCAgMAo+PiAgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L3N0
NzU4Ni5jICAgIHwgIDAKPj4gIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55fS9zdDc3
MzVyLmMgICB8ICAwCj4+ICAxNSBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAzNiBk
ZWxldGlvbnMoLSkKPj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ20xMnUz
MjAvS2NvbmZpZwo+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9nbTEydTMy
MC9NYWtlZmlsZQo+PiAgcmVuYW1lIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55fS9L
Y29uZmlnICg3MyUpCj4+ICByZW5hbWUgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9
L01ha2VmaWxlICg4OSUpCj4+ICByZW5hbWUgZHJpdmVycy9ncHUvZHJtL3tnbTEydTMyMCA9PiB0
aW55fS9nbTEydTMyMC5jICgxMDAlKQo+PiAgcmVuYW1lIGRyaXZlcnMvZ3B1L2RybS97dGlueWRy
bSA9PiB0aW55fS9oeDgzNTdkLmMgKDEwMCUpCj4+ICByZW5hbWUgZHJpdmVycy9ncHUvZHJtL3t0
aW55ZHJtID0+IHRpbnl9L2lsaTkyMjUuYyAoMTAwJSkKPj4gIHJlbmFtZSBkcml2ZXJzL2dwdS9k
cm0ve3Rpbnlkcm0gPT4gdGlueX0vaWxpOTM0MS5jICgxMDAlKQo+PiAgcmVuYW1lIGRyaXZlcnMv
Z3B1L2RybS97dGlueWRybSA9PiB0aW55fS9taTAyODNxdC5jICgxMDAlKQo+PiAgcmVuYW1lIGRy
aXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55fS9yZXBhcGVyLmMgKDEwMCUpCj4+ICByZW5h
bWUgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L3N0NzU4Ni5jICgxMDAlKQo+PiAg
cmVuYW1lIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55fS9zdDc3MzVyLmMgKDEwMCUp
Cj4+Cj4+IC0tIAo+PiAyLjIwLjEKPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
