Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669179E74CF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 16:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BDD10E1CE;
	Fri,  6 Dec 2024 15:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oics5vDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEE110E1CE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 15:45:58 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-84435dbda4bso119021539f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 07:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733499957; x=1734104757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8pcXmUZCuBPhhv9UOmrEGOEpDu8UHlHBCzJTdy/kxlo=;
 b=Oics5vDsUrUByoS4Br9wNpa4KtdQqrQgtI+xdbxMOdqqyB1s2ryxGlHoPg61ISooDK
 yAspQN8T+njpFQ/YGe7+FMDy/FlwMCBopA0HMmso2ZcSo1yyK3O5RTXZfo8YlrrUX385
 AwHls/WKn1EEkBFR2nRXqeKaFyGPyNxtKJVyRTi6mkLF9hmfAeyS38k3HYh0CPKFtKxo
 kLfhFzGc+9o8NsCDWfM0uD1L983ooHhcWmBx0aY0oqVEF9rEJ2QJ9ulVt5AWJSmFDXaw
 3YWQ3co1QeUQor9tDOMziL26pZiRNCBJ+03KZPYDV5t1+czbUQzgILKAHArHLgiQ3HXc
 GVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733499957; x=1734104757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8pcXmUZCuBPhhv9UOmrEGOEpDu8UHlHBCzJTdy/kxlo=;
 b=ryOlSAr9AWs/idMjF990sKJ2LoW8OyOHvOrqQmWsiAcFMo2NzC7szTrXmVjVdD75Q3
 0yT7bUkG2vmbPrHd0yRyUTZ7yQUgdV7iQFBLEVXsIpiNf0dT+ihwRweGNa98N0dSUf5T
 cxfD1aXHqCPQ7SrkdYs1v/dxlJm8rqkYTrfc0b4XbQjMWJ7ag0MB4o9fI9fbCumsE0N4
 m2iov+R/nBmHU4G5xWoGYK0Ovryb9WF9Qvrdz7wgbtWI7Ya0zfyjfrUqcCJMH4h13zLE
 tvNt6+ckAXexLADMVRpI3+jamcAgusod+zVHQZUKFmoqV/rs7OYG2nT0AdFW7LIfl3Nb
 3G/Q==
X-Gm-Message-State: AOJu0Yxzbvj/puLCZw7yfCMD/VpPgTgc7f3Nnf47KHobPh+Ot53+uJYn
 FjwcpQoNTzHmmI5KdXCeSZXjhD5NSix5y/JHrFGZhSyUhNy38nmA
X-Gm-Gg: ASbGnctuDivfZP0OxReb1+5uGAQdQIwwgdKLyEKMt5W0PgCxqKymTt4ig/t4KWm2fJ7
 UxzHdxL3cLEvJfBVOh+EY8RF7Sr46tm8x+JMyogc37qq30+69vq677YjO+QiZttNxwPPu90soq8
 /1zxDWz7uRpmusd54J17hnxgeBkpZd37CpXqI9kCZ4WeZ9n9fe8awqSxuP1eAGNTjFid3lFUyG6
 xKUIygKNxr8EOc8d1x2NLovZy8py5ys+F1QOrhNu5ib6kS8vTA1n72OfJTOYsAfiI8JKj1yDzWB
X-Google-Smtp-Source: AGHT+IE2Uyiif0c307/vCY2Q92x95kblOc8RLzdvEsU/fgTYE7ZZRpnEaivdJZIwndEDSW8vWdJ6cw==
X-Received: by 2002:a6b:7013:0:b0:83a:943d:a280 with SMTP id
 ca18e2360f4ac-8447104de28mr752499339f.1.1733499957480; 
 Fri, 06 Dec 2024 07:45:57 -0800 (PST)
Received: from inspiron7620plus.lan ([172.59.229.198])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e286107f16sm871317173.21.2024.12.06.07.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 07:45:57 -0800 (PST)
From: Guy Chronister <guyc.linux.patches@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@gmail.com, Guy Chronister <guyc.linux.patches@gmail.com>
Subject: [PATCH] drm:panel-orientation-quirks Added DeckHD support to panel
 orientation quirks for Steam Deck This commit introduces a new quirk to
 handle specific orientation issues for DeckHD panels on the Steam Deck. The
 quirk ensures the correct display orientation for these panels,
 enhancing the user experience on Steam Deck devices. Tested on my Steam Deck
 to ensure reliability. Feedback and further testing are welcome.
Date: Fri,  6 Dec 2024 15:45:54 -0600
Message-ID: <20241206214554.219-1-guyc.linux.patches@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Signed-off-by: Guy Chronister <guyc.linux.patches@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3f2e2b851cbc..c412273799cb 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -456,6 +456,13 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
+	}, {	/* Valve Steam Deck (Jupiter) with DeckHD */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Valve Steam Deck (Jupiter) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
-- 
2.45.2

