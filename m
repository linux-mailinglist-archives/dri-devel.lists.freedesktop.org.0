Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNwIMKtJk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4C146524
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C77810E3C4;
	Mon, 16 Feb 2026 16:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J+rRvzrb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE70B10E3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:27 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-b8dd0168b90so55575566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260326; x=1771865126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ztq3hyjq4dBqjOVD+VwET2LGqK9hc4CUPcVZQOdgeE=;
 b=J+rRvzrbm2UFM7+3+5qRE5yQtJlWdkStQiWfof3DwlZyNhN/mop/L664bUty87sD7/
 0kLGs8efkxQIiY1cYZWS0TfOdh+XKDVVvZbmOQ7oFsm8JPzEZsCEU0A/v1crH5VIPeiJ
 8JeuvdAZprYY2ruaFk1ZTuIGdIniXPVNbrzQws9jfz/Q2eq+ZC7EdCTcdltS7r6Du3iX
 8FVfSFoRWPDMEqATvjTlgsb2OJIPP3hotjM8n2our5yRX5aZnLq5sCtjRHXF7VMmY4V1
 L53byrsSCQQaixRt6E7OjwjTNq+mqi6EFEDMb8nCchsxvzYX+tC9HtOakBgQY1h86ZMQ
 lFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260326; x=1771865126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Ztq3hyjq4dBqjOVD+VwET2LGqK9hc4CUPcVZQOdgeE=;
 b=foxb1bzisyWzLdwiW5SGMwyVG0cz8hZecKXDy2mENC9XPL+KaygcjXrAGwBnSgMRJ/
 90KRG+pYpm3mr2sC3hk+5AdbNck1npFqRX2MGT0B9tlwTp9VUMmb+pvLCYgeDvDlm1G4
 7g6IGU7jGINH2aBVh0DwcC1S/K8G4XxoaYmV13E/FS163gRSyc/HipLEJSIrSNvfTa4w
 ulgAD7h3D8swvL5jFFoCFagy3L6Wk9BEDfgFjNrxXjQrfqeYVYjxg3h/BroTsdrbrRRl
 OKvhIEZz8p64VswJmX3cyp6YYEZGwedzVBHM8sXNoDwINCmOmrTaZ9vxXjwHhYrHqCWc
 Q6eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVydu3jxGT1fFneoMfOT4BlhKCz5bDviw+ke3o03Vk9o/tfmxriheRqj1BKwqwh2zU9ma6lUaKqpl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwASLc6oM9/i1LAbg0HzO1snzfm0QF4DprexZ10TbsaAU81FKYX
 KUqN1Zvx+LUEl8pZZJyD4ykbomBZEb1akMo7OXefLsTipoZ96K0jAC1L
X-Gm-Gg: AZuq6aLOsAZNbd3tAKjLux28K0jstW5RfdV4YjGWaRUr6PU9cIkAwNjPptQ/hth6boQ
 ROtHLc1atTejzAKX3fwVN8y4UXOi1i9+aZVu5IvxHKANSzAn/ZcbGS02WKoFGkBhuPf+KQpSOqe
 Ogu3qaMVvIXkHNXFRaX8PEcZe6P6uGep01PEXPGHGZnJSNPN/coDMNOu4EIx7o+U7cG7wkh4go0
 fO5QiobJiKcTcXunP27qij2qkMWTn/NFv7bmR5PCDyaPW7xK61mvEhPTyHdtKrr1mgnN6mrgtyy
 ZTQ0Pbli7/voLjfGx1kCayzCegR/BDatctkgH7ZsVJkQAJMwcnJggnEjIG5n+pZKDWMO7vMjndk
 51kRTT1+Xsfc2d9DzpuIeQan6EJq23NeDKrDca6j50i4x3KQ0Yqbs4e6O+wu9vAnquttI7bl91e
 uibkjWmgIhG0nrS3rpzRZPgmDL0DBZEJmHxrPbDLH09z6D3aGMNy7WuyjQeKWek8aXiZdLDSvhB
 6cl
X-Received: by 2002:a17:907:608c:b0:b8f:e96:7880 with SMTP id
 a640c23a62f3a-b8fac86c68dmr364359766b.0.1771260326136; 
 Mon, 16 Feb 2026 08:45:26 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:25 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 05/27] drm/amd/display: Always try to parse AMD vsdb
Date: Mon, 16 Feb 2026 17:44:54 +0100
Message-ID: <20260216164516.36803-6-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 74E4C146524
X-Rspamd-Action: no action

[Why]
Allows us to make the code inside amdgpu_dm_update_freesync_caps() more
concise and prepares for vsdb usage outside of HDMI and
DP -> HDMI 2.1 dongles.

[How]
Move the parsing function outside of specific signal type blocks.
Merge signal type checks and freesync_supported checks

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 27 ++++++++-----------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index be3bb5a86959..64d1dae4d214 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13322,6 +13322,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		goto update;
 
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
+	parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
 
 	if (amdgpu_dm_connector->dc_link)
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
@@ -13343,28 +13344,22 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
-	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
-		parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
-		if (vsdb_info.freesync_supported) {
-			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
-			freesync_capable = copy_range_to_amdgpu_connector(connector);
-		}
+	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_info.freesync_supported) {
+		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
 	if (amdgpu_dm_connector->dc_link)
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
-	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
-		parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
-		if (vsdb_info.freesync_supported) {
-			amdgpu_dm_connector->pack_sdp_v1_3 = true;
-			amdgpu_dm_connector->as_type = as_type;
-			amdgpu_dm_connector->vsdb_info = vsdb_info;
+	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_info.freesync_supported) {
+		amdgpu_dm_connector->pack_sdp_v1_3 = true;
+		amdgpu_dm_connector->as_type = as_type;
+		amdgpu_dm_connector->vsdb_info = vsdb_info;
 
-			parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
-			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
-			freesync_capable = copy_range_to_amdgpu_connector(connector);
-		}
+		parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
+		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
 update:
-- 
2.53.0

