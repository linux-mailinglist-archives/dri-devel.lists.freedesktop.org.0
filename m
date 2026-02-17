Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JUxIhBylWkWRgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339F153D64
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E5610E2E5;
	Wed, 18 Feb 2026 08:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="Sp+RJkDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1531 seconds by postgrey-1.36 at gabe;
 Tue, 17 Feb 2026 13:03:34 UTC
Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E4110E23B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 13:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QKhL5LaAcg+3T1EQz8Hq3UjAWUKkwldiyqgcrHgYjEs=; b=Sp+RJkDLpd6Pzfnd0sGsgv1Xvp
 vY5dFa0SjYwDJO0cQS/cj6oeWHHOOe9+tdsdMKsv2wXXEKvVTZ84O8d5GC+EKxYQEcluSRzV1deBS
 EfmXh78MJSjoQnl1BQ4Tr7GYftOz4KjKcQww5HVHjar/nhLsDXvHMlo6Ym1Im9XymbBLkwRBrsZQE
 wwyBo1xVIhPvV1K2oESv3pAzG36jil+RSsSj7eT/wqyKnJFVrUzoTWv1d7xMZZDjA7JLkofF3JWy6
 Uw0vIxgp6P4pcgGpdaUGVLsWVwTVGGaRnfjDY0l5D8ttLkieRVC0CX4rK8Hp0BGg6QSMXlFi+I9I0
 aENJlW0g==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:56892
 helo=florijan-nb..)
 by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.1) (envelope-from <florijan.plohl@norik.com>)
 id 1vsKL3-00000007pWE-1QWi; Tue, 17 Feb 2026 13:38:01 +0100
From: Florijan Plohl <florijan.plohl@norik.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: [PATCH 2/2] drm/panel: simple: Add Powertip PH800480T032-ZHC19 panel
Date: Tue, 17 Feb 2026 13:37:59 +0100
Message-ID: <20260217123759.169317-2-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217123759.169317-1-florijan.plohl@norik.com>
References: <20260217123759.169317-1-florijan.plohl@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id:
 florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Wed, 18 Feb 2026 08:02:15 +0000
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[norik.com:s=default];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_AS(0.00)[florijan.plohl@norik.com];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:upstream@lists.phytec.de,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,ravnborg.org];
	HAS_X_GMSV(0.00)[florijan.plohl@norik.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[florijan.plohl@norik.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_NA(0.00)[norik.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[norik.com:-];
	TO_DN_SOME(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florijan.plohl@norik.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_X_SOURCE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3339F153D64
X-Rspamd-Action: no action

Add support for the Powertip PH800480T032-ZHC19 7" (800x480) parallel
LCD-TFT panel.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 91ab280869ba..aa74f310d455 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4068,6 +4068,33 @@ static const struct panel_desc powertip_ph800480t013_idf02  = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct drm_display_mode powertip_ph800480t032_zhc19_mode = {
+	.clock = 27200,
+	.hdisplay = 800,
+	.hsync_start = 800 + 52,
+	.hsync_end = 800 + 52 + 2,
+	.htotal = 800 + 52 + 2 + 44,
+	.vdisplay = 480,
+	.vsync_start = 480 + 7,
+	.vsync_end = 480 + 7 + 2,
+	.vtotal = 480 + 7 + 2 + 2,
+};
+
+static const struct panel_desc powertip_ph800480t032_zhc19 = {
+	.modes = &powertip_ph800480t032_zhc19_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode primeview_pm070wl4_mode = {
 	.clock = 32000,
 	.hdisplay = 800,
@@ -5481,6 +5508,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "powertip,ph800480t013-idf02",
 		.data = &powertip_ph800480t013_idf02,
+	}, {
+		.compatible = "powertip,ph800480t032-zhc19",
+		.data = &powertip_ph800480t032_zhc19,
 	}, {
 		.compatible = "primeview,pm070wl4",
 		.data = &primeview_pm070wl4,
-- 
2.43.0

