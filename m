Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A532B4DAC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AD36E9F2;
	Mon, 16 Nov 2020 17:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB756E9ED
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d142so38227wmd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pCTuXmjwQai/CDFPUzQ3kg8YDOVHQv+4DVCFDqYGwk4=;
 b=gfFikjbNe9YkvOd+VXcfbf0J4Wd2441zhnFbQBUFTSfGl/11fLgrzMNsROSrDNKZnB
 56O56aOR/HmR02tQ/3tiNJAhdUCmKv3PyRLNB0tFPnqebgucJjargzJMwuSJqsg4qUDz
 lUADz1TsIKFAEDWw/i6YYk8HVxvDJqeRjFeh11I8P7jIVCANAQ8XqJPeo2AmjbptibFD
 3BUaOo+e/x2FHDxxqyNUMx1CFmyFSNvfDMIXzxiO4enNnSLj6DwZyaW/AX6d3z+XhZkM
 Hol8SB/aqA0USEkFwB5UEN9vO92vFQ3LpEYj0SMeSchExJmGtxQjQooiNX6+MTrjskNO
 qkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pCTuXmjwQai/CDFPUzQ3kg8YDOVHQv+4DVCFDqYGwk4=;
 b=uV1JMju8r0tp5CKh8LhYAkSwpSvchBsT4n5Sc4xv6o0erQ29xqVuMS1yhvF6RRKsBO
 TMpMPNgzt9lVvTzt13Vv9Z7G4/Fx3yBD/Ir2lfv5aLBo7q4IA/bZ1I2NB4wl8qnFIcb/
 4LN+R3tr/gKpSiZd5yoqc8+Hu1T4K4OkgUu3dHKC2CxnukB0Rlyj72AzRDq6MO0GvjCg
 uY0+IiFuGbAfqjJGviMUVfOoPEQZtZnEp06tz4iA41DNsF5pZlBfUo1vzxmLxCQMHeMe
 JAU9F2o9j5uqwYuNRYUPyDGCr8MwGH3M5oXJ1N2+4oHWggRzQhvi7Q64JW9xGEwSossi
 utWg==
X-Gm-Message-State: AOAM5311x+SBNbZ3ZLxVmdsaePeLFv27jZH8DoEkzVNIzNpsxhky0ykm
 Etk1E7m4JyhCyq2doOzJ+nN1aw==
X-Google-Smtp-Source: ABdhPJwrqzcWWtyPydLaEIxmPE66hOyh5iCvJ3dX8GBSzMZleXIeT0J7SjvsguKoHdDSGAfq4DLbJQ==
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr48224wme.8.1605548494375;
 Mon, 16 Nov 2020 09:41:34 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/42] drm/mediatek/mtk_drm_crtc: Demote seriously out-of-date
 struct header
Date: Mon, 16 Nov 2020 17:40:41 +0000
Message-Id: <20201116174112.1833368-12-lee.jones@linaro.org>
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

This needs someone with in-depth knowledge of the driver to complete.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'pending_needs_vblank' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'event' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'layer_nr' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'pending_async_planes' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'cmdq_client' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'cmdq_event' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'hw_lock' not described in 'mtk_drm_crtc'

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
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 193848fd75154..bfe9942305435 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -24,7 +24,7 @@
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
-/**
+/*
  * struct mtk_drm_crtc - MediaTek specific crtc structure.
  * @base: crtc object.
  * @enabled: records whether crtc_enable succeeded
@@ -34,6 +34,8 @@
  * @mutex: handle to one of the ten disp_mutex streams
  * @ddp_comp_nr: number of components in ddp_comp
  * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
+ *
+ * TODO: Needs update: this header is missing a bunch of member descriptions.
  */
 struct mtk_drm_crtc {
 	struct drm_crtc			base;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
