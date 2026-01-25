Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDDUEmpjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1E81BBA
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2FA10E377;
	Sun, 25 Jan 2026 18:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kz+Q1U+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E868210E207
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:23 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64ce9d80429so603959a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366362; x=1769971162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYketr3ZUeHaXFKK2N5/f0hDOcHB6O4IFG/ShrYM/tw=;
 b=kz+Q1U+nVyRotARaGQLCubv02JWg6kCsG1Mp1xfcJglMBjvqpMMQwOh8uaJlbPOLxp
 /wkwxvRx++LYMvVvktSKhRdRQ5XC9ezNgtXxHp4VpmacJhGrsOEulLszPF9cZeGDT8NC
 0jeLqrPVt1nPVYpajEw1s4oEisR/qk6g3rsKnug1EnFFPlrucKaS46O1QHxg9u4KdSyD
 tBzWem55lZZi/5NpNA9hiiGt/ZuEb0gzswDPIN+lx1hJXMBEt8hsbiveuLYy3yCDBkRc
 h7vD7UCJJZDs1+DURF5PtEXJGhSTCvjX9hpbA/xR94QpWpgStglPoVN97m7LOObYZLjx
 TmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366362; x=1769971162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BYketr3ZUeHaXFKK2N5/f0hDOcHB6O4IFG/ShrYM/tw=;
 b=Qv4jhdWe6+UXD1nzIRfXdczCtIgo0k1MpIQOH6nywiN2V9NqAOJ8kpWaBWzwgxH01r
 N+xxY/afUhpjhzwRYuron/rFB2dbYu4gLY6UlcSxqXQ+zrDru/3ZcWTNL3VD5aCGv8SU
 +/aF6b4pFpXvUhSKPM0cQCGzxqS3Z7dSjYs6wKVWUdJn6gdTgbJCFfCZXZgJXEbIyrsm
 tqfe6h1f8mEqM+stVtAHqa+/BwTUPJrzYD8R0wX2HhGG7npNA1X3YJt9pBOUcpJPHWfX
 r73JG/C9VDllCAwMwBGn+iwsWE0qQ7H7Y3U7+iOeQTcN6d+bTCK42fp+GW411484LQYh
 Xi0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUat+4/6f9w482p45c2ttX4EMpC4ZxB67BVfNZN9xwcA5C9MLnv6gHZnG9u09uAFAic8QnhNhd2G4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlvjobJMP1S/zNb5vGIXpNzgrxUHEWOJy9Wbhb0vNuTMWVu74L
 SD0EyiAClULxsIIIH2oGpky0x8Xq8FSRolM1dzGJrDQ5IPmzqm7p8l7CS/wGOQ==
X-Gm-Gg: AZuq6aKRS/BnbQIsER8T2a8ovEu4auIeNSXqFyo/a4IFn86/iHUV5vMxQ7/T49MUnlJ
 ccYU1G7ci8w1myQhlXnPNagnAtKjXgMDKIByWeOqADGNTpdXdBh5GvSx5rLNFGn3FF5k+RiPMgq
 TpzUeon7wrxp9kZA0fHt9OR+O4Cy1vfHg/yAxkmfTsj8xyyIPTCDA/Yg5Ip1ZzCmD+IcCtYgRR3
 ONdbz0P321urlJKPY2YpP55ijqIzOYn3gq3KBcfB8xglJO8VIIGeZUeEi+fWPAiipzyGw5oJnyF
 6wRl20CEQm7ez4hbk5HUEbe2el28MDXrp9XpqI/5rn+nDC6a42CVjqEiC6QxJ2y11zIXfA/tk97
 /fG+mSP5ZxeRTFSPN3EEmeg7OePKCRAgEFjvKfw3rC4XvG5Z1j7lTw4aOMjrkiMQws5WA/F5jFg
 toDY9yjsMjn6qWVRMdPUPhkY2LclnBN7A+4sDaZ6OlCDXlaR53az0mBp/GzWSvbe3rhMTVjzGGk
 38=
X-Received: by 2002:a05:6402:4408:b0:64d:4149:4923 with SMTP id
 4fb4d7f45d1cf-658706b2726mr914635a12.1.1769366362315; 
 Sun, 25 Jan 2026 10:39:22 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:22 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 04/19] drm/amd/display: Use bigger VRR range if found in
 AMD vsdb
Date: Sun, 25 Jan 2026 19:38:59 +0100
Message-ID: <20260125183914.459228-5-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: E7E1E81BBA
X-Rspamd-Action: no action

[Why]
Some monitors only expose their full VRR range in AMD vsdb for some
reason.

[How]
Compare exposed ranges and use the bigger one.

This check could be merged with the previous one but it's better to keep
them separate to easily convey their meaning.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4177
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e4f4d6ba09c3..68a59275dead 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13221,6 +13221,18 @@ static bool copy_range_to_amdgpu_connector(struct drm_connector *conn)
 	return is_freesync_capable(range);
 }
 
+/*
+ * Returns true if range from AMD vsdb is bigger
+ */
+static bool compare_ranges(struct drm_connector *conn,
+			   struct amdgpu_hdmi_vsdb_info *vsdb)
+{
+	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
+
+	return (vsdb->max_refresh_rate_hz - vsdb->min_refresh_rate_hz) >
+	       (range->max_vfreq - range->min_vfreq);
+}
+
 /**
  * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
  *
@@ -13294,6 +13306,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		if (valid_vsdb_cea && is_monitor_range_invalid(connector))
 			monitor_range_from_vsdb(connector, &vsdb_info);
 
+		/* Use bigger range if found in AMD vsdb */
+		if (valid_vsdb_cea && compare_ranges(connector, &vsdb_info))
+			monitor_range_from_vsdb(connector, &vsdb_info);
+
 		if (dpcd_caps.allow_invalid_MSA_timing_param)
 			freesync_capable = copy_range_to_amdgpu_connector(connector);
 
-- 
2.52.0

