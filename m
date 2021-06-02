Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF029398CD4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959D96ECB6;
	Wed,  2 Jun 2021 14:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC046ECB3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id n4so2555447wrw.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMlp5Ni2aMFHyMfn1NEHDx/+WQIjP8upodgZGGEhVrs=;
 b=K+TM+jok6dmGLiVfdJ5aHvkAyTXlaxEkUvu3eR15jQnSiQZDOVbl7Ad7UABtuK84F+
 SiGyWlm0Q/Roo4MaHxBw0hVagJn3kB7B36ned7f9VZ7qKdW9ew8tDax4JyeliwEfgol3
 LzTH/V9mmfZPWw8etltfOUAbOOTdt4Q0Ftc5FSS8fWAxZyn2LdeeVc0x7fAv7i5SeeiV
 RyQyKw94rLiFXSNIvLFJOHuBXAj1BVslRvQMMPFHt2y5OtRXJV3gKAa/0ebcSulVTrhy
 2+LLiMiabV/zAlV49XtTFoV3pIDQSZGzBFWLFN2PAdXSdV+a0OFPsprrfDXJgipgQSRi
 8lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMlp5Ni2aMFHyMfn1NEHDx/+WQIjP8upodgZGGEhVrs=;
 b=EGCSL5ZCedN0q65vB3fU9O4mfN5vc3lp0nCjXDBi9YjcYwDfO1sP4pVXvv4cstz+pP
 /beky/mXsB1vqYVU56bBS8a240aXtGaLZw0Xp8B2DNC/q9gwB1kAxzlcgZBwi5rxtAvq
 B2reGdkVQe7uc5RgmmVVrGobpvVmee2o964U4P8vgTq0nLH+ajdxZvcxnyeO0Gbvd7hc
 2YKYcNh98JjM3tjjDK3ExWW/SInK3uOV57ApYx5PllGsXs/gzBxoFGIA8wGJxwwkHCVR
 2qrXhdrxajsGfwnCGFJeXBaGXTDbYPvzGvs0tt/BbW57t4edvX7SC/hnHEsYb/3ADBT3
 PadA==
X-Gm-Message-State: AOAM5316fsOE78O4zxQxGWAqIP28GMS+CfpCZmMnjXd2htTKkN5LccDT
 Zwb/EBiPJsF499nTfUKeSr6hDA==
X-Google-Smtp-Source: ABdhPJyyjExdHvRbSDp8SXi+SPDREQCiQw3FO2lfDCB5q7ocoF+sb8JiXyCVcFPptQi4DQIZ2IRr1A==
X-Received: by 2002:a05:6000:1542:: with SMTP id 2mr3202490wry.4.1622644392816; 
 Wed, 02 Jun 2021 07:33:12 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 03/26] drm/mediatek/mtk_disp_ovl: Strip and demote
 non-conformant header
Date: Wed,  2 Jun 2021 15:32:37 +0100
Message-Id: <20210602143300.2330146-4-lee.jones@linaro.org>
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

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'clk' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'regs' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'vblank_cb' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'vblank_cb_data' not described in 'mtk_disp_ovl'

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
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 961f87f8d4d15..fa9d79963cd34 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -66,9 +66,8 @@ struct mtk_disp_ovl_data {
 	bool smi_id_en;
 };
 
-/**
+/*
  * struct mtk_disp_ovl - DISP_OVL driver structure
- * @ddp_comp: structure containing type enum and hardware resources
  * @crtc: associated crtc to report vblank events to
  * @data: platform data
  */
-- 
2.31.1

