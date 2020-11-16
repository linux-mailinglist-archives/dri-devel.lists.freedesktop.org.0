Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4E2B4DA7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F01A6E9EA;
	Mon, 16 Nov 2020 17:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C186E8E7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w24so54724wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E894eMua3BcyVtBQpbTegYEGiTjlkwuli5uk69Q3IOw=;
 b=iE+GfQv7S+GSvLz2XqilNiYCnjVAF3dl0i1NdZt+LoSFIRELaZUc3+iVqUhwSYL0aL
 pjti1ADepOb4FJkdojySoQwMDaPrwh7j6aO88NbHuD+w84SjoGK0W2eUvbUHE5pG9eNr
 pViE4R8pwS1eyXthtq+uAS/Y9RT47NfD5j64F8teilBivL8FdqFk6gOihpy9n8yRTglP
 lisu3mYddSpY3XWHFLYoda6EU319ZkdjHtvRyPZaVUwaz1/TvNiXMv3VWuIHTWT9xLbf
 Rcelarr0lAeUtKHga5xymhwhANiCRxFrOKVXBl4V0qNoneN3zTpuk3fXRa9q4v3ewMbx
 bMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E894eMua3BcyVtBQpbTegYEGiTjlkwuli5uk69Q3IOw=;
 b=kiMlXkf6SMape6lUMDACqe6RNEI8pnm0TrnQ+FBvcAkbzkJe3R1frVdJG6wEMAf3Y6
 NueE2DIwpssvUlb4K+ZxOOE3ZSf+OLkdQxSmirZI6aN7RaQ5Ld++gUQ3Z7Q0Rrk3zwp8
 XC6981hUsMJfZ1kOfjhp4yDBBt7X0bBZ8BPHXQRi2F7Rx2iMgFHALUb7nuqnatsB1BoW
 KqWerR/k6kDjDFiTkJ5hEE6FqhNG6mVakG179EpMw2ifBePe2lQWCRKh2KwnhZcDScre
 gx9an3SKDDo3I93roWA0ziCGCPMXsWVYoffurRf62hy7lSthbfxLCYukpst35AAF6DSk
 cLnw==
X-Gm-Message-State: AOAM5326ON2MrCDIpWFDIdFSYlmVG8Y2VDFutdQZsjJwR4ygCevm7mkU
 5d7nFAVbdoZi3Z+jwQVYPG7EwA==
X-Google-Smtp-Source: ABdhPJyAtdkZ7H/8C+uFfj6r311zF9vn30gnWin/fN7tzo1uOND51VmS8moUU4d/wdcd/nghzYnvaQ==
X-Received: by 2002:a1c:7202:: with SMTP id n2mr39184wmc.38.1605548489918;
 Mon, 16 Nov 2020 09:41:29 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/42] drm/mediatek/mtk_disp_color: Fix formatting and provide
 missing member description
Date: Mon, 16 Nov 2020 17:40:38 +0000
Message-Id: <20201116174112.1833368-9-lee.jones@linaro.org>
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

 drivers/gpu/drm/mediatek/mtk_disp_color.c:40: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:40: warning: Function parameter or member 'crtc' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:40: warning: Function parameter or member 'data' not described in 'mtk_disp_color'

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
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 3ae9c810845bb..a788ff95ed6e4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -30,8 +30,9 @@ struct mtk_disp_color_data {
 
 /**
  * struct mtk_disp_color - DISP_COLOR driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report irq events to
+ * @data: platform colour driver data
  */
 struct mtk_disp_color {
 	struct mtk_ddp_comp			ddp_comp;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
