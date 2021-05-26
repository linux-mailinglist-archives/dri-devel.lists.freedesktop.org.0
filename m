Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693713912C7
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787086EC3B;
	Wed, 26 May 2021 08:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB556E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso15016922wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=457+N/Rh8MOrxunbiCqh3NZ4tXXcJQCrqwWFpwHmuoQ=;
 b=eXye2VAu7ke1QG4IA5t59RbwXPJrmfNRjjWM/ZX7aXe3V5WXvNCs51/BnAiW/87OUz
 wbOcor9aJeFxcyFGJ8DyP+Qj3cjKFWej4YMsPxuiE4t38l8Ic5nUbMO9lpdnG0KyCiQi
 7lPvW6oeQujoIP7rH75qwdi8IrQmjL8JUYacfvXVJHwRnZn/uTBjCC3SCfR2HyIOc622
 RJsWNXPl35qz6z9VIl9vyXc/I0TsXOoyC5V7cl11B0WOI/KaMIqLqiPXcbRiSOU8OJbV
 tXp42hBXkNzQ/tMiutLeRtr+2FKfmH5VySknnQh7tW6ZGGqmdTYHTJDNjvCG44cJdH2x
 kjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=457+N/Rh8MOrxunbiCqh3NZ4tXXcJQCrqwWFpwHmuoQ=;
 b=Z9Yfqo/6RC4B/h+RjByfJ287b7W3ZpO4C47dusC0Ym10KCr89mrPF7K1+3UzIyjV4p
 Jtc1/idh8RtL1/dTMZs/AimkWrS5bIjrBDqMa3ygRXN+HRdXBoRymworS9ltVCr0l2zW
 cIzxFdLGQC8xkdj75tFC52kfrUpBTmAK4WNMeBMpgXyiz5frIQTUsAHW5ZDMnySDI6Qt
 a3xw6Nfi3FS8qtiO3KJRZALeWJhebVtSZI07yX/tHZNSmnHhA67vIXhHTAKeoZHpCdHs
 USeTB6z/pQQJgYmAvGmCsV0KjbjYVMM8u/dWTPzv7/7p6YLbHFqIEfXlP1/KHR7CBSlz
 WPuA==
X-Gm-Message-State: AOAM532ygrM1K+Bbfi7OoNDAn2yMyBJbQxj9XkZd/HHskA0WaLxSoFoN
 4btHFNhj7szv23HL0bMbpKcZNw==
X-Google-Smtp-Source: ABdhPJwhQpXCO9aTmhAWOI0ab/F/dQs47s/6mY6P77cZcp8LMxjOIvTKWWaMq4vhjky5DggbReaIJQ==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr2308055wmq.143.1622018866990; 
 Wed, 26 May 2021 01:47:46 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/34] drm/amd/display/dc/dce/dce_transform: Remove
 superfluous re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL, 
Date: Wed, 26 May 2021 09:47:08 +0100
Message-Id: <20210526084726.552052-17-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.c:374:22: warning: no previous prototype for ‘mod_hdcp_hdcp1_get_link_encryption_status’
 In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:28:
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: warning: initialized field overwritten [-Woverride-init]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: note: in expansion of macro ‘mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note: in expansion of macro ‘SRI’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: note: in expansion of macro ‘XFM_COMMON_REG_LIST_DCE60’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: note: in expansion of macro ‘transform_regs’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: note: (near initialization for ‘xfm_regs[0].DCFE_MEM_LIGHT_SLEEP_CNTL’)
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: note: in expansion of macro ‘mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note: in expansion of macro ‘SRI’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: note: in expansion of macro ‘XFM_COMMON_REG_LIST_DCE60’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: note: in expansion of macro ‘transform_regs’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:645:43: warning: initialized field overwritten [-Woverride-init]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Mauro Rossi <issor.oruam@gmail.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
index cbce194ec7b82..e98b5d4141739 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
@@ -166,8 +166,7 @@
 	SRI(SCL_F_SHARP_CONTROL, SCL, id)
 
 #define XFM_COMMON_REG_LIST_DCE60(id) \
-	XFM_COMMON_REG_LIST_DCE60_BASE(id), \
-	SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
+	XFM_COMMON_REG_LIST_DCE60_BASE(id)
 #endif
 
 #define XFM_SF(reg_name, field_name, post_fix)\
-- 
2.31.1

