Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738DF2F4625
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A6A6E0EF;
	Wed, 13 Jan 2021 08:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7532894D7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 18:14:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u25so4801248lfc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 10:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhvpCXfXEGgbj1XNgFmk5csruT29p6F6IHATsZnGuB0=;
 b=saLNy4wrApcawB8BTgH8PDwcACYsJuO/sT58oEcMHmB4ix9U67QEkcsamzOrZC4Q98
 frmIKv2vNJ8d0ftt7CNMI7Eu0BKxAdQbKEcj0bXnhaxpq8ioPo0FoPD30dVroRE4+lgE
 BDGDQ3wuvILPrfsieF1PeRPJj1e2PtkHlvoeb+BImaqxp2/1QZ2O5WtnY0znouqcWBxw
 RdDAko/K6AT9ZlqYNdVY92fIjcUKXzdid8Cdw/Qit8+ceS7nCxHu8F0s0rjn+w1Pebr+
 Pq/ANxpHexVKXru4Es9hYpLBxtKtpadOOogkLu2Q0rLX9MvLc8z5tQHCEvN/ZU+wVCcd
 vVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhvpCXfXEGgbj1XNgFmk5csruT29p6F6IHATsZnGuB0=;
 b=DvuJpVb1bx8DOEb8V6zz6iVgLv+YPC8ql66CIs1XQxaV+vR+SJ3oEW14DQ/Ul2VtX4
 E5mbziRaTDCAaKZgW4cm2WZ4jG1iIDBlRzOAvR1Zqprneq31hIcFeMK9YJ2jOhtcLhrl
 5DC1y7whhoXCGKODC9/EO0kF+O9ootOF1eWMBT0GBqND7kD7taS2AVrZXXE5LXProvXg
 mYoPned5mNy8PG+uzdf8X1HM77QRntAI2Gc/IJUMOyxBNEs8HVgasA4be4qwWLZorItb
 5g7qaPauur0uY2YT2yIsgWv7FtUxfh52wSXrTNtsNY5NXZrPt2hFEiqc8sfpFrsA1ktD
 rTYw==
X-Gm-Message-State: AOAM531kKeybKrtHTxRycNsTTMCKwShaNOcKIG5ZLfOaOtI/cSOhSmxH
 HnE5sQsLnQX/Rz2Xip6SrZE=
X-Google-Smtp-Source: ABdhPJx49e3mU5MGwu0rz7h3L5r7xsREqFiHciTjzQWB50fOLe08nTBrky2LB3Y0lLMj+cm0VdI+fg==
X-Received: by 2002:a05:6512:21a5:: with SMTP id
 c5mr64558lft.423.1610475293102; 
 Tue, 12 Jan 2021 10:14:53 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id r8sm417420ljd.140.2021.01.12.10.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:14:52 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v1 3/3] drm/tegra: gr2d: Add compatible for Tegra114
Date: Tue, 12 Jan 2021 21:14:21 +0300
Message-Id: <20210112181421.21293-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112181421.21293-1-digetx@gmail.com>
References: <20210112181421.21293-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tegra114 has GR2D hardware block, support it by the 2D driver.

Tested-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c  | 1 +
 drivers/gpu/drm/tegra/gr2d.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e24e05a47197..47e7945dbc3b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1318,6 +1318,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra114-dc", },
 	{ .compatible = "nvidia,tegra114-dsi", },
 	{ .compatible = "nvidia,tegra114-hdmi", },
+	{ .compatible = "nvidia,tegra114-gr2d", },
 	{ .compatible = "nvidia,tegra114-gr3d", },
 	{ .compatible = "nvidia,tegra124-dc", },
 	{ .compatible = "nvidia,tegra124-sor", },
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index f30aa86e4c9f..adbe2ddcda19 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -161,7 +161,12 @@ static const struct gr2d_soc tegra30_gr2d_soc = {
 	.version = 0x30,
 };
 
+static const struct gr2d_soc tegra114_gr2d_soc = {
+	.version = 0x35,
+};
+
 static const struct of_device_id gr2d_match[] = {
+	{ .compatible = "nvidia,tegra114-gr2d", .data = &tegra114_gr2d_soc },
 	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra30_gr2d_soc },
 	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra20_gr2d_soc },
 	{ },
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
