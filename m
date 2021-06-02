Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80829398CD3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245F46ECB1;
	Wed,  2 Jun 2021 14:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ECE6ECB4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id r13so1454809wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9bRhyWuFVpQrG3EHXZKnG7o8XLPNhfRhn1oXXk6SrQ=;
 b=FYmSxXOaVJ7u/hRBRjCRyMs468oivh2TsgX2RGPglQBkpugM6lgQWldOX0rIaOfXSP
 YVzbQwXiDA9smCQzDmzafGN3P1RprMVSNRl3BnqKNAfSQmT6ulR1Hv9/6EfLwMxmyo7z
 P6PyagKgW4BuWiOnsMTU6Y0JhWJJEX+DY/1Vv5eHGNSpouz68kzJzZutQ3ZV1CjhkM0H
 kzzsCCmphlHG62++alAVxt85h/Fj77OwkErFTBbHEy8olwx4eM1/k+Y4mKMUCge+8YMs
 14iIaeDvwMBwEKhfGiiU3WYlRVTOwA3gMFv4Xuf4/f9BthCK8u4+iw1ZJjxGde5/Bfuj
 qe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9bRhyWuFVpQrG3EHXZKnG7o8XLPNhfRhn1oXXk6SrQ=;
 b=WOqCGiDPco69siMjF9e9HnTOgInWQtkIZh4DuWQJFKaEln/ns7S56k/pECvGYVtU0L
 reJXwobe9ETbw+Psl/uu08/t0CS5HE4DyjB4MFOtj+gMJmIv935cUPAGgXlpfNCl5mpU
 QE71MJv83iZeV06V0Fc4gHSvM/DFWEPRUk96udfYh9aKrmBB3m3cNkEzz/XOQ+eKb5Zu
 K1tZCQKu3uwZY2vyPQsE905ZfCXxtTs6oISEm3ggwZkk8vWvW9ihvTFLv5J01jjvc3aD
 kmMhK1HiNujwgkqFc4k0u13jIWmTM9gfCZNV6jHxuRQlYrCaHXHbeM22CN0fz+iz+lzV
 +eoA==
X-Gm-Message-State: AOAM530MR6Mdn8N9q1jZKyQNub9AX2UTMoNSufufRD9NRTRw2H4uM0BO
 VyamPx0r95tW8sMULMKEDWk/0g==
X-Google-Smtp-Source: ABdhPJzsdddao34LRabPBk4flX5Gv0pUOZLrhtePOoQ2SzMzu4f5Lqu++Joq8p3Yl+P1MsCSIKI/tQ==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr33825781wmq.119.1622644391896; 
 Wed, 02 Jun 2021 07:33:11 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:11 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 02/26] drm/mediatek/mtk_disp_gamma: Strip and demote
 non-conformant kernel-doc header
Date: Wed,  2 Jun 2021 15:32:36 +0100
Message-Id: <20210602143300.2330146-3-lee.jones@linaro.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'clk' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'regs' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'data' not described in 'mtk_disp_gamma'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 3ebf91e0ab412..3a5815ab40795 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -29,10 +29,8 @@ struct mtk_disp_gamma_data {
 	bool has_dither;
 };
 
-/**
+/*
  * struct mtk_disp_gamma - DISP_GAMMA driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
  */
 struct mtk_disp_gamma {
 	struct clk *clk;
-- 
2.31.1

