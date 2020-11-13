Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034DD2B1C33
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44896E52E;
	Fri, 13 Nov 2020 13:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE5F6E527
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so9992730wrt.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pCTuXmjwQai/CDFPUzQ3kg8YDOVHQv+4DVCFDqYGwk4=;
 b=sDMRPQswWGSH++5S2Loy2vzVU6PKTlMKGyiB2LA3prnW76xMrNwZA0nmexJsaEobkL
 38w/XO7PKggGRLVdb2wtak4X17JNVk35qD6R3pbK0i8q6LyutT3Iou5Y94lsl1k4blLz
 p2xkf3ETUNYs6hssfPEjjPlm89LkhETsVduJvbmkM3oEMJrW5ApTPE2MkFqTfGAQ5U5R
 w7ZuvayjNoZuO5u87vJsYPZsZ0HoKo43J0Vty3iLo3fpfA8NBAVzw4EFGH1TJZbsHJnA
 tvdmSrzbQTEsCnu2Izn1p6tYQRXU5QZq3hdTi8ApEpzNiZ6yyhAX2cc6OmgfC51eg6y8
 0meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pCTuXmjwQai/CDFPUzQ3kg8YDOVHQv+4DVCFDqYGwk4=;
 b=uBL1MYTqcGbpD6hLOgZ3ph44iLrva9+tqWPe7oZ9QFugutesnTwfrYE5suwr8rwQfN
 wxhsHjxpCki4IPVG0FlfMGV9GlvSGTmUWerwyofL3tZTi0VcBDAf0mxksohbwSjtdmGT
 uikjq42yiiMaVuraW6GwBWJ/RnDMwWP+D0+DowfHgRzksRcRadtt/414KVt+Bt1gbjEk
 TPVMWa/dCI99LaWGfKPYrBMCFPF8h82ZcpTmU3RldMgxvt8Na/fsh6xnhw3A6h1rbuKq
 pgRzYDWP0YcnKG612tH6w+DhAawsf+b4TQg3Z0MFn/cd88sLiLFN9qfL8Ybr69B3oR+d
 32+g==
X-Gm-Message-State: AOAM532foBVDT3BFoGHA82xwG+Vx0bm9GfqjwYjkDjeCMHAIOgFkqMBI
 WGhYxGDn/EzkRsbjFKCObobFF/5F3g6Olpiw
X-Google-Smtp-Source: ABdhPJwC5dZ17zovLWTwBFMnjLJ/S6DTsonz5wBvHLFm45TRGQA1LxJ9EXZzT2BBh6sywylyM2FixA==
X-Received: by 2002:a5d:654c:: with SMTP id z12mr3461026wrv.46.1605275393304; 
 Fri, 13 Nov 2020 05:49:53 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:52 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/40] drm/mediatek/mtk_drm_crtc: Demote seriously out-of-date
 struct header
Date: Fri, 13 Nov 2020 13:49:07 +0000
Message-Id: <20201113134938.4004947-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
