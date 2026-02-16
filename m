Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGsbKsxJk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1611465CB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDA110E3D1;
	Mon, 16 Feb 2026 16:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EDWawg1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A3C10E3D3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:51 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b8f7f7a1b80so42157466b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260350; x=1771865150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GHywGhoa9nMFX4SKcKZGp9++GBGqwr6bmHnyfGvrOs=;
 b=EDWawg1X3Ug5z1kKxLc+n+JFkpnv+Qgw9mCzoDanpw9F+ufRMw+Fs5revMplq5v0Be
 hrRjviyDTB+5+XYIs5h23CA1vSgE6DujppUzUCUDLg+uLH/qBpAYMtPGJclpNzlqnmLY
 daQ1hklIJ0smZAaHYRGRhUGDKpP1/D44Rq3pmomnT8wgXwtf0V0J8TeVB9M6J/p/De5M
 YSOJPip1Pf02ba/vwo2/rhzlv/mzBZIjPShEjMli9eGTgG4X5bx35Dx7gfNFMRn6e61h
 L//ZsIFE+J+M0UeX0ZogX8YXezsk5drmOvzW+Eh7AomYPXSSxkJPriTWIs6fw5IN0jkl
 wvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260350; x=1771865150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8GHywGhoa9nMFX4SKcKZGp9++GBGqwr6bmHnyfGvrOs=;
 b=m9VShuAzPVtakeEYBF1oZaoaXuKy+CxnBgIJyiaVNVclQ7lEn+cYzl8bzOwHtewgdb
 mboXX/GL8wEYk916VB+ELVaQ4SWSO0R3CPpGlJjUzwWSjc7LLJ4pPaNEVJ4eVsw4sY28
 ZL1bbdTyvj9aJyC7VH0/lpGto5QPOk8n3tTq5ftDdjoWx6UxPzKaEcBltSiqYIya+s1S
 +0/PkKss37qjQv9USBF6Bl86i1fPMuZRqQIJWuLqguMH/KRl/EAdKqLf7xupswdLcf2N
 lJnsCvcihLJDNy59rlwdPUtZ7WCc617P2x3c3y2ZGDSOi6EM0k3Ke0PKJdOySLLymruC
 hFEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfJIl4NRGaWieQ7IQOgBob7t/SISXEQOsFgBclFA6JgxnZT0dF1dck/i1vyPGdFyq+DsnfEprVhJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkVM8a7nB/OSC9ApEBw/EJy3W3xFMl3E+gW4N2SY5NPxGQFZbj
 xEau7CCPwiiWDCF6CRPlYCe1wox17TdBp7AnrPPYArVDGlb1I7olPe3P
X-Gm-Gg: AZuq6aIcEQo0HRubsjIlvBamZVSD0iCQdqBk9iudehiNAa6v5BRPVUR1HRE2QC6/lPb
 mCPbjw5pdFURBUHHl00gmYA14IjQdenKcGKB3y9oGxnkShTf0PYAobhSHmdMdc3JxbRZm9MaPFU
 2LVPoIrwR4wKjuKsjgsmlnK1p99BvKP2PlWazYp81qwVDIC1kr38ICUbF2QqeEJvJ5VO0rbozfr
 MWWdv//OR4Sl8fsZaVE7WgInB8PdKeMGW7CHWXdg9URTew4aQn1Xk+u+Gqs2KLNp/PDFFhLSS9c
 5bktdy9DYuf9lxJNuQTa0NFQfRH8/XPV4lV5+yzmRSpXkDwP9zG/4IxPMLVBa6Nbk1qmV/5YBBQ
 ywwW4VUSQ1q+2H1IA/aDt2TxQNR0J6l5L+fuONBGJGWlUTdvMbVMxotIvGr2D117dAWZ21mcUvl
 AUAXjjFOof8Q9P3DyPpoeup+aRqsbxRr+iCwsJwEUo9MaxVcGcQWYQe7cjzx1inDqgpQk5LZ4v3
 W5SWtCKCdV6A4Y=
X-Received: by 2002:a17:906:6a0f:b0:b8e:7dcb:7f23 with SMTP id
 a640c23a62f3a-b8facc9d34dmr363796266b.2.1771260349806; 
 Mon, 16 Feb 2026 08:45:49 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:49 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 23/27] drm: Add passive_vrr_disabled property to crtc
Date: Mon, 16 Feb 2026 17:45:12 +0100
Message-ID: <20260216164516.36803-24-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 5B1611465CB
X-Rspamd-Action: no action

Many TVs and other HDMI sinks suffer from blanking and possibly other
glitches when VRR is toggled. With VRR present on such sinks and
vrr_on_desktop enabled, they behave like the signal is always variable,
even in fixed refresh rate situations. DisplayPort and eDP enforce
seamless VRR transitions but HDMI unfortunately doesn't.

Keep VRR toggled if it's supported and not explicitly disabled. It can
be used for any VRR sinks, but this is mainly targeted for HDMI.

Functionally, for an end user, this is the same as normal, fixed refresh
rate mode. The only difference is that sink is kept in VRR state which
enables seamless transitions into/out of variable refresh rate.

Basically, the driver shouldn't change it's behavior around VRR_ENABLED
set to false, jut keep sending info packets/frames with VRR/FreeSync/
G-Sync/HDMI VRR active.

Enabled by default for sinks that claim it's support

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 ++++
 drivers/gpu/drm/drm_crtc.c        | 2 ++
 drivers/gpu/drm/drm_mode_config.c | 6 ++++++
 include/drm/drm_crtc.h            | 9 +++++++++
 include/drm/drm_mode_config.h     | 6 ++++++
 5 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index b2cb5ae5a139..a3ad2fe3306b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -383,6 +383,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		return ret;
 	} else if (property == config->prop_vrr_enabled) {
 		state->vrr_enabled = val;
+	} else if (property == config->prop_passive_vrr_disabled) {
+		state->passive_vrr_disabled = val;
 	} else if (property == config->degamma_lut_property) {
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->degamma_lut,
@@ -448,6 +450,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->mode_blob) ? state->mode_blob->base.id : 0;
 	else if (property == config->prop_vrr_enabled)
 		*val = state->vrr_enabled;
+	else if (property == config->prop_passive_vrr_disabled)
+		*val = state->passive_vrr_disabled;
 	else if (property == config->degamma_lut_property)
 		*val = (state->degamma_lut) ? state->degamma_lut->base.id : 0;
 	else if (property == config->ctm_property)
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index a7797d260f1e..4f2c871552e5 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -322,6 +322,8 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
 					   config->prop_out_fence_ptr, 0);
 		drm_object_attach_property(&crtc->base,
 					   config->prop_vrr_enabled, 0);
+		drm_object_attach_property(&crtc->base,
+					   config->prop_passive_vrr_disabled, 0);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 25f376869b3a..542d21d7ca36 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -340,6 +340,12 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.prop_vrr_enabled = prop;
 
+	prop = drm_property_create_bool(dev, 0,
+			"PASSIVE_VRR_DISABLED");
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.prop_passive_vrr_disabled = prop;
+
 	prop = drm_property_create(dev,
 			DRM_MODE_PROP_BLOB,
 			"DEGAMMA_LUT", 0);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66278ffeebd6..59dbb7ce1358 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -299,6 +299,15 @@ struct drm_crtc_state {
 	 */
 	bool vrr_enabled;
 
+	/**
+	 * @passive_vrr_disabled:
+	 *
+	 * Indicates if variable refresh rate on desktop should be enabled for
+	 * the CRTC. Support for the requested state will depend on driver and
+	 * hardware capabiltiy - lacking support is not treated as failure.
+	 */
+	bool passive_vrr_disabled;
+
 	/**
 	 * @self_refresh_active:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 2e848b816218..541cfaba67a2 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -679,6 +679,12 @@ struct drm_mode_config {
 	 * whether variable refresh rate should be enabled on the CRTC.
 	 */
 	struct drm_property *prop_vrr_enabled;
+	/**
+	 * @prop_passive_vrr_disabled: Default atomic CRTC property to indicate
+	 * whether passive variable refresh rate should be disabled
+	 * on the CRTC.
+	 */
+	struct drm_property *prop_passive_vrr_disabled;
 
 	/**
 	 * @dvi_i_subconnector_property: Optional DVI-I property to
-- 
2.53.0

