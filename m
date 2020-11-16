Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F62B4DA5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A906E9E3;
	Mon, 16 Nov 2020 17:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B346E9E5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so19671117wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OKxekprTcNWz9+T5s0dM8zcd4eG/OHSFQB40CDP13bg=;
 b=K0L/9SHj1TE4qgK/G74Ybc4BmPXgT70P/+LQzzWk7FqljjPYxDyFVBlO0hyHH3Eok5
 WcZKuIqWcNwV8S4EUwH8l7RzxNih5aR0EM9Hs7pODYsYMs9n9Ayv2dDmr2WyL5Hr0Nld
 dK8/Amdzuk+cPNmMGrkSlM8MIBabHVMUy5c81Qg4eiMjJsSH2tSlQAKiNc57EqDo4THe
 F8MYpIg2VS50N2/OpByLFDpRhEJA99set0DNg+4TdqFgqNC3Fh+c+vyJfI12wmxxqxyF
 VZsyoC+ZHhP+ZbBgejKK9jahMArlb3Rd3uDqr691znFoNLsleg8+x+2A6ar0ZLvs1tAK
 9g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OKxekprTcNWz9+T5s0dM8zcd4eG/OHSFQB40CDP13bg=;
 b=XUj1r5iLRbp8LOKsKdax/ls4OfZgaGz/TKW/of8/MHYVkmsl8Kzox/FbmBtzNXjqhg
 0kiN0QdZ78g2pCrD7TAu6VQ1TukftxOqkN7tDUiwZN6sVkUJHhAIXRD4I49Zp+ZnaSUh
 A6/8KChCqsJLNoCZVu+MmfqAqBPp2m+PsMtPWno0XMIKpxbQI/tI3YG3/xIuu/4v3mqE
 wSI6gxyjfjYuW6Y+A/gxvAmejsRx4fvvwszxi66N2Cs7Py6h3vlojPBJMVk/eA9vrQW6
 1KLEb0Ff+K76qpRlztTwxs/kyhjwHiWp4+G01GFM/gwcCpDNwDhoNUfnt0QE1ZJX//SG
 9G8A==
X-Gm-Message-State: AOAM531QVazFQ7vvKVklA8JrEEUBz7QJ0XGszvulSLIEeG/+slnOrt9j
 2P+/LnCKXHlmCMYEeTAQeMBO3A==
X-Google-Smtp-Source: ABdhPJyumUoV2OiCGOmwstnxb6PtqFSofQ2hgjkU4IZojdi/6zntKSiyOYzsOrC7hc8z/Pjmvb2eVw==
X-Received: by 2002:a05:6000:110c:: with SMTP id
 z12mr20265161wrw.214.1605548484458; 
 Mon, 16 Nov 2020 09:41:24 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/42] drm/exynos/exynos7_drm_decon: Supply missing
 description for param 'ctx'
Date: Mon, 16 Nov 2020 17:40:34 +0000
Message-Id: <20201116174112.1833368-5-lee.jones@linaro.org>
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
 Kyungmin Park <kyungmin.park@samsung.com>, Akshu Agarwal <akshua@gmail.com>,
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos7_drm_decon.c:354: warning: Function parameter or member 'ctx' not described in 'decon_shadow_protect_win'

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Akshu Agarwal <akshua@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index f2d87a7445c73..431c5d32f9a47 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -346,6 +346,7 @@ static void decon_win_set_colkey(struct decon_context *ctx, unsigned int win)
 /**
  * shadow_protect_win() - disable updating values from shadow registers at vsync
  *
+ * @ctx: display and enhancement controller context
  * @win: window to protect registers for
  * @protect: 1 to protect (disable updates)
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
