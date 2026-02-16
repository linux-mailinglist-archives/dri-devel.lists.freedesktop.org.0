Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAziEeiDk2k46AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:54:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A52D14794A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4378F10E3F3;
	Mon, 16 Feb 2026 20:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="WpSlh3Ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F0D10E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 20:53:49 +0000 (UTC)
Received: from relay11 (localhost.localdomain [127.0.0.1])
 by relay11.grserver.gr (Proxmox) with ESMTP id CD128C6047;
 Mon, 16 Feb 2026 22:46:03 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay11.grserver.gr (Proxmox) with ESMTPS id 6A273C603E;
 Mon, 16 Feb 2026 22:46:03 +0200 (EET)
Received: from antheas-z13 (unknown
 [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 8120A1FE763;
 Mon, 16 Feb 2026 22:46:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1771274763;
 bh=tCG9SidYxSFoE86kcGym0WKUQW7cMXO4qIcXjxRjiJ8=; h=From:To:Subject;
 b=WpSlh3EppCF4fQz5Ea1VkUvrobX1B713qAXKRDjE91VDuuNWyw2ZIzKO38+LFywyY
 ydidh5+2BRodD+yPEzJDKbs+ebgSAiW6TErsjCX2sgd7WV/mOx+WqoXaCTm2TALGMo
 MKm/XELgY4tFq/ZYb9HfaYDMMj4nmu3zjkmsVbiy7GIKEbEM0+DHLiQXE2thovPn2u
 mTJ5scAmkLr8OfC6ZZh8/vWvUiQuVIkgEJNnXr1XOHmMIEZhZP0/8thQLU8w0TN6WD
 OqRMWKQKxSEVkb/yPHsOCbfbLmshVGc3wug45hrrJ6XUewD7twi5rAqr20jfIQ6s01
 j9Ve5qtnwU+nA==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1)
 smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, philm@manjaro.org,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v2 11/14] drm: panel-orientation-quirks: add SuiPlay0X1
Date: Mon, 16 Feb 2026 21:45:44 +0100
Message-ID: <20260216204547.293291-12-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216204547.293291-1-lkml@antheas.dev>
References: <20260216204547.293291-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177127476306.3071602.14116500344285976452@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[antheas.dev:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,manjaro.org,antheas.dev];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[antheas.dev];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkml@antheas.dev,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[antheas.dev:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1A52D14794A
X-Rspamd-Action: no action

Very similar to the AYANEO 2S, the Mysten SuiPlay0X1 is a handheld
gaming device with a 1200x1920 display that is mounted in a
right-side-up orientation. Add a quirk for it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index c055be8d8b25..857fbc1ba4dc 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -491,6 +491,12 @@ static const struct dmi_system_id orientation_data[] = {
 		 DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
 		},
 		.driver_data = (void *)&lcd1600x2560_rightside_up,
+	}, {	/* Mysten SuiPlay0X1 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Nanote UMPC-01 */
 		.matches = {
 		 DMI_MATCH(DMI_SYS_VENDOR, "RWC CO.,LTD"),
-- 
2.52.0


