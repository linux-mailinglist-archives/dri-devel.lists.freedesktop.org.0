Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB5BBC3959
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5F010E76E;
	Wed,  8 Oct 2025 07:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j1D8X5Kp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC1210E769
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:40 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-58afb2f42e3so8513274e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908699; x=1760513499; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
 b=j1D8X5KpdEukQGnD/et4e56+lwnW/1pJtJV8f/gz/5Co2MeuHRcC2IM/lF0OVx2Y6z
 s/GlZon8gz7nmH/23wMi/VngA4lMS4iGo2iESpr/auCNEUUOB1e2VhPj7/63d9ScFxWf
 4d0chsgC5fNrqNz0PtAzA5f1Q/XPthQdHw9U1lRkfBkk9b5Iy8XUEPRQb9fgqg9gfFIb
 cxDf1DseM0YUJa77EZZtg7agWma7VbeBTrF9JGfovJaomuEJlG9DdXl4jZtp7N5NYRgC
 CevjY7vTJUkGp6v5d5BHqfemL4133aMSqFoPBEFBnoNac/OUwDCA2OPdo4Lo65APAw4S
 xy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908699; x=1760513499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
 b=IOzbke3ypJnsBD7YgfSeMFaRzOSF2fKrxQAr/rGZmIKySWzHSmKc4tpqf9pBRU0Q9C
 4TeXmVTo3fdEz9vPJBeqs7E3CNhB18Qe6hSyNKETNbOTcZjaML2moAZ4Ton0lhlNhMP7
 7biYn/HA7hvRpGouuGNSMzSbFR1Phuu9Re5f152JdR6OmbRZok9nhzKeVXLbVdAgFCZD
 RnolKsiSyjO2T4v7rxBzxbrzvqt4SVRHp65s33J008+9ZE2GJ5yRVh3khWTiahFb34u/
 w5C6TlKeVjW3eMI7vNtQFNe1yWEfd5M4HdcUFk4tv+gYXqp17/BggOs/LknAwuUBo93v
 vXLg==
X-Gm-Message-State: AOJu0YxPoaXMIam0wB7LbnBbZuzphbz07jztJSDoRrqFOj7w11IzLxOx
 bl4damboCR7vZv1X9hsMS9RwqVi48NZ+S84a/RLT8noUx9cMLbb6Cggn
X-Gm-Gg: ASbGncvKuzoZx5DvZQFIlTTACtnn/tux2njAEriT/M4fC4QQ51o5hmCKoQU6O6vMteU
 4C6UUclGF9ubVNeaHC8pXQzM+3Xhnqgd94B+t875tbBnmpv6V+2BQDPNymoFMdyPKvM+WyK2wVN
 HbrH/r1CX5DQI4ef7laLJ5QJ/5twX+yBmNS3+EpJftoNlN7c9ZCJUjAi6sKsqKO2mpBhQt+ZA4K
 T/aBHv9Bboj6CSAMwlXWtXmLTRD8BqnVSVFyH3p/aWZ0Cvfnc0kD0GTuBMjWOsevEU8njD8vTdK
 qgTkzlzttMmJXBJSNxugvUvrgp9Z8u56Is/kRSPMqEG1PEIUUI++mpNujOtrp8jd5hnfDicpQN3
 5rLxMvicLrRtbITg5CTDWMzUxQys5Fy44hRt8SZMtoZsWTLUD
X-Google-Smtp-Source: AGHT+IEFplvbNC950NzSCz1hsTj2zh7bFgfmbElqdtfxWz+oMV6+2KVz4G+D8Gd8rLXbzooyRNyKYw==
X-Received: by 2002:a05:6512:b96:b0:553:2c58:f96f with SMTP id
 2adb3069b0e04-5906db0ccc5mr608183e87.1.1759908698844; 
 Wed, 08 Oct 2025 00:31:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:38 -0700 (PDT)
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
Subject: [PATCH v4 15/24] staging: media: tegra-video: tegra20: set correct
 maximum width and height
Date: Wed,  8 Oct 2025 10:30:37 +0300
Message-ID: <20251008073046.23231-16-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
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

