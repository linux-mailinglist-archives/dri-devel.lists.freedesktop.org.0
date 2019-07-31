Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C647BD45
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 11:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4D899F0;
	Wed, 31 Jul 2019 09:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A9A899F0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 09:34:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17754348-1500050 for multiple; Wed, 31 Jul 2019 10:34:27 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 david1.zhou@amd.com, dri-devel@lists.freedesktop.org,
 lionel.g.landwerlin@intel.com
References: <20190731092217.51201-1-christian.koenig@amd.com>
In-Reply-To: <20190731092217.51201-1-christian.koenig@amd.com>
Message-ID: <156456566592.6373.14191833092069557351@skylake-alporthouse-com>
Subject: Re: [PATCH] dma-buf: add dma_fence_chain_for_each_unwrap helper v2
Date: Wed, 31 Jul 2019 10:34:25 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA3LTMxIDEwOjIyOjE3KQo+IEFkZCBhbm90
aGVyIGZvcl9lYWNoIGhlbHBlciB0byBpdGVyYXRlIG92ZXIgYWxsIHRoZSBmZW5jZXMgaW4gYSBj
aGFpbgo+IHdpdGggdW53cmFwcGluZyBlYWNoIGNoYWluIG5vZGUuCj4gCj4gdjI6IGZpeCB0eXBv
cywgc2ltcGxpZnkgYW5kIHJlbmFtZSB0aGUgbmV3IGhlbHBlcgo+IAo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgc3Rh
dGljIGJvb2wgZG1hX2ZlbmNlX2NoYWluX3NpZ25hbGVkKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNl
KQo+ICB7Cj4gLSAgICAgICBkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goZmVuY2UsIGZlbmNlKSB7
Cj4gLSAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfZmVuY2VfY2hhaW4gKmNoYWluID0gdG9fZG1h
X2ZlbmNlX2NoYWluKGZlbmNlKTsKPiAtICAgICAgICAgICAgICAgc3RydWN0IGRtYV9mZW5jZSAq
ZiA9IGNoYWluID8gY2hhaW4tPmZlbmNlIDogZmVuY2U7Cj4gKyAgICAgICBzdHJ1Y3QgZG1hX2Zl
bmNlICpmOwo+ICAKPiArICAgICAgIGRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaF9mZW5jZShmLCBm
ZW5jZSwgZmVuY2UpIHsKCmZvcl9lYWNoX2ZlbmNlKGZlbmNlLCBmZW5jZSwgZmVuY2UpIDopCgpO
byBicmlnaHQgaWRlYXMsIEkgZGlkIGxvb2sgYXQgaG93IGNvbnNpc3RlbnQgaXQgd291bGQgYmUg
dG8gY2FsbCB0aGUKYXJndW1lbnRzIGNoYWluLCBtYXliZSBoZWFkPyBCdXQgdGhlbiBmb3JfZWFj
aF9mZW5jZShmLCBoZWFkLCBoZWFkKSwgc28Kbm90IG11Y2ggb2YgaW1wcm92ZW1lbnQuCgo+ICsv
KioKPiArICogZG1hX2ZlbmNlX2NoYWluX2Zvcl9lYWNoX2ZlbmNlcyAtIGl0ZXJhdGUgb3ZlciBh
bGwgdW53cmFwcGVkIGZlbmNlcyBpbiBjaGFpbgpPbmUgbGFzdCB0eXBvLCBkbWFfZmVuY2VfY2hh
aW5fZm9yX2VhY2hfZmVuY2UuCgo+ICsgKiBAZmVuY2U6IHRoZSB1bndyYXBwZWQgZmVuY2UKPiAr
ICogQGl0ZXI6IGN1cnJlbnQgZmVuY2UKPiArICogQGhlYWQ6IHN0YXJ0aW5nIHBvaW50Cj4gKyAq
Cj4gKyAqIEl0ZXJhdGUgb3ZlciBhbGwgZmVuY2VzIGluIHRoZSBjaGFpbiB3aXRoIHVud3JhcHBp
bmcuIFdlIGtlZXAgYSByZWZlcmVuY2UgdG8KPiArICogdGhlIGN1cnJlbnQgY2hhaW4gbm9kZSB3
aGlsZSBpbnNpZGUgdGhlIGxvb3Agd2hpY2ggbXVzdCBiZSBkcm9wcGVkIHdoZW4gYnJlYWtpbmcK
PiArICogb3V0Lgo+ICsgKi8KPiArI2RlZmluZSBkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2hfZmVu
Y2UoZmVuY2UsIGl0ZXIsIGhlYWQpICAgICAgXAo+ICsgICAgICAgZm9yIChpdGVyID0gZG1hX2Zl
bmNlX2dldChoZWFkKTsgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgIChm
ZW5jZSA9IGRtYV9mZW5jZV9jaGFpbl91bndyYXAoaXRlcikpOyAgICAgICAgICAgIFwKPiArICAg
ICAgICAgICAgaXRlciA9IGRtYV9mZW5jZV9jaGFpbl93YWxrKGl0ZXIpKQoKUmV2aWV3ZWQtYnk6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
