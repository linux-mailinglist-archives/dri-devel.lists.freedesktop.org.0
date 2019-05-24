Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB062A09E
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 23:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CB26E0D9;
	Fri, 24 May 2019 21:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB736E0B3;
 Fri, 24 May 2019 21:45:19 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16674029-1500050 for multiple; Fri, 24 May 2019 22:45:08 +0100
MIME-Version: 1.0
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190524212627.24256-1-colin.king@canonical.com>
References: <20190524212627.24256-1-colin.king@canonical.com>
Message-ID: <155873430650.6190.1054401334708975483@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH][next] drm/i915/gtt: set err to -ENOMEM on memory
 allocation failure
Date: Fri, 24 May 2019 22:45:06 +0100
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDb2xpbiBLaW5nICgyMDE5LTA1LTI0IDIyOjI2OjI3KQo+IEZyb206IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gQ3VycmVudGx5IHdoZW4gdGhl
IGFsbG9jYXRpb24gb2YgcHBndHQtPndvcmsgZmFpbHMgdGhlIGVycm9yIHJldHVybgo+IHBhdGgg
dmlhIGVycl9mcmVlIHJldHVybnMgYW4gdW5pbml0aWFsaXplZCB2YWx1ZSBpbiBlcnIuIEZpeCB0
aGlzCj4gYnkgc2V0dGluZyBlcnIgdG8gdGhlIGFwcHJvcHJpYXRlIGVycm9yIHJldHVybiBvZiAt
RU5PTUVNLgo+IAo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbmluaXRpYWxpemVkIHNjYWxhciB2
YXJpYWJsZSIpCj4gRml4ZXM6IGQzNjIyMDk5Yzc2ZiAoImRybS9pOTE1L2d0dDogQWx3YXlzIGFj
cXVpcmUgc3RydWN0X211dGV4IGZvciBnZW42X3BwZ3R0X2NsZWFudXAiKQo+IFNpZ25lZC1vZmYt
Ynk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpTYXcgdGhhdCBs
YXN0IG5pZ2h0IGJ1dCBnb3QgZGlzdHJhY3RlZCBieSB0aGUgcGFuaWMtb24tYm9vdC4uLgpSZXZp
ZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
