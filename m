Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46461A2F8DD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DD610E600;
	Mon, 10 Feb 2025 19:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Kj5C7+4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F255610E600
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPITbiV5yRtNZIanqm2v+SKlb5hdEoVu/zyhpD+AgeU=;
 b=Kj5C7+4gOljnXmkMZ9pf9VkyB+Rjy/GSwZfvwR5l38ZBnvYiHiYxWL5TxepTwDpiStU5Qo
 3yGh+fgLhYiGDfJGtTgo9+bQ/KWR3VzNo2SeaVHWP+CCzSChoPukvROwhNixLAN43MhhGz
 pqIx8Fd2U+ybbS3qAoNL4ucIzFSCmM8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-6ONMuu1OP0iLw5uPPXzMOA-1; Mon, 10 Feb 2025 14:38:32 -0500
X-MC-Unique: 6ONMuu1OP0iLw5uPPXzMOA-1
X-Mimecast-MFC-AGG-ID: 6ONMuu1OP0iLw5uPPXzMOA
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4394c489babso2565785e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216311; x=1739821111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPITbiV5yRtNZIanqm2v+SKlb5hdEoVu/zyhpD+AgeU=;
 b=rzyeZet+PS6I4berPRqOYfr2xB6dHvaAXlosDc2miFZ3XmvkbNys+KbBcjlT8RQeil
 F6ZyuN9ztNk2uMpl90QvnSohwxxpbb8vtoM5sMXiYh7ONy8Mmda8Ttniay96sqdKpZLw
 GtxZ9UydvSqPlhmIo5uGfRBcpChCAS3GtjjOMj44157bPV8QRFRvmNI9YyfBvDNXmj47
 Wo100f5HsdfNdJEHqevVxEvXjMuXYDZ+o42oDyXPKewDn5aFvDzfUgWs2bosojccdI1J
 4m8iIDqwmFaI5ZJjQJMvs1piPIfNxVargAsPv0pkEnfSieJqPUiaf70PyY+OpXX57FUw
 v/vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu5SVaELtMxIfr5c3Ekz85h9C98EZoWHMIjR/C8HaA52qY/JcYI6G85bCaew1UMRdEiqS/tfCvOxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzd4FMjwNtWRbHLKBZdApHk/UE4Ha2t6oprcTIc421Q02Tv1M2f
 ajEjzsIbQe9i+OzvI0ft3WzyD9IzOflSkD7RAFcPWJWitHWf2b8j9tTd8GU+Xxy19dlRqvD9sX5
 uf5ZJ91nEBN8MS5oTFAY26jcURF4tHdEmPAMIljZWmnl5zyFumorHujhUsvKnMDNQeQ==
X-Gm-Gg: ASbGnctbhxqHyDW29PAyyMQ0ll/V3Qoj7Geb0I1Cosz/XWdiTvN+QOVL5UB7Q2dBLRS
 46/a8anz3ict5iVW+TCB25zwo3dKEUGWN/Iou1xgeymnuxlbO1qs8JpgL2vxuQGewdwQ0/iZgOv
 1KB/oejnnC+yl+bIKHlgoY5UF7ZFxzTWHVbAZtth3m9Mv0rmiVUQ162Uq0JSVUSIAyhWUFnE/Wf
 g+hU4VD6L6re1+v9R5BX+zTvqYf+SQJvp9zkuHnIcksunypvvdSDbdxtBFg6wRUDBeCKyeQdoPF
 T5xMzOFiohXkh6jBFjw/+T/LTagE7Y8Wajm2izCo6y2fVJuUZgUIircz8w/FWTnaIg==
X-Received: by 2002:a05:600c:500d:b0:439:3dc0:29b6 with SMTP id
 5b1f17b1804b1-4393dc02be1mr57220185e9.2.1739216311476; 
 Mon, 10 Feb 2025 11:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbUQzL3Yq1p3VwDR+lxH773I/PQZNBDcgTpUgE2nEJHxULXhio/DNj6yNxLtRtBjWIFSwTIg==
X-Received: by 2002:a05:600c:500d:b0:439:3dc0:29b6 with SMTP id
 5b1f17b1804b1-4393dc02be1mr57220015e9.2.1739216311167; 
 Mon, 10 Feb 2025 11:38:31 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4390d933523sm192523445e9.1.2025.02.10.11.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:29 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 07/17] mm/page_vma_mapped: device-exclusive entries are not
 migration entries
Date: Mon, 10 Feb 2025 20:37:49 +0100
Message-ID: <20250210193801.781278-8-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ONX9T9Fy1ucC80scu9wJ5ubehHWnmm5FTnyabm2CsJo_1739216311
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

It's unclear why they would be considered migration entries; they are
not.

Likely we'll never really trigger that case in practice, because
migration (including folio split) of a folio that has device-exclusive
entries is never started, as we would detect "additional references":
device-exclusive entries adjust the mapcount, but not the refcount.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_vma_mapped.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 81839a9e74f16..32679be22d30c 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -111,8 +111,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 			return false;
 		entry = pte_to_swp_entry(ptent);
 
-		if (!is_migration_entry(entry) &&
-		    !is_device_exclusive_entry(entry))
+		if (!is_migration_entry(entry))
 			return false;
 
 		pfn = swp_offset_pfn(entry);
-- 
2.48.1

