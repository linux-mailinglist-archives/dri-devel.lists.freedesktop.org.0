Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373D93912C0
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB576EC54;
	Wed, 26 May 2021 08:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09A56E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d11so188707wrw.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKeBwQNxcs7ocYKzN7a4O8oaRQu8Cp6t2SySVOZEvJc=;
 b=XOJIerymun8QzB6XXP5wNjsVJygRfMn2bCBX9V9gUfDFMpm25kLTV3EO44NAoo2j5i
 3iSfQk+RtozfLSE0bhk6MeGJ4vV9gQUIcIUOnkztB3q+u6z3oOYlQMoiGMHpN5FJN6w+
 FJx6hQchMJlsPYYhAVlbBncVfoyFjoUOMTQPJ8OT7dIVoQidhzO6Ll+gpXM24TD2tcMj
 EnXiVSmwBuz5TtNVx4MQrvi3cETPA8jpmfUKM1fWQGxom9/PgKjui7Y+fL6dEUstAtMg
 YmxmvEkwUJ5ku14LxFPHGLrMrqg3+wzlam2x+s8tVWPneDACFWNYdsAdduDGQ1mqPxMZ
 J7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKeBwQNxcs7ocYKzN7a4O8oaRQu8Cp6t2SySVOZEvJc=;
 b=NhUHNmXY/SyqvMz0lBdmErYsPrVadfH04IUTFPvnxk26TKdiOrFdgldkSWvCCy5+Td
 g15sj5pUkQzJg+qbvodjdAuqjgZeEKWAHZZUEgX1ramtwDpA5Ej70p+VWSrMb8ZzQUF/
 JCVSRPt0OkgJhObl9YFgyvIsj7BZDZXwdJ7FAQJYJwg8y9j66N9Yp7dxzRV5Ra7RDJEu
 3konSanN6z1vIu++eFqjnen9TcJIgwu+WfSH4txZ4Uyu7fqgRTVW2x0dMe7p7A2WANzU
 vVKkXheZPp0xb/Ny4Btu+JMorXG4YtJv+8ajBymESv4rQQkapWvCA3SE09xAbh+pmlz/
 CYCQ==
X-Gm-Message-State: AOAM5308BLoZVh/54THCpDQaA7ioW8t1oEIvFfOchsCmzMjJluuPoot0
 GcUM9d+5Y9wgv1MAEWHFA9P7/g==
X-Google-Smtp-Source: ABdhPJy/h/7qOMA8yJfz6iMHcuzoO5CwW7Hw3FnfBC/SrmnqXEESL7RSx5gJYYaar6l8ipNBfQNyYA==
X-Received: by 2002:a05:6000:1189:: with SMTP id
 g9mr31168739wrx.385.1622018855535; 
 Wed, 26 May 2021 01:47:35 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:35 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/34] drm/amd/pm/powerplay/hwmgr/vega12_hwmgr: Provide
 'vega12_init_smc_table()' function name
Date: Wed, 26 May 2021 09:46:57 +0100
Message-Id: <20210526084726.552052-6-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.c:812: warning: expecting prototype for Initializes the SMC table and uploads it(). Prototype was for vega12_init_smc_table() instead

Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
index 1a097e608808e..29e0d1d4035ad 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
@@ -803,7 +803,7 @@ static int vega12_save_default_power_profile(struct pp_hwmgr *hwmgr)
 #endif
 
 /**
- * Initializes the SMC table and uploads it
+ * vega12_init_smc_table - Initializes the SMC table and uploads it
  *
  * @hwmgr:  the address of the powerplay hardware manager.
  * return:  always 0
-- 
2.31.1

