Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5F92936F5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 10:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8510D6EBA5;
	Tue, 20 Oct 2020 08:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D26F6EBA5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 08:45:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B07B3ACAE;
 Tue, 20 Oct 2020 08:45:16 +0000 (UTC)
Subject: Re: [PATCH] drm/vkms: Unset preferred_depth
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201020083515.941832-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b85411c0-ce0e-54e0-4c6d-08b349c5dfa7@suse.de>
Date: Tue, 20 Oct 2020 10:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201020083515.941832-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDIwLjEwLjIwIDEwOjM1LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFRoZXJlJ3MgYSBj
b25mdXNpb24gYmV0d2VlbiB0aGUgcHJlZmVycmVkX2RlcHRoIHVhcGkgYW5kIHRoZSBnZW5lcmlj
Cj4gZmJkZXYgaGVscGVycy4gRm9ybWVyIHdhbnRzIGRlcHRoLCBsYXR0ZXIgd2FudHMgYnBwLCBh
bmQgZm9yIFhSR0I4ODg4Cj4gdGhleSBkb24ndCBtYXRjaC4gV2hpY2ggaGl0IG1lIHdpdGggdmtt
cywgd2hpY2ggd2FudHMgdGhhdC4KPiAKPiBBbGwgb3RoZXIgZHJpdmVycyBzZXR0aW5nIHRoaXMg
YW5kIHVzaW5nIHRoZSBnZW5lcmljIGZiZGV2IGhlbHBlcnMgdXNlCj4gMTYsIHdoZXJlIGJvdGgg
bnVtYmVycyBtYXRjaCwgZm9yIFJHQjU2NS4KPiAKPiBTaW5jZSBmaXhpbmcgdGhpcyBpcyBhIGJp
dCBpbnZvbHZlZCAoSSB0aGluayBmb3IgYXRvbWljIGRyaXZlcnMgd2UKPiBzaG91bGQganVzdCBj
b21wdXRlIHRoaXMgYWxsIGludGVybmFsbHkgZnJvbSB0aGUgZm9ybWF0IGxpc3Qgb2YgdGhlCj4g
Zmlyc3QgcHJpbWFyeSBwbGFuZSkgcGFwZXIgb3ZlciB0aGUgaXNzdWUgaW4gdmttcyBieSB1c2lu
ZyBkZWZhdWx0cwo+IGV2ZXJ5d2hlcmUuIFRoZW4gdXNlcnNwYWNlIHdpbGwgcGljayBYUkdCODg4
OCwgYW5kIGZiZGV2IGhlbHBlcnMgd2lsbAo+IGRvIHRoZSBzYW1lLCBhbmQgd2UgaGF2ZSB3aGF0
IHdlIHdhbnQuCj4gCj4gUmVwb3J0ZWQtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5m
cj4KPiBDYzogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgo+IFNpZ25lZC1vZmYtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBSb2RyaWdvIFNp
cXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4KPiBDYzogTWVsaXNzYSBXZW4g
PG1lbGlzc2Euc3J3QGdtYWlsLmNvbT4KPiBDYzogSGFuZWVuIE1vaGFtbWVkIDxoYW1vaGFtbWVk
LnNhQGdtYWlsLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jIHwgNSArKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92
a21zX2Rydi5jCj4gaW5kZXggMjVmYWJhNWFhYzA4Li45OGJhODQ0YWU3N2QgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfZHJ2LmMKPiBAQCAtMTE0LDcgKzExNCwxMCBAQCBzdGF0aWMgaW50IHZrbXNf
bW9kZXNldF9pbml0KHN0cnVjdCB2a21zX2RldmljZSAqdmttc2RldikKPiAgCWRldi0+bW9kZV9j
b25maWcubWF4X2hlaWdodCA9IFlSRVNfTUFYOwo+ICAJZGV2LT5tb2RlX2NvbmZpZy5jdXJzb3Jf
d2lkdGggPSA1MTI7Cj4gIAlkZXYtPm1vZGVfY29uZmlnLmN1cnNvcl9oZWlnaHQgPSA1MTI7Cj4g
LQlkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDMyOwo+ICsJLyogRklYTUU6IFRo
ZXJlJ3MgYSBjb25mdXNpb24gYmV0d2VlbiBicHAgYW5kIGRlcHRoIGJldHdlZW4gdGhpcyBhbmQK
PiArCSAqIGZiZGV2IGhlbHBlcnMuIFdlIGhhdmUgdG8gZ28gd2l0aCAwLCBtZWFuaW5nICJwaWNr
IHRoZSBkZWZhdWx0IiwKPiArCSAqIHdoaWNoIGl4IFhSR0I4ODg4IGluIGFsbCBjYXNlcy4gKi8K
PiArCWRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMDsKCkl0J3MgYWxyZWFkeSAw
IGF0IHRoaXMgcG9pbnQuCgpJIHN1Z2dlc3QgdG8gcmF0aGVyIGRvY3VtZW50IHRoaXMgRklYTUUg
YXMgcGFydCBvZiB0aGUgZG9jdW1lbnRhdGlvbiBvZgpkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgp
IGFuZCBwcmVmZXJyZWRfZGVwdGguIE90aGVyIGRyaXZlcnMgYXJlIGFsc28KYWZmZWN0ZWQuCgpC
ZXN0IHJlZ2FyZHMKVGhvbWFzCgo+ICAJZGV2LT5tb2RlX2NvbmZpZy5oZWxwZXJfcHJpdmF0ZSA9
ICZ2a21zX21vZGVfY29uZmlnX2hlbHBlcnM7Cj4gIAo+ICAJcmV0dXJuIHZrbXNfb3V0cHV0X2lu
aXQodmttc2RldiwgMCk7Cj4gCgotLSAKVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykK
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
