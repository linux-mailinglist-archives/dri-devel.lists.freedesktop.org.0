Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018649C21D5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95F310E9FD;
	Fri,  8 Nov 2024 16:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kO/MLkZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8610E111
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:20:44 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-37d4854fa0eso1321365f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082843; x=1731687643;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qSNggYYB42ksK77mqLJizRXwTBzrM89QBEMwFFNrJdw=;
 b=kO/MLkZHSuBZhb6JVgmstvzNVHrPKhiYPDMX7LeknjlE9LTpDv/9Xd7kPjRjx25IG6
 V7HZxYG+HRYYy5ef8cJdpR8mK3UYApwuHtoBnPu/dgHWLJLwaTfUQsXVGj8LSNd7JGf8
 TAvUIo7rR8UAE1NTgMUtZFpv7m/+AVlVpDvCehPkKhTeELLvxVzD5m8Wg3NrJIUlJMbZ
 S3rY+KHMnadXH1bWnPrdKRjzav3oLV/eDyTwjLdhcYWGkNT1u4s9Y6QWt3sU/3Ouw2t5
 n31n24OFOjAytcdEUdDH72+b4volWF13X2TLAvYvbXloEvmxBSfQdOYRCsK/DM7Diuzd
 oc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082843; x=1731687643;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qSNggYYB42ksK77mqLJizRXwTBzrM89QBEMwFFNrJdw=;
 b=t5zskL4T8n+O2Wb/YpvLXIWQkhPZWDwDWY49Ed6Cpr1pmNRZxhRWSY47ns2w0QFcUs
 K/RUfxYZPkwE1S3Qqn6tMEzWIlJy56ITmxF5rS61uQJKGFjkvXwsSaFAnxv9EdhLLsnF
 It4kSDGmIJIlaOdCQ/qsILfEeKw3zX4B+xX5psSTEepC3dYglxpGB4ZWrZSBxBIP3J/t
 d1XZ0vCuPlBed4Qyf9xv+pjiFBwSwsWmPF+oOLP/JINz+I/o3Ip7tnLPDXmRzi85LnWS
 le38m7RngYzDGJz/NHDXBZJPBXJ7fLZM90vO5yMth/X3vdDy7TQd4WooVyKIjvjjcito
 lwUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8WTXiftaN081PWOO8PpyMbZxG5SL3Wao8dEfyhdb5MdZXqKH+mKJUCntm/HLZU1b3tQBJ+5UD3xA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywZs1ruznIcLWlRiipG9eEbDzT86EmuafcC9Cne5bYwRYMeL4w
 VgvoEghNe5STNLcoh7VRMDW0gtzl8ZoMqArJ4NRD3H2YylWWAJ9stNW9l6rk+nFVcytAiMxkZQ=
 =
X-Google-Smtp-Source: AGHT+IGNt2ARzTp6h05fXXQEL275e7en0LhPQqztYO3DssrZ2Bpa4ilDg6kO0xlH0JaVTwhHigLo2F9OCQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:adf:e611:0:b0:37d:45dd:dfbf with
 SMTP id
 ffacd0b85a97d-381f18641abmr2475f8f.4.1731082842629; Fri, 08 Nov 2024 08:20:42
 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:30 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-1-tabba@google.com>
Subject: [RFC PATCH v1 00/10] mm: Introduce and use folio_owner_ops
From: Fuad Tabba <tabba@google.com>
To: linux-mm@kvack.org
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, david@redhat.com, rppt@kernel.org, 
 jglisse@redhat.com, akpm@linux-foundation.org, muchun.song@linux.dev, 
 simona@ffwll.ch, airlied@gmail.com, pbonzini@redhat.com, seanjc@google.com, 
 willy@infradead.org, jgg@nvidia.com, jhubbard@nvidia.com, 
 ackerleytng@google.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
 kirill.shutemov@linux.intel.com, quic_eberman@quicinc.com, maz@kernel.org, 
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk, 
 tabba@google.com
Content-Type: text/plain; charset="UTF-8"
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

Some folios, such as hugetlb folios and zone device folios,
require special handling when the folio's reference count reaches
0, before being freed. Moreover, guest_memfd folios will likely
require special handling to notify it once a folio's reference
count reaches 0, to facilitate shared to private folio conversion
[*]. Currently, each usecase has a dedicated callback when the
folio refcount reaches 0 to that effect. Adding yet more
callbacks is not ideal.

This patch series introduces struct folio_owner_ops and uses it
as a generic way to handle callbacks on freeing a folio. It also
applies the callbacks to hugetlb and zone device folios.

A pointer to struct folio_owner_ops is overlaid on struct page
compound_page, struct page/folio lru. To indicate that the folio
uses the callback, this patch series sets bit 1 of the new field,
similar to how bit 0 indicates a compound page.

Patches 1 to 6 rework the hugetlb code to allow us to reuse
folio->lru for the owner ops as long as they are not isolated.

Patches 7 to 10 introduce struct folio_owner_ops, and apply the
callbacks to zone device and hugetlb folios.

Cheers,
/fuad

[*] https://lore.kernel.org/all/CAGtprH_JP2w-4rq02h_Ugvq5KuHX7TUvegOS7xUs_iy5hriE7g@mail.gmail.com/

David Hildenbrand (6):
  mm/hugetlb: rename isolate_hugetlb() to folio_isolate_hugetlb()
  mm/migrate: don't call folio_putback_active_hugetlb() on dst hugetlb
    folio
  mm/hugetlb: rename "folio_putback_active_hugetlb()" to
    "folio_putback_hugetlb()"
  mm/hugetlb-cgroup: convert hugetlb_cgroup_css_offline() to work on
    folios
  mm/hugetlb: use folio->lru int demote_free_hugetlb_folios()
  mm/hugetlb: use separate folio->_hugetlb_list for hugetlb-internals

Fuad Tabba (4):
  mm: Introduce struct folio_owner_ops
  mm: Use getters and setters to access page pgmap
  mm: Use owner_ops on folio_put for zone device pages
  mm: hugetlb: Use owner_ops on folio_put for hugetlb

 drivers/gpu/drm/nouveau/nouveau_dmem.c |   4 +-
 drivers/pci/p2pdma.c                   |   8 +-
 include/linux/hugetlb.h                |  10 +-
 include/linux/memremap.h               |  14 +-
 include/linux/mm_types.h               | 107 ++++++++++++++-
 lib/test_hmm.c                         |   2 +-
 mm/gup.c                               |   2 +-
 mm/hmm.c                               |   2 +-
 mm/hugetlb.c                           | 179 ++++++++++++++++++-------
 mm/hugetlb_cgroup.c                    |  19 ++-
 mm/hugetlb_vmemmap.c                   |   8 +-
 mm/internal.h                          |   1 -
 mm/memory.c                            |   2 +-
 mm/mempolicy.c                         |   2 +-
 mm/memremap.c                          |  49 +------
 mm/migrate.c                           |  20 +--
 mm/migrate_device.c                    |   4 +-
 mm/mm_init.c                           |  48 ++++++-
 mm/swap.c                              |  25 ++--
 19 files changed, 342 insertions(+), 164 deletions(-)


base-commit: beb2622b970047000fa3cae64c23585669b01fca
-- 
2.47.0.277.g8800431eea-goog

