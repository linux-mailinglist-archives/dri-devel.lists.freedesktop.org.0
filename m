Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E609DCC04AF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 01:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0536810E5DC;
	Tue, 16 Dec 2025 00:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DLC6O38n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181D510E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 00:03:02 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-78a712cfbc0so42845207b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 16:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765843381; x=1766448181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X3fuzXH5SEfyeqaUBVlqx0NH11f8VqTdNd2pukYtUTI=;
 b=DLC6O38nSWRVv769MbRCVawqoIkd7EOU1X8W4Dko9ZdcY5LSWsprvGUGXaOnkHzUhv
 +xrZIXHxLA2AACDwNM5LxzfQkyrZCEwpnDsjSG1pP3NRRgqTtgI071LUWPNrvREsdhUR
 ZpNhO5+XjLHzBYwTwn4imNe8ESbTJeYNOkjOfYcovjodhkBVW/Ft8N/U9ppyrswjAYGF
 ChdJnfFzm9Bf/y8Nlep6qMASOwoE3u1ONtfIE+L6YT42fCPZofcxJKIuzXGY33o0B2Bg
 15z5JrGrf1+GKUMtJKXNxYLHUUf0/HXXjgpbw7lcGIu36Vb4LwUOE5EiC/oYx6ajVF2a
 ERwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765843381; x=1766448181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3fuzXH5SEfyeqaUBVlqx0NH11f8VqTdNd2pukYtUTI=;
 b=uvPKhk3Cn66kQuhZb3JHkKqRUeFwIxgsqo5x2xlt3eA+5ImkzZCf72VOc60k+kOOiu
 8lRa13cJe7rEyFsJ1YViGSJzJvU962U9+FXxknYQiouU2pX279wooSPxriPGo73saFmd
 KJptaD+QPOGyKwpK1amFYFm5BcVOzdVnmcIKETIr/6iJ8pL5jYLDDVriWqd6XRIgYA2h
 HquHYWUxTdavJtQwxokyz3gOs+0syMXZbN68qGm+H7G/XnmhRhcYBfDl+vcUQn2jdD1t
 nWmiAeww7zQ7JN+G1LVPxLnoLuEAm1YCuz5jNaAvn9gE7iS+oSZnwC+qWu0etcFLEZUf
 2Cvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVpd4LihTM5QyyKzBfuZIOyksLZC1nWMhQjdB3qHpz4YsHrgmcSAxOSoHSRzcH65JBIWXahg+wH6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztztY9Wojs5Xcp4eDntdYhRPTFzU7e8dwW+S9HhIVo4MjDr80q
 0zHwyi17Qu9xrHkxLTryEzMS9h0ffFpWnpgeK7pY5QWAQThT0AYBI3nY
X-Gm-Gg: AY/fxX6PSgmMHWn9A7gL2h7LKqNHCWyK3rk9FCPl5ATs+tmgrd8SojBnwcaR36optTw
 jkqIg8mMi3qPMBVWJ/6bWCbEy5E11h1s/JkpylNTIT6BCllpasnq7hj9xaX+ZmCykg+1P0IM0jS
 0v40rSY0J+KeBKrG7/mfABK2cLWMdtqvzLcIGzXbA5rK+d75LWhfPGcPGp+7XqtB6A0JNlLqLxG
 9jSkIS0Y6d7BLDumWeCyQZje0e8YOpceIRsvX94N4ppIW0XvEYBpbz1alGw+LNzOi2KAM1VitfZ
 iK1Ud5WKR4kMJPhNuwHNrGtp0+bXEzghVEn3knAc/n7l474aLKF1CM6wCefUk2+BcfQDqPxKQJj
 HkmDro3VyH8uYZzDA3OA9YMh2i2u+R6bSSGmyNk1ydRndPcbv7ylVA3ifkNvMKOnnQDIs1hCovC
 YCCUxTKw==
X-Google-Smtp-Source: AGHT+IHU3vVA2SYJElE2obpcVI0gnvNEkzHvH2Jecy5LnMGranUYJKQCbTFXNsf82RxNUZqqx3bXJg==
X-Received: by 2002:a05:690c:9c07:b0:786:8410:31dc with SMTP id
 00721157ae682-78e66e750b1mr103406167b3.53.1765843380840; 
 Mon, 15 Dec 2025 16:03:00 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:6b0:1f10:bc87:9bd7])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78e748ef4fdsm33347247b3.15.2025.12.15.16.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 16:03:00 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Harish Chegondi <harish.chegondi@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] drm/xe/eustall: use bitmap_weighted_or() in
 xe_eu_stall_stream_init()
Date: Mon, 15 Dec 2025 19:02:58 -0500
Message-ID: <20251216000259.331293-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Commit 437cb3ded2503 ("cpumask: Introduce cpumask_weighted_or()") added
the new helper, which fits well here. Use it.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index b896b7ff5900..8bd4307afbbd 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -737,9 +737,9 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
 	u32 vaddr_offset;
 	int ret;
 
-	bitmap_or(all_xecores, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
-		  XE_MAX_DSS_FUSE_BITS);
-	num_xecores = bitmap_weight(all_xecores, XE_MAX_DSS_FUSE_BITS);
+	num_xecores = bitmap_weighted_or(all_xecores, gt->fuse_topo.g_dss_mask,
+						      gt->fuse_topo.c_dss_mask,
+						      XE_MAX_DSS_FUSE_BITS);
 	last_xecore = xe_gt_topology_mask_last_dss(all_xecores) + 1;
 
 	max_wait_num_reports = num_data_rows(per_xecore_buf_size * num_xecores);
-- 
2.43.0

