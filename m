Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1B39FDA6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195536E56D;
	Tue,  8 Jun 2021 17:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF486E563
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:30:08 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id r20so584308qtp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44vYfbOIABvco8eG2D1gJ7pjRjWLhtG/LxGeHPBuoFg=;
 b=WNcrPqJZFDhR+GppnUt/Ho4z1lo+ghVk453OcuFG5EQ3WnHh9c+La3faogb8M3azO4
 nXtNGyofwd3/qykvUd59kHRlqyBkkndn9eycBzewLxOmTtwf5u+typeymWhqxXDSOVoe
 ORiuJSpzNXZ8A9bmR1/oc28wh78BHn4O7WNyS5xa1rtiSb6xJBcA//ZRZjhTsoEt2Shi
 g/dyG0dOD9JUBO17UAp1H2HQKhDLocuMPzPmfSq5461oZ9back2M7EvfDT0O35LzXGCY
 NGm/YM1xDFwbKZPiULzPFNJQuTXUjXa8dJTfiA5F0C0R8Kv6QmZCPzGtCMuchHZ6bx2E
 gd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44vYfbOIABvco8eG2D1gJ7pjRjWLhtG/LxGeHPBuoFg=;
 b=Da0KibRo2tWuSUfpZuNHDtrWyzv4PhVL9lqi+QZzD0ZatOBXmVyCR6qmpfB16t2xEp
 HxkZXGkjrTYvKIuu5vKHJOu6w+eMUP7TRAoNhKTZgFg3hw+bTqqxM936aFYiRmroZFvx
 O6pH+4DTrft5e8BvCVaUFMw7fZVcXcbao1wNrmKcmytsEtnmp/kW2TQPO89GgnEoi/8Z
 iptAhzgw3ghXwgD+ZBxqRo8ZeKNtdlFMqUxrpmoME61xEFgvGG26yLI5umRU5+P36Cp9
 o5n1AZB5buDbw42NqZMrNwjIR88gpkne6zZsT0Dahy9ZoB51o3T85Q344Yq6KOSbTcbc
 Zraw==
X-Gm-Message-State: AOAM532aAX1FC9Nn7ReahTxnLt7Zqea2OaMW66LwiU2T2+ZL1XnqgrgH
 IsFdVkxmPcwXD2mEvY4Sayl/iA==
X-Google-Smtp-Source: ABdhPJzVrQjUH6buawo7b+mb3MemRseIkztNJFsIWxhwVUPVhBOzmMCnvGoQNBKu1a1p2MLKJVSdEg==
X-Received: by 2002:a05:622a:1751:: with SMTP id
 l17mr8131811qtk.35.1623173407491; 
 Tue, 08 Jun 2021 10:30:07 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 10:30:07 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/msm/a6xx: add GMU_CX_GMU_CX_FALNEXT_INTF write for
 a650
Date: Tue,  8 Jun 2021 13:27:46 -0400
Message-Id: <20210608172808.11803-4-jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

downstream msm-5.14 kernel added a write to this register, so match that.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 4 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index c1ee02d6371d..0f3390eab55e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -751,8 +751,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	int ret;
 	u32 chipid;
 
-	if (adreno_is_a650(adreno_gpu))
+	if (adreno_is_a650(adreno_gpu)) {
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, 1);
 		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
+	}
 
 	if (state == GMU_WARM_BOOT) {
 		ret = a6xx_rpmh_start(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 5a43d3090b0c..eeef3d6d89b8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -292,6 +292,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
 
+#define REF_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF    		0x000050f1
+
 #define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
 
 #define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
-- 
2.26.1

