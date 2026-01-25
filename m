Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAq9M3NjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6D781BC1
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F9F10E371;
	Sun, 25 Jan 2026 18:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d/BGM2kh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E41710E207
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:33 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-64b686e7d04so672506a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366372; x=1769971172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03JVoj5pQZnfXuN1Dsu194SUGxgQv5HQ+1Go+Oa8Fms=;
 b=d/BGM2khFP6XDIkkB27qvJM6B7FUk+mtJhGcjuQgPntBffFrvcAyjaYnWRRF51oBRD
 z8leSWL9FY+keOqEvGuwvF0ysukIC2M725kIlQ48XcthFkPxnLO3kRUMfybY+nNA9dUy
 wzxY22dLXYXL2NHonHRV30336MARPgq9TphnjqmskFfvJzud4jByEQR8qxElg9AWdBAF
 fNDYWwPesveGD0VVrBSVhjHR+9nxlJogj5cATSczfnalfKtu7rJbe9q5mOngFrqtIsc3
 bLuTxSsHkVyWSjAQVvgHgIMlRXQyfbg6si7Rl8xMqD/svj2j0S5akyIylAPPOm4U53HL
 IjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366372; x=1769971172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=03JVoj5pQZnfXuN1Dsu194SUGxgQv5HQ+1Go+Oa8Fms=;
 b=ArVkI4aziGt02bsvwyUJ0u4wZwbG7nUFQS7zkbCw0Hg8rRLJI/VEBfL/GoFmjb7Eiu
 QP9bRdVvtEZCOg/OPM3TuyTjZW8511g7grgbQizmIyRm9Zn/KUpUQMVFFUdEmERkdWeb
 SnE039oaw4v/1G6fV5UdlGpr9V6skHj9+KbxfVBRTIub4X+Bvw8tIkICmFvsDH+xyh3M
 RkNtrIfipSF4BQJq79B2k+lIsRpOBc63T4Yc3pGG//aVkVGJ+prBb6HMQncSe9BTZc+y
 wOxloN4ygUS8fnF1LdKwNmiMttL461BnHCskZsy3s1ssXlZdZ/SHAuoIzU4aGVTdBE/y
 yt9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7lrAlEKlzTLEP6VB4RXCl0fM6tJMaQtxYm3TdtodTgvM46emYBN7EZZR+baaO98llU89GO//V9hM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBnjwPVDiVi8FLpZ3M4rcnEyLiW9ZYD6A9WE0JfGe0WL47WbE0
 0gDgCiekBaeXMFiK+TLadgVsFH1WGgqEf3j5tygrALHqOfSeL7G9ffhp
X-Gm-Gg: AZuq6aKcioN//ww+DUfoelvlB9Cz4LChODss1eZmsqnII8lWp9qoDBwwoqOYQ6mnZAw
 UpxCWQq4kl50Ql4mLovxY64AunIR/q/QKJDiUaVnCiznryMQjplu0CA2osCQ3XDTH2MTElJ8/H8
 TLcUZyrZfyljcZaoQ/YO/YxILZWAoZDXr0aor97hQ6/GKh+akLAcDilSfDNBWuX/E40B+I7I6eb
 Fe6HbfuXKHg+2VmfDkhJUHzQHLXY+ZuuQQafbVfqjyX2ifP1FIKHr34m5VHLq+C0KqBrKqg/lzh
 wm+a0jZDqndYdIOiWwm5EvNccPcFo9JLUbBTR64WFO0R9fGjInCE+/GWeeMN+WcJhWnuDM32oek
 Y9jjv2FYRaIXaIjb8gJ7dNn4/He4+AUyniruU5iguWWbuw3wOyM1U3A7ztT4BKESbFJq3BSp4Vq
 tPnLrBL0O6xwfRt7ShSoXKPn1eK+7n5sqwV4HQS9pYsFgzmUJ/M3tEPDUC/DjX5DR1
X-Received: by 2002:a17:906:c104:b0:b87:3087:54f0 with SMTP id
 a640c23a62f3a-b8d3fa9d567mr110192266b.3.1769366371750; 
 Sun, 25 Jan 2026 10:39:31 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:31 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 11/19] drm/amd/display: Support HDMI VRRmax=0
Date: Sun, 25 Jan 2026 19:39:06 +0100
Message-ID: <20260125183914.459228-12-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 6E6D781BC1
X-Rspamd-Action: no action

[Why]
VRRmax=0 is a valid value and means that the upper bound is guared by
the selected video mode.

[How]
In this context, saved vrr max is the max possible refresh rate ever.
Try getting upper VRR bound from AMD vsdbif it exists or rely on the
limitations of BRR in VTEM info frames.

I found through testing, that TVs seem to reject VTEM when BRR is set
to over 1023 Hz. Use this as the last resort VRRmax.

v2:
- Update max BRR value to 1023

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 +++++++++++++++----
 .../amd/display/modules/inc/mod_info_packet.h |  2 ++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d3464705ab7f..b93ba14d87d1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13215,14 +13215,25 @@ static void monitor_range_from_vsdb(struct drm_connector *conn,
  * try getting upper bound from AMD vsdb (if passed).
  *
  * @conn: drm_connector with HDMI VRR info
+ * @vsdb: AMD vsdb from CAE. Can be NULL if not found.
  */
-static void monitor_range_from_hdmi(struct drm_connector *conn)
+static void monitor_range_from_hdmi(struct drm_connector *conn,
+				    const struct amdgpu_hdmi_vsdb_info *vsdb)
 {
 	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
 	struct drm_hdmi_vrr_cap *caps = &conn->display_info.hdmi.vrr_cap;
+	u16 vrr_max = caps->vrr_max;
+
+	/* Try getting upper vrr bound from AMD vsdb */
+	if (vrr_max == 0 && vsdb)
+		vrr_max = vsdb->max_refresh_rate_hz;
+
+	/* Use max possible BRR value as a last resort */
+	if (vrr_max == 0)
+		vrr_max = VTEM_BRR_MAX;
 
 	range->min_vfreq = caps->vrr_min;
-	range->max_vfreq = caps->vrr_max;
+	range->max_vfreq = vrr_max;
 }
 
 /*
@@ -13360,8 +13371,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	/* DP -> HDMI PCON */
 	} else if (pcon_allowed) {
 		/* Prefer HDMI VRR */
-		if (hdmi_vrr->supported && hdmi_vrr->vrr_max > 0)
-			monitor_range_from_hdmi(connector);
+		if (hdmi_vrr->supported)
+			monitor_range_from_hdmi(connector, valid_vsdb_cea ? &vsdb_info : NULL);
 		else if (vsdb_freesync) {
 			amdgpu_dm_connector->vsdb_info = vsdb_info;
 			monitor_range_from_vsdb(connector, &vsdb_info);
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 5de8a6918e6a..306eb7355c25 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -33,6 +33,8 @@ struct dc_stream_state;
 struct dc_info_packet;
 struct mod_vrr_params;
 
+#define VTEM_BRR_MAX 1023
+
 void set_vsc_packet_colorimetry_data(
 		const struct dc_stream_state *stream,
 		struct dc_info_packet *info_packet,
-- 
2.52.0

