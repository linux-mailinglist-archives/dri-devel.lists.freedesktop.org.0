Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1799D54AC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 22:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA61210E2E2;
	Thu, 21 Nov 2024 21:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DJllmg8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8689310E2E2;
 Thu, 21 Nov 2024 21:23:57 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5d0062e9c80so1763619a12.2; 
 Thu, 21 Nov 2024 13:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732224235; x=1732829035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vH5eEx92Lr2Szoo+88xQFIoldvHAb3MxjigQ5AJgHzY=;
 b=DJllmg8n3k7XNryYepMkkyyemZuX9fjIkVvUUbJNE3DJFG6PFtgaTJ2ef732/a8ob4
 rqZL8QgWObIrfNFR5rh/XVU68F5OcLAugSlDOGfCZfP+tem326hHsadZeQ1JypzJvEM9
 YyZn5uD+n8ZFsyVxXBuMioIkkJem2U2EO+cy7+ESw5MY4zy4D11FG9yTi46ssgnru0EH
 UpI4RDRzcwYFIjCJptjMGGhuVPTra9hxO2zKGcEnBwn3+RfLt/LC7Q12YSmKDT9puaeT
 IujpVWhwYlMuMKdjpSq/ptsDw96YEN0sIuMExmtfTcI0W6dCQrLVXtDzrnc4pyBMcyz3
 eBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732224235; x=1732829035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vH5eEx92Lr2Szoo+88xQFIoldvHAb3MxjigQ5AJgHzY=;
 b=UIyclPl/bov5eo5H8Fr8V5W2ohsbFBJ7LVg0Jdk6t/W81gvMad3EOfAlTP+ZnWQxAV
 EgKytEgEJ8aa0ZYXQ14IVqrURJjYBZFu5VTj+G91MWH+jQbLFJkqQO7OCRb5w+5i/V4P
 eQrSnXrq83uhPiN8Ex4pM6Ghlm1bE8DZ4ZV4a0OcEE3DI7tE0oFPadBdGXg1xjmTNcgM
 sVPTmBmJnvU1xs5ljJUSYpTmhan609urp+yFJFIsKKDbG+BXRmP5cemewNvpBkHQ0GgW
 EPvZUUmwJcUN9MogEqr67urlP9KlubfpnUPicIa2oO/bF0V2VTMabxFqPI3KVZ1lD72Y
 X/sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe/asa1h2Ouyg1j5o6pgP7Ffwlkw5wytrtAx+QLcDuNfQeTBYHU3uKg7WuWRvxo4SKH790Bt/opiw=@lists.freedesktop.org,
 AJvYcCWrovXnsE0BmdzzIiBawk6x+VlaLeDQpFbGfaCskGUcxN2uqWC8jGPIJU01dMBYYgDVAuIvJd5q47U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXS2FbCdcdC3tw9kHOXk7sfBVdjP83LZUnz0d5691vDLUoF+EX
 kR4wYapXomxCdB90+On800NVCcSwp9wSS91xC3Q1MAyuksmJQ/mN
X-Gm-Gg: ASbGnct3cmr7DqWOwqT7zwMmh66NVHJ9/I+JBzzfDJv3lqVZGttJa5zixXCm+mmkZY7
 hmDuooijV1OO0v8O33B2/e62qvKDqyG00F4liAbINodZ2O0Gpv0jLwtLAv//kasHF6U5RXQuzbS
 mvNwvu7bJNPBUXNrrhWmOD2o9zJwRA5lyeqV9pIliy2DbH59lhFbl3fAVsFLH/Cinv+dggYRE+H
 hXocmOE5iIp/DsqgUY2iGIl2rhvQ7jg7NUKs1XRRovgKIW6uc73+inFHMwWVDk=
X-Google-Smtp-Source: AGHT+IEyyQ6mC5ziSyd6ZZ6fw2BVBUM7eBI02Y1PnnCrHrXI1brGl+EFb5EWLAKg2rV0EEkGts+4ew==
X-Received: by 2002:a05:6402:5201:b0:5cf:eaf7:2776 with SMTP id
 4fb4d7f45d1cf-5d0205c6025mr149140a12.7.1732224235157; 
 Thu, 21 Nov 2024 13:23:55 -0800 (PST)
Received: from localhost (dh207-40-8.xnet.hr. [88.207.40.8])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3fc94asm184056a12.58.2024.11.21.13.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 13:23:53 -0800 (PST)
From: Mirsad Todorovac <mtodorovac69@gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Mirsad Todorovac <mtodorovac69@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Philippe Lecluse <philippe.lecluse@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 David Kershner <david.kershner@intel.com>
Subject: [PATCH v1 1/1] drm/xe: fix the ERR_PTR() returned on failure to
 allocate tiny pt
Date: Thu, 21 Nov 2024 22:20:58 +0100
Message-ID: <20241121212057.1526634-2-mtodorovac69@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Running coccinelle spatch gave the following warning:

./drivers/gpu/drm/xe/tests/xe_migrate.c:226:5-11: inconsistent IS_ERR and PTR_ERR on line 228.

The code reports PTR_ERR(pt) when IS_ERR(tiny) is checked:

→ 211         pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
  212                                   ttm_bo_type_kernel,
  213                                   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
  214                                   XE_BO_FLAG_PINNED);
  215         if (IS_ERR(pt)) {
  216                 KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
  217                            PTR_ERR(pt));
  218                 goto free_big;
  219         }
  220
  221         tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
→ 222                                     2 * SZ_4K,
  223                                     ttm_bo_type_kernel,
  224                                     XE_BO_FLAG_VRAM_IF_DGFX(tile) |
  225                                     XE_BO_FLAG_PINNED);
→ 226         if (IS_ERR(tiny)) {
→ 227                 KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
→ 228                            PTR_ERR(pt));
  229                 goto free_pt;
  230         }

Now, the IS_ERR(tiny) and the corresponding PTR_ERR(pt) do not match.

Returning PTR_ERR(tiny), as the last failed function call, seems logical.

Fixes: dd08ebf6c3525 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Philippe Lecluse <philippe.lecluse@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: David Kershner <david.kershner@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
---
 v1:
	There is also the logical problem which this patch developer is not qualified to fix:
	first the fake pt tries to allocate size of (1 << (XE_PT_SHIFT=12)) = 4096 bytes,
	then "tiny pt" tries to allocate 2 * SZ_4K, twice as much. Is this what was meant
	to accomplish?

	drivers/gpu/drm/xe/xe_bo.h#L46:
	#define XE_PTE_SHIFT			12
	#define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)

	include/linux/sizes.h#L23:
	#define SZ_4K				0x00001000

 drivers/gpu/drm/xe/tests/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 1a192a2a941b..3bbdb362d6f0 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -224,8 +224,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 				    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				    XE_BO_FLAG_PINNED);
 	if (IS_ERR(tiny)) {
-		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
-			   PTR_ERR(pt));
+		KUNIT_FAIL(test, "Failed to allocate tiny fake pt: %li\n",
+			   PTR_ERR(tiny));
 		goto free_pt;
 	}
 
-- 
2.43.0

