Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C28742D6E6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 12:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6906EC62;
	Thu, 14 Oct 2021 10:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D472E6EC1C;
 Thu, 14 Oct 2021 08:51:54 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 133so4901558pgb.1;
 Thu, 14 Oct 2021 01:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6jgDb3M3io+rP9GTtHizhwp9IylxMtBAssaQYLzeYCg=;
 b=OmQyXPE9dw0hzwqg//r4eNt027bVJ817n1HlHeR8D+ABNRYfheM/cZtGq4pfc2+hMI
 PYVznm7LYSbm9UklHIi/sEeBRJTnzJsyiLXIO8zv/Roz3WZNCxCGnBU905yPMutb8k9R
 f7mciwRHZD4dhca3G24oL1l0Kd7nhxcExgQ+gjKwukBoKzmKDTrkAEPY7sBiqS8i/STl
 Nif3TwwV7/xVo+NOq6oUrwtVr3cRtE7B9BvTMl6CVvoLF154lrcmmc14kmg5kXByGpyy
 273GQXDHh52cHxpp7pe8/BuGaOwD9EZsq8kRcjx5CO0PVxtubgeBCjs1+CgOJo6hkCOD
 zkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6jgDb3M3io+rP9GTtHizhwp9IylxMtBAssaQYLzeYCg=;
 b=jLFB6cMIu65m+mMqshzbuk/xiqLpyz4/qmRHzTPi70A8NMwnPFDNBJ/89blWzKZXnt
 sMQYVTuDoUr4x1DEiPamrSDVAtdHUNkOfiX1Lvn6KZjyNMZKLb25gGst9DT3wdkimBy9
 UTfTvHq5rrLFeUDCHOSlw4x8LOPmWFymiCOkretpSxlba0MgU6aN3UgKMLZuRgXvGly6
 w+GqBUlH3F+750QTG/PsdV80365jzgPyuO2t8llAPTwNTdokiE1dF1mczpZe9ojzeJf0
 tSzxSGMzq6mo4fCm9rvDq9nmcKqovnSMV3eNW8LXMVn4k87sAMH/bc8C4OFtKD2x4voO
 6yOA==
X-Gm-Message-State: AOAM533kNIKxsXI5UoIRZDz7IJOq25pC4iUHFh6dGMMdkKLw2zr8fjl7
 ZiLKa4hI9DwnampTO2CrGZw=
X-Google-Smtp-Source: ABdhPJzVBS9jlVx01prr+6mCQWcsDOQkJBwL744a4eCFZpRrUT9Bc3LUdRP3EHSUtoB7JNU9cBnrrw==
X-Received: by 2002:a62:5209:0:b0:44c:68a7:3a61 with SMTP id
 g9-20020a625209000000b0044c68a73a61mr4181502pfb.83.1634201514511; 
 Thu, 14 Oct 2021 01:51:54 -0700 (PDT)
Received: from localhost.localdomain ([8.47.15.154])
 by smtp.gmail.com with ESMTPSA id i2sm7968082pjt.19.2021.10.14.01.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:51:54 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: Fix missing include files in msm_gem.c
Date: Thu, 14 Oct 2021 16:51:33 +0800
Message-Id: <15f30165e94574e4cd7c4da9f9c6fd1e320d4d8e.1634200323.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634200323.git.siyanteng@loongson.cn>
References: <cover.1634200323.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Oct 2021 10:24:16 +0000
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

Include linux/vmalloc.h to fix below errors:
error: implicit declaration of function 'vmap'

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 drivers/gpu/drm/msm/msm_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 40a9863f5951..198caa9c22e4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/dma-map-ops.h>
+#include <linux/vmalloc.h>
 #include <linux/spinlock.h>
 #include <linux/shmem_fs.h>
 #include <linux/dma-buf.h>
-- 
2.27.0

