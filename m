Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0873912BE
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1EC6EC3E;
	Wed, 26 May 2021 08:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6F16E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:39 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so27282wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OW7W47mIWK6yublPiEJWvFrVpFjoI7qTlEhI5W3sk3g=;
 b=Q4Dzbneel0DMkx+zXQm4rfhuirMiZW0kumIdYTlWN3Rc8ONEfmPsGv5nSTgmMJMzm1
 dDVTt75sX/MR1ZLRVZN3aTgKAPW2fjnN4y4HZQMD5UJnGpbzaGx3zX/TY54CwkTpN93z
 ci3EPh0fpBN429rFH3EWjtZm/y/XmxGjjvLf/rm6l1smQ/An5IKRNRN0RO/bZnXExJD2
 Yf/0VcrD5X5GZ/W8bFogzhmqOFHRKGj64yiSr/Eoafy5yJ46O/pFb3qzPGyq1W/bjEXy
 qmrYNwBKc95Gk6tvYCz8Wc6n8OynNac2iK09tru9kJoWyxDnZIIE4BOk/y7Fl7k7Mgti
 +IGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OW7W47mIWK6yublPiEJWvFrVpFjoI7qTlEhI5W3sk3g=;
 b=mSnfzkmneaTQHrbCeMWBkR+isE2XJur33vGWzNDSbAIdEuu6mJ2oU1uTLe2bf/XBaM
 zsPNFW8JKA9JNf9h3KGVIL83Z+RJpu9ejFW5BifmvM0hJ9V6b5invESJQkggoZMPEnH+
 Dnniz9C5Rx9BvqDREjBNKe9Z9dCqrc8hwAq1UB772OPLfd0bucf7XSXdMlNfm/cGtcCv
 70CPnyiEGYZe3ftaBGDKI1Q1Nflzqj9AjVXlHtYVQjseIU3Wxk6eWLnccCzNmZQUI+rY
 r0EvxZY7MLWLzd4mFwh3nD4Ay5vf4Y4korbWKAto4kKwtDggjPUvEMhAO2dZc3gI3HFE
 L5pw==
X-Gm-Message-State: AOAM532q9WvyUK+UELA0skVUcmbsSRx0NWKf6zrT12tNak/YfVj457ux
 ze8/6Ate23HDTetCx8CEXEceDw==
X-Google-Smtp-Source: ABdhPJzKjOnP2FN9XbCVd5z8Nh671DlRl76pfsWhDUprJRbuK1oP+cI43ILSCrES9+8y0ekBcxVa9A==
X-Received: by 2002:a7b:c446:: with SMTP id l6mr2223901wmi.75.1622018857723;
 Wed, 26 May 2021 01:47:37 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:37 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/34] drm/amd/pm/powerplay/hwmgr/vega20_hwmgr: Provide
 function name 'vega20_init_smc_table()'
Date: Wed, 26 May 2021 09:46:59 +0100
Message-Id: <20210526084726.552052-8-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.c:781: warning: expecting prototype for Initializes the SMC table and uploads it(). Prototype was for vega20_init_smc_table() instead

Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
index d3177a534fdf0..0791309586c58 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
@@ -772,7 +772,7 @@ static int vega20_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
 }
 
 /**
- * Initializes the SMC table and uploads it
+ * vega20_init_smc_table - Initializes the SMC table and uploads it
  *
  * @hwmgr:  the address of the powerplay hardware manager.
  * return:  always 0
-- 
2.31.1

