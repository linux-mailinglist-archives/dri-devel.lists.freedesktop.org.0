Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEztFHRjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D8F81BCF
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA25E10E376;
	Sun, 25 Jan 2026 18:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QX2T99U/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56CF10E379
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:35 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6505d1420daso572319a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366374; x=1769971174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzW7AW51HsUGJKWqzdZ3dl0YJS+mvGm7coF5xMofNf0=;
 b=QX2T99U/fOWs4f5/QnqVPcCLxijIMlK95hUbvyaLlOHfsBPMpFPFys2mwjYdiHCHnw
 HnJTE4IMYUlBrmbn2yoppRTC42IiSn78SCWI13dHWUZzzj5WKXlA2JMjbbh69VhzlxFw
 UCrVK11o3p9X0CFrC+i42VI0WZQ3w0D2Ne2HvdySuNReVROStzAORXFu0DVRMp36Ez1Y
 kSN0AqQyTldx2GUf/XgjbCJgJG7Qw1SUOrtx/8UbDsCiJEU0Dw9Tz0iEkKxuug66dOwb
 bIGFReKdFl3ARcfoK1leuDAeoOJQDdRFR4YSzdgRbsG+vwW4pTfv6y5ivfSu4rd44z2I
 7alA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366374; x=1769971174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uzW7AW51HsUGJKWqzdZ3dl0YJS+mvGm7coF5xMofNf0=;
 b=i6nA3xsl7R/AVTfurDx77apUFEZiofovnKRraGp/vgJ4vkULqbxK9dUWnqJISkHgqb
 ggAKZ3rAIsZ8kTvzdsuequAJZRfqJ83qfBfAkZ5qDFuODkXgt4N2eQ2EeAJZlHM3KLkq
 /CCwjPLoRPgr1fRd91tk1P/+nYW8DpFnFZzKn0/un4LWbm+MU7VI1z04kuA8hiZz0W0Y
 GIOxDQC370KzL2rSJY1KCV4lXOUaHcXLoGWp0aPZ4CStn2qEyyOS8dYdx+zXxi7fHMQT
 lh+2pt6tXTCa35iNCSIbaRPtIYD/L7cAQT4euv5kaP5ZxWjAJgZSf1O5jfxDgMzik8KW
 auLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0GCm2Sc5wJKYgoeFbkSAJxhH5wfAb7pS0RkvV4B3WBuECtbgY/4BKWsY2YYDsxXHaaJEwZ2g/gXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkbOQ/fNvDpOcG+H1+Zt3UtYvgtbe3GW+/7iEwE1NnugvZjfDR
 Jc8TEhgIApD9W5wo6GFyGQGjW+U0/5sfh9ca/iIWcJAhxgUn8XstjGsg
X-Gm-Gg: AZuq6aKpusq8n5fBYnwTiDBjZ5BFT5ikboB5eDvaiz6lqpUz/5xYHvR/heKtpcSbfed
 wCL37asAT6WNzY+1NTGHDqoTVU0rT0HzHHhq2g8ebSzsyvYd8/OGHRA49a5bb5nkDaDXTltoPmx
 XTg5VY2sfyIG2SXKhksHG+6gYcYvyJ4JmXPOz97/on49k2cmznTvAdQeX24/AN8mzFvNHf5w1uu
 ppV25ArshbU8WvoMOZC9yrHZOvl1c5KnWiwIjFestCTM5QY11nwPcZVKDVxBadieoX6QCBLCs/j
 jersW6QK3birc2KO5m4T9zMcBEDGYlOa1SMbMMuErJ5AavkXkqowL5qDug0WIw7eO6R1/3/Cyvh
 lE6/08rUFR7HJ75wnl1mheSXVv1T9ggylr6xXgSXixMFAuVpMdXznIDU3e9hJLVPASidb6VAnd/
 qTKYIB2BYzRCV9BwVzblFMX/1NOxe9+31vAgLHN+aTiFDJ/CeOth8AK97OjW0RVnP6ArZEWaJ/P
 zM=
X-Received: by 2002:a17:906:c110:b0:b88:45e8:cbac with SMTP id
 a640c23a62f3a-b8d4f7197f6mr85434266b.6.1769366374187; 
 Sun, 25 Jan 2026 10:39:34 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:33 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 13/19] drm/amd/display: Save HDMI gaming info to edid caps
Date: Sun, 25 Jan 2026 19:39:08 +0100
Message-ID: <20260125183914.459228-14-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 06D8F81BCF
X-Rspamd-Action: no action

[Why]
We need info about these features in parts of the driver where fishing
for drm_connector struct is infeasible.

[How]
Add three new fields to dc_edid_caps and fill them if connected device
is HDMI based on it's EDID

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 7 ++++++-
 drivers/gpu/drm/amd/display/dc/dc_types.h                 | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 690558584a0f..c24476182fdf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -137,7 +137,12 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 				  edid_caps->display_name,
 				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
 
-	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
+	if (connector->display_info.is_hdmi) {
+		edid_caps->edid_hdmi = true;
+		edid_caps->allm = connector->display_info.hdmi.allm;
+		edid_caps->fva = connector->display_info.hdmi.vrr_cap.fva;
+		edid_caps->hdmi_vrr = connector->display_info.hdmi.vrr_cap.supported;
+	}
 
 	if (edid_caps->edid_hdmi)
 		populate_hdmi_info_from_connector(&connector->display_info.hdmi, edid_caps);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 0e953059ff6d..f9f108db1734 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -210,9 +210,14 @@ struct dc_edid_caps {
 
 	uint32_t max_tmds_clk_mhz;
 
-	/*HDMI 2.0 caps*/
+	/* HDMI 2.0 caps */
 	bool lte_340mcsc_scramble;
 
+	/* HDMI 2.1 caps */
+	bool allm;
+	bool fva;
+	bool hdmi_vrr;
+
 	bool edid_hdmi;
 	bool hdr_supported;
 	bool rr_capable;
-- 
2.52.0

