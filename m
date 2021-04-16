Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63563622A4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0951E6EC2D;
	Fri, 16 Apr 2021 14:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEFE6EC25
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:07 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id mh2so20938126ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bA3VNq3Feo1uFNYW34E08QP/aWuR+Zi5iKb1slTOBlo=;
 b=EpresJv3oxdkRa73N4qO5mqNyusavfyinoagpMqdTNBLEwyapmyju32mOy69LbGwAb
 PKyMu7Q6ZIuPsum4Z9ilcND5EMdTidVJkcHBRFh5EStxPKiNPrNgms1x4bJMUn1BYMv8
 ZmAXu5rOl/UQD5k4yVrBQIeMi0E1OHimvrK+vISAIceGPBXfZJIOpE6SJJgAwhkN0+Su
 4CZOMW/fcpzjEcOxORICsMq8mwDgmiwKheDEqsLD3dh+S/siNXSVN2HKNRIolsC3KESd
 2qotwCmMo/3sqD6GSrsdC3utmoPtZ3TxOYVyu+20DOH1nSaQ/5C+8WkRYXL1g33KzFYW
 7h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bA3VNq3Feo1uFNYW34E08QP/aWuR+Zi5iKb1slTOBlo=;
 b=g9fN5YsrTC2dEubAYOedwOoDPhsvTtXS7HdUoBUyqoxaGbEPU/i5RLpF1/43PSA+74
 dU+FMJwRQoZVMyX2/yQEhrO49MDVWFWTTWRJ7DBOpDEkD5Jm0OxcSEU/sM3lqWLoeaCe
 iY6OunwkW1/hvNpeBlvohbMj81cGS+lGH2I8lFgtvzaDhX8E0tBmfsA6jbTl5JOqOOBt
 bF74zBqKjT/wrPr5BC/QObdv4mAwFCCxSBFjFOfddF+mSXGwu2FKxY0EMMUWjBzZ1zUL
 Zf71CMrYMLgwKcknxrfAd15nkNF5ZOO2+azjKXDkJ5P+RlawcCnqkpKXlTgnjt7KFLzn
 uv9A==
X-Gm-Message-State: AOAM533ZCq6/8Ir1Kd0YQC5VhUpG1qpdvSIM+W5FtOyeSG7NggO3wFtA
 xZCQLJEu3niusBVVMlTswvB8Ug==
X-Google-Smtp-Source: ABdhPJz0Av/4GzzPBzpk9DQMPQLOCLl90p6pmdgdorPTNCUkay+c6WXVyuJZ9MLadBwsyp4rd9LWEA==
X-Received: by 2002:a17:906:8921:: with SMTP id
 fr33mr8554450ejc.151.1618583885920; 
 Fri, 16 Apr 2021 07:38:05 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:05 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/40] drm/exynos/exynos_drm_fimd: Realign function name with
 its header
Date: Fri, 16 Apr 2021 15:37:19 +0100
Message-Id: <20210416143725.2769053-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_fimd.c:734: warning: expecting prototype for shadow_protect_win(). Prototype was for fimd_shadow_protect_win() instead

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 49a2e0c539187..ae576122873e0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -723,7 +723,7 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
 }
 
 /**
- * shadow_protect_win() - disable updating values from shadow registers at vsync
+ * fimd_shadow_protect_win() - disable updating values from shadow registers at vsync
  *
  * @ctx: local driver data
  * @win: window to protect registers for
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
