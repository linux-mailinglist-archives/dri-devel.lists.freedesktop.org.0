Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A9DCEA255
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 17:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC9E10E881;
	Tue, 30 Dec 2025 16:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.b="POhKshxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E4410E881;
 Tue, 30 Dec 2025 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/GJTEkb0nveRmgPNrQ1c7z5Z5ph8XZkYR4LBfZVL7Hw=;
 b=POhKshxjX+YNJ2/tZKRqF+MlwIefKOpDSFE9XjYsIAIX5arTKezXBfdd
 hTf3pX5qaiPdKuAiLXdztYvknnZCWt31f1ly285uWJ5oe9t9y0r7ZMxXQ
 dJIYVBTwZ2OPDFUu4yi1LN/l7UpFm+5EgQ2Jv6eJ2nMjJny2e9It5NHMU 0=;
X-CSE-ConnectionGUID: KNGD4vc/SYStVpWu765PEg==
X-CSE-MsgGUID: LqkfV77ITkOrQ8Z/rZipNQ==
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,189,1763420400"; d="scan'208";a="134757179"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 17:17:24 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: yunbolyu@smu.edu.sg, kexinsun@smail.nju.edu.cn, ratnadiraw@smu.edu.sg,
 xutong.ma@inria.fr, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdkfd: update outdated comment
Date: Tue, 30 Dec 2025 17:17:17 +0100
Message-Id: <20251230161717.100947-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function acquire_packet_buffer() was renamed
kq_acquire_packet_buffer() by commit a5a4d68c9326 ("drm/amdkfd:
Eliminate unnecessary kernel queue function pointers").  Update
the comment accordingly.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c
index fb3129883a4c..ee8e1216c526 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c
@@ -256,7 +256,7 @@ int kq_acquire_packet_buffer(struct kernel_queue *kq,
 	if (packet_size_in_dwords > available_size) {
 		/*
 		 * make sure calling functions know
-		 * acquire_packet_buffer() failed
+		 * kq_acquire_packet_buffer() failed
 		 */
 		goto err_no_space;
 	}

