Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5045E2F1E8F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879AF89CD8;
	Mon, 11 Jan 2021 19:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F62C89CD8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:07:28 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id m6so523329pfk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zOtHKCqSIIbw45nUFGf2GcagWIsamTSzMZ9NY2lE63Y=;
 b=QA/r9pk09CYjlN1etbOW3cmpLq5LzBa4BGbgG2TjnJt+nyU/RFv6XA9poFv3A9TC2N
 ypebHO1ziosYXM+Vy4TtAvaAKn9R42qLd3wX0A5RIu2FPDQ8VSjUxp9FvuZ7L0KlxKh8
 gXRxNwuKpdJUaJEdFcXchSGQlUBix9mSZpJX+KkBg5mYs9JAuxA4FQpPulPNJpKZM/Uy
 gZZ43UmM2RTkSD5lWNiStd/sr5BBsAb/9AoSMVd8PI7445Owq0TfFsfgxlonssGJue3m
 dKoj3z9jTC+05Q0d2m1BHUgRo8L4YsMr5QaxD43K7edreB+mDrXAlOs/ym4DjoIbqEYP
 kv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zOtHKCqSIIbw45nUFGf2GcagWIsamTSzMZ9NY2lE63Y=;
 b=mSLNnkdbE4ZYC1AhYR8GGg1GPhEBDjpKQObFxKXxsUu7Vq1AyWXw2pmQR4VCqbnVre
 TssN8H07NTdGfb9CnO2DgcXq7e7K0VcufAl/2CqvYC6yf/xEuR1TTCLTI5TpUmMyJO55
 5wn7TjlEBg/z4mtB0Y6tyInnf0Vt0vQIL5ZWTYUSLRKD+yeziUct+UUmKMRH7fE6fUh9
 BvmRf4ROfbNugZVumieWSxTbDN+HaasbsHst1pNH8qT5m4L45OMCnPgtsiRMcwy3ivyR
 +7GwnJEuaOTdAkOAdHBzAeCOCSqWu82hwsO5XQNeEYj0ZBLCBX/SWmlEGDNGZ9eLYSWi
 I0kg==
X-Gm-Message-State: AOAM531l85jDtHlhyanbBrd5acgqAiUpBRLaLwfYjzfv4ysqO3yhiU9s
 C7dacoFUE1wUTANMsdeDovM=
X-Google-Smtp-Source: ABdhPJzi7w97zNdB3e9w5Z8338tC7498TpmxKB6MOQFE7DbhapSKa8KJXpbq8uJUjokaBh4kk/8Nkg==
X-Received: by 2002:a63:574b:: with SMTP id h11mr946746pgm.25.1610392047778;
 Mon, 11 Jan 2021 11:07:27 -0800 (PST)
Received: from adolin ([49.207.206.164])
 by smtp.gmail.com with ESMTPSA id iq3sm129577pjb.57.2021.01.11.11.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:07:27 -0800 (PST)
Date: Tue, 12 Jan 2021 00:37:22 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V5 2/3] drm/vkms: Add support for writeback module
Message-ID: <15802da4f1cdfed2b728c3d35731732f161dd073.1610391685.git.sylphrenadin@gmail.com>
References: <cover.1610391685.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1610391685.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add enable_writeback feature to vkms_config as a module.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c    | 5 +++++
 drivers/gpu/drm/vkms/vkms_drv.h    | 1 +
 drivers/gpu/drm/vkms/vkms_output.c | 9 ++++++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6b33975a5cb2..708f7f54001d 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -40,6 +40,10 @@ static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
 
+static bool enable_writeback = true;
+module_param_named(enable_writeback, enable_writeback, bool, 0444);
+MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_release(struct drm_device *dev)
@@ -189,6 +193,7 @@ static int __init vkms_init(void)
 	default_config = config;
 
 	config->cursor = enable_cursor;
+	config->writeback = enable_writeback;
 
 	return vkms_create(config);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 6a27bd8875f2..b9b4e2bc11c0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -83,6 +83,7 @@ struct vkms_output {
 struct vkms_device;
 
 struct vkms_config {
+	bool writeback;
 	bool cursor;
 	/* only set when instantiated */
 	struct vkms_device *dev;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 8f3ffb28b9d1..f5f6f15c362c 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -41,6 +41,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct drm_crtc *crtc = &output->crtc;
 	struct drm_plane *primary, *cursor = NULL;
 	int ret;
+	int writeback;
 
 	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
 	if (IS_ERR(primary))
@@ -80,9 +81,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		goto err_attach;
 	}
 
-	ret = vkms_enable_writeback_connector(vkmsdev);
-	if (ret)
-		DRM_ERROR("Failed to init writeback connector\n");
+	if (vkmsdev->config->writeback) {
+		writeback = vkms_enable_writeback_connector(vkmsdev);
+		if (writeback)
+			DRM_ERROR("Failed to init writeback connector\n");
+	}
 
 	drm_mode_config_reset(dev);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
