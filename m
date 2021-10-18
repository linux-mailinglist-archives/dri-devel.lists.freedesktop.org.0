Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F95431248
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FA06E98E;
	Mon, 18 Oct 2021 08:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638EC6E98E;
 Mon, 18 Oct 2021 08:41:46 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so11976470pjb.4; 
 Mon, 18 Oct 2021 01:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wk6+rEeyV7eHbPWMKJo+Qpq+GwDxADSGhPjQYfKUne4=;
 b=jNiTi0cZOC9M6uQg94kZkSGn3OrAQrSu6r8SRssg//sn5P432teZU28/v9RIqdlD5O
 FDWwyESEa70tNVGhVeOGe1F5ZAIPJMKiX3P8jEiAbSyNM54IpSQyb9dk/vAcEJfMnrXj
 zNBHvhXgy/rMAPIBLXv/ABA4B+bVuAeA++cRSW1P7RugxMH24Vge6lJz1VOLhc25s/ls
 VIhydhuQ9C6tIKMxlUDIXZlJS9KBy1EfKYZ4K+ty6vz1zM3zC2/vlB6YVxPLlFVR9BvY
 h9NoAYponSEiN1Y8aUWWDEsWN+dvWZ48Asm2fHwd/sSG6AwymDCbgiQEDz9h6JfhgJtQ
 irfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wk6+rEeyV7eHbPWMKJo+Qpq+GwDxADSGhPjQYfKUne4=;
 b=TXbOwVeafBkDZp8a07qS5g92QX2vlFzduBrm0dUqTmJIdJgF0D43azZoIPCIvhq516
 szVGB8Kv2rmxXDJ5rIXZv8UCdzho8O1U72dMVvL/BcGka6UiUCvd6SSOiNTor5CnAR8K
 IGXXGwLODyEtD4cmSpz7v+gqI5n3RhQYGQCURzIBQI1eNCStKwpau9wzMi5BdmGSZwMu
 7730JXpvmIK7r6qCV0tCqinLKQxmk/Gkq36sTczoQrMqtb+sGXI8aWsmvncWEPNZMFKn
 ybO/CuRcSON2VCUb2m5RBPUKIvzN5cqdqv3YDg30gRw+Ngu0239qhT628jam/GmFVJLJ
 k/ew==
X-Gm-Message-State: AOAM533rj6Y/mC1wCyJtA54s5Leup7cuIHT3vQZV8qRM6N146HRabeAS
 vMTWGpC/PMk8QTvbDo+8DpQ=
X-Google-Smtp-Source: ABdhPJxXMPda9FOWVgG87Ibowe+I2Ff21yuG8uqATHh+NbcQaB8zGsEBOfKggffCbibaCL4IiPlIdQ==
X-Received: by 2002:a17:90a:b117:: with SMTP id
 z23mr46490695pjq.74.1634546506085; 
 Mon, 18 Oct 2021 01:41:46 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id il17sm12642508pjb.52.2021.10.18.01.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 01:41:45 -0700 (PDT)
From: luo penghao <cgel.zte@gmail.com>
X-Google-Original-From: luo penghao <luo.penghao@zte.com.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, luo penghao <luo.penghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm/i915/display: Remove unused variable and
 corresponding assignment
Date: Mon, 18 Oct 2021 08:41:40 +0000
Message-Id: <20211018084140.851583-1-luo.penghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable is not used in functions, and its assignment is redundant too.
So it should be deleted.

The clang_analyzer complains as follows:

drivers/gpu/drm/i915/display/vlv_dsi.c:143:2 warning:

Value stored to 'data' is never read.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: luo penghao <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 081b772..634de91 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -131,7 +131,7 @@ static ssize_t intel_dsi_host_transfer(struct mipi_dsi_host *host,
 	enum port port = intel_dsi_host->port;
 	struct mipi_dsi_packet packet;
 	ssize_t ret;
-	const u8 *header, *data;
+	const u8 *header;
 	i915_reg_t data_reg, ctrl_reg;
 	u32 data_mask, ctrl_mask;
 
@@ -140,7 +140,6 @@ static ssize_t intel_dsi_host_transfer(struct mipi_dsi_host *host,
 		return ret;
 
 	header = packet.header;
-	data = packet.payload;
 
 	if (msg->flags & MIPI_DSI_MSG_USE_LPM) {
 		data_reg = MIPI_LP_GEN_DATA(port);
-- 
2.15.2
