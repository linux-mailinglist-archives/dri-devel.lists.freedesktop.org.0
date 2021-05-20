Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A063138AD60
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F9A89483;
	Thu, 20 May 2021 12:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFB36F421
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c14so15602160wrx.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pO5grwrsv4uMOhYf2ygGyZPPYt+9rmeszEZndYds2GE=;
 b=CT/EoTRfYVBMyN8Wzm8oIU6O8z4y0prNiAf2aGwl18sXL6nhs3Qa7lndrhUsKNpDNh
 lCPNbGFn1y4DmrNr28zOZrehZnATaWcMml5I3ocbHsxIkMeGsS2ZekSj2cVrN+8vUzOw
 sSuN90me/VUxRRa8I4hU3JwltTu8JZT90S3shAULwt0mBG7O/wb97drPL8NKXIltu6i1
 xMypzDARp+sAyjtdEKK0npV7sP1RPbELatr9TgObyh9m8es+7Kw3VdkkU6K40xJaPQ+1
 xWb2/INEkfii3jkvbu7kRkEciU+eiCKAPTU1Y2Tw9wyaA2n+N8KCQ/gjqjtc8BKAZsBm
 I3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pO5grwrsv4uMOhYf2ygGyZPPYt+9rmeszEZndYds2GE=;
 b=bg7E1Ha3TkFDRSYPV7obID17tymVBQhxJPjhDtjJjl0ImAdptBLQRyEf0Xo1EP7vg5
 cXosijTs3h6USDQ+p2TP66+UxG+KTHdww8iDCic+TAcrZvBJhIpC9oiskpIchl0BOOsM
 YPEYELy+GJ51c4LBpHM2qa81qCQKqKJc3usQ0Swl3BEaYipKxaQXD9WuHMi7F2Cw1EqN
 K1R3npsBiGXgO7DI+8KX714hpXc5LsRCP59T+TuDKsGO0SyCdogKundOOvrCpbZdq8+U
 g49L84QYenKCnAh/sP79Co0EJwjTIdQSXv6W4UEA+YM1JoUgNqt2kOWOkKxoLb4wyrnA
 IOgQ==
X-Gm-Message-State: AOAM531ao9tQsVd8zcF4HyXkZhIWAT4aUtCcWBApW5WonTpMdVZPtIKP
 /fqBGikzoYJfwxcDj12LxQCR/A==
X-Google-Smtp-Source: ABdhPJyVGLD3pIUwDllaOAyh0KECeEj9Z5MxF/PEDD5PRs/ZcnbIVDDHh9VW+4L3f/5KCoQgYjwlxg==
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr4105302wri.66.1621512191654;
 Thu, 20 May 2021 05:03:11 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:11 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/38] drm/radeon/cik: Fix incorrectly named function
 'cik_irq_suspend()'
Date: Thu, 20 May 2021 13:02:29 +0100
Message-Id: <20210520120248.3464013-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/cik.c:7450: warning: expecting prototype for cik_irq_disable(). Prototype was for cik_irq_suspend() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/radeon/cik.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 42a8afa839cbb..73ea5189dfb1a 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -7439,7 +7439,7 @@ static void cik_irq_disable(struct radeon_device *rdev)
 }
 
 /**
- * cik_irq_disable - disable interrupts for suspend
+ * cik_irq_suspend - disable interrupts for suspend
  *
  * @rdev: radeon_device pointer
  *
-- 
2.31.1

