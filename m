Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB52B0D41
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33C66E3F0;
	Thu, 12 Nov 2020 19:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642EF6E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c16so6438765wmd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV20qvkcXuKJ/8kdoQy2xSMx6pSot2KZYylCMdc97vk=;
 b=FLer8tlTJpW9/03wMweKDBS55avbIBPNMLVtPNnoxD4MVGnFei7f6YAUPIu9J2n2Gg
 +Pdyq75fTNEUeCBTcdXceFn0HzcUeXJxghFUDF6I7M4qx6yCAdYvds2tB5Np4BBOv2cI
 t8jYVNyEU0qnCvxYIhyWwRsHymc31CJa6rbyWGWmd4psXhR2pAvKq9sYOjLn5yYqxv0Q
 IdoP1C1LJvHsCcTkD6WmAjsOOSxxFTPTxeo627RMfQDiMpAu/4GwmOBwcNLcpStOKMqY
 Hwtv55Vxa1wzZdsOhTxilW8KPfa0IwU7MpU2MuMucnSHkdEn5I0AxGoJ+GAbffpCBMJI
 tpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lV20qvkcXuKJ/8kdoQy2xSMx6pSot2KZYylCMdc97vk=;
 b=hQ4kALj1RFT65er7t+8pDznr7V0dsDu7eeQAEyFrxwBBd7B5SkEwy2tzzUhgPDcCrK
 l9a6wGRExfZFevifi6RbFAcLflOZL1qCEbMcAm2DE/M9HuHj3Ih2UwG8ZqpgWXgDLWeM
 IX53pDdhTstRjWSOr3TMVktKq7fe0b4ehXSxcDQZRFCM+4WFym/zCyCN9t8b+4jrPL7L
 MRxglj4/UzFyKRRCbnmIIY/IOEJ8d3m1gRXbdNVbRoZlDFYyL/FHlKKZc/tQua9nLtUr
 AEDd4X/1/IkIGDlzSvFW81iCeWK8M7ymqOgWLUSf406oMLeW2S7Sxp/hc7ihMa3gfEzV
 c73g==
X-Gm-Message-State: AOAM531hWuIMGz/S16jvxKFlR9N3LdbHu6OgIRGiDqSshWkvPcd4mw5s
 0ylaRa9Vnxxoe7H4P3mQTt+K2g==
X-Google-Smtp-Source: ABdhPJyAsIo5Mm2tjgv7zGGnj0raCm6z8NlmoYajDaNb+hIDZ+v4dJAu7qWeEXrYmi1tid6oDwkBWg==
X-Received: by 2002:a7b:cf05:: with SMTP id l5mr1029949wmg.81.1605207711389;
 Thu, 12 Nov 2020 11:01:51 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/30] drm/mediatek/mtk_disp_ovl: Fix formatting and provide
 missing member description
Date: Thu, 12 Nov 2020 19:00:39 +0000
Message-Id: <20201112190039.2785914-31-lee.jones@linaro.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:75: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:75: warning: Function parameter or member 'crtc' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:75: warning: Function parameter or member 'data' not described in 'mtk_disp_ovl'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 28651bc579bc9..74ef6fc0528b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -65,8 +65,9 @@ struct mtk_disp_ovl_data {
 
 /**
  * struct mtk_disp_ovl - DISP_OVL driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report vblank events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report vblank events to
+ * @data: platform data
  */
 struct mtk_disp_ovl {
 	struct mtk_ddp_comp		ddp_comp;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
