Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBDD74E78A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B733B10E31B;
	Tue, 11 Jul 2023 06:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24A110E30A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:50:32 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0Wj13WrgzBJ7d2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:50:29 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689058229; x=1691650230; bh=Mhr/DZTGpGUgrvEGl9nknyLxK3w
 3uG2a7YByFHnQioU=; b=MAVoFW2fWXCntprxRj126wKf453QsUPUlibGjwOPx2L
 fM7bdiahF/7NuCFw02sR8hZL6TheimqNlMZJPOrGa8LMH38EA9BwgoyrkiVAVauH
 slx5fDUzaEJpuHimQT+JqtLs5lZjzFZn/FLLKslayuFLP1nTFUE/xd2sy6bXa7tt
 UDR77TG1bIjRl/SeM7LvEU9sTEjOO2VU82tt/9CR5+S47WTfkUfkkqArG753V7WV
 AxiZvaf6UU1z7Hu6n9qTu0o+cLLubLWO9qae1KQUC9Wm68DGd1MhQgEq1wnW+Kzy
 51j50jXd96hIk2TMYFHFHUJJ1MXJcPHGCkrybM1/5sg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Awp1xRbiQ0yN for <dri-devel@lists.freedesktop.org>;
 Tue, 11 Jul 2023 14:50:29 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0Wj11PRWzBHXkY;
 Tue, 11 Jul 2023 14:50:29 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 14:50:29 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: add missing spaces after ','
In-Reply-To: <20230711064830.80096-1-xujianghui@cdjrlc.com>
References: <20230711064830.80096-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <df6e832a7ff5ac85ee988e9c4e2e5aa2@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing spaces to clear checkpatch errors.

ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nouveau_svm.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c 
b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a74ba8d84ba7..78ea3b541a5b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -75,8 +75,8 @@ struct nouveau_svm {
  #define FAULT_ACCESS_ATOMIC 2
  #define FAULT_ACCESS_PREFETCH 3

-#define SVM_DBG(s,f,a...) NV_DEBUG((s)->drm, "svm: "f"\n", ##a)
-#define SVM_ERR(s,f,a...) NV_WARN((s)->drm, "svm: "f"\n", ##a)
+#define SVM_DBG(s, f, a...) NV_DEBUG((s)->drm, "svm: "f"\n", ##a)
+#define SVM_ERR(s, f, a...) NV_WARN((s)->drm, "svm: "f"\n", ##a)

  struct nouveau_pfnmap_args {
      struct nvif_ioctl_v0 i;
@@ -101,9 +101,9 @@ nouveau_ivmm_find(struct nouveau_svm *svm, u64 inst)
      return NULL;
  }

-#define SVMM_DBG(s,f,a...)                                              
        \
+#define SVMM_DBG(s, f, a...)                                            
          \
      NV_DEBUG((s)->vmm->cli->drm, "svm-%p: "f"\n", (s), ##a)
-#define SVMM_ERR(s,f,a...)                                              
        \
+#define SVMM_ERR(s, f, a...)                                            
          \
      NV_WARN((s)->vmm->cli->drm, "svm-%p: "f"\n", (s), ##a)

  int
