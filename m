Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBH7M6pJk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D2814651D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A815510E3BB;
	Mon, 16 Feb 2026 16:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JqsEv0Km";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E5C10E3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:25 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8fc023934dso18311566b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260323; x=1771865123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CU4lePUCCJ3xj5OwOvFkst/VeREzzL5189XbX5ib9YU=;
 b=JqsEv0Km48LNpFhiBtUrIj04x/ezCqAWqa3weH+iADk4WbXdXdeHSwkNfdRO9VQ2II
 EcpN8MGdl+yI7MpLnrBlLVqd89cuet1wWDsrwv3zOJQSuf3Jhv3EUwbmwoChaMuzpf7/
 +8+f/vwnXx6Q/m+he70e02UOIxTvps64pcukvz42KdbRDUnskSI2mP83LCp+Vf+iUU0U
 pbJc3UhC3dAi1OgKXBFdHAa/BTXYT65691S5fUwDFUnbQa2G2YJODt7pVESXAchZBVa3
 pW4KJdTaM8Ujvsq2xCata0gCemZxJBrPuMPf4XF0ROLdGaVQOD3C45XiWB8cye0t4lso
 0qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260323; x=1771865123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CU4lePUCCJ3xj5OwOvFkst/VeREzzL5189XbX5ib9YU=;
 b=MuxSwgx6I2/alcZ5Gpvl8SmvBvziHlFV5uF5e+qmXue8NOmeMNLglcScY28JKYT5VU
 4BLH9B8m2brAKdPyjLnOmht9WmPzgJqKVa3XD7LXX0nvU7o7IsoJUb2Pf7MeKEvwZvbl
 1bcghPhBLdLVQBT+Lka+mT44YHPBxaGmZDoC2MiVP+zK2ctE6vxFDpNdphCa4qOUwFXv
 Ia+XHL7YC/ulE0By+f1z3DRQ3XGQJzX8eYWOeMjjCJeU/t0cAZNEqqii7pEGz/d+47Rg
 tuKtW0xllRJMzv7v3faz033STRzROjrqO1ApqpJIvq5CrzmVTOj2SqcCUctXO4jHGElE
 /HHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU48+fjQZkK02t2Ns7rf4XlL1j91qPLLkl2zFlOG+lIcWi5HN7Bo615LucapBrS9v/NVZiULhaK7To=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyaocuow1ehmLygLGzWFeymm3cn8KlGmi2+QJSvgCUQUrltptbO
 oTCYzMkPFxahZzM7kndZg7j37MOzelrkOrx33DaX5P27CE9lJyIBUtur
X-Gm-Gg: AZuq6aKoLN+M0LOGXFBB6tJGMDdoa0eH/mEtfr7+9II7bgKHDN9rj54TQ1OSRfoGHyl
 /t5X7mqOeDgMcwBZPZypYgBv+emek8ALLiD0dDweEIzQRu/u4ortambto8LC+rtf3D8L6mNK6YK
 7Q3Gg3hkNxNFuKKlCkHxffTpK7ZD7KN6qUlwKL6fzGYzV8y2rwMphZDSYIYDduhYViWicZxVoBi
 i66cuFgVnYUI4wf8mo1SD00Jk3J9P6DulhYe61Wxsg3QPRsglE86WL8Idos/+fNoFClpy1i+y1B
 8Cp7946qmZviHsW5F32bow/6mBLOACVLwPdo8TQoz/RfrFFI0fnMy2kE3zYGCyI6aik5u4EHMmg
 xWnf9+H1Cm3LhUxH2UYFlQc4ygMTpBHGdpQXBIa52+h74rwm45N97Sr3z21YB0lpeHcq0UnaU7w
 zvicUVgunWCRTrZD2yoDrGwjja4DMzF3KUF1qkQhd1+bA0Q04bQ3+jtwVcDAixkTRaP5ktGcAaS
 uVM
X-Received: by 2002:a17:906:c108:b0:b8e:9ac2:9e0d with SMTP id
 a640c23a62f3a-b8face3fd6fmr326171166b.8.1771260323206; 
 Mon, 16 Feb 2026 08:45:23 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:22 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 03/27] drm/amd/display: Remove redundant edid checks
Date: Mon, 16 Feb 2026 17:44:52 +0100
Message-ID: <20260216164516.36803-4-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 82D2814651D
X-Rspamd-Action: no action

[Why]
Edid parsing functions check if edid is not null themselves. In a case
where edid is not present, the structs will be left initialised to 0
so anu possible assigment won't change the detected (or undetected)
functionality.

[How]
Remove edid pointer checks

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6218ad911fde..903264b26d1f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13330,8 +13330,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (is_monitor_range_invalid(connector))
 		parse_edid_displayid_vrr(connector, edid);
 
-	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
-		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
+	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
+	    sink->sink_signal == SIGNAL_TYPE_EDP) {
 
 		if (dpcd_caps.allow_invalid_MSA_timing_param)
 			freesync_capable = copy_range_to_amdgpu_connector(connector);
@@ -13344,8 +13344,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
-	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A &&
-		   drm_edid) {
+	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
 		if (vsdb_info.freesync_supported) {
 			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
@@ -13356,7 +13355,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (amdgpu_dm_connector->dc_link)
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
-	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && drm_edid) {
+	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
 		parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
 		if (vsdb_info.freesync_supported) {
 			amdgpu_dm_connector->pack_sdp_v1_3 = true;
-- 
2.53.0

