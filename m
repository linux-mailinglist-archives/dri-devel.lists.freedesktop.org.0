Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F5A2B4DAA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DE26E9ED;
	Mon, 16 Nov 2020 17:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC66A6E9ED
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:32 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c9so33658wml.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV20qvkcXuKJ/8kdoQy2xSMx6pSot2KZYylCMdc97vk=;
 b=Zrf2ywI6nk+V0LerSSoBh85knKxg9wJ+fPH0SnSGqaqQ12rxleOIn+iiCOD32LvrWe
 Bkf/Wb6oGiBXh81lSfbbUzMj46qGlT4x4+1uL52OqwD66udoi+19y2OiHokqejefMpki
 LmeWQ+MHrkhBMuJk+MdgLyk7MESyvv31arSx0QUkqSIS1x66KRZp1d4y24TPZMNm83lQ
 Z/8XQ6zO07K0BXmGzG4J9egEP+HIctkyoaLLrtPIWFXQNAkfouPKrKFL3r8kdJz9S87x
 0LJf4EPdEEJ9lt64nU1UXv2v/MlEJ25+E2sOtvy96/QpqSBFGgfC2NTk1OGeGMfirb+6
 SY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lV20qvkcXuKJ/8kdoQy2xSMx6pSot2KZYylCMdc97vk=;
 b=uXxhriVIie8zeXNs1v38Gp45TQ00RPnYflDY1F/Ok5UO8SzuXmuSip6pwlzBrv6Ucz
 MSPAuqzpjLkNYem+rHJPQIOOHZEGLL0DlUhZE3CdQN8JBIcKPibmRjHgy7zvBJDuW3UF
 9ZrO3Z1zkSyfQSKdxZFjcfo7ZWLDffq0C7YXo9OPXrN4MdN5slYbcNegISNq1BHA1vOE
 V2atatobvulo/D2tT/x/YeFTVOcV796986LNSrsnsxeEl6g2f5TmsTiQNXEn2QCs656F
 y1OMAx3GfgawDD45T9yHxZUe/qamCRhOw+1M4PnbVBg9+rRZ6TMG+tJevwT7p7aO7/v8
 ITMg==
X-Gm-Message-State: AOAM531+/dItCpcw4XI47vzgF01woS5qQpR8CgVV9XIi/r12nH5bNcUA
 60WX01uJUfiyv7rJZk+c3ThCKA==
X-Google-Smtp-Source: ABdhPJxIdXRERwdbm0KN6pgN4q/8GjFcbWLDvydipEOB1BxVtliCNpiCbiQUfPa+193dGkiQ5Fu86A==
X-Received: by 2002:a1c:658b:: with SMTP id z133mr7692wmb.1.1605548491414;
 Mon, 16 Nov 2020 09:41:31 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/42] drm/mediatek/mtk_disp_ovl: Fix formatting and provide
 missing member description
Date: Mon, 16 Nov 2020 17:40:39 +0000
Message-Id: <20201116174112.1833368-10-lee.jones@linaro.org>
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
