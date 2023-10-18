Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF87CE34E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93DE10E3CF;
	Wed, 18 Oct 2023 17:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6CC10E1A3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 17:04:30 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-27d129e2e7cso5330882a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697648669; x=1698253469;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sYcKaJqWqERqf9mJVg9l5SPhxxurnL43gEfKNlK3eU8=;
 b=C0VsdLnyhf2NZI+VgPighsuqgT9huSDiBqHAaTDBL6sBJ2F42EkrUKsBz0gXYiqlRB
 QXCUKD/plsnLmlnYgJy91XKbZyufA/zB92lDUgf4SYielYl3w6LqlUMWAWvUMyp+f4kz
 0Vcaiqq8fSB0YMzHMvfnB2q70iBVTqlXpV/LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648669; x=1698253469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sYcKaJqWqERqf9mJVg9l5SPhxxurnL43gEfKNlK3eU8=;
 b=SY7ywbDQTf+pATuvOnLMgmxwczD2Anknwphb6A+mEje17vkukZjSH2Bj0urPV9auzK
 2xNFn1aB+oImEbqahkDsjt5ovlfJ+NfVTAY4BnjftdvcfiyEd1OX2PDQ4ThQwO9Ed52x
 +leF3LYfgoh0GxvtLe2mMX4C+0uvH0tamH9iWnKSXGyl7ICQkfvQ0yBA/ymVMj+JWo09
 R57LVUzC6Uv+arHgXIAbFPgKHHCpUaTZUmX7kAKXH7TIVDFEj60awHOUNAZhGdNGcYl3
 odwHPxuMGijgswxvTJ0xPGoT6x1rlPCh2uvs40G86+mLHYrnEXOaXMRHC5Bm0Jn1XuHc
 XaEQ==
X-Gm-Message-State: AOJu0YzMXV7Uay7DcXVGqsiwkryn56hWAIbRm4Ji3oCQAoQVpUPMwYtB
 GlhiiWvmyzJLc0cLA+chCFvLlkN7NAdp1q6YZNMoTg==
X-Google-Smtp-Source: AGHT+IE5ANHL6RY8eRRWzqq3biTdujavrVszMwaN9+PLrCTsYwJfqW65RSdMsjdHDzuBGMJwLH11bw==
X-Received: by 2002:a17:90b:2886:b0:27d:8d42:6def with SMTP id
 qc6-20020a17090b288600b0027d8d426defmr5648451pjb.34.1697648669329; 
 Wed, 18 Oct 2023 10:04:29 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:26d5:64a4:ffed:7704])
 by smtp.gmail.com with ESMTPSA id
 fu15-20020a17090ad18f00b002749fee7984sm166312pjb.22.2023.10.18.10.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:04:29 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/uapi: add explicit virtgpu context debug name
Date: Wed, 18 Oct 2023 10:04:25 -0700
Message-Id: <20231018170425.564-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20231018170425.564-1-gurchetansingh@chromium.org>
References: <20231018170425.564-1-gurchetansingh@chromium.org>
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
Cc: josh.simonot@gmail.com, kraxel@redhat.com, dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two problems with the current method of determining the
virtio-gpu debug name.

1) TASK_COMM_LEN is defined to be 16 bytes only, and this is a
   Linux kernel idiom (see PR_SET_NAME + PR_GET_NAME). Though,
   Android/FreeBSD get around this via setprogname(..)/getprogname(..)
   in libc.

   On Android, names longer than 16 bytes are common.  For example,
   one often encounters a program like "com.android.systemui".

   The virtio-gpu spec allows the debug name to be up to 64 bytes, so
   ideally userspace should be able to set debug names up to 64 bytes.

2) The current implementation determines the debug name using whatever
   task initiated virtgpu.  This is could be a "RenderThread" of a
   larger program, when we actually want to propagate the debug name
   of the program.

To fix these issues, add a new CONTEXT_INIT param that allows userspace
to set the debug name when creating a context.

It takes a null-terminated C-string as the param value. The length of the
string (excluding the terminator) **should** be <= 64 bytes.  Otherwise,
the debug_name will be truncated to 64 bytes.

Link to open-source userspace:
https://android-review.googlesource.com/c/platform/hardware/google/gfxstream/+/2787176

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Josh Simonot <josh.simonot@gmail.com>
---
v2: Fixes suggested by Dmitry Osipenko
    - Squash implementation and UAPI change into one commit
    - Avoid unnecessary casts
    - Use bool when necessary
    - Add case for when length of string exceeds DEBUG_NAME_MAX_LEN.

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  5 +++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 46 ++++++++++++++++++++++----
 include/uapi/drm/virtgpu_drm.h         |  2 ++
 3 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 96365a772f77..bb7d86a0c6a1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -58,6 +58,9 @@
 #define MAX_CAPSET_ID 63
 #define MAX_RINGS 64
 
+/* See virtio_gpu_ctx_create. One additional character for NULL terminator. */
+#define DEBUG_NAME_MAX_LEN 65
+
 struct virtio_gpu_object_params {
 	unsigned long size;
 	bool dumb;
@@ -274,6 +277,8 @@ struct virtio_gpu_fpriv {
 	uint64_t base_fence_ctx;
 	uint64_t ring_idx_mask;
 	struct mutex context_lock;
+	char debug_name[DEBUG_NAME_MAX_LEN];
+	bool explicit_debug_name;
 };
 
 /* virtgpu_ioctl.c */
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 8d13b17c215b..357d670361a0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -42,12 +42,19 @@
 static void virtio_gpu_create_context_locked(struct virtio_gpu_device *vgdev,
 					     struct virtio_gpu_fpriv *vfpriv)
 {
-	char dbgname[TASK_COMM_LEN];
+	if (vfpriv->explicit_debug_name) {
+		virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
+					      vfpriv->context_init,
+					      strlen(vfpriv->debug_name),
+					      vfpriv->debug_name);
+	} else {
+		char dbgname[TASK_COMM_LEN];
 
-	get_task_comm(dbgname, current);
-	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
-				      vfpriv->context_init, strlen(dbgname),
-				      dbgname);
+		get_task_comm(dbgname, current);
+		virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
+					      vfpriv->context_init, strlen(dbgname),
+					      dbgname);
+	}
 
 	vfpriv->context_created = true;
 }
@@ -107,6 +114,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
 		value = vgdev->capset_id_mask;
 		break;
+	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
+		value = vgdev->has_context_init ? 1 : 0;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -580,7 +590,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	/* Number of unique parameters supported at this time. */
-	if (num_params > 3)
+	if (num_params > 4)
 		return -EINVAL;
 
 	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
@@ -642,6 +652,30 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 
 			vfpriv->ring_idx_mask = value;
 			break;
+		case VIRTGPU_CONTEXT_PARAM_DEBUG_NAME:
+			if (vfpriv->explicit_debug_name) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			ret = strncpy_from_user(vfpriv->debug_name,
+						u64_to_user_ptr(value),
+						DEBUG_NAME_MAX_LEN);
+
+			if (ret < 0) {
+				ret = -EFAULT;
+				goto out_unlock;
+			}
+
+			/*
+			 * strncpy_from_user doesn't copy the NULL terminator when
+			 * DEBUG_NAME_MAX_LEN bytes is copied. Fix that here.
+			 */
+			if (ret == DEBUG_NAME_MAX_LEN)
+				vfpriv->debug_name[DEBUG_NAME_MAX_LEN - 1] = '\0';
+
+			vfpriv->explicit_debug_name = true;
+			break;
 		default:
 			ret = -EINVAL;
 			goto out_unlock;
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index b1d0e56565bc..c2ce71987e9b 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -97,6 +97,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
+#define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name from userspace */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -198,6 +199,7 @@ struct drm_virtgpu_resource_create_blob {
 #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
 #define VIRTGPU_CONTEXT_PARAM_NUM_RINGS       0x0002
 #define VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK 0x0003
+#define VIRTGPU_CONTEXT_PARAM_DEBUG_NAME      0x0004
 struct drm_virtgpu_context_set_param {
 	__u64 param;
 	__u64 value;
-- 
2.42.0.655.g421f12c284-goog

