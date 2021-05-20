Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE838AD5C
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD978919E;
	Thu, 20 May 2021 12:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA086F417
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id n2so17467675wrm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=erxm+Xcrd7+qygxkCLKKNU6rbI+w3lNDzPu8B/httcU=;
 b=OE1cmOeal6mPQ3zY2RJYNzLtzyM0CyRa/eBZHVQFbLPbo4XxFRKmFTfyjaRvKhOasA
 hsZjqbS+YYSXLp0jBQp9nvLozK2NuK4+EZXBYKlK/zb+ZI5ALEfDhcrouqo71EsiWyGl
 dpRYBbKFuPPVmDWnZFYucI6qPiXCOW2SI0++B+paB0abLzPN8pmtpqj9s8MZBLSLa1gF
 BOS1Y4mjTQipSdmTUML3II0zTQleLPhan2VJ4IaVPVI178JIN2NNaiQYqUFo4xEbJysy
 fCafIbHV0mLWXiEuaeESdDWjMqZIMKDL2IfpqSl0N6fhknVAhAmOTzgb1DAV0LKz/mT1
 XpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=erxm+Xcrd7+qygxkCLKKNU6rbI+w3lNDzPu8B/httcU=;
 b=lur+6ZmeX3y3+RS4UCPzWC89NjDcj5fkA9kghc/o/aNmISM6r9/gPRKQYI8mhjXs4Q
 IpP+FJ9QSaqUu+pqf5/TT2KE0QLezKo7sdlUcHUN12kSoJtYPaCApuodA82jzpawt2ug
 2miGjQqzoqZ6eK07SbhGvomqnpVT8ll6jKLCZVl0yH4eEBXLXiknyr7eD1GhW714tA9e
 Itms1fl6vUVdtbEnraTT1pFCfIh8B7RHiA3e89XqHVCBOo/RRd8r6GwhblBIXs0flqsH
 huD+JcyAXOqL08RXv1+zkIOGfuIeePOSE2rURM9LTCrs27JEnkdScL/I2FtpQwlo9pn1
 Lx9g==
X-Gm-Message-State: AOAM530okdvV2eQuw6HNEPRPiZHdtpZ/B0Wgt9oKuh+sqq6C3tGrTgUc
 QqV+Lzxc8lAMl126BfsFYBhSDQ==
X-Google-Smtp-Source: ABdhPJzC65qtzUVA+gIP2kmGgel53QLMcK/7hJnqDkaigOHVU54rfgzhY6XVPlH7o1hAbiiYYuUonw==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr4037179wrt.189.1621512183252; 
 Thu, 20 May 2021 05:03:03 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/38] drm/amd/amdgpu/amdgpu_debugfs: Fix a couple of misnamed
 functions
Date: Thu, 20 May 2021 13:02:21 +0100
Message-Id: <20210520120248.3464013-12-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1004: warning: expecting prototype for amdgpu_debugfs_regs_gfxoff_write(). Prototype was for amdgpu_debugfs_gfxoff_write() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1053: warning: expecting prototype for amdgpu_debugfs_regs_gfxoff_status(). Prototype was for amdgpu_debugfs_gfxoff_read() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index bcaf271b39bf5..a9bbb0034e1ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -990,7 +990,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 }
 
 /**
- * amdgpu_debugfs_regs_gfxoff_write - Enable/disable GFXOFF
+ * amdgpu_debugfs_gfxoff_write - Enable/disable GFXOFF
  *
  * @f: open file handle
  * @buf: User buffer to write data from
@@ -1041,7 +1041,7 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 
 
 /**
- * amdgpu_debugfs_regs_gfxoff_status - read gfxoff status
+ * amdgpu_debugfs_gfxoff_read - read gfxoff status
  *
  * @f: open file handle
  * @buf: User buffer to store read data in
-- 
2.31.1

