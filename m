Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 823313662F9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 02:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D226E929;
	Wed, 21 Apr 2021 00:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3AE6E929
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 00:19:30 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id n10so9470058plc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 17:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hFZoL/B1X+TSHMC73OVlRCB/m5eFhUPf/0EsulpbQc=;
 b=m86Akho6e5NFRQG+D9b5XKy1PM6jBUdw/OAXHb0gNMKjnsjAWo5nsN1SanDXJ3iNCL
 pfHEaIvhgdU29LPWVXVMQtU//JFrjVcsKlnAmg+kjZw84uDn/dy6b4khV62ciU9plhJa
 lMVfjivc8cIq7ok/I0nblMrd/Gbniy4M+Ev3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hFZoL/B1X+TSHMC73OVlRCB/m5eFhUPf/0EsulpbQc=;
 b=VNa/eQWWcNIA7Q2Vo0Eoe38vPM3BGWmx6LCrwxvCL05dFBoIVwPo6W4iA5EmWOU9th
 aJKe441OcRIzS11+iGhiaqNaN8RR/PwAIQ5xTppzxPNldCQB1yN0vFkX5O9dUADRRFhX
 4cyYrRP/rNL1nCTLetzLJHh6E5tca7jcJzPHkRGMZ8LPVdlG7EBLE7uOudHvysogkahS
 BhStRT2ExkjdV7jBrFeEwI7Hs4nABW7AuniRNF8SPgBck/lPhb4m3SX5P8DxBjZYgYX2
 xjhvPPgndsoDx+W3NoRX4ZwT2qWKExW4iGl7/UGaeX3UWnisUx0ikJL4cbokMb6TRDjf
 mSEg==
X-Gm-Message-State: AOAM530SFFZcBNhf68h+p8Y1JKIbBnyai7OjP1wuxCTNbWFH4hAygYuW
 qOXegQRmgWsLcxJ0IxlfS/dkHg==
X-Google-Smtp-Source: ABdhPJwPcD332xjlRJLIeFst3MzhfSb/LQ1n4pU5CTQv/wJO0T4lmQXl3wRtx/vDfJA1pFQZD+KMsg==
X-Received: by 2002:a17:902:6544:b029:ea:f94e:9d4e with SMTP id
 d4-20020a1709026544b02900eaf94e9d4emr31488680pln.16.1618964369761; 
 Tue, 20 Apr 2021 17:19:29 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:95d2:8c89:b629:ff49])
 by smtp.gmail.com with ESMTPSA id d20sm145494pfn.166.2021.04.20.17.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 17:19:29 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v12 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Wed, 21 Apr 2021 08:19:08 +0800
Message-Id: <20210421081831.v12.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210421001908.813625-1-drinkcat@chromium.org>
References: <20210421001908.813625-1-drinkcat@chromium.org>
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 fshao@chromium.org, linux-kernel@vger.kernel.org,
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
Reviewed-by: Steven Price <steven.price@arm.com>
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
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
