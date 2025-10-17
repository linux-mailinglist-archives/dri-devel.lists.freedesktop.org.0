Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76E2BEB671
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 21:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA9810E197;
	Fri, 17 Oct 2025 19:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="zKjxrFQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DB610E195
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 19:46:48 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-32ec69d22b2so2182070a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 12:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760730408; x=1761335208;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xS2W6P9O/5R7omuKwloPAtjlYNdoghzDYUggMIQ8atg=;
 b=zKjxrFQpMNHWcSRHo87dXrGeeJ8Cj3SI/2zDMM6E79Sd4uUN8RLt2joVE0jrrSu7HA
 fZYKaIBFl65seJb0+EYBrZ7nloyRgjQ/jAHXlBXjlAIsadPTvnBDV1J3NMtRKvWee+UR
 0XvJ5SSGZlZmPVuWUh9zMx11m7TYWYsY3g+pYb/UpGaoB0HdFzJugXd748//6G9/znmF
 OudgSXuKIyRQHypHj+YXh3zcsTqHY5eT6mzc+JvMk1EEis3Xm/D/JuqHtoRA38EA7PgW
 5Cn0h/4BFHME4e2rJOOKZX9HfvUAalEFHb3E4MANy65jjSC78wzJ+WjDNHNOQZEjaAUi
 u7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760730408; x=1761335208;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xS2W6P9O/5R7omuKwloPAtjlYNdoghzDYUggMIQ8atg=;
 b=Oh18pfeCi9hYR/85/WBuNOx6S728HZ1MWYYt3/G5n6XcfYAIAChxNE/608qu4VIqv9
 qT0K/MSkjUF25/0C/w75CgLzL0qtf74H/Lu8bKhWpnTlVW6GveJ+4RcC3e5Bmj5P427d
 vF4WYYWKN78fJKV2/t3vWNJw+vid6/OnCusr8V+2gO0Khr9jdT8Bm4YzrB30ZU0yiebk
 OGscic+Xm1+FiG9gP3tm7q6l+IKkTYYpJrtAxKJep1RXamNSR7svLEFRWcXgHYTBddFE
 T/74hRP8f2OqwQd8EX5QL+4LgM+ZHx48P5Ns1zQiFQLH4a5VO9xRbGdFj9wsyws8DQG5
 OH6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkN1eqoXqh0GGxp8Z4697dvOEdvshJWLBHYHJBzpQ6lPmFpxmovj7EVI3YongM6WQ4e1UUFp3iDWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM3DHdvo1iOuDvTp8PgTupQKahuwz0FP/NKI/cYNc94tFJlAZj
 fjSXsdcre4BOMraK//4HfhmCfhK4vQsYBXrU7qRq0Gnbn6x9PJ/o5zE7FjX6fIRA/n+BFs4xQhn
 DQHgFHiZKc6EWsA==
X-Google-Smtp-Source: AGHT+IG197iQnjLRwxm4Jsr79MNCmECX5CThjh1rAaLaU6FbEdeCp16Ft8ibFhXM75nEK5W0bGciB8r1G/DnEA==
X-Received: from pjbqd7.prod.google.com ([2002:a17:90b:3cc7:b0:32d:69b3:b7b0])
 (user=ryanneph job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d8f:b0:339:d1f0:c751 with SMTP id
 98e67ed59e1d1-33bcf8fa5b4mr5593940a91.27.1760730408212; 
 Fri, 17 Oct 2025 12:46:48 -0700 (PDT)
Date: Fri, 17 Oct 2025 12:46:26 -0700
In-Reply-To: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
Mime-Version: 1.0
References: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
X-Developer-Key: i=ryanneph@google.com; a=openpgp;
 fpr=10046FDF459A0F9DD68C9C04313B8636EEDD116A
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508; i=ryanneph@google.com;
 h=from:subject:message-id; bh=N2xCTkyeUBvL1UCxXbUEbTbI7HxLvTjzO83pqQw4Ffo=;
 b=owEBbQKS/ZANAwAKATE7hjbu3RFqAcsmYgBo8p0gYtAv+VXf0NjAMtfz+GBELlf52U7mq1Lal
 cyMybzMyaeJAjMEAAEKAB0WIQQQBG/fRZoPndaMnAQxO4Y27t0RagUCaPKdIAAKCRAxO4Y27t0R
 algQEACVzGzvQW0Y+/Tn76eydGWkFLIWx7CLY8LPicenn3OBnTMHbIJ+EkrButmJDC+dQrZ3p6T
 EwneLQwW3cpJNbD6NewOWPKf6sww9snnB7CGzWs4kzDgiExl3FL8qsGqNZLUYxjvoP86QoZTtd3
 zjGLmLOKcsGl0APYHQC27Fs1qJ38KiPJZ9Wp4pmcTy6BoCt7RfgYxTTlBt66T43cYWFVpwUk4ct
 csijQX9LfnLchMYLg1GZy1LskiXp93QOihNL61MOo5d2zWUGzd7yZl/BU6AwrsAuF8Am0vtW+Lq
 g17aZy74mynAvNlMJI8HLyEW2KYLR/2q9n278tGuq3hXJBMKOzKMlKv0/oaF5PnJzsq1Au3Cy1W
 KWqOEm0UzR6D37kGpxVuO0T4qKC6kPoEKC66mK6RNvC/l1yJz1WTAxCGsZdy/ScZ/MExnAMFRbE
 S+HqQ4Wwk5X9sXFtkcodxR0iPOk9derf048wY4UfL0GME0nNvSkv+GOxFFtDHoujZR7H2eCilmK
 wbX12StzHyMbtvNRY8c+SuONOHJx3Ga333k2a9xjbnlslIwnp4xzuHrg5Da8kJCrs9xsHUrOtph
 ERma71qJICY9Dvjwc3QKjLuSJXO7nBOezN536Ha2e8NZ/nHgcJOnM9f7hnQY6HuFzQehpopUh6q
 sx2oMk6mZMsRvpw==
X-Mailer: b4 0.14.2
Message-ID: <20251017-rn-cfi-v1-2-bf66e6ad4fcd@google.com>
Subject: [PATCH 2/2] drm/xe/configfs: fix clang warnings for missing parameter
 name
From: Ryan Neph <ryanneph@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ryan Neph <ryanneph@google.com>
Content-Type: text/plain; charset="utf-8"
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

Fixes warning from clang-17 that look like:

drivers/gpu/drm/xe/xe_configfs.h:35:97: error: omitting the parameter name in a function definition is a C2x extension [-Werror,-Wc2x-extensions]
   35 | static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,

Signed-off-by: Ryan Neph <ryanneph@google.com>
---
 drivers/gpu/drm/xe/xe_configfs.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fed57be0b90e146d57d966bab0e55e1723513997..a0d614b37efd54b89390f04a238aef1a8d4df4e2 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -21,9 +21,9 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
-u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
+u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class class,
 				       const u32 **cs);
-u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class class,
 					const u32 **cs);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
@@ -37,9 +37,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
-static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
+static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
-static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+						      enum xe_engine_class class,
 						      const u32 **cs) { return 0; }
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
 #endif

-- 
2.51.0.858.gf9c4a03a3a-goog

