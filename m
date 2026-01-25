Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBgWBHZjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AA981BDD
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5211A10E37B;
	Sun, 25 Jan 2026 18:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Up4456Vq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D862510E371
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:43 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-64ce9d80429so603988a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366382; x=1769971182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzpJ4RJ7cNME7CVFy7TynUsF3JEY3Q9X0Du26C0ArzQ=;
 b=Up4456Vq/+Fvb2dYeEnivJYQIFTCxZhVPSlgMkcxH5ed3g1aVk9lFBZ5Q+1U/+8A4v
 Vaha3iUUn/4qI8H4YURBAn71kyuCt2Vlu4NGJipt0CwA6SdFLucD6fx9epmsZIjFeDuO
 JzmXcJ1Ucv0dXLWhk/csXJTiBNgGYnKPKchQUPfYPtuGsIEEuWC+fVyi5gRZmN2+1cnw
 sKvOcJmkYAH+2w+KzoaNKqf0pY/lxGgG+7FeDUwYXj04++NAL14uSKuZg3NS1iOntyoJ
 YAV6O0+Y7xq3p0Jp1zrjCfAfe6uDX3QxGysleSYdBYCh8MNUSlDS6/nESLgaMgjvdo+x
 JZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366382; x=1769971182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pzpJ4RJ7cNME7CVFy7TynUsF3JEY3Q9X0Du26C0ArzQ=;
 b=ZdtrcIgAj03Y6+5R9IFxJBA2OSlK9rglM6oG1jxUPx01UkXb0QzQ8mY47FapCf56vX
 nvLunQi/MbScG4mrP5D6N+La59OCDphECJ7w5O5GWkZbJmJu6cM/TZoWo5lvWz/WFEn1
 nT4MlJPJZST7NC5IjNL3tsO32Luq4Mmg/1lPEBrobnkxF8K/0L5NEZovdAAMTlZpWYOH
 YElll9Cq3x5bbRICDnip7ZWAwdthbijjBMB2W1BqohimV0FXLTZCnCFRlqS0HJ0QAH8+
 lkbUKwpiVPXB8fbHm1JA8iX6DfkIc11KJRgkvWOrhI7aPgkgXTfkw01KJsRzM8x8Vc3G
 8eNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNmJIGyK5v3vCKQ8B2EZbzteQyzXjX5CKGHqSxM9oLFzfUWPvtTysc/Br8OEtBeOb2heUYL841kj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRezUApgzMW/P/yivFoet3gaADUTs7OF9eQguWIGvidBpdDokl
 i2ysEiGopkE6dJEC7GrOHwG6q7dUyzWNH9n2gTIKdyl8jRC8JFmkaY2Y
X-Gm-Gg: AZuq6aJBrn1Oh2K3yzlum4o/g9Wi/uuP4An6QwMU0IMyuAEB9TzLKz61KAvuT7HdpAp
 hq/LT8h1aY2RESRvoiQdcPeLBei0SdwOfTJP3BhS8NUDLpmCd//pi2II4g/GbEhlIruUZNV1lg3
 UcI5ZsfbKTTarLfcOXe7r9E+WWJF+1y1Ks8Xi4XELpTFz5yO1+g44ahXn1J5puYMRotShSPZJKx
 E7HA7A7ENXZjAFkKNg+lbtvItcxr8tpSwND2gOxbQutrZAdZdsbZrZJVnjAk8qpaFTuuBvyiz7L
 XGsIwg209HQ5v9DrbvEHXw02jtPAYwHdH+FDOm/KjIMdx91Hgm0q0v9zcVkoUjXwQt/lQ8yGWn3
 qmfHC83a5PGAzVxFmdfsWhb//TiAuASKptLZFvbuk1MeGW3osm1B3SrHnyBcoo7rrg/cIJxpnQs
 VertfkExFMe99o41idlsg9ObNdCvkM/X1n4sxqiR587ccA/d6XAeyjtlBM696HBGIL
X-Received: by 2002:a17:906:c104:b0:b87:3087:54f0 with SMTP id
 a640c23a62f3a-b8d3fa9d567mr110207266b.3.1769366382183; 
 Sun, 25 Jan 2026 10:39:42 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:41 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 19/19] drm/amd/display: Add HDMI VRR desktop mode
Date: Sun, 25 Jan 2026 19:39:14 +0100
Message-ID: <20260125183914.459228-20-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B1AA981BDD
X-Rspamd-Action: no action

[Why]
Many TVs and other HDMI sinks suffer from blanking and possibly other
glitches when VRR is toggled. With FreeSync present on such sinks, they
behave like the signal is always variable, even in fixed refresh rate
situations.

[How]
Keep HDMI VRR toggled if it's supported and not explicitly disabled.
Additionnally, add module parameter which allows users to configure HDMI
VRR triggering to only happen when the signal is truly asking for
variable state. This is useful if end user has a TV that automatically
toggles ALLM/Game mode when VRR is active and such user doesn't want
gaming mode in normal desktop usage.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                 |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c             | 13 +++++++++++++
 .../amd/display/modules/info_packet/info_packet.c   | 10 ++++++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index c9eab44ad5b3..dddd8ed361a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -269,6 +269,7 @@ extern int amdgpu_rebar;
 extern int amdgpu_wbrf;
 extern int amdgpu_user_queue;
 extern int amdgpu_allm_mode;
+extern bool amdgpu_hdmi_vrr_desktop_mode;
 
 extern uint amdgpu_hdmi_hpd_debounce_delay_ms;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3bdbb46e4d69..f4551450bf31 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -249,6 +249,7 @@ int amdgpu_rebar = -1; /* auto */
 int amdgpu_user_queue = -1;
 uint amdgpu_hdmi_hpd_debounce_delay_ms;
 int amdgpu_allm_mode = 1;
+bool amdgpu_hdmi_vrr_desktop_mode = true;
 
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
@@ -1146,6 +1147,18 @@ module_param_named(hdmi_hpd_debounce_delay_ms, amdgpu_hdmi_hpd_debounce_delay_ms
 MODULE_PARM_DESC(allm_mode, "Changes ALLM trigger mode (0 = disable, 1 = enable (default), 2 = force enable)");
 module_param_named(allm_mode, amdgpu_allm_mode, int, 0644);
 
+/**
+ * DOC: hdmi_vrr_on_dekstop (bool)
+ * Enables FreeSync behavior mimicking by keeping HDMI VRR signalling active in
+ * fixed refresh rate conditions like normal desktop work/web browsing.
+ * Possible values:
+ *
+ * -  false = HDMI VRR is only enabled if refresh rate is truly variable
+ * -  true  = Mimics FreeSync behavior and keeps HDMI VRR always active
+ */
+MODULE_PARM_DESC(hdmi_vrr_desktop_mode, "Changes HDMI VRR desktop mode (false = disable, true = enable (default))");
+module_param_named(hdmi_vrr_desktop_mode, amdgpu_hdmi_vrr_desktop_mode, bool, 0644);
+
 /* These devices are not supported by amdgpu.
  * They are supported by the mach64, r128, radeon drivers
  */
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 38056b2d37b2..c61bbf912a8b 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -651,8 +651,14 @@ static void build_vtem_infopacket_data(const struct dc_stream_state *stream,
 	bool rb = false;
 
 	hdmi_vic_mode = is_hdmi_vic_mode(stream);
-	vrr_active = vrr->state == VRR_STATE_ACTIVE_VARIABLE ||
-		     vrr->state == VRR_STATE_ACTIVE_FIXED;
+
+	if (amdgpu_hdmi_vrr_desktop_mode) {
+		vrr_active = vrr->state != VRR_STATE_UNSUPPORTED &&
+			     vrr->state != VRR_STATE_DISABLED;
+	} else {
+		vrr_active = vrr->state == VRR_STATE_ACTIVE_VARIABLE ||
+			     vrr->state == VRR_STATE_ACTIVE_FIXED;
+	}
 
 	infopacket->sb[VTEM_MD0] = VTEM_M_CONST << VTEM_M_CONST_BIT;
 	infopacket->sb[VTEM_MD0] |= VTEM_FVA_FACTOR << VTEM_FVA_BIT;
-- 
2.52.0

