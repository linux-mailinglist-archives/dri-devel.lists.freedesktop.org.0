Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B86DA3649A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A5810ED1D;
	Fri, 14 Feb 2025 17:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J20r7XoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD9910ED1D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:30:29 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-220f4dd756eso15980895ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739554228; x=1740159028; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJYNUML0MGQT9wXkxrbGgMrZtvn5S8KShebTQWoG8yw=;
 b=J20r7XoFRshrVME4kufPNF5xW+2bZZKA/jhp5CbkwmGKK5qPEHW7qYAsmAqGeGbw/i
 GNPBjdU0/bvmjiH0mcfFABf7nv+O1Pm6PqdK+jSg0u13l6amrGK/hqnMndvtu3BDke6r
 yQFUGxwnZcoBg26ElXPRdjY7CwdwUBASpN9axWbm6d+hIerY0mPf9HZAB6iLYO7KWun8
 DPPPeCgofsEZejUTBA97LKXXDAE+qbzhVXbZoLWeu2l4CyRJ/FRXSuE8iInsosHgybSm
 RkDb9xtQiuDB2cq45vosxmWO2TOTYYXd+JEuVl1KwGk+2AxKAiaxJr2sAqVlQJXB3Zwj
 IU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739554228; x=1740159028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJYNUML0MGQT9wXkxrbGgMrZtvn5S8KShebTQWoG8yw=;
 b=TqSgMHowb9YQDz6OhB/jWyud/Bx1QN5nKbIOAAQAV+RKbT8gBdhMuumYuxpqF6+dnc
 tkZ2o7KhHuIxhbk0yyGzJfepMU2v/qbbsA2Tjcb6VOG8b5Sf+72VwmDTmy2fObMxu87N
 gj5cToLXAxl5jCJH1mllPKCiearskxpSUNDud6fl9Nzp41uQEGn+eCiwLPuyRosASl4U
 rF7W7LbZU+wyFB2VmDIQhpn32dZRosiOuHIkcGl8CLCl9U04QVkCN/XZGlX2pgATlXRe
 BLj54lyL1B4tBcWCfM20ihAgWsVTZr2OL9lN4/TiYkm9o8lda4Gf/b6bCe+kc6PXDxBe
 90Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeZmTucJtCG8fzOt/FbgwvOZHbdTO7Qh4a0ucCqIlqydFJX/njwY+amLD02qURZ05IyhMLE+jEG/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyzpe1pfQ7f6Lfk1aJAao2zf9TUxjAsN93ZUhnCz2rMdpRR9eE
 Gh6IN+unWeEUXVrX4YBO0kJxl0IH/TXtxLR49Yr2DU9ssr9GadJ3
X-Gm-Gg: ASbGncsFjotfsD1CdxVdlbaEPa4lg9q1RQ9qyifnVVuecDpyvAmrxn3ixY4Lb//Acmj
 RAplQnm8LMdELqixprtFLgn+hAtqhjiK7yBCMZOsTUkZKecEoW1u+cQ+xj+Y6KPeLIedIarGKrF
 fcvTSp3VGG+J8L37tWZM9PidtybNkPcQp2yC0REpW9s/6ZutbW0COIGMC6KoGPDGR3spqD/7PO5
 4I8VyiE7X2aVCts2XuFk+LCT3dfDeegoCD9lDenpxH1JavX950uXoFdorXFRNtLq9NWAXBVWN8c
 KaH0Y6iGwEMK2J+j5r8DfiJoCpLSK9lCFA==
X-Google-Smtp-Source: AGHT+IGRkAOywRNji7tmotJx2ENcSkoDdiOXtImZCqPHJSs6Zt+vtvGSgMvUaBHElRF2eP2aIEIdSA==
X-Received: by 2002:a05:6a21:6e91:b0:1ee:321b:313b with SMTP id
 adf61e73a8af0-1ee8cc16c14mr490265637.41.1739554228635; 
 Fri, 14 Feb 2025 09:30:28 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adcc6fb20f8sm1355138a12.37.2025.02.14.09.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 09:30:28 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 1/2] drm/mipi-dsi: Replace mipi_dsi_dcs_set_tear_off with its
 multi version
Date: Fri, 14 Feb 2025 22:59:57 +0530
Message-ID: <20250214172958.81258-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214172958.81258-1-tejasvipin76@gmail.com>
References: <20250214172958.81258-1-tejasvipin76@gmail.com>
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

mipi_dsi_dcs_set_tear_off can heavily benefit from being converted
to a multi style function as it is often called in the context of
similar functions.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 42 +++++++++++++++++++---------------
 include/drm/drm_mipi_dsi.h     |  2 +-
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 5e5c5f84daac..2e148753ea97 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1265,25 +1265,6 @@ int mipi_dsi_dcs_set_page_address(struct mipi_dsi_device *dsi, u16 start,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_set_page_address);
 
-/**
- * mipi_dsi_dcs_set_tear_off() - turn off the display module's Tearing Effect
- *    output signal on the TE signal line
- * @dsi: DSI peripheral device
- *
- * Return: 0 on success or a negative error code on failure
- */
-int mipi_dsi_dcs_set_tear_off(struct mipi_dsi_device *dsi)
-{
-	ssize_t err;
-
-	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_TEAR_OFF, NULL, 0);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_off);
-
 /**
  * mipi_dsi_dcs_set_tear_on() - turn on the display module's Tearing Effect
  *    output signal on the TE signal line.
@@ -1713,6 +1694,29 @@ void mipi_dsi_turn_on_peripheral_multi(struct mipi_dsi_multi_context *ctx)
 }
 EXPORT_SYMBOL(mipi_dsi_turn_on_peripheral_multi);
 
+/**
+ * mipi_dsi_dcs_set_tear_off_multi() - turn off the display module's Tearing Effect
+ *    output signal on the TE signal line
+ * @ctx: Context for multiple DSI transactions
+ */
+void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t err;
+
+	if (ctx->accum_err)
+		return;
+
+	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_TEAR_OFF, NULL, 0);
+	if (err < 0) {
+		ctx->accum_err = err;
+		dev_err(dev, "Failed to set tear off: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_off_multi);
+
 /**
  * mipi_dsi_dcs_soft_reset_multi() - perform a software reset of the display module
  * @ctx: Context for multiple DSI transactions
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 94400a78031f..bd40a443385c 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -346,7 +346,6 @@ int mipi_dsi_dcs_set_column_address(struct mipi_dsi_device *dsi, u16 start,
 				    u16 end);
 int mipi_dsi_dcs_set_page_address(struct mipi_dsi_device *dsi, u16 start,
 				  u16 end);
-int mipi_dsi_dcs_set_tear_off(struct mipi_dsi_device *dsi);
 int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
 			     enum mipi_dsi_dcs_tear_mode mode);
 int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format);
@@ -379,6 +378,7 @@ void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
 					 u16 start, u16 end);
 void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 					  u16 scanline);
+void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 
 /**
  * mipi_dsi_generic_write_seq - transmit data using a generic write packet
-- 
2.48.1

