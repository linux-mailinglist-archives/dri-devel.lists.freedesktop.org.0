Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD8BC3962
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F239810E775;
	Wed,  8 Oct 2025 07:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DYLRwK+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820610E770
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:47 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-57bd482dfd2so7920399e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908706; x=1760513506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
 b=DYLRwK+Reu1K43dK5YeCBF63j/bn0v/XSXtuCo9sVRSF8eipAhqJTU+VWGwOe1PBIx
 gbkNOGp+vIcOlXzbmee4LNy2xlyoGFdmAz4vEhfFhFmbiKEwcuJzlhEwgsE4qRLSkr67
 4LT6UsBExpl7N3/qVeNS6mVQV9SMart2aCyLQ976mMdL1crnaZS64g0zolTbJA42w+a8
 3H0kul3ClEZhzczZavdm5822fevsiDQPpnFlRMuLSEXCYOEGltHKeI0EpapD6Xrdy18J
 mi5jVAq9oW8df1i5BI7Zvj6gpDCckdJhJjCnmXCDLxVeHTVhUP54JkPnMya46dq0dJsL
 +lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908706; x=1760513506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
 b=ABTHfPliF6wFlRCZ0+mXAo29+oGFaxNKy7wrIEIrxdh7BWGif4SEEOzdw+MXdUQCL9
 LlZwZD5GGKvuP5GmImz9yKMM1kRSD9oASJY9quL/kDugoz5PFwnq6DyV/jqlCJVgZ0zT
 fUpsL16ujFg1PPT5lXFpvYfcUJJRCTCgyw00bbWrnPwBOumU1Deoeb3IUEsKB5CN2aiq
 QazGCiECMawrKGsFIb8bz9y7jxlnAD38tNANzJaMz2gQdFWZuHOEk+zKtZRkNfhSrpw5
 Dc2wz1tK1a7jhRLhpIU5+OFvqJfeUqbsFCMdAx0yzIjhdfyVLEO1Zl1smRl1fkiZ0qGo
 9lqw==
X-Gm-Message-State: AOJu0Yx5AO75LQxEd8f5ougOIA3hIx5yP4j/fxpO6SiV17Kztu8CqKR9
 nvbfl6+FPhAt0tW8mS8obtz39SlgLq5kcbqLIcxcHenaui0H7jLEDrDm
X-Gm-Gg: ASbGncuQmEHHohlCeKvn9daMTMS+y1LikMwU4cPF3p6nsI6l5+u0eMQU7xpsj2KT9vE
 8x6gF7tGnqfxFpNq8YCebfTgQEnB5+q6Es46wwcyWXjNXePtvoY2fWkFM60NGBhBOwSU9uvesFN
 T44ZxqBQagbS3cp/daC8h/m/szopVhJGEipyhpu+GOxvr0Rn/lFCXeMlLDgqFubGB7kd8RRrJrY
 Qw/2LCfbNLCZE48iQZJ2/8vS0dgphtY77oiNYEp3A66sCtIGyPTydQTiE1TcqGzlXPG6U3/5mOh
 80z8IMrnssoVGD3aE23UDO82xkNDgzOVpbDis7yaAtqskaOJ7LCHFZaVIKoOK/zHOO8gTJgr5Jy
 JZerQ/v5TzyTeFqox2J3iTsmvwEX51dFDwZVjhQ==
X-Google-Smtp-Source: AGHT+IGRZlClUUWF0NFnw8JC06wEKdlQrkDCO3jAGBg1Eoa3BWw4+yky34BfCurBVLPslna6NuvYHw==
X-Received: by 2002:a05:6512:3b8e:b0:576:f133:9288 with SMTP id
 2adb3069b0e04-5906daea903mr620850e87.54.1759908705540; 
 Wed, 08 Oct 2025 00:31:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:45 -0700 (PDT)
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
Subject: [PATCH v4 19/24] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
Date: Wed,  8 Oct 2025 10:30:41 +0300
Message-ID: <20251008073046.23231-20-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 93105ed57ca7..149386a15176 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1

