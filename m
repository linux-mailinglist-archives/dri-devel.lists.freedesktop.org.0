Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FDFBA033E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E6D10E971;
	Thu, 25 Sep 2025 15:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E5Rpq6cG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288BA10E967
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-57b8fc6097fso1344306e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813454; x=1759418254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
 b=E5Rpq6cGIPyUk707+WHfKfzmpOftBpvooKiIGFW6GP//mY1mVaJWMuFjILXPB1szz3
 glGmK+6C/VHk7fsMqip5tCSVlrSi5Om+1XR6AA2fNlKWtvywu1Fj0pgT+f0bnKongsaF
 sA1D0rxSX1Xyypklf7yPm18WrGJxV4dgwVUOrm9CEMjqk/TEmaWVUZgpnWQBdjHeBPGs
 l1hLViq/uVO6rIJnE8EkheL0CsrrKoyWjlTBbg+JM/TdHK6ssno/Tv7w9jqPaseR9kM9
 V3WbQlGIQY7cb+f9Ffdn2G93URMnQcLIPpZ6Pius2/qNtDRgg/iL9XO0JhiClIaO8J1I
 x/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813454; x=1759418254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
 b=wxHmBI0+PDTnCjF6MF2KjxDBERhD+G2fIUv0TiyzQFKs1J+V32wMTl1S7mujAH9+A7
 6dg4plmHwv4RplWnGNtofwEYPUTfvX5MogGsllT4/78ZNCn9xkRn3RSL06WWY10JEaS5
 vR7BuBnvZcV+3thSfbZSCDofqdWYhJPna5jaxeccSalyTJSa34l5/zn2JLZGhBGjXD6W
 SlsJhNMs6FlLgDOwAr1aVEtbZmlMjwpU/LW66KBJrHLOtwffROUTu3pkmfFPu7y87TlA
 iemR8UbrIK0IOZD8cC1mGOtoz4Spgx0+AqznifAyms1b6NiuL4tw9e1FJDyuUqCdqjIy
 VOrg==
X-Gm-Message-State: AOJu0YxAiqweI9w7x02uXTnxbJ5M14pXYxeyk9CikNPc7ppUS7FVsPRI
 aOx6rr6fHT+Wk5KdGmWDMz++VSTl6GjzOj4o8kA8LdjNvwcLiNdXrxKf
X-Gm-Gg: ASbGncu0bX4FQOGIxTd7yc9SmLAJRsTmOUPqj1MKTznMdN5/ww/D3/25QY6ZnuW5Tzl
 fKZa1Wa4TEnbuo5mu3GC9J/6vkNNeeaznYd1t6bveVm06sURZcEQ3zk/7y5I/cr019vvtj+5eel
 mhx3+d7aGk+DJjPW+8BbGihTquZcPmDekcH9+z3MOBEq9lnBQ6X5kV8Bwdez345bTP418hdJPxl
 J02LGbleZ3kU7Rum2EIFHC6MYkBbt5A2R8C0Yz2W6wm+tJmimYqhOlLEPDGZkpu3oCCUZAVKyEH
 K5anBMmlyNBP5YreO1NrbEKXtiyPGNyHVIBV+GWC3wtj4CHclnGNnUZhHtF7SuRVTVGCuOBYweU
 nUkb/WPPFYdzwgA==
X-Google-Smtp-Source: AGHT+IG7KKCjilkRoVVQO6eRQmwua4ImxUfDI3+PmQybBw/b1Fvta80npFLTel5v2tEHntPHpbmfnw==
X-Received: by 2002:a05:6512:1392:b0:573:68fd:7ad2 with SMTP id
 2adb3069b0e04-582d25840c9mr1251932e87.35.1758813454230; 
 Thu, 25 Sep 2025 08:17:34 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:33 -0700 (PDT)
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
Subject: [PATCH v3 13/22] staging: media: tegra-video: tegra20: set correct
 maximum width and height
Date: Thu, 25 Sep 2025 18:16:39 +0300
Message-ID: <20250925151648.79510-14-clamor95@gmail.com>
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

