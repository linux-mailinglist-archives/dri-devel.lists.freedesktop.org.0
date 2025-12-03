Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80641CA2E57
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A48110E8FA;
	Thu,  4 Dec 2025 09:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LWk8e0sc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FB810E129
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 12:51:08 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso72373905e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 04:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764766267; x=1765371067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YCzEMZqIE6VK/l17z+67juAL4QIkZUzs5waT5RdKcHs=;
 b=LWk8e0scqRiqWsT1or9X4hkvmAy5k2rypBoi6wUSixSBYsdZMC7eO6dWaFSqfeiGYU
 nE8UKfjzEYYcL+b5IYDMI1Jg7Dk/j+ehIv4kraBkbFuYjlH+TN/0ppKqdLe9j+KdPmXQ
 1SiiwLT2RWchpRSfZ6ZLeX6Ljp1p+FZqUTfvhG+xtSA80YA/18pE3TksaZEVSeKldhNz
 9Z9Y6gvLEAHl1FGuh7DcM5GRpaWZ7IGYXrQ+s0TUED7C1+6gvUsM/X9wmKLHPjkYSWqf
 cHuGIXCIgF6uwvNOJTiRG1kRcuc5wEEBR/oQpsjuJpgGd7MkzXqCm3/6PHB387ELnQlI
 Jr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764766267; x=1765371067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCzEMZqIE6VK/l17z+67juAL4QIkZUzs5waT5RdKcHs=;
 b=Xpjq7gYUyKZ7UEFh+CQn9rrO+fjnSQdmj/Gr/5mDbLvbf6NNJksyuRPdBrwp4zzjcu
 ykErAfZfB14aGuiAxFcJ84XjdB58HPOgDQLypJYonqtHnsooa4vgfjtTarApiTv5n8pZ
 vY6kuk1f0ZdarrngJDY6FTYK7ItY5mdNUt2pq+gBj1ukvOirbVRkN6bZ54NTXVaTQF0t
 iSs2Z1G2lIt3BHW4S3z7o6rEwQ/Fy7e2Xl97c9A8NMtKS8FyCb+6rZt2w9VoMIkpqgvi
 VBrMNGo4zO5diUY0RYCn5iZkjOBnhj5qYdiMKVfG4SG0ZA/NDi4X5YIcbI/cK2n4oyPh
 K5Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm4prizsZRXUki32BkaPEhMri8H5Bl0TUJNe5onEtr8RH2IeB/cCdszYtgeo9KHw8l7pmivd1ZAmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyas8pYdE+6rAgP8NlSkZTBhQAI8jYqN4FOOAQIt8MHeb8Ua7bF
 U6FFb5YADNpqA3XhN7AP9SXW7Cbuy+vlY6Bxh63PMWT4ZHJNq08MW7PW
X-Gm-Gg: ASbGncufHGQlcGMuKRdhNzFOerMOnTa/pGTZWibVgh+HDr7EuJpoaKnybFrpMICrrxN
 Sixfvqag8RbBrGUHh3M3gbX0aUo36dvdc0lHymaNK87oZR9X7GdvoNZ5u0lsvE3WeEZdAZ2Ijze
 PBr8j5WgvdDRv05uVpgpQ/RqA3VuaZUt09e8CkXjxkl9ga+1Jcd7QsfJ7v8CnoQ7UE4Gm0ynuno
 hhcMu4TfvxUjQXpWJ2pswXhl6zgv5EEx0smQ8J0hA9aGw3ti1nqGWtVshVDJE3iMPtFr8b8IGxA
 T2JkIormzzLphFMSlmfKnPxopLyk5hq1otRyZLBHbxUyDQS+CEwJriwK/9BFQVq29MM1jvPBh+1
 Gq7AUVLB++/0KX96896sWREKbry+b3duFTFISlTGZlu/F1nh2LaGYpYZch1+mpzzQiRX2AfQfwt
 pdUM0XzSJnlAMN/HF/wGILMj2Yo/COQ2h/UCX8kZGdKlAgJVaEGNNTQQn1Tsxt8AngeF9lday3O
 z0=
X-Google-Smtp-Source: AGHT+IHD/zjKzRKH5eirr7x2/CUknGJg4LSn2AKabfK6OTVG6+bpUp20UCdcJb9nbkTrsFpVkoSKNQ==
X-Received: by 2002:a05:600c:4f54:b0:477:6d96:b3ca with SMTP id
 5b1f17b1804b1-4792aedf781mr21716185e9.5.1764766266787; 
 Wed, 03 Dec 2025 04:51:06 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com.
 [86.162.200.138]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a7975c8sm52651595e9.1.2025.12.03.04.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 04:51:06 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Date: Wed,  3 Dec 2025 12:51:01 +0000
Message-ID: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Dec 2025 09:04:28 +0000
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

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3E SoC is embedded with Mali-G52 GPU system. The system hangs after
STR in the following condition:

STR -> Wakeup from STR -> Unload panfrost using 'modprobe -r panfrost'.

Fix this issue by asserting/deasserting the reset during suspend/resume.
Rename the variable allwinner_h616_data->default_pm_rt_data for data
reuse and make it as generic GPU PM runtime data.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7d8c7c337606..e553f183c780 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -976,7 +976,7 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
-static const struct panfrost_compatible allwinner_h616_data = {
+static const struct panfrost_compatible default_pm_rt_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
 	.num_pm_domains = 1,
@@ -1056,6 +1056,7 @@ static const struct of_device_id dt_match[] = {
 	  .data = &amlogic_data, },
 	{ .compatible = "amlogic,meson-g12a-mali",
 	  .data = &amlogic_data, },
+	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
 	{ .compatible = "arm,mali-t628", .data = &default_data, },
@@ -1073,7 +1074,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
-	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
+	{ .compatible = "allwinner,sun50i-h616-mali", .data = &default_pm_rt_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.43.0

