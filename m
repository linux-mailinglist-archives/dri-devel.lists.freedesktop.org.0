Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520463912D0
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479AE6EC36;
	Wed, 26 May 2021 08:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E613E6EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v12so205069wrq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4jVnFwrLdvYbe+J6fnuiCvB9x4vw8NgmPskUsZo7eXM=;
 b=HNTh7zdUvwEtjEWA62LQCOv5WbZVwfiFak+3qFdaky7HvKVpVvwY4opo1mlTiR/meN
 WP6x3hiWK3l/gA1WqdHuuXaoJZZPW/6FNAur7QJr5Dy+04ye7p4buPeL+pvqMMBriARj
 arf+UEDOVQTSXNCioRBw3xKVZE2ClviZA+yuMCNkXKULUH3AaKGKpUahBxLV3HHyuJQS
 NljYpyEQQmc6uP/gq9zUSEaqvwrK776TkKxHAC9XDGl1IMaWrCxsCSGSTmD4gBYL4pD8
 qr7KJhvkL0jsF8keu21jzl+o4JSzogjgYcXzffE2KH4dt10f7dRqJueXo8n9tO7sBzU2
 UH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4jVnFwrLdvYbe+J6fnuiCvB9x4vw8NgmPskUsZo7eXM=;
 b=CfkLEJa2UBDILBfgsUuDHCuu0QSFe63TZ+gvmTh7l99STKj7HnqXmDfxb934kHoCrt
 sXiHUmVnfkgRO6i3c83uJmvENCbsyNRsXFhf0W94LiRaq3fiBFA/GefIs3Z9Ki1TOyQ/
 2sCK6vJz3Z2hFFLj8uIf9n+HUvsED/NE+dfdyQbsC5IWH+2/hCmE8P91Egb7GY6EAMhD
 uBfT6S/PydSwE0IvJisWmhfF831M9DzqJ6eYL0C7xJFkmnI+JO8IVcSpO36m9NWxmOVz
 iBrhP10VC1q2gF/iBRU9WMPwSJdsybUMw5ug506ryeu5PWPtFjKc1F+2UrK/iKMOlrdt
 4Bcg==
X-Gm-Message-State: AOAM530G9E/5HgJDLaZGMoneTDuusS0jAwtS7T2DFla9JREiXUrMAQIR
 ViQU0R5/ZaYAAVSCKdUv7o4IxA==
X-Google-Smtp-Source: ABdhPJy3fD/qyOe5xh29n4/y0jvix0HVQE48nrimbqrGSprkCLU68dwAISlYsNwaN55GcVMxHjfWVg==
X-Received: by 2002:a05:6000:104a:: with SMTP id
 c10mr31722911wrx.45.1622018874571; 
 Wed, 26 May 2021 01:47:54 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/34] drm/amd/display/dmub/src/dmub_srv_stat: Convert
 function header to kernel-doc
Date: Wed, 26 May 2021 09:47:15 +0100
Message-Id: <20210526084726.552052-24-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv_stat.c:38: warning: Cannot understand  *****************************************************************************

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jun Lei <Jun.Lei@amd.com>
Cc: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../drm/amd/display/dmub/src/dmub_srv_stat.c  | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c
index e6f3bfab33d3e..70766d534c9c8 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c
@@ -35,20 +35,13 @@
  */
 
 /**
- *****************************************************************************
- *  Function: dmub_srv_stat_get_notification
+ * dmub_srv_stat_get_notification - Retrieves a dmub outbox notification, set up dmub notification
+ *                                  structure with message information. Also a pending bit if queue
+ *                                  is having more notifications
+ *  @dmub: dmub srv structure
+ *  @notify: dmub notification structure to be filled up
  *
- *  @brief
- *		Retrieves a dmub outbox notification, set up dmub notification
- *		structure with message information. Also a pending bit if queue
- *		is having more notifications
- *
- *  @param [in] dmub: dmub srv structure
- *  @param [out] pnotify: dmub notification structure to be filled up
- *
- *  @return
- *     dmub_status
- *****************************************************************************
+ *  Returns: dmub_status
  */
 enum dmub_status dmub_srv_stat_get_notification(struct dmub_srv *dmub,
 						struct dmub_notification *notify)
-- 
2.31.1

