Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGBHMMtJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13C1465B6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797B010E3CE;
	Mon, 16 Feb 2026 16:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vzsmd3j4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732E110E3D3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:55 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b8fc068d201so43214266b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260354; x=1771865154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7aD3otBgcxZjv1qvxWCjHurqs+NRqtEYA6dA7W84qVQ=;
 b=Vzsmd3j4X6gj1uoIRX8IE0HPSy3tqW2Th6M23JK7dHbm2M3/1CKZT+H/2IS5UDs6lZ
 +VjB0FW9N+5ASTeH7BJG9DQ8il1a31Ht1RXEtJ7hfOTIRVKlFgzNO24dRohE5EOVF1AJ
 CvxcNjBthUIQfAoXfT9DfwDjHxXmgSVlo+2hVokvAjGVhVp+ITCOw5Ynacc2HpOHEUxe
 lnX+Lmuhj6rA77SKjfrqBTEcyT2iNGW0uHrnSWwDSwNRK8TgQjSd4tOjK5YHh8Uxo7bz
 QCPQ4N+ThiA45lnIlw3ZACCEZNvY72Bsilz/f0YFCo4wOk2IZc/eBmqYPsnsA2mtRNMG
 u+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260354; x=1771865154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7aD3otBgcxZjv1qvxWCjHurqs+NRqtEYA6dA7W84qVQ=;
 b=SnhczHcYXqxrXSosJVYGsYAFXQDx6w7u/MvgNG8XZZhBqAfzHE+YCHCSUq+TP3O+qJ
 f0oaI4eu8fBbSLJyYAN9pFIWbIgB6CW3syhSCqVaPdKeCcpvVrHr4LpYfJV0bf2yYvX2
 +PcyCaBf/8dxhOcaH5mk16Zaye/gWmxkJgjtGjUSgGWRCoGMHCzW2dL0wOBv2A1ko2NW
 bXaWqm9dYsJGvWa6VRY2EG7diP2/eu9Dr9HIeKvrnoni/5WrZDEhN17EgXnx8KhWuQux
 CT74nEiMrbX1bvusu5w5Fms7p4GoqnqHz1nW4S9cqeNZGxpXA2dswe7fBJnNgiIL3xkw
 U+tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5pIm95nUvl0yAcmO8irygSP5ARFmGX56gx1VNsx74lm8zEc/iKgaODNkM8ZN60xlW0xaDwCPdsag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhFI2bFhsKAo8Wf71dMW1vPBIBQsEDD2gXrJ7TFldJOUyYASed
 F6ih8zdoCSuuzgebmAa5TWQ6zzNuedcGkX8FrvCy5eOGQajzWOvRdZPd
X-Gm-Gg: AZuq6aLkIxRlDkMsQXa0hdnahXon0P3CftFkFUL8MXEoIeBaHb5Jl6ztwQGg/OkdbCA
 NY5yyJg/K2IeRni81SsEGPQq809gurS8aa9+xJnz37tANtRFNa5wiECYC6NlKAf5TKWT2vdIrau
 NYrfBmwX7qlQVs32y6Bi2XBr9FDESR+Q/0fEUIede4FbW90BLRn3LmtgeudMxopsvTm5RfaX+UY
 zJX8YxIHvJxSDfQWsmJXNlTSHXete6cvKd1act/7nK5BgijSWta3A7pVbz1Y6eddE06bB9bbRr3
 HgsVbIILCAYvf1F9WKT2N0VeyCdp8BbxF1Ut5qm/xmok1VyGqXY2Sz4c7HMoSnQm1EpOpF9uP6u
 jg0IC9/whbdkZKLMiRvaNBi6g2EH4LEpP14/g6RkXlGtTLliKRdmszWPHayBkc04QVIjN4g7FKb
 zQDyvNWwyWDMGYDGuT+MYmRXBBji2GSF7QJ+7N/kz5BxRxc7aC27aORsl2zif7FY5IbN+zZlsfi
 Vyi
X-Received: by 2002:a17:907:98d:b0:b8f:bf8:e04a with SMTP id
 a640c23a62f3a-b8fac8b3924mr328939466b.0.1771260353828; 
 Mon, 16 Feb 2026 08:45:53 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:53 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 26/27] drm/amd/display: Use passive_vrr properties in amdgpu
Date: Mon, 16 Feb 2026 17:45:15 +0100
Message-ID: <20260216164516.36803-27-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4F13C1465B6
X-Rspamd-Action: no action

[How]
Attach and use this properties for HDMI sinks which are troublesome
with their VRR state transitions. Hook into already-established
freesync_on_desktop logic.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 ++++++++++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6a2806cc800a..41677c50b3d2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7850,6 +7850,8 @@ amdgpu_dm_connector_atomic_duplicate_state(struct drm_connector *connector)
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	new_state->freesync_capable = state->freesync_capable;
+	new_state->freesync_on_desktop_capable =
+		state->freesync_on_desktop_capable;
 	new_state->abm_level = state->abm_level;
 	new_state->scaling = state->scaling;
 	new_state->underscan_enable = state->underscan_enable;
@@ -9057,8 +9059,10 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	    connector_type == DRM_MODE_CONNECTOR_eDP) {
 		drm_connector_attach_hdr_output_metadata_property(&aconnector->base);
 
-		if (!aconnector->mst_root)
+		if (!aconnector->mst_root) {
 			drm_connector_attach_vrr_capable_property(&aconnector->base);
+			drm_connector_attach_passive_vrr_capable_property(&aconnector->base);
+		}
 
 		if (adev->dm.hdcp_workqueue)
 			drm_connector_attach_content_protection_property(&aconnector->base, true);
@@ -11338,6 +11342,12 @@ static void get_freesync_config_for_crtc(
 		config.vsif_supported = true;
 		config.btr = true;
 
+		if (new_con_state->freesync_on_desktop_capable)
+			new_crtc_state->stream->freesync_on_desktop =
+				!new_crtc_state->base.passive_vrr_disabled;
+		else
+			new_crtc_state->stream->freesync_on_desktop = false;
+
 		if (fs_vid_mode) {
 			config.state = VRR_STATE_ACTIVE_FIXED;
 			config.fixed_refresh_in_uhz = new_crtc_state->freesync_config.fixed_refresh_in_uhz;
@@ -11349,6 +11359,7 @@ static void get_freesync_config_for_crtc(
 		}
 	} else {
 		config.state = VRR_STATE_UNSUPPORTED;
+		new_crtc_state->stream->freesync_on_desktop = false;
 	}
 out:
 	new_crtc_state->freesync_config = config;
@@ -13352,6 +13363,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct drm_hdmi_vrr_cap hdmi_vrr = {0};
 	struct dpcd_caps dpcd_caps = {0};
 	const struct edid *edid;
+	bool freesync_on_desktop = false;
 	bool freesync_capable = false;
 	bool pcon_allowed = false;
 	bool is_pcon = false;
@@ -13431,6 +13443,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
 
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
+		freesync_on_desktop = freesync_capable;
 
 	/* DP -> HDMI PCON */
 	} else if (pcon_allowed) {
@@ -13445,11 +13458,14 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		amdgpu_dm_connector->pack_sdp_v1_3 = true;
 		amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_PCON_ALLOWED;
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
+		freesync_on_desktop = freesync_capable;
 	}
 
 update:
-	if (dm_con_state)
+	if (dm_con_state) {
 		dm_con_state->freesync_capable = freesync_capable;
+		dm_con_state->freesync_on_desktop_capable = freesync_on_desktop;
+	}
 
 	if (connector->state && amdgpu_dm_connector->dc_link && !freesync_capable &&
 	    amdgpu_dm_connector->dc_link->replay_settings.config.replay_supported) {
@@ -13458,8 +13474,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	}
 
 	if (connector->vrr_capable_property)
-		drm_connector_set_vrr_capable_property(connector,
-						       freesync_capable);
+		drm_connector_set_vrr_capable_property(connector, freesync_capable);
+
+	if (connector->passive_vrr_capable_property)
+		drm_connector_set_passive_vrr_capable_property(connector, freesync_on_desktop);
 }
 
 void amdgpu_dm_trigger_timing_sync(struct drm_device *dev)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 800813671748..88ec2b88dcaf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -1020,6 +1020,7 @@ struct dm_connector_state {
 	uint8_t underscan_hborder;
 	bool underscan_enable;
 	bool freesync_capable;
+	bool freesync_on_desktop_capable;
 	bool update_hdcp;
 	bool abm_sysfs_forbidden;
 	uint8_t abm_level;
-- 
2.53.0

