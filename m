Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319E45A6AC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 16:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8206E44D;
	Tue, 23 Nov 2021 15:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD556E44A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 15:39:06 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so3355737otl.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 07:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLQmUNabRXXOhYysWc62nCjRSBEMKoCg9jR25zW3RSk=;
 b=RQrUKUyQzNzg7rLCG3cxzoGDG0oNzIKHOfQJ9nks5WNuVHemxSfYdsH7TY9AuPPe2F
 zRpRzme9bN39IU08LKa8cC92y1B7a7fa007Ur6kL2QhFIs3vOi/+alGazlRzepkaMClH
 fqUKV9MRxRC5tDjN5NMa8EeKTky6VTLEMkim8k2KHV2Us4zfWVmHgakV96WVg/62LMOz
 jWBVTk11If3OhcQzLT1pO7brO+kFyyGsWgDe0P+Q5zuAr4kqX/ZutjzbYuoh7fWeysEG
 6/ZT7gucb1Uxe42OhBFhWRyv1PtMyDmTjwT22Ryus1l2WZh35y8SKJV8rj77sPmSh3XI
 jdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLQmUNabRXXOhYysWc62nCjRSBEMKoCg9jR25zW3RSk=;
 b=to2Ezk7BV3QvAuHwDq1hniOTSA50T5zf2zBjxbTLLQMq6v+yVLaV8u6o0FVW+972gH
 QsIpmdvEQQj2VE3VhyR+1Nor+yqQ82cNKgWFNP1h9p0goBBpzz4spT383TCiJr0a4Gku
 4ImAdM98b49PDC6Z3eec36/bGd72321ouhpSwDLYitNrECLXlQuBxCaMPjlNXZiaGRsi
 I5y8NT3OEQW2xyX020VIMzZvp69fbtZORJVKbzcYLLhGbezrG1qWVAErk6fvuNvZAz8+
 punc49fIv55f56FO/ytETThKpFSWSv+7gRDUXxlAf5UzJNea03gJmw9TOkC49lWRYyvs
 Wu8A==
X-Gm-Message-State: AOAM531D7lwmTQXq7/WejCXHxXXPsgvOCzI8UtMKntUGKYEKwYG7/goY
 ouW4H1EVmbRVsHDVFoP6MPJ+cQ==
X-Google-Smtp-Source: ABdhPJwVX3je7HOSpEkEO8fGDAkLEXCFz07Dr0tLR+EQr8fiokL9uIECNqrloZM+EO2jmZUej0+uPA==
X-Received: by 2002:a05:6830:453:: with SMTP id
 d19mr5487860otc.72.1637681945857; 
 Tue, 23 Nov 2021 07:39:05 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id r22sm2571632oij.36.2021.11.23.07.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 07:39:05 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/dpu: Add more of the INTF interrupt regions
Date: Tue, 23 Nov 2021 07:40:49 -0800
Message-Id: <20211123154050.40984-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In addition to the other 7xxx INTF interrupt regions, SM8350 has
additional INTF regions at 0x0ae37000, 0x0ae38000 and 0x0ae39000, define
these. The 7xxx naming scheme of the bits are kept for consistency.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 18 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index d2b6dca487e3..a77a5eaa78ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -30,6 +30,9 @@
 #define MDP_AD4_INTR_STATUS_OFF		0x420
 #define MDP_INTF_0_OFF_REV_7xxx             0x34000
 #define MDP_INTF_1_OFF_REV_7xxx             0x35000
+#define MDP_INTF_2_OFF_REV_7xxx             0x36000
+#define MDP_INTF_3_OFF_REV_7xxx             0x37000
+#define MDP_INTF_4_OFF_REV_7xxx             0x38000
 #define MDP_INTF_5_OFF_REV_7xxx             0x39000
 
 /**
@@ -110,6 +113,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
+	{
+		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
+		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
+		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
+	},
+	{
+		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
+		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
+		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
+	},
+	{
+		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
+		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
+		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
+	},
 	{
 		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index d50e78c9f148..1ab75cccd145 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -26,6 +26,9 @@ enum dpu_hw_intr_reg {
 	MDP_AD4_1_INTR,
 	MDP_INTF0_7xxx_INTR,
 	MDP_INTF1_7xxx_INTR,
+	MDP_INTF2_7xxx_INTR,
+	MDP_INTF3_7xxx_INTR,
+	MDP_INTF4_7xxx_INTR,
 	MDP_INTF5_7xxx_INTR,
 	MDP_INTR_MAX,
 };
-- 
2.33.1

