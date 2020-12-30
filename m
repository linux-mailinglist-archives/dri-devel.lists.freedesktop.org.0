Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2102A2E7F69
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 11:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D7C89B0B;
	Thu, 31 Dec 2020 10:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570A89817
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 15:17:25 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id w1so22226180ejf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 07:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tN9R7XEuR/MI9VKQRuMKlkJ4/z1wACtnnnmm4C2QvRs=;
 b=U0FYCGHWsbgYU6cVFVNaMtyKIm1tExUy1jpoAGvYcHCBx4bwWJoRjzLDVDm5a8NfzM
 Q4db910XAPgI+b3a89f+Aws1ZyenFv5SVF7B+p9iK6g9hH9LgMqkcFM7YLEYaUX52wNS
 Yq4WRBxUOTxYisGf4gLEPHPMFaVhIpQAuAhrNZgV1Sdt7rPT6VUBCqyuLcGcNPTBpw02
 xDXq/DI/ShXE0YCVksdkrW04bVugJBSgLNzd9O76vYk4OnO9MzCoifKEUB/XcrGdKkbj
 hfQuphlgvHHo0ytc3nUM727aYikz22bWM0ir6xDb/25oZ2esgs5/mkumAF4tcjarYTaf
 IO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tN9R7XEuR/MI9VKQRuMKlkJ4/z1wACtnnnmm4C2QvRs=;
 b=QfOoVE4gLH1TGREhyFXmtZ4d2hz7ouOxdF16Rwv/LaRt4FEskosVxZd+K7HNgdn5jZ
 WEQ56LIRKKZegg0o+nkcV1ccXPSIJss5AvNws+M2Q/NGfiPT9zKIZdLim5xg7WFFuc0l
 Ju+AuAD+K/s6R2IfbHZid1j0+fYKsNDd3mIjnNvIyHr0Kc1oU4xLLPzwUaHLPJron3kX
 oofb4a8+gQvz1jP4fWYNrBwT2bFt2roQm0cs63+5vwx2fVGL4V5P8g1BIrk9LDjrQa9k
 5yTg0fRWH8TQbTuY0HIXZurU6NF/5rnjdLmNyeTa7JSLIIvgdSBEAggO8VhCT2Kl0XGc
 x0Ew==
X-Gm-Message-State: AOAM533vUBOrXtPFIWzJa/JhMoEfkd8gHx3mtr4PlxpYDxGbUffbyWlr
 ThURdQXkzEkfUcfaJmopNs4=
X-Google-Smtp-Source: ABdhPJy5CVgXNzWxBNFzhz6ipQehWwMHs78M3LRkZeGND5vm1dqJp9fWwUBfN/eHLLSv/BesAzCA3A==
X-Received: by 2002:a17:906:f1cc:: with SMTP id
 gx12mr47991397ejb.164.1609341443932; 
 Wed, 30 Dec 2020 07:17:23 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id r24sm38624518edc.21.2020.12.30.07.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 07:17:23 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] drm/panel: simple: add samsung,s6e3fa2 panel
Date: Wed, 30 Dec 2020 17:17:11 +0200
Message-Id: <20201230151711.3619846-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230151711.3619846-1-iskren.chernev@gmail.com>
References: <20201230151711.3619846-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Dec 2020 10:42:13 +0000
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
 Samuel Pascua <pascua.samuel.14@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Samuel Pascua <pascua.samuel.14@gmail.com>

This panel is used on the Samsung Galaxy S5 (klte).

Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 41bbec72b2dad..5f16826f3ae06 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4611,6 +4611,33 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
 	.lanes = 4,
 };

+static const struct drm_display_mode s6e3fa2_mode = {
+	.clock = 149769,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 162,
+	.hsync_end = 1080 + 162 + 10,
+	.htotal = 1080 + 162 + 10 + 36,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 13,
+	.vsync_end = 1920 + 13 + 2,
+	.vtotal = 1920 + 13 + 2 + 3,
+};
+
+static const struct panel_desc_dsi samsung_s6e3fa2 = {
+	.desc = {
+		.modes = &s6e3fa2_mode,
+		.num_modes = 1,
+		.bpc = 8,
+		.size = {
+			.width = 65,
+			.height = 115,
+		},
+	},
+	.flags = MIPI_DSI_MODE_VIDEO_BURST,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+};
+
 static const struct of_device_id dsi_of_match[] = {
 	{
 		.compatible = "auo,b080uan01",
@@ -4633,6 +4660,9 @@ static const struct of_device_id dsi_of_match[] = {
 	}, {
 		.compatible = "osddisplays,osd101t2045-53ts",
 		.data = &osd101t2045_53ts
+	}, {
+		.compatible = "samsung,s6e3fa2",
+		.data = &samsung_s6e3fa2
 	}, {
 		/* sentinel */
 	}
--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
