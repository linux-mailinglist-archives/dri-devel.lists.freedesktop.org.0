Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0AC2B775C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 08:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907E56E3AE;
	Wed, 18 Nov 2020 07:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D856E3AE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 07:56:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F7E8ABDE;
 Wed, 18 Nov 2020 07:56:21 +0000 (UTC)
Subject: Re: [PATCH 01/10] drm/fb-helper: Call dirty helper after writing to
 fbdev
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20201116200437.17977-1-tzimmermann@suse.de>
 <20201116200437.17977-2-tzimmermann@suse.de>
 <20201117162206.GF6112@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2f57f95c-1ffb-a68e-75d1-1f5a52463147@suse.de>
Date: Wed, 18 Nov 2020 08:56:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117162206.GF6112@intel.com>
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
Cc: airlied@linux.ie, Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 sam@ravnborg.org, christian.koenig@amd.com, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDE3LjExLjIwIHVtIDE3OjIyIHNjaHJpZWIgVmlsbGUgU3lyasOkbMOkOgo+IE9uIE1v
biwgTm92IDE2LCAyMDIwIGF0IDA5OjA0OjI4UE0gKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOgo+PiBJZiBmYmRldiB1c2VzIGEgc2hhZG93IGZyYW1lYnVmZmVyLCBjYWxsIHRoZSBkYW1h
Z2UgaGFuZGxlci4gT3RoZXJ3aXNlCj4+IHRoZSB1cGRhdGUgbWlnaHQgbm90IG1ha2UgaXQgdG8g
dGhlIHNjcmVlbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Cj4+IEZpeGVzOiAyMjJlYzQ1ZjRjNjkgKCJkcm0vZmJfaGVscGVyOiBT
dXBwb3J0IGZyYW1lYnVmZmVycyBpbiBJL08gbWVtb3J5IikKPj4gQ2M6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4g
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
Cj4+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+Cj4+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPj4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9o
ZWxwZXIuYyB8IDMgKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+PiBpbmRleCAyNWVkZjY3MDg2N2MuLmVlMWExOWUyMmRm
MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4+IEBAIC0yMTg5LDYgKzIxODksOSBA
QCBzdGF0aWMgc3NpemVfdCBkcm1fZmJkZXZfZmJfd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8s
IGNvbnN0IGNoYXIgX191c2VyICpidWYsCj4+ICAJaWYgKHJldCA+IDApCj4+ICAJCSpwcG9zICs9
IHJldDsKPj4gIAo+PiArCWlmIChyZXQgPiAwKQo+PiArCQlkcm1fZmJfaGVscGVyX2RpcnR5KGlu
Zm8sIDAsIDAsIGluZm8tPnZhci54cmVzLCBpbmZvLT52YXIueXJlcyk7Cj4gCj4gU2hvdWxkIHRo
YXQgcmF0aGVyIGJlIDAtPnt4LHl9cmVzX3ZpcnR1YWwgb3Ige3gseX1vZmZzZXQtPnt4LHl9cmVz
PwoKVGhhdCBjb2RlIHNuaXBwZXQgd29ya3MgaW4gZHJtX2ZiX2hlbHBlcl9zeXNfd3JpdGUoKS4K
Ckhvd2V2ZXIgdGhlc2UgYXJlIGZyYW1lYnVmZmVyLXJlbGF0aXZlIGNvb3JkaW5hdGVzLiBJIGd1
ZXNzICpyZXNfdmlydHVhbAp3b3VsZCBiZSBtb3JlIGNvcnJlY3QuIEknbGwgdXBkYXRlIHRoZSBw
YXRjaCBhY2NvcmRpbmdseS4gVGhhbmtzIGZvcgpwb2ludGluZyB0aGlzIG91dC4KCkJlc3QgcmVn
YXJkcwpUaG9tYXMKCj4gCj4+ICsKPj4gIAlyZXR1cm4gcmV0ID8gcmV0IDogZXJyOwo+PiAgfQo+
PiAgCj4+IC0tIAo+PiAyLjI5LjIKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgotLSAKVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgK
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55CihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykKR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
