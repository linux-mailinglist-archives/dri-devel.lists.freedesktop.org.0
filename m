Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E116844925
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 21:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D40F10FB56;
	Wed, 31 Jan 2024 20:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1792010EEFA
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 20:48:14 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-783d8e09a1cso13299685a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 12:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1706734034; x=1707338834;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IHehOClwdwyT5hm1jstGhrGJBzJcQJ/fIMBxPcZfJIQ=;
 b=I1S0+6uL74Wivq8WqwgaapZEGXA2rFMYOZDRM7PtIHIt92rSf4BdCCbCnXuYPRmMm8
 V2uUPiS3r+A+M4vFs+tP97FtaTAME+FcLzKhWTk1Iv6Bbdm92UECrX37VWU5piwYWEAO
 fBI5J7BkeaKWVaDnyjm5h7hG5CUtQR0zpotQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706734034; x=1707338834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IHehOClwdwyT5hm1jstGhrGJBzJcQJ/fIMBxPcZfJIQ=;
 b=eqLKvaZrJY4qiwkTu0i+0I5cfzA1eUgSBnWAs+vysVkI3KQgHjb+s1A/Hd03KN9/dw
 e8OCTGWI93g/wdbGiPKet2eUMlhyVj/giUY+gbSML2ztTn3RukYHgiqlBzzMrAsgcv1U
 hJtGhDWSYP5kaVwO/wr0PQlNXt3OmzVfuvFwVKaIz081VVVzsinMp1oDh/iKhn7yH9vT
 YIJ5biP9EvYTCUI+dKaibnNlCTkV72WgRnp0qeX5VbzqdWwWtKb+udScTRZFNuW4EYPD
 zC4PGeUKRSLrHfwsGZx0y0xxPvx29Ahu2e0seg80DB21V3U6Vrdx5ocQtKnfZcYASV0/
 eGQQ==
X-Gm-Message-State: AOJu0YwMxktlTh0TiPtqH4Eu9CdqDV3ejA/jBxjXR3bk+uunJa1rUNpp
 HOc9CJOeOQ+7jZo1PLuyaPerVqSUbBzYFJwf7oFZ+r8O0DMAyjrVrq8dFecc7A==
X-Google-Smtp-Source: AGHT+IGFl+yQTcSkjdkSZkj7+XvZs9cGGUHj14aKkZC+jmz3gUMJNsJYBd6YGetGBZWQKYm6fSYcbg==
X-Received: by 2002:a05:6214:d02:b0:686:2ff1:8de2 with SMTP id
 2-20020a0562140d0200b006862ff18de2mr3086741qvh.41.1706734033777; 
 Wed, 31 Jan 2024 12:47:13 -0800 (PST)
Received: from pazz.c.googlers.com.com
 (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
 by smtp.gmail.com with ESMTPSA id
 ow11-20020a0562143f8b00b0068c67a3647dsm1410352qvb.76.2024.01.31.12.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 12:47:13 -0800 (PST)
From: Paz Zcharya <pazz@chromium.org>
To: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH] drm/i915/display: Include debugfs.h in
 intel_display_debugfs_params.c
Date: Wed, 31 Jan 2024 20:46:54 +0000
Message-ID: <20240131204658.795278-1-pazz@chromium.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
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
Cc: Subrata Banik <subratabanik@google.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Manasi Navare <navaremanasi@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Marcin Wojtas <mwojtas@chromium.org>, Drew Davenport <ddavenport@chromium.org>,
 Paz Zcharya <pazz@chromium.org>, khaled.almahallawy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 8015bee0bfec ("drm/i915/display: Add framework to add parameters
specific to display") added the file intel_display_debugfs_params.c,
which calls the functions "debugfs_create_{bool, ulong, str}" -- all of
which are defined in <linux/debugfs.h>. The missing inclusion of this
header file is breaking the ChromeOS build -- add an explicit include
to fix that.

Signed-off-by: Paz Zcharya <pazz@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs_params.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs_params.c b/drivers/gpu/drm/i915/display/intel_display_debugfs_params.c
index b7e68eb62452..f35718748555 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs_params.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 
 #include <drm/drm_drv.h>
-- 
2.43.0.594.gd9cf4e227d-goog

