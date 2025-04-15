Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B240A89982
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2646B10E6F7;
	Tue, 15 Apr 2025 10:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mh3nOUXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B686610E04C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 05:33:18 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2264aefc45dso75916065ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 22:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744695198; x=1745299998; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FBhMwHga0x3nRhptcyGVnSToQtpMNuAQZDbsWtn01xg=;
 b=Mh3nOUXEMVvbcN0EATmZ6VJHcmG4+1ztVM0wkWUGY3gORec7oAL5YT83Y31fG8whxc
 zVEip/JFrtZqsrqlzDeiREq6PeRTjr0YkYwrFjvhLzIS61TQ0GdyRXDEghJqAPgWyofW
 GUNEzdripLPqLff8V/2Z8S7hsGDWLaYWpVCr3/YP3oVPO6HaEvlgXMfAe5O2IHUjizIV
 UX1J5JyKR5oyNzWa6eLnXROShA6sM5KVyBYy7SEXIGbAJReaPo7Kk0TyEvKdFlp7yTZd
 FCJ2rjZTq2C+kD9/HaRoANvw3NPSu2QHZuMYfjn5Z8ngLRzy427TxTCkoisxg5ggVwwb
 IyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744695198; x=1745299998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FBhMwHga0x3nRhptcyGVnSToQtpMNuAQZDbsWtn01xg=;
 b=iE3yaYcgI3whLfOhGmVFKljzggf8TSp2AUU2RDJ/EWsO926t2OsG12uG9LhAZaBafN
 lBrUDPggUF/P2zweJYM1Z92WmzCakQMcT3TnCde1qxJPj4XzUYeG1NQ0rhY1dB4Pk2A7
 yBBM8lvz9eQcaFJl2155IKNrboJ08Txyn/kGuLgUeCd5vsEfngIt3dzitmSvbNJHLi0C
 PmRVtQPXYQASgF9H8UZhZf4qeoYvt8JKZNtUvlWVrn4dpU2TKtFShtyBNTgdDSAtYoug
 5uvP+TLejiLUf6y+EySAcr4ZqAft36MPoIiH/BoW7tQy0R5bybI+B7AkF+4v0WAxLmeL
 MSDw==
X-Gm-Message-State: AOJu0YwyL10YTUetmU+x2iceSlwUsjUDgDKPK6XjGI1rp1GfMQWJHA23
 Rh+fGN/wzfrngRGSNlxq3kSUe1X0wyf/KjOLf0XIrnyfHlW3BxzAFJwyjw==
X-Gm-Gg: ASbGncv8wZRtfEzKRKzfPON/fp5qhAzfNxC8PPf/K4DKrl9xxryCS9wOPmGWpiqTp2V
 Cyit+GMTbhIv3Zn3tbZVDrYHESkntIfVrhKXnTELhvhTacihEcPKBnyBvtIVXoKzsX31Hfcy2QT
 cXzy72VBqdg77ncGSA9mlOqP2laZmWWO1H7IOn3UUlwxnyJLCw8BNFmTz2OAyPhDye2Ek5jER4y
 QsCkTyHaGadl9QSHzCIFeEuQbTm/g0O8LM785QPj+qEFrEZVVWWtIX0vE5dh6ImDtwrHmmHU/d1
 sBnkli1grCBBAfYfiIZMy7UH9HdYOBr0jAATaMZxv6CFkHPKWGqUrQl5SZYIzQXQ9osSbA==
X-Google-Smtp-Source: AGHT+IGxIhjrOUkfYOGoYjFcnCjRmkS4l3dK/X0mr1jKU4n8z7JTNveQjMzDo1cKGwotnzipQtk/yg==
X-Received: by 2002:a17:902:db0e:b0:224:23be:c569 with SMTP id
 d9443c01a7336-22bea4adf49mr227161555ad.22.1744695197836; 
 Mon, 14 Apr 2025 22:33:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:647:4d7f:5948:ac16:97d3:9b61:658])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7b65a88sm108885935ad.37.2025.04.14.22.33.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Apr 2025 22:33:17 -0700 (PDT)
From: Russell Cloran <rcloran@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Russell Cloran <rcloran@gmail.com>
Subject: [PATCH] drm/mipi-dbi: Fix blanking for non-16 bit formats
Date: Mon, 14 Apr 2025 22:32:59 -0700
Message-Id: <20250415053259.79572-1-rcloran@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Apr 2025 10:08:37 +0000
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

On r6x2b6x2g6x2 displays not enough blank data is sent to blank the
entire screen. When support for these displays was added, the dirty
function was updated to handle the different amount of data, but
blanking was not, and remained hardcoded as 2 bytes per pixel.

This change applies almost the same algorithm used in the dirty function
to the blank function, but there is no fb available at that point, and
no concern about having to transform any data, so the dbidev pixel
format is always used for calculating the length.

Fixes: 4aebb79021f3 ("drm/mipi-dbi: Add support for DRM_FORMAT_RGB888")
Signed-off-by: Russell Cloran <rcloran@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 89e05a5bed1de..a4cd476f9b302 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -404,12 +404,16 @@ static void mipi_dbi_blank(struct mipi_dbi_dev *dbidev)
 	u16 height = drm->mode_config.min_height;
 	u16 width = drm->mode_config.min_width;
 	struct mipi_dbi *dbi = &dbidev->dbi;
-	size_t len = width * height * 2;
+	const struct drm_format_info *dst_format;
+	size_t len;
 	int idx;
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	dst_format = drm_format_info(dbidev->pixel_format);
+	len = drm_format_info_min_pitch(dst_format, 0, width) * height;
+
 	memset(dbidev->tx_buf, 0, len);
 
 	mipi_dbi_set_window_address(dbidev, 0, width - 1, 0, height - 1);
