Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23641A54C76
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EB810E970;
	Thu,  6 Mar 2025 13:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GdNRx4iD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E181D10E970
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 13:44:22 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-22356471820so9676995ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 05:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741268662; x=1741873462; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xE2LYd8DGPfS+33XDeN3j7gzDkxlmdOBkk7U/sVg2ac=;
 b=GdNRx4iDaasaPlMQBVeqtHvPETF4KquR40YyHUib1xYvJTBsg+jhYfSEt9XBwNVCcL
 YvecBS3tRSaSMA+zQ+RLh33O8X+UkGaVkQ6jG/tyw7bBhlfBjc9sTDA+7Fye3hS1Cie6
 XgiCYlGkcEXtFbnCSvlobdyqvbAyBMUYgWgszJsrlKfabFLz8BKttuFLQv5g7qTyqHUZ
 8WDa0op+G0IsXI5HSiKidajEfRP4T6mW8UDyjLQdMPKbRGMiyM36Db+CsFmaYAykgY/p
 +bRJtP4ZlDJg18TpsKoTd5+Y69Z9EL2z1YqBtS+9u9L3yUEg6jophjN7/15R/TSm6nri
 UmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741268662; x=1741873462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xE2LYd8DGPfS+33XDeN3j7gzDkxlmdOBkk7U/sVg2ac=;
 b=sYxhxIstytqaHIaQrjP5aNg1MQLDTRXLbqbrr2u5/9nkC1nKsFwfsOBK5LaFOi5rjX
 vPhobLWg0SZ7D7bHiaSHxt2D5ivzsxWW39r1xmvHQf/qwNc/DoC6mDqA7BW8QcxDnP1S
 pxKo0tMRrzJzb7+jhwXKIErLiV7CepcF9KCLl3aeO7ZCNicv27lxYWKCz9rLslWNkpsz
 2ZYxNmIhA9DjK8jBCOPpHDxS/rebDOvj/wJTR4Je+0jR2US7pQ4pAVZkT0t6yve+fe8J
 W3VxkJBZTyFJB+E67ywX464kzCcKF7G0y1Ns5hXda79aoNJGlBlTsZS9y9fbhH9/Y5i/
 N8Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfqPmuWl4qVL/ZuJ7a+ANC8ULuIXTGpjN+Cwq+RWnfZmhSHRRHeS7OFfjEN84jVpdgEkg6Da6t9FM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5LyEYkVfzs1qzxR50I0D2+0wvHMVpdVc/PDW8RlFPFwiygaqe
 A0C+jFNk8c7EFilyAgBeCX1YuI3hcaEHnFCpgy30/IeWZnKPoC11
X-Gm-Gg: ASbGncuIiRIAZvJ6nLV/v1+Xwh4pdkP+PexzkZ/9gaK04YvdEcui9u6/xwKnHI/lzB2
 ShEMVf5tvofgSQNAl94UNgfd3sRp3dal6900O0LVzupC8jTQ5VNxW1VSJmR7AkcNBB7j/rVXKQ7
 OojPyNT9TfApXymJIsB6ULM4bk6mZv0T5xcKOp5k3vAk35BFrBRfc/VTWvRyq6efQuIjROrXTU/
 wznXqinZDV9m4Z59lDgAS8UP1dQ9IX2DbQ+JMHv5c/d6NqKmodLXHQGpp3/xTQb1Ysmo3LldYF9
 NhesmQt9gCCLJfjZR5Hp32LEKl5OZUVQgctMj02g6rr8wxaXhFwMYiJhNUm1xIxyz6SH+g==
X-Google-Smtp-Source: AGHT+IGS2hHCKxvnS/NDqqbREUj9Umiuxmj3qwt7zv6Yc7i7DqFAfec7Bd33PWzmITWLuVGb1GBUhQ==
X-Received: by 2002:a05:6a20:4306:b0:1f3:3112:d204 with SMTP id
 adf61e73a8af0-1f34947e66dmr11058781637.6.1741268661881; 
 Thu, 06 Mar 2025 05:44:21 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN
 ([2401:4900:6299:5965:a0c5:ef57:d9b5:b665])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af281288790sm1038834a12.63.2025.03.06.05.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 05:44:21 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lujianhua000@gmail.com
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: novatek-nt36523: transition to mipi_dsi wrapped
 functions
Date: Thu,  6 Mar 2025 19:13:50 +0530
Message-ID: <20250306134350.139792-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Changes the novatek-nt36523 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++---------
 1 file changed, 823 insertions(+), 860 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index 04f1d2676c78..922a225f6258 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -23,10 +23,12 @@
 
 #define DSI_NUM_MIN 1
 
-#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
-		do {                                                 \
-			mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
-			mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
+#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, cmd, seq...)      \
+		do {								\
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, seq);	\
+			dsi_ctx1.accum_err = dsi_ctx0.accum_err;		\
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, seq);	\
+			dsi_ctx0.accum_err = dsi_ctx1.accum_err;		\
 		} while (0)
 
 struct panel_info {
@@ -67,868 +69,831 @@ static int elish_boe_init_sequence(struct panel_info *pinfo)
 {
 	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
 	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx0 = { .dsi = dsi0 };
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = dsi1 };
 	/* No datasheet, so write magic init sequence directly */
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x05);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x18, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0x84);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x05, 0x2d);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x06, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x07, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x08, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0x45);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x12, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x15, 0x83);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29, 0x0a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x31, 0xfe);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x32, 0xfd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x33, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x34, 0xf8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0xf5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x36, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x37, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x38, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0xec);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3d, 0xe9);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3f, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x40, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x41, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x45, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x46, 0xf4);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x47, 0xe7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x48, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x49, 0xcd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4a, 0xc0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4b, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4c, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4d, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4e, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x50, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x68);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x52, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x54, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0x0e);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x59, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5a, 0xf7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5b, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5c, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5d, 0xe3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5e, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5f, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x60, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x61, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x62, 0xcb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x63, 0xbf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x64, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x65, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x66, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x67, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x25, 0x47);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0x47);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0x47);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1a, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x84, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x85, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x91, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x92, 0x0f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x93, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x94, 0x18);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x95, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x96, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb0, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x1b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x24);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x27);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x31);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd1, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd2, 0x30);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xde, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdf, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x81);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x6f, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x70, 0x11);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x73, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x74, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x76, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x77, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa0, 0x3f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa9, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xaa, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xab, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xad, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xba, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbe, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbf, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc0, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc1, 0x59);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc2, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc5, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc6, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc7, 0x48);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xca, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcb, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xce, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcf, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd3, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd7, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdc, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdd, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe1, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe2, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf2, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf3, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf4, 0x48);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x13, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbc, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbd, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x97, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x98, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x99, 0x95);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9a, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9b, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9c, 0x0b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9d, 0x0a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9e, 0x90);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa3, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x60);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0xc0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xd0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x02, 0xaf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0xee);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1d, 0x09);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x0f, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x2c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11);
-	msleep(70);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
-
-	return 0;
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb9, 0x05);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x18, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb9, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x00, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x01, 0x84);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x05, 0x2d);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x06, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x07, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x08, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x09, 0x45);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x11, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x12, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x15, 0x83);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x16, 0x0c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x29, 0x0a);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x30, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x31, 0xfe);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x32, 0xfd);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x33, 0xfb);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x34, 0xf8);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x35, 0xf5);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x36, 0xf3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x37, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x38, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x39, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3a, 0xef);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3b, 0xec);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3d, 0xe9);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3f, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x40, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x41, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x2a, 0x13);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x45, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x46, 0xf4);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x47, 0xe7);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x48, 0xda);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x49, 0xcd);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4a, 0xc0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4b, 0xb3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4c, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4d, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4e, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4f, 0x99);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x50, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x51, 0x68);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x52, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x53, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x54, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x2b, 0x0e);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x58, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x59, 0xfb);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5a, 0xf7);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5b, 0xf3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5c, 0xef);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5d, 0xe3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5e, 0xda);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5f, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x60, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x61, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x62, 0xcb);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x63, 0xbf);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x64, 0xb3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x65, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x66, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x67, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x25, 0x47);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x30, 0x47);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x39, 0x47);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x19, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1a, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1b, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1c, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x2a, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x2b, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x84, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x85, 0x0c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x51, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x91, 0x1f);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x92, 0x0f);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x93, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x94, 0x18);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x95, 0x03);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x96, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb0, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x19, 0x1f);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1b, 0x1b);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x24);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb8, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x27);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd0, 0x31);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd1, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd2, 0x30);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd4, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xde, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xdf, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x00, 0x81);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x9f, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x6f, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x70, 0x11);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x73, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x74, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x76, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x77, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xa0, 0x3f);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xa9, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xaa, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xab, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xad, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb8, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb9, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xba, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbb, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbe, 0x04);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbf, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc0, 0x04);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc1, 0x59);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc2, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc5, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc6, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc7, 0x48);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xca, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xcb, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xce, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xcf, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd0, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd3, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd4, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd7, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xdc, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xdd, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xe1, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xe2, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xf2, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xf3, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xf4, 0x48);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x13, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x14, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbc, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbd, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x97, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x98, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x99, 0x95);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x9a, 0x03);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x9b, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x9c, 0x0b);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x9d, 0x0a);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x9e, 0x90);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x9f, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xa3, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x14, 0x60);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x16, 0xc0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4f, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3a, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0xd0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x02, 0xaf);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x09, 0xee);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1c, 0x99);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1d, 0x09);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x51, 0x0f, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x53, 0x2c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x35, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbb, 0x13);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x11);
+	mipi_dsi_msleep(&dsi_ctx0, 70);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x29);
+
+	return dsi_ctx0.accum_err;
 }
 
 static int elish_csot_init_sequence(struct panel_info *pinfo)
 {
 	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
 	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx0 = { .dsi = dsi0 };
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = dsi1 };
 	/* No datasheet, so write magic init sequence directly */
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x05);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x18, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xd0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x02, 0xaf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x30);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0xee);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1d, 0x09);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0x84);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x05, 0x2d);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x06, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x07, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x08, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0x45);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x12, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x15, 0x83);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29, 0x0a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x31, 0xfe);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x32, 0xfd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x33, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x34, 0xf8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0xf5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x36, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x37, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x38, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0xec);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3d, 0xe9);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3f, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x40, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x41, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x45, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x46, 0xf4);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x47, 0xe7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x48, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x49, 0xcd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4a, 0xc0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4b, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4c, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4d, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4e, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x50, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x68);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x52, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x54, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0x0e);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x59, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5a, 0xf7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5b, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5c, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5d, 0xe3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5e, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5f, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x60, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x61, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x62, 0xcb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x63, 0xbf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x64, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x65, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x66, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x67, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x0f, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x2c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x55, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x25, 0x46);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0x46);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0x46);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1a, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x84, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x85, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x91, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x92, 0x0f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x93, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x94, 0x18);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x95, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x96, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb0, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x1b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x24);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x27);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x31);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd1, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xde, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdf, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x81);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x6f, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x70, 0x11);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x73, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x74, 0x4d);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa0, 0x3f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa9, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xaa, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xab, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xad, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x4b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xba, 0x96);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x4b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbe, 0x07);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbf, 0x4b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc0, 0x07);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc1, 0x5c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc2, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc5, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc6, 0x3f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc7, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xca, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcb, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xce, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcf, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd3, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbc, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbd, 0x1c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9a, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11);
-	msleep(70);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
-
-	return 0;
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb9, 0x05);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x18, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb9, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0xd0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x02, 0xaf);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x00, 0x30);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x09, 0xee);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1c, 0x99);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1d, 0x09);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3a, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4f, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x58, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x35, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x00, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x01, 0x84);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x05, 0x2d);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x06, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x07, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x08, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x09, 0x45);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x11, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x12, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x15, 0x83);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x16, 0x0c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x29, 0x0a);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x30, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x31, 0xfe);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x32, 0xfd);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x33, 0xfb);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x34, 0xf8);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x35, 0xf5);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x36, 0xf3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x37, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x38, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x39, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3a, 0xef);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3b, 0xec);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3d, 0xe9);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3f, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x40, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x41, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x2a, 0x13);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x45, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x46, 0xf4);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x47, 0xe7);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x48, 0xda);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x49, 0xcd);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4a, 0xc0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4b, 0xb3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4c, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4d, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4e, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x4f, 0x99);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x50, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x51, 0x68);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x52, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x53, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x54, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x2b, 0x0e);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x58, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x59, 0xfb);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5a, 0xf7);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5b, 0xf3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5c, 0xef);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5d, 0xe3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5e, 0xda);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x5f, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x60, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x61, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x62, 0xcb);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x63, 0xbf);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x64, 0xb3);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x65, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x66, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x67, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x51, 0x0f, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x53, 0x2c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x55, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbb, 0x13);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x25, 0x46);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x30, 0x46);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x39, 0x46);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x19, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1a, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1b, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1c, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x2a, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x2b, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x84, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x85, 0x0c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x51, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x91, 0x1f);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x92, 0x0f);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x93, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x94, 0x18);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x95, 0x03);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x96, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb0, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x19, 0x1f);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x1b, 0x1b);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x24);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb8, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x27);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd0, 0x31);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd1, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd4, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xde, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xdf, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x00, 0x81);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x6f, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x70, 0x11);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x73, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x74, 0x4d);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xa0, 0x3f);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xa9, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xaa, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xab, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xad, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb8, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xb9, 0x4b);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xba, 0x96);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbb, 0x4b);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbe, 0x07);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbf, 0x4b);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc0, 0x07);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc1, 0x5c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc2, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc5, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc6, 0x3f);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xc7, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xca, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xcb, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xce, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xcf, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd0, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd3, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xd4, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbc, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xbd, 0x1c);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x9a, 0x03);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x11);
+	mipi_dsi_msleep(&dsi_ctx0, 70);
+	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, 0x29);
+
+	return dsi_ctx0.accum_err;
 }
 
 static int j606f_boe_init_sequence(struct panel_info *pinfo)
 {
 	struct mipi_dsi_device *dsi = pinfo->dsi[0];
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0xd9);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x78);
-	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x5a);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x63);
-	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x91);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0x95, 0xeb);
-	mipi_dsi_dcs_write_seq(dsi, 0x96, 0xeb);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x66);
-	mipi_dsi_dcs_write_seq(dsi, 0x75, 0xa2);
-	mipi_dsi_dcs_write_seq(dsi, 0x77, 0xb3);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
-			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
-			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
-			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
-			       0xfd, 0x03, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
-			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
-			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
-			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
-			       0xfd, 0x03, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
-			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
-			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
-			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
-			       0xfd, 0x03, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
-			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
-			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
-			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
-			       0xf5, 0x03, 0xf7);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
-			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
-			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
-			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
-			       0xf5, 0x03, 0xf7);
-	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
-			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
-			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
-			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
-			       0xf5, 0x03, 0xf7);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x23);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x77);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x0b, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x10, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x17, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x44);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x32);
-	mipi_dsi_dcs_write_seq(dsi, 0x37, 0x44);
-	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x9a);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x42);
-	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x43, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x47, 0x66);
-	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x9a);
-	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x4c, 0x91);
-	mipi_dsi_dcs_write_seq(dsi, 0x4d, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0x4e, 0x43);
-
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 18);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display brightness: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0x52, 0x34);
-	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x82, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0x7e, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x3c);
-	mipi_dsi_dcs_write_seq(dsi, 0x82, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x97, 0xc0);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6,
-			       0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05,
-			       0x05, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x92, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0x93, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x94, 0x5f);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7, 0x55);
-	mipi_dsi_dcs_write_seq(dsi, 0xda, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x88);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x88);
-	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x90);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0xe0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_VSYNC_TIMING, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_GET_SCANLINE, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x48, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x49, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0xd0);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x6a, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x70, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_START, 0xf3);
-	mipi_dsi_dcs_write_seq(dsi, 0xa3, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xa4, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xa5, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xd6, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xa1);
-	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0xf2);
-	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x50);
-	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x51);
-	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x65);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x17, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x86);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0xbb);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x32, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0xc3);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x78);
-	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0xc8, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xc9, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0xca, 0x4e);
-	mipi_dsi_dcs_write_seq(dsi, 0xcb, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_CONTINUE, 0x4c);
-	mipi_dsi_dcs_write_seq(dsi, 0xaa, 0x47);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x27);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x53);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x63, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x66, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x78, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc3, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xd1, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xf8);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xe0);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0xc0);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xf0);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x08);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x5d);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x5d);
-	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x44);
-	mipi_dsi_dcs_write_seq(dsi, 0x92, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x49, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x8d);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x75);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x02);
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x03, 0x5f, 0x1a, 0x04, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
-	usleep_range(10000, 11000);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display brightness: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x2c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x05, 0x01);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(100);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(30);
-
-	return 0;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x95, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x96, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xa2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d,
+				     0x00, 0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e,
+				     0x01, 0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08,
+				     0x03, 0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7,
+				     0x03, 0xfd, 0x03, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d,
+				     0x00, 0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e,
+				     0x01, 0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08,
+				     0x03, 0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7,
+				     0x03, 0xfd, 0x03, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d,
+				     0x00, 0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e,
+				     0x01, 0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08,
+				     0x03, 0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7,
+				     0x03, 0xfd, 0x03, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65,
+				     0x00, 0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76,
+				     0x01, 0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00,
+				     0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf,
+				     0x03, 0xf5, 0x03, 0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65,
+				     0x00, 0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76,
+				     0x01, 0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00,
+				     0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf,
+				     0x03, 0xf5, 0x03, 0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65,
+				     0x00, 0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76,
+				     0x01, 0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00,
+				     0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf,
+				     0x03, 0xf5, 0x03, 0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_LUT, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x9a);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x9a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x43);
+
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 18);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x82, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x97, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6,
+				     0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05,
+				     0x05, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x92, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x93, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x94, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xda, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdb, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdc, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdd, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe5, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8d, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8e, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x90);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_VSYNC_TIMING, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_GET_SCANLINE, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_READ_PPS_START, 0xf3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa3, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa4, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa5, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd6, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0xa1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0xc3);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc9, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x4e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_READ_PPS_CONTINUE, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xaa, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_LUT, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x08);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x5d);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x5d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x92, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdb, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdc, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdd, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe5, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x8d);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x75);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x02);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x03, 0x5f, 0x1a, 0x04, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05, 0x01);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 30);
+
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode elish_boe_modes[] = {
@@ -1063,18 +1028,16 @@ static int nt36523_prepare(struct drm_panel *panel)
 static int nt36523_disable(struct drm_panel *panel)
 {
 	struct panel_info *pinfo = to_panel_info(panel);
-	int i, ret;
+	int i;
 
 	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
-		ret = mipi_dsi_dcs_set_display_off(pinfo->dsi[i]);
-		if (ret < 0)
-			dev_err(&pinfo->dsi[i]->dev, "failed to set display off: %d\n", ret);
+		mipi_dsi_dcs_set_display_off_multi(
+			&(struct mipi_dsi_multi_context){.dsi = pinfo->dsi[i]});
 	}
 
 	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
-		ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->dsi[i]);
-		if (ret < 0)
-			dev_err(&pinfo->dsi[i]->dev, "failed to enter sleep mode: %d\n", ret);
+		mipi_dsi_dcs_enter_sleep_mode_multi(
+			&(struct mipi_dsi_multi_context){.dsi = pinfo->dsi[i]});
 	}
 
 	msleep(70);
-- 
2.48.1

