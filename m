Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C54B2EEAB6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 02:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5E56E5C3;
	Fri,  8 Jan 2021 01:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E922D6E5C3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 01:10:30 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id s15so4790338plr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 17:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xxRssKJ9dAC1Cxvvi5KyIPIbeBOqG6VrSD6Gdw3ud3Y=;
 b=n0zubLTLrm2Wv7t/owFX7AFemCfdq4PFQy8VbP2q+HzxunvaKkUrlYYCuvHcIKdlB/
 IzGTQT7lFsgeWUt4WseXOYynCHdwqzFEJunICyF+mzSmnnyz9AFQszAhyl100jUrQBM5
 wbBA5BwbE6dqbswU8n9ezNAp3SijeWFSFegg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xxRssKJ9dAC1Cxvvi5KyIPIbeBOqG6VrSD6Gdw3ud3Y=;
 b=gs6LI9mJfHMK5i1/scxcArhkFpJ6nSK4Qvs8IOH22ROvhkyJHnYlrbtr5flh5J0BQr
 O2UiRgk9gJcjVkC3MaiTV7cx1/Rf7zOOzGrd12jq2FFLuCbj/2qg8ZZtoFBdhtCrVJVC
 Ghelj2X1YIq86H+iIvWh8x7Nmg//t+yQC6cuddBeizywhkVfUpJBeCQkvt/B6sWUuwFv
 QeqfgKsO31V4SAfNcMIayVf65wf5VRw0YjECycTsJyTR2nDgLJbtXSizMevl1gvbPg9h
 qNjq+EXVvjNsvGq0H/JM1EpFESNjhFYbytalVeFmw/Ie31DhG2RWf6zdVC/4D97BJj06
 6j2g==
X-Gm-Message-State: AOAM530pN9RQryZ8QI8cfU2dqdbQBBxwwj4WM92AovQe5HpTMolODzdR
 AVoNQhAUuN5VauJ84IhwOPKuAg==
X-Google-Smtp-Source: ABdhPJxDJLhEExP7v8L1Yb3lej7+5pDFBeQ9kztKaACVW2NvEKvbWvqudR5ghwxWFFmhMX181+yCkg==
X-Received: by 2002:a17:90a:6f01:: with SMTP id
 d1mr1129382pjk.155.1610068230563; 
 Thu, 07 Jan 2021 17:10:30 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id s1sm6400083pfb.103.2021.01.07.17.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 17:10:30 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v9 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Fri,  8 Jan 2021 09:10:11 +0800
Message-Id: <20210108091005.v9.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210108011011.4061575-1-drinkcat@chromium.org>
References: <20210108011011.4061575-1-drinkcat@chromium.org>
MIME-Version: 1.0
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for MT8183's G72 Bifrost.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

(no changes since v7)

Changes in v7:
 - Fix GPU ID in commit message

Changes in v6:
 - Context conflicts, reflow the code.
 - Use ARRAY_SIZE for power domains too.

Changes in v5:
 - Change power domain name from 2d to core2.

Changes in v4:
 - Add power domain names.

Changes in v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 83a461bdeea8..ca07098a6141 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -665,6 +665,15 @@ static const struct panfrost_compatible amlogic_data = {
 	.vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+};
+
 static const struct of_device_id dt_match[] = {
 	/* Set first to probe before the generic compatibles */
 	{ .compatible = "amlogic,meson-gxm-mali",
@@ -681,6 +690,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
 	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
