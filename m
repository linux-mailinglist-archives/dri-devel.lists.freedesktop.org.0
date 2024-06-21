Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF63E91295C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3FE10F1F5;
	Fri, 21 Jun 2024 15:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Moy/hwyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com
 [209.85.218.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CDD10F1E8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:38 +0000 (UTC)
Received: by mail-ej1-f98.google.com with SMTP id
 a640c23a62f3a-a6f11a2d18aso246033966b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983297; x=1719588097;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djUk2If8xpZ4vTNhXlIv5F4oXxvrnoP3UCpV+wMkPGE=;
 b=Moy/hwyUscKlyvBFBNf0V/L3iuZv5kRk/6QlRZsBFCjW/vzrSatDLadxW3lx6mGugc
 svfFZJcjOqTDZJ/OsEmEsS6B23Tl+Q6SYvoICHXRcTppYldQsSOODPRNa0b/1dP6VsSf
 XfSp/expxPvaOo/Jq273cKMcADEIdMR5XuhaKnh2hBS7w9RRpT9RF9HwlKkO4idC2rve
 SZbvfBnswVZ/WReaGDzSBmSYZKsJd6idxjvHI4ZaKGEJDjR1zOEqXiHRgSiHVGUcUxSR
 KkCS6eHZbCi0MAG6BN4ULQb5Mztx32FGqDDysHeqCdeQfcIpRtFgy960pnidlt1ba5oo
 2REQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983297; x=1719588097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djUk2If8xpZ4vTNhXlIv5F4oXxvrnoP3UCpV+wMkPGE=;
 b=hPfjQf6YT7obb6OYP2YBaLTNjXMYZWMe7LVvUmnnfaJqiIRBEBtZaqaobhLYuuoQyG
 hwmPH2LHYvPvegFfQUWIqy6gSNb58MN+oeGnJLoxuMHjnjit7GNUCCbFISVI4uDpP/sl
 PgwaUOoFq6s5TFFOTRVcjxgWrZSFXP0QDoZ7dZ+IPjxS0RopYN9Q1LopIt2CGlPQrfco
 tz27G63TqOcX23hP2yNJNMmXHJpPObzkOu4fogfTqSNBlVfOR3vI/E+KOknVAB2jQ/CR
 PN19Q0JrQWRkN+6eMVconIRvt22XnprJVj1xYTAThNEhQM+YMk2F0uljmehtRaLy2l4M
 qwHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOftwHIkJZcm2XX/HDgvV2oBa5pxxNrLohnd/hiBWSXL6C5yhHps1XBQLthRWJKIJoexZ+ATqKlMSOSzrEbLCmjY61OfaMa8GTahm4WHwH
X-Gm-Message-State: AOJu0YwUElwZu3e3iWqdgua3O4vfHmNrMnWCm+7GMqkn0HqJtkxK64Al
 8NynVRIZKqgUrNE8gPknmGCwgkcfnMlltvOU1Zc24Jn50k5j+AmNfbWtddmiOl+OujAQKxNbzmY
 /8TwmTbql6P6K2vQ2I/I6A7FApnNvmTJF
X-Google-Smtp-Source: AGHT+IGJ4FsvkGn19cByBM8dTkKOI5ZI+5H8yhqP9Cx0547fNtZOn3shImkyf712yAeo6x74PFzYd0sx3HsQ
X-Received: by 2002:a17:907:c283:b0:a6f:57f1:cebb with SMTP id
 a640c23a62f3a-a6fab772482mr493063166b.50.1718983297391; 
 Fri, 21 Jun 2024 08:21:37 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf5605e6sm5540266b.190.2024.06.21.08.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:37 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 12/31] drm/vc4: plane: Use return variable in atomic_check
Date: Fri, 21 Jun 2024 16:20:36 +0100
Message-Id: <20240621152055.4180873-13-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

The vc4_plane_atomic_check() directly returns the result of the final
function it calls.

Using the already defined ret variable to check its content on error,
and a separate return 0 on success, makes it easier to extend.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 16197c4b4b33..d078a2d21eea 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1386,7 +1386,11 @@ static int vc4_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	return vc4_plane_allocate_lbm(new_plane_state);
+	ret = vc4_plane_allocate_lbm(new_plane_state);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static void vc4_plane_atomic_update(struct drm_plane *plane,
-- 
2.34.1

