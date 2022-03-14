Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1C4D8243
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 13:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEEC10E38C;
	Mon, 14 Mar 2022 12:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B7010E38C;
 Mon, 14 Mar 2022 12:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VH4JLLVTmsGjZM12TeV9tkCYfL9x4NOujHU4Jgu+w1I=;
 b=L3CXpax2DaNttb9lDffzBgJzlv8QFSW1v5rEwdDwwuvtUyy7/mpbG6iX
 /WY7B1Pp7OxOx5CSLVvbFeFgK55HhM32oZ7Ebx7cCX8bp6RpBRp2UwMBv
 d3MNv+Ns7ff4VorRWJmuPPyY04juf4MHXdfBhjYHAjJIqzZlrjlX1moTG U=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,180,1643670000"; d="scan'208";a="25997363"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:54:00 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 29/30] drm/amdgpu: fix typos in comments
Date: Mon, 14 Mar 2022 12:53:53 +0100
Message-Id: <20220314115354.144023-30-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index fe660a8e150f..970b065e9a6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -340,7 +340,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
 	if (free_vram >= 128 * 1024 * 1024 || free_vram >= total_vram / 8) {
 		s64 min_us;
 
-		/* Be more aggresive on dGPUs. Try to fill a portion of free
+		/* Be more aggressive on dGPUs. Try to fill a portion of free
 		 * VRAM now.
 		 */
 		if (!(adev->flags & AMD_IS_APU))
@@ -1280,7 +1280,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 			continue;
 
 		/*
-		 * Work around dma_resv shortcommings by wrapping up the
+		 * Work around dma_resv shortcomings by wrapping up the
 		 * submission in a dma_fence_chain and add it as exclusive
 		 * fence.
 		 */

