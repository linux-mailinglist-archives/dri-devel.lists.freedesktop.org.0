Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E3SHrhJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667414656B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D5A10E3CB;
	Mon, 16 Feb 2026 16:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V4U2WR2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C19F10E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:39 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b8f8324d2eeso40827566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260338; x=1771865138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qp5SXJGMlbR2C2KjVkdcVn6F2JKroblos6Aoghsh/Sw=;
 b=V4U2WR2tyHo0LDfV0q57O9Nmg6tf/ZiOFu5VUOsxKVqjjUZaZtTNzF2abWxOFr2YSA
 aF8+gGzQD1EiPw+W6D9XHUjYpcSUoIqbJf4KuWb7nXmJPomYFx5B+M4xnykcdYfsf/JL
 JXxM30M5o16xwU5drao/dALu2nQDoz3hTeXDUN+ZKtA3i1djh5p7GmVl5ewnaOv+0+LR
 OojvRh66qhWOyXzr6cJHveT61CzWLAWZMbKpW4CfQknE+Adi3XEPjld+Nk33D5TYk+Vb
 kKN+KPfHLzpOdGQ8TbPC6mmkw9ovDi2KOqrdFRv01frPXQ9Ap8OgqyhltUEn1YvhC2eC
 92aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260338; x=1771865138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qp5SXJGMlbR2C2KjVkdcVn6F2JKroblos6Aoghsh/Sw=;
 b=Hv4axKiCXTpdcjqSIb9xhuQd0RgVj++yms2s/iLWNNSWjDw01Xwjlccm3D79oYO9Dk
 XpYUe8FsOHNtXTnvjd7skvC4NqnFtR9pruBKkNtkIPIvmtW9tPRhf2HMFs28dVqc/LEY
 g08rx4Mf+OoeE2cvFi7dhCc1LfHU/WJ+7tiiqhv5RkilnZsdU5Zwjs0W4ZWlbd2ncov/
 IyuHZSAGrTV5YQCbWI9l3Z1uwLkTeyC/io15859UTgB6GJc7A767aMDYHUpUNF4ukfjh
 OXyaHw3Y6EcevOo+CDTySqBosMbdw1z3X9ZLNYH1VY4UX9wYPmkryAyneoO5+DPQTfMs
 Pprg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzd15gI7Fy2EbEoyQTUHGwsuDUpgPAqa027Ss2mFPUxWDCp373TZ4L6SWMI1wLLrD87gdNoep/dOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytF4yb6erX8weEvyAkGkktXK29gH84MpXTksTzwENGCgoXBd8v
 Jp2XPK9r2/A78Pl4l8K2nCkuTxIageckayCAL74DvqkAGU8otGxdZVeg
X-Gm-Gg: AZuq6aJH+qef5vdi9GlK5tnxWHFjw7LYZ2KlFUl3x+HtNQLfwFAhmnwLCt2ip1u76KZ
 Ox9VTjwjXyOXQNmONqJKlcFrn9Z9UWQBcPSI7pur0A0/rV2BgWJP/x6iuAytvTeV2xZs6cuMcaE
 0ZWwsohs3M10hc6+3HrrI2nSR3HqZWOwWWS2/f2+RECud34CKeA/Lat1rLJcf1wDIshRJ4/kN4o
 JWMZ9TPaXSyf+ZfXKnx5ivVesOjuWV0US1jhEkUn2GdeZo+1XXgezfASviofnhwY9LJoFd5G/i4
 1OHcWZhaoppTPSEjJMTfRCmxKVACLglo4hlnY5bsQhmt392JGDwzyOTFU42lVqfaMv7dlcuCIKm
 hnjUZGTErI453L6+0D9CAskzJ63RgL9SQua4WYnAwc5uV2gNu10Vh4WkEOV6LF7M6dkzWOMhcPr
 iBByGRh/GkWHzQGyCuw+Rpb/KYmAgsPdnAUtjvBZL+odqMG5bdkOoGf0YMOCf82RSl+6ANuMQPN
 tCM
X-Received: by 2002:a17:907:9628:b0:b87:6c5c:d3d4 with SMTP id
 a640c23a62f3a-b8facc7b4ebmr343317866b.2.1771260337873; 
 Mon, 16 Feb 2026 08:45:37 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:37 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 14/27] drm/amd/display: Enable HDMI VRR over PCON
Date: Mon, 16 Feb 2026 17:45:03 +0100
Message-ID: <20260216164516.36803-15-tomasz.pakula.oficjalny@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 2667414656B
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
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e511eb5a1f7f..931493433439 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13258,6 +13258,17 @@ static void monitor_range_from_vsdb(struct drm_display_info *display,
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
@@ -13322,6 +13333,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
 	struct amdgpu_hdmi_vsdb_info vsdb_did = {0};
+	struct drm_hdmi_vrr_cap hdmi_vrr = {0};
 	struct dpcd_caps dpcd_caps = {0};
 	const struct edid *edid;
 	bool freesync_capable = false;
@@ -13357,6 +13369,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	/* Gather all data */
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
+	hdmi_vrr = connector->display_info.hdmi.vrr_cap;
 
 	if (amdgpu_dm_connector->dc_link) {
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
@@ -13398,13 +13411,17 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
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
 
-		parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
-		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+		amdgpu_dm_connector->pack_sdp_v1_3 = true;
+		amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_PCON_ALLOWED;
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
-- 
2.53.0

