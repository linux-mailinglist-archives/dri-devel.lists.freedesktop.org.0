Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61733A79B91
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 07:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52010E1F7;
	Thu,  3 Apr 2025 05:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lesHliLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD1010E0E9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 05:52:15 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5e6194e9d2cso903051a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743659534; x=1744264334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2Xsn95gZDOG35Cm+QZTKl3yuSSikANGmud/WPdVRhI=;
 b=lesHliLL3he/9vT+Z3re7lGKzwyED40LuWwk4O9ZDkn01vwFq370USMldirNKbkxYI
 K2G3SVEAMvttpQ9q1uhhEa0LTpdonZgfRVfA9OnyEQ7KbCUcERfhyhEhjbCplKIaROET
 t34PaC5GgSDpRMBHQVVP7CWwkZRdIiHIT0dH9+BKHeGTV4aVaLa8X+X9aEH9DK6qhIUe
 68OxA9amDAWSOCpS9JABlVsILIMpc0qHpOugq8RY3KE4oFYVI4RBJXe+P+4tXfTUz+sV
 aws+wCXA5son321Q6DEpAfiGXoD4ncv922gfgaMM3IcrhUmujJMOiUq8OwgWve0UexLX
 OoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743659534; x=1744264334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2Xsn95gZDOG35Cm+QZTKl3yuSSikANGmud/WPdVRhI=;
 b=mbRwViqaMXvXo7NQDVMrYOb1+FRUqD8tMUISofZ8OLV0CUSVGQ0zzL61YxnesqaygM
 FFzbuzWOx4/9Sy334t7uCIO3fpB20QxzE/jydCgDcRKBHOAwodncB2TBEpPeze0/S8fA
 V0KAntRcN3fXuRXWYfOOJdxmm2afy1J7hGKBKJYsvlh+seV3HnXVTDEtwcNOL3Br97Ce
 ZlxtCIIOMxwZQF1bmofjfA9SyomC6nSqthw+6HTOeveJW3XvS0ZqulA96fhWQ4bF1a0t
 1ohT+aj+wMtA95eM7NYkZhvXmn+S0cS8uZadIEuTZpexvqlqs0gH9Qn7LIduOztu8J8X
 Wd0w==
X-Gm-Message-State: AOJu0YxeQSwg9s/KO2chLiKs4ph3gNHfKGb9/0uKLrDSeyb3PvXDc6+b
 PakFOuzVM6qik4xlYfDTd/iPJWixubfCU35wdYk/zo2XC69k8VZc
X-Gm-Gg: ASbGncvflIYLvUxTBhlv7P7NeaQhc3FtDfFiGbx2KcB/Y6/xaLCGoRYRvGHHCmTvIUz
 WWX1Sk7kNyN04HgBdRURWqd2gzHAUVUm56YEKzN0tw2Uj1xVaONi8pavO/2ZFR7egpMb7G5u3IV
 33MIP/4bqc3nAxZx3T8b8hcpmJ3b0XgYbkQiY8RUygnpwyhlWNqncTK7Km+ai6gAQXEj83fVJLB
 ZF8j8U4sgyFJWFhT2/Hkd80iTa7lKtDvnxcehdNtjY5C2qu45dDXXIYsHeQY8ER/wy3AljAn1jN
 V+loqNuBTwsVjBltRRTYUD4Q7pLJKLp6N9pCgER1qNjTh3wQlQzgbp9ol7faaNMq9R4TfE8dRoV
 wmy0lmNPwRzazRGBAhfl2/4FeUS+t3YsmUVOPUxD73A==
X-Google-Smtp-Source: AGHT+IGhaJ1nXDxsTQs36HHprHNbaRYD6p+r/EKASCCtnfsEVG7w5Y6wfGcvj7xTLu9oHHGrxOP0lw==
X-Received: by 2002:a05:6402:34c9:b0:5e4:d402:5c20 with SMTP id
 4fb4d7f45d1cf-5f086f84cbamr958962a12.0.1743659534359; 
 Wed, 02 Apr 2025 22:52:14 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be.
 [81.240.10.146]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 22:52:14 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm/panfrost: add h616 compatible string
Date: Thu,  3 Apr 2025 07:52:09 +0200
Message-ID: <20250403055210.54486-3-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403055210.54486-1-simons.philippe@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
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

Tie the Allwinner compatible string to the GPU_PM_RT feature bits that will
toggle the clocks and the reset line whenever the power domain is changing
state.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac7..9470c04c5487 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -776,6 +776,13 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+static const struct panfrost_compatible allwinner_h616_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
+	.num_pm_domains = 1,
+	.pm_features = BIT(GPU_PM_RT),
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
2.49.0

