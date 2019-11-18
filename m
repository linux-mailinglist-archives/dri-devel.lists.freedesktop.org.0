Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C31005F0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2016E506;
	Mon, 18 Nov 2019 12:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0120F6E4E3;
 Mon, 18 Nov 2019 12:53:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19242000-1500050 for multiple; Mon, 18 Nov 2019 12:53:12 +0000
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191118103536.17675-7-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-7-daniel.vetter@ffwll.ch>
Message-ID: <157408159080.24372.5143240685793614691@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 06/15] drm/i915: Drop dma_buf->k(un)map
Date: Mon, 18 Nov 2019 12:53:10 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTExLTE4IDEwOjM1OjI3KQo+IE5vIGluLXRyZWUg
dXNlcnMgbGVmdC4KCkZhaXIgZW5vdWdoIHRoZW4sClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KCj4gQXNpZGUsIEkgdGhpbmsgbW9ja19kbWFidWYg
d291bGQgYmUgYSBuaWNlIGFkZGl0aW9uIHRvIGRybQo+IG1vY2svc2VsZnRlc3QgaGVscGVycyAo
d2UgaGF2ZSBzb21lIGFscmVhZHkpLCB3aXRoIGFuCj4gRVhQT1JUX1NZTUJPTF9GT1JfVEVTVFNf
T05MWS4KCldlJ3ZlIGFsc28gc3RhcnRlZCBvbiBzb21lIGRtYWJ1ZiBzZWxmdGVzdHMsIHNvIG1h
eWJlIHdlIGNhbiBnbyBmdXJ0aGVyCmFuZCBtYWtlIG1vY2sgb2JqZWN0cyBhbmQgRVhQT1JUX1NZ
TUJPTF9GT1JfVEVTVFNfT05MWSBnbG9iYWwuIEFuZCBvZgpjb3Vyc2UsIG1ha2Ugc3VyZSB0aGUg
ZWZmb3J0cyBhbGlnbiB3aXRoIGt1bml0Li4uCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
