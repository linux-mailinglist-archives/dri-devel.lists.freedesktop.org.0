Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K7QCJ/zlWlTWwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:15:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA07B1582A1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2274E10E613;
	Wed, 18 Feb 2026 17:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WVmIfmlY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C529310E611
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 17:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771434906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42FtUK8DRzgqq7HgnylfgEXKEQfWmOW3Tw8CmlqQgJI=;
 b=WVmIfmlYxcXQW24loQb5+G+jjLHTX/a4A+JfEMNgOABiHarDRBDJPmKijqQQJAIub7+SSX
 nlD9sMxGGey0fEv4JuXWbwtBpWT43qMTU77QtuAnvI9fCYy+4FT5mfhR1PtlW2jaePv/ZB
 UJeAXhfC8MJMxJWufrGq0kZlG2sRSNk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-VdKzp9JaOI6P5zMNcZRXDg-1; Wed, 18 Feb 2026 12:15:03 -0500
X-MC-Unique: VdKzp9JaOI6P5zMNcZRXDg-1
X-Mimecast-MFC-AGG-ID: VdKzp9JaOI6P5zMNcZRXDg_1771434903
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70e610242so14656585a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 09:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771434903; x=1772039703;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=42FtUK8DRzgqq7HgnylfgEXKEQfWmOW3Tw8CmlqQgJI=;
 b=uIcVT0bwq+sERO1vPDHY/eOsRFAmI30eKstxxgf4jrQykbdBp5zMGq3HWmVzEzWi4z
 Rn2A96xNZEm26Y+lCs46HQ8Hx2pnjz1xtgnEAlSxABFDV2BHAYyKv1HSM6Npxt9Q4xPQ
 FZs0wu0G5jVKKxyxbjwbXr6rqaDovmYtsGVJGekP+fUyVnhJtKQcrG5RPmWKRJbreum4
 hmdx+xFB2NuTTV2xAuawKaeA2o6/NtA1krq1LW1lzQWb7dHMg6t//BYhhhgoTzaCyqpY
 wl46TIblmlhX3DdzoQz5DWTMMu8kCXchxgEj4UuHMfSO/hxazE0evmOnqv9m4Y0NCQcb
 kS7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrwNUmMwLJC2CnI5pX4JDgl8VyF6h/ILn8IIjZKd2X154Bldl067mcwBEJgiGWQ0tfWRzwQGqAA9M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPGbvhBtZeE4TCPKhm8VwZAOshpD4GQv5wcUQtU/U3c/DM65QD
 aUmGkgdb+DyauODoa7XZPc6pIsyUtDOf4w8pp/T5T3guUqTy3aGJ4By3Lsh1UAvmmNo5tYB6zBo
 8XvPXIk9WHX1a965ep1ZuihFsqnE1J3tnylM0TwRxv5Nr8d1UIKZ4q1ZsUzGB4PG3qzOLMg==
X-Gm-Gg: AZuq6aKOKNPsj6csMUFAIsI9jEswLNiJ1DRpJds+tLr9Smo3k9R22Zn8sCKwlej8+hW
 ppL6Yeu3gYe4OE+VIVsAqrS7cVZfK2y9BfjYufqpzL1EwvpIIwJY2DwXJvu3nufXj/y+tx79F01
 uIXfd5/9cXTor1FvQghv/eQFizxCvOR11YZJbqC7moo9M5T1ptxN/+VkabK0Q/LDUhYm/zDh2Ye
 IFlSFg0RCA39Zz2MLp4gc1Ja+d+b7ZHibnSMCT8v1bb3v57vQOXPJ+gOe9JPky/5OT8QGFgx8bF
 XOAqG+pUmT1Pr9EPQurlbXbrKkFQwBmOHdiirsA8ifOxB68Ek+kFwYsBbc16ppRdRJxWbBi52Ze
 oebcuIAeqF08FGMD0NCmjUdNYp4DhVehIAzUETa1HeZJj39notV4lhlVkY8MAbpY=
X-Received: by 2002:a05:620a:294b:b0:8ca:2cf9:819c with SMTP id
 af79cd13be357-8cb423c2500mr1979539585a.40.1771434902617; 
 Wed, 18 Feb 2026 09:15:02 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8ca:2cf9:819c with SMTP id
 af79cd13be357-8cb423c2500mr1979531285a.40.1771434901901; 
 Wed, 18 Feb 2026 09:15:01 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net.
 [100.17.19.56]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb3a3e9adesm1523117985a.49.2026.02.18.09.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 09:15:00 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Wed, 18 Feb 2026 12:14:11 -0500
Subject: [PATCH v2 2/3] cma: Provide accessor to cma dmem region
MIME-Version: 1.0
Message-Id: <20260218-dmabuf-heap-cma-dmem-v2-2-b249886fb7b2@redhat.com>
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
X-Mimecast-MFC-PROC-ID: VFbSbXJFehn3nqKy1PWonJ482JEKNGsaPdhOvTuBGOs_1771434903
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
X-Rspamd-Queue-Id: CA07B1582A1
X-Rspamd-Action: no action

From: Maxime Ripard <mripard@kernel.org>

Consumers of the CMA API will have to know which CMA region their device
allocate from in order for them to charge the memory allocation in the
right one.

Let's provide an accessor for that region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 include/linux/cma.h | 9 +++++++++
 mm/cma.c            | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 62d9c1cf632652489ccd9e01bf1370f2b1f3c249..8ece66c35e9e640b98db4b24a9bd118ad07ec082 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -77,4 +77,13 @@ static inline bool cma_validate_zones(struct cma *cma)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma);
+#else /* CONFIG_CGROUP_DMEM */
+static inline struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma)
+{
+	return NULL;
+}
+#endif /* CONFIG_CGROUP_DMEM */
+
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index 78016647d512868cd87bc2c1a52dd2295acaaf01..c8b0de1da3e71bd6b8ab749ab58eb27446a1657e 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -53,6 +53,13 @@ const char *cma_get_name(const struct cma *cma)
 	return cma->name;
 }
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma)
+{
+	return cma->dmem_cgrp_region;
+}
+#endif /* CONFIG_CGROUP_DMEM */
+
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {

-- 
2.52.0

