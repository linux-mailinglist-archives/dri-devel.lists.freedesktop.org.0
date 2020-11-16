Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88EB2B4DAB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5CD6E9F0;
	Mon, 16 Nov 2020 17:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0756E9ED
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h21so43845wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlKk1bN1CES0mgH+wUmCXkMlZA1CVtbOfxEG6y0GM50=;
 b=fBeX27nB366IYVH1W9juPZSpXK3wrkLndU8rdMtDvtddcQYffNN/LCMVS3P9DlfHOs
 C5uysVVIQlWEWxVvlzscOvU0YoKxFJPx62xbo8UNuLrVjxrOxb+7OsKEjsql2rq4foOz
 rqRfHEgrw79NMWdcMNTQ7jsrN2mAwn636r7qAAy1KiieowRf+XdzZfdU56Lu/WGbE9N9
 OuDX0zw3ZCX8RMZamB2HI4m6uaOZHYIexPeAlucHjoHho9jOXQv8+wVypU0AflPNRuy6
 MXcezHcvh9WjvmTZ5N/BZ44vefZaKq4vqG761nroGip4JTXBD3yPvgvqiQr4Gf1xsLc6
 ESmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlKk1bN1CES0mgH+wUmCXkMlZA1CVtbOfxEG6y0GM50=;
 b=ERFR0S23M+lWEDHd9fPMM2CnGb9zSDJn+IK0vmSSIFR5OznAq+HOThvrB+vdpxwixr
 2udZvzJbAPCNRrso7XNLL1HCFU1ewoj6SUChiEqezuu17Ua5OB+cMUegVQHdyej6JGe2
 Y9gKW6VMkvDdc4XKL8zYmYIpw9IbUemg//GgiH8S6ktq9Pz9t2g0bFjVeFVsmj9uL9hT
 4mVt3p3Oter7qpBpZAJUgHnfcq+IH7bhTDcSC608r/gxp0XKR+U0Eqzya87Ln+Fo6MMz
 mE4PdRVhCDOSZtd/QBi92C6cGOh8zJ2716UbhatGvzFuh2Mz9jmrqXbwkcGtZPdygYAr
 GtdQ==
X-Gm-Message-State: AOAM531tHRm++JzRD38R0wDzEpprTwRNZy2BBoBURksww/iOrMn87Rpm
 Ra+5Wb0G6RuM9hXZb8kRvPDYTQ==
X-Google-Smtp-Source: ABdhPJx+DjhnZ+3t53J8dx2EwysUVrWUxuaviQMjGuBmn9hdukh9eFyNPCUzF5Q2JEQuhsfmK3NPfw==
X-Received: by 2002:a1c:4d0f:: with SMTP id o15mr21228wmh.142.1605548493144;
 Mon, 16 Nov 2020 09:41:33 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/42] drm/mediatek/mtk_disp_rdma: Fix formatting and supply
 missing struct member description
Date: Mon, 16 Nov 2020 17:40:40 +0000
Message-Id: <20201116174112.1833368-11-lee.jones@linaro.org>
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

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'crtc' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'data' not described in 'mtk_disp_rdma'

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
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index e04319fedf463..d46b8ae1d0800 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -56,8 +56,9 @@ struct mtk_disp_rdma_data {
 
 /**
  * struct mtk_disp_rdma - DISP_RDMA driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report irq events to
+ * @data: local driver data
  */
 struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
