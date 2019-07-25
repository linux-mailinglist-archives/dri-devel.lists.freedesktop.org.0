Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0877627C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB556ECEA;
	Fri, 26 Jul 2019 09:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB64B6E773
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:35:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AC08344;
 Thu, 25 Jul 2019 08:35:07 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30E2B3F71A;
 Thu, 25 Jul 2019 08:35:06 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
From: Steven Price <steven.price@arm.com>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
Message-ID: <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
Date: Thu, 25 Jul 2019 16:35:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDcvMjAxOSAxNTo1OSwgU3RldmVuIFByaWNlIHdyb3RlOgpbLi4uXQo+IEl0IHdvdWxk
IGFwcGVhciB0aGF0IGluIHRoZSBmb2xsb3dpbmcgY2FsbCBzZ3Q9PU5VTEw6Cj4+IAlyZXQgPSBz
Z19hbGxvY190YWJsZV9mcm9tX3BhZ2VzKHNndCwgcGFnZXMgKyBwYWdlX29mZnNldCwKPj4gCQkJ
CQlOVU1fRkFVTFRfUEFHRVMsIDAsIFNaXzJNLCBHRlBfS0VSTkVMKTsKPiAKPiBXaGljaCBtZWFu
cyB3ZSd2ZSBlbmRlZCB1cCB3aXRoIGEgQk8gd2l0aCBiby0+c2d0PT1OVUxMLCBiby0+cGFnZXMg
c2V0Cj4gYW5kIGJvLT5pc19oZWFwPXRydWUuIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhpcyBzaG91
bGQgYmUgaW1wb3NzaWJsZS4KPiAKPiBJIGhhdmVuJ3QgeWV0IGZpZ3VyZWQgb3V0IGhvdyB0aGlz
IGhhcHBlbnMgLSBpdCBzZWVtcyB0byBiZSBqdXN0IGJlZm9yZQo+IHRlcm1pbmF0aW9uLCBzbyBp
dCBtaWdodCBiZSBhIHJhY2Ugd2l0aCBjbGVhbnVwPwoKVGhhdCB3YXMgYSByZWQgaGVycmluZyAt
IGl0J3MgcGFydGx5IG15IHRlc3QgY2FzZSBkb2luZyBzb21ldGhpbmcgYSBiaXQKd2VpcmQuIFRo
aXMgY3Jhc2ggaXMgY2F1c2VkIGJ5IGRvaW5nIGFuIG1tYXAgb2YgYSBIRUFQIG9iamVjdCBiZWZv
cmUgYW55CmZhdWx0IGhhcyBvY2N1cnJlZC4KCmRybV9nZW1fc2htZW1fbW1hcCgpIGNhbGxzIGRy
bV9nZW1fc2htZW1fZ2V0X3BhZ2VzKCkgd2hpY2ggd2lsbCBwb3B1bGF0ZQpiby0+YmFzZS5wYWdl
cyAoZXZlbiBpZiBiby0+aXNfaGVhcCkuCgpFaXRoZXIgd2Ugc2hvdWxkIHByZXZlbnQgbWFwcGlu
ZyBvZiBIRUFQIG9iamVjdHMsIG9yIGFsdGVybmF0aXZlbHkKYm8tPmJhc2UucGFnZXMgY291bGQg
YmUgYWxsb2NhdGVkIHVwZnJvbnQgaW5zdGVhZCBvZiBkdXJpbmcgdGhlIGZpcnN0CmZhdWx0LiBN
eSBwcmVmZXJlbmNlIHdvdWxkIGJlIGFsbG9jYXRpbmcgaXQgdXBmcm9udCBiZWNhdXNlIG9wdGlt
aXNpbmcKZm9yIHRoZSBjYXNlIG9mIGEgSEVBUCBCTyB3aGljaCBpc24ndCB1c2VkIHNlZW1zIGEg
Yml0IHdlaXJkLiBBbHRob3VnaAp0aGVyZSdzIHN0aWxsIHRoZSBxdWVzdGlvbiBvZiBleGFjdGx5
IHdoYXQgdGhlIGJlaGF2aW91ciBzaG91bGQgYmUgb2YKYWNjZXNzaW5nIHRocm91Z2ggdGhlIENQ
VSBwYWdlcyB3aGljaCBoYXZlbid0IGJlZW4gYWxsb2NhdGVkIHlldC4KCkFsc28gc2htZW0tPnBh
Z2VzX3VzZV9jb3VudCBuZWVkcyBpbmNyZW1lbnRpbmcgdG8gc3RvcApkcm1fZ2VtX3NobWVtX2dl
dF9wYWdlcygpIHJlcGxhY2luZyBiby0+YmFzZS5wYWdlcy4gSSBoYXZlbid0IHRlc3RlZAp3aGF0
IGhhcHBlbnMgaWYgeW91IG1tYXAgKmFmdGVyKiB0aGUgZmlyc3QgZmF1bHQuCgpTdGV2ZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
