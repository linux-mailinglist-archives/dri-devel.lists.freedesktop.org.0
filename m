Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLRcLLVJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676FD14654F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C006210E3BC;
	Mon, 16 Feb 2026 16:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMdf2U5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAB210E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:31 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-b8fc023934dso18314066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260330; x=1771865130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEn0R38mGrwNqYAUGw253vwfhRvgl/ooBxvHfFpzd00=;
 b=gMdf2U5jfX3hEfu2VNBuHzDgrCTusI4igtRw6QF6gFhy49qRsISHejUq+3ruQP7aC6
 xFL732uu9jcCQ5fqKWNaakhxaQ7Y0cW7WgqQQ70Ted8YvfQI5LxArWSH9kdrge/FHbWH
 Y/ZgWugs6+pIWHsQFIV2XFsBHZ54sGNP/lRQPptDXJL3/CTHbmkoqnPdm6ZmpXgLIWmB
 rOraJZPdPk4cGZtY3AWA1XpgoK7hzEa5Z2DIQE26ABATNBCrfxlSSlLbBusbBOq6RTcb
 sQ4ucnh1NAVnk/+iaqfa8qyZZd7OM0GJACiTdrUrnQV5vPayl5Jzf4cVA6tYRNg1u/L8
 ACvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260330; x=1771865130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JEn0R38mGrwNqYAUGw253vwfhRvgl/ooBxvHfFpzd00=;
 b=rKZDltmf17NDjH2mvLhypn3s1boFMtjFuaynSyfJtGJRbNk8l6irgT1g4/K52op7Wh
 HQrvsgidzUkKhy5JoUUPV/5wBOSh2L0hQzQh6FqyRC2hlYIAI8l+7SpDcvCNLedaGxAS
 vrn8WD1xRGqTxFG/MHeG2D5d3lDUSQxW0nbXWNCvtXbyUcVqRu0eDXm2qyEtvTj8yucV
 o3USIKj9P/r9I8a8kBzOLGxkiDbknsryDpP2TPx8BKfhITTE3nQlycd4fsF3EiqYO8E7
 9N5g/cEt5HtiFFI4mpuM9S/nASFdNbTXh/FuBR/hC2JZL9I97iNOHOblVRgnZ7W9F9ev
 zAsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0vU/bM7I89vh0IR6QApAsEC4JdwPK6IH/1Dsc5YyrOwUEP7o5keZLeDYaCP57EyTFuBqQq1DS+rA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRrYz6iuPqp0rxlvEVT978bXkxvHXXaDMKJYqvfROQZ6rjwqoO
 5wqG9BwH5qvg4pf3LO2Boox8s/HstISW59D9wFirmabcl3lJoemS6AQC
X-Gm-Gg: AZuq6aLxTMbRKiCR4s1Mql0ZzRBzouAibP06/BNcNqKu7DW7xHEKgYs1E7WUd7+Ri6J
 9e2AoBWo9SecZ57EgvKDlkI5PrX6pu+0/5vhGRUCjUWn5JMV57o2gqe3qPN9pXc27Yl59ESua4Q
 5PlpYiFnohH+gQv0bcP3zVHhTmNFMU4a8c9hShtwpQPF3BzKkzSvmbR5JIJ2h821r24L18LSuM0
 eEYgO9tcVGe+UojTU4IJIS78NfZuTu+afdJSmXpB53QvcRy9haIupuNm7YxbyoemsNLdkfiLPzV
 EggY9jVHS6LgIiuAb4OWvUF6eUfI9RTyINsG+qp3xb6NC3eQW+RoYptJAdtPZAhfsJQNA43pef3
 5yH15jpQofexHmyMM4etEC9471AbWYnRt9qCHaX4/tC6rbKmKDzVS0kcmyrtMJKj8in0UsLfkjU
 ChC52PhUP/Fhn1ute5+BRTgi7SRlGncetFD/J1BRgK9t+Jg+P7CY8kZT6p0ri65/fEiQL+bkBy1
 CAN
X-Received: by 2002:a17:907:3e88:b0:b87:20c2:e837 with SMTP id
 a640c23a62f3a-b8face05dd0mr357799766b.5.1771260330026; 
 Mon, 16 Feb 2026 08:45:30 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:29 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 08/27] drm/amd/display: Separate DP/eDP and PCON paths
 completely
Date: Mon, 16 Feb 2026 17:44:57 +0100
Message-ID: <20260216164516.36803-9-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 676FD14654F
X-Rspamd-Action: no action

[Why]
DP -> HDMI PCONs need a completely separate treatment but they did fall
into DP/eDP path in amdgpu_dm_update_freesync_caps() previously. This
could sometimes result in weird values assigned to the connector even
though it doesn't support VRR at all and needs a bit of HDMI-like
treatment.

[How]
Check if the connected sink is a HDMI -> DP converter earlier and
gate DP/eDP path

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f36059bb0324..2f31fe7265d9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13321,6 +13321,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct dpcd_caps dpcd_caps = {0};
 	const struct edid *edid;
 	bool freesync_capable = false;
+	bool is_pcon = false;
 	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
 
 	if (!connector->state) {
@@ -13349,14 +13350,18 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (!adev->dm.freesync_module || !dc_supports_vrr(sink->ctx->dce_version))
 		goto update;
 
+	/* Gather all data */
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
 
-	if (amdgpu_dm_connector->dc_link)
+	if (amdgpu_dm_connector->dc_link) {
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
+		is_pcon = dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER;
+	}
 
-	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
-	    sink->sink_signal == SIGNAL_TYPE_EDP) {
+	/* DP & eDP excluding PCONs */
+	if ((sink->sink_signal == SIGNAL_TYPE_EDP ||
+	     sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT) && !is_pcon) {
 		/* Some eDP panels only have the refresh rate range info in DisplayID */
 		if (is_monitor_range_invalid(connector))
 			parse_edid_displayid_vrr(connector, edid);
@@ -13381,14 +13386,16 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
+	/* HDMI */
 	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_info.freesync_supported) {
 		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
-	if (amdgpu_dm_connector->dc_link)
+	if (amdgpu_dm_connector->dc_link && is_pcon)
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
+	/* DP -> HDMI PCON */
 	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_info.freesync_supported) {
 		amdgpu_dm_connector->pack_sdp_v1_3 = true;
 		amdgpu_dm_connector->as_type = as_type;
-- 
2.53.0

