Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9D7B30376
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE9810E9D0;
	Thu, 21 Aug 2025 20:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YjT7EvFr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C987710E9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
 b=YjT7EvFrJT5scdeM5Zhxs1Qk/Cqch+J+8hIxWxlHb7nVNU02myxpnBeJveCAmU84L9yDad
 vtsRlwxqXN6zx8RcnWcVFKhynJbqTs2VIm3xSpDL2hddvTFVyKK/czblWXG8Igw2XVihhk
 Fb0YTZpxr5lzYg/3oduk7oOlhbYva1I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-4pvOZhm3M--sxXRRXus8AA-1; Thu, 21 Aug 2025 16:07:28 -0400
X-MC-Unique: 4pvOZhm3M--sxXRRXus8AA-1
X-Mimecast-MFC-AGG-ID: 4pvOZhm3M--sxXRRXus8AA_1755806847
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b4d6f3ab0so8376815e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806847; x=1756411647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
 b=jSpcDQNyJTd42cJM7UBZfErsH+OTjoICZOElaYQQKV/4lIVkJTFm25gmCgL0MpzJ4A
 O06qWOh96p/bmdWwaCpWoOF6Iq9KAIrORCvbqsvO3hABDO02LK4GC4F8Yb7Hc3A6RDQg
 x3DRnc4htUwmadkVQNcf7W0OpE5SwtT6uOI9bWs0tPv+UVr+E7/gFXvhdaTmgXc0VQOQ
 c7V/WQOpAmE/8VCXFhSZUIpFVI7C0O1W5JND3nO04mLsdBADhra2FtGgbXgod6gMWlP/
 GVQ0SR99jqJT2wTJP/Ji7Abby/S6VbT3P9NF8PubskIH5zn79Ed6nX3Rq1YkSZH8vyA7
 jvyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDuDARfDKu6V9wovx9Y1pTQlFBnBdUZ/nw6ULRjKWKLGUCX81U9SNAm0OPv/iemAx9SQCEhW9M5Dw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPjVtcnGtugp9dpJv99PzjWgsdwR1nrJ0Eo8rTIr2WXbsCYz3A
 9xyCVwXTwCa8gQCnBd7BaTa3QsBZnaLRCina4rsep0GwlVU3Z4lNkiXZmskRZmkqZhaA8b+NkR4
 wndvsWc6eRpolDCE8s2dwLHCybbdutTpj3N4fmlUvlSLt1kGMRAoz8NgQK82uWjQukC26sQ==
X-Gm-Gg: ASbGncsaDWC1z8i9DE3jTyYRIkPF4kUhdB25PWvEMXb9fwCxrzjL3Dg4RlyeHdsp8BU
 imTWHF1RyzgKAClOp0I1c/UlA9nWPH3b60RPEJOK5Wmj4OqYW/TynOClJONDFCbvum8ffYt6PRn
 d/hl0Kwvf6zEpt3wdXa7ap3vNPyb7sFlOx3gJmyyBLkzma2s6xCsgO++qTmJdpypruvFpSGXl3a
 G1xZutI2nFGG+K9f9E+FDsVQ/qBZ/sfLO9MJAC8g95LTr5UOUuLkG8Cx3KrN1jM/CoT24jCkBsd
 EgZGFVNENmzc6rY97BzbTOYgkzL7CwHCd1/6n+N/gienF1lWxv5GKGw1O98mhdsEcWpvm8Qkrwh
 hin078wrH2jF86Hf7HtLljA==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id
 5b1f17b1804b1-45b517d26d4mr2922225e9.26.1755806847223; 
 Thu, 21 Aug 2025 13:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUeapMM5JkcwJNJXC+LM6ICHu4lGUEF2ir46AAuHXhYXAFzTcPIdec/q/lplZD/isU7mGEgg==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id
 5b1f17b1804b1-45b517d26d4mr2921795e9.26.1755806846742; 
 Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50d62991sm9535385e9.0.2025.08.21.13.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
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
Subject: [PATCH RFC 07/35] mm/memremap: reject unreasonable folio/compound
 page sizes in memremap_pages()
Date: Thu, 21 Aug 2025 22:06:33 +0200
Message-ID: <20250821200701.1329277-8-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r8-pcIzPlF1Y8pehyFD5hTzkydeHvKD5z2K3cZV0dnQ_1755806847
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

Let's reject unreasonable folio sizes early, where we can still fail.
We'll add sanity checks to prepare_compound_head/prepare_compound_page
next.

Is there a way to configure a system such that unreasonable folio sizes
would be possible? It would already be rather questionable.

If so, we'd probably want to bail out earlier, where we can avoid a
WARN and just report a proper error message that indicates where
something went wrong such that we messed up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memremap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/memremap.c b/mm/memremap.c
index b0ce0d8254bd8..a2d4bb88f64b6 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -275,6 +275,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	if (WARN_ONCE(!nr_range, "nr_range must be specified\n"))
 		return ERR_PTR(-EINVAL);
+	if (WARN_ONCE(pgmap->vmemmap_shift > MAX_FOLIO_ORDER,
+		      "requested folio size unsupported\n"))
+		return ERR_PTR(-EINVAL);
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
-- 
2.50.1

