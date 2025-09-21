Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B464BB8E546
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 22:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8555110E169;
	Sun, 21 Sep 2025 20:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SaQFBZVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6F210E004
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 18:38:28 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-267fac63459so34688325ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758479908; x=1759084708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FG8Bt7npKalhz1su7W/I5V9S/1CafpuEGaa5DL+2Qi0=;
 b=SaQFBZVE2Wmpp3fDuRP9Lqct9rDSh7s5Jsl64pgLz1SpnixIM0emJj7Ef3a6MBcCZu
 bOsL57PyIMCo3G8NWYobnVJnSKqqYGWNP+jOOTE/vNeYpoIovyjAZ2qtFK5YBtI/Jl3m
 yLAIW8SvxWJ0JVDTM0s5eRM9XSS6KjyY+9rfEkCrbM6vhAYOZi/9eaImTsNgja5RRbFU
 DwE2txBGk37IkP7Dikogl40DduALFHXejKS7lqcc8cigQLV8Woxl7TiQCSICZwWdjT1r
 NikulBIi8yXmEmnwykvCgN73OoEt3bV/feocexJHVx/qsw9YrCdw527cxBotC1pODXL5
 cZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758479908; x=1759084708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FG8Bt7npKalhz1su7W/I5V9S/1CafpuEGaa5DL+2Qi0=;
 b=OCMbAjeP55ZLtu3AFt2WQpWHnggRi9A9v2LaEPJO4/AOoPudPws0rp1qJruI6x9TAb
 1scAkMK6QbORyuH5t1cEXeO/jU2DEs+OguPoXx6HM5hIYztjdnhx/3UR04hT4jwK04AB
 iztDrctRJpGXqK4goLMA/R82BwBmsOIhNc8dztY6qBW2nFede0ZIa6isbtAoIpc1dkmc
 nINMB9pKhkfLi7I5hbTThUyiJeUnuby0DIkpH7H8x8qusUN8L86W5itygcka/JBzEmLx
 WVQPEFYIQ4h2XO8lToYPMrFrV3P6xUW13eEhREueURTlK60VWfCz0ioqyEw6GWMEcjWT
 8VcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcsFGJYaAf8r3FDkjVoCx7s7jl9f2RtUby/tCixyQ9Ye/gJkHIwdnS1YFUCtopZTwsZTbUf8BUyk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiMd0mEaU87L/0nmiNAJfa7hq1lvH7s5VjJYRYZuaWk4uTxz1B
 YyD6zIX7t1DaCNCCIslgFMJpNJBcr9dESGtNXvOtnkcxIGz70Wre8n5p
X-Gm-Gg: ASbGncsTaC+X20S1amf+op8OwOFl9YTTHRv7c0cfCuf4G2SoUbDc3vn6GNw5YOa5mIA
 T7j9xrH7DQ5evo/jGGuqSRf5asKtQbgt9lURhnef/FKLzZ1kgCezb4KgOewyD1Bo9JsuSYbs+hl
 8suookDDdJlg/oJAAiNSyASt5s4l+lQ1xqCu80Uem54vwF+H6NAfdrqoacmJsooRczNhDUVHqPR
 m8RQwIRKajKPt44PCX0/m0//Ptx32e3stjTm9TeL5kX/Ta3p9fat0ocfNkOLti0fA+kp3Vu+BK2
 ZjDp/sUJxBbIyT3fQqs8k4vLuEE6pj5432ufyNksdeepSEyTty753xzV5GhlokhPggTd0O46Ifl
 5RrqLtlYTPnAB0wrRQA==
X-Google-Smtp-Source: AGHT+IGVujox0fyaNT3MucK6Cw+loJTsxMamdU8PPqz9OPA70Qfq4hxxfxRZjg3jA0wAYGw/vNjnww==
X-Received: by 2002:a17:903:183:b0:268:1623:f8ce with SMTP id
 d9443c01a7336-269ba40dccdmr118789165ad.10.1758479907783; 
 Sun, 21 Sep 2025 11:38:27 -0700 (PDT)
Received: from fedora ([45.116.149.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802dfcbesm111053795ad.88.2025.09.21.11.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 11:38:27 -0700 (PDT)
From: rtapadia730@gmail.com
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jessica.zhang@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net,
 Rajeev Tapadia <rtapadia730@gmail.com>
Subject: [PATCH 1/4] drm/panel/lpm102a188a: Switch to
 mipi_dsi_generic_write_seq_multi()
Date: Mon, 22 Sep 2025 00:07:18 +0530
Message-ID: <20250921183720.237761-2-rtapadia730@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Sep 2025 20:27:20 +0000
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

From: Rajeev Tapadia <rtapadia730@gmail.com>

Replace deprecated mipi_dsi_generic_write_seq() calls with
mipi_dsi_generic_write_seq_multi(). This avoids hidden early returns
and matches the direction of other panel drivers.

No functional change intended.

Signed-off-by: Rajeev Tapadia <rtapadia730@gmail.com>
---

Question for reviewers:
In this patch, I switched to using mipi_dsi_generic_write_seq_multi().
Currently, if both link1 and link2 return errors, only one error is
reported via accum_err. How should this ideally be handled? Should we
report the first error, the last, or combine them somehow?

 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5f897e143758..982cb61849a0 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -162,27 +162,34 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
 static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
 {
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
+	struct mipi_dsi_multi_context dsi_ctx1 = {.dsi = jdi->link1};
+	struct mipi_dsi_multi_context dsi_ctx2 = {.dsi = jdi->link2};
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
 	/*
 	 * Change the VGH/VGL divide rations to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
+	if (dsi_ctx1.accum_err < 0)
+		return dsi_ctx1.accum_err;
+	if (dsi_ctx2.accum_err < 0)
+		return dsi_ctx2.accum_err;
 	return 0;
 }
 
-- 
2.51.0

