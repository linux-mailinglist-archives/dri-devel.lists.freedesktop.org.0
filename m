Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876B43FCD12
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 20:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267346E039;
	Tue, 31 Aug 2021 18:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E43589FF6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 18:48:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso2417034wmj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 11:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ssx/Du/IP+VJ6yRDjCWSrw9PFpibgX8+LOfvx0arrC0=;
 b=puHwvGy27ZCKW1/hb24T4TxdTwdhH8hvACG5TZRQSpyCBIIMky52bBklkqr9uJutP9
 P0wNNsLYBf1rjLSkYPzkH9uMmpQw22uPzb75brSLN9IoR/EySrsjS3gV+thkKOc8/H82
 DI3D7LnOxXZVwTOxYbmAGqepG19w67uxdr+UqtuKgQlAouvhp3shcbNh69RePVDN7xVj
 WLCwur8FuuCsy2nyBXl015EN7380NvJAK3gPDqMFBvPm9y+8MyNgk67elQ7sxGSnioVa
 bz6G4tYRWV/i22lvNZPWSLbZFkZstVT/Xrky1y3wroe9W8wxlSJZn3OiE4MwLdI7la+B
 yM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ssx/Du/IP+VJ6yRDjCWSrw9PFpibgX8+LOfvx0arrC0=;
 b=JzXeLFydT6Reci32RXwhiqO28AcqiEdghVTnDfB30UIC7W2PNknt7BPHhZFUJT0uWS
 IiV+B4E31+iIgaNIK/UqbjKdsJy2X4SxbC+6u6po+o1yDMy0GLwlGGFhDmh2Abrvb2Fv
 NzWEdSNPj2DwPYpnWtD4pBuZj2y5Pzi/T7BhWvZ3n6bxij5iJ3qzqjVSxHTgfeOCjlt7
 /xU3i2wCc4breaXogf8PnH9jC3XtZ4gFdHyD1e+oqr/oBe+ygIsri8S/2ux3hzLU2ZKQ
 FVUaOXS/48GPhf7YGZAm354VsFO9XdqsjvzOtYe7Jye0e/tyHUXJxUQAM3Rvaqp+sFp/
 ZUKQ==
X-Gm-Message-State: AOAM530FRSR/N8eByyxQwxGOIUJaGTcNdVR1pvxs3g9ib6akV1y22slq
 +9V93XU2Zrrg6KbRtQ6fkkk=
X-Google-Smtp-Source: ABdhPJxpHtUrxMXrtWzNzUZfT5NDgfPAC3iEvcgbop4yUZWCq6uU0jUnfin9kUgN30R0dGd3QoArGw==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr5857630wmc.26.1630435719011;
 Tue, 31 Aug 2021 11:48:39 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id d145sm3111884wmd.3.2021.08.31.11.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 11:48:38 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 stable@vger.kernel.org, Roman Stratiienko <r.stratiienko@gmail.com>
Subject: [PATCH] drm/sun4i: Fix macros in sun8i_csc.h
Date: Tue, 31 Aug 2021 20:48:19 +0200
Message-Id: <20210831184819.93670-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
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

Macros SUN8I_CSC_CTRL() and SUN8I_CSC_COEFF() don't follow usual
recommendation of having arguments enclosed in parenthesis. While that
didn't change anything for quiet sometime, it actually become important
after CSC code rework with commit ea067aee45a8 ("drm/sun4i: de2/de3:
Remove redundant CSC matrices").

Without this fix, colours are completely off for supported YVU formats
on SoCs with DE2 (A64, H3, R40, etc.).

Fix the issue by enclosing macro arguments in parenthesis.

Cc: stable@vger.kernel.org # 5.12+
Fixes: 883029390550 ("drm/sun4i: Add DE2 CSC library")
Reported-by: Roman Stratiienko <r.stratiienko@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index a55a38ad849c..022cafa6c06c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -16,8 +16,8 @@ struct sun8i_mixer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
-#define SUN8I_CSC_CTRL(base)		(base + 0x0)
-#define SUN8I_CSC_COEFF(base, i)	(base + 0x10 + 4 * i)
+#define SUN8I_CSC_CTRL(base)		((base) + 0x0)
+#define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-- 
2.33.0

