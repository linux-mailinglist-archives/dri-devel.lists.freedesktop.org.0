Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46166BA0341
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E90310E973;
	Thu, 25 Sep 2025 15:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GZHLtZEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B82B10E966
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:41 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-57b8fc6097fso1344459e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813460; x=1759418260; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fx8+4vdRQ/UAxNBt+6HBXITvbdfxM4xzJ6LhrqnP1X8=;
 b=GZHLtZEGg3ORxzym3WAz/5nDKeBmyzp0cFM8beNJmn6JoRrobvaDCMF2XELzNKzsve
 eE+ruOQIa47/smiIoJDpCk5fudXCPsvsqSjnl16a/RRcP5Y1q5c2f/972Gy7atlXD2co
 uVNJ/isT8J70Ne88fJuQkSGuq1JFsOsBgBr0zTJovbH1OmcqjoMPcMTc1vJ2CKskVBB8
 UU71EeBNwcTpmXINPLZUtKdhOfC2J/GdABfcw1Eqsi8MGbBDtlNQmkKpCn69YRLktqcs
 L1KFAdUGyXqtvQj+WpxLp3pm5jAhsARY2VmTLB6cktbRlzJje2iafeobOCbNH9K7oS9k
 vhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813460; x=1759418260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fx8+4vdRQ/UAxNBt+6HBXITvbdfxM4xzJ6LhrqnP1X8=;
 b=FAugJB7ZzPJTG84a9rMCJM7rcOYZikhwCGolwqcuYBP5oDwAiK++BXIiNAjUL0LO2F
 HnSTnWTOZNa+Gyp2T6HjKUhSgOshdoz0pY0Fm46FOCICmUq6Khn3vPJdnaxdjHBmcrPZ
 tnlscoAGoTiHK91QOdZPD/d0FeOAdka7P1jEmSyEud6lHjucJmdmTpFX+ZzULoUyUUd4
 FDG6yeyuUV87Wmiam/1O2ra3nCOeRBCgIHTJ0Pf4kwqKczJHAHOFEwAjNw7HfHupBspu
 Iv/Z6iqsbcwwto6OX6ahcxW+PORuQV+APdhxKzq6eWXoiZuy+usL0D9zlHufi61mu0VK
 7zHg==
X-Gm-Message-State: AOJu0YzjRHmQtC6EbBBRJWaAqo7xMntqYlmc8HodtnKWart8GOdgAWRx
 1jVc0UStp5ZteBVUuXbYd4jQ1hwgp9AO4o4hAxtJVhiLPnB1XA0VKGAz
X-Gm-Gg: ASbGncvG9pTBoXVtHDOhma9SIS0taZsWzz/iVtY8ZFcWhge8iH9y5R9gNegzHS8wT4x
 pbRBjJN/MO89/vJG6+BaurwRcidAlknJnLQFmVib/2Gl9nya9iE+w00ntKBQk3WVmtzMi/3+7A+
 v2SpjpE4HjJ1Cq7tPT0BKXQQWZTdAg/pKBIwA74pLlzyzhJ3ow+m//z9K49TcYmAzFsu24Ceiyy
 seAZYJsLoyLOvH8d8y7pQh2EXxW8H+HLjXZ7n8wxjb4MxUCYwdsVsdZ9ZRjUplSIH/hZ3fzw4dm
 uuCSyDOK1/ukJ9Zpnw/a6W6ZL+Bz+px43W6Gkuf4JqzBIF94fOv7ocDRKNYs5GwOw5eSqtVADbF
 70gx68ARWSbFz4zGvqliZ29Ow
X-Google-Smtp-Source: AGHT+IEtsXlkJh4zDVIxsS8Hs/r9wYDKZCtJ2sfjXml1D1zv5EDl/W0Gpd3rSyCqcwLuY7gdFAOzVw==
X-Received: by 2002:a05:6512:ea3:b0:57d:a69c:7083 with SMTP id
 2adb3069b0e04-582d0c2a408mr1257970e87.24.1758813459477; 
 Thu, 25 Sep 2025 08:17:39 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:39 -0700 (PDT)
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
Subject: [PATCH v3 16/22] staging: media: tegra-video: tegra20: set VI HW
 revision
Date: Thu, 25 Sep 2025 18:16:42 +0300
Message-ID: <20250925151648.79510-17-clamor95@gmail.com>
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

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index b7a39723dfc2..4b69b556387c 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -589,6 +589,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1

