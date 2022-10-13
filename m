Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D35FE4F9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 00:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB4010E96F;
	Thu, 13 Oct 2022 22:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0AF10E970
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 22:07:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id iv17so2050493wmb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 15:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4om2GeoB3nGtXKn/D43/nYB9P/nCiP/jXLuVwqGjJh8=;
 b=qotD3NVFSmQhXplxYbqPqkjAPRnZXJjM5FyDJIkLyL/NqOD9fNWDSVuNmGOfPoTTSe
 vswK0k7UPe81Zt44Gyv11EU/AQ/WDV/QLgN4rCTQQ2c725Mts7+BmkEgnnlnZj/hCjJh
 l16JJ2V7KBeKmbNRzg+Y8FUgkHpwNQtVcAxUTUBUurK+H2VBnyqvx4XDa7PpMQ5wq/bB
 xITX0mqArzSfNc36QCKfomjW3GUmatOMkyjAkPLLoNNe26TymIDZXGgKGu8aTRBfN/6c
 9S/+lI7eXSx/JN2FJ5sYPrPpUSCkuQvrqyUikeZUbOJGBzGTcsEvCyg6Z3UxIvXAm9E2
 GAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4om2GeoB3nGtXKn/D43/nYB9P/nCiP/jXLuVwqGjJh8=;
 b=6zuOiN9sXbUshB+KQ1H8yaXHqKgecb4Tw5fhzu1qcG7odRIIC3S2SeRosYK742j/Zl
 JALV7VSi8kFxwwT+Akzp2lP4dMHUL+ROYDUxKCn+HHx5oZxvig/r6sC6pCAiJ2cBdZnK
 CWREfvYl1+gUgBLQpwWzIx11Oy2FqfSKHAv7HaQQtrTqwwMsOj2FFCjcd5Sf9r4g58/A
 RgsGI7whmKppRZTD2N45LW4QviyycVtOvTHhnStR/1oLiH+weiXAc+PGolo6PdZqxUrN
 85lQNH7dMu4pRSxzZ9lvwn2adLc7iUuCIzjp4ir45n8oZ5m/4JTB5irOOHH88LVrrRXa
 WK+Q==
X-Gm-Message-State: ACrzQf2n9ODxlBnkOx3QEpnSDZktECiF5y6zY4G2F85ZBeL3buehsRsM
 OpPaanpXpzTKklHCXx1oNgA=
X-Google-Smtp-Source: AMsMyM5P8Pugtc1EMoY/scdkibvmUsnt2EGPTvpR9fjvU661yr2QC0CRIzsowya071Vy3/LCiotyNg==
X-Received: by 2002:a05:600c:3b99:b0:3c6:8b8e:a624 with SMTP id
 n25-20020a05600c3b9900b003c68b8ea624mr1301589wms.113.1665698872009; 
 Thu, 13 Oct 2022 15:07:52 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4141000000b002238ea5750csm624793wrq.72.2022.10.13.15.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 15:07:51 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gma500: Fix spelling mistake "patter" -> "pattern"
Date: Thu, 13 Oct 2022 23:07:50 +0100
Message-Id: <20221013220750.127243-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
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

There is a spelling mistake in a DRM_DEBUG_KMS message. Fix it.
Also clean checkpatch warning on the overly long line and remove
braces as the if statement is just one statement.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 53b967282d6a..bf39728eb86f 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1546,9 +1546,9 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
 
 	}
 
-	if (!clock_recovery) {
-		DRM_DEBUG_KMS("failure in DP patter 1 training, train set %x\n", intel_dp->train_set[0]);
-	}
+	if (!clock_recovery)
+		DRM_DEBUG_KMS("failure in DP pattern 1 training, train set %x\n",
+			      intel_dp->train_set[0]);
 
 	intel_dp->DP = DP;
 }
-- 
2.37.3

