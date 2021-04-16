Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C618E36229A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67786EC16;
	Fri, 16 Apr 2021 14:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0526EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:09 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id w23so26672399ejb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrproNEUMCgSjmh/8B0I/rNyBQoaOU4LantvG8VttuY=;
 b=AbhwF2o8lWGjI+FDsAThxXdYjTFw6ntHJ+FjLaceNvJgOS2Y7pl+JkE3/1i576V58B
 YvDUmpqhZuyg4ON7XYVatcqM580H8JN3lJS9HLyvlLYjuXBs5xAjEta/3co9QOEIr43v
 XLrqP7juFl6LHY7r+NdZVb0uIbH4dibSpJu6wGgmMky1EuVOjhAXtvsFFHpR0y46mchQ
 rNSYZwaCr8ePffvLwn7sdYpMKrD+vBBEloIRYGDJwzMvm6Upd6Mr0PlQYUiNkmTcHqFp
 eVdmSNrJHUvjzz7h9vB9PlsqKdu6rTezQq6HeQ7z78UZtM0LGOPupSB1p9WxIUVHznWW
 Y/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrproNEUMCgSjmh/8B0I/rNyBQoaOU4LantvG8VttuY=;
 b=H+XQghv4Gz3xRLXPiMG/jhDsM5XfS+Omlja8ZqRdWK3iZtWuCritoZuppPqTHvedrP
 JNgQFVqYVtyK53w0pxa4Yk/T4nZuS0rsL2IzaR+jQkwsCX6b72quONZjDXqpcFklYdR0
 W0/6sQ2Ue5KL8rhVvp+RVe37u0SYOwTqDeOxisloV9k2hEjA06CigeDXDVxhOFLObF+k
 KTCyMwlv0lXfoU+veUc/l/DX4T98g7iTsuj6NQua9V6hbolxnhaGFERUL1crDv1Tvard
 AN+Tu3hhUAV7V1DRGDNUTaAmBCD7xIh+YdCOnI3KPEn9D8gzYkx1AS/dj9ojdwHxW6Ve
 wB/A==
X-Gm-Message-State: AOAM530KtMZXZ/lgNNIRdIVGRX1St+jyoPI9h5za14L01wsSBdJAE8dS
 qWlwn2pA0OYsdElrSuzakEznbA==
X-Google-Smtp-Source: ABdhPJxRohIyR/YCoUD5YI/XkzLdyuPidmXlmk0d8AmwuQ7/5UcOVVluw10vUFCBA6T3eZAmMx7dlA==
X-Received: by 2002:a17:906:dbcd:: with SMTP id
 yc13mr8165471ejb.99.1618583888233; 
 Fri, 16 Apr 2021 07:38:08 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:07 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 36/40] drm/exynos/exynos7_drm_decon: Realign function name
 with its header
Date: Fri, 16 Apr 2021 15:37:21 +0100
Message-Id: <20210416143725.2769053-37-lee.jones@linaro.org>
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
 Kyungmin Park <kyungmin.park@samsung.com>, Akshu Agarwal <akshua@gmail.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos7_drm_decon.c:355: warning: expecting prototype for shadow_protect_win(). Prototype was for decon_shadow_protect_win() instead

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Akshu Agarwal <akshua@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 431c5d32f9a47..9b5e6f94e5585 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -344,7 +344,7 @@ static void decon_win_set_colkey(struct decon_context *ctx, unsigned int win)
 }
 
 /**
- * shadow_protect_win() - disable updating values from shadow registers at vsync
+ * decon_shadow_protect_win() - disable updating values from shadow registers at vsync
  *
  * @ctx: display and enhancement controller context
  * @win: window to protect registers for
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
