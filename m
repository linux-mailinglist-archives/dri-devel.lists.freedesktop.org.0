Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 507973509FF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 00:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936A36EB8E;
	Wed, 31 Mar 2021 22:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55F56EB8E;
 Wed, 31 Mar 2021 22:13:10 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so3689237pjb.1; 
 Wed, 31 Mar 2021 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OhRKnjnp04/KR/sSNoa+tu/vhEXwdj63Uk5C6mZJOQk=;
 b=R61jEIdU7UJlduyCmpi1FgYLKVeDrBBnWycok2VFemsAh8ONoU6Ct/jfQFcIDuxI1B
 cL0Ahh1wL0jtMlDTsygl9ed4T3bDYtTbLXcwB9uT7W3dYPCQlCxQgdJ9tpyPcaYtguhG
 TnevF4xcxxWQVmYJu32jkfE29aQP4m/IyI9g+cqdxuHAvayoZKNOWYjXVjpdzbXixmOd
 NV30uRz65bYHZ4b/0KZRbeA0GRMKAwk8J10MR25VmWvBPEt7wO0vlQrrNjXBA1wPfX7s
 kE98yJByo8AWC7cEIO9QliGVpm+GFX2FyNKLmgTPMGg8Ha7W27Q0QLTZZZrSq/1EX4Fn
 DSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OhRKnjnp04/KR/sSNoa+tu/vhEXwdj63Uk5C6mZJOQk=;
 b=ix5h48/Zb8VSbu9trcrovtgCvYsfZDwLneVG/K0sphSQgfBrqwXuOcAyjctKM2XtM3
 DUuvrbceOQY4L2ZOD4ViKqvp6ZFU/G2B4NJdYjb9JgTUHDL91qBq/gYdfU8FEEpGlPjH
 aYy4MfcW0h7pRVKz/biaj/my2mCWFhg1XGc2B2wcoMNiWMv+pPBLDJZQ+SqcaGDjm6Ml
 GED2QPkB9fH7wNVntxHMoQ/zZ1WfYELlHVIFphD8HvBjZlE4jN6ruRJQBkpfMt+j9mPz
 W79rEMXL6IOUp3M51BqN3982u779/RoYlsaUIcUj1c5h/u5AiqSSM7J/3a0G42SpgoQX
 uPsw==
X-Gm-Message-State: AOAM532zs4JX0k4R3Lo1rx+iBxpXSdb2AnLijXho8gOO9XKWCzdZzIjm
 Mkh9CCbazPaXbVxrQJPG+2PVs+dkxjIpuA==
X-Google-Smtp-Source: ABdhPJzx4z92OqXjJmA2aDQUjVGO3fWl15Kt1bf1LZ1Za5EpQuUlXCbs5blxseMptA2QArFmtiPUWQ==
X-Received: by 2002:a17:90b:fce:: with SMTP id
 gd14mr5702746pjb.8.1617228789609; 
 Wed, 31 Mar 2021 15:13:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 gm9sm3035227pjb.13.2021.03.31.15.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 15:13:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/msm: Remove unused freed llist node
Date: Wed, 31 Mar 2021 15:16:26 -0700
Message-Id: <20210331221630.488498-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Unused since c951a9b284b907604759628d273901064c60d09f

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b3a0a880cbab..7a9107cf1818 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -78,8 +78,6 @@ struct msm_gem_object {
 
 	struct list_head vmas;    /* list of msm_gem_vma */
 
-	struct llist_node freed;
-
 	/* For physically contiguous buffers.  Used when we don't have
 	 * an IOMMU.  Also used for stolen/splashscreen buffer.
 	 */
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
