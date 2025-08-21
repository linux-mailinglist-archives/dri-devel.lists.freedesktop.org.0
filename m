Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B9B30382
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAE010E9E6;
	Thu, 21 Aug 2025 20:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZV+YS5Mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828D010E9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
 b=ZV+YS5MccerI6uY2pqf/7vKplAXlMgD6ISbOe7UToNHf+Pis1Hbm7/0PEJmAxK4QVTKneY
 /SonVCnpG2CQnRZj/aDs3UIU1fxV6K7oi/dIEom4OPfqdNZfdnQtdTrAzceNo8dPO0N2lx
 BHfva8Aq3zEMDeQ+c4MNUSKNksKzMNE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-R0CjZmlwPhCi8N5Og6yC1Q-1; Thu, 21 Aug 2025 16:07:39 -0400
X-MC-Unique: R0CjZmlwPhCi8N5Og6yC1Q-1
X-Mimecast-MFC-AGG-ID: R0CjZmlwPhCi8N5Og6yC1Q_1755806858
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45a256a20fcso8251825e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806858; x=1756411658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
 b=UqbvLATzcXcZUSsKcsIveoGeDEuqz4hnXuNk/nStx5O2WjUnvBF+rRp6L6Q/kiOjKH
 lCNQBr35C9ORcSzDZy0GwMbzVJfgZjhPqwAGR+YXK+NPUfGRhGI7WZVnCshACK/sdsWZ
 GmVwNx8dUyDOdkorcDVA0cW56hypOUZcqklMdhQuX9U1wjtLmaBROR5RKzuaMvPZWibP
 FmZmxH7hrOYWpeHzOQEXJGnaavSn4u+hRHI2nsIvex7OB3nyWTYgEF2h/npCKTa0N8+P
 cqvBpXhU3SLHPJ8+XX9VSaSbwmPjYM5Ebgy3lw/s743EpbusC8rNNW4BIYG9F75b3stA
 frAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvqWbd84BjH73bG0PZncnRBj8gPUoEwL1cP4hBsjXFbM5A5j3WOTrJAQCjrtFIh7LX9GtBOCxyYl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXmIRIrJ7KfSAhV18lxFY4jNyKJOkoIfKOfZV5BXOn9Cqa7fzN
 Dfcc35E5xt3gaNAkpumQSqk6kC4n2nbHhAKVkwndq5PeybiUKvPrKXtCju+NVYpM+jepfLMtSFE
 5sEF1y9XNCP/CvP8roNpIfh5n2wYZ9g9mGiDxdJQ8ExFs9kZiZcxAzvHG/3FGbWhJjugB+g==
X-Gm-Gg: ASbGncstR/gdbHKAJHgrJnPlQTkptELn32NO5bM8FEOtB6AGqHcLTHjbxx0+wUSTqhz
 ca3uA9KcluxwQCZUcHmGxeQ2JdyL+nyfKkWm3PCxZ6R+x+C1I+Z1QbFq2QYnWmA/XrAOrbG/bb2
 Mr1htUAByOTTkRDxvDmzLwJQsunEh++MpPUhJ5JeSzdY/9xQ5o6LH6PQBUzJOsnOGCfiLXPYfY1
 dxa+FPB3auOsiomzFByh4RdXn20RaCmYXHv92p69qnvbuebDbdN8fjO7pTHGA3wg4/5cOdkJMzB
 B37s7x/gaf1OUl/em1yv6k1fmWcQr7qYB5YBuYh6IPfyU6RtvXoOHZ+O7WUFvHPNVch6BCpqOWs
 5ooVZ6GWe5gXQk8TADKkU+g==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id
 5b1f17b1804b1-45b517ca54cmr2646835e9.18.1755806857909; 
 Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlSU80KqPPviGOLp6CI40u/NjPujjG4FLCG6NoakJIlvY80lRDOTTm20w50mEKFuk0YjVSLQ==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id
 5b1f17b1804b1-45b517ca54cmr2646245e9.18.1755806857378; 
 Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b4e87858asm18672185e9.3.2025.08.21.13.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:36 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 11/35] mm: sanity-check maximum folio size in
 folio_set_order()
Date: Thu, 21 Aug 2025 22:06:37 +0200
Message-ID: <20250821200701.1329277-12-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vy-k-1ANOQlySqmDB4olqLqiPv6sp6pivEzmxvzPD7A_1755806858
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

Let's sanity-check in folio_set_order() whether we would be trying to
create a folio with an order that would make it exceed MAX_FOLIO_ORDER.

This will enable the check whenever a folio/compound page is initialized
through prepare_compound_head() / prepare_compound_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/internal.h b/mm/internal.h
index 45b725c3dc030..946ce97036d67 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -755,6 +755,7 @@ static inline void folio_set_order(struct folio *folio, unsigned int order)
 {
 	if (WARN_ON_ONCE(!order || !folio_test_large(folio)))
 		return;
+	VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
 
 	folio->_flags_1 = (folio->_flags_1 & ~0xffUL) | order;
 #ifdef NR_PAGES_IN_LARGE_FOLIO
-- 
2.50.1

