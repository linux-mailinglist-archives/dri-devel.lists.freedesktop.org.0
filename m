Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E8292FAE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D9B6EA99;
	Mon, 19 Oct 2020 20:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06806EA99;
 Mon, 19 Oct 2020 20:45:33 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id l18so708448pgg.0;
 Mon, 19 Oct 2020 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYBCVrY685HpPEa6dE7fFTDE7n8ofYv7TLo5Wicy7lE=;
 b=GiwH1Q5B4PiL5LYkHEor5z49PWGBBdaa+huKsZYFYRdx2+L6Ry5cf3kcdcS0yDJbkP
 DrDGo3ozr/wLE7s0yZGHCiPlQ3BhFs4s1JnbWUHnejHFSFwZYukMSRwFoZYfCXDRgfKq
 STIdnMVI/xY4J3LN1yUgzA1kuL4arQzVScCAuQEe+bl7c1A5R66X/dj0rbfEHRs445Rb
 FPcYwWe2bwxl+5cGq50w6XwiyF09cbpKhuxxa7qd4WqimLsDhdt7nOv48f3GO1xfslbv
 T22HVH4qwjgbmYrQjwRS4SbpXnhP5SbuF9ZD16xvAoLtO3/g4jXeTGTWHkNlkDJilhXM
 ezkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYBCVrY685HpPEa6dE7fFTDE7n8ofYv7TLo5Wicy7lE=;
 b=HGQrag1a0RB92k+XKU0vuhc4nfkRp+xwF7mrxlq+fT0qX/d8tRdDmYtp9ON9tsohXq
 qPfZHOdgrYE59Q3nbznGqSGfOUkHNZpNLx8/7+zNlGIPJ0iYHTZZ6epW9j+VSejbHpH7
 P8/U+XbCujRdWPAJ7RhlHj6e43JI7uuSYFO3mUWg1NZ2+1za1K1Gv2ztc2SmLEQpF6XA
 17zhOiHJiSDf1a8MWDaDcUUw0SDI/cJ9c0WDVaWI9/vKxqmx8x7rW1iavuPJ8H+j/Sr2
 TxcHsAD3jJ9yIVSKcRbQ6iwZJpaXwCDXRo/LLFDFvAs7zCJvKiyWy129gnD9o3c+T/bX
 HSVw==
X-Gm-Message-State: AOAM531vxpj823lctmuzNoRN51FpeeuB98J6TTJXnaJmOdCx92mXYrQx
 pppiEdpddaf8frKsY02XZJEfRC/bGPXONA==
X-Google-Smtp-Source: ABdhPJwu8RH/sEalbXmMg2n6kOuq8ij3zolDwaNhEx69jNBGXrtTvP+zpgA6E5EROWIB5EMH8aToRQ==
X-Received: by 2002:a63:f84c:: with SMTP id v12mr1320550pgj.125.1603140332905; 
 Mon, 19 Oct 2020 13:45:32 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t3sm435790pgm.42.2020.10.19.13.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/23] drm/msm/gem: Rename internal get_iova_locked helper
Date: Mon, 19 Oct 2020 13:46:04 -0700
Message-Id: <20201019204636.139997-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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

We'll need to introduce a _locked() version of msm_gem_get_iova(), so we
need to make that name available.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index afef9c6b1a1c..dec89fe79025 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -376,7 +376,7 @@ put_iova(struct drm_gem_object *obj)
 	}
 }
 
-static int msm_gem_get_iova_locked(struct drm_gem_object *obj,
+static int get_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
@@ -448,7 +448,7 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 
 	msm_gem_lock(obj);
 
-	ret = msm_gem_get_iova_locked(obj, aspace, &local,
+	ret = get_iova_locked(obj, aspace, &local,
 		range_start, range_end);
 
 	if (!ret)
@@ -478,7 +478,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	int ret;
 
 	msm_gem_lock(obj);
-	ret = msm_gem_get_iova_locked(obj, aspace, iova, 0, U64_MAX);
+	ret = get_iova_locked(obj, aspace, iova, 0, U64_MAX);
 	msm_gem_unlock(obj);
 
 	return ret;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
