Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7899C21DE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44AF10EA08;
	Fri,  8 Nov 2024 16:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0uBEpR0F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A185410EA07
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:20:52 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6ea258fe4b6so45052647b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082851; x=1731687651;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xoczasfH3EjGVlSybMjc91OekbCn/q1l859VFPlt17E=;
 b=0uBEpR0FuIlAvP4KNKajv6XI5JU/q5vlCY1aJSFZxVrAHnYC+Ie9adekG2Vg0mnpJz
 Ep0GZ/aZnf0GL/DujZWc/xBHAz2t3mx+qsLoUGJOn4buap5OtmU3zL8P0ijGcv8HJLPX
 hEAFDox6i1cym5x7E5FA0sFtPBDPKTHnxNZdq3+XiN2gciVd0d6qo2oSvFIAl/v1a4Wo
 SYRBCh4hjHMFL/dhMOhvKDIxFmhBUtbLeHBEBdyjVBINqobmW4mNPAgUw5NQ/PlAqNor
 yNu/OJozIYfU/z2AYHy60o3yM0aZ3eoQnCrHR5p0tIAzK7aQxaFZmN2+IRBviHti4mof
 FOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082851; x=1731687651;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xoczasfH3EjGVlSybMjc91OekbCn/q1l859VFPlt17E=;
 b=jaCkv60k6z5WgAmbQFRlhx4XifKGHT1m1bhzHvv3HVUrdTrQ/x29vYjddEResIH4oK
 DE4T2jbNCZWTGTeBUTcjDmmc7yQfX4B3rE16vy99jgxjc1J/YX2ybY4c7UgOeaAffWmV
 7BDPqK13BfJK2+7MUrw7ZxkrX/gw6kDKnThuSzmEE/9PX/Z32Ffm3kERKV8AHo4HwB4T
 CAhssl9zhpiHAQnE9tkJp0ZO8zvmdNyfcMWbFNNp+bZdBGTjz4+6qrwID503+xZMw+hQ
 tIh852gDzhBwQ+fFTg6dKfGaukFGYLUjFAawYWk3OYvQFuQHAZww/mKg/WrRMfG3cTUF
 qbnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR29qJ4RWqTkrzw9AXRdB7R8Hm/ERDm/K2RvFncIzCxHMbtHqn75bI2H0sdwvPfETzPPd5gwd+bGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGnyfD0HeVukfdaEqVCOVfcxck5+cPJKubiIyrgqD1Nwab1Xs/
 WLgLIbyirRIJzyETvqddkN7DDxu1cX4v3jLelU8WPt14dje7EZV1bqP0HI3ZJJbPQLUP3fcs6Q=
 =
X-Google-Smtp-Source: AGHT+IGi0dElEr9qu8fzvtM9cId0LpD1vPVzTDBDvUodGuNk9OVUxqdu5KHHQFxgVeqHmDaBFP7u+PMuDw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:690c:4b13:b0:6ea:decd:84e
 with SMTP id
 00721157ae682-6eadecd0dd3mr590627b3.5.1731082851750; Fri, 08 Nov 2024
 08:20:51 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:34 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-5-tabba@google.com>
Subject: [RFC PATCH v1 04/10] mm/hugetlb-cgroup: convert
 hugetlb_cgroup_css_offline() to work on folios
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

Let's convert hugetlb_cgroup_css_offline() and
hugetlb_cgroup_move_parent() to work on folios. hugepage_activelist
contains folios, not pages.

While at it, rename page_hcg simply to hcg, removing most of the "page"
terminology.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 mm/hugetlb_cgroup.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/mm/hugetlb_cgroup.c b/mm/hugetlb_cgroup.c
index d8d0e665caed..1bdeaf25f640 100644
--- a/mm/hugetlb_cgroup.c
+++ b/mm/hugetlb_cgroup.c
@@ -195,24 +195,23 @@ static void hugetlb_cgroup_css_free(struct cgroup_subsys_state *css)
  * cannot fail.
  */
 static void hugetlb_cgroup_move_parent(int idx, struct hugetlb_cgroup *h_cg,
-				       struct page *page)
+				       struct folio *folio)
 {
 	unsigned int nr_pages;
 	struct page_counter *counter;
-	struct hugetlb_cgroup *page_hcg;
+	struct hugetlb_cgroup *hcg;
 	struct hugetlb_cgroup *parent = parent_hugetlb_cgroup(h_cg);
-	struct folio *folio = page_folio(page);
 
-	page_hcg = hugetlb_cgroup_from_folio(folio);
+	hcg = hugetlb_cgroup_from_folio(folio);
 	/*
 	 * We can have pages in active list without any cgroup
 	 * ie, hugepage with less than 3 pages. We can safely
 	 * ignore those pages.
 	 */
-	if (!page_hcg || page_hcg != h_cg)
+	if (!hcg || hcg != h_cg)
 		goto out;
 
-	nr_pages = compound_nr(page);
+	nr_pages = folio_nr_pages(folio);
 	if (!parent) {
 		parent = root_h_cgroup;
 		/* root has no limit */
@@ -235,13 +234,13 @@ static void hugetlb_cgroup_css_offline(struct cgroup_subsys_state *css)
 {
 	struct hugetlb_cgroup *h_cg = hugetlb_cgroup_from_css(css);
 	struct hstate *h;
-	struct page *page;
+	struct folio *folio;
 
 	do {
 		for_each_hstate(h) {
 			spin_lock_irq(&hugetlb_lock);
-			list_for_each_entry(page, &h->hugepage_activelist, lru)
-				hugetlb_cgroup_move_parent(hstate_index(h), h_cg, page);
+			list_for_each_entry(folio, &h->hugepage_activelist, lru)
+				hugetlb_cgroup_move_parent(hstate_index(h), h_cg, folio);
 
 			spin_unlock_irq(&hugetlb_lock);
 		}
-- 
2.47.0.277.g8800431eea-goog

