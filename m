Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39C4920B1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 08:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE27D10E1C7;
	Tue, 18 Jan 2022 07:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170AF10E1C7;
 Tue, 18 Jan 2022 07:57:12 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id d4so1139953qtw.1;
 Mon, 17 Jan 2022 23:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oVASYcnUzo//aC4Lo3/46A3KtVN0oXM5tvWTeJ4jCZ8=;
 b=dFYGMojLFUBw1OMQjj6HwqnFRyARImliTcO5d7rybcEcORxWEfUGG7jjQtc9PHvOhb
 FTa0uKEgRc18PNWHHcixKTxZa+PX1QMKX20DuT5ma1QOhCgYVM22WgljjR4LB6SlXNYp
 jif/sq0cmvxhBSQ0kOaqsHsd3B+bEeDTxG7Chlz4Zd5FUfDSSeCgGJLCJ9l2AYOlGAPM
 6TzP+9gN33/WW2NlNFUROaL87ApVOyv1AgPoG5yMDqSOPrbMz3ES6zeZ12yOapBa7nk4
 I+IxRKwRqZYxPiW7qZNqrvhv1zLwawkF9wvs2u2JyItB1A8c2cCboH1TPGHCDcV8cShI
 a05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oVASYcnUzo//aC4Lo3/46A3KtVN0oXM5tvWTeJ4jCZ8=;
 b=V6kJxpT1i2x2texRa60Sc5EUSOLDDlyLf0WU09D10r5iVXogstg2gJdIGD8R6wLY9y
 wtS+LzYiAOidnSISPJvNBZcWKdr7XVJoLAdwVUtFkthOSOMdjaQChCNmIKV1ENtaBWPQ
 uhXE+SgAKa4noFi3UdY84mdKBSe/rbyXyUiq/y4E0/V48MXeKI5sT1tCN/g7ef8sfZDO
 +y7IWVOpxY0/YU7Zi9SLayisuFgRSsIEBMkO1N8lHLkKBCjhtzxERlA4xcIRRC2oQY4p
 /EphTiEhXW9DqUYJ5wPsp3UP0wI+bTBjxRe05cqyeMbrStsNnDfQLLAzHLoBUWGlWOso
 UP3Q==
X-Gm-Message-State: AOAM532nu+Xpk0NTME48wLCe7Sr/HeYaMf5tLaM0soG8ggcoKaxN3Kso
 v+bEUrEwVzDyGewLnhR1SJY=
X-Google-Smtp-Source: ABdhPJzTOFGF33TPzBo+kbuXuIEVovrBBhmGDVuKZqsKz3S+0IG70LLGvd0QdY8yw99+kVf8vs/r8g==
X-Received: by 2002:a05:622a:2d1:: with SMTP id
 a17mr18608482qtx.196.1642492631252; 
 Mon, 17 Jan 2022 23:57:11 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id o7sm10070549qke.44.2022.01.17.23.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 23:57:10 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH] amdgpu/amdgpu_psp: remove unneeded ret variable
Date: Tue, 18 Jan 2022 07:57:02 +0000
Message-Id: <20220118075702.925929-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: lijo.lazar@amd.com, airlied@linux.ie, lang.yu@amd.com, Oak.Zeng@amd.com,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 Minghao Chi <chi.minghao@zte.com.cn>, jonathan.kim@amd.com,
 dri-devel@lists.freedesktop.org, CGEL ZTE <cgel.zte@gmail.com>,
 candice.li@amd.com, john.clements@amd.com, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from amdgpu_bo_create_kernel() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index dee17a0e1187..ac2b87f81ef9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -914,19 +914,15 @@ static void psp_prep_ta_load_cmd_buf(struct psp_gfx_cmd_resp *cmd,
 static int psp_ta_init_shared_buf(struct psp_context *psp,
 				  struct ta_mem_context *mem_ctx)
 {
-	int ret;
-
 	/*
 	* Allocate 16k memory aligned to 4k from Frame Buffer (local
 	* physical) for ta to host memory
 	*/
-	ret = amdgpu_bo_create_kernel(psp->adev, mem_ctx->shared_mem_size,
+	return amdgpu_bo_create_kernel(psp->adev, mem_ctx->shared_mem_size,
 				      PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM,
 				      &mem_ctx->shared_bo,
 				      &mem_ctx->shared_mc_addr,
 				      &mem_ctx->shared_buf);
-
-	return ret;
 }
 
 static void psp_ta_free_shared_buf(struct ta_mem_context *mem_ctx)
-- 
2.25.1

