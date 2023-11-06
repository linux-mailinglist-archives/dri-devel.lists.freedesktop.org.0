Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9797E2C57
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A9310E3C8;
	Mon,  6 Nov 2023 18:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64B510E3C6;
 Mon,  6 Nov 2023 18:50:37 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5bd33abbb90so2661302a12.2; 
 Mon, 06 Nov 2023 10:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699296636; x=1699901436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMBUj2Kt6SbeiWM5ttIg3zTrO2lSIQVfD3WAaZwy4rI=;
 b=O7fI3D95haUeusu3AAZ7YoPgfpMRHtBXALArWtOKaObqltCUoiwV5kqtp6FG3krBog
 XihO6+TMyI5BNv/3YlyS/q758/2fK+4u8QNy1v4jkcCcrt5D5hV5F2D6ur0dhz5vumEz
 PugRC/pgul4gM5LM5Xd+vGMF7kdAfictXG40zJlrW/9ImnxROYr8QQFp6dzWPqqiSXJ/
 5SKvkPi+FaM81xmPtgpaVvtBVBGGY3p2jJTJvukSg8DRLj7cBfVcdcaGz4Onz15t5BKZ
 1ERJMyf0C1BXsRx48806oncpRlHqzj0de7LBjv4XWXFl1KaNhSTl0z3B9n4kUwFHgtMr
 tKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699296636; x=1699901436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DMBUj2Kt6SbeiWM5ttIg3zTrO2lSIQVfD3WAaZwy4rI=;
 b=ll8oGaOSHzha9HzDf4kq1Ix9aopU9yZwOG8TOvY7GNMjGxCvAAgZ7FmlRTnC8sdhv7
 1oXfr/2TXns0wr33Dp6zbby/vgITafRTl97J1wDPE1+79N4ICtLc/7rQer2QO5HDEpRk
 CefqSLLiiv7Bu8GorC7Hw3KjOd9+WlGKp1+zeLDS9w2RkCozixq4f4xt2V1/DTfxaKPa
 Bxnxu7tmHPC6YgsfsQGf/S9EhLJbo1nxOWkRA0UtIy4pg3bCk9O96nzML3HE7KShYI2B
 GkzwJ+zIXEj927EwwIyQ95ryqB6svef2MpOcthceSlwTxHmMAmKVaq4x0ItCHxROaXRt
 HYKA==
X-Gm-Message-State: AOJu0Yw/fgYeL5jher2lf7KKYmUlc3q+j0+jQz8MGMV6TllAfQkR0Ggu
 H6TrOA6WUZvcKKLx2WUTY0NtLL/zEK8=
X-Google-Smtp-Source: AGHT+IEpIxI6HOgD4VG/z4qSIMgMurh0j6eSjFkqM7cUS1WvSwGLhAKP7XbFexVhwhJXkI3Dg0BZhQ==
X-Received: by 2002:a05:6a20:a115:b0:13d:df16:cf29 with SMTP id
 q21-20020a056a20a11500b0013ddf16cf29mr27399556pzk.15.1699296636342; 
 Mon, 06 Nov 2023 10:50:36 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b006c31c0dfb69sm5919796pfo.188.2023.11.06.10.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 10:50:35 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/msm/gem: Add metadata
Date: Mon,  6 Nov 2023 10:50:26 -0800
Message-ID: <20231106185028.209462-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106185028.209462-1-robdclark@gmail.com>
References: <20231106185028.209462-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The EXT_external_objects extension is a bit awkward as it doesn't pass
explicit modifiers, leaving the importer to guess with incomplete
information.  In the case of vk (turnip) exporting and gl (freedreno)
importing, the "OPTIMAL_TILING_EXT" layout depends on VkImageCreateInfo
flags (among other things), which the importer does not know.  Which
unfortunately leaves us with the need for a metadata back-channel.

The contents of the metadata are defined by userspace.  The
EXT_external_objects extension is only required to work between
compatible versions of gl and vk drivers, as defined by device and
driver UUIDs.

v2: add missing metadata kfree
v3: Rework to move copy_from/to_user out from under gem obj lock
    to avoid angering lockdep about deadlocks against fs-reclaim

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Note, I dropped Dmitry's r-b on this version because it was a bit of
a re-write of the original patch.

 drivers/gpu/drm/msm/msm_drv.c | 92 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gem.c |  1 +
 drivers/gpu/drm/msm/msm_gem.h |  4 ++
 include/uapi/drm/msm_drm.h    |  2 +
 4 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 781db689fb16..c05c27a70c34 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -49,9 +49,10 @@
  * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
+ * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	11
+#define MSM_VERSION_MINOR	12
 #define MSM_VERSION_PATCHLEVEL	0
 
 static void msm_deinit_vram(struct drm_device *ddev);
@@ -822,6 +823,85 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 	return msm_gem_set_iova(obj, ctx->aspace, iova);
 }
 
+static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
+					   __user void *metadata,
+					   u32 metadata_size)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	void *buf;
+	int ret;
+
+	/* Impose a moderate upper bound on metadata size: */
+	if (metadata_size > 128) {
+		return -EOVERFLOW;
+	}
+
+	/* Use a temporary buf to keep copy_from_user() outside of gem obj lock: */
+	buf = memdup_user(metadata, metadata_size);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	ret = msm_gem_lock_interruptible(obj);
+	if (ret)
+		goto out;
+
+	msm_obj->metadata =
+		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
+	msm_obj->metadata_size = metadata_size;
+	memcpy(msm_obj->metadata, buf, metadata_size);
+
+	msm_gem_unlock(obj);
+
+out:
+	kfree(buf);
+
+	return ret;
+}
+
+static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
+					   __user void *metadata,
+					   u32 *metadata_size)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	void *buf;
+	int ret, len;
+
+	if (!metadata) {
+		/*
+		 * Querying the size is inherently racey, but
+		 * EXT_external_objects expects the app to confirm
+		 * via device and driver UUIDs that the exporter and
+		 * importer versions match.  All we can do from the
+		 * kernel side is check the length under obj lock
+		 * when userspace tries to retrieve the metadata
+		 */
+		*metadata_size = msm_obj->metadata_size;
+		return 0;
+	}
+
+	ret = msm_gem_lock_interruptible(obj);
+	if (ret)
+		return ret;
+
+	/* Avoid copy_to_user() under gem obj lock: */
+	len = msm_obj->metadata_size;
+	buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
+
+	msm_gem_unlock(obj);
+
+	if (*metadata_size < len) {
+		ret = -ETOOSMALL;
+	} else if (copy_to_user(metadata, buf, len)) {
+		ret = -EFAULT;
+	} else {
+		*metadata_size = len;
+	}
+
+	kfree(buf);
+
+	return 0;
+}
+
 static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -844,6 +924,8 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		break;
 	case MSM_INFO_SET_NAME:
 	case MSM_INFO_GET_NAME:
+	case MSM_INFO_SET_METADATA:
+	case MSM_INFO_GET_METADATA:
 		break;
 	default:
 		return -EINVAL;
@@ -906,6 +988,14 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 				ret = -EFAULT;
 		}
 		break;
+	case MSM_INFO_SET_METADATA:
+		ret = msm_ioctl_gem_info_set_metadata(
+			obj, u64_to_user_ptr(args->value), args->len);
+		break;
+	case MSM_INFO_GET_METADATA:
+		ret = msm_ioctl_gem_info_get_metadata(
+			obj, u64_to_user_ptr(args->value), &args->len);
+		break;
 	}
 
 	drm_gem_object_put(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1113e6b2ec8e..175ee4ab8a6f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1058,6 +1058,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 
 	drm_gem_object_release(obj);
 
+	kfree(msm_obj->metadata);
 	kfree(msm_obj);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7f34263048a3..8d414b072c29 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -109,6 +109,10 @@ struct msm_gem_object {
 
 	char name[32]; /* Identifier to print for the debugfs files */
 
+	/* userspace metadata backchannel */
+	void *metadata;
+	u32 metadata_size;
+
 	/**
 	 * pin_count: Number of times the pages are pinned
 	 *
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 6c34272a13fd..6f2a7ad04aa4 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -139,6 +139,8 @@ struct drm_msm_gem_new {
 #define MSM_INFO_GET_NAME	0x03   /* get debug name, returned by pointer */
 #define MSM_INFO_SET_IOVA	0x04   /* set the iova, passed by value */
 #define MSM_INFO_GET_FLAGS	0x05   /* get the MSM_BO_x flags */
+#define MSM_INFO_SET_METADATA	0x06   /* set userspace metadata */
+#define MSM_INFO_GET_METADATA	0x07   /* get userspace metadata */
 
 struct drm_msm_gem_info {
 	__u32 handle;         /* in */
-- 
2.41.0

