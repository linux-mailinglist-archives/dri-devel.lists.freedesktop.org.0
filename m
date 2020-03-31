Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E176C19915B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 11:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D396E2E0;
	Tue, 31 Mar 2020 09:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B71D6E2E0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 09:19:48 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20749219-1500050 for multiple; Tue, 31 Mar 2020 10:19:38 +0100
MIME-Version: 1.0
In-Reply-To: <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
To: Christian König <ckoenig.leichtzumerken@gmail.com>, andi.shyti@intel.com, dri-devel@lists.freedesktop.org, joonas.lahtinen@linux.intel.com, zbigniew.kempczynski@intel.com
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158564637763.18289.14253372915035553722@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 31 Mar 2020 10:19:37 +0100
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDIwLTAzLTMxIDA5OjU5OjQ1KQo+IEEgbm90IHNv
IGdlbnRsZSBwaW5nLCBzaW5jZSB0aGlzIHByZXR0eSBtdWNoIGJyb2tlIGFsbCBUVE0gYmFzZWQg
ZHJpdmVycy4KPiAKPiBDb3VsZCB3ZSByZXZlcnQgdGhpcyBmb3Igbm93PwoKUGluZz8/PwpodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzU4NTM1Lz9zZXJpZXM9NzQ5ODQm
cmV2PTEKLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
