Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DB9A5E850
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AC310E1DB;
	Wed, 12 Mar 2025 23:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hlTcurcv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6E910E1DB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 23:23:24 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5e033c2f106so432195a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 16:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741821802; x=1742426602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6zrV7lfXICcs3l0g4L6oSOhAbz0Vn05AYlZgbp4rDoM=;
 b=hlTcurcvh8cZ8FePBDRCUvxieaAPzcaw41F90p4/X6VdFYLbo+7dSAmZU3J8HbKfIN
 XEh7fKiCalBuWth90cLFmS+Kz9XhHGenSidH9I1Z9D9k5WCsO59Aauf+Xn8XIfuvPl/r
 snKqgd9zdnpayKk9KjvX3mu1HrdLB8mj0/Mbpg/ecfj1QrTbQq2U3thhwNetdZCQoI0F
 VyViI+V03JP6lfxOy0Hdtkph8ATdLSm6AiWWdkhokYkd9IkXd/G7hQiBRCQ8ZpDETHQ3
 jHQ+PTjgzvMLTbM5CUAVAPcoJ3y4vYARx1W28TnBUjdSIFKB8erkaNYhFZPQRq2IvkYs
 rLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741821803; x=1742426603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6zrV7lfXICcs3l0g4L6oSOhAbz0Vn05AYlZgbp4rDoM=;
 b=drUC9ufY63EaYL4KvwIg6NU0at2u5l0TngqqzGtKMbt7xLM0aTIFceOOEdBLX2f10x
 Qwsf43/Kr7gk0LYpGGXTExiQ9EKLaAWkm843OMFjpHIEJxlfcPrXSH2+CnDIpbfC3iJh
 /NlZA2J6+EjMeoQ4QLx3Se/YlvNygOivLeYJ4IjX/LRJXbueVy7IOXIozmWFKHgjfRCQ
 hFYyQ7lKZUVcMzqi/NZzTk8vY795ma2YNG5yIkDKIqJNL+7hdEreZclbS5tLYNonXecp
 rjg5aRXQukO55c8Td0M8I9KZagalKcVNdNsXikxAKCjb0wRonaC9c0BGb5iBs8FmhBCR
 DLNA==
X-Gm-Message-State: AOJu0Yw0yjtyiMpq2fB7v7phbcIFcFmRMxSQYHoCHP13QvCDZ4lcnGiF
 nQF6nyDGHLa/TnLMg3K72GeHgm5q4wkvzO7VNO2ZfO8WNDgtfDwQ
X-Gm-Gg: ASbGncuJHDD22DCsfA66Asv3waGO93YRj8WnrwNTuxbiJb2kjwfnZElrJv0Y3+uwolC
 7cL0rKqOMRQ9wUTMcykKp/9R3B88dcAakHOKEXHrO8ZOsOg/QbU6PdnKlPgj0ATOIdeQz48U9Se
 FKYpAPoqVPc1L7tXV9KE9jWBGx84Fpadec5cXdG48fwHCGzpMQ2LMR/a1iZlHJ5QKnGjoIsi6PK
 /BE/T3x4L7MB2efZuGXohLM/xoL+sc9WVmjDJ7s94HRwNfzJ3cgtgXeWkav37+qKViKV5Z9m4Uh
 ZH6ozdlAhdOR3FquaQci2fl6v6zUnEVRbtD3JQnOz0FUq1HMp2fsf+XZxPSt+G6p6UN+qvPzu98
 f5hlxM6LmwBBahmhrzXrq3KdmKOSWI7I=
X-Google-Smtp-Source: AGHT+IE/HS7pBbJiG0dtxqr09NjUVWMflt711bAAkhk0a2Jd0FhTvLGrwUMbdOg+tiQiWKRSLoGTNQ==
X-Received: by 2002:a05:6402:430b:b0:5df:25e8:26d2 with SMTP id
 4fb4d7f45d1cf-5e5e22a79ccmr49699585a12.5.1741821802314; 
 Wed, 12 Mar 2025 16:23:22 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be.
 [81.240.10.146]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816afe223sm26732a12.70.2025.03.12.16.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 16:23:21 -0700 (PDT)
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] drm/panfrost: add h616 compatible string
Date: Thu, 13 Mar 2025 00:23:19 +0100
Message-ID: <20250312232319.25712-3-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312232319.25712-1-simons.philippe@gmail.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
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

Tie the Allwinner compatible string to the two features bits that will
toggle the clocks and the reset line whenever the power domain is changing
state.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac7..f13743fe6bad 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -776,6 +776,13 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+static const struct panfrost_compatible allwinner_h616_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
+	.num_pm_domains = 1,
+	.pm_features = BIT(GPU_PM_RT_CLK_DIS) | BIT(GPU_PM_RT_RST_ASRT),
+};
+
 static const struct panfrost_compatible amlogic_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
@@ -859,6 +866,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
+	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.48.1

