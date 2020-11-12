Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1FD2B0D1B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C0F6E332;
	Thu, 12 Nov 2020 19:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3336E32F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 10so6193553wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OKxekprTcNWz9+T5s0dM8zcd4eG/OHSFQB40CDP13bg=;
 b=rHR1M/HdLeknkhdU29h/wSKR0Z784FWvAxygS4TEan/fVybAGYjXtGeA1aoM9wZq2h
 hJiib9TAK6qzqOPC5rHAFJjNejPFMssv1+/K4OmOnGa39NogI/tywrL6omtcFmPdI9kh
 C34/RfRcMWoBB6S714oSu0qmqNLzJw7RkXY/Fsnjb26TfPCMxXIDHMl/v30JtcEsf9tu
 dsgMJA948Gy057X021/jxsOOlK1glllrMFEO7OYqEGlqBxdhBo9SsRAKwdKzinJoIjty
 yqKbeI9U7sNRB58SxGKWahgWA7HSvwb0Epayp4Q3QswTqC5iMrtjr0dviGfcPuyQqaef
 5LWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OKxekprTcNWz9+T5s0dM8zcd4eG/OHSFQB40CDP13bg=;
 b=fm7alLQ71EFrfTwoKPLIn+rWDInRD6yr3CcBO9i5044Sa4d+o7AfhX/1622lWZr+08
 v1FoGVI66TpSnjFxpr2PtiXt1zzr2vu7HXjpZtUPLl8aJkIqP1uabXbkTsOIz3ZbK1Mf
 RbKy+IIPTkpKg0tHtSgMxoFOEpPkrFXpP1nf7BpYYZ4Lj80+IGY8JN6RqTMJ7adra+t3
 VttKiCxx2vgn2uYUahXYV1V7zx10T+oKlu8/PambX4hJgxTm+ndfAD6xlyLCIrAyHOMp
 +7n4eyziPD5m8jJMiakLBF+6h+h5PBVFp1a/L1kQZeapJstybQO1B1/2f+zj7gR7PuVC
 0ung==
X-Gm-Message-State: AOAM5310wicawZ+R3rXaaB/LF92/BLbwBTcgTEU7mdu5P4hScXkcGECN
 CpO7DeHD5xcJf+aVE9uxx1wXJw==
X-Google-Smtp-Source: ABdhPJwyuT8LCe/shjgpHpT+VZjAVT+yMOF/6Q780jWrw9yW9KSyX2R93GMP41cG3s604agpMz7/fA==
X-Received: by 2002:a05:600c:2285:: with SMTP id
 5mr1045327wmf.149.1605207663296; 
 Thu, 12 Nov 2020 11:01:03 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/30] drm/exynos/exynos7_drm_decon: Supply missing
 description for param 'ctx'
Date: Thu, 12 Nov 2020 19:00:17 +0000
Message-Id: <20201112190039.2785914-9-lee.jones@linaro.org>
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
