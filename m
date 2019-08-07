Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D984E1B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E856B89026;
	Wed,  7 Aug 2019 14:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32C789026;
 Wed,  7 Aug 2019 14:02:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17919253-1500050 for multiple; Wed, 07 Aug 2019 15:02:01 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20190807135405.2036-1-christian.koenig@amd.com>
In-Reply-To: <20190807135405.2036-1-christian.koenig@amd.com>
Message-ID: <156518651926.6198.3556429609794523741@skylake-alporthouse-com>
Subject: Re: [PATCH] dma-buf: make dma_fence structure a bit smaller
Date: Wed, 07 Aug 2019 15:01:59 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTA3IDE0OjU0OjA1KQo+IFRoZSBydWMg
YW5kIGNiX2xpc3QgYXJlIG5ldmVyIHVzZWQgYXQgdGhlIHNhbWUgdGltZS4KPiBUaGlzIHNtYWwg
Y2hhbmdlIGlzIGFjdHVhbGx5IG1ha2luZyB0aGUgc3RydWN0dXJlIDE2JSBzbWFsbGVyLgooVHJp
dmlhbCBwYWlyIG9mIHR5cG9zKQoKWWVzLiBXZSBjbGVhciB0aGUgY2FsbGJhY2sgbGlzdCBvbiBr
cmVmX3B1dCBzbyB0aGF0IGJ5IHRoZSB0aW1lIHdlCnJlbGVhc2UgdGhlIGZlbmNlIGl0IGlzIHVu
dXNlZC4gTm8gb25lIHNob3VsZCBiZSBhZGRpbmcgdG8gdGhlIGNiX2xpc3QKdGhhdCB0aGV5IGRv
bid0IHRoZW1zZWx2ZXMgaG9sZCBhIHJlZmVyZW5jZSBmb3IsIHRoaXMgb25seSBub3cgbWFrZXMg
Zm9yCmEgbXVjaCBtb3JlIHNwZWN0YWN1bGFyIHVzZS1hZnRlci1mcmVlLiA6KQoKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
