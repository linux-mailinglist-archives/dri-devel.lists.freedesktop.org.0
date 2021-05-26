Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F313912CB
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531E56EC38;
	Wed, 26 May 2021 08:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09D66EC38
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so8109977wmq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FkeiHBD/X56XoAULZC4Zm0KTS26etafLmMiiBA6RZwA=;
 b=E5sBb6eSXnSEoXMYdy1ht4w3v1vwsj+A6bNuBnhDM9u6F2HlqgNLzq2dNKCejMjijh
 LoGSybTP9qaeLJVLUFU8f19dMAa62x7cRdIlkcvWmTjRkW50v8sBlqUbczah4tZn4Wy2
 wW5UyWPN0MtIZPmUCCwhYYIPUMfvzsWNnV1zpYqjG7NA6SoBJc8/Zl75bVYEVDVPkFXp
 0gfV6UsRV3lvhomh9Fuc4xvbZDxgSiFFE2et/mhDJH1jTdp0F52Yd0J8fr0RWxYxxTLZ
 qOlYq09WJa9Mns74A3DYacw6KA2lZsT+deEZkdryeyolLkn+ZrR/asYaBAahuJF3hDgz
 E28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FkeiHBD/X56XoAULZC4Zm0KTS26etafLmMiiBA6RZwA=;
 b=EL+qaD7nlTbVCtU9m3DunCNlcXnMJwXbGtQ76QWWa/exNM01PuecNoniGFwZHSRbbP
 KzuJfY+EeBP+YIwlKzhrzJZ8eBfL+qE+vVicFnvh9zWYqZ3XphI6nEBCMW4VhTYW4etK
 KTvVCV9rpzNijGxnk3Xr8GY/yX/D3LXq+EtscXsOinuTTE2dXYCLkY6f2WzLLp/KUTI9
 EnxxJYZc7xqOKitVJBHAWUHqnWq/rQ8RNmReiFkKzds4srEorrpPg46XP17hksl2+xZd
 UjxrIzjQQASOp9JL3SGfdCNRQe/YZ5TzBXse34Twn1C6dGYYoN8G6F3HfnjqS8G8GkIg
 W9vA==
X-Gm-Message-State: AOAM530JTfOVYX93yB3+tQpFBjvj5dDh6BQ6Hu4avz9CWCW8OzLpyGsW
 AAg6Cok5mxcU8NvYN6NA59sAaQ==
X-Google-Smtp-Source: ABdhPJwRVFjsZJ8Yn28HNsWaQ3Eep+6zlv63t509qvwQfx+QHNdSX3OCtpjtefRI3FqPdr8dyt03gw==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr27552263wmj.109.1622018868241; 
 Wed, 26 May 2021 01:47:48 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:47 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/34] drm/amd/display/dc/dce/dce_mem_input: Remove duplicate
 initialisation of GRPH_CONTROL__GRPH_NUM_BANKS_{SHIFT, MASK}
Date: Wed, 26 May 2021 09:47:09 +0100
Message-Id: <20210526084726.552052-18-lee.jones@linaro.org>
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
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:265:2: note: in expansion of macro ‘MI_GFX6_TILE_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:657:3: note: in expansion of macro ‘MI_DCE6_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:7270:45: note: (near initialization for ‘mi_shifts.GRPH_NUM_BANKS’)
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: note: in expansion of macro ‘GRPH_CONTROL__GRPH_NUM_BANKS__SHIFT’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note: in expansion of macro ‘SFB’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:265:2: note: in expansion of macro ‘MI_GFX6_TILE_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:657:3: note: in expansion of macro ‘MI_DCE6_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:7269:43: warning: initialized field overwritten [-Woverride-init]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: note: in expansion of macro ‘GRPH_CONTROL__GRPH_NUM_BANKS_MASK’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note: in expansion of macro ‘SFB’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:265:2: note: in expansion of macro ‘MI_GFX6_TILE_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:662:3: note: in expansion of macro ‘MI_DCE6_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:7269:43: note: (near initialization for ‘mi_masks.GRPH_NUM_BANKS’)
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: note: in expansion of macro ‘GRPH_CONTROL__GRPH_NUM_BANKS_MASK’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note: in expansion of macro ‘SFB’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:265:2: note: in expansion of macro ‘MI_GFX6_TILE_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:662:3: note: in expansion of macro ‘MI_DCE6_MASK_SH_LIST’

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
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h
index 23db5c72f07ed..9b1c4d56275a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h
@@ -181,7 +181,6 @@ struct dce_mem_input_registers {
 	SFB(blk, GRPH_ENABLE, GRPH_ENABLE, mask_sh),\
 	SFB(blk, GRPH_CONTROL, GRPH_DEPTH, mask_sh),\
 	SFB(blk, GRPH_CONTROL, GRPH_FORMAT, mask_sh),\
-	SFB(blk, GRPH_CONTROL, GRPH_NUM_BANKS, mask_sh),\
 	SFB(blk, GRPH_X_START, GRPH_X_START, mask_sh),\
 	SFB(blk, GRPH_Y_START, GRPH_Y_START, mask_sh),\
 	SFB(blk, GRPH_X_END, GRPH_X_END, mask_sh),\
-- 
2.31.1

