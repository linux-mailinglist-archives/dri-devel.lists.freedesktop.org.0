Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B616E78900
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 11:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC4589CCB;
	Mon, 29 Jul 2019 09:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D89E389CCB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 09:58:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E0A715AB;
 Mon, 29 Jul 2019 02:58:05 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EF7C3F694;
 Mon, 29 Jul 2019 02:58:05 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id F23AF68240B; Mon, 29 Jul 2019 10:58:03 +0100 (BST)
Date: Mon, 29 Jul 2019 10:58:03 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] drm: mali-dp: Mark expected switch fall-through
Message-ID: <20190729095803.hd7ehqjc4zlqztv3@e110455-lin.cambridge.arm.com>
References: <20190726112741.19360-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726112741.19360-1-anders.roxell@linaro.org>
User-Agent: NeoMutt/20180716
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kZXJzLAoKT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDE6Mjc6NDFQTSArMDIwMCwgQW5k
ZXJzIFJveGVsbCB3cm90ZToKPiBXaGVuIGZhbGwtdGhyb3VnaCB3YXJuaW5ncyB3YXMgZW5hYmxl
ZCBieSBkZWZhdWx0LCBjb21taXQgZDkzNTEyZWYwZjBlCj4gKCJNYWtlZmlsZTogR2xvYmFsbHkg
ZW5hYmxlIGZhbGwtdGhyb3VnaCB3YXJuaW5nIiksIHRoZSBmb2xsb3dpbmcKPiB3YXJuaW5ncyB3
YXMgc3RhcnRpbmcgdG8gc2hvdyB1cDoKPiAKPiAuLi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlk
cF9ody5jOiBJbiBmdW5jdGlvbiDigJhtYWxpZHBfZm9ybWF0X2dldF9icHDigJk6Cj4gLi4vZHJp
dmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYzozODc6ODogd2FybmluZzogdGhpcyBzdGF0ZW1l
bnQgbWF5IGZhbGwKPiAgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgIGJw
cCA9IDMwOwo+ICAgICB+fn5+Xn5+fgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3
LmM6Mzg4OjM6IG5vdGU6IGhlcmUKPiAgICBjYXNlIERSTV9GT1JNQVRfWVVWNDIwXzEwQklUOgo+
ICAgIF5+fn4KPiAuLi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9ody5jOiBJbiBmdW5jdGlv
biDigJhtYWxpZHBfc2VfaXJx4oCZOgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3
LmM6MTMxMTo0OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbAo+ICB0aHJvdWdoIFst
V2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICAgZHJtX3dyaXRlYmFja19zaWduYWxfY29tcGxl
dGlvbigmbWFsaWRwLT5td19jb25uZWN0b3IsIDApOwo+ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAuLi9kcml2ZXJzL2dwdS9k
cm0vYXJtL21hbGlkcF9ody5jOjEzMTM6Mzogbm90ZTogaGVyZQo+ICAgIGNhc2UgTVdfU1RBUlQ6
Cj4gICAgXn5+fgo+IAo+IFJld29yayB0byBhZGQgYSAnYnJlYWs7JyBpbiBhIGNhc2UgdGhhdCBk
aWRuJ3QgaGF2ZSBpdCBzbyB0aGF0Cj4gdGhlIGNvbXBpbGVyIGRvZXNuJ3Qgd2FybiBhYm91dCBm
YWxsLXRocm91Z2guCj4gCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2NC45Kwo+IEZp
eGVzOiBiODIwNzU2MmFiZGQgKCJkcm0vYXJtL21hbGlkcDogU3BlY2lmaWVkIHRoZSByb3RhdGlv
biBtZW1vcnkgcmVxdWlyZW1lbnRzIGZvciBBRkJDIFlVViBmb3JtYXRzIikKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+CgpSdW5uaW5nIHRo
ZSBwYXRjaCB0aHJvdWdoIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgd291bGQndmUgYWxzbyBn
aXZlbiB5b3UgdGhlCmVtYWlscyBmb3IgdGhlIG1hbGktZHAgbWFpbnRhaW5lcnMgdG8gcmVhY2gg
ZGlyZWN0bHkgYW5kIGhhdmUgYSBmYXN0ZXIgcmVzcG9uc2UKdGltZSwgYnV0IEkgZ3Vlc3MgeW91
IHdlcmUgdHJ5aW5nIHRvIHNlZSBpZiB3ZSBjaGVjayB0aGUgZHJpLWRldmVsIG1haWxpbmcgbGlz
dC4KClRoYW5rcyBmb3IgdGhlIHBhdGNoIQoKQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5k
dWRhdUBhcm0uY29tPgoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FybS9tYWxpZHBfaHcuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9tYWxpZHBfaHcuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMKPiBpbmRleCA1
MGFmMzk5ZDdmNmYuLmRjNWZmZjlhZjMzOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL21hbGlkcF9ody5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYwo+
IEBAIC0zODUsNiArMzg1LDcgQEAgaW50IG1hbGlkcF9mb3JtYXRfZ2V0X2JwcCh1MzIgZm10KQo+
ICAJCXN3aXRjaCAoZm10KSB7Cj4gIAkJY2FzZSBEUk1fRk9STUFUX1ZVWTEwMTAxMDoKPiAgCQkJ
YnBwID0gMzA7Cj4gKwkJCWJyZWFrOwo+ICAJCWNhc2UgRFJNX0ZPUk1BVF9ZVVY0MjBfMTBCSVQ6
Cj4gIAkJCWJwcCA9IDE1Owo+ICAJCQlicmVhazsKPiBAQCAtMTMwOSw3ICsxMzEwLDcgQEAgc3Rh
dGljIGlycXJldHVybl90IG1hbGlkcF9zZV9pcnEoaW50IGlycSwgdm9pZCAqYXJnKQo+ICAJCQli
cmVhazsKPiAgCQljYXNlIE1XX1JFU1RBUlQ6Cj4gIAkJCWRybV93cml0ZWJhY2tfc2lnbmFsX2Nv
bXBsZXRpb24oJm1hbGlkcC0+bXdfY29ubmVjdG9yLCAwKTsKPiAtCQkJLyogZmFsbCB0aHJvdWdo
IHRvIGEgbmV3IHN0YXJ0ICovCgpJdCdzIGEgc2hhbWUgdGhhdCB0aGUgY29tcGlsZXIgdGhyb3dz
IGEgd2FybmluZyBoZXJlLCBpdCB3b3VsZCd2ZSBiZWVuIHJlYWxseQp1c2VmdWwgdG8ga2VlcCB0
aGUgaGludCB0aGF0IGdvaW5nIGJhY2sgdG8gYSBuZXcgc3RhcnQgaXMgaW50ZW50aW9uYWwgd2l0
aG91dApoYXZpbmcgdG8gdHlwZSBhbm90aGVyIGNvbW1lbnQuCgo+ICsJCQkvKiBmYWxsIHRocm91
Z2ggKi8KPiAgCQljYXNlIE1XX1NUQVJUOgo+ICAJCQkvKiB3cml0ZWJhY2sgc3RhcnRlZCwgbmVl
ZCB0byBlbXVsYXRlIG9uZS1zaG90IG1vZGUgKi8KPiAgCQkJaHctPmRpc2FibGVfbWVtd3JpdGUo
aHdkZXYpOwo+IC0tIAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3Vs
ZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2
aW5nIG1lIHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDC
r1xfKOODhClfL8KvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
