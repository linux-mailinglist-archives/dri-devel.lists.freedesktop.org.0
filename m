Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF6962374
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215EB10E43C;
	Wed, 28 Aug 2024 09:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XsjpwwG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C0710E43C;
 Wed, 28 Aug 2024 09:32:53 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5bebd3b7c22so765208a12.0; 
 Wed, 28 Aug 2024 02:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724837571; x=1725442371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ljlQm4Z756d2n9EnFl4azi2/3XalhuzYi2PKJHl8biM=;
 b=XsjpwwG7EixVdRDtbW0w5tQ6SZ+kWulwFrAOpKuWuHFjj1IDgvifLrWbgHpeSQHQD6
 0dtXRz4YRI+F1S3n43yvX7z7+ATr9OtUeTGXCZjMBe9aEpVuooeGjUAY14NN6o7gMIbO
 ckXWqHJNsbigxP2kPtEuccooCU7olzL/+d42MmbzA5uUGs+PyZyDaWzi1+nBR7k1zix7
 VA5JpDoBVyXo6L8VYMAneQv6RQSeDWQmxnA/x+kZfU1MWqku+/be5Zz9W/I5gqC+2qgR
 OqPZUy9s6jAylCLy7GKWrVZakkX8aYb/qbMMWvaXpyca4sSJLER0ABgN6lXJ8H5CmbOY
 uiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724837571; x=1725442371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ljlQm4Z756d2n9EnFl4azi2/3XalhuzYi2PKJHl8biM=;
 b=J6dk+x4K9MW4Cl8F8629qFEPKpwVwM1HckefI/alH1d/BgYUiIM3sDSuyxX+ZA9bPr
 v4nFEJjb+oGGaArg47USHfusHbhgJwxXcV2sxTnEhsI5ngw58j0bp0b8pFt6je55J0gJ
 wnXoYSCEODW/3V510L4AbnD2lveqd7MrGWWbeJeBK0nAltQcZigIqWILpiGTl3jG488d
 yOSg9qWYB34kn6JaHoibcchLHx2wNvDMwG+Crg+4TwO27T4Vl48cYsr+J7hyXvbxYJ33
 nk9i1522iRNibWJ97A3VPIVrubpmMyJ8r2IqzNiXhJyRilwWF6r1sJeiZwpQOaQ4Y+KO
 tfVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7XW8M002DtNpJShof7m69e63QJh67HqmA1Wyug8bADgLQ36zu0SW3dovCoLrp42Tvab9eDSySHFQz@lists.freedesktop.org,
 AJvYcCXek1ZdyzCLnKCc9dN7yfmYfaSxa3bA7bJ/KqHCL1UPjimInLGqASo1TrG6M4dH37DFHzQThSMf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMsbOEkNhNe/O7ZvalLyjm0q2t5Z2B0U3N3w8QLCpYFve5GQWr
 OVtqxPy6UNHsYGj/Vgv72g1/MH3q9qWkGfcC9PRlC63IpHI2qEEcbLVTJGYn
X-Google-Smtp-Source: AGHT+IFZqJB6vFvBK0EcgsYJ7T2OksI6qWVL0bPPi01r8q10EQ7avC39obDkdaWm65VsU3qbjrEM7A==
X-Received: by 2002:a17:907:7da0:b0:a86:a6ee:7d92 with SMTP id
 a640c23a62f3a-a870a9ba661mr180942766b.18.1724837571236; 
 Wed, 28 Aug 2024 02:32:51 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5487810sm219558766b.6.2024.08.28.02.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:32:50 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake "recompte" ->
 "recompute"
Date: Wed, 28 Aug 2024 10:32:50 +0100
Message-Id: <20240828093250.271358-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a DRM_DEBUG_DRIVER message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 0859a7173a06..669fd8fb6c24 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1325,7 +1325,7 @@ static bool is_dsc_need_re_compute(
 		if (new_crtc_state->enable && new_crtc_state->active) {
 			if (new_crtc_state->mode_changed || new_crtc_state->active_changed ||
 					new_crtc_state->connectors_changed) {
-				DRM_DEBUG_DRIVER("%s:%d MST_DSC dsc recompte required."
+				DRM_DEBUG_DRIVER("%s:%d MST_DSC dsc recompute required."
 						 "stream 0x%p in new dc_state\n",
 						 __func__, __LINE__, stream);
 				is_dsc_need_re_compute = true;
-- 
2.39.2

