Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FkDMOiDk2k46AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:54:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E02147950
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1210E3F4;
	Mon, 16 Feb 2026 20:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="I3hjgGxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 474 seconds by postgrey-1.36 at gabe;
 Mon, 16 Feb 2026 20:53:53 UTC
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263A410E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 20:53:53 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id 0B66EBC213;
 Mon, 16 Feb 2026 22:45:58 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 67EEEBC043;
 Mon, 16 Feb 2026 22:45:57 +0200 (EET)
Received: from antheas-z13 (unknown
 [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 9133D1FE5E3;
 Mon, 16 Feb 2026 22:45:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1771274757;
 bh=JMth+yZy9w8XIi3MZHgfDlw5IRkJTq+dU7RVO45lplM=; h=From:To:Subject;
 b=I3hjgGxQ00r6qYQGM8isOWS7f/Audn6DocSm/gRhEdy/lEjH+ZgAkROfy4qixU4f4
 pkI6GbEaXI/oI1p4Aw/CG2jBBUb5+GhNRP9zNBmCobwtHpEYCg17JZR7kZBqeiHHGU
 yQRK25sRJlIctF8qt+JoUvFa8gG/FY4W+0DkLAfzLhmSZFu2IuaIKjgdEzmzvVds2h
 OYYu8jG+qQyNY2wgZDafRULR30j48OFss/o79X7bAZbEeDlG+0VoT9FdqBhjisaUJb
 EyuurzRBbYWEW4VO3G1Vjbx7QmGUfFFQSCTKKteWm3WT7OSJe17ordzGkZdltSkIDK
 1zPcc23VUigxA==
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
Subject: [PATCH v2 04/14] drm: panel-orientation-quirks: Add OneXPlayer X1
 variants
Date: Mon, 16 Feb 2026 21:45:37 +0100
Message-ID: <20260216204547.293291-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216204547.293291-1-lkml@antheas.dev>
References: <20260216204547.293291-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177127475707.3070316.5493660884239566887@linux3247.grserver.gr>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[antheas.dev:s=default];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,manjaro.org,antheas.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[antheas.dev];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[antheas.dev:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkml@antheas.dev,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 72E02147950
X-Rspamd-Action: no action

The OneXPlayer X1 series features a 2k 10.95 display with a portrait
orientation. Add quirks to set the panel orientation to portrait mode
to the Intel, AMD, and EVA-02 variants.

Reviewed-by: Philip Müller <philm@manjaro.org>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 .../gpu/drm/drm_panel_orientation_quirks.c    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f745db95c394..2efffe962460 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -504,6 +504,30 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
 		},
 		.driver_data = (void *)&lcd1200x1920_leftside_up,
+	}, {	/* OneXPlayer X1 AMD */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 A"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer X1 Intel */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 i"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer X1 AMD Strix Point */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Pro"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer X1Pro EVA variant with Intel */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Pro EVA-02"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
 	}, {	/* OrangePi Neo */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
-- 
2.52.0


