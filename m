Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKWiJLRJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106F146542
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E80710E094;
	Mon, 16 Feb 2026 16:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fpvhd+2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9E010E094
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:37 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b8dd0168b90so55577366b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260335; x=1771865135; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfYWliWmx0HEAyOt3BzW9unBdR7paUp8ugYTT0bfO9c=;
 b=fpvhd+2wm6kSpW4Y/1LdLnE3DcMY1AwsSKFBNwC/sp7d9dsv2PpGpKryPJOPabzMEj
 kyA0RGK7pLcSCZzpWndNr65HTdWMXtOYVW1CUK8t8Fg7LS1nuRcjWVGAsLtF+qQtncof
 rUT8tBEukPsYD1s91gZK784/JLsaKNyoDUKntq5xVhO5z96GqMtXN0Gb2DZgr4AIv/fX
 wIzkRztB4B0dQCankM+tr/SiaKJdFlCFbGFKsr3p2MLknq7KwlaiMFg8hbajfwSs6+jK
 xOxGfe8dNziPjoF60ijJGU64/Dn+CJqeZI7lSZYouW2GsAHq2QimKUmtngBvqZIDEyFP
 mbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260335; x=1771865135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jfYWliWmx0HEAyOt3BzW9unBdR7paUp8ugYTT0bfO9c=;
 b=F3ZkfeNOmXWhWUYUG0Mj2P7Z9DRXoq6T3eE/hf/qPA1AbXNV16Mf7q1RrQSpYMt0LG
 D3Y3M1vM5WDzgUeu6CQWnaf/egf4Ls4mMwdUtE8vB3kXb/fCR9jGPy0fghGbfBPVyfpK
 kSHFc67UiwyijIJi1nu6l2dBDwxinkRt1UitbFPBrrRUsLFgcVxB68/4RvAIXAaf10NO
 N1u0Z2ins6kmSk+ABp0Z8faba4HEpMBTx39dNKsaVIXMlKCs6UuwdIQSqBPADGyacKkV
 MJP86st0iVob6fV8KZyehv+ujAunPLijD8VC2p5dQ0EJRzqN0+FRcikteRW5oPI3Lmgi
 iLBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfj1xxVE6P5UJl6T+eNosTCMyFkgQgRjEgiMG/R3quzZmzMUwtQfMHKh0xm779b348l9Hc1t7+o1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB7K7Q8WpGPwUVdQm0xB6/zzNAQnAcGbZiyI4Ye/lvIDdVUE2a
 jfrigQ5Z9prnF3Wg6eEslEISQmc9f9Z4PDy5S++2JYI4lbfEN/zoYBc+
X-Gm-Gg: AZuq6aI9IrwGZCbAFPNqLo9tYOGeHdgUA0xzb44ZPfTJ+9O/gLygCsUMxqUglNkQgRG
 wHSo8QT8uRSU2TTrXbkVKo3Yq2pDvypG2IHI7hdqfYf2HrACW23i46iCGscnRvzSWMn41CoN25j
 MLkvQWFeIrfT+VpRzcAnyOPxApuO5YN5kgMEeE6bnSsGiXwzjD1Zqmss6o2rFM+9NVD3IM7vRpo
 ilvl7JhxGTQnTLCU+/uWnqG3Fi+oqcdhxgWL9n2eVKJ/2uIVR8gW37L0aLZtZ0kzp4RPwOUBQVU
 FaFKJRxh0PJedZuJokw9n/Yw+juXdEgcz0IO+ZgUTsB9WyCLEHJ7yzl4SHUMovs+DAUFnhihE84
 Y+QcRyDp5HJ7OtVVlBghlkntlKjjlPZScF97lofpeMV3VO9bU8DeDsoJAOAy7M004pDnkGaFnpe
 EwIAB/dkOOZeb4WHH9TWPegoxsnPVMnID2m768L5yIHcQT4TD58bI6USHjbtpYzNqWtahpNsqJE
 wpt
X-Received: by 2002:a17:906:c108:b0:b86:f194:9ed5 with SMTP id
 a640c23a62f3a-b8facc58f4bmr333385366b.1.1771260335242; 
 Mon, 16 Feb 2026 08:45:35 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:35 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 12/27] drm/edid: Parse more info from HDMI Forum vsdb
Date: Mon, 16 Feb 2026 17:45:01 +0100
Message-ID: <20260216164516.36803-13-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 4106F146542
X-Rspamd-Action: no action

[Why]
Drivers may need info about gaming features exposed by HDMI sinks. Add
a central way of storing this information.

[How]
Adds flags and a struct to hold HDMI VRR information. `supported` here
is an additional property which allows easier parsing in consumers and
adds a bit of logic used to detect malformed VRRmin/VRRmax values.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 drivers/gpu/drm/drm_edid.c  | 41 +++++++++++++++++++++++++++++++-
 include/drm/drm_connector.h | 47 +++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 26bb7710a462..056eff8cbd1a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6152,6 +6152,33 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 	hdmi->y420_dc_modes = dc_mask;
 }
 
+static void drm_parse_hdmi_gaming_info(struct drm_hdmi_info *hdmi, const u8 *db)
+{
+	struct drm_hdmi_vrr_cap *vrr = &hdmi->vrr_cap;
+
+	if (cea_db_payload_len(db) < 8)
+		return;
+
+	hdmi->fapa_start_location = db[8] & DRM_EDID_FAPA_START_LOCATION;
+	hdmi->allm = db[8] & DRM_EDID_ALLM;
+	vrr->fva = db[8] & DRM_EDID_FVA;
+	vrr->cnmvrr = db[8] & DRM_EDID_CNMVRR;
+	vrr->cinema_vrr = db[8] & DRM_EDID_CINEMA_VRR;
+	vrr->mdelta = db[8] & DRM_EDID_MDELTA;
+
+	if (cea_db_payload_len(db) < 9)
+		return;
+
+	vrr->vrr_min = db[9] & DRM_EDID_VRR_MIN_MASK;
+	vrr->supported = (vrr->vrr_min > 0 && vrr->vrr_min <= 48);
+
+	if (cea_db_payload_len(db) < 10)
+		return;
+
+	vrr->vrr_max = (db[9] & DRM_EDID_VRR_MAX_UPPER_MASK) << 2 | db[10];
+	vrr->supported &= (vrr->vrr_max == 0 || vrr->vrr_max >= 100);
+}
+
 static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 			       const u8 *hf_scds)
 {
@@ -6277,7 +6304,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	}
 
 	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
-
+	drm_parse_hdmi_gaming_info(&connector->display_info.hdmi, hf_scds);
 	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
 		drm_parse_dsc_info(hdmi_dsc, hf_scds);
 		dsc_support = true;
@@ -6287,6 +6314,18 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 		    "[CONNECTOR:%d:%s] HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, DSC 1.2 support: %s\n",
 		    connector->base.id, connector->name,
 		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(dsc_support));
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] FAPA in blanking: %s, ALLM support: %s, Fast Vactive support: %s\n",
+		    connector->base.id, connector->name, str_yes_no(hdmi->fapa_start_location),
+		    str_yes_no(hdmi->allm), str_yes_no(hdmi->vrr_cap.fva));
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] Negative M VRR support: %s, CinemaVRR support: %s, Mdelta: %d\n",
+		    connector->base.id, connector->name, str_yes_no(hdmi->vrr_cap.cnmvrr),
+		    str_yes_no(hdmi->vrr_cap.cinema_vrr), hdmi->vrr_cap.mdelta);
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] VRRmin: %u, VRRmax: %u, VRR supported: %s\n",
+		    connector->base.id, connector->name, hdmi->vrr_cap.vrr_min,
+		    hdmi->vrr_cap.vrr_max, str_yes_no(hdmi->vrr_cap.supported));
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..dab9d5521f41 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -254,6 +254,44 @@ struct drm_scdc {
 	struct drm_scrambling scrambling;
 };
 
+/**
+ * struct drm_hdmi_vrr_cap - Information about VRR capabilities of a HDMI sink
+ *
+ * Describes the VRR support provided by HDMI 2.1 sink. The information is
+ * fetched fom additional HFVSDB blocks defined for HDMI 2.1.
+ */
+struct drm_hdmi_vrr_cap {
+	/** @fva: flag for Fast VActive (Quick Frame Transport) support */
+	bool fva;
+
+	/** @mcnmvrr: flag for Negative M VRR support */
+	bool cnmvrr;
+
+	/** @mcinema_vrr: flag for Cinema VRR support */
+	bool cinema_vrr;
+
+	/** @mdelta: flag for limited frame-to-frame compensation support */
+	bool mdelta;
+
+	/**
+	 * @vrr_min : minimum supported variable refresh rate in Hz.
+	 * Valid values only inide 1 - 48 range
+	 */
+	u16 vrr_min;
+
+	/**
+	 * @vrr_max : maximum supported variable refresh rate in Hz (optional).
+	 * Valid values are either 0 (max based on video mode) or >= 100
+	 */
+	u16 vrr_max;
+
+	/**
+	 * @supported: flag for vrr support based on checking for VRRmin and
+	 * VRRmax values having correct values.
+	 */
+	bool supported;
+};
+
 /**
  * struct drm_hdmi_dsc_cap - DSC capabilities of HDMI sink
  *
@@ -330,6 +368,15 @@ struct drm_hdmi_info {
 	/** @max_lanes: supported by sink */
 	u8 max_lanes;
 
+	/** @fapa_start_location: flag for the FAPA in blanking support */
+	bool fapa_start_location;
+
+	/** @allm: flag for Auto Low Latency Mode support by sink */
+	bool allm;
+
+	/** @vrr_cap: VRR capabilities of the sink */
+	struct drm_hdmi_vrr_cap vrr_cap;
+
 	/** @dsc_cap: DSC capabilities of the sink */
 	struct drm_hdmi_dsc_cap dsc_cap;
 };
-- 
2.53.0

