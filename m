Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MegHOtEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434DDDEFD
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220AA10E743;
	Tue,  3 Feb 2026 18:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lQf0ywnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A386710E750
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:39 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-b88610494b8so59617166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770144998; x=1770749798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yKg3D/9dFo9DlQ2bs5wqdmVuHtjRMfS9ivthm1FMvY=;
 b=lQf0ywnSTJELb18L6fa98Zf+4hxUCQLNA2Wm8b8tsG+YPntwWbqv7Uqo5rGAfKDbkJ
 6jQCEwY4Otx+q0r+MB6KR47YjcqfnIRrce5VsFYXnUjy1EzlNC/A7qf59t++TuvbD9/V
 dML6zknQImImGx2vUKjqlQ/PDik7vvYs6iggK7i1D6uNTIResFVtN9Xr7bx/InZ4b2lU
 uTjCe6OC10XsP8f1l7BwBFxit01EzUvPOrG9ZSnDvKQXhedlt7xMC/d5qyT29UqrakYh
 xC1R8i31m5NqY0uKChI2/piRkBzXpxbOQtyDmz5+r+TqoSoaCrZvjMO3kruxbswyVjpT
 kIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770144998; x=1770749798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5yKg3D/9dFo9DlQ2bs5wqdmVuHtjRMfS9ivthm1FMvY=;
 b=h6OrvcLmMRcDPQkJZbrAYe1T2DYA5cfFVwMR5gAJUYh1Qr5fG/2ZMpr2RV764tHcY+
 kcB1Yr4mmmJtxltqONmdk1Ym7EglzsQJKVbULf2NUvomb8h2ENjp5MZfuO7gBJiwPozL
 3Mk+8tB2ysASxHm5H/UJTotqvWQay2+l0VcxQMFZd86nG/kmoCl5nVM0JDiQ6jwdd/0W
 0615Ozh2ObfkceJh0SbFa/GaVBd3eNxXJUJgZeGYspI8ANIbZ2gVU4R4ndj7rrYgbMPy
 /XFkd5nTQyKovcMR01riEaKC84vAqftfHqL4G/1Wj/oxjd9e5L/PgPagouvMLbvzozVN
 U9QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdDrPATOjR4N0UBF2WOMQgW0oIGj0I/gvS4mgPd41zlWSfccMXmZSCBqQyAdLQzyrLUgGSxmSRWHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVmjJWciCcwgCTnHJfgScq8oxbn798O3ibNcOVs08+NVj+861c
 NnYy6Mvm0qMqShAbleKebW9kkO2Qc2l5c6RTjkAGbt4gp2cLwS4AapRo
X-Gm-Gg: AZuq6aK66DqYhx9KcT5KTux6wQaHJGRjhx2yaXOL+58S0GR6q34u/2k4nuW7so1cAo4
 VOhgXp2kutEmt31YSDgDMjfe6xB0KhsBwQAc4h7k7ttsGlvq95+CrbecXiudMY/L2cdfsbsgBq+
 Wnc7XHr2J7Yk+Dow1pdbQ8O00RKopJi/OJDFwnJ3TjtA58L0tICSqyIuI5XVnmWFeosSw21ycvs
 B4W2Q7g90bT7i5tg3gbgU2gbZWnu8W3Psw4Lz4MJAVtXtZpJpg15NgkoKTtLwh4OMYFn5ty7OnN
 AwD5m4MI2aAxiplDOvyVMHWnRyoJScQ5p/svPxvJzTegcV+uoD/xDZX45LeMcsLAZDJ8RiFkISl
 McQy4ATj/HmKEYfuE2A/mgfvD/YPuzGIDgyhqncEqy0Jc0M+zS0XX+q85UI0zaTv9LbZc7P9SMl
 yWMF+lWQxoNtkBR4jhz8cmu0LKFLuQRuEdiyeZtr01FvAI/Mq/pVYVNk+JaC1yOZ1x
X-Received: by 2002:a17:906:99c5:b0:b8e:92e:d2ef with SMTP id
 a640c23a62f3a-b8e9f3f70famr17566866b.5.1770144997814; 
 Tue, 03 Feb 2026 10:56:37 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:37 -0800 (PST)
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
Subject: [PATCH v3 06/19] drm/amd/display: Add PCON VRR ID check override
Date: Tue,  3 Feb 2026 19:56:13 +0100
Message-ID: <20260203185626.55428-7-tomasz.pakula.oficjalny@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1434DDDEFD
X-Rspamd-Action: no action

[Why]
It's currently very hard to test if a random PCON supports VRR and
report it's ID.

[How]
Adds override as part of dc debug mask. Allows faster testing and
reporting of VRR-compatible DP->HDMI adapters.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 6 +++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 8 +++++++-
 drivers/gpu/drm/amd/display/dc/dc.h                       | 1 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h               | 2 +-
 drivers/gpu/drm/amd/include/amd_shared.h                  | 6 ++++++
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9346b62d981b..306c29ff38f0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2062,6 +2062,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	if (amdgpu_dc_debug_mask & DC_SKIP_DETECTION_LT)
 		adev->dm.dc->debug.skip_detection_link_training = true;
 
+	if (amdgpu_dc_debug_mask & DC_OVERRIDE_PCON_VRR_ID_CHECK)
+		adev->dm.dc->debug.override_pcon_vrr_id_check = true;
+
 	adev->dm.dc->debug.visual_confirm = amdgpu_dc_visual_confirm;
 
 	/* TODO: Remove after DP2 receiver gets proper support of Cable ID feature */
@@ -13314,7 +13317,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (amdgpu_dm_connector->dc_link) {
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
 		is_pcon = dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER;
-		pcon_allowed = dm_helpers_is_vrr_pcon_allowed(amdgpu_dm_connector->dc_link);
+		pcon_allowed = dm_helpers_is_vrr_pcon_allowed(
+			amdgpu_dm_connector->dc_link, connector->dev);
 	}
 
 	/* Some eDP panels only have the refresh rate range info in DisplayID */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 45a91df619d9..cb8a2855ac10 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1381,7 +1381,7 @@ void dm_helpers_dp_mst_update_branch_bandwidth(
 	// TODO
 }
 
-bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link)
+bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link, const struct drm_device *dev)
 {
 	if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_DP_HDMI_CONVERTER)
 		return false;
@@ -1399,6 +1399,12 @@ bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link)
 		return true;
 	}
 
+	if (link->dc->debug.override_pcon_vrr_id_check) {
+		drm_info(dev, "Overriding VRR PCON check for ID: 0x%06x\n",
+			 link->dpcd_caps.branch_dev_id);
+		return true;
+	}
+
 	return false;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index ab19b6230945..7b22575ff638 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1057,6 +1057,7 @@ struct dc_debug_options {
 	bool scl_reset_length10;
 	bool hdmi20_disable;
 	bool skip_detection_link_training;
+	bool override_pcon_vrr_id_check;
 	uint32_t edid_read_retry_times;
 	unsigned int force_odm_combine; //bit vector based on otg inst
 	unsigned int seamless_boot_odm_combine;
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index e51f1e489129..5e77deb09200 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -223,7 +223,7 @@ int dm_helpers_dmub_set_config_sync(struct dc_context *ctx,
 
 enum dc_edid_status dm_helpers_get_sbios_edid(struct dc_link *link, struct dc_edid *edid);
 
-bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link);
+bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link, const struct drm_device *dev);
 bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream);
 bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream);
 
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index ac2d3701e2bd..894e1e738ce0 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -412,6 +412,12 @@ enum DC_DEBUG_MASK {
 	 * @DC_SKIP_DETECTION_LT: (0x200000) If set, skip detection link training
 	 */
 	DC_SKIP_DETECTION_LT = 0x200000,
+
+	/**
+	 * @DC_OVERRIDE_PCON_VRR_ID_CHECK: (0x400000) If set, always return true if checking for
+	 * PCON VRR compatibility and print it's ID in kernel log.
+	 */
+	DC_OVERRIDE_PCON_VRR_ID_CHECK = 0x400000,
 };
 
 enum amd_dpm_forced_level;
-- 
2.52.0

