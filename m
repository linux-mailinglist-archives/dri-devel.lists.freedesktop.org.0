Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F34BA031D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A5E10E969;
	Thu, 25 Sep 2025 15:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iNg35+y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFAA10E964
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5688ac2f39dso1245329e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813440; x=1759418240; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
 b=iNg35+y0cIIiJ5d8p2EXryI2pQ/ihZlhnKgRRBv4Yp++cUPlYaBiSIPijObO/kwRl7
 s2/ONzc+dhZAydbqbPgcHZED60b55S8fx+RAev1IeTYl9/qds2iIRKjYfqIkEwozEwsC
 yKPB+NkMGLO/wo7sz1i14j/m8L3Jm1T+bKTk03Q1p230dre6pdNxDA++OQ73KKm9xtJt
 wZlFB1vIbGWtFNDC5dUKdrU9zkb+8E/dnWMLJTPslolL1VJInkLbH60iVHJpZZm21B9i
 m2/tR0JI1KzVO8yGE0cu0izmfEhJ2/GWGqO6L29JQBboKlSIOhmtSqz0py0lZh8eVP/A
 o2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813440; x=1759418240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
 b=H0gijZtekYt2hrlU7y5ROKuAOT2PZQccdXgCoyHO5Z9GVTN9WS6pQq8WHTq0h5mwmb
 4ANFkoLj9i58ezTEwmkmnVoAbXC0QeG73pTg9DxuC5ERDnjojol4zGxChmZHhOgJ0Go4
 yU+TPi1ZxJnh7sAe8uN63vUj77HfaK+OZMpwSDAGcD4aKobkeGPN+C0xVZa9/k/H/Zv8
 NBZH1GtX+03UvOqnA9t49C65Wr2bg1dQDkThZ2aR+LM9XI2B2IjRfoqxu3oR8ih0V4mh
 /7NV126V+PKmR+lI/fNy1C9+HtujSH3qNeuJ1FyATseXoS9UJo+7hiEhMd5UQjz/lhen
 Bc7Q==
X-Gm-Message-State: AOJu0YyfMBPtMMZ8zy0okFEi+2UTVSSXMUPEBXocKrEtEZhgZqN3DoaW
 0bKxzEmGaKxn1Thj8GiuKomcp4BZz72vZ000S0ibUee5LIrUUW1425Ue
X-Gm-Gg: ASbGncu7rA6QMock+Mzywf8mMLibGF3m91hCplPWbfBAbzC8gbCy0Vn2vZSY8I16iaZ
 PbmcC0fCTNtLwTMsNqPlo+IXs1EVYCUeMhd4z6cY+tGTUWrmuwbDIxMWl4xptAbKfsJLMzZreMe
 wjLFoplWOKffoT1P5zRcZBX1gb0np90N+Xcsd1tWotAlIzRnHfw7n0EWrloqur7TPYFwap9ax1F
 LzDakXht8JzoXLC0sujWAHZRAIUx3UMpY6TcdtpuRUuaqiAimrXbRcRLnpDbOWTvgcxMLoUvnBH
 J5mWnwYA917YwjAD4oZg4C6wnOtyrjN3FJCI/2gcXE4ZNxMAB/oHPzMjwoBnJNAYAybAZcLfuiD
 KcOb31DrLkARadHOGt/mENt2a
X-Google-Smtp-Source: AGHT+IF5ZI2beyyzEW/PAtDOxp+J3O6NLq/9OKReZs2Hy68TyNyWNxXVchzXa+SA2R9q+HUVhQzW8g==
X-Received: by 2002:a05:6512:10c9:b0:55f:6f5b:8e65 with SMTP id
 2adb3069b0e04-582d25839efmr1072613e87.30.1758813440236; 
 Thu, 25 Sep 2025 08:17:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
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
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v3 05/22] staging: media: tegra-video: expand VI and VIP
 support to Tegra30
Date: Thu, 25 Sep 2025 18:16:31 +0300
Message-ID: <20250925151648.79510-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

Existing VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 2 +-
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 2 +-
 drivers/staging/media/tegra-video/vip.c    | 4 ++--
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index 6c7552e05109..96380b5dbd8b 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -6,5 +6,6 @@ tegra-video-objs := \
 		csi.o
 
 tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
+tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..7c44a3448588 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1956,7 +1956,7 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 1e6a5caa7082..cac0c0d0e225 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -296,7 +296,7 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 074ad0dc56ca..6fe8d5301b9c 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -123,7 +123,7 @@ static int host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..34397b73bb61 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,12 +263,12 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
-- 
2.48.1

