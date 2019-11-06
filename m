Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED28AF13DA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219566ECBC;
	Wed,  6 Nov 2019 10:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545036ECBB;
 Wed,  6 Nov 2019 10:26:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19099629-1500050 for multiple; Wed, 06 Nov 2019 10:26:50 +0000
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191106101950.GE23790@phenom.ffwll.local>
References: <20191106100716.18181-1-chris@chris-wilson.co.uk>
 <20191106101950.GE23790@phenom.ffwll.local>
Message-ID: <157303600842.24928.8883426579845207112@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 1/3] drm: Expose a method for creating
 anonymous struct file around drm_minor
Date: Wed, 06 Nov 2019 10:26:48 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTExLTA2IDEwOjE5OjUwKQo+IE9uIFdlZCwgTm92
IDA2LCAyMDE5IGF0IDEwOjA3OjE0QU0gKzAwMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFNv
bWV0aW1lcyB3ZSBuZWVkIHRvIGNyZWF0ZSBhIHN0cnVjdCBmaWxlIHRvIHdyYXAgYSBkcm1fZGV2
aWNlLCBhcyBpdAo+ID4gdGhlIHVzZXIgd2VyZSB0byBoYXZlIG9wZW5lZCAvZGV2L2RyaS9jYXJk
MCBidXQgdG8gZG8gc28gYW5vbnltb3VzbHkKPiA+IChpLmUuIGZvciBpbnRlcm5hbCB1c2UpLiBQ
cm92aWRlIGEgdXRpbGl0eSBtZXRob2QgdG8gY3JlYXRlIGEgc3RydWN0Cj4gPiBmaWxlIHdpdGgg
dGhlIGRybV9kZXZpY2UtPmRyaXZlci5mb3BzLCB0aGF0IHdyYXAgdGhlIGRybV9kZXZpY2UuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgo+IAo+IEZvciBwcm9wZXIgaW50ZXJuYWwgYWNjZXNzIHdlIGFscmVhZHkgaGF2ZSBkcm1f
Y2xpZW50X29wZW4sIHNvIEkgdGhpbmsKPiB0aGlzIGhhcyBsaW1pdGVkIChidXQgZ29vZCB1c2Up
IGluIHNlbGZ0ZXN0cyBvbmx5LiBTbwo+IEVYUE9SVF9TWU1CT0xfRk9SX1RFU1RTX09OTFkgcGx1
cyBtYXliZSBhIGNsZWFyZXIgbmFtZSBmb3IgdGhlIGludGVuZGVkCj4gdXNlIGxpa2UgZHJtX2Zp
bGVfbW9ja19vcGVuPwoKSSBmb3VuZCB0aGUgZXhhbXBsZSBpbiBkcm1fZ2VtX3ByaW1lX21tYXAo
KSB0aGF0IHdhcyBkb2luZyB0aGUgc2FtZSB0cmljaywKYW5kIHRoZSB0cmljayBvZiBiZWluZyBh
YmxlIHRvIGluc3RhbnRpYXRlIG5ldyBzdHJ1Y3QgZmlsZSBhbmQgaW5zdGFsbCBhCmZkIHdoZW5l
dmVyIHNlZW1zIGxpa2UgaXQgd2lsbCBjb21lIGluIGhhbmR5Li4uIEp1c3QgbGFja2luZyB0aGUg
dGhpcmQKdXNlciBhdCB0aGUgbW9tZW50IHRvIGNsYWltIGdlbmVyYWxpdHkuCi1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
