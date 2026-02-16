Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJHQNLlJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A719146579
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E93310E3CC;
	Mon, 16 Feb 2026 16:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JLYtfb7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3CF10E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:40 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-b8f7f7a1b80so42154566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260339; x=1771865139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9OKWWD4fVuRFCLZG1mlotGGCycPT2eMUJpgDA/iY0b8=;
 b=JLYtfb7VIVHzy2k4hKHTV1PTnNZfKbvDkrRTjHupKOJ5IM00ZDyQoYxMIUV42ir16R
 88zYkAVR5AIVgd7u2r4wD+yXk/YYHL4i4+2+UpUp4jmQuvJb93G+hBdWyjQXyQEzbrHH
 dp6Seu0OP3FLG4acfM5JD9u4riFLnL5MZtJpF9jw5HB8nhFQN2u9eTlsoyCBvNT3e6cY
 T66DY/52YrdE6vIMxBV2nBkgYiw7L/n65hlOsCEPGXxEU+r2ioJT7L6IGleSFyFXNvoa
 CpVYGa/1077i0NUpaqhk7yHIuI045T7zEOsvIL6iNMOD8N1+cIx7zeIXVblMDEPrYPaK
 hlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260339; x=1771865139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9OKWWD4fVuRFCLZG1mlotGGCycPT2eMUJpgDA/iY0b8=;
 b=RWmr3wcgj6lOURmYKxHOZ8RrMvXbPu5qSebzKSiDl+1Rch9jnUTxVXtKgwKFdrMBQa
 QgwSFXJoHuCkG6LX3QHW8iHpRChw14NEkK3aBiKgz9ao4qTARrRCCC35IsLIOeuq6L9U
 rPSqHVUuUqs9WoAk4iO8ImQv3QxnNcAB2rRFhhbQg5exe0hjAVBGnbS6CohrpXRrWAES
 S4NNU+XKvtWF2Uqp39AM1OLoVc+dLRgyWgPBfNZ0vt07O3DsMUidxryD8LZyb6t5ED9g
 5o0+d6ldfv2Pnd/sEgpOdiG7ZVG8f/w+xc/dHKvaRCT51ypZpIOlojcXtAjdrYz12kK9
 ZU3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdRlzCVbZvGzhnPhDCzsWdum49ETc1ZFEJKH152BaOV243HPJgwYF4GV5IYY1U7rSVU227I1fNDf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwsFR3zE+I0MwodFBBGgxIaTC2kAZQJfedbH9DW9BzyAWGNh1x
 oaTkt9V2Q2HriXpCCIUJS9TFfig22rGQvg/fegH6TkqIJr2rELh8vAmC
X-Gm-Gg: AZuq6aIjIotI94FSLsGgu/pvLYdHTf/BxkKAdlVFSjn/0URoNL/sqWhu2CChu7wGwaF
 TAnl4LI2YhfW0suwXsfjjxZuEqe0F6/2FJ5J30WHSA7bLv0mW1Nhs4lqO/2bxo6DTYFNvGzT9x7
 gRBcj7yany+BJglwqR4z97cNl/ulEM65719+okhREBo6mZ9my/vmG2ZClJprFpInPDzN1EtnGg7
 kNh0SlekWzwc3xbOHgzD6zFImPXepRVUgLtQgWXjDHjlmKflRyHRqTc/Dc7qdrhEir/FZVMPKSq
 WqdhSL0Io8AdYTweF655m8cdAb4BX6Oa5JGE+Z05MXg55XcgauspFaQHlVJ+LuSgVkJTnhuwfg6
 NJd3kUFKTe+awcHAZ5Y7i5Y98M68PGI/HeAmP9js4RbRkbWuuKGi3NZaNeWnJ9uJj3QhRgRDFY1
 NAWIdoLT561bkEjUmO0/Ul/2O1GzPknMN7KRw67llknoFsVpVC6hh3gN8R2bntpTNezYjBvZt1j
 XAf
X-Received: by 2002:a17:907:3e88:b0:b87:2099:9f6b with SMTP id
 a640c23a62f3a-b8face2491bmr364262166b.3.1771260339213; 
 Mon, 16 Feb 2026 08:45:39 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:38 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 15/27] drm/amd/display: Support HDMI VRRmax=0
Date: Mon, 16 Feb 2026 17:45:04 +0100
Message-ID: <20260216164516.36803-16-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 8A719146579
X-Rspamd-Action: no action

[Why]
VRRmax=0 is a valid value and means that the upper bound is guared by
the selected video mode.

[How]
In this context, saved vrr max is the max possible refresh rate ever.
Try getting upper VRR bound from AMD vsdbif it exists or rely on the
limitations of BRR in VTEM info frames.

I found through testing, that TVs seem to reject VTEM when BRR is set
to over 1023 Hz. Use this as the last resort VRRmax. 1023 is the max
value for a 10-bit field as well.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 +++++++++++++++----
 .../amd/display/modules/inc/mod_info_packet.h |  2 ++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 931493433439..991e2262ecbc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13259,14 +13259,27 @@ static void monitor_range_from_vsdb(struct drm_display_info *display,
 }
 
 /**
- * Get VRR range from HDMI VRR info in EDID.
+ * Get VRR range from HDMI VRR info in EDID. If VRRmax == 0,
+ * try getting upper bound from AMD vsdb.
  *
  * @conn: drm_connector with HDMI VRR info
+ * @vsdb: AMD vsdb from CAE
  */
-static void monitor_range_from_hdmi(struct drm_display_info *display)
+static void monitor_range_from_hdmi(struct drm_display_info *display,
+				    const struct amdgpu_hdmi_vsdb_info *vsdb)
 {
+	u16 vrr_max = display->hdmi.vrr_cap.vrr_max;
+
+	/* Try getting upper vrr bound from AMD vsdb */
+	if (vrr_max == 0)
+		vrr_max = vsdb->max_refresh_rate_hz;
+
+	/* Use max possible BRR value as a last resort */
+	if (vrr_max == 0)
+		vrr_max = VTEM_BRR_MAX;
+
 	display->monitor_range.min_vfreq = display->hdmi.vrr_cap.vrr_min;
-	display->monitor_range.max_vfreq = display->hdmi.vrr_cap.vrr_max;
+	display->monitor_range.max_vfreq = vrr_max;
 }
 
 /*
@@ -13413,8 +13426,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	/* DP -> HDMI PCON */
 	} else if (pcon_allowed) {
 		/* Prefer HDMI VRR */
-		if (hdmi_vrr.supported && hdmi_vrr.vrr_max > 0)
-			monitor_range_from_hdmi(&connector->display_info);
+		if (hdmi_vrr.supported)
+			monitor_range_from_hdmi(&connector->display_info, &vsdb_info);
 		else if (vsdb_info.freesync_supported) {
 			amdgpu_dm_connector->vsdb_info = vsdb_info;
 			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
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
2.53.0

