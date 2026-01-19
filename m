Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CEFD39BCD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51E510E322;
	Mon, 19 Jan 2026 01:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zwavm+dR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A4310E303
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:12:09 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-650854d9853so725149a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785128; x=1769389928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JoGhByEn91FpZkY9+HAr/2lnyy1yobmuVs/gaZ80X2o=;
 b=Zwavm+dR743BmGR4IShCRt4L6zlrdAyZbnMtEnzF1DMfxTKjZJhJ3ROhXyeNpZwu4J
 5aJ256OWzfdq9D7gekwmmc3ofjtOf7eeznnGIXxj3PxTjn/zodvKjYdcFpmQxnwTbmuj
 f6mImfekrkFAOGQoJthtef7QvAIIU4XM5BXay9U+0qCO9j6jlrhgzt7kmQy3y8gM9O38
 o9EZBmKIecNtgVIR2/4YbB819V6qQct6KQh7/JIth59iWxOKjMre5I+L58xTb0alZsZ1
 txwQr72005mV3yGYkKFc+00p4HMFLZRVbkN1lD0kJfZzhWxl/cS5+GD6xcnD5md2siGU
 YqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785128; x=1769389928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JoGhByEn91FpZkY9+HAr/2lnyy1yobmuVs/gaZ80X2o=;
 b=BQI1ZFxoD//mbzm6jiUiAW0jPn5R+jLpo1PFR3CvccZFTlLPA+eLCDYLa5D5Cy8K62
 YPYQJs773HG3JZ5DapN7qeMvOcZWsr0xupe1A6SR8+WH9cJBwwxa9JarE5CR7WAkC6R+
 680kuLzk3ahUU/QTrrZkw2+7c5H+b6pZipAJef/i2J+s4xU0K3OU91DBvKNHAsvc/oEt
 fYR57VxRc5gb1kVPOYXFg93NaBowNxZn1DJcUxgmQMGGriixQEsabKWtcZv36V7mg1m/
 MteDwORwvcEia2oYVEAQJHR+IbOLozUlc1BxfZbJ+ruxp0qPlPdqSK6+ChfF9xL37nik
 fhYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/OjrhkqzqwXzkr6TVYfldMCB7u6wJ88gmlC143Aho4wAWQwTSTrHJJaHBgW3J2W9dzsDQFLIrMN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZnu04F6Xqj4F779sLT4cm6UVDBRWonBvpM7odVLcwLYsLdRb4
 5uWDmi6e73xZvYL2D+NXnbQppCR/OtIsaC+MxUJSLbWQx+U8+2hEMB1a
X-Gm-Gg: AY/fxX5GImRQyHmm9Qh7nxpRiB/odaZ48SnSeDkzKPgcrDmAl4XcBoLc81CPHGY5cSs
 FOYOy0rVBqU34jkK61vAI5Oy00CsLC5f69Sabi7g3C6YkNLvGS/pjzI/tgMjxK85G24XC59tlo0
 hyfJKzR4ECLg36+Af6qGL0zW4rDtmiPUTtR76fUMakLi7ffFbGowZgfQjd04vMKrBo7ln7wHiNA
 WQNKiOdOonRhYoaTfngPc1z5AhDGj6rZSSxqW1bYbC5LDNdIusM5T9EJ9tSLDNoMJQEoQ81r3Lm
 vn++4asnbeIr0JNCpuesuiKXZq0gBHphp4ih21/as+gQ1P9gKfXr2G+XP/3RP23dRHLNPLbtdYb
 Cp77/eTbHi4+Nl2+hi7fdKkCO7ps5Cov4MQbsLNR1g493EVX9ShwvxB8t8Q0zKEYuAl8DWJrb22
 TtljbSrnTPYQN586lBC8dGN4xz3N+FfRTL3EqtGOVATAd6amY9hyHgjTobCzaZ0KXk
X-Received: by 2002:a05:6402:2684:b0:64b:76cb:5521 with SMTP id
 4fb4d7f45d1cf-654524cf81cmr4046398a12.2.1768785128060; 
 Sun, 18 Jan 2026 17:12:08 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:12:07 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 13/17] drm/amd/display: Save HDMI gaming info to edid caps
Date: Mon, 19 Jan 2026 02:11:42 +0100
Message-ID: <20260119011146.62302-14-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
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
index 37747f87b55a..6413f2a587d5 100644
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
index bb1387233bd8..acc6db52f5d8 100644
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

