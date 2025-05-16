Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47006ABA520
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE5B10E2A1;
	Fri, 16 May 2025 21:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3kqb2Ceu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6052810E2A1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:30:07 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-30abb33d1d2so4694244a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747431007; x=1748035807;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=lKGqoll3RbNHREN0eIRYM+wz/B1kXBEjsywi3uO05do=;
 b=3kqb2Ceu5QbLYh0tB/ajKLc/ykEJCNgjmg4GpL7GRSbdsowV6qoEElYmkIg9T16MSQ
 RmUhiWc6pWU7ck+niB5L8tAjMusZHNLg6ZzAeGZ0HCLjFXLj5nIHAXqYZytG/BMi08wE
 Di7in5ZibNjFZibVHMenDSNIRuRrfv6kLn+5HiHXeFUKOTEgXkPINzeevMbp+7T1LTMs
 MhIMHj7aAOz3n5Bh3oZMKj+Hs4ej5qCmjtp7ilIK1iWCYd0sXktVlm6U2Z83IZYizELq
 d3zA1MyZvNKB9En7gU/8pp2l8LQdnvbR0lsVi2aWR3U6sWtEEMWpcV5xyiMYHxXx9yuM
 mLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431007; x=1748035807;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lKGqoll3RbNHREN0eIRYM+wz/B1kXBEjsywi3uO05do=;
 b=rNkdoRSwVGY7UT+ApJp7iGOB1nT9pA03bZ0H6ep7Qhx84kqhi7hfNBKsRsEkcUjWwP
 oVtPYydZNSAvF2324nKZ/uF9bPs5AxUH0JSPfmZAK3+z/Ug/2uX+xKFUc3zX5AUu3D7E
 8Z5PEWn7rGU8Fe81DathBFYxkk8UyytjWrRvUo22en/WFxzKxeMAVD5rCsCHaQlECsLL
 Iw16wkteKXr+hRK7BNjc2mi4rzMieN6lp2/f0GwiconmvJk2sUKY7/3xBMcadXHo4Chv
 Vkzm9BfXtgi0zcKNZwxyEWqIzaBvQB1bhGonF161UjCv0I18w/ZXqLQrXvCskjmSqi4g
 YWcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzmTCxB8jFdlYp4v5UFjOnbgati8yPMampdoGSKFxWS6lIdh/OS3IwOQm2g3dbD0LE2B0wyUiPxF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY/yJWNX2G9lzFFIHTeW1MeMJE2e3TdF79px87yPyYUcH3H3pk
 oYdfRZap/1+aEdllXtdQ65RgclE4sFWkePvpqgZQkg1+s2qmSeHCDkyRSMrZPXsus8a80rW9W0W
 v+/oOvw==
X-Google-Smtp-Source: AGHT+IH1jrrId9MVi2SBTvtJJTyzh8YzXge4AbpmDoeFZoyCxndzCIEwgvXMwRA0R+s3WnDYdARhk8o3l0Y=
X-Received: from pjyd13.prod.google.com ([2002:a17:90a:dfcd:b0:30e:7f04:f467])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5746:b0:2ee:f687:6acb
 with SMTP id 98e67ed59e1d1-30e830fc346mr5582137a91.13.1747431006822; Fri, 16
 May 2025 14:30:06 -0700 (PDT)
Date: Fri, 16 May 2025 14:28:27 -0700
In-Reply-To: <20250516212833.2544737-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516212833.2544737-3-seanjc@google.com>
Subject: [PATCH v2 2/8] drm/gpu: Remove dead checks on wbinvd_on_all_cpus()'s
 return value
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Zheyun Shen <szy0127@sjtu.edu.cn>, 
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kevin Loughlin <kevinloughlin@google.com>, 
 Kai Huang <kai.huang@intel.com>, Mingwei Zhang <mizhang@google.com>
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
Reply-To: Sean Christopherson <seanjc@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the checks and associated pr_err() on wbinvd_on_all_cpus() failure,
as the helper has unconditionally returned 0/success since commit
caa759323c73 ("smp: Remove smp_call_function() and on_each_cpu() return
values").

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/drm_cache.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 7051c9c909c2..ea1d2d5d2c66 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -93,8 +93,7 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
 		return;
 	}
 
-	if (wbinvd_on_all_cpus())
-		pr_err("Timed out waiting for cache flush\n");
+	wbinvd_on_all_cpus();
 
 #elif defined(__powerpc__)
 	unsigned long i;
@@ -139,8 +138,7 @@ drm_clflush_sg(struct sg_table *st)
 		return;
 	}
 
-	if (wbinvd_on_all_cpus())
-		pr_err("Timed out waiting for cache flush\n");
+	wbinvd_on_all_cpus();
 #else
 	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 #endif
@@ -172,8 +170,7 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 		return;
 	}
 
-	if (wbinvd_on_all_cpus())
-		pr_err("Timed out waiting for cache flush\n");
+	wbinvd_on_all_cpus();
 #else
 	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 #endif
-- 
2.49.0.1112.g889b7c5bd8-goog

