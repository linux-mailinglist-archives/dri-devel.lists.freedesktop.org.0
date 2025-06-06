Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93597AD09F4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jun 2025 00:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468BC10EB77;
	Fri,  6 Jun 2025 22:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="SqsxsVVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BEF10EC40
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 22:10:53 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6071ac9dc3eso4060899a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1749247851; x=1749852651;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N3ygnVw/n+6bwn53y0Mh0mYQycS7zL+z+SR1TPl0nEc=;
 b=SqsxsVVtlBHc7twkV6yTgl/SSsR1rUQlrvMMX1qPLwtK02FgHk0TAht6X/zCzfQZcE
 oBGOgIVX+HJZwhtMw55/ijFGInhv5U558dLNAxk0FQAi0eDh507cHG0SZxP0wN4AJgm+
 C0Nrn07OODaeyS/cMf20nXkBq0LuuxNMP2v1KUgI9NC50Zo4sm8a3+5yPMHsUyYMHG1C
 7huSWyDfLWlIP5LV059auwnlb01qlGSOkx/pJrWjQRFjgDCrF2FpGYkGN3ZpimLXJukv
 sn72l39ZqrC2coSlufiItpzWfrLDl0YuyH0jKkehjyf2ocGFWHQsNPFan3d77XRQEfEp
 NNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749247851; x=1749852651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N3ygnVw/n+6bwn53y0Mh0mYQycS7zL+z+SR1TPl0nEc=;
 b=snBqZMHokeR5xBpAP0pZniXrmEAyfzrEbLtptLicDa4wJ3H3etMXMmWpTaHP7eBE/6
 ZDLputqFbNV+UBIswvifYAcgWcTQdBQyZdzKXLoZua4nGsANTShCs8UfKl1ePS6haW9m
 Hl01bI8nbFxj5hD3275dCkE5c1vcJInnKbGnbLWqDpAu7jHkM75sskrgif9MDvqTV2WQ
 ao0DLgFEBfbU2A0BtrJHq2Iw9/3gZvEnj4gKcZ41Ju6MN/PE3lgpDQuOLIjyNQdpKYhH
 fShyMpLje3kZ+GoGwotqAx5EHZSi0UhlQlXo9+PZUtioYUAu981bXatINPMCWR57s42g
 r4Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbzCaczhVLJvSqYEaX+A5+9QumCvhQDA5zpNOnrWBxFrEZultCzzprA/33B6WVjofEq+jQUvHfOhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqAwcOrhslb6kqdr4MrQ/d8ITMFJCb+bHSXm4B3vMoJd1k6vna
 LCwqbSo8+HriXzB55MYLZ8DEUTa/A75ZowavK8lerP5eUUrzZ2Sou8RG
X-Gm-Gg: ASbGncs0HczOkeTTYCChsaYOGoSPnj0hzo5U+vSZVnSGMgAFbY6sRXfKyuDtuBeilYs
 Z1DoSo9/HJzxOyCpSUBcgzsX6clX4aqMh/t2Yd+wmF44kvBOIrkTdZTb/ifinhBn4uL2wL1E32g
 RcH6bS4JaFNUuqAYazHWndf4Q5qw79nFZG0zHz/jni/Q2iKfgBm/xwEbmTfCKO8lgd2yzI6BWc0
 oYu+1FVj4Hlqc/gpqJM3y28KGMfV+rSK3mWDv0sntmXw8dukTvSCzEyF+XWaHvLxKr6ujK3hvWA
 eKHgZFFO7mztRj7J06SdtILqjpH+HOBtK/QFULkhUho3Y3e1x/cvqyphlknL1O1g3rg7ikkzLN7
 YNUp1gxmLDHqa0UguZOeGRdiuJzX3uPyhxYgZhnOkJd+Ug9dr/K+neu2b6FPYE3zSo+gLWx9Nzt
 tO6XgIUtkhOEfef2p2W2KXUt06N73AvA==
X-Google-Smtp-Source: AGHT+IF2GDmxSpU2PUP8gOk0whzGQdZbH1jzBstBC+SVXNfKpbrPiO7RDCeI9rjuTtfJwFYp3Msy5Q==
X-Received: by 2002:a17:907:9628:b0:ad8:9e80:6bb1 with SMTP id
 a640c23a62f3a-ade1aa933admr431541366b.18.1749247851398; 
 Fri, 06 Jun 2025 15:10:51 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-a032-8c00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de.
 [2a02:3100:a032:8c00:1e86:bff:fe2f:57b7])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ade1dc78f47sm178605166b.153.2025.06.06.15.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 15:10:49 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in debug print
Date: Sat,  7 Jun 2025 00:10:31 +0200
Message-ID: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
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

meson_vclk_vic_supported_freq() has a debug print which includes the
pixel freq. However, within the whole function the pixel freq is
irrelevant, other than checking the end of the params array. Switch to
printing the vclk_freq which is being compared / matched against the
inputs to the function to avoid confusion when analyzing error reports
from users.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 3325580d885d..c4123bb958e4 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -790,9 +790,9 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
 	}
 
 	for (i = 0 ; params[i].pixel_freq ; ++i) {
-		DRM_DEBUG_DRIVER("i = %d pixel_freq = %lluHz alt = %lluHz\n",
-				 i, params[i].pixel_freq,
-				 PIXEL_FREQ_1000_1001(params[i].pixel_freq));
+		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
+				 i, params[i].vclk_freq,
+				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
 		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
 				 i, params[i].phy_freq,
 				 PHY_FREQ_1000_1001(params[i].phy_freq));
-- 
2.49.0

