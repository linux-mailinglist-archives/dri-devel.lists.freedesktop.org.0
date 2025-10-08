Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6D6BC395F
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59B10E772;
	Wed,  8 Oct 2025 07:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ajGAbVPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD8E10E76E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:45 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-57da66e0dc9so7017265e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908704; x=1760513504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
 b=ajGAbVPWFwsjDJFL3r3l8apwTTwv1duuPSpXn1MtCW/qdWr+pk4dP4LWQvbiY0vEGs
 vbHJn2GwMB3G/x6lYJRnlGdusHpnOwOCspoyUv38oHXL8qf4pjVkT9IjbkibuiKrlEqd
 TLt0PyTm/CqR3A/Q4T+/FS22xb5bIMB9oYSeT3Pf7ijLkj3QyLxvgpihNdN1R2ee3z14
 zKjw3q/KME9OJj+wRyPjMAiTIukGbufFk6TVB/7jZV+V0wKh9SSNF8YLthIrSwb+Kp41
 eJhuZpV/7m6s9jrfNV7ZZf+c8Brkl1PEsPSB4Pko04CUNYtYbN35WdhCH91ZLm+hEv6+
 vOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908704; x=1760513504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
 b=Q25hClOdGut51KT2vUHxgwiKmvkKrPvqpdhENnaHE7xtUtMRKKMySPZtWd2rULvzha
 kL692saj/VYI18OaGONh1hkYkK21ilgUn/68+m/oCxox9s9KGc3xUHsA5fW/sbxOzzVv
 UTcpaWhCtH8rU/2hZvAaaHWCy9pxFStogPbBl1L2uV7WgQz8nZvqqV6SbU2XHCkwgJuL
 D0/AFOm6WI71r8l+TjoHmXNXOQXEiHYBXW8K/81dfv/H2Ru1bZYu5FVMAe2Nn4pjPoJl
 KkHPXLh69hs2PLVz/O2ySLwDmbtJX5QKN6hB2L8wMvrbWYni5z4chdFuqnd8+8icgs3R
 HkPQ==
X-Gm-Message-State: AOJu0Yxqc+9d1uDuVsOtVrGNKw7dryuATispQkZwV+VLPOz7LeoPDdNW
 nEGYCPM6CRTGTBcEME5fhBxV6jSS2ivPs7rrIBh9iyyNVQ/7vfebGdnh
X-Gm-Gg: ASbGncuGkgQkA1087DlsYY2Jd9/Jh605eOHPWbARfEMQgGtf4zu4JNUsZFuqO9mhjzy
 szc0w0mLJeVy8GgW6OpnRHXKo4r3DLZ19b/ewqzRPjT1jfJ6eR+5BFM8Ln6/ySDg3ZKGQJq6DNj
 cAp/IkHXRNtw7uANzi5cL84YdsNkIruqo3g35PRvR4sZEm33NW91TeN7Hajs8mdOI0aojtrjPrW
 P7GMZAosFUOE4zyQ/+FCzB5TojfSUEwr/YiQGW0iOzGwhaW6wFTLIfgIhS8vxaUyMRFl8DiC2dx
 ziSYl0hDMeOWxvsVCGzu0ydEC27eTlXrvuMrKCePZM0/pY7Tobq0QYRGlDHPaConnGOa5vgCg/h
 c5kO4uRfqcQ19R9w0OHj59E4kKbaUXEjMQqsVUw==
X-Google-Smtp-Source: AGHT+IHW/s8/FSLeLjY2E3RMDJLZGpJL6irCGCDXRSSnmLe1/pIzWAPaX9pmCT2OHt3ka3/mSzeg5w==
X-Received: by 2002:a05:6512:2399:b0:567:68ad:428e with SMTP id
 2adb3069b0e04-5906d888441mr673178e87.0.1759908703855; 
 Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
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
Subject: [PATCH v4 18/24] staging: media: tegra-video: tegra20: set VI HW
 revision
Date: Wed,  8 Oct 2025 10:30:40 +0300
Message-ID: <20251008073046.23231-19-clamor95@gmail.com>
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

