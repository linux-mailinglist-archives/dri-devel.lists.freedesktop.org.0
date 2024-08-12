Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E7C94F5A5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 19:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F87410E143;
	Mon, 12 Aug 2024 17:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KxY1MpbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D6310E16E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 17:11:33 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1fd78c165eeso36116215ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 10:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723482693; x=1724087493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JLVMznJSLt/JlEkp0OXnrYKaDgBuNrpLyNsFl4Y6DAA=;
 b=KxY1MpbZFKRaEuVKpBaGogzZJF479M3CBUMQiuhH+qBuHQb596Z/OcODBPwt6YiXkX
 OVWT+8nQvqawu9J4hhoU73twiliAuVBOzX6BFe7xx0pSsAaXKKO+HsByxeLAgnce03HG
 wGiPMw/jENf7ee2IMBGOpW+xDYTAG7l06/fbWBhRDll2oestGXCmqNO8WQeqTrJLThs1
 OVZSTLg8x2e6qDCGHtYf0WQUUwV2MtZLOHH98t6RHlX8V52bdah7vNr2I5YOQotzgWyg
 OwfEb1ofwa0TZ/tIcBes53JvUlQiQlH6HnzkFtW1VFlD27aCoKsijxOW3BDi7jx9YZJS
 wtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723482693; x=1724087493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JLVMznJSLt/JlEkp0OXnrYKaDgBuNrpLyNsFl4Y6DAA=;
 b=IAJlroXKYy2GJeKZ+mX6nPXntYaVi3B7EE1E/6GF4gsfYB9cPMJI+PW54mrPFtcVNH
 wb4rl+SQ6i75Hdm7zOdpAqMlXRpE7+5ygHwUWj3rmtWbKLC28uwO19f3jTottPqZmqH0
 bJwhPle4xrfaaasKDIy07F2nCVeVpQK2DsDDFp85VXgPO/dROvax0ctugE8v9yZLkxBs
 XA142v6JyjOy7BYlPZJgo9bJc9OO1cd/LLP6o8I8Ll7mlBcElYDln5y80CkcIZ70/xTp
 lmiI+3eIDqQdw6oUdk0quXEwMgtdkDmAzTPiKfHVl77rxaVxq+J2QlTb+lUK33M8oovN
 S7NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPvjd+UofW+in51rtYLEzJ9fEvlSxeKD5S+cvSIA4bJiGOywRiRbP072FbDlRvOXWDls4AyD17snU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKR9TQi6ZOSBR0407Kc6H9KxdUdlUui98Q6N9/EOeg0fimOr/U
 ErELL7R3fNVwaNgJTDtQdUBjZuKq7Hkz6IVhTQXr5ojpz1CirPpv
X-Google-Smtp-Source: AGHT+IELEK6p5g611Ie65ft5OPx5Mcq5RXC0yVwYjMfCBbR99xO2ydlSWcoM5PsEkzp0Bznrw0ZmbQ==
X-Received: by 2002:a17:902:ec86:b0:1fb:779e:4fd0 with SMTP id
 d9443c01a7336-201ca1a246dmr9679275ad.24.1723482692871; 
 Mon, 12 Aug 2024 10:11:32 -0700 (PDT)
Received: from embed-PC.. ([122.177.118.36]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bbb3a270sm40264765ad.279.2024.08.12.10.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 10:11:32 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: ili9341: Add comments for ILI9341 register
Date: Mon, 12 Aug 2024 22:40:19 +0530
Message-Id: <20240812171019.561321-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
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

TODO : Add missing comments for ILI9341 register definition.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 775d5d5e828c..cba6a6952568 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -121,19 +121,19 @@ struct ili9341_config {
 	const struct drm_display_mode mode;
 	/* ca: TODO: need comments for this register */
 	u8 ca[ILI9341_CA_LEN];
-	/* power_b: TODO: need comments for this register */
+	/* power_b: Power control B (CFh) */
 	u8 power_b[ILI9341_POWER_B_LEN];
-	/* power_seq: TODO: need comments for this register */
+	/* pdtcaower_seq: Power on sequence control (EDh) */
 	u8 power_seq[ILI9341_POWER_SEQ_LEN];
-	/* dtca: TODO: need comments for this register */
+	/* dtca: Driver timing control A (E8h) */
 	u8 dtca[ILI9341_DTCA_LEN];
-	/* dtcb: TODO: need comments for this register */
+	/* dtcb: Driver timing control B (EAh) */
 	u8 dtcb[ILI9341_DTCB_LEN];
-	/* power_a: TODO: need comments for this register */
+	/* power_a: Power control A (CBh) */
 	u8 power_a[ILI9341_POWER_A_LEN];
 	/* frc: Frame Rate Control (In Normal Mode/Full Colors) (B1h) */
 	u8 frc[ILI9341_FRC_LEN];
-	/* prc: TODO: need comments for this register */
+	/* prc: Pump ratio control (F7h) */
 	u8 prc;
 	/* dfc_1: B6h DISCTRL (Display Function Control) */
 	u8 dfc_1[ILI9341_DFC_1_LEN];
@@ -147,7 +147,7 @@ struct ili9341_config {
 	u8 vcom_2;
 	/* address_mode: Memory Access Control (36h) */
 	u8 address_mode;
-	/* g3amma_en: TODO: need comments for this register */
+	/* g3amma_en: Enable 3G (F2h) */
 	u8 g3amma_en;
 	/* rgb_interface: RGB Interface Signal Control (B0h) */
 	u8 rgb_interface;
--
2.34.1

