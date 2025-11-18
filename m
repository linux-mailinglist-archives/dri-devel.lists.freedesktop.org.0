Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAFDC69690
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 13:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3E210E496;
	Tue, 18 Nov 2025 12:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzuSylW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5CB10E496;
 Tue, 18 Nov 2025 12:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763469358; x=1795005358;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=cgK1lh13jH1Mgh11EtlfsZr0bCDmgqNorXaMJ/LoVDo=;
 b=BzuSylW2ptsvA58rXeQaUacN7PJI9F3nrnDI30pJFmN6D9zzz5A5kfXD
 S/m7hPH+H1AwWP3UvEUkHEOETV7/LliesHZsZqmlLUJWUYDNlgs17zl2G
 wcVi2PC7XRhNV07k0ko3rYKl6j6twBxg0De6TOI6F2ePoEv3zCq6+pQDn
 rlYqOkGbCX6G7BZL3LinvxfA4jZzijIGbKUfngmPJJDHKgotBMX67J6mr
 ZfwUUjOuSk53jGiyTyzOlsXGloVGKxLcHgeleHs9kRy5LVy/74GkmGhHd
 G0cNnNvyuB1KAHNWZgMBR3TTxqJtYk2bReD4KjP8wCGH1jF7Rag1VqXHV Q==;
X-CSE-ConnectionGUID: R6G40xXhR3yrgk2URyermg==
X-CSE-MsgGUID: CiBw4bCLQ6K6cvbHtajUBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65647740"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208,223";a="65647740"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 04:35:57 -0800
X-CSE-ConnectionGUID: OHFXb+m3SNSmkWP9XuQtug==
X-CSE-MsgGUID: WVlucfOdS12qvEEOolxMpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
 d="scan'208,223";a="195879322"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 04:35:55 -0800
Date: Tue, 18 Nov 2025 13:35:53 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
Subject: [REGRESSION][RFC] memleak on xe load & unload on PTL
Message-ID: <c1245e1a-2856-83e6-69ed-1ddead4ad3d0@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="8323329-2050227086-1763469356=:4175455"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2050227086-1763469356=:4175455
Content-Type: text/plain; format=flowed; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

Hi,

just hit memory leak on xe module load & unload:

unreferenced object 0xffff88811b047d10 (size 16):
   comm "modprobe", pid 1058, jiffies 4297578480
   hex dump (first 16 bytes):
     00 6b 4b 2d 81 88 ff ff 80 7e 4b 2d 81 88 ff ff  .kK-.....~K-....
   backtrace (crc 4f169eaf):
     kmemleak_alloc+0x4a/0x90
     __kmalloc_cache_noprof+0x488/0x800
     drm_buddy_init+0xc2/0x330 [drm_buddy]
     __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
     xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
     xe_device_probe+0x326/0x9e0 [xe]
     xe_pci_probe+0x39a/0x610 [xe]
     local_pci_probe+0x47/0xb0
     pci_device_probe+0xf3/0x260
     really_probe+0xf1/0x3c0
     __driver_probe_device+0x8c/0x180
     driver_probe_device+0x24/0xd0
     __driver_attach+0x10f/0x220
     bus_for_each_dev+0x7f/0xe0
     driver_attach+0x1e/0x30
     bus_add_driver+0x151/0x290

Issue was reproduced on PTL & BMG, booted with latest kernel from
drm-tip. Looks like fault was introduced in commit d4cd665c9
("drm/buddy: Separate clear and dirty free block trees"), since reverting it
makes the leak disappear. Also attached RFC patch, which at first
glance could fix the issue.

Added xe maintainers and the author to Cc.

BR,
Micha³

--8323329-2050227086-1763469356=:4175455
Content-Type: text/x-diff; name=0001-drm-buddy-release-free_trees-array-on-buddy-mm-teard.patch
Content-Transfer-Encoding: BASE64
Content-ID: <23984ebe-d629-33fd-8c62-bd8d0378bb8a@intel.com>
Content-Description: rfc.patch
Content-Disposition: attachment; filename=0001-drm-buddy-release-free_trees-array-on-buddy-mm-teard.patch

RnJvbSA5MTRhYTUzYzE4YTg4ODM0MzEwYjg1NjAzMjNiNjNiYWU5OGZiMjlk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogPT9VVEYtOD9xP01p
Y2hhPUM1PTgyPTIwR3J6ZWxhaz89IDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5j
b20+DQpEYXRlOiBUdWUsIDE4IE5vdiAyMDI1IDExOjM0OjExICswMTAwDQpT
dWJqZWN0OiBbUEFUQ0hdIGRybS9idWRkeTogcmVsZWFzZSBmcmVlX3RyZWVz
IGFycmF5IG9uIGJ1ZGR5IG1tIHRlYXJkb3duDQpNSU1FLVZlcnNpb246IDEu
MA0KQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04DQpD
b250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0DQpPcmdhbml6YXRpb246
IEludGVsIFRlY2hub2xvZ3kgUG9sYW5kIHNwLiB6IG8uby4gLSB1bC4gU2xv
d2Fja2llZ28gMTczLCA4MC0yOTggR2RhbnNrIC0gS1JTIDEwMTg4MiAtIE5J
UCA5NTctMDctNTItMzE2DQoNCkR1cmluZyBpbml0aWFsaXphdGlvbiBvZiBE
Uk0gYnVkZHkgbWVtb3J5IG1hbmFnZXIgYXQgZHJtX2J1ZGR5X2luaXQsDQpt
bS0+ZnJlZV90cmVlcyBhcnJheSBpcyBhbGxvY2F0ZWQgZm9yIGJvdGggY2xl
YXIgYW5kIGRpcnR5IFJCIHRyZWVzLg0KRHVyaW5nIGNsZWFudXAgaGFwcGVu
aW5nIGF0IGRybV9idWRkeV9maW5pIGl0IGlzIG5ldmVyIGZyZWVkLCBsZWFk
aW5nIHRvDQptZW1vcnkgbGVha3Mgb2JzZXJ2ZWQgb24geGUgbW9kdWxlIGxv
YWQgJiB1bmxvYWQgY3ljbGVzLg0KDQpEZWFsbG9jYXRlIGFycmF5IGZvciBm
cmVlIHRyZWVzIHdoZW4gY2xlYW5pbmcgdXAgYnVkZHkgbWVtb3J5IG1hbmFn
ZXIuDQoNCkZpeGVzOiBkNGNkNjY1YyAoImRybS9idWRkeTogU2VwYXJhdGUg
Y2xlYXIgYW5kIGRpcnR5IGZyZWUgYmxvY2sgdHJlZXMiKQ0KU2lnbmVkLW9m
Zi1ieTogTWljaGHFgiBHcnplbGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5j
b20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5LmMgfCAxICsN
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVkZHkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYnVkZHkuYw0KaW5kZXggMmYyNzliNDZiZDJjLi44MzA4MTE2
MDU4Y2MgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVkZHkuYw0KQEAgLTQy
MCw2ICs0MjAsNyBAQCB2b2lkIGRybV9idWRkeV9maW5pKHN0cnVjdCBkcm1f
YnVkZHkgKm1tKQ0KIA0KIAlmb3JfZWFjaF9mcmVlX3RyZWUoaSkNCiAJCWtm
cmVlKG1tLT5mcmVlX3RyZWVzW2ldKTsNCisJa2ZyZWUobW0tPmZyZWVfdHJl
ZXMpOw0KIAlrZnJlZShtbS0+cm9vdHMpOw0KIH0NCiBFWFBPUlRfU1lNQk9M
KGRybV9idWRkeV9maW5pKTsNCi0tIA0KMi40NS4yDQoNCg==

--8323329-2050227086-1763469356=:4175455--
