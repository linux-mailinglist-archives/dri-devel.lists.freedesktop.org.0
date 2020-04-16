Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F31781ABF72
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 13:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D6E6E2D7;
	Thu, 16 Apr 2020 11:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533B26E3EE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 11:35:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id EF72C2A0234
Subject: Re: [PATCH] drm: Don't free a struct never allocated by
 drm_gem_fb_init()
To: Daniel Vetter <daniel@ffwll.ch>
References: <202004150853.FD574CDD@keescook>
 <20200415171901.23914-1-andrzej.p@collabora.com>
 <CAKMK7uG3zQBVh_b+mwz4o8x29cWHnsPaR9kvP9OtCFisSUgeYg@mail.gmail.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <4ef75a18-2e25-1523-80db-626f985e0178@collabora.com>
Date: Thu, 16 Apr 2020 13:35:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG3zQBVh_b+mwz4o8x29cWHnsPaR9kvP9OtCFisSUgeYg@mail.gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VyBkbml1IDE1LjA0LjIwMjAgb8KgMjA6MzMsIERhbmllbCBWZXR0ZXIgcGlzemU6Cj4gT24gV2Vk
LCBBcHIgMTUsIDIwMjAgYXQgNzoxOSBQTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPiA8YW5kcnpl
ai5wQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiBkcm1fZ2VtX2ZiX2luaXQoKSBpcyBwYXNz
ZWQgdGhlIGZiIGFuZCBuZXZlciBhbGxvY2F0ZXMgaXQsIHNvIGl0IHNob3VsZCBiZQo+PiBub3Qg
dGhlIG9uZSBmcmVlaW5nIGl0LiBBcyBpdCBpcyBub3cgdGhlIHNlY29uZCBjYWxsIHRvIGtmcmVl
KCkgaXMgcG9zc2libGUKPj4gd2l0aCB0aGUgc2FtZSBmYi4gQ292ZXJpdHkgcmVwb3J0ZWQgdGhl
IGZvbGxvd2luZzoKPj4KPj4gKioqIENJRCAxNDkyNjEzOiAgTWVtb3J5IC0gY29ycnVwdGlvbnMg
IChVU0VfQUZURVJfRlJFRSkKPj4gL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVy
X2hlbHBlci5jOiAyMzAgaW4gZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9mdW5jcygpCj4+IDIyNCAg
ICAgICAgICAgICBmYiA9IGt6YWxsb2Moc2l6ZW9mKCpmYiksIEdGUF9LRVJORUwpOwo+PiAyMjUg
ICAgICAgICAgICAgaWYgKCFmYikKPj4gMjI2ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIEVS
Ul9QVFIoLUVOT01FTSk7Cj4+IDIyNwo+PiAyMjggICAgICAgICAgICAgcmV0ID0gZHJtX2dlbV9m
Yl9pbml0X3dpdGhfZnVuY3MoZGV2LCBmYiwgZmlsZSwgbW9kZV9jbWQsIGZ1bmNzKTsKPj4gMjI5
ICAgICAgICAgICAgIGlmIChyZXQpIHsKPj4gdnZ2ICAgICBDSUQgMTQ5MjYxMzogIE1lbW9yeSAt
IGNvcnJ1cHRpb25zICAoVVNFX0FGVEVSX0ZSRUUpCj4+IHZ2diAgICAgQ2FsbGluZyAia2ZyZWUi
IGZyZWVzIHBvaW50ZXIgImZiIiB3aGljaCBoYXMgYWxyZWFkeSBiZWVuIGZyZWVkLiBbTm90ZTog
VGhlIHNvdXJjZSBjb2RlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmdW5jdGlvbiBoYXMgYmVlbiBv
dmVycmlkZGVuIGJ5IGEgdXNlciBtb2RlbC5dCj4+IDIzMCAgICAgICAgICAgICAgICAgICAgIGtm
cmVlKGZiKTsKPj4gMjMxICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIocmV0KTsK
Pj4gMjMyICAgICAgICAgICAgIH0KPj4gMjMzCj4+IDIzNCAgICAgICAgICAgICByZXR1cm4gZmI7
Cj4+IDIzNSAgICAgfQo+Pgo+PiBkcm1fZ2VtX2ZiX2luaXRfd2l0aF9mdW5jcygpIGNhbGxzIGRy
bV9nZW1fZmJfaW5pdCgpCj4+IGRybV9nZW1fZmJfaW5pdCgpIGNhbGxzIGtmcmVlKGZiKQo+Pgo+
PiBSZXBvcnRlZC1ieTogY292ZXJpdHktYm90IDxrZWVzY29vaytjb3Zlcml0eS1ib3RAY2hyb21p
dW0ub3JnPgo+PiBBZGRyZXNzZXMtQ292ZXJpdHktSUQ6IDE0OTI2MTMgKCJNZW1vcnkgLSBjb3Jy
dXB0aW9ucyIpCj4+IEZpeGVzOiBmMmI4MTZkNzhhOTQgKCJkcm0vY29yZTogQWxsb3cgZHJpdmVy
cyBhbGxvY2F0ZSBhIHN1YmNsYXNzIG9mIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIiKQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
Pgo+IAo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxw
ZXIuYyB8IDQgKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1l
YnVmZmVyX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVs
cGVyLmMKPj4gaW5kZXggY2FjMTUyOTRhZWY2Li5jY2MyYzcxZmE0OTEgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jCj4+IEBAIC03NiwxMCAr
NzYsOCBAQCBkcm1fZ2VtX2ZiX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4gICAgICAg
ICAgICAgICAgICBmYi0+b2JqW2ldID0gb2JqW2ldOwo+Pgo+PiAgICAgICAgICByZXQgPSBkcm1f
ZnJhbWVidWZmZXJfaW5pdChkZXYsIGZiLCBmdW5jcyk7Cj4+IC0gICAgICAgaWYgKHJldCkgewo+
PiArICAgICAgIGlmIChyZXQpCj4+ICAgICAgICAgICAgICAgICAgZHJtX2VycihkZXYsICJGYWls
ZWQgdG8gaW5pdCBmcmFtZWJ1ZmZlcjogJWRcbiIsIHJldCk7Cj4+IC0gICAgICAgICAgICAgICBr
ZnJlZShmYik7Cj4+IC0gICAgICAgfQo+Pgo+PiAgICAgICAgICByZXR1cm4gcmV0Owo+PiAgIH0K
Pj4gLS0KPj4gMi4xNy4xCj4+Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
