Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01666B46F4C
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4935910E381;
	Sat,  6 Sep 2025 13:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g8a1REhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17EE10E383
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:25 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-55f720ffe34so3952908e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166864; x=1757771664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rFbfOnw0ovhU07hOjO5egRNR9/9PjyUG+9rcYSQ22M=;
 b=g8a1REhfnyhtfdfIEIpPHmwxhun7HAExsT8E+U0pGSXsFAGSpJkA5FMMRsxXnFN6B2
 Z7jQo+W+el8taZmBimsqn3qZvyOW8f6cwoEgO32ep7AXUFfoZUl8Clc8IO81wRM+Bi/Q
 H+zw+0wE6t1h8Zwk3d2QU/4SFYSAvrOuB4f9lNTKDBmVcXVIazcwZQRqrOFTz3c8Oo8i
 05QzRhGHB0QVjN08rgYr7aD8kj4bmxbpIxzmPA0dF2B7IAMrZlNllOd/5y+ujZ0GxqoR
 HeDPJpDthSdNhI5bEL5FgzmS9zbHKPskxm4v3u+pKXqZU5+MlQ+N7Hv3ULtEyKDKq3ey
 xdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166864; x=1757771664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0rFbfOnw0ovhU07hOjO5egRNR9/9PjyUG+9rcYSQ22M=;
 b=AG6SgQcI7w0eDk37BXxXl3yNbN2BsKahXbdg1vF4myxaFnbxyhXiX35A5YUSxASZuS
 gxwRaKJp9GoiRyBMTcVgfkDo5MhfKPqu01T2EJZoJQu/hPlKkB3uRUyEz0SV2hc9kC01
 phOFvvJSSukOspOELVtO5SbfFayL2RIXifrifMs4db19J+KOKnV5oO9XmE2RNwjga2mk
 /gP+KwWvYiZsINwBEenWx/W/CQp0VxQBE669YY4lqgzdJdxdUrMlE2h1jCXS/IvHoDZV
 mzmnXvs5DPS+Kv8lr6bJgFlZuGbly7UFqUNwPnXdBm1IZmoz5ZNjhCVtPHSJFHtlxiTf
 bKvg==
X-Gm-Message-State: AOJu0YxcLKYB2nDUvHOJcpoXqwCfCwKdGQtmeTHY1w9AYjSiQSjPWjJ0
 XuCXpNnp5eKriiaMBrM1PpOI+PrOjzIj5pWss3bbdlpv/hekxPoXGcenQtYfsg==
X-Gm-Gg: ASbGncsFB4xTIMTCejbjKJLXp/5z9Azw0xTrZwfTOrlR/HE1rAzEIrvmyxq3LiyELsT
 aqTmlOg8hp+yptRA59mRvFSrWFUwiHMqQLTN82Kkv3FpUYPNYKt5JxXzutNr11yx79fpxrVssat
 LXfrLb7fZ04+sKN3xaNkQjBlHfUe+JNDbSIos5nPH3rt0BIj9hgPQ83zJEuYtnIbzefh7a6NoV2
 wPegolsKhOgPrP6HtcB4zAZ/3Ar6SV6JUCiSFHEFIXpQM/qK50YX0tHgB3mWFPF5TdFyJEvezqR
 6jI/d2MPSsFrWWlA4ncKtBFH24sxaj6L8f6SqjseWzhczOAyQ/1rcpY1044NXyebOUL0sY0Z0dW
 xKQaoSyKLBxKnOg==
X-Google-Smtp-Source: AGHT+IGLEI0q+3ulE2AcGy+vQLvJcnyT7yWeDJ/WZ3nBnLMGXX3O9kNd1Z42W2XvmsQg5afDS7/KKg==
X-Received: by 2002:a05:6512:b05:b0:55f:4072:d34b with SMTP id
 2adb3069b0e04-562761985b5mr636622e87.25.1757166864108; 
 Sat, 06 Sep 2025 06:54:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 14/23] staging: media: tegra-video: tegra20: set correct
 maximum width and height
Date: Sat,  6 Sep 2025 16:53:35 +0300
Message-ID: <20250906135345.241229-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 461593c49594..3dc26f5552eb 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -24,11 +24,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1

