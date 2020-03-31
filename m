Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AD9199184
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 11:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BC16E2E6;
	Tue, 31 Mar 2020 09:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2916E2E6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 09:20:19 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20749239-1500050 for multiple; Tue, 31 Mar 2020 10:20:14 +0100
MIME-Version: 1.0
In-Reply-To: <20200331091618.GM2363188@phenom.ffwll.local>
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
 <20200331091618.GM2363188@phenom.ffwll.local>
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
To: Christian König <ckoenig.leichtzumerken@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158564641293.18289.1145145659054294433@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 31 Mar 2020 10:20:12 +0100
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
Cc: andi.shyti@intel.com, dri-devel@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDIwLTAzLTMxIDEwOjE2OjE4KQo+IE9uIFR1ZSwgTWFy
IDMxLCAyMDIwIGF0IDEwOjU5OjQ1QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4g
PiBBIG5vdCBzbyBnZW50bGUgcGluZywgc2luY2UgdGhpcyBwcmV0dHkgbXVjaCBicm9rZSBhbGwg
VFRNIGJhc2VkIGRyaXZlcnMuCj4gPiAKPiA+IENvdWxkIHdlIHJldmVydCB0aGlzIGZvciBub3c/
Cj4gCj4gQWx3YXlzIGFjayBmb3IgcmV2ZXJ0Lgo+IAo+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKU28geW91IGRpZG4ndCBjaGVjayB0aGUgZWFybGll
ciBwYXRjaCBlaXRoZXI/Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
