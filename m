Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381473912D3
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B4B6EC43;
	Wed, 26 May 2021 08:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3CB6E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r10so172745wrj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7L06mynHw/Hvp7IRLB9pK1ya6b4whZKrsJ5rjcKPGDA=;
 b=p6dcifpgLEh0iuGoFQK2sK66NWHym2V+MK8Mgj2Gbu/s3pxQpqNCHtulzP0eEwjZrY
 4tLExkvLFAZ7n3wVD5ZNye6+hzn+kXamD+QGeriuWID3n3FGGixGYHkvug2JciMuvZ8W
 5Bxhq7HvBx1KgntYp8NgJlzoyA/n79QXt2c17qR6kmkq4mxv/im0kF0i7b425G9BfDYc
 Pe7JbaSsicLm68CiND0fuJr8KunrGw7U6+OEjwTY3RZPloUNp/PPutNRq/VcOuifCJ6u
 LlOR/QhJkBUayFg11eW5qX/3K1QBsFiv3Qg8qkTuZSrkI57AS/nS7hRN5THRTKD4441l
 iozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7L06mynHw/Hvp7IRLB9pK1ya6b4whZKrsJ5rjcKPGDA=;
 b=Dj6WRRCXi9fJXbEEN/p/Q7IIoqRhyiyz2ztV3+Txss1LjeTAR/nxjC1oUZzFY6Kwzm
 YJyi8OI8uvCH7zDOXlsVry273u0FIfkhGh3iXcTWGj7hAbftec7A0NT/OqW7tJvDfCdM
 gAmz+A6HrBSe/jEPEWs3VSugZdDnW6rUmPtRJn1Gy8DWVtB5H5lEhTPex22J9C6BfZNW
 QkRCkuX77SiE/OkDDiqhon1I8wCG16zi5Kfb08MWYTmDwRbjff86cUCNxiECT4UsyiRV
 vnoved/+UQXRCdmkb/WFf9RZX74EAFiMrUOHODoyuSx7ngs1nx9Sc7l1KbF1byz13Oz9
 UW9Q==
X-Gm-Message-State: AOAM531yDFBerPzMnXZk3PJ9r6pOe72izdyZjaYLOMiWgejhhldmyU3+
 1Qs5Mm5uBiXyY21uvTYGPswkyA==
X-Google-Smtp-Source: ABdhPJztuqUrTTlF820RG/YpKIy9kbje3NTxS+Y/DPltHPd2xWY9oQPpPtmaMh8sTZnnxSSSeP3iXw==
X-Received: by 2002:a5d:4346:: with SMTP id u6mr31619647wrr.304.1622018871538; 
 Wed, 26 May 2021 01:47:51 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:51 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/34] drm/amd/display/amdgpu_dm/amdgpu_dm: Fix kernel-doc
 formatting issue
Date: Wed, 26 May 2021 09:47:12 +0100
Message-Id: <20210526084726.552052-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:608: warning: Function parameter or member 'interrupt_params' not described in 'dm_dcn_vertical_interrupt0_high_irq'

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ae0a95c5f1d8c..0b4841f377e41 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -605,7 +605,7 @@ static void dm_crtc_high_irq(void *interrupt_params)
 /**
  * dm_dcn_vertical_interrupt0_high_irq() - Handles OTG Vertical interrupt0 for
  * DCN generation ASICs
- * @interrupt params - interrupt parameters
+ * @interrupt_params: interrupt parameters
  *
  * Used to set crc window/read out crc value at vertical line 0 position
  */
-- 
2.31.1

