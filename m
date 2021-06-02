Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE5398CF6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A0C6ECC8;
	Wed,  2 Jun 2021 14:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7864A6ECC3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q5so2555750wrs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=457+N/Rh8MOrxunbiCqh3NZ4tXXcJQCrqwWFpwHmuoQ=;
 b=uActT3hvfwlLPIZ6RHgWI18UgapOBE6UhJ2FV+Z+7kx0FYvKBWb1JGMK+67m4XiN9W
 6KPxYFTp5kApYGtKlboWnuuZKOMlm55yon52q3jbgurwUFvSAZaacGVCHpXtSaZLG8r+
 MJN7c8Z58Duav2e+ZBSjATW+gRHrbGOFQl1xeUto/T3dFqI1TZOKJmL+QZmah37Sx6zO
 ha4P1AtfU02ImH5mnEFK0btmUyvMrEeraouty6b/pRgossm0hMwhryMK9NxXtJaOWuo3
 auIC+ZbLq7w/uCK8T+qn2Ejsr5/wyntXgh3uyC7WkVgTX13doyl1Vym8AkivxbZitD/T
 OnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=457+N/Rh8MOrxunbiCqh3NZ4tXXcJQCrqwWFpwHmuoQ=;
 b=MqahDKAMQLn9msDfveC8d7HhtlnsJYuqw9Qw6kkAAx7t/aAuGlZCGu8BqmBIB+yuot
 yfHEPPyUc63Au2qz2I6jGCFKP3JwqlsWHvEqd2lmsOmw2WplXJzkLhQruZhKVxpLUURb
 ZW0/yuL0ouV4/czP2Hp2x23fvwxPmPxT/kvTniCBmuFlYC3RBZL/4bEQ0ucz15XnY5OL
 uirCD5j8NRN8uuiRLE03qj2ttndYvvbmH8Rhrrfp1UBGDcDDw/F8k7cWngXMvA0q8wBK
 SnjesdCFRkHTfghva3oME/cnwWxYNCM7fpSYL/Cy8mnbTmhcSr5PXs9nxFsIxVR+jxRe
 6czQ==
X-Gm-Message-State: AOAM533YVc7Q5WKUePt9XLDkdy89Hi7gaDhWgSKR7FOf0xyx8LNrrBtd
 uzo7v5AopwY6g1nQ4RllHMp8WQ==
X-Google-Smtp-Source: ABdhPJyVZdTdil8cZTIEEb4JxiStiib0c/SBUoFAYxulgJqOyRrYcJQd+VVKJ3BGvVLvI19muxWRrw==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr33884629wrf.315.1622644407227; 
 Wed, 02 Jun 2021 07:33:27 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:26 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 16/26] drm/amd/display/dc/dce/dce_transform: Remove
 superfluous re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL, 
Date: Wed,  2 Jun 2021 15:32:50 +0100
Message-Id: <20210602143300.2330146-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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

