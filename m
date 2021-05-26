Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8C3912D8
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1636EC4A;
	Wed, 26 May 2021 08:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DB96EC3C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:48:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m18so230620wrv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ggE8ksbwsKIQV0Iz58/vSuT7hydgMXkIFUzJg2iRL3g=;
 b=Hy0ql+D+VGg49Du6KbG40hVhYesQ2E2Ndg/ynB7+UJ1StONSbrjQ+6zw5j4EdKAPUf
 vLlTOh+lM5Cu3sf8fG0L4nqYGeqYUzs+vzxd4njx9dw3xN55MJdLlaAIntnWJdpG5fPB
 0McOglFQLjFGo8AJQm5QwUUQFq6fTt/oIBi7vgQGTT0tuQrR1lE485jgjq4PgdrpIS+1
 tyEhgPAyz3MWZh5/Pc/eTI1mYKBfcJagZ9U23p6pw6bzT3bNTg9o8xm+xnrOmEPNyou+
 jTy335350RYr4C1jh94IcPIqpvp+iNNJ77mpL7sjHLVH0mytrzYUvSwFPN4OQWtHYTR7
 1SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ggE8ksbwsKIQV0Iz58/vSuT7hydgMXkIFUzJg2iRL3g=;
 b=TvL4wzFEExtxtKzq//it+ouRkL5wx4d6dYITEp4UwCBS2Dp6AHieUj7BNwPikEbRXD
 yfRhJRmkPeiESQQFGLc93e7XAQ7kH+RdKXMC79oCexefjimRYRyF4u2kPcR66fv6JR15
 9UQ6USeolaBH+lg4yzxTD8PokLE+n0AmqtGaSdjzJFTM5QQUrzS50e2zXe1MJmUEDaEf
 CsjnF+P81520aA9XRUWvWsOIdiy3hkoGgPUKywe8akGOgAl035zod4RvfVr1eu4EKZe9
 oYzNC1yp/iwA/G8BX6hnOYsONXKCJCG/gDC+X/clypmJAukcIjtzgIvVIoSbIijxLzGg
 BXmw==
X-Gm-Message-State: AOAM532/tJAsqwp9doGQemsJs944dZoWorJsK2jnAgWIlcTDd1sGPdOk
 MCQku4JYa8RFOyG5QeMSmYNgdQ==
X-Google-Smtp-Source: ABdhPJxA//TvN5osdqDahzA5dNjExjAswHrw/HX8QfAVXfcltB7c15dB9vYdU164lPB3mSqnuMI0DA==
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr31628412wrs.333.1622018883237; 
 Wed, 26 May 2021 01:48:03 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:48:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/34] drm/exynos/exynos7_drm_decon: Fix incorrect naming of
 'decon_shadow_protect_win()'
Date: Wed, 26 May 2021 09:47:23 +0100
Message-Id: <20210526084726.552052-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Akshu Agarwal <akshua@gmail.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, linux-arm-kernel@lists.infradead.org
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
2.31.1

