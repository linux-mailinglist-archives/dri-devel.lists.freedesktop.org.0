Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65B90835
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 21:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A49E6E98F;
	Fri, 16 Aug 2019 19:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8F16E98F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 19:28:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18167283-1500050 for multiple; Fri, 16 Aug 2019 20:28:08 +0100
MIME-Version: 1.0
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAKMK7uGWV431+Ru7qTMWk72dHPXe_UJDj-PA02p64PET0XYZEg@mail.gmail.com>
References: <20190816152152.27550-1-chris@chris-wilson.co.uk>
 <20190816152152.27550-2-chris@chris-wilson.co.uk>
 <77eab42b-2404-0ba4-b323-948c040c3759@amd.com>
 <CAKMK7uGWV431+Ru7qTMWk72dHPXe_UJDj-PA02p64PET0XYZEg@mail.gmail.com>
Message-ID: <156598368538.11610.16919989264185896588@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 2/2] dma-fence: Simply wrap dma_fence_signal_locked with
 dma_fence_signal
Date: Fri, 16 Aug 2019 20:28:05 +0100
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA4LTE2IDIwOjA3OjI0KQo+IE9uIEZyaSwgQXVn
IDE2LCAyMDE5IGF0IDk6MDIgUE0gS29lbmlnLCBDaHJpc3RpYW4KPiA8Q2hyaXN0aWFuLktvZW5p
Z0BhbWQuY29tPiB3cm90ZToKPiA+Cj4gPiBBbSAxNi4wOC4xOSB1bSAxNzoyMSBzY2hyaWViIENo
cmlzIFdpbHNvbjoKPiA+ID4gQ3VycmVudGx5IGRtYV9mZW5jZV9zaWduYWwoKSB0cmllcyB0byBh
dm9pZCB0aGUgc3BpbmxvY2sgYW5kIG9ubHkgdGFrZXMKPiA+ID4gaXQgaWYgYWJzb2x1dGVseSBy
ZXF1aXJlZCB0byB3YWxrIHRoZSBjYWxsYmFjayBsaXN0LiBIb3dldmVyLCB0byBhbGxvdwo+ID4g
PiBmb3Igc29tZSB1c2VycyB0byBzdXJyZXB0aXRpb3VzbHkgaW5zZXJ0IGxhenkgc2lnbmFsIGNh
bGxiYWNrcyB0aGF0Cj4gPiA+IGRvIG5vdCBkZXBlbmQgb24gZW5hYmxpbmcgdGhlIHNpZ25hbGlu
ZyBtZWNoYW5pc20gYXJvdW5kIGV2ZXJ5IGZlbmNlLAo+ID4gPiB3ZSBhbHdheXMgbmVlZCB0byBu
b3RpZnkgdGhlIGNhbGxiYWNrcyBvbiBzaWduYWxpbmcuIEFzIHN1Y2gsIHdlIHdpbGwKPiA+ID4g
YWx3YXlzIG5lZWQgdG8gdGFrZSB0aGUgc3BpbmxvY2sgYW5kIGRtYV9mZW5jZV9zaWduYWwoKSBl
ZmZlY3RpdmVseQo+ID4gPiBiZWNvbWVzIGEgY2xvbmUgb2YgZG1hX2ZlbmNlX3NpZ25hbF9sb2Nr
ZWQoKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Cj4gPiA+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgo+ID4gPiAtLS0KPiA+ID4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgfCAxOSAr
KysrKy0tLS0tLS0tLS0tLS0tCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiA+ID4gaW5kZXgg
ZmYwY2Q2ZWFlNzY2Li5mMjNlYjlmMTliNGUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtZmVuY2UuYwo+ID4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMK
PiA+ID4gQEAgLTE3Niw2ICsxNzYsNyBAQCBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9zaWduYWxf
bG9ja2VkKTsKPiA+ID4gICBpbnQgZG1hX2ZlbmNlX3NpZ25hbChzdHJ1Y3QgZG1hX2ZlbmNlICpm
ZW5jZSkKPiA+ID4gICB7Cj4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPiA+ICsg
ICAgIGludCByZXQ7Cj4gPiA+Cj4gPiA+ICAgICAgIGlmICghZmVuY2UpCj4gPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+IEBAIC0xODMsMjEgKzE4NCwxMSBAQCBpbnQgZG1h
X2ZlbmNlX3NpZ25hbChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPiA+ID4gICAgICAgaWYgKHRl
c3RfYW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lHTkFMRURfQklULCAmZmVuY2UtPmZsYWdz
KSkKPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiBJIG5lZWQgdG8g
dGFrZSBteSByZXZpZXcgYmFjay4gWW91IGFsc28gbmVlZCB0byBkcm9wIHRoaXMKPiA+IHRlc3Rf
YW5kX3NldF9iaXQgaGVyZSBvciB5b3VyIGNvbXBsZXRlbHkgYnJlYWsgZHJpdmVycyB1c2luZyB0
aGlzLgoKRmlyc3QgdGltZSB3ZSB3ZXJlIGhlcmUsIGl0IHdhcyBqdXN0IGEgcGxhaW4gdGVzdF9i
aXQoKS4gU2tpcHBpbmcgYQpwYXRjaCwgc28gaGFkIHRvIHN0YXJ0IGZyb20gc2NyYXRjaC4uLiAo
SSBibGFtZSBnbGFuY2luZyBhdCB0aGUgb3JpZ2luYWwKb3V0Y29tZSBhbmQgZ2xvc3Npbmcgb3Zl
ciB0aGUgdGVzdF9iaXQgdnMgdGVzdF9hbmRfc2V0X2JpdC4pCgo+IFRpbWUgZm9yIGEgcGlsZSBv
ZiBkbWFfZmVuY2Ugc2VsZnRlc3RzPyBNYXliZSB3aXRoIGEgYml0IG9mIGRtYV9yZXN2Cj4gdGhy
b3duIGluIGZvciBnb29kPyBUaGlzIHN0dWZmIGlzIHRyaWNreSwgYW5kIGl0IGZlZWxzIGxpa2Ug
d2UgaGFkIGEKPiBmZXcgb29wc2llcyBpbiByZXZpZXcgcmVjZW50bHkgLi4uCgpkbWFfZmVuY2Vf
c2lnbmFsIHZzIGRtYV9mZW5jZV9hZGRfY2FsbGJhY2sKClNvbWV0aGluZyBsaWtlOgoKd2hpbGUg
KCF0aW1lb3V0KQoJZjEgPSBtb2NrX2ZlbmNlX2NyZWF0ZSgpCglwdXNoIGYxIHRvIG90aGVyIHRo
cmVhZAoJcHVsbCBmMiBmcm9tIG90aGVyIHRocmVhZAoJZG1hX2ZlbmNlX3NpZ25hbChmMik7Cglk
bWFfZmVuY2VfYWRkX2NhbGxiYWNrKGYxKQoJZG1hX2ZlbmNlX3NpZ25hbChmMSk7CgljaGVjayBj
YgoKQ2FuJ3Qgc2VlIGFuIG9idmlvdXMgd2F5IHRvIG1ha2UgdGhlIHRlc3RfYW5kX3NldF9iaXQg
d2luZG93IGxhcmdlci4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
