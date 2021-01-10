Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1722F0782
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jan 2021 15:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EE389B11;
	Sun, 10 Jan 2021 14:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FCD89B11
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 14:05:07 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id y8so8113959plp.8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 06:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zOtHKCqSIIbw45nUFGf2GcagWIsamTSzMZ9NY2lE63Y=;
 b=jkdL4v0sWJEgwwqMHF3GsdmsH66PEAXwsSSHBaLu9MxcuuDSxTVb6o2NJPzSxgN3pY
 BED1Mt9vffz75uR/OS+4YmgbsYcakEKEDsV+CFmfcN7lyBo0tJmS6yP8DsbQMJby7YZi
 iPiNfIvM0uzkuLMJjtuM0duBmcXaeyJe4OC7my+K3uO3ahPx2mK+6w8M0DIreZv5c8Yr
 mJUnqaEDvHUrGk2pzSDaUvjquiGwzpkUne2c7kxyK//ACxK1pSu+4D+dtjn9T/M5ys9m
 GQqEEqNtaLnZbH+IxHazb4NsfVWZXSKyudUvTHUE7/5eabiV3swqG+839rVWUt0gX8bx
 1Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zOtHKCqSIIbw45nUFGf2GcagWIsamTSzMZ9NY2lE63Y=;
 b=p/jyDJOUdD8kf5Es0EKn37aw53TYF5MUwaAzg7aEiV2tuZyDnY1lbxSGrLSuX7l8ws
 u/doyHBiacIuBQAFaeoQl23RcyypHcOqm1+fdhXtiQWKEUorTm6jpkuaBq5Eh1u99oOf
 or/K6x+9gBK8ld2GAJ23Xg3rfIa65BOfa/JNyVkzWAG9htTygEWgPrr0J6bdkEVO91PS
 Xl9T97uFBDZFFtL4KpQhimnObmPrHJNZwJ4ZdrU3+np/hIrimYROQn04NiSLo5MQelsW
 q03S1LWBHJSHIjXJZ+rqW4vM4306JEDcvyutkH6YejL6J02MmFdjzIXVxtaxJTKTBB82
 Ba3g==
X-Gm-Message-State: AOAM531FH0Xgv5g/u1nZYrqIQ4LHb5LuLeaLpq6zVG+ypMiibPPe4fgu
 hirZXZpGM4Vjq7fCaSleDgs=
X-Google-Smtp-Source: ABdhPJw+cu5SUG7hcrkHXhIsh2+fvVs8KAXD/UtVBaQLT9Md3en3TY8Jb98oTTQVnS4wbJgnCdloag==
X-Received: by 2002:a17:902:ed45:b029:da:c274:d7ac with SMTP id
 y5-20020a170902ed45b02900dac274d7acmr12227359plb.69.1610287507249; 
 Sun, 10 Jan 2021 06:05:07 -0800 (PST)
Received: from adolin ([49.207.199.194])
 by smtp.gmail.com with ESMTPSA id t5sm11317297pjr.22.2021.01.10.06.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 06:05:06 -0800 (PST)
Date: Sun, 10 Jan 2021 19:35:02 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V4 2/3] drm/vkms: Add support for writeback module
Message-ID: <15802da4f1cdfed2b728c3d35731732f161dd073.1610200411.git.sylphrenadin@gmail.com>
References: <cover.1610200411.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1610200411.git.sylphrenadin@gmail.com>
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
