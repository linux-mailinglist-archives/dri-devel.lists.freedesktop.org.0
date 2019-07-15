Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D561687EA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 13:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28758997C;
	Mon, 15 Jul 2019 11:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17578997C;
 Mon, 15 Jul 2019 11:11:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17309228-1500050 for multiple; Mon, 15 Jul 2019 12:11:03 +0100
MIME-Version: 1.0
To: dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190712080314.21018-1-chris@chris-wilson.co.uk>
References: <20190712080314.21018-1-chris@chris-wilson.co.uk>
Message-ID: <156318906175.9436.15552256380674500303@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 1/2] dma-buf: Expand reservation_list to fill allocation
Date: Mon, 15 Jul 2019 12:11:01 +0100
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
Cc: intel-gfx@lists.freedesktop.org,
 =?utf-8?q?Michel_D=C3=A4nzer?= <michel.daenzer@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDctMTIgMDk6MDM6MTMpCj4gU2luY2Uga21hbGxv
YygpIHdpbGwgcm91bmQgdXAgdGhlIGFsbG9jYXRpb24gdG8gdGhlIG5leHQgc2xhYiBzaXplIG9y
Cj4gcGFnZSwgaXQgd2lsbCBub3JtYWxseSByZXR1cm4gYSBwb2ludGVyIHRvIGEgbWVtb3J5IGJs
b2NrIGJpZ2dlciB0aGFuIHdlCj4gYXNrZWQgZm9yLiBXZSBjYW4gcXVlcnkgZm9yIHRoZSBhY3R1
YWwgc2l6ZSBvZiB0aGUgYWxsb2NhdGVkIGJsb2NrIHVzaW5nCj4ga3NpemUoKSBhbmQgZXhwYW5k
IG91ciB2YXJpYWJsZSBzaXplIHJlc2VydmF0aW9uX2xpc3QgdG8gdGFrZSBhZHZhbnRhZ2UKPiBv
ZiB0aGF0IGV4dHJhIHNwYWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWwuZGFlbnplckBhbWQu
Y29tPgoKUHVzaGVkIHRvIGRybS1taXNjLW5leHQsIHRoYW5rcyBmb3IgdGhlIHJldmlld3MhCgpB
bnlvbmUgZmVlbCBicmF2ZSBlbm91Z2ggZm9yIHRoZSBzZWNvbmQ/IDopCi1DaHJpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
