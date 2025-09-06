Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA111B46F56
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3AB10E388;
	Sat,  6 Sep 2025 13:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z/Kia6Bp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876D910E38C
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:32 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-56088927dcbso3747757e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166871; x=1757771671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7mhDgiHOnOUHFnbDg3vpOrqddC2vZG0fv0IytpHCc+Y=;
 b=Z/Kia6Bp6go5nwsKlnxNtqfHNJqPIkgITOx3+OyjbYsfB05h3weonc88sbVGEFBxe9
 YIQn3Iqu/1DLrlpnIMyc5SWinmkaG5Lmo5jGe1d6PAlAWq5hHK5eicUziootNga7QeBp
 175xxxnA/6+o0jjuL5hQ4pmbzhNs1nFNtAehLOzrOk3UaQYDyZBa4toh3h12mPX1MjTY
 TRcFr4roKDgqJOS2SGV0d7zVRketDEIUCv4dG2+Y8olamJ7Ymn0ML/64sEN3Gb/HxGex
 sS6h8gnjPnohb+eCfs1e0U+6NaSs4bn3VgHPfmBXwpA9cjynaxtqIny8ezx/aiFUv137
 tbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166871; x=1757771671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7mhDgiHOnOUHFnbDg3vpOrqddC2vZG0fv0IytpHCc+Y=;
 b=W4jj9lTSQsCVqw3K2nA9zrEnXu0bKsm3FZ6PodHNnQXp2QlgItNi/O3XMZvXtYPkrJ
 IHGWzj99ns94o7HV8Pt4KMidq9jIUKdhaL+3f2kww2XSO86df9GQcI0y1HTgtvIPKB5Q
 W4z4Ww/VJd2DRq1BKLmrvN2hkB6uKBagwRodMMntw2D+7ufpLjrlwxquNnYSO//lMqpt
 GjdzJcmlex5emb/r5CHApRkxokTVUz05tyKyRZJy1YHp2ehrHjCBh/aP6r/uwK7SEjcC
 V8f9m+vSDBzPPPN65nXMiYffkcI7cAteSiaMBBoRz2QiQi0C3s3BCAHtpX2k1JZwq6oZ
 QFKw==
X-Gm-Message-State: AOJu0Yx3o5ZsB2j2wkcO7/FSX3U+P5nDvO2yiRuJ+wVX4KShvTplB6l/
 9yJSUqtlcPCEEulaxRv0Kh7tXbxlJdOSO/Bprs0SnsDBSmdabgdqoHBU
X-Gm-Gg: ASbGncupe6EBy7fudRU6MGjt+z68rzA42Fm5yYg4tp25e50P34YARF2ndjJtvOXU6nR
 SsCv7SKTyC+cRo/yQxQaJU61dPOym0n73/AonKZte7Nx1/nqMRKCOGb6tPzob71PR1DmBE6IHa5
 /yc/6zTybCuCUVNAoflmGOaDXAxFVigcn8T8uC4wSBiAnsusV/a/ydeL5FrlQPhvgZVMviWiyA2
 qJwG41D8BDxhCKuvT6b1uRZU583VKLklck05O7GxMWhIiljpudpE4/7T3NtDF+N26gVTfSTew36
 4YFnf6cevNbk7Ips7mPsnpeq32OSwNr4Oh/JWnwws9lH/yxn8t64ykh4ZXdvuwqkg6DQ6ZWqrUH
 wTYY6hQziyaavKLhjr3K7UsBos2nXm33yk+c=
X-Google-Smtp-Source: AGHT+IHEazhMUm4QC3TD/od78UfhCFya+ZuB6sMvgFxZAijLSg9k4+KtNdbKBe2GJTxtOek8Ckzs1A==
X-Received: by 2002:a05:6512:b87:b0:55f:3a96:936 with SMTP id
 2adb3069b0e04-5625f90ee59mr671609e87.15.1757166870721; 
 Sat, 06 Sep 2025 06:54:30 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:30 -0700 (PDT)
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
Subject: [PATCH v2 18/23] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
Date: Sat,  6 Sep 2025 16:53:39 +0300
Message-ID: <20250906135345.241229-19-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e0da496bb50f..3c5bafebfcd8 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -590,7 +590,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1

