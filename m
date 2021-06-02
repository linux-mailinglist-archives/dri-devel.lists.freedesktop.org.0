Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE9398CF5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A726ECCB;
	Wed,  2 Jun 2021 14:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5754C6ECC8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so1805558wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCK0jqtaLc6j+lM4CKdqVnjdeawCrSThn6Bsjq7wZAM=;
 b=kVawvm9tl5zizmZlEJdZ0FnvSGVuL0luhzw/GSgmx6esjexCvNfHHyDG0z0L6UO6dD
 wgbWSIyuUW4QRNeBRJF/HS/Ri4n8Z/VFfaBWfyS9o8M+UBn/U4XGkh6ADyGzkR4ykU7U
 AvdY3RQaTeBiVKl0MliHWeJyl01xacXxCyqNaf4biEbfB2gwPyEvYYlyQa3lvTucU6TE
 ZkgBaZX6ywoFAJvV7Fh8RJijupn2jhRk1KyEtAbOivtycNORWqILYzmT84iwD3SS23aO
 j5F/28TV4fqpKqN1gCV0WLgLCzckqUBvdBEfgsEdAme1krhu5abpjnoQMKcNlWZwsCn/
 HJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gCK0jqtaLc6j+lM4CKdqVnjdeawCrSThn6Bsjq7wZAM=;
 b=AJ/KxhRwY/MdHIuPZBJcUZlcOHzS1QcYXgv7qqDouThzCn++gnKWvIFb7M022Z2pkA
 Okt2VnkS5fGHOQnAyvVvwR2i9f5bKwxV9gFjPGNLmVzdCMfvR0sRpQQs7cDZRkEXraM7
 Dzcc3vWD+taK2trv3XgK/xmNpdtZJzWcWG6anaSLc8/Qk54umj+g0F0KZxPZW3zDA1Ev
 HgQyArUP+gxaVLogsf9Kp0ejmxBsIxO/YtZ+D2eiqf0xLwn/Ti3IxBAgdK1C7mZySLWM
 n4o6galM6vxYAkD4fL97ET7EiUg+brDYrmxvL56dr+yzO4fMWx3wtkF3tNiAepu20rqF
 5UCg==
X-Gm-Message-State: AOAM531Z5GFzqQ4zCm1Sz88GrgLuYhpeW7ezkjoRZN1s9bglKznOqHyZ
 pEhY7RJzKybSr1ZmvDmMnl7HuLPdcHruww==
X-Google-Smtp-Source: ABdhPJxTtSEFhoNefmPKjFMRd2qURDi/HNEXhrSYPmBba4g0Ds6da+YzMYlZsUEsDWgrqcVTg9+9Rw==
X-Received: by 2002:a1c:5452:: with SMTP id p18mr19646142wmi.176.1622644408057; 
 Wed, 02 Jun 2021 07:33:28 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:27 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 17/26] drm/xlnx/zynqmp_disp: Fix incorrectly named enum
 'zynqmp_disp_layer_id'
Date: Wed,  2 Jun 2021 15:32:51 +0100
Message-Id: <20210602143300.2330146-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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

