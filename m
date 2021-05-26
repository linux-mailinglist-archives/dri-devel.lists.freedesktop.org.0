Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61973912EE
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D9D6EC69;
	Wed, 26 May 2021 08:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0090B6EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so21916wmk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AktsaW6Bskrl1AG9i/afTuE+QfmnEvj7VSG37dmiSWQ=;
 b=AMLIuKLP7eSD0sQl6i4Ap0vsy36DUSOgzVtp8L5oSEfnpTJCzDcp/yKF22mI0y26sa
 SpDRKYEjS2uXTV5SIW5Vt8N8WRp8mz/NdmqBk3bbvU0awuGVjIZf8aKWVcK80HsUbptz
 RBz5KT8u+J8qZUe3iXi9/qnh67ZzNWd16LXytB8ttHMVFungJYt+R/wb8iI3y55ckGjo
 iKNvXoLB5a9wf23OAC6Jl3Gbg1005Vt3ykvMblCgbv4f3URaUYHZxKliCVHtiqPP2cgA
 gPQ8tMpzPPzPdJdyo/90eMDMW1QWpa13GO/7syQKyh+U67CCcZBpf2LETCS7N+LhXIpS
 ci6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AktsaW6Bskrl1AG9i/afTuE+QfmnEvj7VSG37dmiSWQ=;
 b=EGcrbG23NiWzRodEfP+gSeEtVrRVRxUcgNnf0IdwrofQv/phK1P+FkV8hip5X3YVkF
 CWGg20uWxeAVh7dlkmAi4QoVSkc6S/seSjYTY2NREWPzQoPTGM5CJp3Hue/eHRCC4xIQ
 bL+x0IRGHLWkTtVqei/oaVNSxwdDiUg2fwvfoYqjEvpw8A1jxWVhtC8tYvlMzUGCQIGQ
 HzcqqRnWG3EJkVhmIqsDl4C2beFr0iZA2j3WwCECze6ZKF/vGIFBuv1J2Ki4+sbmpenr
 SECYNolvgGfZSYRU0aw99nzD70w6P0I6CbVC6ordlam30Pm58rFnmbqzvcX498tgSCVC
 XOJA==
X-Gm-Message-State: AOAM530mdPyp/VimHVvKBCgObwZAVGZ7UvM5hsSvc+lLEgvDR5t2+JUz
 rQdgvDCXdzbzdNmAeXOoiX/LJA==
X-Google-Smtp-Source: ABdhPJwx3JNUrEk+A41Ghrk79W/6tF7/o6fr6xpd7rM4y6GJ9Wa2Ujsktlv5HTFdW68nwOBkfQ7m0Q==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr28003511wmi.101.1622018875645; 
 Wed, 26 May 2021 01:47:55 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:55 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/34] drm/amd/display/modules/hdcp/hdcp_psp: Remove unused
 function 'mod_hdcp_hdcp1_get_link_encryption_status()'
Date: Wed, 26 May 2021 09:47:16 +0100
Message-Id: <20210526084726.552052-25-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.c:374:22: warning: no previous prototype for ‘mod_hdcp_hdcp1_get_link_encryption_status’ [-Wmissing-prototypes]

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
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
index 26f96c05e0ec8..06910d2fd57a0 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
@@ -371,19 +371,6 @@ enum mod_hdcp_status mod_hdcp_hdcp1_link_maintenance(struct mod_hdcp *hdcp)
 	return status;
 }
 
-enum mod_hdcp_status mod_hdcp_hdcp1_get_link_encryption_status(struct mod_hdcp *hdcp,
-							       enum mod_hdcp_encryption_status *encryption_status)
-{
-	*encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
-
-	if (mod_hdcp_hdcp1_link_maintenance(hdcp) != MOD_HDCP_STATUS_SUCCESS)
-		return MOD_HDCP_STATUS_FAILURE;
-
-	*encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP1_ON;
-
-	return MOD_HDCP_STATUS_SUCCESS;
-}
-
 enum mod_hdcp_status mod_hdcp_hdcp2_create_session(struct mod_hdcp *hdcp)
 {
 	struct psp_context *psp = hdcp->config.psp.handle;
-- 
2.31.1

