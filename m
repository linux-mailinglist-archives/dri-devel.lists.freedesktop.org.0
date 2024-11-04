Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55F19BC153
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 00:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2BF10E102;
	Mon,  4 Nov 2024 23:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="e0rV5TRC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183C410E102
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 23:17:25 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539e66ba398so7184e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 15:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730762243; x=1731367043;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C+C6vlnHeSVvVkAhnAvYZvBc/e3gvFa0iQn0Z/kaiHY=;
 b=e0rV5TRC/9edUZBCul0oul61vsXGeSWhB5CA5l+Dun+Sjx5TOoMCCn4gYCv2gaPWLP
 gxPPTfF7cRU9mQCLG4O5wEj9iEYc1UdvZwJoFUhffOvXlal+2WovbSiuPHM3RUd/SpQf
 MzI3/56YBKfvkMTd1eThkzjpK328HDLFJ5rTpgEnFZtmi46avo4elZ65DM6ZDRmNiMoW
 OfKkWQb920ha5maN1vdCDV+BAIyA4OxRjavLoacHhPi/AsSUDeObcCd5KVwMOhYYRK2G
 Yyxefd27gEBZPdUsVQdAtIUmKN0lU5fns2AhOy6yxxlZpUpUVS0q/4Aq6/oJCjMaIORa
 XBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730762243; x=1731367043;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C+C6vlnHeSVvVkAhnAvYZvBc/e3gvFa0iQn0Z/kaiHY=;
 b=Suai31Xb+b47bd7Fk/1CQ0NfIzMNj2CcUzVJtj98slXuvvR4w0wZCkc47F2S13WsIY
 meyVyg3KRBXs590M/O/jDdkC3E0BopW+NzMAq3JeT0y3znFnltIvnbvGWqsqTNLKnNlW
 zQOHLvJoXJRF7vDgZTi9ZqnGyrMuQlRUSgOgeSdpO8ZuesH+zfGWFszNKlBp2yeGKT2l
 DMoc/rDe/2/L7XwlwjbE9zLQlse1pQjrkAV9LDmOt1TZJ1hJn8I9ZNpi98JrxaDD1PYh
 PLYkYbUlB+Xr5YBOv9dvWBtRR+ht735rk/6iDs/9BMbPpdFWhrVbP3O126zA6/31L2gi
 Lz/g==
X-Gm-Message-State: AOJu0Yw6kd4FRueJ6Sy9HJPI2snyyCHflfniyc7eWPth/8HL9DKXXCP1
 J4thcFcWasgdHPy2N3N5oosOmaFLkEzaPSU/JmUJECf9Rb+7XWG3DPvFz1tnOA==
X-Gm-Gg: ASbGncuTDMzEs0Jhqc3B/5I5v4dyT37RRDNsn/eXwGaervczIXdR5Q4LD7VOCOL0iAw
 i7y0lctBeGngwSVmwKSyvG38wO7lKxXrYbGHjSCZeGc0ocwqv2Bab9Oy3FK54hwbCOeNzoaNrsw
 fU8Mk3MU2YMm9yx7qriumx+qxV+a+B+X4X7T8IbufJUgRBbEyEWyFSkPYK3hWJYnTQ5iNFRr4k8
 lw0Z4eiPrB5kDBy0q94BFkw5Oa1qiWDwQlNxbU=
X-Google-Smtp-Source: AGHT+IFyupNQLfXx+YranHHkRssLrTsWYOFuIQ9H6XVJLdSL/2mvXLDcV6a6ibc+imq0SpyMFPjB4A==
X-Received: by 2002:a19:385c:0:b0:535:3d14:1313 with SMTP id
 2adb3069b0e04-53d78288ecemr164650e87.0.1730762242450; 
 Mon, 04 Nov 2024 15:17:22 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:1b91:d97b:f7c9:2b60])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9aa611sm197561295e9.34.2024.11.04.15.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 15:17:21 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Tue, 05 Nov 2024 00:17:13 +0100
Subject: [PATCH] drm/panthor: Be stricter about IO mapping flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-panthor-flush-page-fixes-v1-1-829aaf37db93@google.com>
X-B4-Tracking: v=1; b=H4sIAPhVKWcC/x2LQQqAIBAAvxJ7TlDxEH0lOmStuRAabkUg/r2l4
 zAzFRgLIcPYVSj4EFNOAqbvYI1L2lHRJgxWW2eMdupc0hVzUeG4OQpJEehFVgGdRN6bYdUg+1n
 wF3JPc2sf9dqM/2oAAAA=
X-Change-ID: 20241104-panthor-flush-page-fixes-fe4202bb18c0
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730762237; l=5906;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Ey3XFB5BJjjdu6VO458bb9nDOZIaqfSG6o++hBGILgU=;
 b=e1AET9ub1rPovwczIXEGiw8ak+NcFCdCvq/kFg8wlwHk3fGxhvKI5uyCuRaRAPvg0uDqRn9is
 2oKkaV0l9iZAwspC9DjDNRDQgflyjOga6roZX1CpGToeKDiAzc2BqoQ
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
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

The current panthor_device_mmap_io() implementation has two issues:

1. For mapping DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET,
   panthor_device_mmap_io() bails if VM_WRITE is set, but does not clear
   VM_MAYWRITE. That means userspace can use mprotect() to make the mapping
   writable later on. This is a classic Linux driver gotcha.
   I don't think this actually has any impact in practice:
   When the GPU is powered, writes to the FLUSH_ID seem to be ignored; and
   when the GPU is not powered, the dummy_latest_flush page provided by the
   driver is deliberately designed to not do any flushes, so the only thing
   writing to the dummy_latest_flush could achieve would be to make *more*
   flushes happen.

2. panthor_device_mmap_io() does not block MAP_PRIVATE mappings (which are
   mappings without the VM_SHARED flag).
   MAP_PRIVATE in combination with VM_MAYWRITE indicates that the VMA has
   copy-on-write semantics, which for VM_PFNMAP are semi-supported but
   fairly cursed.
   In particular, in such a mapping, the driver can only install PTEs
   during mmap() by calling remap_pfn_range() (because remap_pfn_range()
   wants to **store the physical address of the mapped physical memory into
   the vm_pgoff of the VMA**); installing PTEs later on with a fault
   handler (as panthor does) is not supported in private mappings, and so
   if you try to fault in such a mapping, vmf_insert_pfn_prot() splats when
   it hits a BUG() check.

Fix it by clearing the VM_MAYWRITE flag (userspace writing to the FLUSH_ID
doesn't make sense) and requiring VM_SHARED (copy-on-write semantics for
the FLUSH_ID don't make sense).

Reproducers for both scenarios are in the notes of my patch on the mailing
list; I tested that these bugs exist on a Rock 5B machine.

Note that I only compile-tested the patch, I haven't tested it; I don't
have a working kernel build setup for the test machine yet. Please test it
before applying it.

Cc: stable@vger.kernel.org
Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Signed-off-by: Jann Horn <jannh@google.com>
---
First testcase (can write to the FLUSH_ID):

```

  typeof(x) __res = (x);      \
  if (__res == (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

int main(void) {
  int fd = SYSCHK(open(GPU_PATH, O_RDWR));

  // sanity-check that PROT_WRITE+MAP_SHARED fails
  void *mmap_write_res = mmap(NULL, 0x1000, PROT_READ|PROT_WRITE,
      MAP_SHARED, fd, DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET);
  if (mmap_write_res == MAP_FAILED) {
    perror("mmap() with PROT_WRITE+MAP_SHARED failed as expected");
  } else {
    errx(1, "mmap() with PROT_WRITE+MAP_SHARED worked???");
  }

  // make a PROT_READ+MAP_SHARED mapping, and upgrade it to writable
  void *mmio_page = SYSCHK(mmap(NULL, 0x1000, PROT_READ, MAP_SHARED,
      fd, DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET));
  SYSCHK(mprotect(mmio_page, 0x1000, PROT_READ|PROT_WRITE));

  volatile uint32_t *flush_counter = (volatile uint32_t*)mmio_page;

  uint32_t last_old = -1;
  while (1) {
    uint32_t old_val = *flush_counter;
    *flush_counter = 1111;
    uint32_t new_val = *flush_counter;
    if (old_val != last_old)
      printf("flush counter: old=%u, new=%u\n", old_val, new_val);
    last_old = old_val;
  }
}
```

Second testcase (triggers BUG() splat):
```

  typeof(x) __res = (x);      \
  if (__res == (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

int main(void) {
  int fd = SYSCHK(open(GPU_PATH, O_RDWR));

  // make a PROT_READ+**MAP_PRIVATE** mapping
  void *ptr = SYSCHK(mmap(NULL, 0x1000, PROT_READ, MAP_PRIVATE,
      fd, DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET));

  // trigger a read fault
  *(volatile char *)ptr;
}
```

The second testcase splats like this:
```
[ 2918.411814] ------------[ cut here ]------------
[ 2918.411857] kernel BUG at mm/memory.c:2220!
[ 2918.411955] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
[...]
[ 2918.416147] CPU: 3 PID: 2934 Comm: private_user_fl Tainted: G           O       6.1.43-19-rk2312 #428a0a5e6
[ 2918.417043] Hardware name: Radxa ROCK 5B (DT)
[ 2918.417464] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 2918.418119] pc : vmf_insert_pfn_prot+0x40/0xe4
[ 2918.418567] lr : panthor_mmio_vm_fault+0xb0/0x12c [panthor]
[...]
[ 2918.425746] Call trace:
[ 2918.425972]  vmf_insert_pfn_prot+0x40/0xe4
[ 2918.426342]  __do_fault+0x38/0x7c
[ 2918.426648]  __handle_mm_fault+0x404/0x6dc
[ 2918.427018]  handle_mm_fault+0x13c/0x18c
[ 2918.427374]  do_page_fault+0x194/0x33c
[ 2918.427716]  do_translation_fault+0x60/0x7c
[ 2918.428095]  do_mem_abort+0x44/0x90
[ 2918.428410]  el0_da+0x40/0x68
[ 2918.428685]  el0t_64_sync_handler+0x9c/0xf8
[ 2918.429067]  el0t_64_sync+0x174/0x178
```
---
 drivers/gpu/drm/panthor/panthor_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 4082c8f2951dfdace7f73a24d6fe34e9e7f920eb..6fbff516c1c1f047fcb4dee17b87d8263616dc0c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -390,11 +390,15 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
 {
 	u64 offset = (u64)vma->vm_pgoff << PAGE_SHIFT;
 
+	if ((vma->vm_flags & VM_SHARED) == 0)
+		return -EINVAL;
+
 	switch (offset) {
 	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
 		if (vma->vm_end - vma->vm_start != PAGE_SIZE ||
 		    (vma->vm_flags & (VM_WRITE | VM_EXEC)))
 			return -EINVAL;
+		vm_flags_clear(vma, VM_MAYWRITE);
 
 		break;
 

---
base-commit: d78f0ee0406803cda8801fd5201746ccf89e5e4a
change-id: 20241104-panthor-flush-page-fixes-fe4202bb18c0

-- 
Jann Horn <jannh@google.com>

