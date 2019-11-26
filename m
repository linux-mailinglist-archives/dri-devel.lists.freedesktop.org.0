Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7503D109E57
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 13:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93516E0AF;
	Tue, 26 Nov 2019 12:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDF06E0AF;
 Tue, 26 Nov 2019 12:53:03 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19343900-1500050 for multiple; Tue, 26 Nov 2019 12:53:05 +0000
MIME-Version: 1.0
To: Bruce Chang <yu.bruce.chang@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191126125003.zpczouqpyr7njwha@kili.mountain>
References: <20191126125003.zpczouqpyr7njwha@kili.mountain>
Message-ID: <157477277885.15944.15314564966394699342@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH] drm/i915: unmap the correct pointer in
 i915_error_object_create()
Date: Tue, 26 Nov 2019 12:52:58 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW4gQ2FycGVudGVyICgyMDE5LTExLTI2IDEyOjUwOjAzKQo+IFdlIHNob3VsZCBi
ZSB1bm1hcHBpbmcgInBhZ2UiIGluc3RlYWQgb2YgInMiLiAgVGhpcyBjb2RlIG9yaWdpbmFsbHkg
dXNlZAo+IGttYXBfYXRvbWljKCkgYmVmb3JlIGl0IHdhcyBjaGFuZ2VkIHRvIGttYXAoKS4gIFRo
ZSB0d28gbWFwcGluZwo+IGZ1bmN0aW9ucyBhcmUgZGlmZmVyZW50IHdoaWNoIGxlYWRzIHRvIHRo
aXMgY29tbW9uIG1pc3Rha2UuCj4gCj4gRml4ZXM6IDNlNzQ5ZjUxOTllMSAoImRybS9pOTE1OiBB
dm9pZCBhdG9taWMgY29udGV4dCBmb3IgZXJyb3IgY2FwdHVyZSIpCj4gU2lnbmVkLW9mZi1ieTog
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKQ2F1Z2h0IGJ5IGJhZTIx
ZGFjZDdiNyAoImRybS9pOTE1OiBTd2l0Y2gga3VubWFwKCkgdG8gdGFrZSB0aGUgcGFnZSBub3QK
dmFkZHIiKQoKVGhhbmtzIGZvciBzbWF0Y2ghCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
