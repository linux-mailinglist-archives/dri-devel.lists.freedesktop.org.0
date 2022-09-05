Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9F25AD621
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE7C10E426;
	Mon,  5 Sep 2022 15:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2B110E41B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kBxkoMSoocenFWS5QnFTVJk53upsFpOoCTaLoDSzmI=;
 b=Ym93OtH0ZaS4MDfuCQyYLeoLZhdqZ2BIofZ+hGpE3VJPU83rzlIRAX6K1WJkfq6iEFpCr9
 iFRkKrr1/ZJ6F606twssKVv5MJEgRZYBXdg5FYoSnoH5SNW0ISw2hcjkFOd86CAs9Zr0T4
 GoiaC2Sn2NDc7WzWgPF32mrifppxYK8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-F1LbeZZNN2GsBlfA-CDeAw-1; Mon, 05 Sep 2022 11:20:45 -0400
X-MC-Unique: F1LbeZZNN2GsBlfA-CDeAw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s1-20020adf9781000000b002286cd81376so716627wrb.22
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9kBxkoMSoocenFWS5QnFTVJk53upsFpOoCTaLoDSzmI=;
 b=Qae+JVkMjp6Jwe5j3CXvoc1YQRCdpGqzXJR2dZ+d8NlWzyKABGA/V879V6nBjwyf3e
 ZWWaS9+eVKNzIOPTECMVB8A2unIgePk9TNfDbxudgKOHWDNM98RxQHLCFn+jkPSR2nIA
 eyJTOLG0G4a04686lpWS7LXspG1bvNtwEzhHBcKbTx2qcb5+blGPm/JbedHmhbTuzbHp
 5bvUS6rhJLnnsihVNotw2p+Re9hrRfm20QknWooLJxjd0lBG8XtwpjT3s2N4rtP0u6FE
 Hd8qAU5XxTLqXQus75OqQtdZ2bI6XInaUqSyGgR6tVi6PllBTBoLUeZX4uWI+usIyXRt
 zUHg==
X-Gm-Message-State: ACgBeo2xCLa4CVb/Qf1ITvJ89asUCSzTB7iipxpBjufAN+P6l8Ojoipl
 zudqZoIElwOJ7xEIJ7i0OtqKMfzXKrm/7DJ4/08REcuw22aXPUO/wKlke8fE478qa/8IgmrTad5
 Tlq/HQtojCgzdKsWVRNd0pgAat840
X-Received: by 2002:a05:6000:118e:b0:228:9373:70ae with SMTP id
 g14-20020a056000118e00b00228937370aemr2737616wrx.467.1662391243882; 
 Mon, 05 Sep 2022 08:20:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57AZWTw36W89LbLt9c7lRycXE7G5TIWvzY7JI3W+d7SJ+dvNHGroLtZktX1idf6HX851gcKw==
X-Received: by 2002:a05:6000:118e:b0:228:9373:70ae with SMTP id
 g14-20020a056000118e00b00228937370aemr2737601wrx.467.1662391243671; 
 Mon, 05 Sep 2022 08:20:43 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adff385000000b00228c792aaaasm1383446wro.100.2022.09.05.08.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:20:43 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 7/8] drm/arm/malidp: crtc: protect device
 resources after removal
Date: Mon,  5 Sep 2022 17:20:40 +0200
Message-Id: <20220905152041.98451-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905151910.98279-1-dakr@redhat.com>
References: <20220905151910.98279-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user didn't
close it, hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_crtc.c | 41 +++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index dc01c43f6193..fa95278abae6 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -14,6 +14,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -27,6 +28,7 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
+	int idx;
 
 	/*
 	 * check that the hardware can drive the required clock rate,
@@ -34,6 +36,9 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
 	 */
 	long rate, req_rate = mode->crtc_clock * 1000;
 
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return MODE_NOCLOCK;
+
 	if (req_rate) {
 		rate = clk_round_rate(hwdev->pxlclk, req_rate);
 		if (rate != req_rate) {
@@ -43,6 +48,8 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
 		}
 	}
 
+	drm_dev_exit(idx);
+
 	return MODE_OK;
 }
 
@@ -53,6 +60,10 @@ static void malidp_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct videomode vm;
 	int err = pm_runtime_get_sync(crtc->dev->dev);
+	int idx;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return;
 
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to enable runtime power management: %d\n", err);
@@ -68,6 +79,8 @@ static void malidp_crtc_atomic_enable(struct drm_crtc *crtc,
 	hwdev->hw->modeset(hwdev, &vm);
 	hwdev->hw->leave_config_mode(hwdev);
 	drm_crtc_vblank_on(crtc);
+
+	drm_dev_exit(idx);
 }
 
 static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -77,7 +90,10 @@ static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
 									 crtc);
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
-	int err;
+	int err, idx;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return;
 
 	/* always disable planes on the CRTC that is being turned off */
 	drm_atomic_helper_disable_planes_on_crtc(old_state, false);
@@ -91,6 +107,8 @@ static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to disable runtime power management: %d\n", err);
 	}
+
+	drm_dev_exit(idx);
 }
 
 static const struct gamma_curve_segment {
@@ -260,7 +278,10 @@ static int malidp_crtc_atomic_check_scaling(struct drm_crtc *crtc,
 	u32 h_upscale_factor = 0; /* U16.16 */
 	u32 v_upscale_factor = 0; /* U16.16 */
 	u8 scaling = cs->scaled_planes_mask;
-	int ret;
+	int idx, ret;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return -ENODEV;
 
 	if (!scaling) {
 		s->scale_enable = false;
@@ -334,6 +355,9 @@ static int malidp_crtc_atomic_check_scaling(struct drm_crtc *crtc,
 	ret = hwdev->hw->se_calc_mclk(hwdev, s, &vm);
 	if (ret < 0)
 		return -EINVAL;
+
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
@@ -498,9 +522,16 @@ static int malidp_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
+	int idx;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return -ENODEV;
 
 	malidp_hw_enable_irq(hwdev, MALIDP_DE_BLOCK,
 			     hwdev->hw->map.de_irq_map.vsync_irq);
+
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
@@ -508,9 +539,15 @@ static void malidp_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
+	int idx;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return;
 
 	malidp_hw_disable_irq(hwdev, MALIDP_DE_BLOCK,
 			      hwdev->hw->map.de_irq_map.vsync_irq);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_crtc_funcs malidp_crtc_funcs = {
-- 
2.37.2

