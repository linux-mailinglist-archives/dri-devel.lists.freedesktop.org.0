Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A64C7DA16F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 21:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7DB10EA35;
	Fri, 27 Oct 2023 19:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D404910E0EF;
 Fri, 27 Oct 2023 19:45:52 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cc20df5187so7209895ad.0; 
 Fri, 27 Oct 2023 12:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698435952; x=1699040752; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cy6IbgFuL135BKR91oRxByMVAKgGs/1dk+ALnWKFvUw=;
 b=kAIMDRLKbLckONw5ZCo17GgLTzI6DlTw0P2xWzhT4SQouV9vh9I8llRXHisQlo8j3z
 1SZbIloz/QeGTF/o60w1gPNRIUEewR1/pxRuG8yulnPN62yJUVAEMJCa690vryDszByZ
 LicH9dIj6Rxp68Zz1nksroEPDWjxGT8nGL1M8RnV2f/monikJdqsrdkQPhKLtltOVb7g
 IOQz2TQDtTBaqxuUw/PLVgOr98Lki951IqQtItU7G4f2cLUi4CJr+NOCxx3h50CZhlkG
 y7lb2Xw4NX29ODPlJy3OXfJ36pSScFn6GvN9tRkWIbKUThmmzneDfvoN5CAHurGmwjek
 z0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698435952; x=1699040752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cy6IbgFuL135BKR91oRxByMVAKgGs/1dk+ALnWKFvUw=;
 b=JDiUOu/GzW5PT/AG5qaEBFqH0OTnsLAIalhyALSHh9VtlEuRqH0/3i92ZZ++PnxU/l
 n3ksL/hi8xCu5PJOg8mIaL6drq/6JzZjkpLQehW31v9SbWL8GTdVU7f7Q5JdVAz9MVnI
 dIYiz6rqLJjfViLDoWLGbMRm5VIdhgBrLKnHJ6YT2HZgwzVC9evRxBQ7O4GcXi7hEzaB
 LSWPA6q/G6DoN9xX0/bV1uFBQh9BRo+v+cqEUgJd0GmZRuFXGOt+tKsIvO+oFUtpv8cQ
 5d5QVNroUw5OCXWmlbdn6VfNYEQvM3ANytSENSeIeplQ3wBjbOr7Sa7ejWz5N1g6iidE
 dSjQ==
X-Gm-Message-State: AOJu0YxQkF6keSS4PqJkzenf0cSUf9Dzeij4rbtsuLM7ijgVSTx4cxTM
 qSXBQeqPSn5AvNCG7OHTv4L2zL4iCJI=
X-Google-Smtp-Source: AGHT+IGNfpLwVZYgsKfstsi00o+X3315W5bkhk4p0g9uo4d8PBR1FrlLIhgEKv8mSqdIInkoZ6Tvyg==
X-Received: by 2002:a17:902:e74e:b0:1cb:fcfb:61af with SMTP id
 p14-20020a170902e74e00b001cbfcfb61afmr8280487plf.30.1698435951704; 
 Fri, 27 Oct 2023 12:45:51 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 ju19-20020a170903429300b001ae0152d280sm1944708plb.193.2023.10.27.12.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 12:45:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gem: Add metadata
Date: Fri, 27 Oct 2023 12:45:37 -0700
Message-ID: <20231027194537.408922-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 59 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  4 +++
 include/uapi/drm/msm_drm.h    |  2 ++
 3 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b61ccea05327..8fe2677ea37a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -37,9 +37,10 @@
  * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
+ * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	10
+#define MSM_VERSION_MINOR	12
 #define MSM_VERSION_PATCHLEVEL	0
 
 static void msm_deinit_vram(struct drm_device *ddev);
@@ -566,6 +567,8 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		break;
 	case MSM_INFO_SET_NAME:
 	case MSM_INFO_GET_NAME:
+	case MSM_INFO_SET_METADATA:
+	case MSM_INFO_GET_METADATA:
 		break;
 	default:
 		return -EINVAL;
@@ -618,7 +621,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		break;
 	case MSM_INFO_GET_NAME:
 		if (args->value && (args->len < strlen(msm_obj->name))) {
-			ret = -EINVAL;
+			ret = -ETOOSMALL;
 			break;
 		}
 		args->len = strlen(msm_obj->name);
@@ -627,6 +630,58 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 					 msm_obj->name, args->len))
 				ret = -EFAULT;
 		}
+		break;
+	case MSM_INFO_SET_METADATA:
+		/* Impose a moderate upper bound on metadata size: */
+		if (args->len > 128) {
+			ret = -EOVERFLOW;
+			break;
+		}
+
+		ret = msm_gem_lock_interruptible(obj);
+		if (ret)
+			break;
+
+		msm_obj->metadata =
+			krealloc(msm_obj->metadata, args->len, GFP_KERNEL);
+		msm_obj->metadata_size = args->len;
+
+		if (copy_from_user(msm_obj->metadata, u64_to_user_ptr(args->value),
+				   args->len)) {
+			msm_obj->metadata_size = 0;
+			ret = -EFAULT;
+		}
+
+		msm_gem_unlock(obj);
+
+		break;
+	case MSM_INFO_GET_METADATA:
+		if (!args->value) {
+			/*
+			 * Querying the size is inherently racey, but
+			 * EXT_external_objects expects the app to confirm
+			 * via device and driver UUIDs that the exporter and
+			 * importer versions match.  All we can do from the
+			 * kernel side is check the length under obj lock
+			 * when userspace tries to retrieve the metadata
+			 */
+			args->len = msm_obj->metadata_size;
+			break;
+		}
+
+		ret = msm_gem_lock_interruptible(obj);
+		if (ret)
+			break;
+
+		if (args->len < msm_obj->metadata_size) {
+			ret = -ETOOSMALL;
+		} else if (copy_to_user(u64_to_user_ptr(args->value),
+					msm_obj->metadata, args->len)) {
+			ret = -EFAULT;
+		}
+
+		msm_gem_unlock(obj);
+
 		break;
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

