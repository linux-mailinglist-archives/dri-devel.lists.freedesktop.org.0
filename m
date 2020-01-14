Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D113A16B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 08:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015346E2D1;
	Tue, 14 Jan 2020 07:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338EE6E2D1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 07:16:27 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id e11so3899601pjt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 23:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e5zg+Nyx8gIh15cqNDiymw6e+al01EbMcgFt2zvz0/E=;
 b=ithCmGPBDK/u6wxmb7C8KnWpF6VLxN1iVW9EKRTQdp6gCK/wkyNVGMrjLzSyYPtuZj
 KT0dAo1mqlGPGF8vvWskaLxI8E4PJM7ppHVCuRSeKdX+EsfMf57sl+NMqrMkGaZe+a9e
 jMDmnOEr16LjZs3JxaJxhJ4YKueNcn/vlkQrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e5zg+Nyx8gIh15cqNDiymw6e+al01EbMcgFt2zvz0/E=;
 b=E2dMwNapvBiRPBXDPllXSBZJBUx2A22zqyCsAni0Ax3k72Yp8WlDKOw+trdF7+lpEv
 SQ27Em4pkoGWNCUqII9vR/mnBwBFCBl3URM+b40M4I2nuv2OU8eSO4SO+ip5JCA6/+tB
 Vl6YUZGAvawvm4ap43ZoWEANwGQUkB8zzwGqOfiwguQCfMOgjY0pgAvopk+OKmyChoVk
 F0Va+plvaQSYh6LBHLBdmC0ldWord0Ym9d6uZizJvvbBGB0wE0eTr4HxYJGcTSHdkeP8
 bejikwFkmaDuH3FpU0jRO1j/W+5hFss3oa/QDF+BL/ICnWhR1bsLArl3EG4+V7F0/+/L
 xbFg==
X-Gm-Message-State: APjAAAW4ERkn7QT2JrbRDyoe99mtiHNnS+ciICYICyVMbtN6W+TPPtDt
 ekQBBw8oxOUGiJbjWyAtd2k9KA==
X-Google-Smtp-Source: APXvYqz4laPa/9RzoUxpMClNTomxEKcjjRkPSrqYnULimr14OR/2zncKlcPo6jiMuGgeOUer2Xg6RA==
X-Received: by 2002:a17:902:fe90:: with SMTP id
 x16mr17202238plm.31.1578986186739; 
 Mon, 13 Jan 2020 23:16:26 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id b4sm17092976pfd.18.2020.01.13.23.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 23:16:26 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 6/7, RFC] drm/panfrost: Add mt8183-mali compatible string
Date: Tue, 14 Jan 2020 15:16:01 +0800
Message-Id: <20200114071602.47627-7-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200114071602.47627-1-drinkcat@chromium.org>
References: <20200114071602.47627-1-drinkcat@chromium.org>
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
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

v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 42b87e29e605149..3379a3ea754ccde 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -592,6 +592,13 @@ static const struct panfrost_compatible default_data = {
 	.num_pm_domains = 1, /* optional */
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = 3,
+};
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
@@ -602,6 +609,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t830", .data = &default_data, },
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali",
+		.data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
