Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3138B3912DD
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130D66EC51;
	Wed, 26 May 2021 08:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D6E6E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so21780wmk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VdhmaHY4/dmW91tEBMJX0Bu7PliwQQfsKUoeLcKD0IA=;
 b=OibzwUzjSDVCtV8ltB9PfH3nOFJ0quNuzsPiYyQdK4H9UVDDcpJZVJC08Jz7bgj/es
 xjxQgzQO7P7v6DS+p+5LFlLJoDjgFc/+eyif00nSU48DeP0v/b6mGDTXV3LD10O1ekPm
 is1c6rW4NUNkOK5jIybllp1DeajeLodSQhk4o19+F4bbzMFT2pzK9i8eNRxZ3dsVOFTI
 YSdUNpBG5X6dNrLI2fDSqwA0eZHzNntDIKe734r8dF8O/5AUmXYqDw5qvLPYmzw8EnbS
 ddEirlfh7i28ktzE+kYO3dkKLFf5EU19PwyOR5jC4iEUtQbqEb3H/JWVADHCdbXkf9cl
 BoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdhmaHY4/dmW91tEBMJX0Bu7PliwQQfsKUoeLcKD0IA=;
 b=Y3sXx4VgKYrmQNeq0Ngxf6mq9DqNdyL+RLp3EOi//92DZ2qWRFjxVi7S8vx9m88x3h
 tfYR2KTTKQQ2Tb2CUZY6VixOvVPJIfsAk0d5D3Jdy+2cKNdnJRP9p3/b5Dw38EjSh5oz
 zCmsUFGHjp9cN0khD4ykUdMYv9o2/wAK6CHuDxiovNXQMtjjUY2aoYEdDCXkpdcpwm+U
 Hp4gCIyuFd+zz2ny2LDVDwdn81d5I+NIwFtdJKWgXIn+RNRNBRyXbdpW/OiLeOQJOtSX
 0N/iU1eby6s9LE06IWL1p4mHjnXfLRs7l9enuCcQimRdqGliTBeR6ia7gfIo1x7iRLF2
 axqQ==
X-Gm-Message-State: AOAM532WeXs9tZRKczWNSjLaqpH5iPrfGo0q2pAQkSl9jih2nl3fiNy2
 0aUwr8rwysflUmuXOPyAlu+YOw==
X-Google-Smtp-Source: ABdhPJwL1nDK4Uo0V6VHswsbzS764ElullDfNHxS322OpEzQ2x9bea+yfqjVJl6SY63hb6AWHflEjw==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr2360600wmq.48.1622018869377; 
 Wed, 26 May 2021 01:47:49 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/34] drm/amd/display/dc/dce/dce_mem_input: Remove duplicate
 initialisation of GRPH_CONTROL__GRPH_NUM_BANKS_{SHIFT, MASK
Date: Wed, 26 May 2021 09:47:10 +0100
Message-Id: <20210526084726.552052-19-lee.jones@linaro.org>
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

 In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:29:
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:7270:45: warning: initialized field overwritten [-Woverride-init]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: note: in expansion of macro ‘GRPH_CONTROL__GRPH_NUM_BANKS__SHIFT’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note: in expansion of macro ‘SFB’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:264:2: note: in expansion of macro ‘MI_GFX6_TILE_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:657:3: note: in expansion of macro ‘MI_DCE6_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:7270:45: note: (near initialization for ‘mi_shifts.GRPH_NUM_BANKS’)
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: note: in expansion of macro ‘GRPH_CONTROL__GRPH_NUM_BANKS__SHIFT’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note: in expansion of macro ‘SFB’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:264:2: note: in expansion of macro ‘MI_GFX6_TILE_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:657:3: note: in expansion of macro ‘MI_DCE6_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:7269:43: warning: initialized field overwritten [-Woverride-init]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: note: in expansion of macro ‘GRPH_CONTROL__GRPH_NUM_BANKS_MASK’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note: in expansion of macro ‘SFB’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:264:2: note: in expansion of macro ‘MI_GFX6_TILE_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:662:3: note: in expansion of macro ‘MI_DCE6_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:7269:43: note: (near initialization for ‘mi_masks.GRPH_NUM_BANKS’)
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: note: in expansion of macro ‘GRPH_CONTROL__GRPH_NUM_BANKS_MASK’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note: in expansion of macro ‘SFB’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:264:2: note: in expansion of macro ‘MI_GFX6_TILE_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:662:3: note: in expansion of macro ‘MI_DCE6_MASK_SH_LIST’

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Mauro Rossi <issor.oruam@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h
index 9b1c4d56275a4..08a4c8d029d9f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h
@@ -206,7 +206,6 @@ struct dce_mem_input_registers {
 	SFB(blk, GRPH_ENABLE, GRPH_ENABLE, mask_sh),\
 	SFB(blk, GRPH_CONTROL, GRPH_DEPTH, mask_sh),\
 	SFB(blk, GRPH_CONTROL, GRPH_FORMAT, mask_sh),\
-	SFB(blk, GRPH_CONTROL, GRPH_NUM_BANKS, mask_sh),\
 	SFB(blk, GRPH_X_START, GRPH_X_START, mask_sh),\
 	SFB(blk, GRPH_Y_START, GRPH_Y_START, mask_sh),\
 	SFB(blk, GRPH_X_END, GRPH_X_END, mask_sh),\
-- 
2.31.1

