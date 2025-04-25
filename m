Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B0A9C0A1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FECD10E8B9;
	Fri, 25 Apr 2025 08:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bl9rC6Du";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB83A10E8B5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tzxwt+MhqUuWVN/lcqMQkoSkMK2b7PEADKfx26VXtCo=;
 b=bl9rC6DuRx36DNsZ8uAU+2IKugGcFBspXej3wTpxfTYvdrWx+63Sq1ZBDoRVLw+BlzdbxJ
 8pMaAiaeeMbwOLjrZQXJuNmH9ZA0lBaVxlUGBkwTXFJDYr6j0D1Sljf9hvHfUvCt8X8DZE
 VtOi+Qsr3Yh90QYhQPRIXDAD4Y3Hnck=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-T3tsCTQaNr2H5sKs-7VP1w-1; Fri, 25 Apr 2025 04:17:19 -0400
X-MC-Unique: T3tsCTQaNr2H5sKs-7VP1w-1
X-Mimecast-MFC-AGG-ID: T3tsCTQaNr2H5sKs-7VP1w_1745569038
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43947a0919aso14010705e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569038; x=1746173838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tzxwt+MhqUuWVN/lcqMQkoSkMK2b7PEADKfx26VXtCo=;
 b=AKyGigd3NQYZk/OqLSs+GQJMAyv1FGfBt5n7xqKM0tDc7W4J2sMd9OKOCfXwvob8rn
 VJ82RtneIcz5kuvHmsn/dJ17I1SpDnPH8oFO3gtog3ScpJd8en/ODsv3WZRZbc2bn+dh
 JEHl9Z1UP7jE7f25NguW4mVZYo36RuDjLN0CVUX1Pb1NTBxSiCb90z0F8esi0vzzhIbw
 ZsnEKjpUrr6XdFt+ZbYrd0F9XaN89aKLxr5AXBIrbLTaBOPxKT7U/go9HZmXrLDU4PbC
 ah+lh+KwnetW3k4hNG20wp4oBOlQCPm0Y58JTiAt1uKuppDGwMXVNgMQsuhTRqWxUR0O
 tMTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6W+jFtN2PLjPd9DnflDL5oWPjCe+f0UFWQSoVx6byxb7IVNG6g0/Fy6H1pOasZsWSTeQdM32IfTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMMP96v196hhe7lVmwD6JPTyOPTAndd+fpHz0HjDaBr8DZE/Oj
 dvMqkDoYWN+tLx8/TJnJ7443jR092nuCtqVRUZkvTfVirb59rPhqhyvkQavKdeZBlxdcQKpTACV
 mcOcft2KOqi44X/kPumfWUihjAzqRGJhlR5DgZDS6fwjwZYBdnD/Fj/6RwvPDxz7rmOJ0u8Kt2w
 ==
X-Gm-Gg: ASbGncspVtRVxj6cIPEzezeXnqXrrR+kJtsd+aB3SZG6I4mvxSgO0/FtMCRUcLO68ON
 qRlCxu+g9z20SapCcu7NuSrfCAdmhWmHm96tm/FA5eCrDuxJJi5A/Z0tz3nLVcH00ljIZVIObSV
 fl72tjgLanT29aec6Htv0vD8555jNddP8C3iwzIsMnk2aw8wwfqu+a4hM/kedUav1iFw2g1OmKt
 mUGHiBwgrHbdlmHOo6U8uqDQ0w96hs57wLvPtCUQuPQ617XmHDG4mbW2dQKYv1OHqVEiyhuI8ns
 uO8fMIOD8LIP66yHWXCobcQxtBM9s7BRGUn2m6NVF9Unc3PvReOjd0DzXjWkpGdkkYc6rYE=
X-Received: by 2002:a05:600c:190b:b0:440:68db:a013 with SMTP id
 5b1f17b1804b1-440a669e6c4mr9418055e9.25.1745569038274; 
 Fri, 25 Apr 2025 01:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyjFcQvI7K5mz5sl36l2qzWjhPhbqRCrF/SO1EP+wbgtlXIcwScGs89x5MDFtUy4eN+gIvTg==
X-Received: by 2002:a05:600c:190b:b0:440:68db:a013 with SMTP id
 5b1f17b1804b1-440a669e6c4mr9417765e9.25.1745569037869; 
 Fri, 25 Apr 2025 01:17:17 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-440a0692a22sm35772685e9.2.2025.04.25.01.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:17 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 00/11] mm: rewrite pfnmap tracking and remove VM_PAT
Date: Fri, 25 Apr 2025 10:17:04 +0200
Message-ID: <20250425081715.1341199-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oxwXtm0syY85MfLdONHjYzak2JrP_ZaryNnk-3bjr2A_1745569038
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

On top of mm-unstable.

VM_PAT annoyed me too much and wasted too much of my time, let's clean
PAT handling up and remove VM_PAT.

This should sort out various issues with VM_PAT we discovered recently,
and will hopefully make the whole code more stable and easier to maintain.

In essence: we stop letting PAT mode mess with VMAs and instead lift
what to track/untrack to the MM core. We remember per VMA which pfn range
we tracked in a new struct we attach to a VMA (we have space without
exceeding 192 bytes), use a kref to share it among VMAs during
split/mremap/fork, and automatically untrack once the kref drops to 0.

This implies that we'll keep tracking a full pfn range even after partially
unmapping it, until fully unmapping it; but as that case was mostly broken
before, this at least makes it work in a way that is least intrusive to
VMA handling.

Shrinking with mremap() used to work in a hacky way, now we'll similarly
keep the original pfn range tacked even after this form of partial unmap.
Does anybody care about that? Unlikely. If we run into issues, we could
likely handled that (adjust the tracking) when our kref drops to 1 while
freeing a VMA. But it adds more complexity, so avoid that for now.

Briefly tested

There will be some clash with [1], but nothing that cannot be sorted out
easily by moving the functions added to kernel/fork.c to wherever the vma
bits will live.

Briefly tested with some basic /dev/mem test I crafted. I want to convert
them to selftests, but that might or might not require a bit of
more work (e.g., /dev/mem accessibility).

[1] lkml.kernel.org/r/cover.1745528282.git.lorenzo.stoakes@oracle.com

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Pedro Falcato <pfalcato@suse.de>
Cc: Peter Xu <peterx@redhat.com>

David Hildenbrand (11):
  x86/mm/pat: factor out setting cachemode into pgprot_set_cachemode()
  mm: convert track_pfn_insert() to pfnmap_sanitize_pgprot()
  x86/mm/pat: introduce pfnmap_track() and pfnmap_untrack()
  mm/memremap: convert to pfnmap_track() + pfnmap_untrack()
  mm: convert VM_PFNMAP tracking to pfnmap_track() + pfnmap_untrack()
  x86/mm/pat: remove old pfnmap tracking interface
  mm: remove VM_PAT
  x86/mm/pat: remove strict_prot parameter from reserve_pfn_range()
  x86/mm/pat: remove MEMTYPE_*_MATCH
  drm/i915: track_pfn() -> "pfnmap tracking"
  mm/io-mapping: track_pfn() -> "pfnmap tracking"

 arch/x86/mm/pat/memtype.c          | 194 ++++-------------------------
 arch/x86/mm/pat/memtype_interval.c |  44 +------
 drivers/gpu/drm/i915/i915_mm.c     |   4 +-
 include/linux/mm.h                 |   4 +-
 include/linux/mm_inline.h          |   2 +
 include/linux/mm_types.h           |  11 ++
 include/linux/pgtable.h            | 101 ++++++---------
 include/trace/events/mmflags.h     |   4 +-
 kernel/fork.c                      |  54 +++++++-
 mm/huge_memory.c                   |   7 +-
 mm/io-mapping.c                    |   2 +-
 mm/memory.c                        |  85 ++++++++++---
 mm/memremap.c                      |   8 +-
 mm/mremap.c                        |   4 -
 14 files changed, 212 insertions(+), 312 deletions(-)

-- 
2.49.0

