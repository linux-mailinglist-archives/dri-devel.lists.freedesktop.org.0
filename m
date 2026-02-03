Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBJKFQBFgmmERgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:57:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5354DDF82
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA4C10E75F;
	Tue,  3 Feb 2026 18:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nVus1ujs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D4D10E768
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:58 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b86ff9ff9feso66076166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770145017; x=1770749817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gojVvtD4l2rkbiM/jdY+q69y3Uync3kYZ3kcuaObgo=;
 b=nVus1ujsjDMJ1w9929jQR6cbCdfFcaV4t9oXhxSSCrtEWn2Z8l/HnOR9EnZuyaGvYa
 GbqE4XQvcsg3qf6j40dPHbBXEzdRh+qYBmg5IgOldMiBTf96DWg5oTnE/cG78EMstNTN
 7DwkTOlTyj4/PedtrmHmp/p2l8HboawXEP9riFGi/VKlLEbzdGVnO0iVBJG6Q8Fg1ytc
 E7oe/O7Af1BhXI176PMt4UawX5TR2ItzoleIejcRH1kJM9ZLf7s6Dv8VXW507WHrgabw
 2HxzWB+P67d1XiWgBypjTEreSjHopAUuH8QChohVUnbApLMscqd25YZdqTswwOkgdEXu
 h8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770145017; x=1770749817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2gojVvtD4l2rkbiM/jdY+q69y3Uync3kYZ3kcuaObgo=;
 b=QJC+8/QZ7+hOMEXmJMEdBLP/3b/jZcH7VYmzQUUyLgikRQhLpvwUWxLTeeZg+GDYuS
 jdshWUvftzv6/iFGcy7JSJNlpKwNRmEZ/6yFbwdm3Pym0MmQTmeMamyXETo0zw/ss3ZX
 X88NvCiCLYNW/mCMmk47rcy2xrCFCDJQN3ViioVr6xfdqaUEQOg2MmWW+YD/hosa6dxs
 xo3C21x35sCRoT1UGw1icmimAS41SK6wcvE4vGRzlE1Q61tZhB2JTU8/xXeZexIh2tuH
 SH+vfi1CdJGz6H6CZ0ZtppPFb4dZ64EixQ9t1xtfQos/4J3VrHMsfHxPcIg+elhmb84m
 6egA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHQOw3MsSzgiKZ5PoFIDmQRBWVzr8Bc+MXpL6qlWrhzMWkSoK4mOv03btDowQhTupqekqvCU36e38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLXY7/BfR06qHu3Bmz6HE4otLEzjJguJLWS0WW2xFd6sqgIj0h
 92L14Ysrrmy+e40fpwyI1HDKXnYrof4PjNYz77UFYmhp5LI62PbpXzgk
X-Gm-Gg: AZuq6aLUmD1ErNtR3SYM22uFAScVnOmtnyyfV9YzCPBFQs+ARuWzIOJpZYGPJENAD5s
 MqYLxpsqca3czEdgxLH2hCpfyTr+aAgO+ocAdrSH88YDkul2R0pghKiyNYiBh0V6xmLV5bmid2d
 2oak02Ex5D7iJ7YIwyIZHEQ729wxC9h19QqhONZelcgX0xnhoHz/kPaPOQlUJM+WQsgrml+N23F
 SIgaWbO+szCO1V34FGuDBZU3j+9Yi3edhW2JxXW3OuLTeQ+rGGHGsN1dPJxLNh5TjEQzZVZGzcm
 gcRh1XCE2ijrxk/gsEUQ8hAqDe1suXWNmAbETfgot/ySorNw4U/YOL8HT/k2AbwnXUoft/p5iqg
 t7E2wfx+M7+a+SQPyUUCbFR10kIaZ3pnfi3CxF5XsTzgjNhHtdH1vMOWOFbRjQakl9AX49dkgXo
 7+ogj7+W1Yr6D/W9Q4Aud8eYcPL+GAPfeX+zk70l1x+296aIZyILiV10XT4CPXuTXA
X-Received: by 2002:a17:907:1ca4:b0:b7f:fd9d:fff4 with SMTP id
 a640c23a62f3a-b8e9f173f18mr20497466b.1.1770145016990; 
 Tue, 03 Feb 2026 10:56:56 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:56 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Subject: [PATCH v3 19/19] drm/amd/display: Add HDMI VRR desktop mode
Date: Tue,  3 Feb 2026 19:56:26 +0100
Message-ID: <20260203185626.55428-20-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E5354DDF82
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
 .../amd/display/modules/info_packet/info_packet.c   |  9 +++++++--
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 312aa32064d5..d49cd55e0f35 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -269,6 +269,7 @@ extern int amdgpu_rebar;
 extern int amdgpu_wbrf;
 extern int amdgpu_user_queue;
 extern uint amdgpu_allm_mode;
+extern bool amdgpu_hdmi_vrr_desktop_mode;
 
 extern uint amdgpu_hdmi_hpd_debounce_delay_ms;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4b038c8bbf9f..f53c2ffeffa2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -249,6 +249,7 @@ int amdgpu_rebar = -1; /* auto */
 int amdgpu_user_queue = -1;
 uint amdgpu_hdmi_hpd_debounce_delay_ms;
 uint amdgpu_allm_mode = 1;
+bool amdgpu_hdmi_vrr_desktop_mode = true;
 
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
@@ -1146,6 +1147,18 @@ module_param_named(hdmi_hpd_debounce_delay_ms, amdgpu_hdmi_hpd_debounce_delay_ms
 MODULE_PARM_DESC(allm_mode, "Changes ALLM trigger mode (0 = disable, 1 = enable (default), 2 = force enable)");
 module_param_named(allm_mode, amdgpu_allm_mode, uint, 0644);
 
+/**
+ * DOC: hdmi_vrr_on_dekstop (bool)
+ * Enables FreeSync behavior mimicking by keeping HDMI VRR signalling active in
+ * fixed refresh rate conditions like normal desktop work/web browsing.
+ * Possible values:
+ *
+ * - false = HDMI VRR is only enabled if refresh rate is truly variable
+ * - true  = Mimics FreeSync behavior and keeps HDMI VRR always active
+ */
+MODULE_PARM_DESC(hdmi_vrr_desktop_mode, "Changes HDMI VRR desktop mode (false = disable, true = enable (default))");
+module_param_named(hdmi_vrr_desktop_mode, amdgpu_hdmi_vrr_desktop_mode, bool, 0644);
+
 /* These devices are not supported by amdgpu.
  * They are supported by the mach64, r128, radeon drivers
  */
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 5fd9e8aadc98..b41e2240e1ae 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -654,8 +654,13 @@ static void build_vtem_infopacket_data(const struct dc_stream_state *stream,
 	bool vrr_active = false;
 	bool rb = false;
 
-	vrr_active = vrr->state == VRR_STATE_ACTIVE_VARIABLE ||
-		     vrr->state == VRR_STATE_ACTIVE_FIXED;
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

