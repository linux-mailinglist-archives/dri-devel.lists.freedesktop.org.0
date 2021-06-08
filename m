Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3DF39FDA8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F99B6E570;
	Tue,  8 Jun 2021 17:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6CF6E570
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:30:10 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id j184so20967412qkd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4A/Pcyw+QD8Ug/Nt2Xmd1/EAfukVYO4RIkYOrmyswQM=;
 b=G1CaD5y6gwymINmHtsKEhWsaqJxxFVGj6787Wi/WaUi0ibM0X5gQeT7WW6yY0pEqS/
 3StBiA+9Fs6AXgzwfa2bIyqtGJyEuBOHjnXzkH2/WxlBTj6rbZe5ZIlhpuzOtnBAb9Hq
 4eGjLJiUi7c554WRkGjh/BGMvOUdNTc1IoeLLxHl7f6wbMkW1CHteyEy2tsjqsEpfZHY
 o8CSRZut2bTqhw8QmfqUq5t2xEH+RKRosHMzemv8JJBUqm37s1A8j62TPn/CfHjCfydp
 gzVypgdBjcGn7zKoB1akl6XvmI8kG3c7gzJWTb152tPbyu/BimAhaYfXB6I9OGVJTYyc
 evJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4A/Pcyw+QD8Ug/Nt2Xmd1/EAfukVYO4RIkYOrmyswQM=;
 b=eLiTWpi/oi8o98yElGLANa0LIFJi4OEKB+fwVQPd5xZJv7XoAJleRcImJiYXUqTVP1
 gv7WkgeIOrGVq/BRIIVajTI4QeHX1tHmIt5WK9GHIOBYbxMU7DG38Paf3w0We+39gITp
 W3hjZiE7fuj5DvcSqlCuHFhFoLJaX84mxXb/bXXlxJsgCMo9xwKFVpxTsIyPdjGPtob2
 1TphmewHAdUh4Lx56BeGJfAqVa63EviN+mtruMe2tCm4SV4w1D06Zz5PTwrAr9YOwZpZ
 M0dhD5NsoSKG0WUYZRfGryNfHwhOcFvLC2WSqggxWKrMepPNJ8I87hzd9Zs5Y4Qlio1D
 ZRfA==
X-Gm-Message-State: AOAM531jVqAnY+riLcahBMDY+OYbfy7Mm71DOggNT6pD4dmOuV6o4Rbj
 wvSL4n6MZkx8b8GYcvXmvQKl7A==
X-Google-Smtp-Source: ABdhPJzTo4VczO5D3fNE/OOCfEaOjp6b6rtTfwnhjqlgt3NXWkN04Lg7T/UGxCTR954ZwROyXIX2Cg==
X-Received: by 2002:a37:71c5:: with SMTP id m188mr7310523qkc.97.1623173410212; 
 Tue, 08 Jun 2021 10:30:10 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 10:30:09 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/msm/a6xx: add missing PC_DBG_ECO_CNTL bit for
 a640/a650
Date: Tue,  8 Jun 2021 13:27:47 -0400
Message-Id: <20210608172808.11803-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608172808.11803-1-jonathan@marek.ca>
References: <20210608172808.11803-1-jonathan@marek.ca>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

See downstream's "disable_tseskip" flag.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 853be7651623..bbbf90d86828 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -844,13 +844,15 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Setting the mem pool size */
 	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
-	/* Setting the primFifo thresholds default values */
+	/* Setting the primFifo thresholds default values,
+	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
+	*/
 	if (adreno_is_a650(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300000);
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
 	else if (adreno_is_a640(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200000);
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, (0x300 << 11));
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
 
 	/* Set the AHB default slave response to "ERROR" */
 	gpu_write(gpu, REG_A6XX_CP_AHB_CNTL, 0x1);
-- 
2.26.1

