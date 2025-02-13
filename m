Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1848A3343D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 01:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DD010E9B5;
	Thu, 13 Feb 2025 00:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="df0zkuN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534AA10E9B5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 00:49:45 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-308f32984bdso2916951fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739407784; x=1740012584; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LGRGsNpeDghO8jo9QRpPUN0MsUvAIsC2g7b5Clws7I4=;
 b=df0zkuN6XSCG4DZGqIymfuR9Tswi98S6KOqTthVsVz0teD+k+IG1s3696oQHgc88i3
 bwbhMMgKhRQqPPm3QCFq/3MMH0dMBSgka7ZXIRzPRbJnSx+s2AtR0eB5LeV7e138ez4E
 x3BCYQOcMOueaRYoNGK0ZF95S8ZL6aUyYjeh9812CE9hDy2EnTjaYlP6popuTY49QGhr
 3gLJCpl+OL+kE3P9JezSWYHn5Gk7ccn/fsPvaH1iFC0XIDbg6vivc5I57j5HI2UaIDR6
 5mrXaQfzEKVIbu6S+OqMfP1zYbfBKnNVgB9kcpOifHYgGSIb+lZWeahW3sIg0SgklzrD
 UEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739407784; x=1740012584;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LGRGsNpeDghO8jo9QRpPUN0MsUvAIsC2g7b5Clws7I4=;
 b=K0Iopou1t3/x9H7ZS+IVWXpzfYuDZDSV9XJ8mnYr+sMUhqgaUnhvYXDKkiVX6U8bWJ
 u3cRwq4q8bJMfiNPyZEAO6EbCE+nox52ZXMrJZWAr2gV+86/cYmgs3R/LevM4c+QFiT8
 w4OW7ylxsXJ3B+9we2f+kzpg2ZrCmajIu11a+bBJynd6lgMGd6C0LGdHx//3lDPu8rIY
 QfBQ47nZJu+Q1yHypukPO3EKb82X02siA1CyodA/Td24UR8LcwsvUKGuGOVsG6f6EPik
 QXdaetfIZO1dKeZ7fm5BIBtLZWW7436l/vDh7V8yqqQr7OyJ1/NstNhOzQhaguJxxRUJ
 OvZA==
X-Gm-Message-State: AOJu0Yz99OI7r5DrcDMJ0ZfjqqHfNLCUE03kBWnMwww1zzesSIln1Pve
 BQkVPiB15nmQfCbJlmYA9PZJWmoT8jMnkuTFcq7UPRGdnHszxWgYWEPLDgNjY8w=
X-Gm-Gg: ASbGncu3S1wVhTsr8wjjBQLvaiZ3s3JWzn5GorStBNokpUbALx96AR04rU2ZhRfelt2
 viqXx36DIplSp08bJ+HaoUHSgV9PAk99KiAeWbqTXvGaLm2IiNPPSbfnDvhLLsRSbYeV8UvyJ5r
 seQvQlWY+InL3OsBnbgoguTWkjYAGpkX1xZOeIoUQpnZTn/p+Stuz+GofiTpeKh8ngM9CndwtPU
 3XB/FiK8csvuSKhiFWvhfS0BG/1Hn/oYT6t6WowqVbZzitqfOheBqDXgwNCe/5+1As1Kvmhtc7l
 oUlR4jTGnLnA7z/K9u79mtk=
X-Google-Smtp-Source: AGHT+IEV7MH6VGWs1pJyu5VoGEtdf2sBTUzAwsmsMK7jNzvPRB6Bv0XC71s78gTsol6p6TC0e1TlIQ==
X-Received: by 2002:a05:651c:547:b0:300:de99:fcc6 with SMTP id
 38308e7fff4ca-3090ddc75cfmr4568411fa.34.1739407783569; 
 Wed, 12 Feb 2025 16:49:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309101224d1sm397021fa.63.2025.02.12.16.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 16:49:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Feb 2025 02:49:41 +0200
Subject: [PATCH] drm: drop i2c subdir from Makefile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-fix-tda-v1-1-d3d34b2dc907@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKRBrWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nj3bTMCt2SlERdc5MkM0tDs8TERAMDJaDqgqJUoBTYpOjY2loAIHn
 qcVkAAAA=
X-Change-ID: 20250213-fix-tda-74b6916aaa00
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j+tcflbxu44pWgyFCTaE34sxvSNJLBAUX5OuwvWeIlk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnrUGlA+/TKZ1iluhO1quU2X6GY2Q7ZZcaRQVQL
 lkvkcV/m82JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ61BpQAKCRCLPIo+Aiko
 1fn9B/4/8kJN9+6lJc57KNdIlg84QoZlYaPGHWAK5FWAhDR1ocmoTmSatTIxHPziW0M+iKpGdU9
 f+CvXkP8cXI5wnPRg0w1XgFgsmtnCbN5hRe4Zil/yy0D9il8PCsm6sVlHSoadBqW+BcNeXk0TY4
 zEk/LWQH96IVKCK5Nd9Si9WTKblYk23BbFeSy9ZlPLS4mA4r6oQXErh4qIVm6P0TjpE2JcD97vu
 Fw87LDDp2IfNoRLr4PYj59h2BUEDE1Jw5GZnT+6fGjd53G408F6dMGc3rEdwG55ueXeWz9nlvCr
 7Mu9WpCGUYP1uTSTnZ1gi6Dtr4cuID+LAe09dkJmZdy2II9j
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The commit 325ba852d148 ("drm/i2c: move TDA998x driver under
drivers/gpu/drm/bridge") deleted the drivers/gpu/drm/i2c/ subdir, but
didn't update upper level Makefile. Drop corresponding line to fix build
issues.

Fixes: 325ba852d148 ("drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/dri-devel/20250213113841.7645b74c@canb.auug.org.au
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 42901f877bf256765829b5fe25bf7844202338cb..50604b49d1ac4edd439ea73361118fd1e6a81d53 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -197,7 +197,6 @@ obj-$(CONFIG_DRM_INGENIC) += ingenic/
 obj-$(CONFIG_DRM_LOGICVC) += logicvc/
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
 obj-$(CONFIG_DRM_MESON)	+= meson/
-obj-y			+= i2c/
 obj-y			+= panel/
 obj-y			+= bridge/
 obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/

---
base-commit: 325ba852d148434c5bcb06d513af1933a7f77b70
change-id: 20250213-fix-tda-74b6916aaa00

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

