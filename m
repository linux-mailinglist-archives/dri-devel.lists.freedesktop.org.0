Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC2D2B4DA4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E516E09E;
	Mon, 16 Nov 2020 17:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478616E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so19632036wrw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9VZRZT8daPeGmypqlkiDD/bg2WPWGzH9nAJzamvIbC4=;
 b=XIGydzF8ll59VzTwx4kHtiFKr4QqwikhLjU4KxNpkNO0xFCL6gbiHerhnJhc4VxFsA
 U6pAgqWoIzexOQ0HWONoLIorOt3ftCEcbtmeiCda3OiE6Q72KGWBPqJJQKx0hgUfEVSf
 Tokld58vv6fEOMcH9k9iiyKKM3S/RQH6KV4AGzmwzDlio0XzYHaq/AVLFHWrTM1qpnMf
 av3wkbOtgXzfr/5bc3/4hFY1W/OHs//CUW3gR4SIMavAauqcawoq2bTvMQkTrqudtJgw
 lL2/5lwSylp+ojXy4xQQQ2jyjvzJZywj1kLJnzLlJrL2RmjhIUmQOhYEIctCWcIZvDRU
 rK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VZRZT8daPeGmypqlkiDD/bg2WPWGzH9nAJzamvIbC4=;
 b=MF7iIx2jaYBfeGXhCY5upMm8UbkrOY9Mgu6AtAg8vxrnUo6drVQgh0mlzcaPVwcykF
 dRbDPVMD8YVmIu4nms4DCwu09q8xMxjz64aSUVyuGIWdrC3T1esv7VSmmX0JEh92Dt8j
 +xT1feTe2WUkW8eloypToOEy8DFgMK9xU36tH6CZucvhxCYD3K/+ihpfGIOCAUAe/d4j
 krCPXWHpU27GL/mOJc09oE4PnT3Ep3ej9FJGDSQ7izd3IlvMoCk/6+6DUFWxKP0S2cKT
 6cbMYzWuF1E+lwRZLgjqUUVB1SNYxBRymXv3jS2OUeV4B3BgRkOeJimbw/iTY02rIQQk
 iHLg==
X-Gm-Message-State: AOAM530cTy1i0Z8deGJqOgWivKe8+baCYVAaI7eJBmT1nG+keyUKLqC5
 zzFGweN+6O/95tM7674dXc54vg==
X-Google-Smtp-Source: ABdhPJxJkSZPTj2E1cruHSDCJr8lL1DADQ2cLxDq8PU5VnhLFEqgzTcMDJzB1wObuub61ameieOo/g==
X-Received: by 2002:a5d:510a:: with SMTP id s10mr20122601wrt.402.1605548486009; 
 Mon, 16 Nov 2020 09:41:26 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/42] drm/exynos/exynos_drm_fimd: Add missing description for
 param 'ctx'
Date: Mon, 16 Nov 2020 17:40:35 +0000
Message-Id: <20201116174112.1833368-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
