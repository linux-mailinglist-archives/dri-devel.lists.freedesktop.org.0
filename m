Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAW2AJ3zlWlTWwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:15:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D2C158298
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958F010E60D;
	Wed, 18 Feb 2026 17:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D9OskC0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F4110E60D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771434903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXUqFvDgr/GgZzXRZIRhwXqtA/ygCg24XF2XyoDsQa8=;
 b=D9OskC0og5V3abAZryi0i/Wf0y96F6ocKMhwMvRLWeJhFvUWyacljD24SQRjWmrmaqCz6r
 6U+gvNTrcq5SK8+6qXMpItkEYU0O8tIPCuy3c6JUD9pYmYpIVy+fxCivoCPnEwyDKRIaXC
 G9yEeQx9tb7vXFjHwLdV10PQJlrMFvY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-NHlY6ReRNYetqaGfGRk_hA-1; Wed, 18 Feb 2026 12:15:00 -0500
X-MC-Unique: NHlY6ReRNYetqaGfGRk_hA-1
X-Mimecast-MFC-AGG-ID: NHlY6ReRNYetqaGfGRk_hA_1771434900
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb4817f3c8so10836385a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 09:15:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771434900; x=1772039700;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VXUqFvDgr/GgZzXRZIRhwXqtA/ygCg24XF2XyoDsQa8=;
 b=lzadd+yR2ZwllXmljKMb/mTeEto1HlOj2UN1GDBxw1YBliuADm98ILq7F6u8xyW/Ka
 2PRThl+e9nCdPgjflDt+9tHDB1T4vz39+JKjhtCNuyL7SKGxRhDj5GkD4fj6YZ9Q1IxT
 1BkV1vFlafa8qOxCiR7e2YUbNpS9u02Mwrj+M+E6YIkJ+VcAxFhQi6dZLRZNxRRYLm3B
 nsK9SVaFKVLkDrx48yJ+eekDZSWBQ7kxdEn+tSvwnQxVMIrg09g9gJAblyrsYXViAY3w
 sApb8OcLvfQgcK/oZgHwO1YTIjYceKTvN6mYVuL4MoVyjVqQE6AmOiRIR7dwg78vE6mC
 VzVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrvWpdVOjQM9dKINiz8MC+ZenbAd4ytYR6fckG13ESptiLuyFDzUbvqgD02oNIjQPiryTKCxJXFug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEvaou6WvCG7xgNxBXAAK60RoJYud7WWKwKkkK6Rc2HJ4xROIF
 r63QSO+0DF9Zq3spSemLss1Ka06L0wj6uD5mzIEVifACFJTBq5nH2ItMZ0V1xtZstzfbKoE1+qk
 UlPgrECKBfQ2bm/I3QJchxiH6WK4KYBXfT/DHCZkwBc8D/gDg5YEyPEvvtWvniLTqC1qkdA==
X-Gm-Gg: AZuq6aLdsATOJm7V9Z6/ZXPKSY752zUztdnHBFSeePIg5/NOjRJ31opPCZIh1IRNoPK
 IQcsfNo1s7TRov8ungbMDMJ34XPSsy7RVM4QyaRYW0RgUPfVOWvGQriJkQSJz0iKVOKcnKWioTf
 5hN3d/+5wM+ALaX+E0A84rMx7v8cP949xFhhsU2FN7V5JSVgQa6APOSgZ4otFPjNZ8a8QAbb/gS
 /gZuLOc2SmY97ezjigomeP7gMGxpRiNuNeR6E/PUjVXlkOOy/ncfsl6ZZ9qSoRN/oaYCh38qlBD
 22jti0eb3BjKTtWNIpSN62ntfchhsLXOaHUiR6RWYIAGjHl/iQLLMFd3OjGz/7N2O6QMqbBxPGY
 Jipazvc+w+B2U48RJJtc5wrb2udBrUTcKRNLdP6ItST3hj2OqrwkO0Gpk+SPxF8M=
X-Received: by 2002:a05:620a:7081:b0:8c7:fdc:e871 with SMTP id
 af79cd13be357-8cb408629c4mr2086846285a.34.1771434899669; 
 Wed, 18 Feb 2026 09:14:59 -0800 (PST)
X-Received: by 2002:a05:620a:7081:b0:8c7:fdc:e871 with SMTP id
 af79cd13be357-8cb408629c4mr2086841985a.34.1771434899177; 
 Wed, 18 Feb 2026 09:14:59 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net.
 [100.17.19.56]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89949b3d543sm57039066d6.16.2026.02.18.09.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 09:14:58 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Wed, 18 Feb 2026 12:14:10 -0500
Subject: [PATCH v2 1/3] cma: Register dmem region for each cma region
MIME-Version: 1.0
Message-Id: <20260218-dmabuf-heap-cma-dmem-v2-1-b249886fb7b2@redhat.com>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
 linux-mm@kvack.org, Eric Chanudet <echanude@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9t9AgJnVJtxpkL9IEKVut9dVzWfNCxeUWuhIPFDaLo8_1771434900
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:mripard@redhat.com,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:echanude@redhat.com,m:mripard@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A2D2C158298
X-Rspamd-Action: no action

From: Maxime Ripard <mripard@kernel.org>

Now that the dmem cgroup has been merged, we need to create memory
regions for each allocator devices might allocate DMA memory from.

Since CMA is one of these allocators, we need to create such a region.
CMA can deal with multiple regions though, so we'll need to create a
dmem region per CMA region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 mm/cma.c | 13 ++++++++++++-
 mm/cma.h |  3 +++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/mm/cma.c b/mm/cma.c
index 813e6dc7b0954864c9ef8cf7adc6a2293241de47..78016647d512868cd87bc2c1a52dd2295acaaf01 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -25,6 +25,7 @@
 #include <linux/string_choices.h>
 #include <linux/log2.h>
 #include <linux/cma.h>
+#include <linux/cgroup_dmem.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/kmemleak.h>
@@ -142,6 +143,15 @@ static void __init cma_activate_area(struct cma *cma)
 	int allocrange, r;
 	struct cma_memrange *cmr;
 	unsigned long bitmap_count, count;
+	struct dmem_cgroup_region *region;
+
+	region = dmem_cgroup_register_region(cma_get_size(cma), "cma/%s", cma->name);
+	if (IS_ERR(region))
+		goto out;
+
+#ifdef CONFIG_CGROUP_DMEM
+	cma->dmem_cgrp_region = region;
+#endif
 
 	for (allocrange = 0; allocrange < cma->nranges; allocrange++) {
 		cmr = &cma->ranges[allocrange];
@@ -183,7 +193,8 @@ static void __init cma_activate_area(struct cma *cma)
 cleanup:
 	for (r = 0; r < allocrange; r++)
 		bitmap_free(cma->ranges[r].bitmap);
-
+	dmem_cgroup_unregister_region(region);
+out:
 	/* Expose all pages to the buddy, they are useless for CMA. */
 	if (!test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags)) {
 		for (r = 0; r < allocrange; r++) {
diff --git a/mm/cma.h b/mm/cma.h
index c70180c36559c295d837725e26596cf546cd8b7e..e91bedcb17be8c9e0d31aea1b67c0db36315536d 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -62,6 +62,9 @@ struct cma {
 	unsigned long flags;
 	/* NUMA node (NUMA_NO_NODE if unspecified) */
 	int nid;
+#ifdef CONFIG_CGROUP_DMEM
+	struct dmem_cgroup_region *dmem_cgrp_region;
+#endif
 };
 
 enum cma_flags {

-- 
2.52.0

