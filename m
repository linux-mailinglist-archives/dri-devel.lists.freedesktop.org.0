Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B17398CFF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8A06ECD2;
	Wed,  2 Jun 2021 14:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0604B6ECD0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so1852199wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ggE8ksbwsKIQV0Iz58/vSuT7hydgMXkIFUzJg2iRL3g=;
 b=j1G7oiOUGHpTTpz7N1iwCK31eRewhRnoAF2xf8UwzdvPqQglJHQm5wgoBIQ6wjwMjg
 q+7qtBtnoyK12VxJOtlQOffmMwgKbTIuSsCd68GxxfeKwYjeWzIsYGzSEVDq2HndGIUb
 s0CfACPN1haeU3M0PD3alT3nwpJs9FIPgQjWXh23qOIpQObjaH8OUA3kWOxCOAWVj+E7
 2W9MnyRFUEmy6xxuzqsPyyQ3tox+X6w7nOqTZ7BSJUVFprJlOmAmTG+6GciYpvGRtIcS
 P59EGzETOn/uvHje/qBYMvMjNLgD9tTLbcKTSAizUGThSDsa/RcOaV+T8FOJGiJ8ozDS
 dulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ggE8ksbwsKIQV0Iz58/vSuT7hydgMXkIFUzJg2iRL3g=;
 b=EZLyNy4ExiHyJweeEGsxALLLW2KDV6Mzsw2ZAa0tRekxzkpR+p0YWmyb4DQT2Y+kSP
 wBRo6rLURBlgitLY39P0DtApwqn4/MhmIFHbvyLf8GKTBo8uU586mWW/OcKARgqbj83v
 bax6RiJ2dgwdFj9WBRhrgA3kCJWAX0A35nMaW3BalOKEErwHAYiWzIHsgOpBrWDGuXra
 /hlkB/6TboX8ft5EDngL5SqkB0jsM8ZahZPB5CdmSteLjQXCvxne5rH21IYbFOqFUfB3
 nIYNR5Ewde5W5ECXOP+n0Jf8Qtf26nfVVOH1o5UCFh3OZHOwz+00iuvc7rfDOlg4ve2u
 7/fA==
X-Gm-Message-State: AOAM5330sj5MOE2vdRn8sZSBl4aEaK3y4fL2SUIvYdvsTtX7A8pHTc0G
 Gu8h160C7X/jc8647J+yNrAesw==
X-Google-Smtp-Source: ABdhPJxuui5QGQFjB6ghdF42kN+HT/+I/xxE44H9hpyRue/mdRNGI3/PcvlzK7bQqwgrsMF4W/P4qQ==
X-Received: by 2002:a1c:a7d4:: with SMTP id q203mr5573033wme.39.1622644413721; 
 Wed, 02 Jun 2021 07:33:33 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 23/26] drm/exynos/exynos7_drm_decon: Fix incorrect naming of
 'decon_shadow_protect_win()'
Date: Wed,  2 Jun 2021 15:32:57 +0100
Message-Id: <20210602143300.2330146-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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

