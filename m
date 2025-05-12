Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D00AB3700
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417D10E3CF;
	Mon, 12 May 2025 12:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZJq+mvy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDF810E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrbmXyUL7HXGUWgagRU2heQ2lgkOZ/iJWMnvv1t5buw=;
 b=ZJq+mvy0ZvefcuZmdyp5+Ui0gRr8WkpSKT50kAy38LViqzN3J1US0nIMFE5yBf7hXilS4C
 s3VP5/PK1/KEG8VtUALrm0QeJ0/fERZUzq8AQ+Pt4p8U1q4TMnjy1J1G4ni+vcMPl+6PPF
 o7O0p2Frt0qt61wBdyzUV8POw72MAJE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-PUL2WvUwPb2Ij2KCrmGS2A-1; Mon, 12 May 2025 08:34:30 -0400
X-MC-Unique: PUL2WvUwPb2Ij2KCrmGS2A-1
X-Mimecast-MFC-AGG-ID: PUL2WvUwPb2Ij2KCrmGS2A_1747053269
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cf44b66f7so24844805e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053269; x=1747658069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrbmXyUL7HXGUWgagRU2heQ2lgkOZ/iJWMnvv1t5buw=;
 b=iz9ri9E9Cevodoci7jGBCC1Sh7Ry/U38XlVQm2Zp39jo7Bs4E6NH3Zg5+CiYtFmXzy
 whhRy+l2lfF5oj0DvRiz8Dt5Hg4Pof+AG/R5yKk1PUcy+UMjJGqi8WAOo541eJpu92OP
 cWgO/mQoBrdWgaI4bab6XexQTXsNrymDJy7tE4WsP1O0RzzsLGuhl9fMODlBvWIiS5gv
 DxKpRISbzCahtW/bvGukwdP2RQkcdvAKMAsMsAZBw90pEmX/GtMnngIvw2brCExN4DpS
 SLfCl6bJIHV6vbyyCjXVffFoSrgBOlb9JQA9WxVrSjiYb6z2gCkNS9x4m97uv8DRgfdm
 Fhrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTyDq0Eoflk+tBGgNHnrZUOsjr64YLcy35eHLVzIWee8B9lAiXkviqGrNSG/P0a0GofWRKwKCp7qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywym8YVwEUtL7N46sp2Q3WTG7JpAFOtWeWXZay9M1YgOxmSFypA
 o4gfncjV0f/b4ENyLmeIcMp30x8SvjKKB8LeqC+Tnoef0l8ojUB7EP89vNTiQEHLA8qJ7sEr8cd
 AneVbeO+uR4OC8xqw94xgP5DpZ7wvzbO3L8z+nA2Yk1P7UXVJXH00DPUFIfjPq8cPXA==
X-Gm-Gg: ASbGnct5vAfCma18PwCQdhgwKpcLXXnXJQtyEdvjvuEcETQZINhphy+aTYDmSle8rz3
 zHgwmQhpYoeqPReXJ0FjmcKWZZqgo+V0dWMwce81GBmXLk8xX/qHWNq//szJ8UBfkLWd+JpLelN
 Ex2DX/L4BM7ij+9hr4gihLoxaJDJJxf1fHT+/l/uEEEm5TFknLrjk6e4bn60omCMT7ks1msVD51
 WsuYV48+5aanOPSPMUARlwF0Rh3xlss9xigzpmF7jlzYYFbAb16zRRNJ+5yAfr36bvUXZeW+FI2
 gOU+ECnZANj+Gb7If/y3yYrsEJMxAvtv/Xh9nBDxq2g/fHOaNWYIC5Bukbt0F285MxzHwupb
X-Received: by 2002:a05:600c:444c:b0:43d:5ec:b2f4 with SMTP id
 5b1f17b1804b1-442d6d3dcc8mr126249975e9.10.1747053269222; 
 Mon, 12 May 2025 05:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7YFyagUZ9y+fevUV3BzP4ffMO+2lnku0MMlhrkvHNYDdbfZ5KLiwSKLyxUHWcSulKlrGmcw==
X-Received: by 2002:a05:600c:444c:b0:43d:5ec:b2f4 with SMTP id
 5b1f17b1804b1-442d6d3dcc8mr126249585e9.10.1747053268821; 
 Mon, 12 May 2025 05:34:28 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442d687adc0sm123327975e9.35.2025.05.12.05.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:28 -0700 (PDT)
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
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 01/11] x86/mm/pat: factor out setting cachemode into
 pgprot_set_cachemode()
Date: Mon, 12 May 2025 14:34:14 +0200
Message-ID: <20250512123424.637989-2-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LDLJ0VnThsBLuh4qGoFh7Z3BPKYOF7nxecfLPB50nFo_1747053269
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

Let's factor it out to make the code easier to grasp. Drop one comment
where it is now rather obvious what is happening.

Use it also in pgprot_writecombine()/pgprot_writethrough() where
clearing the old cachemode might not be required, but given that we are
already doing a function call, no need to care about this
micro-optimization.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 72d8cbc611583..edec5859651d6 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -800,6 +800,12 @@ static inline int range_is_allowed(unsigned long pfn, unsigned long size)
 }
 #endif /* CONFIG_STRICT_DEVMEM */
 
+static inline void pgprot_set_cachemode(pgprot_t *prot, enum page_cache_mode pcm)
+{
+	*prot = __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
+			 cachemode2protval(pcm));
+}
+
 int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
 				unsigned long size, pgprot_t *vma_prot)
 {
@@ -811,8 +817,7 @@ int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
 	if (file->f_flags & O_DSYNC)
 		pcm = _PAGE_CACHE_MODE_UC_MINUS;
 
-	*vma_prot = __pgprot((pgprot_val(*vma_prot) & ~_PAGE_CACHE_MASK) |
-			     cachemode2protval(pcm));
+	pgprot_set_cachemode(vma_prot, pcm);
 	return 1;
 }
 
@@ -880,9 +885,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 				(unsigned long long)paddr,
 				(unsigned long long)(paddr + size - 1),
 				cattr_name(pcm));
-			*vma_prot = __pgprot((pgprot_val(*vma_prot) &
-					     (~_PAGE_CACHE_MASK)) |
-					     cachemode2protval(pcm));
+			pgprot_set_cachemode(vma_prot, pcm);
 		}
 		return 0;
 	}
@@ -907,9 +910,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 		 * We allow returning different type than the one requested in
 		 * non strict case.
 		 */
-		*vma_prot = __pgprot((pgprot_val(*vma_prot) &
-				      (~_PAGE_CACHE_MASK)) |
-				     cachemode2protval(pcm));
+		pgprot_set_cachemode(vma_prot, pcm);
 	}
 
 	if (memtype_kernel_map_sync(paddr, size, pcm) < 0) {
@@ -1060,9 +1061,7 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 			return -EINVAL;
 	}
 
-	*prot = __pgprot((pgprot_val(*prot) & (~_PAGE_CACHE_MASK)) |
-			 cachemode2protval(pcm));
-
+	pgprot_set_cachemode(prot, pcm);
 	return 0;
 }
 
@@ -1073,10 +1072,8 @@ void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
 	if (!pat_enabled())
 		return;
 
-	/* Set prot based on lookup */
 	pcm = lookup_memtype(pfn_t_to_phys(pfn));
-	*prot = __pgprot((pgprot_val(*prot) & (~_PAGE_CACHE_MASK)) |
-			 cachemode2protval(pcm));
+	pgprot_set_cachemode(prot, pcm);
 }
 
 /*
@@ -1115,15 +1112,15 @@ void untrack_pfn_clear(struct vm_area_struct *vma)
 
 pgprot_t pgprot_writecombine(pgprot_t prot)
 {
-	return __pgprot(pgprot_val(prot) |
-				cachemode2protval(_PAGE_CACHE_MODE_WC));
+	pgprot_set_cachemode(&prot, _PAGE_CACHE_MODE_WC);
+	return prot;
 }
 EXPORT_SYMBOL_GPL(pgprot_writecombine);
 
 pgprot_t pgprot_writethrough(pgprot_t prot)
 {
-	return __pgprot(pgprot_val(prot) |
-				cachemode2protval(_PAGE_CACHE_MODE_WT));
+	pgprot_set_cachemode(&prot, _PAGE_CACHE_MODE_WT);
+	return prot;
 }
 EXPORT_SYMBOL_GPL(pgprot_writethrough);
 
-- 
2.49.0

