Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5A9261BF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4955410E07B;
	Wed,  3 Jul 2024 13:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SHXq1Wrz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4950610E07B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:26:09 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so55968731fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 06:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720013167; x=1720617967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqDOtib2IWFavjXl6U2wSV2USEnbi4NLN6orparHipU=;
 b=SHXq1Wrz6yCubVN4Rhj3nkjVFS8d6dXrstA2bGriv467POZOr/SVWDBAyKeog0W94f
 IhSCTe7LmHVXZWYTIVKW8V5mS21uQ1Rek2Vg3Z8oi8ys7eicxtzkddhvG0SNAJYgovWO
 yc7s2bEVcR2fSfzJF0Lwe/BvBfmoELqqg4qO8e5fG+8slTf9M9PQkd9S7dLW+vt5cFW4
 fQ+Qfhb9/ys+Vsd5q4aEDSi0UMlZmvE5M85st+YIlWcDfowZAoPXNKw6bdFGM/o0pPXC
 P/lVCjs4MzcIpK8iRLJJ9PG9uwEAkCXW3GaYil5Q68Uium6IGTwsCPJPbLLwT4nBN1HB
 AgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720013167; x=1720617967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wqDOtib2IWFavjXl6U2wSV2USEnbi4NLN6orparHipU=;
 b=UpnOhCswQCNMwOHCVDJGvoR4ZKXeOsYO5RvnNq6wJ84o2RnTN6KzeaQ3O0RgqBMtgu
 UD4VwDB1jxc8zFifsHM1iFMp9oaSPSHRcp8tx2ei8ly32c69HhKJE5ahpPj4C8yXAGVt
 dNYIYZtdn3kt1bhoGsDnNyyLHTdXIjrcJvnhN0Ge7ycEqzexjUxq0PtbkT0ocBef9ZRs
 ZmRUvx6CgFqjWiKQjkHw1Ee+DVFKw6cpy4enXKAUW8OAmcuXgu6CtPPmmxpapoe7eYkh
 PO+eLouNkKoIRDlCf5nVdXIIoowvZ4A4aZEbrNVbcVsZb/Du3TDOWCy+eZUbEA+HaU42
 HEIA==
X-Gm-Message-State: AOJu0Yy1RjIcQ14zwVv3/K9jcsPvHPStnlB2kXL3kXBv+bblIK9ALt8B
 I87rsTDgCGQxUZTbeXVKuVqZY9txBZTrIbNW/zT4qBCDqc9zWX/y
X-Google-Smtp-Source: AGHT+IEqD8rKg0B6A9/TCTKvIiizdWpwtfHZSIj/TpFhFFZGHwUOHYYuOvAoRDhUskHH8p+qSfwGqA==
X-Received: by 2002:a2e:b53a:0:b0:2ec:6cbe:5e4c with SMTP id
 38308e7fff4ca-2ee5e4c38c3mr65664711fa.26.1720013166569; 
 Wed, 03 Jul 2024 06:26:06 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1559:9300:5f5d:6303:9414:d3d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5ba51sm237197665e9.12.2024.07.03.06.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 06:26:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/exec: provide trylock interface for eviction
Date: Wed,  3 Jul 2024 15:26:00 +0200
Message-Id: <20240703132602.4756-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703132602.4756-1-christian.koenig@amd.com>
References: <20240703132602.4756-1-christian.koenig@amd.com>
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

The TTM eviction path has some additional requirements which make it
necessary to trylock an object and then eventually keep or drop the lock
again.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_exec.c | 77 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h     |  5 +++
 2 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 220df336fbd9..b81bf5a92d97 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -336,5 +336,82 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 }
 EXPORT_SYMBOL(drm_exec_prepare_array);
 
+/**
+ * drm_exec_trylock_obj - try to lock a GEM object
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to trylock
+ *
+ * Try to lock a GEM object but don't grab a reference yet.
+ *
+ * Since we can't handle contention here it's illegal to trylock the first
+ * object.
+ *
+ * This function is suposed to be used from atomic context and we don't
+ * know if the GEM object will actually be used or not. So we don't grab a
+ * reference yet.
+ *
+ * Returns: True if the object could be locked, false otherwise.
+ */
+bool drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
+{
+	if (WARN_ON(!exec->num_objects))
+		return false;
+
+	if (exec->prelocked == obj)
+		return true;
+
+	return dma_resv_trylock_ctx(obj->resv, &exec->ticket);
+}
+EXPORT_SYMBOL(drm_exec_trylock_obj);
+
+/**
+ * drm_exec_keep_trylocked_obj - keep the trylocked obj
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to trylock
+ *
+ * Keep a trylocked object in the drm_exec state object. Grabs a reference to
+ * the object and adds it to the container of locked objects.
+ */
+int drm_exec_keep_trylocked_obj(struct drm_exec *exec,
+				struct drm_gem_object *obj)
+{
+	int ret;
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (ret) {
+		dma_resv_unlock(obj->resv);
+		return ret;
+	}
+
+	if (exec->prelocked == obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_keep_trylocked_obj);
+
+/**
+ * drm_exec_drop_trylocked_obj - drop the trylocked obj
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to trylock
+ *
+ * Used to drop a trylocked object in the drm_exec state object, drop the
+ * reservation lock again and cleanup all references.
+ */
+void drm_exec_drop_trylocked_obj(struct drm_exec *exec,
+				 struct drm_gem_object *obj)
+{
+	/*
+	 * We can't drop the reference of prelocked objects since we might still
+	 * be in atomic context. Additionally it makes sense to keep the
+	 * prelocked object around since we might need it again later on.
+	 */
+	if (exec->prelocked != obj)
+		dma_resv_unlock(obj->resv);
+}
+EXPORT_SYMBOL(drm_exec_drop_trylocked_obj);
+
 MODULE_DESCRIPTION("DRM execution context");
 MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index aa786b828a0a..a3943057a3e8 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -146,5 +146,10 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 			   struct drm_gem_object **objects,
 			   unsigned int num_objects,
 			   unsigned int num_fences);
+bool drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
+int drm_exec_keep_trylocked_obj(struct drm_exec *exec,
+				struct drm_gem_object *obj);
+void drm_exec_drop_trylocked_obj(struct drm_exec *exec,
+				struct drm_gem_object *obj);
 
 #endif
-- 
2.34.1

