Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A13CB3912DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228A76EC53;
	Wed, 26 May 2021 08:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B036EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id o127so239418wmo.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCK0jqtaLc6j+lM4CKdqVnjdeawCrSThn6Bsjq7wZAM=;
 b=S/lbe/k94fAO1B82T5EbehOEOXJHnpj/Y7hT8SSnPoU4Kn0bBq9I2FZr6KAS/tTtC7
 kYQveIhxDKqYQ4kejsVIUXMPQZErILArnTEjQ0ZoCBODTbytq5/f/8EgGyi4bH5AAW5y
 chw+QPj8Q2+srX3qr4lkFZAUeCyqvx7haVK3T4NY4MhmthRMpfpUxdSTYsdXDmRJ7fIH
 9lfys5C8BU3v6LWAc5TzalAOgMQEaiOxOpy9ZQyIxmo2U9TZOgayi9F5n7vo+yAlYZg5
 HLcyGxafNyJErO+sLspSQqdwfeL+9U8X3vOlCfnHUoftXh7zTEvNpJy/5xianOnlz1GC
 Ssng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gCK0jqtaLc6j+lM4CKdqVnjdeawCrSThn6Bsjq7wZAM=;
 b=UwRu4QTDxNxTY9YvBFM6iTmfGUcNo3JiNkKd3B0COhJRLfDhD0SyK3f/zip5pEGOM2
 GHVprGzUMmVl225aJof9IOPERcHROSqniV+N1Pg6NF84DtNF740U68aygPxey+Q4Istx
 InUiiBe4Z4oOfHQcfo2iIp0WfNkGlUdTn2gxeGLFT0q5Ewq8jnAznAU3ncGgXlWbZl7D
 oquDc7sLW6b7BmyYUxkbTHs26ckZSMv5UXiN1IhLu+Z+5gUPfZvMuPSgP2OAvObGPMqq
 poDy+QnZmzpO8AWOS7xxiVTBDtj2C0EY8NvjxX0ZVD7oTGHAtgSkax2vBdrpGmcrtYup
 WuAw==
X-Gm-Message-State: AOAM533ZCwlkzOJBuiILQ95lE7oSO4/J6M4APreccKJuhu7QienofiKB
 RLetJFb5n01jGQnrPIe/3xerrg==
X-Google-Smtp-Source: ABdhPJwJd1v1a7T0DAb2MrAEKqsloEZSJQsbA3WKSILpJ/DjbljpumEhx24mJnT73wZkKQ4M5912Dw==
X-Received: by 2002:a05:600c:21c3:: with SMTP id
 x3mr27065352wmj.131.1622018876689; 
 Wed, 26 May 2021 01:47:56 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:56 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/34] drm/xlnx/zynqmp_disp: Fix incorrectly named enum
 'zynqmp_disp_layer_id'
Date: Wed, 26 May 2021 09:47:17 +0100
Message-Id: <20210526084726.552052-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/xlnx/zynqmp_disp.c:101: warning: expecting prototype for enum zynqmp_disp_id. Prototype was for enum zynqmp_disp_layer_id instead

Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 109d627968ac0..ca1161ec9e16f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -91,7 +91,7 @@ struct zynqmp_disp_format {
 };
 
 /**
- * enum zynqmp_disp_id - Layer identifier
+ * enum zynqmp_disp_layer_id - Layer identifier
  * @ZYNQMP_DISP_LAYER_VID: Video layer
  * @ZYNQMP_DISP_LAYER_GFX: Graphics layer
  */
-- 
2.31.1

