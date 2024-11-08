Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC59C21DA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFB010E9FF;
	Fri,  8 Nov 2024 16:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GAZOyzaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CBD10EA00
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:20:48 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-43163a40ee0so16031765e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082847; x=1731687647;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YSD3xsyZZCSV87kyUY/RPMIHEZzslYpSJkMBD8vjd+E=;
 b=GAZOyzaAR2Chq/jXFOq31u6nckJTUo6BWJgz7tH15e6C3YQwvv49KF4MmrMzXA4PM0
 RES/rXvpxA4FINJsqjutg24/fRcOyXUV4uZFakm/QX9VR/5eDdcWdppreTexPNlIZJT8
 lOs0G67CWpDri6gRPyRSKudywlzRPHkRQCLhRhgHcb2+6LHLTrAcFlM1Uqmuq1xDYaG2
 mc1E2WwmeSyW4PSpFBumCcvGouzExZ/YAFZLC5qQ1jmYfuctTy280j3J37MbBqDWPxON
 dfQF54vDTQpJVwwJ0Ll5mgPkV1yhFVDMtp0Om2kvwe6BL9JJX+CWTmd1soCUVmXO2IZ6
 mzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082847; x=1731687647;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YSD3xsyZZCSV87kyUY/RPMIHEZzslYpSJkMBD8vjd+E=;
 b=ehJfNrM1SZinJvuYMW1vBomPYd86BdHzs/iGor7SXG9XscX6Oez1HH/Pf1wPI1VV2f
 K/rWUYvydTKvxa0B2XrQCIQ7BLB/klwSVjqFnyJHjJAqgqVGGnetqP+/Pk72NOl4Xx2X
 XnjgF1HAOD50QQwUk8NgthYSsFZA9ADCdkvqH79TGO4CapJpMrfWyhS8P5qv63eQv66q
 3jyrpEkZ+5dyaKH/BCshjEbL6f7TfqcITVJdbtqW1z6QjOUUSVPbQowOWoVwZMt6Ypd1
 U/axLQaapXsWDxYhIErIzt92xb1D4rKUgsyHf3UXVXbgcdJOG6Ar9WJ6yM2qrt0XkKFG
 zFoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvwRuDJ5pz41nS/lQzUED+V5zoP0XoltcYODFSICGkpvxUhdhcCcze/zZOw0Yy4ON+yadjZdDyazo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbXXG7wcN+nsSXlcSFt3rPtsNyJicW3yP69XqmGNPYZbNMTqgn
 LlPc1Yw82KY5npNYGGputFyJFXrq9TXPq7aiwQM8VHYmduyv4TsHg6G0P5qan3PYdpCxIm5Wxw=
 =
X-Google-Smtp-Source: AGHT+IFgJCvqHUnZF2sVggmAky7vOXqPzIu1h0GscO2JqqplWhQ8XkVaucC9oHlByVAHMi0UBju5RAkHJw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:600c:6a84:b0:42c:a8b5:c26
 with SMTP id
 5b1f17b1804b1-432b74fc1e5mr108415e9.2.1731082847148; Fri, 08 Nov 2024
 08:20:47 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:32 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-3-tabba@google.com>
Subject: [RFC PATCH v1 02/10] mm/migrate: don't call
 folio_putback_active_hugetlb() on dst hugetlb folio
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

From: David Hildenbrand <david@redhat.com>

We replaced a simple put_page() by a putback_active_hugepage() call in
commit 3aaa76e125c1 (" mm: migrate: hugetlb: putback destination hugepage
to active list"), to set the "active" flag on the dst hugetlb folio.

Nowadays, we decoupled the "active" list from the flag, by calling the
flag "migratable".

Calling "putback" on something that wasn't allocated is weird and not
future proof, especially if we might reach that path when migration failed
and we just want to free the freshly allocated hugetlb folio.

Let's simply set the "migratable" flag in move_hugetlb_state(), where we
know that allocation succeeded, and use simple folio_put() to return
our reference.

Do we need the hugetlb_lock for setting that flag? Staring at other
users of folio_set_hugetlb_migratable(), it does not look like it. After
all, the dst folio should already be on the active list, and we are not
modifying that list.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 mm/hugetlb.c | 5 +++++
 mm/migrate.c | 8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index e17bb2847572..da3fe1840ab8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7508,6 +7508,11 @@ void move_hugetlb_state(struct folio *old_folio, struct folio *new_folio, int re
 		}
 		spin_unlock_irq(&hugetlb_lock);
 	}
+	/*
+	 * Our old folio is isolated and has "migratable" cleared until it
+	 * is putback. As migration succeeded, set the new folio "migratable".
+	 */
+	folio_set_hugetlb_migratable(new_folio);
 }
 
 static void hugetlb_unshare_pmds(struct vm_area_struct *vma,
diff --git a/mm/migrate.c b/mm/migrate.c
index 55585b5f57ec..b129dc41c140 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1547,14 +1547,14 @@ static int unmap_and_move_huge_page(new_folio_t get_new_folio,
 		list_move_tail(&src->lru, ret);
 
 	/*
-	 * If migration was not successful and there's a freeing callback, use
-	 * it.  Otherwise, put_page() will drop the reference grabbed during
-	 * isolation.
+	 * If migration was not successful and there's a freeing callback,
+	 * return the folio to that special allocator. Otherwise, simply drop
+	 * our additional reference.
 	 */
 	if (put_new_folio)
 		put_new_folio(dst, private);
 	else
-		folio_putback_active_hugetlb(dst);
+		folio_put(dst);
 
 	return rc;
 }
-- 
2.47.0.277.g8800431eea-goog

