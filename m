Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D381638AD69
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15A089994;
	Thu, 20 May 2021 12:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFA46F415
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v12so17385990wrq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
 b=ECdngyCPXxuV8WED0vFl1Q/XPm49F6DBoppaIbs0HIcfo5XtnDejjHk8tkEzG01VqR
 VynFew87U48BK6UQOUZvX4hik/sKntYuwWjWHhskelw1Lwng6CXVxmjvJYLoh+5gDvFG
 wZTZ6uyJVOIYmg5bUoF2U8S961FxPN9UgvmdvJLprgOh2wDY45n4COM+p2y3GhU/jQ5e
 fukfyAfIzGVH+1KeEWfy8NFfvHqqUApjYjRh5l/GAxWnQZy//rm1pWAWrRvc6MU7kTp6
 MRfqdYUMvpTXpajmj7WC3yZ05xkBqOBCP8CpzfWBkas8+GiV1H07tv6mi3oyarOfc3hP
 4w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
 b=W9hl956bb9n6fOjJZjpe077ai8obh2hGzRaTDXdbe6a7yXw+bRBtNMbmRKZOQZLEp7
 x6QTCNR0nLNQQLHDoWxvFcUHYuDMgsxvbP1TxK1hFoNH0Ejzo5s1Hf7oHp9N+eVCJnjv
 ms24ePgKh8PQgZcQI7qRfJNk5r8Q/8JiWfvIZUS3qFkePs0WlyLxtNI1MCcorOzJ3UE4
 kpLMqzmgb3B3PP/rxMoHCqKbZ/xWROlQAcFoBZyIibulmPmxJxOoJKY+eM9xu1V7cOzw
 g7wQjcNThrVOmozBxRfW76/uhh7avMjBp5fPsCwvKk03uNBJiNSQ1nL96OkWeZ+4Y/X0
 BdqA==
X-Gm-Message-State: AOAM530JT08s9XNbiNsNDEs8UFsWBeMRooybMQV5I82WURTCWVswGSaI
 brIVWkCNbiZi0DLMnu4Dl7jxdA==
X-Google-Smtp-Source: ABdhPJww8GIvcXXddF95MhisGycsLVA2OrrF8dm6FBwFHsH6HeJ8zlz3Bhe5xFrg/og+j4rKvcXOHA==
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr4003474wrq.92.1621512187365;
 Thu, 20 May 2021 05:03:07 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:06 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/38] drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused
 variable 'cmd_enc'
Date: Thu, 20 May 2021 13:02:25 +0100
Message-Id: <20210520120248.3464013-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function ‘dpu_encoder_phys_cmd_wait_for_commit_done’:
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:688:31: warning: variable ‘cmd_enc’ set but not used [-Wunused-but-set-variable]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b9144e4..088900841bf8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -685,10 +685,6 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 static int dpu_encoder_phys_cmd_wait_for_commit_done(
 		struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc;
-
-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
 	/* only required for master controller */
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
-- 
2.31.1

