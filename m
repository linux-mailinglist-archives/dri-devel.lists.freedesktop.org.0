Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C10B108B47
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 11:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5326E10B;
	Mon, 25 Nov 2019 10:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891EC6E0D6;
 Mon, 25 Nov 2019 10:00:05 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19326971-1500050 for multiple; Mon, 25 Nov 2019 09:59:42 +0000
MIME-Version: 1.0
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191122205734.15925-4-niranjana.vishwanathapura@intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-4-niranjana.vishwanathapura@intel.com>
Message-ID: <157467597709.2314.3239893018411484277@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [RFC 03/13] drm/i915/svm: Runtime (RT) allocator
 support
Date: Mon, 25 Nov 2019 09:59:37 +0000
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
Cc: sanjay.k.kumar@intel.com, dri-devel@lists.freedesktop.org,
 dave.hansen@intel.com, jglisse@redhat.com, jgg@mellanox.com,
 daniel.vetter@intel.com, dan.j.williams@intel.com, ira.weiny@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhICgyMDE5LTExLTIyIDIwOjU3OjI0KQo+
IFNoYXJlZCBWaXJ0dWFsIE1lbW9yeSAoU1ZNKSBydW50aW1lIGFsbG9jYXRvciBzdXBwb3J0IGFs
bG93cwo+IGJpbmRpbmcgYSBzaGFyZWQgdmlydHVhbCBhZGRyZXNzIHRvIGEgYnVmZmVyIG9iamVj
dCAoQk8pIGluIHRoZQo+IGRldmljZSBwYWdlIHRhYmxlIHRocm91Z2ggYW4gaW9jdGwgY2FsbC4K
ClRoZSBpb2N0bCB0aG91Z2ggaXMgbm90IHN2bSBzcGVjaWZpYywgaXQgaXMgdG8gZG8gd2l0aCAi
YnVsayByZXNpZGVuY3kiCmFuZCBjYW4gYmUgdXNlZCB0byByZWR1Y2UgZXhlY2J1ZiB0cmFmZmlj
IHRvIHByb3ZpZGUgdmlydHVhbCBhZGRyZXNzCmxheW91dCBjb250cm9scyB0byBlLmcuIFZ1bGth
biBjbGllbnRzLgoKSTkxNV9WTV9CSU5EIHsKCXVpbnQzMl90IHZtX2lkOwoJaW50MzJfdCBmZDsg
Lyogb3IgLTEgZm9yIGFub24sIG9yIGJ1ZiBkZXBlbmRpbmcgb24gZmxhZ3MgKi8KCXVpbnQ2NF90
IGZsYWdzOwoJdWludDY0X3Qgb2Zmc2V0OyAvKiBvZmZzZXQgaW5mbyBmZCBbcGFnZSBhbGlnbmVk
XSAqLwoJdWludDY0X3QgbGVuZ3RoOyAvKiBwYWdlIGFsaWduZWQgKi8KCXVpbnQ2NF90IGlvdmE7
IC8qIHBhZ2UgYWxpZ25lZCAqLwoJdWludDY0X3QgZXh0ZW5zaW9uczsKfTsgLyogd2hlcmUgcGFn
ZSBhbGlnbmVkIGlzIGFjdHVhbGx5IG1vcmUgSTkxNV9HVFRfUEFHRV9BTElHTk1FTlQgKi8KCmFz
IEkgcmVjYWxsLiBJIGFsc28gcmVjYWxsIGl0IGJlaW5nIHBhcnQgb2YgYSBmdXR1cmUgY29tbWFu
ZCBzdHJlYW0KaW50ZXJmYWNlIHRvIHJlZHVjZSBpb2N0bHMsIGJ1dCB0aGF0IGlzIGFub3RoZXIg
c3RvcnkuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
