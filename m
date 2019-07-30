Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39BF7B330
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 21:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3CE6E5FC;
	Tue, 30 Jul 2019 19:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA956E5FC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 19:23:55 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17738933-1500050 for multiple; Tue, 30 Jul 2019 20:23:41 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 david1.zhou@amd.com, dri-devel@lists.freedesktop.org,
 lionel.g.landwerlin@intel.com
References: <20190730121554.105600-1-christian.koenig@amd.com>
In-Reply-To: <20190730121554.105600-1-christian.koenig@amd.com>
Message-ID: <156451461976.6373.18076824287069029539@skylake-alporthouse-com>
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_chain_for_each_unwrap helper
Date: Tue, 30 Jul 2019 20:23:39 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA3LTMwIDEzOjE1OjUzKQo+ICsvKioKPiAr
ICogZG1hX2ZlbmNlX2NoYWluX3Vud3JhcCAtIHVud3JhcCBjaGFpbiBub2RlCj4gKyAqIEBmZW5j
ZTogZmVuY2Ugd2hpY2ggY291bGQgYmUgYSBjaGFpbiBub2RlCj4gKyAqCj4gKyAqIElmIHRoZSBw
YXJhbXRlciBpcyBhIGNoYWluIG5vZGUgcmV0dXJuIHRoZSBjb3RhaW5lZCBmZW5jZSwgb3RoZXJ3
aXNlIHJldHVybgo+ICsgKiB0aGUgcGFyYW1ldGVyIGl0c2VsZi4KPiArICovCgpzL3BhcmFtdGVy
L3BhcmFtZXRlci8Kcy9jb3RhaW5lZC9jb250YWluZWQvCgo+ICtzdGF0aWMgaW5saW5lIHN0cnVj
dCBkbWFfZmVuY2UgKgo+ICtkbWFfZmVuY2VfY2hhaW5fdW53cmFwKHN0cnVjdCBkbWFfZmVuY2Ug
KmZlbmNlKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlX2NoYWluICpjaGFpbiA9IHRv
X2RtYV9mZW5jZV9jaGFpbihmZW5jZSk7Cj4gKwo+ICsgICAgICAgaWYgKCFjaGFpbikKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGZlbmNlOwo+ICsKPiArICAgICAgIHJldHVybiBjaGFpbi0+ZmVu
Y2U7Cj4gK30KCj4gKy8qKgo+ICsgKiBkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2hfdW53cmFwIC0g
aXRlcmF0ZSBvdmVyIGFsbCB1bndyYXBwZWQgZmVuY2VzIGluIGNoYWluCj4gKyAqIEBmZW5jZTog
dGhlIHVud3JhcHBlZCBmZW5jZQo+ICsgKiBAaXRlcjogY3VycmVudCBmZW5jZQo+ICsgKiBAaGVh
ZDogc3RhcnRpbmcgcG9pbnQKPiArICoKPiArICogSXRlcmF0ZSBvdmVyIGFsbCBmZW5jZXMgaW4g
dGhlIGNoYWluIHdpdGggdW53cmFwcGluZy4gV2Uga2VlcCBhIHJlZmVyZW5jZSB0bwo+ICsgKiB0
aGUgY3VycmVudCBmZW5jZSB3aGlsZSBpbnNpZGUgdGhlIGxvb3Agd2hpY2ggbXVzdCBiZSBkcm9w
cGVkIHdoZW4gYnJlYWtpbmcKPiArICogb3V0Lgo+ICsgKi8KPiArI2RlZmluZSBkbWFfZmVuY2Vf
Y2hhaW5fZm9yX2VhY2hfdW53cmFwKGZlbmNlLCBpdGVyLCBoZWFkKSAgICAgXAo+ICsgICAgICAg
Zm9yIChpdGVyID0gZG1hX2ZlbmNlX2dldChoZWFkKSwgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICAgICAgIGZlbmNlID0gZG1hX2ZlbmNlX2NoYWluX3Vud3JhcChpdGVyKTsgICAg
ICAgICAgICAgIFwKPiArICAgICAgICAgICAgaXRlcjsgaXRlciA9IGRtYV9mZW5jZV9jaGFpbl93
YWxrKGl0ZXIpLCAgICAgICAgICAgXAo+ICsgICAgICAgICAgICBmZW5jZSA9IGRtYV9mZW5jZV9j
aGFpbl91bndyYXAoaXRlcikpCgpXaHkgbm90CmZvciAoaXRlciA9IGRtYV9mZW5jZV9nZXQoaGVh
ZCk7CgkoZmVuY2UgPSBkbWFfZmVuY2VfY2hhaW5fdW53cmFwKGl0ZXIpKTsKCWl0ZXIgPSBkbWFf
ZmVuY2VfY2hhaW5fd2FsayhpdGVyKSkKPyBJdCBkb2Vzbid0IGxvb2sgbGlrZSBkbWFfZmVuY2Vf
Y2hhaW5fdW53cmFwKCkgY2FuIGxlZ2FsbHkgcmV0dXJuIE5VTEwsCmJ1dCBpZiB5b3UgcGFzcyBO
VUxMIHRvIHVud3JhcCBpdCByZXR1cm5zIE5VTEwuCgpJJ2Qgdm90ZSBmb3IgZG1hX2ZlbmNlX2No
YWluX2Zvcl9lYWNoX2ZlbmNlKCkgaW4gdGhlIHNwaXJpdCBvZgpsaXN0X2Zvcl9lYWNoX2VudHJ5
KCkuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
