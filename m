Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4208769671
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B286D10E283;
	Mon, 31 Jul 2023 12:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DB810E283
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:36:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31297125334so3034555f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 05:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690806988; x=1691411788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=zf2opAJWpIyipvbGeaqpygqhHDn8/Va05DqGxlPq9ZA=;
 b=nGLy3tslf30CMuBGiZ5azZCYGUYkwNJncgji3o/tFpCs0J6224of147dgfuLSF8hfZ
 s0sra2xiU81n0Y/Dg+xkeGNm14dsEc2WNGZW1Sr6cqD2b7+j6sGO9A3eAhxq6gchENsx
 CzG3oMkOfFWE5FkttESQiNcQJ8DiWjy+07iT+0OH5+szSzEXPhDzY9poIBHCmprvsXKM
 eu3tyZoXW5C/a1SqK/mQlG+n8cOik2L9vgA2l5h+kzQ9G/wXO6MAupp9jN8nnfHSSGTb
 Qew89VNs8dD6l3I1+bLKRBuLm/+7hJostcnoqboC8KsSxP20bjvPRMYQCB5Jy5htO7il
 9cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690806988; x=1691411788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zf2opAJWpIyipvbGeaqpygqhHDn8/Va05DqGxlPq9ZA=;
 b=Mql9+p/NMdx2Eyvx6qz3qs63EoFLtP0PxNgemWkwX0LVzWUtF6i/Hcysr9xBmbzGyG
 LBgZmoQiD4BSFHUWfwSDIsnjFdl3gG2Bggr5saYvD42Qzt7rAgQPOKgxcLtrZ/S1IWxE
 Kk2cICnjMtlnFTyiBC7SWFW7Siasaeox3U/ywP4AhG5pP4lhKKqO7FJSL/OHY0NsxCZE
 rxcX+V0knvJHZE9Ya1FNMKGqMYZwkZX4r9PP0KYO8ug0DxMZVaCilU+RZ4FM3Uv3OAa8
 962Kgga7kK57uRnB3iEDTqTpa/LX9FttidsGRaf9eq0+IPsl7i+8XxSdlYwOEnv++E4F
 vcGQ==
X-Gm-Message-State: ABy/qLYVTKI6Uyxle/WocR3FteRr8rP8ecDo3QGzvX1oULq5dv3VlRdf
 Yky0CzORne+cJKs0izEg02s=
X-Google-Smtp-Source: APBJJlEvv30ndSO7ZKIgteoM7qxvowfzxbYmdIS/70P2PRqn3P/08DXO9LgWFAkN1dyyP8slBRUhWw==
X-Received: by 2002:adf:fece:0:b0:313:df09:acfb with SMTP id
 q14-20020adffece000000b00313df09acfbmr8245282wrs.11.1690806987609; 
 Mon, 31 Jul 2023 05:36:27 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:14f0:a600:ce89:8608:2d6f:110d])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d4e8f000000b003143c532431sm12958292wru.27.2023.07.31.05.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:36:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: boris.brezillon@collabora.com, ndesaulniers@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, trix@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, naresh.kamboju@linaro.org, dakr@redhat.com
Subject: [PATCH 1/2] drm/exec: use unique instead of local label
Date: Mon, 31 Jul 2023 14:36:24 +0200
Message-Id: <20230731123625.3766-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GCC forbids to jump to labels in loop conditions and a new clang
check stumbled over this.

So instead using a local label inside the loop condition use an
unique label outside of it.

Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
Link: https://github.com/ClangBuiltLinux/linux/issues/1890
Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d096eb3aed7b712f5067
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
CC: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/drm/drm_exec.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 73205afec162..e0462361adf9 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -3,6 +3,7 @@
 #ifndef __DRM_EXEC_H__
 #define __DRM_EXEC_H__
 
+#include <linux/compiler.h>
 #include <linux/ww_mutex.h>
 
 #define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
@@ -74,13 +75,12 @@ struct drm_exec {
  * Since labels can't be defined local to the loops body we use a jump pointer
  * to make sure that the retry is only used from within the loops body.
  */
-#define drm_exec_until_all_locked(exec)				\
-	for (void *__drm_exec_retry_ptr; ({			\
-		__label__ __drm_exec_retry;			\
-__drm_exec_retry:						\
-		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
-		(void)__drm_exec_retry_ptr;			\
-		drm_exec_cleanup(exec);				\
+#define drm_exec_until_all_locked(exec)					\
+__PASTE(__drm_exec_, __LINE__):						\
+	for (void *__drm_exec_retry_ptr; ({				\
+		__drm_exec_retry_ptr = &&__PASTE(__drm_exec_, __LINE__);\
+		(void)__drm_exec_retry_ptr;				\
+		drm_exec_cleanup(exec);					\
 	});)
 
 /**
-- 
2.34.1

