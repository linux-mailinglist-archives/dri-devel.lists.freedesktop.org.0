Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB163198
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E2489DEC;
	Tue,  9 Jul 2019 07:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D373289DEC;
 Tue,  9 Jul 2019 07:04:29 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17179194-1500050 for multiple; Tue, 09 Jul 2019 08:04:07 +0100
MIME-Version: 1.0
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190709065800.2354-1-janusz.krzysztofik@linux.intel.com>
References: <20190709065800.2354-1-janusz.krzysztofik@linux.intel.com>
Message-ID: <156265584538.9375.16081841013219935184@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Fix reporting of size of created GEM object
Date: Tue, 09 Jul 2019 08:04:05 +0100
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?utf-8?q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKYW51c3ogS3J6eXN6dG9maWsgKDIwMTktMDctMDkgMDc6NTg6MDApCj4gQ29tbWl0
IGUxNjM0ODRhZmE4ZCAoImRybS9pOTE1OiBVcGRhdGUgc2l6ZSB1cG9uIHJldHVybiBmcm9tCj4g
R0VNX0NSRUFURSIpIChyZSlpbnRyb2R1Y2VkIHJlcG9ydGluZyBvZiBhY3R1YWwgc2l6ZSBvZiBj
cmVhdGVkIEdFTQo+IG9iamVjdHMsIHBvc3NpYmx5IHJvdW5kZWQgdXAgb24gb2JqZWN0IGFsaWdu
bWVudC4gIFVuZm9ydHVuYXRlbHksIGl0cwo+IGltcGxlbWVudGF0aW9uIHJlc3VsdGVkIGluIGEg
cG9zc2libGUgdXNlLWFmdGVyLWZyZWUgYnVnLiAgVGhlIGJ1ZyBoYXMKPiBiZWVuIGZpeGVkIGJ5
IGNvbW1pdCA5MjllZWM5OWY1ZmQgKCJkcm0vaTkxNTogQXZvaWQgdXNlLWFmdGVyLWZyZWUgaW4K
PiByZXBvcnRpbmcgY3JlYXRlLnNpemUiKSBhdCB0aGUgY29zdCBvZiBwb3NzaWJseSBpbmNvcnJl
Y3QgdmFsdWUgYmVpbmcKPiByZXBvcnRlZCBhcyBhY3R1YWwgb2JqZWN0IHNpemUuCj4gCj4gU2Fm
ZWx5IHJlc3RvcmUgY29ycmVjdCByZXBvcnRpbmcgYnkgY2FwdHVyaW5nIGFjdHVhbCBzaXplIG9m
IGNyZWF0ZWQKPiBHRU0gb2JqZWN0IGJlZm9yZSBhIHJlZmVyZW5jZSB0byB0aGUgb2JqZWN0IGlz
IHB1dC4KPiAKPiBGaXhlczogOTI5ZWVjOTlmNWZkICgiZHJtL2k5MTU6IEF2b2lkIHVzZS1hZnRl
ci1mcmVlIGluIHJlcG9ydGluZyBjcmVhdGUuc2l6ZSIpCgpUaGlzIGRvZXNuJ3QgZG8gYW55dGhp
bmcuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
