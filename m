Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PkCLuZEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BFDDED8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131BD10E741;
	Tue,  3 Feb 2026 18:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LM2VQWbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8358210E743
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:33 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b8dd0168b90so64196666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770144992; x=1770749792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2t7zmxZ0V/ra2TNj4y1ls2+nk6Mu20D0VPdmpFC7/A=;
 b=LM2VQWbDeiCsXXMtF7jRb6l+5HfMg6uDJrdAQGdgeOkqsAJ0j1hBMafHEPlGYqopXJ
 sT3Maud5I13OjdG1BmPQuetE/s4jsyTbsUT2FgIrpocUEuqQmvl6GJyBC7IMwIlVgykc
 FkItMubvTXeEp6CCgqx+u8hlwyVZx44YyNmL2DaDBnsSwp95GXjcbcacX9jbgX7bGOsS
 +LsG/4QavCeZRvFLCX/ISYAIcQhVaIqhLsyWGs74Glc8/Rbv1eVb4fj0Akfzi/IQGYFa
 lMWhqeJzs/YI7upQotHf85U3k3nzvBaqQ9X1mUSvIiTWeOxOE1UzcJsTcv5FTOqQyQD7
 hQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770144992; x=1770749792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p2t7zmxZ0V/ra2TNj4y1ls2+nk6Mu20D0VPdmpFC7/A=;
 b=wF/0rwp1NKDLrzOlT/y/xP9Xju0CHGkbdKGB/wTMCyvPbKTZqm4k3xif1Md7qJuF0k
 O2mXT6QBS4ErjBo0XijaGMVpZ72H4Wy8eqaV+hQbOX55dfeRNywZHIlM9T5vNmgu+8sf
 j9RD0aBBpJfq5S9fNlCJsW7rb4qDQPtsIExw37oVIi9gLxqx/kFGJLbdmcqXmTUpwXBw
 VXe+tsy9CtJJYHJJXfwOACQURQSemuwZSawuAmO8rLlQ9vOGLNfso1wJgQyjenCDbsw3
 SY4jo5W5lD6RkLp7iDAIlwY1CEk5WESCCtVajVXP+SH8uKRBD+H3VpxTg5Anti2nJPcf
 snkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGUZ688b8XV9KYHEscnPcSnUm17o42Eai2zgsvzuvXP0R7u/P4jZ99C4avc+9fja00gwsUvR+f02o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBjCaZ/QGRf6XrQXUqUEYmmgxWmZgLBp3hdmCivxmfxzFL6ugZ
 CBhNeb9G5bvkBr4f9j0cOyUBsfWb0P4JdgCkfIpxjc3GWoR3dCgyDqb4
X-Gm-Gg: AZuq6aLyHPLQaiJ2bYFmD+SQPliUy769k22ChZtqcG9qG4Ze8hrW3wy104kXEJt5EsK
 NR8rZY6qI2Cvfcy8sCfuV1yvFQBx5uBtmZZXdWsIYXhKxWFzM6giHxY7nN+ynLCWT6utDUm6CiR
 Gg3aFBggvJRBIpMiytbPXZ90R9hGgaDdO443e/5R3Wx2mdptdYCqRmycj6P8h3FoBnInuNN4XRa
 PNwf7zw6DkKbrTgmosH4w8jEUaHRAvxsZTJQzivnmQr6tDadyIlAXfqtcwbFB+2FBjJZYizBENS
 FbhXcbiCIGNFcu9mgRLxqxrQiSuqMVz/q6aCTjv7Bvbk3RYsItNPZGa+izWw3cK/EENgWeKePCr
 DQ7ZLn4BvrByCDpI6pkybtmPItMuaFNdnkethaDGPUPFmCTMncUGPM8t8KVImP+YsxtP0W4KyRS
 tUpc9pEGP5SBBAeTsLGzbxFbyqdeiMkZO+FclhWMrwsUko8WDMboN5dC7x7SItvQCC
X-Received: by 2002:a17:906:9f85:b0:b87:2681:f608 with SMTP id
 a640c23a62f3a-b8e9f644b9bmr16634366b.8.1770144991764; 
 Tue, 03 Feb 2026 10:56:31 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:31 -0800 (PST)
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
Subject: [PATCH v3 02/19] drm/amd/display: Refactor
 amdgpu_dm_update_freesync_caps()
Date: Tue,  3 Feb 2026 19:56:09 +0100
Message-ID: <20260203185626.55428-3-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 5F5BFDDED8
X-Rspamd-Action: no action

[Why]
This function started to get very messy and hard to follow.

[How]
Eject some functionality to separate functions and simplify greatly.

Changes in v3:
- Less struct traversal in helper functions

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 123 +++++++++++-------
 1 file changed, 73 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 29e4a047b455..2c5877ed5f32 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13119,8 +13119,8 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
 	}
 }
 
-static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+static int parse_amd_vsdb_did(struct amdgpu_dm_connector *aconnector,
+			      const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -13172,13 +13172,13 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 	return false;
 }
 
-static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			       const struct edid *edid,
-			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
+static int parse_amd_vsdb_cea(struct amdgpu_dm_connector *aconnector,
+			      const struct edid *edid,
+			      struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
+	struct amdgpu_hdmi_vsdb_info vsdb_local = {0};
 	u8 *edid_ext = NULL;
 	int i;
-	bool valid_vsdb_found = false;
 
 	/*----- drm_find_cea_extension() -----*/
 	/* No EDID or EDID extensions */
@@ -13199,9 +13199,47 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 	if (edid_ext[0] != CEA_EXT)
 		return -ENODEV;
 
-	valid_vsdb_found = parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, vsdb_info);
+	if (!parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, &vsdb_local))
+		return -ENODEV;
 
-	return valid_vsdb_found ? i : -ENODEV;
+	*vsdb_info = vsdb_local;
+	return i;
+}
+
+static bool is_monitor_range_invalid(const struct drm_connector *conn)
+{
+	return conn->display_info.monitor_range.min_vfreq == 0 ||
+	       conn->display_info.monitor_range.max_vfreq == 0;
+}
+
+/*
+ * Returns true if (max_vfreq - min_vfreq) > 10
+ */
+static bool is_freesync_capable(const struct drm_monitor_range_info *range)
+{
+	return (range->max_vfreq - range->min_vfreq) > 10;
+}
+
+static void monitor_range_from_vsdb(struct drm_display_info *display,
+				    const struct amdgpu_hdmi_vsdb_info *vsdb)
+{
+	display->monitor_range.min_vfreq = vsdb->min_refresh_rate_hz;
+	display->monitor_range.max_vfreq = vsdb->max_refresh_rate_hz;
+}
+
+/*
+ * Returns true if connector is capable of freesync
+ * Optionally, can fetch the range from AMD vsdb
+ */
+static bool copy_range_to_amdgpu_connector(struct drm_connector *conn)
+{
+	struct amdgpu_dm_connector *aconn = to_amdgpu_dm_connector(conn);
+	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
+
+	aconn->min_vfreq = range->min_vfreq;
+	aconn->max_vfreq = range->max_vfreq;
+
+	return is_freesync_capable(range);
 }
 
 /**
@@ -13218,13 +13256,14 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 				    const struct drm_edid *drm_edid)
 {
-	int i = 0;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
 	struct dc_sink *sink;
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
+	struct amdgpu_hdmi_vsdb_info vsdb_did = {0};
+	struct dpcd_caps dpcd_caps = {0};
 	const struct edid *edid;
 	bool freesync_capable = false;
 	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
@@ -13256,62 +13295,46 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		goto update;
 
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
+	parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
+
+	if (amdgpu_dm_connector->dc_link)
+		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
 
 	/* Some eDP panels only have the refresh rate range info in DisplayID */
-	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
-	     connector->display_info.monitor_range.max_vfreq == 0))
+	if (is_monitor_range_invalid(connector))
 		parse_edid_displayid_vrr(connector, edid);
 
-	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
-		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
-		if (amdgpu_dm_connector->dc_link &&
-		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
-			amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
-			amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
-			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-				freesync_capable = true;
-		}
+	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
+	    sink->sink_signal == SIGNAL_TYPE_EDP) {
 
-		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+		if (dpcd_caps.allow_invalid_MSA_timing_param)
+			freesync_capable = copy_range_to_amdgpu_connector(connector);
 
-		if (vsdb_info.replay_mode) {
-			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
-			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
+		/* eDP */
+		if (edid)
+			parse_amd_vsdb_did(amdgpu_dm_connector, edid, &vsdb_did);
+
+		if (vsdb_did.replay_mode) {
+			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_did.replay_mode;
+			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_did.amd_vsdb_version;
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
-	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
-		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-		if (i >= 0 && vsdb_info.freesync_supported) {
-			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
-			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
-			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-				freesync_capable = true;
-
-			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
-			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
-		}
+	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_info.freesync_supported) {
+		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
 	if (amdgpu_dm_connector->dc_link)
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
-	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
-		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
+	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_info.freesync_supported) {
+		amdgpu_dm_connector->pack_sdp_v1_3 = true;
+		amdgpu_dm_connector->as_type = as_type;
+		amdgpu_dm_connector->vsdb_info = vsdb_info;
 
-			amdgpu_dm_connector->pack_sdp_v1_3 = true;
-			amdgpu_dm_connector->as_type = as_type;
-			amdgpu_dm_connector->vsdb_info = vsdb_info;
-
-			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
-			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
-			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-				freesync_capable = true;
-
-			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
-			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
-		}
+		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
 update:
-- 
2.52.0

