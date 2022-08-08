Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8F058C635
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 12:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CC190C56;
	Mon,  8 Aug 2022 10:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2736A11B00F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 10:16:21 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x19so3694781lfq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 03:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZSWhWVIMTdJmNV7dT9qbKSPZrPrjVzwG2y9B/jqm4bI=;
 b=wGcPgMyieO9cFvxTr79rS8AREemXIwc2wUFNElRfqEBdu9/xR5fsJEYyDhTDCpnFU5
 5XQthhQY2MGzL+JC/gVaFgeMpiHud6rGrIfIArCUVLUxFgpBiR+OT3G0n3jgDS9pGxqY
 24uzj13OFJGEuWH7D51hwsfbRXhSrGL61Ri87xWfoZEnwTjUmcKJ9Md6qb+El90tUsp0
 qRdiqyG1WDavMTJtM9WybGesHfpCnseXWIhvasJxOuzkhjQ3TTJkiYTsqugKCDTuV5WC
 0wvpdFIKSTfIb9VJwK6AdgDQfLBmXlRopfSfJRJn/8ekWknLSVL7XSE9mJMWcth8Vmo+
 KNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZSWhWVIMTdJmNV7dT9qbKSPZrPrjVzwG2y9B/jqm4bI=;
 b=1mjY9BFmeU/XJXH5qR7UlnfpWy45eGnVGtK8vRay59mnq8+caIYF4wqM92nEbOeBCG
 Vrqh4skGBGUT5Qn9anQOTQU2UNpPveiPePA8v+W1E3zwx8ELB+bfmyLHS2UQhS2ETm1o
 JeBrlMQLOytfDYeXMuAHkaRlafdSEHXjNtdFeeaWe2xrCvsc0BoVfxcJ5JhKgCbjANdI
 c059awlMu5zGVFGxV9IQVJ2GJP1AamQjdgepuQkvv+YmbBWH9xtdYt8AuH2NgO9L8ZVY
 wAegvmx/rJCkLHzYFteXdo+5LkrsB2+WOmb5ItED87h2v6h8pY8xbZYlLNU8bHU0x3Lz
 5zfw==
X-Gm-Message-State: ACgBeo38mY03AOlK1aQdMzHVkmEwI93VTVCEk7lPGK7yocQcuBSaWOUF
 lzAT5bXqQNIHKW/c8IPyB3iNBA==
X-Google-Smtp-Source: AA6agR6WbH/uUBPu/P11zqkM//sK+ay53hJ55+HI/jBG+cpCuOejT7yCoIJ5LI688QEEuBe0vJLETA==
X-Received: by 2002:a05:6512:13a0:b0:48c:e86e:fe1a with SMTP id
 p32-20020a05651213a000b0048ce86efe1amr57526lfa.594.1659953779439; 
 Mon, 08 Aug 2022 03:16:19 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056512070200b0048b193f677dsm1377489lfs.178.2022.08.08.03.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 03:16:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Mark Brown <broonie@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MAINTAINERS: Drop Bartlomiej Zolnierkiewicz
Date: Mon,  8 Aug 2022 13:15:24 +0300
Message-Id: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bartlomiej's Samsung email address is not working since around last
year and there was no follow up patch take over of the drivers, so drop
the email from maintainers.

Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I assume that if other change was preferred, there was quite enough of
time to send a patch for this. :)
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2180312fe0a4..423c81f8ba61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5369,8 +5369,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
 F:	drivers/cpuidle/cpuidle-big_little.c
 
 CPUIDLE DRIVER - ARM EXYNOS
-M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 M:	Daniel Lezcano <daniel.lezcano@linaro.org>
+R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Kukjin Kim <kgene@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -12404,7 +12404,6 @@ F:	drivers/power/supply/max77976_charger.c
 
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
-M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-pm@vger.kernel.org
 S:	Supported
 B:	mailto:linux-samsung-soc@vger.kernel.org
@@ -12416,7 +12415,6 @@ F:	drivers/power/supply/max77693_charger.c
 MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
-M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 B:	mailto:linux-samsung-soc@vger.kernel.org
@@ -17973,7 +17971,6 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
-M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
-- 
2.34.1

