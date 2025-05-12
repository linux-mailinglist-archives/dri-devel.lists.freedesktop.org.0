Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C2AB3714
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7554110E3EB;
	Mon, 12 May 2025 12:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DF345QOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BEC10E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B7NNc3thH4gIlgL655OdyQ8soQ2dq/lJKbobAXK9pSA=;
 b=DF345QOSoEutb12HvR7TPpr6rTE9fjeSupoD+MyGhHkliOtUCLLYZmuXu0rJKR9xO3/DjT
 jRVNj5xwWopfF0pOnhzQxGpJUL8yZxQ9uN/h+ZO83MzGIvvjiN8FBybvPO83bPxC7zFUAe
 AYSWlr7l2XyaKmUzPPADzK0bD2N9+Rk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-GKh7prrjNPWSr1ELNVMnNw-1; Mon, 12 May 2025 08:34:52 -0400
X-MC-Unique: GKh7prrjNPWSr1ELNVMnNw-1
X-Mimecast-MFC-AGG-ID: GKh7prrjNPWSr1ELNVMnNw_1747053291
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ce8f82e66so22553095e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053291; x=1747658091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7NNc3thH4gIlgL655OdyQ8soQ2dq/lJKbobAXK9pSA=;
 b=hrpnqIuxzLi5d2W5a0GVb+4NJ4y3bAH5kbC/eA+gF+35rk/knYFcypB+YQtRnGEFwU
 aPiq0HhpGQkXQmo8hcmc5Ji9MtQxFn34MrTWI5t1c5S1gHksQ2ljlPHZdEWHTxmLRcLV
 vIu/xSsIMNfLKyplq9Q8lIuWdp9CsI6yTGSVZYqbcOHVefj3DNqO9wHsaAsH/ZEH3pth
 B1MDS/LcwOoHwa8JDHjbhZCt+8v4HQH+Jx5TGfU6nsVvWCypHwZ4wkgtO7EvYWT3Sd37
 6w8rPqyhff1veUlIEFxgQgvfk3eTJQYOZdSQUuLGBjBAzpU96ANwU2kd3kB3uf3ysG/S
 6Kow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxlsToKUvnd+yLTmwgtjXfzjqHDO6kw8BBkOLJ5p2NdfiU7Yg8eTlv/COGUChzlZAlX48rHnlT+MM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI8b/sG/BHGcVuqauktJME7QYv7rGN2JSiHtY11v6tgWtKFQiE
 dkNhXbaaaKl2FF52K8+0srKsxhCyT+n0JvKve4fCc65rtJYxgEwSw3oFMDr/tW3b/hlg0jTELgA
 E2uReCdmyUI9mFT6RDnjZpdt7H3YgirDwshwWVFal3KZTi/4WpaD3eKsiyguIPNhPIw==
X-Gm-Gg: ASbGncveQLc1PbuVWu1sMzFvNTIpT7PD9JXjfVQZsM56PVbR9745LzmfoPXp8SFpcAE
 d+5o9ileNRXbQfQxl+qLiOwEFvIczqCm9b/AUOclYzfhsX3sdqbcxh+OMDvsYSBRWc7gC4/KDkb
 yBtTMXKfNzNangBfyXTanPE+WypIbgX49wCPpoAJ6W6JiXT/ziwCIIOfq1L4nlvhCN5fzPhx4CI
 8BdpmtYJ0c0TFKVsFCcuq5Tuh0vPyzhR/DvDURo30jM8VevLy9xovk/bGUZjfTTPzvjKOLEVMC6
 fb+VEmfny601byH30cVi1cHJxOcTENbr0F6ptDpgeqfmTYvSAH0ViGzlVXmvyfxdef77PzwC
X-Received: by 2002:a05:600c:6488:b0:43c:fffc:786c with SMTP id
 5b1f17b1804b1-442d6d6ace2mr126162025e9.19.1747053291112; 
 Mon, 12 May 2025 05:34:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5jxWWVElGWxNHl3crVYv65IUanKXS9MQimx+SU1bSVoqMYrPVegNxma7hfxGl7cXYCgZC+g==
X-Received: by 2002:a05:600c:6488:b0:43c:fffc:786c with SMTP id
 5b1f17b1804b1-442d6d6ace2mr126161635e9.19.1747053290770; 
 Mon, 12 May 2025 05:34:50 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442cd3aeb79sm167091005e9.27.2025.05.12.05.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:50 -0700 (PDT)
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
Subject: [PATCH v2 10/11] drm/i915: track_pfn() -> "pfnmap tracking"
Date: Mon, 12 May 2025 14:34:23 +0200
Message-ID: <20250512123424.637989-11-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FOwhf_sp6oHdoavPS-IcnDFIMzO4NKmyLddp94pZB0k_1747053291
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

track_pfn() does not exist, let's simply refer to it as "pfnmap
tracking".

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/i915/i915_mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index 76e2801619f09..c33bd3d830699 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -100,7 +100,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
 
 	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	r.mm = vma->vm_mm;
 	r.pfn = pfn;
 	r.prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
@@ -140,7 +140,7 @@ int remap_io_sg(struct vm_area_struct *vma,
 	};
 	int err;
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
 
 	while (offset >= r.sgt.max >> PAGE_SHIFT) {
-- 
2.49.0

