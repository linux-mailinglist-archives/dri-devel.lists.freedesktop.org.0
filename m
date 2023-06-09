Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 159BA72925E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 10:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8D410E654;
	Fri,  9 Jun 2023 08:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8F210E653
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 08:12:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b1a66e71f9so15515481fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686298336; x=1688890336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qodemV8tRaPN6lfvgZ3EB7MzxSemetoL3QYb7jUIQEk=;
 b=rx7774MkYxDOyFZ4M/trWVNIX33ywDo0yOSfLa4EslMGH/kZ9WSscvvf1NqZwcs2jb
 eLeKgGgoHQYiwNUlSWhNc/vnTrg/BeG7tgEu7Wpu4NE46/5Tgw2bPVW3nVZdpsgbwS1Q
 KSyrln66eVfqJRLX6VcvzzE98VluFT/i39l2vsss28MsnDI2EN1Xrg9gIPxjKn4J29UA
 5YAV6k6tEnBDDXtm6ktJpsRtipXva3+c8dPCug3FMUxSnK2byYw/D1kWwo6/xYB+RD1o
 GFUuFTykNW6cMJ3QjwTKuWxmqxR5vKrOL+Qj0cgDmYDk6i8d2GBcKnfgAqL6sta8bAQb
 liZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686298336; x=1688890336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qodemV8tRaPN6lfvgZ3EB7MzxSemetoL3QYb7jUIQEk=;
 b=HDFlAOkYcGlWFVaDuIKmqJXT334T9hP3RgIr7rVYd6hMuhwQlCEs0dlJQEnpkczjcw
 ZD9FiIi1YU8V8t0aY/MVQ5ktscBhNm/TXa6aTET8S3nRVrACyZqcpfgRx/70YUWcd1pA
 xBH1t3YZ20jzaHj1hvTld0XxI6wErZPy591KwqHVGEA1SSyUMqMq9gS/BjpZAFqyzsqE
 y1xdrZGziK6YoSL4IOiUug3aFvgcGBblKqSiHmMZoJTuw6u/G3DJ9nzBuyhDmIvKX1Ie
 VxHR4q9ueFMIPHe92e8Pqg9xgtnigNI2TLL0FNu+PLYZ5I8VHcUpL/rqlDmpZqy9zU5G
 NRSA==
X-Gm-Message-State: AC+VfDwnZePgTIt8q9LNu+TBD3qCnfOlTPpUpRr+I6lFFdvSfZj8nLfZ
 t6e/51Suk8Y0rATlKNvbYwQ=
X-Google-Smtp-Source: ACHHUZ5GhOCEZe6676VcuMkcOvn85TaNMJrkMeqVr8A2KgtP5S/BZ1b8HLSG20Yy9eeuyRnx478fHw==
X-Received: by 2002:a19:ca07:0:b0:4f5:1ca1:30d9 with SMTP id
 a7-20020a19ca07000000b004f51ca130d9mr311254lfg.68.1686298335677; 
 Fri, 09 Jun 2023 01:12:15 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 l8-20020a1c7908000000b003f7f4dc6d14sm1856108wme.14.2023.06.09.01.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 01:12:15 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/connector: Fix spelling mistake "provded" ->
 "provided"
Date: Fri,  9 Jun 2023 09:12:13 +0100
Message-Id: <20230609081213.1222580-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two spelling mistakes in drm_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 3ed4cfcb350c..63370c4a68ac 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2168,13 +2168,13 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
 		return 0;
 
 	if (!supported_colorspaces) {
-		drm_err(dev, "No supported colorspaces provded on [CONNECTOR:%d:%s]\n",
+		drm_err(dev, "No supported colorspaces provided on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
 		return -EINVAL;
 	}
 
 	if ((supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_COUNT)) != 0) {
-		drm_err(dev, "Unknown colorspace provded on [CONNECTOR:%d:%s]\n",
+		drm_err(dev, "Unknown colorspace provided on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
 		return -EINVAL;
 	}
-- 
2.30.2

