Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564C495726B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 19:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522B410E346;
	Mon, 19 Aug 2024 17:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E8uCxRnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565D810E351
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 17:52:37 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2cd5d6b2581so3158740a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724089957; x=1724694757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vrl19mqws/+cluViI8m9rcTcYnyGlPjI1zYV7NRxDIE=;
 b=E8uCxRnWWH9xuAJ1h3O4/EXZLQQXH9N7yRv7n51D/SeNaCD++dq5fvB13jQBOxwk59
 ykB2QNvAnjywSbfybOO8RjbMq6cmQi2yF4wYRaEdtM4rw1RHCIpN4Jk7exLzQAxNmwLC
 1nbTIzTIZ45C5urW2+kDLOoPnsnEhNgNm9o9guxPPHUOLet0AM14W3pP6DgXcFuxgwLZ
 gC6WyO/ki/aN/RrbcRXDxZZwVt/pCDakOrbZHK3KH1UsOmAWnpm6PMItwNs5CL40/r7v
 HsWiarjs3/6phw70dEcefnRlMFc3JZnTMD9SJfbedoRNCTgrkj2dMM1EnYvbhp2byZ2N
 RhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724089957; x=1724694757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vrl19mqws/+cluViI8m9rcTcYnyGlPjI1zYV7NRxDIE=;
 b=jW3gThrg2s1jjz7zELouv1feGKt1y9pmtcjaakulmOjlksud0HS2wMlO72jf4CusfM
 ISVYrxIzPm6NSMFI3AW+RnmGACfcIu78x2fC89HNCQ3K6Aydu6elm+VFZj2krbtKyn8l
 yKk5AizWeMeUWblsJkPDewQ8RBJPciKg29jZWEvvYG5o4Li4u8nvBZ36j2vaWsaZ+4zs
 1bEy/zHguDIC2eGHt6NNtqBjrdI/GxAfmhkYF/9WHAlccildj0j32GZs6mlQq440FUuJ
 ywdRFxCQcX1vu5HeYzbBC3CMsm/xdrjcososA4iMpNicPrJaIO38Z1zuQ7e1WYHzQfvj
 aHdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEglWY3FFrvabArmWyy6TJbN+ZstsC6ZeZ/RiiMyMAydU9+0Et2L0YNN34aMmSUgrCrePPCiqyhRrMkCukQfvoWoYt3F7Yqgaot/H0CVhg
X-Gm-Message-State: AOJu0YzMQGaweL2W8CfanoP/2S94HnsctX1dfSc3nQwSef8jSY6mJKF/
 uUt9bhJqYh3KXONLs3M276nyTKH3LvTiPxqD7CKFExw3Js7Vdugs
X-Google-Smtp-Source: AGHT+IHvY5FsJmcFyBLd68H463HEg+9AYFBSgdZgFa0Uo2yp0Vuaagu34O0T61d8e5QdpKKdaRHXNQ==
X-Received: by 2002:a17:90b:234f:b0:2cf:28c1:4cc9 with SMTP id
 98e67ed59e1d1-2d3dfc2ae5bmr10731210a91.3.1724089956692; 
 Mon, 19 Aug 2024 10:52:36 -0700 (PDT)
Received: from embed-PC.. ([106.222.231.54]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3e317527csm7538297a91.26.2024.08.19.10.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 10:52:35 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panel: ili9341: Add comments for registers in
 ili9341_config()
Date: Mon, 19 Aug 2024 23:21:22 +0530
Message-Id: <20240819175122.33176-1-abhishektamboli9@gmail.com>
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

Add detail comments for registers definitions in struct ili9341_config().
Replace TODO with comment for each registers.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Rephrased the commit message.

 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 775d5d5e828c..1fbc5d433d75 100644
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
+	/* power_seq: Power on sequence control (EDh) */
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

