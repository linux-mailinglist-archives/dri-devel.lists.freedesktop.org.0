Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48346986E44
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE9B10EABE;
	Thu, 26 Sep 2024 07:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PWHf/2pB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3536C10EA9F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:56:45 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-37ccfbbd467so193710f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 23:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727333803; x=1727938603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fs8vGQj6gBPYGtja4mFfGqlu9i7HD+/rnYLvYM98k+w=;
 b=PWHf/2pBvxJdHRMQ0GymWO0zxPkwfe/sQfjP83G6s7n7CAJajbY177Uq0eAAXsdxMA
 GEqXIWhoHa3vLF9+K2rhN3h4KQUOeM4Na69LQwRlp/8SQKJdwT+2BZSbEtYV6WkuIjRy
 mWXYqYTV8vko09zP7epJ8uAY8FS1r/Y+M/lPT7CqHw/y3f8JmLkURRsfNhaJNWSZaY1C
 aiKKcF5keiIFzVgt0QFtDAztAD7CuJS6gTyzsAZ8cU8vsFqtJJufIzj+CG+EteGL8mBq
 C6XaaiS6LIhYSiGVd+WJ1RPpRhlguk8c+zaXJSQjnFZZPhoHlkJ+2UJZGs+g901XK/PY
 nFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727333803; x=1727938603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fs8vGQj6gBPYGtja4mFfGqlu9i7HD+/rnYLvYM98k+w=;
 b=dvnd14AfXXGqPLWVvvYuEglBU3yk6Sh7yrvtasDAkdXX/oBMe74K7Cxu8SOK/sxi2/
 VgGEC0Y8wAmmNleXTWdsjl17TtVoBi0Le2kRfGNHvpcacJ1IY8IzQ+NXDLBcHWtZtRHV
 7cXPR1BywOgpmaEkYJ6T8zomgsbtruxx56AkGl+nPzkkdWeAtSmTV6hQFICjW5RzNnlq
 HAzNG1qY1ULYbP2bkDzJliAFpBcPvlhrBqYPX/YhB11cIaqvW22GNLrNzYXqoeYXEjd0
 L4G4SFZXjn1fWlXdtLBtUp08EbV6dEowxELYe9YMIo6mZDqhZul3MZixWXNPzE8lSM3k
 sGZg==
X-Gm-Message-State: AOJu0Yw9vsq7b2yRsO+JuLakmvjMrs/6FtR8fAByDuiQWidAEGym5Cfw
 fzRdYQXHK1WsPgDIpFFkpL13estZVNsb7yJhFhio8qkkF9sDMZR6gRLWBw==
X-Google-Smtp-Source: AGHT+IGeqpSc7SghOfr2orKEDcvEdA3sTDt7gazYGRdUm9GKsnA3jxGlhQVt8/wfxsd6LjNvnM9C4g==
X-Received: by 2002:a5d:4582:0:b0:37c:cdcd:68ac with SMTP id
 ffacd0b85a97d-37ccdcd6aa9mr1001590f8f.52.1727333802852; 
 Wed, 25 Sep 2024 23:56:42 -0700 (PDT)
Received: from localhost.localdomain (2-230-196-213.ip203.fastwebnet.it.
 [2.230.196.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2a8c2csm5656533f8f.20.2024.09.25.23.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 23:56:42 -0700 (PDT)
From: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
X-Google-Original-From: Marco Rodolfi <marco.rodolfi@tuta.io>
To: dri-devel@lists.freedesktop.org
Cc: Marco Rodolfi <marco.rodolfi@tuta.io>
Subject: [PATCH] [v3] drm: panel-orientation-quirks: Correctly handle rotation
 for DeckHD equipped LCDs units
Date: Thu, 26 Sep 2024 08:56:29 +0200
Message-ID: <20240926065629.206839-1-marco.rodolfi@tuta.io>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Sep 2024 07:54:54 +0000
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

Orientation quirk code take panel resolution into account when
determining panel orientation. Add orientation configuration for the
popular aftermarket DeckHD panel, which resolution (1200x1920) differs
from the standard panel (800x1280).

Signed-off-by: Marco Rodolfi <marco.rodolfi@tuta.io>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3860a8ce1e2d..32582dbdc184 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -420,13 +420,20 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
-	}, {	/* Valve Steam Deck (Jupiter) */
+	}, {	/* Valve Steam Deck (Jupiter) Stock Display */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Valve Steam Deck (Jupiter) DeckHD Display */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd1080x1920_rightside_up,
 	}, {	/* Valve Steam Deck (Galileo) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
-- 
2.46.2

