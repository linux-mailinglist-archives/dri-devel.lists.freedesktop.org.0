Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Lu5nKu28f2nwwwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 21:51:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD7EC7381
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 21:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D384610E1EE;
	Sun,  1 Feb 2026 20:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com
 [209.85.160.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CA010E1EE
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 20:51:52 +0000 (UTC)
Received: by mail-qt1-f226.google.com with SMTP id
 d75a77b69052e-503347e8715so45976701cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 12:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769979111; x=1770583911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GXjFzCLISlG9H2ijbdsC6P+eo2hikOk//FMC0i88dFg=;
 b=kS83U3UbnZpOwR0bGPvw/OiCo96VpUWA30CB8FrNhxH/IuAbg5vU7rIrNuxlBnOBGn
 Vv60st+A07+e05HhXxZLa8jj9/ibExYpJPFQIQimp1iZXQhG4PcQj2cw0rFPy6MwP7vk
 XxQ6F25NFfb7Mp12IjmsdfIT1Yt4lORNbARtQG5ONu8S2GR9tuLu5n7WYVZ95oxKPuAb
 e9EKQ+KWOAMokBFwR7J6xT2W8SydRjBdB05sQQ0hN76z2UzHoJ22IO4lcMbDVFS+e2xn
 d01V/0dhcLBZCTwAetb8ohkcesHJMfiq2o27tMH6RtDAwY8LiostR4C12ZoYyxa/5UMK
 dwRg==
X-Gm-Message-State: AOJu0Yx0XDTxurUTv8sb8vVp3Q6WA67YFAchxfmIWKXBFY1NxrG/ylhM
 nveNVS1D4NVoglCXkAz3PPAVsrQAszdMHrDy9vjZbW/JwI+hxlThsuNJtge5ta//RRfooD3MzDA
 L/E7kwGnrURkxqsx0TFPt7M+KCKR8cw2VJUedLiLOr9aE
X-Gm-Gg: AZuq6aL2weqmpQI0mDLBQ0AY32CQ+UkrknfqL2dbQa9hBuwQWbjpCyfNivY8DBCpeuz
 3QDSSB7vuCjZly00cAs4CZV55ewfNE1T0Cfi/LmUgPORmoxtHe4LdRdzkdwTkXzapnCsmYHc6EW
 /SkS4rGiauCSXGyCdpVTBDR+kmRUyepAdfeFqIGavCaaHNbWLFXRMuWk/uz7WTePLkXGuz2Im1A
 C9zBnubarqgCDESEtQv1EWqhJ4SeigWnQmVUaHFtqpqgqCxGPCdebB0PdM0MMBk2JD8f30BGb2s
 /bmtA38bvYAUm8/kWc1kEakjaJxm+XyCORheKqm3rAAso/2fvXuSJNavF8I/LvZTINPTLYa8dMC
 DJCKj4oAGZsw6Mw6Kkdyhf9TfypeDndqD8QFRXUh4EQ==
X-Received: by 2002:ac8:7f8e:0:b0:502:f26f:1381 with SMTP id
 d75a77b69052e-505d22a9454mr110028131cf.61.1769979111314; 
 Sun, 01 Feb 2026 12:51:51 -0800 (PST)
Received: from cavan.codon.org.uk (207-53-253-74.PUBLIC.monkeybrains.net.
 [207.53.253.74]) by smtp-relay.gmail.com with ESMTPS id
 6a1803df08f44-894d375698fsm20409986d6.32.2026.02.01.12.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Feb 2026 12:51:51 -0800 (PST)
X-Relaying-Domain: codon.org.uk
Received: from fedora (207-53-253-74.PUBLIC.monkeybrains.net [207.53.253.74])
 by cavan.codon.org.uk (Postfix) with ESMTPSA id A8CC6FA3422;
 Sun, 01 Feb 2026 12:51:49 -0800 (PST)
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: dri-devel@lists.freedesktop.org
Cc: hdegoede@redhat.com, Matthew Garrett <mjg59@srcf.ucam.org>,
 Matthew Garrett <matthewg@nvidia.com>
Subject: [PATCH] drm: panel-orientation-quirks: Add CHUWI MiniBook X
Date: Sun,  1 Feb 2026 12:49:33 -0800
Message-ID: <20260201204933.2816510-1-mjg59@srcf.ucam.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[ucam.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mjg59@srcf.ucam.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2AD7EC7381
X-Rspamd-Action: no action

Add a panel orientation quirk for the CHUWI MiniBook X

Signed-off-by: Matthew Garrett <matthewg@nvidia.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3a218fb592ce..dd3be706d121 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -283,6 +283,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Chuwi MiniBook X */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "CHUWI Innovation And Technology(ShenZhen)co.,Ltd"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MiniBook X"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Dynabook K50 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dynabook Inc."),
-- 
2.52.0

