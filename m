Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C013895F652
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 18:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C99210E246;
	Mon, 26 Aug 2024 16:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="feAsw+cP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265B410E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 16:21:01 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-268eec6c7c1so3214034fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724689260; x=1725294060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0AslJABVo00gPblnVR8gYUn7zUqkgg9WhvvpyeH5H28=;
 b=feAsw+cP0c2D7j29qLh7XzKYhttyBIM5e7sv5hiwbx4B4BD+zbVK0Wm9fl7VqziSX9
 lNM44kPQGrOkET3PFvgPToW0O77rjO87R4f6XV5uEBqKQ14cJKmMGKPKGKvBwtkh1FaK
 Zpcmf2cn26IQbRDXxqs9VmCzzvOCTHhhD3UG8lbWrKyk+X/fdaponXbYYD1IyVosVSNc
 piGWHMQ9rYIu/V///DLg7JP24+4G9eOTK6HoFlVQ5HAbT43PCKwQGMO5/z+SuNlMJjaj
 f24TgN/69N8+XtUyFUjGxZFg7yrlPGeZXwco3ma7JSLOnZlCvashjvLsRIkFakZNacfd
 +Nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724689260; x=1725294060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0AslJABVo00gPblnVR8gYUn7zUqkgg9WhvvpyeH5H28=;
 b=aekrW9Ia0qh6Mti1oqBOyCtye+t2BVRQ6u8YhqRB/mg+kcaES6FQepBWnCSYzYrdPF
 3bF1xTcKdYzFUkvpQ08SsZoYB0Fji15OxNb//xGhM7KvoqRqjuDbdvxE9iDVqh6cjE+d
 V8ubdIfud8u12zpQ4ujeFQok8wqBLb7MnCrzA/dRoBW8KNEGIdY0hQqXU3AzbCpHyejY
 x8jslAGHIsvAefT4wo8YyHeAVwQHyQKI+yiV2oZMtPeqCnIvUN8hTKBw2NcCEqPbk/KG
 FkvmtkQzTcpeXDh6K9qsS9lN/7FT2P3Dhk70NIt167ZiIZGGqFcjM+7+ZRT0tnnLdXQb
 in4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlp8gJkC+Hm6HZB3UOq3PkShO+766hbqo/NKt8dciN+N+HLJ2spM9ApSrquvTUoD6lVGZSkbFSo24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1vIXu19ewwXGt2ipVzwSrOKRpgY+IdSRCmkAXSaPy96f0uKOu
 ArPIPsOzscgj/mrDA2E7o9v1Zj3BO5H0kBY6EzrTMdt5PV/KX+b9
X-Google-Smtp-Source: AGHT+IHmikhzl0qq17V3DT9TnvIBp3tik8f35GSxDiprCSyIs8GKTKsExxUf5g1DWQ+fSIxEePrWcg==
X-Received: by 2002:a05:6870:2250:b0:261:142:7b95 with SMTP id
 586e51a60fabf-273e654b961mr11669552fac.25.1724689260094; 
 Mon, 26 Aug 2024 09:21:00 -0700 (PDT)
Received: from embed-PC.. ([106.222.235.177]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9acdb54asm7830742a12.42.2024.08.26.09.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 09:20:59 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: agx@sigxcpu.org, kernel@puri.sm, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: mantix: Transition to multi-context write sequence
Date: Mon, 26 Aug 2024 21:33:28 +0530
Message-Id: <20240826160328.12685-1-abhishektamboli9@gmail.com>
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

Replace deprecated 'mipi_dsi_generic_write_seq()' macro
to 'mipi_dsi_generic_write_seq_multi()' macro in mantix_init_sequence
function.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index ea4a6bf6d35b..f276c65cc9bb 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -49,22 +49,25 @@ static int mantix_init_sequence(struct mantix *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct device *dev = ctx->dev;
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = dsi
+	};

 	/*
 	 * Init sequence was supplied by the panel vendor.
 	 */
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);

-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0xA9, 0x00);

-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
-	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
 	msleep(20);

-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xA5);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
 	msleep(20);

 	dev_dbg(dev, "Panel init sequence done\n");
--
2.34.1

