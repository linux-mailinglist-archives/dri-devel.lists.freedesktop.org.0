Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEuNOPFEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A4DDF21
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8621410E75B;
	Tue,  3 Feb 2026 18:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Slg/3qXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FA710E75A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:45 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-658cc3fded3so907842a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770145004; x=1770749804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMyppU45ocduU72R81pb5sGVjFLNkBj7pAzByccoIn4=;
 b=Slg/3qXUyrK2BChhj11kY6BHYsi/utDfYCe62vwgFi8vuEt+bZTbt9oF9+3Z8ohbw0
 P0Rngzp7jvKRzjEZXHw4rwNNyj+hu0/4Rb1JbyKe/tuI2FOUq6k9lXyNhVLqv8TQeTam
 xOY2fsB8gALPvHblTlxb8jHljnEET2b+u54DTS7t+0hBM90g0iwV0N6RN+gF6gcudNC1
 ca6q6fqmh5DVKoGzONDQXNkqCZ+v1+s9cSyLJO9KWrBxoGZIMwb9xHp2SSh83YsNpqz6
 64Pv/jl+uMVmJPEBgLyzmnkxyiMI/RgyZY/9eQ9g2U9cQekLgw5422rY/FUw3nvXb90s
 g+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770145004; x=1770749804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZMyppU45ocduU72R81pb5sGVjFLNkBj7pAzByccoIn4=;
 b=g3Iruz5lMjSWWEeIkqu3t30JHT6KkARrwP0KvFmOgk3b41XQFwHN1QQQC/KJXDpniL
 5f+lMZUp75wvY1V8uh4ObTHA/dI1XaBJyseyAndvtYHF5TDx3rW6l897r961FxHGZ9mG
 aqirKTcO2/WB9XpCI5cPvhdn98vQ1gzQq467kSksOgreYb9VQp+B2qGPMAH3weI0NbKM
 I4v0AUh3IenTGyV6OP8zUqp9VtvpXbEIl+5Rn12C5mgft5AtuII4VA8SLpImDr+QmBW+
 8MpoKrUhRM28yuA7NI9fSj1xx/rs6qppy+GSK2YZqOYEpKWc0wf1LyugCtUwUQwmke6u
 N4yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe/1Zj6MC6GNdK8gpxHxaekQqz9D8Hc31v0mkKQKZveHAPNMsOdijpAJNAKG1HlYowhCeLpBaTAf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkorRSr2yWjNWm2VkQuIdyj+MT+e5cg/eApaIWkolIOPxElgTV
 mVEgyvRWjZaXddfjrLEGc+DND+gPztYSuK4wi1KwoOW5U3u3F0KheUaE
X-Gm-Gg: AZuq6aIP4Wov4ahF8vudoiKXVSuIgONJosQANRZyKUHBel5qKoaSSGwZub4wgr+UvR4
 h2aJR7utaX0LAu4eiL68xO7vuMqnhrf3QmktS0koI2S/CkXkAgtBmMiH59WquD0TsnL8FKA4ywf
 OzOVtBvn2FkNA+L3aicVcNX04aIwkXDonZ3sBHHUKb6pYpOAcf3HAOR11q4/CcjGI+xeGl8oTcl
 3ttxmBwhRCLOxH10X8GNxtd4qbzl12EQ5Pt2ESM+igApwgPzgbkIyTMM3GP0c5DqPaNh7FR6tpp
 expLK6exL82dZowYMnYgDxJ/guFNFA+0vuOKYolcSs9UQcv2oIJ4GSlfQ5kLu+Db7+dsuz3Q9FU
 RdlWuchbwLhGibi9Mja46soG799g4yFG1szCsG9mxaQghDQq3oxL8Fo9C7CkFUN5aVAVg6ztqUw
 0e9QcEg52iyIQHetTiZEwTEaY+e8VgODoQEWCdSaTTm8HHfSoTgHuhggnl51FMN4+p
X-Received: by 2002:a17:907:d78b:b0:b8d:e858:dee5 with SMTP id
 a640c23a62f3a-b8e9f2b2cfbmr22346466b.5.1770145003959; 
 Tue, 03 Feb 2026 10:56:43 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:43 -0800 (PST)
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
Subject: [PATCH v3 10/19] drm/amd/display: Enable HDMI VRR over PCON
Date: Tue,  3 Feb 2026 19:56:17 +0100
Message-ID: <20260203185626.55428-11-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 7D0A4DDF21
X-Rspamd-Action: no action

[Why]
Not all TVs support FreeSync and many TVs suffer from VRR flickering
while Freesync is activated.

[How]
This works the same as FreeSync over PCON just without sending FreeSync
info packets (we're sending standard DisplayPort info packets) + reading
the VRR range from the HDMI Forum vendor specific data block. PCONs take
over HDMI VRR triggering.

Prefer HDMI VRR over FreeSync to reduce VRR flickering on many TVs.
FreeSync over HDMI seems to be a fallback solution and not a first-class
citizen. This especially helps VMM7100.

Tested with VMM7100 and CH7218 based adapters on multiple HDMI 2.1 and
HDMI 2.0 devices. (Samsung S95B, LG C4, Sony Bravia 8, Dell AW3423DWF)

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4805

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 92e571e687e9..6fb23d59fcc9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13231,6 +13231,17 @@ static void monitor_range_from_vsdb(struct drm_display_info *display,
 	display->monitor_range.max_vfreq = vsdb->max_refresh_rate_hz;
 }
 
+/**
+ * Get VRR range from HDMI VRR info in EDID.
+ *
+ * @conn: drm_connector with HDMI VRR info
+ */
+static void monitor_range_from_hdmi(struct drm_display_info *display)
+{
+	display->monitor_range.min_vfreq = display->hdmi.vrr_cap.vrr_min;
+	display->monitor_range.max_vfreq = display->hdmi.vrr_cap.vrr_max;
+}
+
 /*
  * Returns true if connector is capable of freesync
  * Optionally, can fetch the range from AMD vsdb
@@ -13279,6 +13290,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
 	struct amdgpu_hdmi_vsdb_info vsdb_did = {0};
+	struct drm_hdmi_vrr_cap hdmi_vrr = {0};
 	struct dpcd_caps dpcd_caps = {0};
 	const struct edid *edid;
 	bool freesync_capable = false;
@@ -13314,6 +13326,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	/* Gather all data */
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
+	hdmi_vrr = connector->display_info.hdmi.vrr_cap;
 
 	if (amdgpu_dm_connector->dc_link) {
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
@@ -13359,12 +13372,17 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 
 	/* DP -> HDMI PCON */
-	} else if (pcon_allowed && vsdb_info.freesync_supported) {
-		amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_PCON_ALLOWED;
-		amdgpu_dm_connector->pack_sdp_v1_3 = true;
-		amdgpu_dm_connector->vsdb_info = vsdb_info;
+	} else if (pcon_allowed) {
+		/* Prefer HDMI VRR */
+		if (hdmi_vrr.supported && hdmi_vrr.vrr_max > 0)
+			monitor_range_from_hdmi(&connector->display_info);
+		else if (vsdb_info.freesync_supported) {
+			amdgpu_dm_connector->vsdb_info = vsdb_info;
+			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+		}
 
-		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+		amdgpu_dm_connector->pack_sdp_v1_3 = true;
+		amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_PCON_ALLOWED;
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
-- 
2.52.0

