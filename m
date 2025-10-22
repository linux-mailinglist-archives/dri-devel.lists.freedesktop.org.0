Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662ABFC758
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B17910E7C7;
	Wed, 22 Oct 2025 14:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C0NPSBBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3302510E01F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:21:55 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-426fd62bfeaso3182500f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142914; x=1761747714; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
 b=C0NPSBBFF971ryGbnf7DSW9PfHFu5n98mtUEz7lKrwPvB34a4dFEo6tB+heRx2Tbvb
 429NiQOSl+/oWQBtzRjdSZl02yAf/B2y0AZwdXUVq1xyO0lcK34vFz+otCPON2p97wlx
 srvDKhMaqJGSDJwsGgf/AJ/7ATXYRYKcd1sLiUAneO7KYMJ3hfIy97EMl3Gn1qAajpNb
 Boe/5tWElShaAwk7DW1pLCgan93CoWTe8679WaQkUtIpfgh7iLEJedTLmp4qbSANepVY
 PWhZVo0garJdGJeECXXmJd8ySUNPBlmeWotojH4tLunbjHWIkVePD5taoD2AtwLuxqRR
 pDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142914; x=1761747714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
 b=xLvQwFXAY7k2UjuP+1NlGNwF55Vs7kTv6qfylI+Nyx3o92yDY82mI1ZuSjcNU22DE/
 1p1mB86MBWy5T4XENIATS+eK3TEDBRmpYluTQ35n6gxlwyp721zmJHQCaWYI9WtlasrM
 rVRSApAjPJr2z2pWwjW2V5xNHPt/sJJzFaoFI5BPbbqqylNJr8PyA0xniovl4rgsyqfD
 Ch6m8Cx/1R5+7byiH18UEGGfBe4rmKAgKinSYnv4ulyDlLyHfsELYVfenuq4wpkxHIda
 QyAZghDHrYjjFOYndvZ8nr2CJrWyN1yTniJC9q8pu1w2/OoIUPXqHTcBRTa2qKscQjSy
 t1qg==
X-Gm-Message-State: AOJu0YxCH7TPpq/QqC9EVJna3kUhYoOMNBNMubE3RwJu6D2uyspWcZol
 viBKeTkfthy3Mo5xTU3bGbkzPgsh8OV5LwfXQXTRds//8Iagcr4IXLr2
X-Gm-Gg: ASbGnculucR3O9zoSYtoxqPcTTM0M0YWyzSuirB0Krai5DersHXeOd+O3miwmYImpQR
 1N3MeaNSviHMIGRwnk9Vcq5hfor9cWYuzXZ86qDAThZUpgAVM94l0SDKFu2jfF48vwjt46tOyZG
 FoD0L++pVYzcra5fxmdPp7DBY8Sr2KlZdTjyBRtP0I+9Bp5xRJdkY4zaHPQ03WNrrZ/b2hlRzSq
 NIgkbYve/4juizN+R+zlCuXNLkClVMYyd95a1G2BWTqXbyp4OwiMTh0CEKwOkHBMDsI9wiBo521
 1ksjXfY3O2LddHP6IbKETKR/AFW5sW+E7ZyxNyTE3dsl+tjqlHCC96LzD21OOH9cF7POgdwo25P
 3TvOTvWSdexETf4ARCXFXgWEOx9V2LTulg4WLHQEIYt9GUYWi4bQCmLQXcDcOdNUD7qpt9BT/ZL
 wobA==
X-Google-Smtp-Source: AGHT+IGVyh/0Lq21fHxZjLwl88/dShL76QWY1ZVpGVbU3hFOea3guFlvCdv+uCzmXqru7Kjn7g1lZA==
X-Received: by 2002:a05:6000:612:b0:426:dbee:3d06 with SMTP id
 ffacd0b85a97d-42704d55398mr14180974f8f.22.1761142913609; 
 Wed, 22 Oct 2025 07:21:53 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v5 17/23] staging: media: tegra-video: tegra20: set VI HW
 revision
Date: Wed, 22 Oct 2025 17:20:45 +0300
Message-ID: <20251022142051.70400-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index ffaaa2bb8269..93105ed57ca7 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1

