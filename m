Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3E2B0D1C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90576E39B;
	Thu, 12 Nov 2020 19:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36236E332
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s8so7133503wrw.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9VZRZT8daPeGmypqlkiDD/bg2WPWGzH9nAJzamvIbC4=;
 b=cX9+YeCqT9sC5aPbLf/Z1l7f1X6pFMGszA2M2We1Q1ujxzgtnQJ/o8rksf/vFe4jqZ
 hQTGnYQ8u9RsD0LmmkWZr9PIymGaGFTOrqfpso6SG6bNRwOUrGx+7f4D7Z52mxOfCdmo
 OXQ67Xozr/0PHcjr0mR8c/6p3XNT+wsoVaMxbRmFFgqyEmjNdS78DB6WM64yWp5A6MXO
 FRi5mjieC+KYIHYTAdl+Ljc0Qvn1hyKCOt88nQbIXtJTeZ8HZmAdAzB5wsIgijCuFIFk
 1hf8gpXqOUolQ0BigNhDvmML9OKIVfKx7wa7wjx3tWCh4Oi//xUVdvBoxco0NohraCtE
 WJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VZRZT8daPeGmypqlkiDD/bg2WPWGzH9nAJzamvIbC4=;
 b=UTBG14qgW6fWFFaB0wtLb1PAzfduUtoOGDzX3CJcpoat7kgV0m2l36Q/Ih9gA/0k4s
 eWJH/nTFH6ZTyF1rfIQopqOLyGdliEwx+RSyI9zt3Yob6PMx0i2CUw8W9M7b1qe57Zy4
 pKfwZ9VGUl99VMA+OFMfWfKz0WLEMMZOvmuC05wOeZdNaNCl9XQ7M3f63Ee8rwzk43zQ
 DslrAZaDn5itNAKdalpDinuQJMbZCevqfJ9pbe56pQKFRvmPaZ290o2cvt2Dbq7JKBsZ
 FrJD9PN0jeMDa+QzF6BDSnefHwwvUYYt930DKovc6XBmPAfADBJDhATMIKFSCvFsDNnD
 nT5A==
X-Gm-Message-State: AOAM533xkMk1From2Kyg+yyZUXQ1nmobExQp5n08OGbsGH9XNhGdgEX6
 vKlEOPUgkDGaW1H0ZsK/kawbnw==
X-Google-Smtp-Source: ABdhPJyR+wd6FhkS0NkkOKAYgU4dmP5CIQs3cXDU8ZMCkttt1IuxpT3+zhy8UwFysxWYC+JRR17X2A==
X-Received: by 2002:adf:f546:: with SMTP id j6mr1145810wrp.219.1605207664630; 
 Thu, 12 Nov 2020 11:01:04 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/30] drm/exynos/exynos_drm_fimd: Add missing description for
 param 'ctx'
Date: Thu, 12 Nov 2020 19:00:18 +0000
Message-Id: <20201112190039.2785914-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_fimd.c:733: warning: Function parameter or member 'ctx' not described in 'fimd_shadow_protect_win'

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bb67cad8371f0..49a2e0c539187 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -725,6 +725,7 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
 /**
  * shadow_protect_win() - disable updating values from shadow registers at vsync
  *
+ * @ctx: local driver data
  * @win: window to protect registers for
  * @protect: 1 to protect (disable updates)
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
