Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA014E950
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0376E1F4;
	Fri, 31 Jan 2020 08:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706EF6F91C;
 Thu, 30 Jan 2020 08:33:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so2948736wru.3;
 Thu, 30 Jan 2020 00:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TsYYlR0H8+3dQ4sHbB6QwaVOLKz9hOJEYsIrLuaV02I=;
 b=OV0g5ehLnpgelN3GOQsCVZjGTwF9RvG8qj9YaJzrgjzLWhmgvhTnjDYvRiy+/mjGBY
 ys1K/H16dPB1rt2dUSxMAr7+kbs28MqWHMlhtlnVmReFa/UFt+d3y2F7fZiRnimRN5WG
 5fdSgegAuFokTU0SlkOSRThamFYGFSCNjBPKhXZ0KF99HE7ZTBMIScCYGBct5HZvtyWc
 vuGzVcAw2NO45gLXJnLf5JigB0aDe56DqQb8/qi/I//y47YVkZHnJ9P5M8mKAKmHZFJN
 OqM45//pyWyU+eC+HwfNGL5WHUR/+1J8OW4i5iFS9cUdfjibxhHxtGrUJbHtZF+Fzkjt
 Z1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TsYYlR0H8+3dQ4sHbB6QwaVOLKz9hOJEYsIrLuaV02I=;
 b=ep3ah+50xE9SMIBui+HeKWZcJ8y1hc0LNDuQlqItJsg6+KT7BcLBxedjiqWeOjcFNt
 zMXfc4TiEkbBPALaV6k9hvRksUGHTRetHno3SjTgAaaOEj7y2cxtTsHOEWe8Im3ECaTz
 1TXwYET4qi8sY7H1WKKZITfbpJjZQ/zDuWCxtN1sP10PzIIsqsZlwUUZ5WwJaIdnLQPT
 /J86OZajY9to/fa5hR/JOmPfAyFO2gIqWCvQwnuDjjC08Y+Va/bAVshY1n5S0Adlrvpf
 p8UQx1FUUeT0ATOGCTWre8pPXpHYANahKf/uzG46Nbk96ulBucytr7SGnzSe5bAGfr7d
 iSbw==
X-Gm-Message-State: APjAAAU023XkIqPyQYKbh3yc6r502yexUwSNwSGnHkEQTWkWPMRJGF72
 qEp2FvEC02RQFVp6S2RsZjc=
X-Google-Smtp-Source: APXvYqyb6oHDc0RH4eeuEhk5mSJhStqPuHMa/1BkAYKP0BO3CO3Bwb8NIYoMxWb2M7IFLWfItwCnrg==
X-Received: by 2002:a5d:4446:: with SMTP id x6mr3977081wrr.312.1580373195006; 
 Thu, 30 Jan 2020 00:33:15 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:33:14 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 11/12] drm/i915/pipe_crc: automatic conversion to drm_device
 based logging macros.
Date: Thu, 30 Jan 2020 11:32:28 +0300
Message-Id: <20200130083229.12889-12-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130083229.12889-1-wambui.karugax@gmail.com>
References: <20200130083229.12889-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conversion of various instances of the printk based logging macros to
the new struct drm_device based logging macros in
i915/display/intel_pipe_crc.c using the following coccinelle script that
transforms based on the existence of a drm_i915_private device pointer:
@@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_pipe_crc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index b83062201212..d071a1604590 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -570,7 +570,7 @@ int intel_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 	enum intel_pipe_crc_source source;
 
 	if (display_crc_ctl_parse_source(source_name, &source) < 0) {
-		DRM_DEBUG_DRIVER("unknown source %s\n", source_name);
+		drm_dbg(&dev_priv->drm, "unknown source %s\n", source_name);
 		return -EINVAL;
 	}
 
@@ -595,14 +595,15 @@ int intel_crtc_set_crc_source(struct drm_crtc *crtc, const char *source_name)
 	bool enable;
 
 	if (display_crc_ctl_parse_source(source_name, &source) < 0) {
-		DRM_DEBUG_DRIVER("unknown source %s\n", source_name);
+		drm_dbg(&dev_priv->drm, "unknown source %s\n", source_name);
 		return -EINVAL;
 	}
 
 	power_domain = POWER_DOMAIN_PIPE(crtc->index);
 	wakeref = intel_display_power_get_if_enabled(dev_priv, power_domain);
 	if (!wakeref) {
-		DRM_DEBUG_KMS("Trying to capture CRC while pipe is off\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Trying to capture CRC while pipe is off\n");
 		return -EIO;
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
