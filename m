Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55958BA031A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AD810E96A;
	Thu, 25 Sep 2025 15:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MxahmSAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6136B10E966
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:27 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-57bf912cbf6so1222714e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813446; x=1759418246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
 b=MxahmSAwzXVpnLn0CIT7+zDIVLYu7tv8a3MlPCIGx6sLTxHXe9x3RmlV5yMN2I7GnE
 xTXctw/WFD7sGwoXq5gzQlfcuRqIyt+kiPpc1xC3GVx0Enilx4Ppu2rHhe6FJBawqqjm
 rygkd6wfktLNqBzK7pvtS4lwXHNoN22oK2ZAgiAq+1v4jToIGRIfB+XGb5NHrsO0Akay
 UP7lX5Oz0yQVxu4Ah5bPny65wNplBhx9IWWm3JLTg4WH8nlA6MYbh/PL5ZeXFQdYfnZ0
 TGEMBaQJNaZNS2fIGrKv2e7VmtDfzwxfIGCHBIZ5KIWFIrE2ZyY6bUCPHyqIbW+Tw+NN
 QNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813446; x=1759418246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
 b=BxAmNpEgtOfTFUHSz/skLTFq5JU6kW+4OLa2Vbx2rXG0SseBG+cCGf6McAXssyRwH1
 0CjyrvKP4u4dh+i1YY/c0ZP1R8nKDT3u0whyMkuQAqNsRk0wcq78TQi+S+rSUS5fw80W
 Fb3vxZOvTkFiNuUp8rP79BnvaqB5oljFbi8XrFdbLG6TbNzr5pSTH19dNAdLxUlEmTKT
 7LqBavZ/2/4YJWYN9zDdiKrgk6KKRCncdrSgn7nLgCq6EeQXN0Kyj1lloAIbZ/Gs0z9h
 JKUwWXT8zOgoKNvKZ99NT3o32gLh2fAZEpBUCbIb7E/YKMYbZ/e6a2HE65EToHwxjYLM
 ToEA==
X-Gm-Message-State: AOJu0Yy6Kqx3v77FpgrGmtHFwsBrMyiBmYcH0DOI329by3IJdeJvriwZ
 U7ZwH1/beJwrWl1u6ffU6F7gVecqHa6Ovhbp/TEXzihhPQ57dTUgnjKF
X-Gm-Gg: ASbGncukjaxAwUzbmd3f7vkRQEj5/Rv9WW7aZRROuUf1np5JLXCRUsVQ9NV+xJfm9vV
 cdcA/UTvocgFwziYB/2fNik4YGphdzo2tCWMNPMWKZEkRgNbnjR86Rt2OPQtaZVk+HZBmrXuaVb
 nd5YYpt0Avq/8fmL80tuEEI2aYx6KtNjtrwNhnnr4BQpdS2lDoqvgacJzOCbidTLIekxjFh2Ryl
 0pSImZft43tUbdGJaOXPT6yGrNT9tjVTgkC33zDMDPARYiWPsP5W4blU/9uLviNLfQOA6d/8m13
 shwjtU2vJ9dmamKqXD8CdI9OVePLBoRP/TIYvSg6m+EVZfVzHHobKZbVMrRvHaGgYGzii8q7lbP
 Bvd22b1XpwXbUBA==
X-Google-Smtp-Source: AGHT+IE9s8LEs7isC/WkOOjmZSczeI87yN4+QY99sZheQ8v0ntKzIh9SCdVR9v8GQcLfMhBuoMmtIg==
X-Received: by 2002:a05:6512:39d1:b0:55b:842d:5828 with SMTP id
 2adb3069b0e04-582d2f2796emr1520385e87.36.1758813445428; 
 Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
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
Subject: [PATCH v3 08/22] staging: media: tegra-video: csi: move CSI helpers
 to header
Date: Thu, 25 Sep 2025 18:16:34 +0300
Message-ID: <20250925151648.79510-9-clamor95@gmail.com>
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

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1

