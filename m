Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB6821B8C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 13:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC80610E13F;
	Tue,  2 Jan 2024 12:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888DF10E13F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704198136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5aXs8fUOsfgSo7g4FENf0GEgJl7/TE420KVs2VRDTFk=;
 b=b/YLEggfCo4pwf2yxMKhVt4qUBpzMhLPBLwa2gWl6tVZXPiVTgxn/E41k0h/Vp9Ug6tI9s
 GJRzAfglWC8quVdokeFJmSdydo1U0YM5Pf/5Jc7slkES1mdcfbTEI+ynfZbc2vBCREo9yN
 IL+wVjteyCBDwIXJEelv/CAXyN+OzE8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-n_CaR_oXPxacdfP7OAPmAw-1; Tue, 02 Jan 2024 07:22:15 -0500
X-MC-Unique: n_CaR_oXPxacdfP7OAPmAw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-336937b3cf5so5917188f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jan 2024 04:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704198134; x=1704802934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5aXs8fUOsfgSo7g4FENf0GEgJl7/TE420KVs2VRDTFk=;
 b=lqgX7RymoQIGMfVjOgSTptd9ey+ooDW1RAHT+vOlN33Yjvar0OJCokdxSkmF4ljMtr
 thxQgZsc3prWeKThIqZCXSLwbkrTX+/GK8Q4WKYvVhVOlZsTXCVwFTZmaHh8bIiK0KbI
 bpPQcbrO6gdqj7sBm1s94fYaN/9kffnDDIbNL5pQRAs1piJDZcAxziivnUQwITpehpfe
 Hxnkg9T2WAU9eVwspIUaXMUDEipbIJsv25RsOrCFwEHgpIw2AhYuSaEh7Kxz5QKVKvfl
 5U8AdSSe39SH4a/b8IIV0qEicGLbXrWLPWCUQs1bwHAtfXPCiTXELGkZxfVXCo9Y3Ytn
 jqbg==
X-Gm-Message-State: AOJu0YxhKFn04mTzw+JJ3X9X+2VdBSNy2L7n26d/FeyCPxK13uSJpqCa
 KIlqL5ssoE6RCsIpZ1RpI5VvxZwT4/S4aBotcOqSiNTkVkjY3z8tnOdPv0tYzKH6leYBSyA7I23
 K0drGTBtedUNAdKdaEQIfXOg9ubwkpYqwGcgu
X-Received: by 2002:adf:f58d:0:b0:336:ded0:a21e with SMTP id
 f13-20020adff58d000000b00336ded0a21emr3259640wro.21.1704198134173; 
 Tue, 02 Jan 2024 04:22:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRzyq3ECGhE9uzQkndDD77jnVmiC48z9vPhud+jf0jfsJN08yinyqi/3Ri/Y5bqogVnlgMHA==
X-Received: by 2002:adf:f58d:0:b0:336:ded0:a21e with SMTP id
 f13-20020adff58d000000b00336ded0a21emr3259636wro.21.1704198133875; 
 Tue, 02 Jan 2024 04:22:13 -0800 (PST)
Received: from localhost (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90]) by smtp.gmail.com with ESMTPSA id
 q5-20020a056000136500b003372c080acasm9421283wrz.2.2024.01.02.04.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 04:22:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: Move drm_set_preferred_mode() helper from drm_edid to
 drm_modes
Date: Tue,  2 Jan 2024 13:21:58 +0100
Message-ID: <20240102122208.3103597-1-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The helper is generic, it doesn't use the opaque EDID type struct drm_edid
and is also used by drivers that only support non-probeable displays such
as fixed panels.

These drivers add a list of modes using drm_mode_probed_add() and then set
a preferred mode using the drm_set_preferred_mode() helper.

It seems more logical to have the helper definition in drm_modes.o instead
of drm_edid.o, since the former contains modes helper while the latter has
helpers to manage the EDID information.

Since both drm_edid.o and drm_modes.o object files are built-in the drm.o
object, there are no functional changes. But besides being a more logical
place for this helper, it could also allow to eventually make drm_edid.o
optional and not included in drm.o if only fixed panels must be supported
in a given system.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---

Changes in v2:
- Drop unnecessary drm_modes.h header include in drm_edid.c (Jani Nikula).
- Add Jani Nikula's Reviewed-by tag.

 drivers/gpu/drm/drm_edid.c  | 22 ----------------------
 drivers/gpu/drm/drm_modes.c | 22 ++++++++++++++++++++++
 include/drm/drm_edid.h      |  2 --
 include/drm/drm_modes.h     |  2 ++
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index cb4031d5dcbb..e677dc8eb7a9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6989,28 +6989,6 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_add_modes_noedid);
 
-/**
- * drm_set_preferred_mode - Sets the preferred mode of a connector
- * @connector: connector whose mode list should be processed
- * @hpref: horizontal resolution of preferred mode
- * @vpref: vertical resolution of preferred mode
- *
- * Marks a mode as preferred if it matches the resolution specified by @hpref
- * and @vpref.
- */
-void drm_set_preferred_mode(struct drm_connector *connector,
-			   int hpref, int vpref)
-{
-	struct drm_display_mode *mode;
-
-	list_for_each_entry(mode, &connector->probed_modes, head) {
-		if (mode->hdisplay == hpref &&
-		    mode->vdisplay == vpref)
-			mode->type |= DRM_MODE_TYPE_PREFERRED;
-	}
-}
-EXPORT_SYMBOL(drm_set_preferred_mode);
-
 static bool is_hdmi2_sink(const struct drm_connector *connector)
 {
 	/*
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..01aa44e87534 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2754,3 +2754,25 @@ bool drm_mode_is_420(const struct drm_display_info *display,
 		drm_mode_is_420_also(display, mode);
 }
 EXPORT_SYMBOL(drm_mode_is_420);
+
+/**
+ * drm_set_preferred_mode - Sets the preferred mode of a connector
+ * @connector: connector whose mode list should be processed
+ * @hpref: horizontal resolution of preferred mode
+ * @vpref: vertical resolution of preferred mode
+ *
+ * Marks a mode as preferred if it matches the resolution specified by @hpref
+ * and @vpref.
+ */
+void drm_set_preferred_mode(struct drm_connector *connector,
+			   int hpref, int vpref)
+{
+	struct drm_display_mode *mode;
+
+	list_for_each_entry(mode, &connector->probed_modes, head) {
+		if (mode->hdisplay == hpref &&
+		    mode->vdisplay == vpref)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+	}
+}
+EXPORT_SYMBOL(drm_set_preferred_mode);
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 54cc6f04a708..5bd6b6eb6c57 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -426,8 +426,6 @@ enum hdmi_quantization_range
 drm_default_rgb_quant_range(const struct drm_display_mode *mode);
 int drm_add_modes_noedid(struct drm_connector *connector,
 			 int hdisplay, int vdisplay);
-void drm_set_preferred_mode(struct drm_connector *connector,
-			    int hpref, int vpref);
 
 int drm_edid_header_is_valid(const void *edid);
 bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index c613f0abe9dc..b9bb92e4b029 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -467,6 +467,8 @@ bool drm_mode_is_420_also(const struct drm_display_info *display,
 			  const struct drm_display_mode *mode);
 bool drm_mode_is_420(const struct drm_display_info *display,
 		     const struct drm_display_mode *mode);
+void drm_set_preferred_mode(struct drm_connector *connector,
+			    int hpref, int vpref);
 
 struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,
 					    enum drm_connector_tv_mode mode,
-- 
2.43.0

