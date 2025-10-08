Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D678BC393B
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D42810E76B;
	Wed,  8 Oct 2025 07:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fv6w4jMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122DC10E766
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:34 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-57bb7ee3142so8424274e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908692; x=1760513492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+J0PH9dJMfz5boSq++S0Cav+gbesPYUNWBRR+flsya0=;
 b=Fv6w4jMnqk7aFJ5GNJ+EbvxRdkl/3C7eMmRGB+Pn7cxMEwI4nyHkzzepc5g5XoUCii
 EDGq8SHO/pcc8rQ/UOcmMjAEVogMk8Bu1Mnzoh8XJXGq2Vd/YyXqWssFgRO1McBDkb+O
 ikae1AGxrLa0jFYqYqLymgE/OVjs2WePBo/xqH/4n4nOgafe8JkGCTF7GRJ2xAvYRCKq
 TbyJPdjr2DaSCS0g6N5Zqe/IPhC1V6vZveoVvqO8RQEUzgbSlFph7Ul6VWW1zlLQUEOk
 ae9hcxak2O5v8xpWYJl0pSuLpVrERrsCi0hQMV2U4s2GXDOWfB/h8lJVQ8YUvUVUTQKj
 FRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908692; x=1760513492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+J0PH9dJMfz5boSq++S0Cav+gbesPYUNWBRR+flsya0=;
 b=N/Zb9Wjj56rBLFUVJjQ238f3MQ4Nkw6NyGa2pj7ekVo7jTlaehImxHlxblNvACtrYm
 6euHlGclVc9fdwYRz7qp02CQQTIb/ojf8XCzCcKG9JR1v4Q/B3C2D8ixRGfR4BQ64XVn
 BJKEWnV1ut5BnXTKKRyvMRyKJ4etmOEVIt6P8lC1keZWeOwM41LL16gqUjYp4ZI5VTH8
 7EWGaglpg1JC0MYqVS2MSzFXs79TeiNit5GEjHiYqaCYOx4Gq9OM5f2d7Q7lO4pek6Mg
 +A95MAuZ58VVSeTJKPHlidWJV+py64IPusr6q0AoEc9v0JjW8YTBOU60f66LjF/74L+5
 y8ow==
X-Gm-Message-State: AOJu0YyCVfbTdlP511OOfv/tPoJwUXgFdIWVmCiBnZBvect5vRVaNWcE
 Os5+6WmCeUll9wwD5Vrkt/JGoc8C/El5idJ20vJXYlSlDIue+h394nfb
X-Gm-Gg: ASbGncusdZzHQVsszemTW/7HVnlBeKL0wb4/GlCdGVH1Q7i5B/HpMkjnyX3laMNleFI
 aHLIiZksw1l48QD+TOkNaubXZis81sHQe62dBsg5nT6Ghwap7yGDxX8KSN2Xp/woJIfkh0wm88l
 gkm9HPn9BS9suHw9HP/w0RZu2JICryC69jvVafLg43RyZSuz+v50ZIiNYjapmw1hpqR7Xdtcq1Z
 noE+2nnTc8RYtd5cDL2YAHwXHNATYQ4R/DTavnnIjKPSSQ5XDp/e8NRmNzBB32TOo7iKTwP1la3
 lWk6GiO+a8Mi58/WJqmWvf5qPtAJs/opPpsweDyi1LBso4NjY7OYXkEBDnDIF32Jo63lGjI5lKU
 7s5NqQCtj3aHaw6FwwggTYbFS8Yi63forMbUCSQ==
X-Google-Smtp-Source: AGHT+IGohM+FjzJZWI2mxJtv1ojEP0dXBrfZwMch9BdyXmNUeB5wEHKzwj5zcjMl3VMz4m5oNM6M4Q==
X-Received: by 2002:a05:6512:3b8f:b0:590:651b:10e4 with SMTP id
 2adb3069b0e04-5906dd54146mr641087e87.37.1759908692226; 
 Wed, 08 Oct 2025 00:31:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:31 -0700 (PDT)
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
Subject: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132 MIPI
 calibration device
Date: Wed,  8 Oct 2025 10:30:33 +0300
Message-ID: <20251008073046.23231-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

Document MIPI calibration device found in Tegra132.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..9a500f52f01d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
+      - nvidia,tegra132-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1

