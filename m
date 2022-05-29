Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE35370DB
	for <lists+dri-devel@lfdr.de>; Sun, 29 May 2022 13:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C1710E8F8;
	Sun, 29 May 2022 11:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C0210FF41;
 Sun, 29 May 2022 06:26:41 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id
 m14-20020a17090a414e00b001df77d29587so10601760pjg.2; 
 Sat, 28 May 2022 23:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nAodg8IpCf1YlPCwEY/9oZB3Kk0d9gb9lVermXkWYgQ=;
 b=YGmcs7iemsWVptnFX27h+C259jnRis5eLefJAq/dIbSZDjLwQlHJ/g/isq2ittR4P1
 DK1u9bMGp28VXOsSFUFa0og0XVEwfpEKMomIu/9Az/C2KuBt18oN5AwZS1lqjbK6koX/
 IZ4J9cdZg11LWVrlFiWFK506unGfJpCjRs7VFngFAsXBXMfN+xrnjf58Hi5/ytiLAXeF
 I6CQL+kOp1DbYAsXhxhQ6svuohbtF28/VwRADbXNrli6R7vlY6IqpCtGI9bR5XBpJxpq
 XhUvzMTJqXJ0e1RZY3rbAQTOxY2NmuLNtMpFObCLe3qnD6YfbXvLstwz0/k0vNIZ5E9S
 AGvg==
X-Gm-Message-State: AOAM530OEx7JIB0UCt5+uLCrgFC+DgghgiiYk7wJ6C6ynOF/UaxBjhCc
 uZDl7wHj/JkK8VYeaRPgDbbLbLBTeQ==
X-Google-Smtp-Source: ABdhPJzlemj8sWhGGFITlnMkOA8aFFrOc3HF39ff43T9ebwbkrJKKloZRH00669Xb65j2g2+PtbrOg==
X-Received: by 2002:a17:903:2c7:b0:158:2f26:6016 with SMTP id
 s7-20020a17090302c700b001582f266016mr50903382plk.154.1653805601094; 
 Sat, 28 May 2022 23:26:41 -0700 (PDT)
Received: from localhost.localdomain (ns1003916.ip-51-81-154.us.
 [51.81.154.37]) by smtp.gmail.com with ESMTPSA id
 x12-20020a170902ec8c00b00161955fe0d5sm6761554plg.274.2022.05.28.23.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 23:26:40 -0700 (PDT)
From: sunliming <sunliming@kylinos.cn>
To: alexander.deucher@amd.com, hristian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 mike@fireburn.co.uk, Xiaojian.Du@amd.com, evan.quan@amd.com
Subject: [PATCH] drm/amdgpu: make gfx_v11_0_rlc_stop static
Date: Sun, 29 May 2022 14:26:31 +0800
Message-Id: <20220529062631.304316-1-sunliming@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 29 May 2022 11:50:28 +0000
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
Cc: kernel test robot <lkp@intel.com>, kelulanainsley@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 sunliming@kylinos.cn, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This symbol is not used outside of gfx_v11_0.c, so marks it static.

Fixes the following w1 warning:

drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1945:6: warning: no previous
prototype for function 'gfx_v11_0_rlc_stop' [-Wmissing-prototypes].

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 8c0a3fc7aaa6..cb581cfc7464 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1983,7 +1983,7 @@ static int gfx_v11_0_init_csb(struct amdgpu_device *adev)
 	return 0;
 }
 
-void gfx_v11_0_rlc_stop(struct amdgpu_device *adev)
+static void gfx_v11_0_rlc_stop(struct amdgpu_device *adev)
 {
 	u32 tmp = RREG32_SOC15(GC, 0, regRLC_CNTL);
 
-- 
2.25.1

