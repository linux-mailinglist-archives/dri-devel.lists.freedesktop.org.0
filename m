Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D0D83991
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 21:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD552898C2;
	Tue,  6 Aug 2019 19:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AF2898C2;
 Tue,  6 Aug 2019 19:24:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17909790-1500050 for multiple; Tue, 06 Aug 2019 20:24:41 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20190806150134.104222-1-christian.koenig@amd.com>
 <20190806150134.104222-7-christian.koenig@amd.com>
In-Reply-To: <20190806150134.104222-7-christian.koenig@amd.com>
Message-ID: <156511947882.6198.3242911017545657039@skylake-alporthouse-com>
Subject: Re: [PATCH 7/8] dma-buf: add reservation_object_fences helper
Date: Tue, 06 Aug 2019 20:24:38 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTA2IDE2OjAxOjMzKQo+IEFkZCBhIG5l
dyBoZWxwZXIgdG8gZ2V0IGEgY29uc2lzdGVudCBzZXQgb2YgcG9pbnRlcnMgZnJvbSB0aGUgcmVz
ZXJ2YXRpb24KPiBvYmplY3QuIFdoaWxlIGF0IGl0IGdyb3VwIGFsbCBhY2Nlc3MgaGVscGVycyB0
b2dldGhlciBpbiB0aGUgaGVhZGVyIGZpbGUuCgpBaCwgbmVlZHMgdG8gYmUgZWFybGllciA6KQog
Cj4gKy8qKgo+ICsgKiByZXNlcnZhdGlvbl9vYmplY3RfZmVuY2VzIC0gcmVhZCBjb25zaXN0ZW50
IGZlbmNlIHBvaW50ZXJzCj4gKyAqIEBvYmo6IHJlc2VydmF0aW9uIG9iamVjdCB3aGVyZSB3ZSBn
ZXQgdGhlIGZlbmNlcyBmcm9tCj4gKyAqIEBleGNsOiBwb2ludGVyIGZvciB0aGUgZXhjbHVzaXZl
IGZlbmNlCj4gKyAqIEBsaXN0OiBwb2ludGVyIGZvciB0aGUgc2hhcmVkIGZlbmNlIGxpc3QKPiAr
ICoKPiArICogTWFrZSBzdXJlIHdlIGhhdmUgYSBjb25zaXN0ZW4gZXhjbHVzaXZlIGZlbmNlIGFu
ZCBzaGFyZWQgZmVuY2UgbGlzdC4KPiArICogTXVzdCBiZSBjYWxsZWQgd2l0aCByY3UgcmVhZCBz
aWRlIGxvY2sgaGVsZC4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgdm9pZAo+ICtyZXNlcnZhdGlv
bl9vYmplY3RfZmVuY2VzKHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipleGNsLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHJlc2VydmF0aW9uX29iamVjdF9saXN0ICoqbGlzdCkKPiAr
ewo+ICsgICAgICAgdW5zaWduZWQgaW50IHNlcTsKPiArCj4gKyAgICAgICBkbyB7Cj4gKyAgICAg
ICAgICAgICAgIHNlcSA9IHJlYWRfc2VxY291bnRfYmVnaW4oJm9iai0+c2VxKTsKPiArICAgICAg
ICAgICAgICAgKmV4Y2wgPSByY3VfZGVyZWZlcmVuY2Uob2JqLT5mZW5jZV9leGNsKTsKPiArICAg
ICAgICAgICAgICAgKmxpc3QgPSByY3VfZGVyZWZlcmVuY2Uob2JqLT5mZW5jZSk7Cj4gKyAgICAg
ICB9IHdoaWxlIChyZWFkX3NlcWNvdW50X3JldHJ5KCZvYmotPnNlcSwgc2VxKSk7Cj4gK30KCkkg
d291bGQgcGVyc29uYWxseSBwcmVmZXIgcmV0dXJuIGV4Y2wgcmF0aGVyIHRoYW4gaGF2ZSBpdCBh
cyBhIHNlY29uZApvdXRwYXJhbSwgYnV0IEknZCBsZWF2ZSB0aGF0IHRvIGdjYyB0byBkZWNpZGUu
CgpIYXZpbmcgc3RhcmVkIGF0IHRoaXMsIEkgYWdyZWUgdGhpcyBkb2VzIHRoZSByaWdodCB0aGlu
Zy4gVGhlIGltcG9ydGFudApwb2ludCBmcm9tIGFsbCBjYWxsZXJzJyBwZXJzcGVjdGl2ZSBpcyB0
aGF0IHRoZSBjb21iaW5hdGlvbiBvZiBwb2ludGVycwppcyBjb25zaXN0ZW50IGZvciB0aGlzIHJj
dV9yZWFkX2xvY2suIEFuZCByY3VfZGVyZWZlcmVuY2UgZW5mb3JjZXMgdGhlCmNhbGxlcnMgZG8g
aG9sZCByY3VfcmVhZF9sb2NrLgoKSSBkaWRuJ3QgY2hlY2sgYWxsIHRoZSBjb252ZXJzaW9ucywg
anVzdCBzdGFyZWQgYXQgdGhlIGhlYXJ0IG9mIHRoZQpwcm9ibGVtLgoKUmV2aWV3ZWQtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
