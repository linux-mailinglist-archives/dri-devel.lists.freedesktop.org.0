Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84DCBA034A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EA110E976;
	Thu, 25 Sep 2025 15:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hma8i0oM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6A910E966
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:43 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5797c8612b4so1479107e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813461; x=1759418261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUp5v1UIpnZY/yoewRvmgW706IOEqdQHhaBwZbL9eqA=;
 b=Hma8i0oM3WPjoPJF2c+9vPsDOkNYYss6EksfCjmyb0zAa4WPUD8E6aOnts6UufbA25
 4ifKE2/wqoey/q7mizlKk68KTqlzJwlu8YLljCQItPJ7ZOsaEDKBksBFXi5H32VZVl+e
 w+i9TzYccs+6SVIkxKoVCW1okPFc+6JFZcGiusmR7SzWgSUqCieH+ZGfVzhkWpxJFtYp
 keXQrDRFaYNj6lwee98cTDicuZSzUV5tygZHcJ3Hoo4kYiGUUCy+MqdUAh1LoOCnTzfm
 lj4TqDL1sWzWPYjMYEijEAQgUGzNkLGkRzvWnu2z5il3QZyD/WQE1qo5vqDBJi3koypQ
 rbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813461; x=1759418261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PUp5v1UIpnZY/yoewRvmgW706IOEqdQHhaBwZbL9eqA=;
 b=hP1rA5HcDTrmTnIyBNTyetel3e8SezMLfxtp9mwWxgCRjoYLCUGOJwUW2p0EO2gtAG
 GMe5lotI5u2m9mQbZ3/Pk0d1qSSsk/SaxWPvj0SWHk+6flmgmwfzdoY2SPoeLZZj39o7
 YiFMgGRaB62Kq99n6hfdJLVlphEOhLWiiawA01eueibQ/P9h3bhpgettDE/GCzhtAY8o
 CGrLhIVZiaXd4kYh8TMUtwGgqFIq4m/GZ6+ohCdTtk5pap/8SvoxbOJf2gFHiYnN9/4h
 /qKr8790v0yDo3/86DETo7FUI4DMamRPWNgVw0kFeA7KrdKKwKIvKeJUs/PbQeRupRDA
 2YOQ==
X-Gm-Message-State: AOJu0YwozC3Zv5GZhRwEUJ96k7SpZAB+oKXy+lOrhJJHDXC1F7oXAW9O
 GeE9owWy2/5p3Vmka68DmsgpxpY27cpjrI2e4S6IdrnAnfYmKLLD8HsZ
X-Gm-Gg: ASbGncsXVHnAueq6T1WOGkiuEnqfUf6t7SaMcer7lKzKbTnw74fxFbpaRA0X2li0wmq
 w5s6zsxTJEhWSznNYjqPc1IxJXn8knR0rRyj4ihRv67mnbva7R5sfZ4YuLAgznkl458dEHglNSE
 cehbQBrXkX9OoiVC0y1EjE10m0y15r9lMq84rwVbjF/DG6Xdb+0E26CGJAJkzjIhox2JCF/WjTz
 SsTRv2N10zM+FqHU7f7cS2zJQZprOjeEu8HIVX0/r5XWGc7ps1BPnEi7txzs+7IefiDJm8JqSFf
 Q8p1wQgYdwBZmkx2A36YjdQCfm6DvO9ofNxVam8zOEXog58QKpI/+y/SH23pqt+V7BpUHqDw4Yw
 ZZSuSRZ+N04J7fg==
X-Google-Smtp-Source: AGHT+IHvquA0M+Xh1SpA+3oDLguKIe9WLFehMUyaGA/+DL5kSgZuWAoo44DRA7J3InsbPnIY3UchVw==
X-Received: by 2002:a05:6512:2207:b0:570:b85:fa9 with SMTP id
 2adb3069b0e04-582d0c2a151mr1077864e87.13.1758813461247; 
 Thu, 25 Sep 2025 08:17:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:40 -0700 (PDT)
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
Subject: [PATCH v3 17/22] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
Date: Thu, 25 Sep 2025 18:16:43 +0300
Message-ID: <20250925151648.79510-18-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 4b69b556387c..43f545e6c45b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -591,7 +591,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1

