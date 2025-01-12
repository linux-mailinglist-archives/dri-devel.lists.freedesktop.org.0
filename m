Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A74A0A9CD
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 14:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CF510E2E7;
	Sun, 12 Jan 2025 13:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bu/JLvtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAE710E2E7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 13:46:41 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3be7f663cso645115a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736689600; x=1737294400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17mfEUKLFobncZ1DtZDYZ0xDKM3wSv4g9CH5hL4TNJo=;
 b=bu/JLvtIgX7e/K2iw0ZUkgCiJtQMZYwT2Tc4kdGVK5UUZd5NzAt7RcpQNKDH9IlAw5
 phR1vjQ+BxfpkgiQ5lsyMXDBxMvi3sWyAunJ3GfNzhVpZmK2Aow9bqyfbB2F0DRWzGjf
 yI/kasfaUp1uoncZ75tEGmE7qRxkzgebkP0Aa2FajgeqmDiTnm9YrnF0b2v64TavOD86
 eg5xxT4OsYzsIePD37Rl5XcAjJXFMqXbg8jm7SkYmMlwN1rH4s2qxNn9yy3SwZ0bx15h
 dbOY61IGIVowkmOxCdgwSZxs466wt3nuEVvCkE3B0Jq221quLhcsg3R+nK2N0/eFqWF6
 QvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736689600; x=1737294400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17mfEUKLFobncZ1DtZDYZ0xDKM3wSv4g9CH5hL4TNJo=;
 b=GSyvwwaxdtMvlBaseVikLGILu0tfTjH65AkWvVBLgz4kFCwk/+YzpYYudhDxeLFiij
 FqpgVbAg7P66dCI7E0BXftDuLaGthhHVFuHxcGKOk9jwso0Avz9ThG1NbAJboeo21nOg
 B/f+AMRWu4ezML+hth+ve8Ar2/sCxtBbd1NWoEEyaQ1+xe6Cy+vX+vmOAJTOHPEf6oxm
 ds4nBvJt2bWCYofZTgH4/RmWb5ZIQROzAIXUrx1JAQgrcapAMqdhZKMRPeoIA8NdFdA3
 AHtIMnFYH23SNfozrh1A30EgRvkGkCbAH8bWtxOR1qHcdRtATBgYZKHWWBURzBS/tJS7
 tlbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6RZBoReVhTRGoJsOuYRc3yqnf7R6yc7c9T8bkbDcz5IEhgBRofPby1KKlxX7xlXunt3/+qf5naow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8kaChW+E50aQ7igkcU89Y+TMLD/x1Y7l9IS00Ca5z5swDGz2h
 jUEncFJkXButOkNmNIL8Qv6Il96XmdUQfW9FYaNMvHfjopOkTjPoOmbrqzc9G/E=
X-Gm-Gg: ASbGncssYDt+GWYlmK43OJccj5muBnsy6ZcnOBq38k2Slu1So8X7GWH4XbYim28Q1Vf
 UAQPJScJeuULd2JZPfT2PYuzwctsRFYH/fQGHg5t4oqz98Plkiqz5xxGBAY7r7Jrnwz4LX+LvBl
 xLngpH9AdqHs5ejfP4LSrbHxpaxbq1IpDivkoXeWwsBclqRgBOvGKQ8oYzHzpekpUag+kmNg29F
 cRCkJ8ojq7ppWrB303W0TSdKuzFVOawJJ2ZMGWU1HEd6SDYyb3pQS7U6g5SHi2codR/ikU=
X-Google-Smtp-Source: AGHT+IGek+mcaMq6Bx12/YzpJyPJOeOrjQQOfVQjcgfD7uU+pEIuD+vivjLmYHe/XC44J0Mh/I2d6g==
X-Received: by 2002:a17:907:6d20:b0:aa5:46ee:9545 with SMTP id
 a640c23a62f3a-ab2ab571e20mr567188866b.5.1736689600270; 
 Sun, 12 Jan 2025 05:46:40 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90638acsm371051266b.20.2025.01.12.05.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:46:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Helge Deller <deller@gmx.de>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] fbdev: omapfb: Use syscon_regmap_lookup_by_phandle_args
Date: Sun, 12 Jan 2025 14:46:34 +0100
Message-ID: <20250112134634.45991-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112134634.45991-1-krzysztof.kozlowski@linaro.org>
References: <20250112134634.45991-1-krzysztof.kozlowski@linaro.org>
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 7010544e02e1..ccb96a5be07e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -3934,17 +3934,12 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	if (np && of_property_present(np, "syscon-pol")) {
-		dispc.syscon_pol = syscon_regmap_lookup_by_phandle(np, "syscon-pol");
+		dispc.syscon_pol = syscon_regmap_lookup_by_phandle_args(np, "syscon-pol",
+									1, &dispc.syscon_pol_offset);
 		if (IS_ERR(dispc.syscon_pol)) {
 			dev_err(&pdev->dev, "failed to get syscon-pol regmap\n");
 			return PTR_ERR(dispc.syscon_pol);
 		}
-
-		if (of_property_read_u32_index(np, "syscon-pol", 1,
-				&dispc.syscon_pol_offset)) {
-			dev_err(&pdev->dev, "failed to get syscon-pol offset\n");
-			return -EINVAL;
-		}
 	}
 
 	pm_runtime_enable(&pdev->dev);
-- 
2.43.0

