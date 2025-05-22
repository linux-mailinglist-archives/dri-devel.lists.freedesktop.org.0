Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BAAAC1817
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243A210E768;
	Thu, 22 May 2025 23:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="zL5yUVN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E337210E196
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:43 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-30a39fa0765so12863627a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747957063; x=1748561863;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=uPxUrn14vuCfCMnKXPuJKpCi+RnH/dlPI+aSAjTgJIQ=;
 b=zL5yUVN/m1DfAdL+K5feDNiDffXDRh9cY1I0L+RkTl3MEWM9fixV5/TbP2vmihEz3d
 2cE0pMTMA4jps+d9uyVQzcL3zhvJMiy+lzO1LKbg09nFMXqBYxuxApmwL2GylMuU8bxv
 AmvSYnyaXZyUpEM6rkEqD7O58B7jlG9LU6dgy6xflHeYpdqnSP3GwMBXs0QDC6lBqHir
 g62zS2G36CVlvokyUbq+14fkIzbO2ygh3JjOSHzSSPeFCKC0f4/V9z2pqk1yG3+w3IRP
 nf/wVqXJJraf8uqD+GqKfR9rH/IchnKGQ08BH1DwJEVW74IKO2pR6Tp5KPnBwqwUoMmF
 LYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747957063; x=1748561863;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uPxUrn14vuCfCMnKXPuJKpCi+RnH/dlPI+aSAjTgJIQ=;
 b=tZfiQ5OkNHtTpGz439r3GIRjZaczCRTk0oP9M2kAXWt3icJ8mrKY1a1BnpTvcjyUQb
 EXoluq88nL9KoFwixtvfcDh/YKhK8B0NywIIZXBpmmmSAHQ55b8lOjFw00jYIBc7p68M
 ReSNkd6pHrchtqHiYzpCBOgp/GT+hvXT7n1EChaiGlzh3iJeCVjAYn+32KxEpgZEdfsb
 KxlnI050zUHFc13/YA1/Xv6wh6EPI2IYY7jhyViVVVriYkt2D7MaeDi1LEDBt+Vc58oB
 0m4ummPIXavUjx5YucK7N9MDO0n6dsD84AJ72dGuknfu0oYa0bjfHX8QqU0mflx/qkXp
 OmSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLBlg/hSAK5TI24ZJdWVIJ3AX/lh05cxujRLtaGQz3T3jN2q6KBiEYfy4z9izbnbAehw63etNuuUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyoc9K48BP/sfXgffh+OuYBgwanmfc5h5318E3YOgdx96rXVFQQ
 Hw+/8N21CtPjfdJVFOqFVs4yxWZUlWqkL1WG5hvBntWU221rsp/UUVdBDSMXOnqZHgeMTd8Dh22
 Dgli+cw==
X-Google-Smtp-Source: AGHT+IGI69KyPY1At0pbvO9taKFOli2nLHw8tUa/zK4co4eocqDHMTFbGsbKlwZf9ojX+OImaEWTLGTboac=
X-Received: from pjbsw15.prod.google.com ([2002:a17:90b:2c8f:b0:301:4260:4d23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2c8c:b0:2fe:8c22:48b0
 with SMTP id 98e67ed59e1d1-30e7d555a3bmr38071711a91.15.1747957063457; Thu, 22
 May 2025 16:37:43 -0700 (PDT)
Date: Thu, 22 May 2025 16:37:25 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-2-seanjc@google.com>
Subject: [PATCH v3 1/8] drm/gpu: Remove dead checks on wbinvd_on_all_cpus()'s
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
 dri-devel@lists.freedesktop.org, Kevin Loughlin <kevinloughlin@google.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, Kai Huang <kai.huang@intel.com>, 
 Ingo Molnar <mingo@kernel.org>, Zheyun Shen <szy0127@sjtu.edu.cn>, 
 Mingwei Zhang <mizhang@google.com>,
 Francesco Lavra <francescolavra.fl@gmail.com>
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
2.49.0.1151.ga128411c76-goog

