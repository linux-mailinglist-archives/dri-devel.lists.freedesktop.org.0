Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2F94B2C0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF6B6E2E6;
	Wed, 19 Jun 2019 07:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559A86E268
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:38:58 +0000 (UTC)
Received: from 162-237-133-238.lightspeed.rcsntx.sbcglobal.net
 ([162.237.133.238] helo=lindsey)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <tyhicks@canonical.com>)
 id 1hdMke-0004ks-Dk; Tue, 18 Jun 2019 22:38:52 +0000
Date: Tue, 18 Jun 2019 17:38:49 -0500
From: Tyler Hicks <tyhicks@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm_edid-load: Fix a missing-check bug in
 drivers/gpu/drm/drm_edid_load.c
Message-ID: <20190618223848.GD6248@lindsey>
References: <20190522123920.GB6772@zhanggen-UX430UQ> <87o93u7d3s.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o93u7d3s.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
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
Cc: sean@poorly.run, Gen Zhang <blackgod016574@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yMiAxNzo1NTozNSwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4gT24gV2VkLCAyMiBN
YXkgMjAxOSwgR2VuIFpoYW5nIDxibGFja2dvZDAxNjU3NEBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
SW4gZHJtX2xvYWRfZWRpZF9maXJtd2FyZSgpLCBmd3N0ciBpcyBhbGxvY2F0ZWQgYnkga3N0cmR1
cCgpLiBBbmQgZndzdHIKPiA+IGlzIGRlcmVmZXJlbmNlZCBpbiB0aGUgZm9sbG93aW5nIGNvZGVz
LiBIb3dldmVyLCBtZW1vcnkgYWxsb2NhdGlvbiAKPiA+IGZ1bmN0aW9ucyBzdWNoIGFzIGtzdHJk
dXAoKSBtYXkgZmFpbCBhbmQgcmV0dXJucyBOVUxMLiBEZXJlZmVyZW5jaW5nIAo+ID4gdGhpcyBu
dWxsIHBvaW50ZXIgbWF5IGNhdXNlIHRoZSBrZXJuZWwgZ28gd3JvbmcuIFRodXMgd2Ugc2hvdWxk
IGNoZWNrIAo+ID4gdGhpcyBrc3RyZHVwKCkgb3BlcmF0aW9uLgo+ID4gRnVydGhlciwgaWYga3N0
cmR1cCgpIHJldHVybnMgTlVMTCwgd2Ugc2hvdWxkIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pIHRv
Cj4gPiB0aGUgY2FsbGVyIHNpdGUuCj4gCj4gc3Ryc2VwKCkgaGFuZGxlcyB0aGUgTlVMTCBwb2lu
dGVyIGp1c3QgZmluZSwgc28gdGhlcmUgd29uJ3QgYmUgYSBOVUxMCj4gZGVyZWZlcmVuY2UuIEhv
d2V2ZXIgdGhpcyBwYXRjaCBzZWVtcyBsaWtlIHRoZSByaWdodCB0aGluZyB0byBkbyBhbnl3YXku
CgpJIGNhbWUgYWNyb3NzIHRoaXMgdGhyZWFkIHdoaWxlIHRyaWFnaW5nIENWRS0yMDE5LTEyMzgy
LiBJIGFncmVlIHRoYXQKdGhlIGNvZGUgYmVmb3JlIHdhcyBmaW5lIGJ1dCBtb3JlIGNvbXBsZXgg
dGhhbiBuZWNlc3NhcnkuIFRoZXJlJ3Mgbm8KcmVhbCBzZWN1cml0eSBpbXBhY3QgaGVyZSBzaW5j
ZSBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB3YXMgbm90CnBvc3NpYmxlLiBJJ3ZlIHJlcXVl
c3RlZCB0aGF0IE1JVFJFIHJlamVjdCBDVkUtMjAxOS0xMjM4Mi4KClRoaXMgY2hhbmdlIGlzIGEg
bmljZSBpbXByb3ZlbWVudCwgdGhvdWdoLgoKVHlsZXIKCj4gCj4gUmV2aWV3ZWQtYnk6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
R2VuIFpoYW5nIDxibGFja2dvZDAxNjU3NEBnbWFpbC5jb20+Cj4gPgo+ID4gLS0tCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZF9sb2FkLmMKPiA+IGluZGV4IGE0OTE1MDkuLmEwZTEwN2EgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9hZC5jCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWRfbG9hZC5jCj4gPiBAQCAtMjkwLDYgKzI5MCw4IEBAIHN0cnVjdCBlZGlk
ICpkcm1fbG9hZF9lZGlkX2Zpcm13YXJlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Ip
Cj4gPiAgCSAqIHRoZSBsYXN0IG9uZSBmb3VuZCBvbmUgYXMgYSBmYWxsYmFjay4KPiA+ICAJICov
Cj4gPiAgCWZ3c3RyID0ga3N0cmR1cChlZGlkX2Zpcm13YXJlLCBHRlBfS0VSTkVMKTsKPiA+ICsJ
aWYgKCFmd3N0cikKPiA+ICsJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+ID4gIAllZGlkc3Ry
ID0gZndzdHI7Cj4gPiAgCj4gPiAgCXdoaWxlICgoZWRpZG5hbWUgPSBzdHJzZXAoJmVkaWRzdHIs
ICIsIikpKSB7Cj4gPiAtLS0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAo+IC0tIAo+IEphbmkgTmlrdWxhLCBJbnRlbCBPcGVu
IFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
