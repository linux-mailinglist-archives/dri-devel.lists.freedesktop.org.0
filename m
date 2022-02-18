Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4944BB6D6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E0E10F2A8;
	Fri, 18 Feb 2022 10:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FEB10F2A8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 10:27:06 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id d16so7439010pgd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 02:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WRUQ/0ItbuB8Qd5eXwqs349lFDwlCtd3M661qIRr/M4=;
 b=mD47QKPrM8oJIUo+2zfGME4E/z+r0q6UB4rPJC0A6e/1sP61wyq8JjzZTfaYqLg4rz
 zd65wHk4j7xCrbUkA63r2cUWBIhpqDDoGnOSTYKw5oCCoagzg4Uqi3nupCr01pI8Hhoe
 dnkIkfcyAq1Jw/P3GfeRMAcg0qcIt4iMYFk5U5lhfPwHO9PIeCFqCoIZZGEkVGK6/9M2
 2lm/NmFLQZnk3UxhW0e/e6IpSFLR3fmpMbpq119M4eDA+HiVSWB/mJq4c22JzFXSYBfE
 FPSBE8ECWtRW1t1C/IJEqg7WBygiBLKNvhJfFnvQKMarWipClLIx9u8HmQJr60EbcD7H
 JP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WRUQ/0ItbuB8Qd5eXwqs349lFDwlCtd3M661qIRr/M4=;
 b=wkn30H94cQDGQKax7rsDa9g9cCtI4NUWQY2Z75O0esGondA5qxRpd7w0yuDRwzy29T
 24Y5Wr3CnlXVyza0EDFMXYNGg4MFvCaYrMHMuuIUY59ktlbhaXAlxsx+P0ljLWvRSAFf
 gAdj4R8puD5gepkr/KynTqLAP8nsTRjZeHZp0ks/PhDg29y4Y5kkjPRTJEOqbbWpKW6c
 he7zw0rgtsDk3fsTPEqmaaRuaVrJDt/A1WpLaWgANSDOjDWqodnfLXXXWmaIo+aikPJp
 +U9MoTFMgzWsUVu9h13OR9+Af2dyANo2gOqQNNMt4V3FKAKqbYsYXTrIc0P11lzNUmSP
 JHBg==
X-Gm-Message-State: AOAM530jRFW8Q3bMXjycarm5DKxrJHLfs60DTfdyDt78jOOfgKw/B6I/
 FSpvoxkciQ5DeaU7hXvXpWs=
X-Google-Smtp-Source: ABdhPJzspd9NuP5bL32rgfy620IWs+rzFnjNv77U9r9eEoNmSQhxtq+FlWo92HmBLKkzXmlR4I4Wcg==
X-Received: by 2002:a63:a501:0:b0:372:f7dc:6ced with SMTP id
 n1-20020a63a501000000b00372f7dc6cedmr5871183pgf.26.1645180025700; 
 Fri, 18 Feb 2022 02:27:05 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id r14sm2411481pfl.62.2022.02.18.02.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:27:05 -0800 (PST)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] drm/panel-edp: Add eDP innolux panel support
Date: Fri, 18 Feb 2022 18:26:47 +0800
Message-Id: <20220218102647.1634329-1-rexnie3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 hsinyi@chromium.org, Rex Nie <rexnie3@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 14" innolux,n140hca-eac eDP panel.

Signed-off-by: Rex Nie <rexnie3@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f7bfcf63d48e..f5f9c9cb26ba 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1330,6 +1330,29 @@ static const struct panel_desc innolux_n125hce_gn1 = {
 	},
 };
 
+static const struct display_timing innolux_n140hca_eac_timing = {
+	.pixelclock = { 72600000, 76420000, 80240000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 80, 80, 80 },
+	.hback_porch = { 190, 190, 190 },
+	.hsync_len = { 60, 60, 60 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 6, 6, 6 },
+	.vback_porch = { 38, 38, 38 },
+	.vsync_len = { 8, 8, 8 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
+};
+
+static const struct panel_desc innolux_n140hca_eac = {
+	.timings = &innolux_n140hca_eac_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 309,
+		.height = 174,
+	},
+};
+
 static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
 	.clock = 206016,
 	.hdisplay = 2160,
@@ -1750,6 +1773,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,n125hce-gn1",
 		.data = &innolux_n125hce_gn1,
+	}, {
+		.compatible = "innolux,n140hca-eac",
+		.data = &innolux_n140hca_eac,
 	}, {
 		.compatible = "innolux,p120zdg-bf1",
 		.data = &innolux_p120zdg_bf1,
-- 
2.25.1

