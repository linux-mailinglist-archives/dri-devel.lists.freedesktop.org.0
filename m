Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186E0D0C64
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEFD6E95D;
	Wed,  9 Oct 2019 10:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50536E95D;
 Wed,  9 Oct 2019 10:15:50 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18775438-1500050 for multiple; Wed, 09 Oct 2019 11:15:44 +0100
MIME-Version: 1.0
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191009100024.23077-1-colin.king@canonical.com>
References: <20191009100024.23077-1-colin.king@canonical.com>
Message-ID: <157061614282.18808.3604540678077210321@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH][next] drm/i915/selftests: fix null pointer dereference on
 pointer data
Date: Wed, 09 Oct 2019 11:15:42 +0100
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

UXVvdGluZyBDb2xpbiBLaW5nICgyMDE5LTEwLTA5IDExOjAwOjI0KQo+IEZyb206IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gSW4gdGhlIGNhc2Ugd2hlcmUg
ZGF0YSBmYWlscyB0byBiZSBhbGxvY2F0ZWQgdGhlIGVycm9yIGV4aXQgcGF0aCBpcwo+IHZpYSBs
YWJlbCAnb3V0JyB3aGVyZSBkYXRhIGlzIGRlcmVmZXJlbmNlZCBpbiBhIGZvci1sb29wLiAgRml4
IHRoaXMKPiBieSBleGl0aW5nIHZpYSB0aGUgbGFiZWwgJ291dF9maWxlJyBpbnN0ZWFkIHRvIGF2
b2lkIHRoZSBudWxsIHBvaW50ZXIKPiBkZXJlZmVyZW5jZS4KPiAKPiBBZGRyZXNzZXMtQ292ZXJp
dHk6ICgiRGVyZWZlcmVuY2UgYWZ0ZXIgbnVsbCBjaGVjayIpCj4gRml4ZXM6IDUwZDE2ZDQ0Y2Nl
NCAoImRybS9pOTE1L3NlbGZ0ZXN0czogRXhlcmNpc2UgY29udGV4dCBzd2l0Y2hpbmcgaW4gcGFy
YWxsZWwiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9u
aWNhbC5jb20+ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
