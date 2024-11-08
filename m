Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2EB9C21DF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB56A10EA02;
	Fri,  8 Nov 2024 16:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BH093nr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F4D10EA07
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:20:55 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-e30d7b4205eso3597240276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082854; x=1731687654;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EuhnD2p0KG553uFJn8sTE5BvDRtJggITHppkxTMLSiU=;
 b=BH093nr7+4IlHwg2+GIskDXJR2aTA8XD5lFOuDCsiGDgMscWtkL9hi0EWN6LpMxyz5
 eH6y4eHIxc4vAeO9bmkOlddV8VjFkB1nszybunJbCdqwyVOCpR7S5cF8XSocsBjvOIY9
 D2fJto9nvCc6UYoOsE3fLpu4a3Og1HMfTH0oSCO26dGjYDH6rvhqoYEshanFPINAa54X
 R9Cia2o24bB6z1JmuLbijGoNbu5ECSNqQWAt6rQOYgB0ZsFdDyGQBpiHvsOrd5RpavE0
 FyuntTAhUPWhJaL+f0BGVX91B1dHAZTXEk5xDkMKtfvfpQ/WYI3KrjDs8U7wO6wEkm/a
 tsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082854; x=1731687654;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EuhnD2p0KG553uFJn8sTE5BvDRtJggITHppkxTMLSiU=;
 b=ZjgowttbRJSGdnvzintcood1MhXU4zRveNYgGGyLHjJMAerijtpyihBGlP2W7IVWZQ
 yt6qCvRcoOc631QkIKr6l8wStbfNwOySN1vV7HVW2LYieTFMISS4enF/m+6lulMQEzJE
 20BNrlAWBf9qcGYJpB9Au2ZjACt57G7Z381zjpo/XpDBQJfhTg3QEYfcIJ59EKYU598W
 EsZESF2IpfY85/9kMLGVfUZ5C7W3cwLwWpmNR8U32SmuSuJopWG17g8OFg8Gq1sI3Xco
 n7g4IDZGIgamH7sVg3k7NnMAC+2CqqmFkfFtpWzZZ1rpfJ79dkiq/Wbuc51PgSWKOHtv
 l/rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDt446J/xWSpkpZMm7+kli9PZuqzje3552FGa/FwT32a3gNRQWkmA+NARhTNkkeVKM+QKmsSMZhnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydUwNvVGmdMgHuRV4kWwLfDHTkth2P8ThU1w79jP5bNTL4yox2
 3e0xtiS/ypMIW+wWKyj20jDIIIaWdyFgAw66VQ6HaFRQCGj2Uxh/7tTCf9GBTKoPUoe6Soj54w=
 =
X-Google-Smtp-Source: AGHT+IESFJvscd0BPH0GhrFsgF5ykZdsLy8VBXsCYVPr2h3JOn3SzzNujpcRbxNhrkNgQoNrxNGAtYBroQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a25:d001:0:b0:e30:d518:30f2 with
 SMTP id
 3f1490d57ef6-e337f8417b3mr2585276.1.1731082854058; Fri, 08 Nov 2024 08:20:54
 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:35 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-6-tabba@google.com>
Subject: [RFC PATCH v1 05/10] mm/hugetlb: use folio->lru int
 demote_free_hugetlb_folios()
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

Let's avoid messing with pages.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 mm/hugetlb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index d58bd815fdf2..a64852280213 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3806,13 +3806,15 @@ static long demote_free_hugetlb_folios(struct hstate *src, struct hstate *dst,
 
 		for (i = 0; i < pages_per_huge_page(src); i += pages_per_huge_page(dst)) {
 			struct page *page = folio_page(folio, i);
+			struct folio *new_folio;
 
 			page->mapping = NULL;
 			clear_compound_head(page);
 			prep_compound_page(page, dst->order);
+			new_folio = page_folio(page);
 
-			init_new_hugetlb_folio(dst, page_folio(page));
-			list_add(&page->lru, &dst_list);
+			init_new_hugetlb_folio(dst, new_folio);
+			list_add(&new_folio->lru, &dst_list);
 		}
 	}
 
-- 
2.47.0.277.g8800431eea-goog

