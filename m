Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B97155208
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 06:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA58C6E8A6;
	Fri,  7 Feb 2020 05:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ED06E8A6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 05:27:09 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y8so507871pll.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 21:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1OPawnjFjdppk48OdmcnT2/7I2TyhqjSstM3nsHqEyQ=;
 b=leq9iVWFFwWc9SzvLj2OAYbrGFc+oehb6yV09Pzq1ffNBybAnHS5RyCURmnyFsX0im
 YaWhNs+Nl6tLggbvcAWNUCDzNlX5w06vGsu5yjYtf3DlLPTZoJsvQlAbq2Zxlqv3EFxL
 1QJBK5hAfU+PS0NW8uNLYDPFvg60Kt9nVRxiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1OPawnjFjdppk48OdmcnT2/7I2TyhqjSstM3nsHqEyQ=;
 b=RIWjYqBYzTz3QO65sfYKYKLPF+yPD3wXUClClcCaMKAeaW2OUXbV6zoponxRd4oxps
 SMNu6SRA7a1U11UPXlpk4/q70jvg5E85D1MWAa5Te+kLMVUubw8mzL5gOW3KFqm9+KuW
 tmb6CBfgeYfY6zc1nFBvArKyeN3d39WuamSCZ47N4NwCi8lPtaDUEnMvrU2oTG040EGY
 8h7goJzl3jo5t5oNOSwUgpSXG/Dqxw7EBhQYPLymtRnw/Uz8zowJEVWeXPDW0Sih3QmS
 g2uonkMIvu7+US33YkguigN7t58d6P5X1xmHGjDGpl52/alix56Vvi/jhVBvDSne2sUS
 Fcjg==
X-Gm-Message-State: APjAAAX/fCm0/GDNjHNSNHGOoBD1m25UgTclNcw2uF8gNavIa13gKAzd
 blsMPn1ofmm7TJZlt3FuofnqaA==
X-Google-Smtp-Source: APXvYqxjKyDt1CleJdBxolsoRem+PmuvkMQG1Lq12fr6aeZNGLxW0nPVgS7A8TQfu34JJoOQ5pUshQ==
X-Received: by 2002:a17:90a:36af:: with SMTP id
 t44mr1758975pjb.25.1581053229151; 
 Thu, 06 Feb 2020 21:27:09 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 21:27:08 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 6/7] RFC: drm/panfrost: Add mt8183-mali compatible string
Date: Fri,  7 Feb 2020 13:26:26 +0800
Message-Id: <20200207052627.130118-7-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
References: <20200207052627.130118-1-drinkcat@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For testing only, the driver doesn't really work yet, AFAICT.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

v4:
 - Add power domain names.
v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a6e162236d67fdf..497c375932ad589 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -667,6 +667,15 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "2d" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+};
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
@@ -677,6 +686,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t830", .data = &default_data, },
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali",
+		.data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
