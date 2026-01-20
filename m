Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJguC9asb2miEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:27:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840A7477C1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109DE10E5D4;
	Tue, 20 Jan 2026 12:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uld3qKNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BB010E5C1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:37:49 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-81e7477828bso2880791b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768909069; x=1769513869; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k6Xceg2OD/lxCrNfx6j5iuRJOA2fkoLkdUN/b0QbNS4=;
 b=Uld3qKNje/3liW9LcFFlpZ8Mb1B4/GgEgkBgNCzcszVVr7rEzTqd38XHsDRY/K5Oqf
 KalgesKoAwNxAyweI7SS8SwqAsql6xaz1zuebCjEkmwEecFEnLR7zV42Hh+d4gpgFWGi
 HENDESIvEXZL8rtcKulDdlYLtwkzTl0cLiAgBsgLO/oMf7+8JNOnFy5hKTK051Gkk2I+
 dIc/sHDiF4Iwu9Fpf3+35EVoRg0CQNsPq/ByFsXfQPRDPCCefRPKJTZFwZ4ICk7rpSa5
 5ViNkNdD2rXWSwoBtNDZDY4IFvD0nIFON2dEFkgXIt9YZMUhXCJdNsGJQoJge2MADsKb
 9lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768909069; x=1769513869;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6Xceg2OD/lxCrNfx6j5iuRJOA2fkoLkdUN/b0QbNS4=;
 b=AUbTBJiuET+qD1xh4p2jd/72cXERAmBiBnMyli3YOVxycQ+MkvSoIcNH3sxsvVkR5m
 I81yYnERahZ+SyBSyska5xM4NdOp33gzSHeBHi6fr3Kg/6aEKxF8NJpwCCeKMuDhKzs1
 RwSixaEKV0zv3CTs1QRxI4dw28tJQ+Pq8u8ueGC0MO3KFeqN8Hxalbn+bqkxexfvSPIz
 c2MKn6JtDZam+ru+32fpnlCF7GbNB5LeBE0eWKi7fRobdLtG6ZKleiItW/qdd77zou7v
 TRNAh+NsmWBzT78GQusTNO1Ai3hQUu+fs8QCloeb8exYkdpFtTwty+oc0QJQXpoxHtZi
 9zKA==
X-Gm-Message-State: AOJu0YwQF0RDukn8VvRe6UwY6oxMcpL2QhqbIjkXeZ+PoG1Aim0MCGTh
 2KbP0Yxmn0iiDibQmisyqREyrIgJAA9muIfFqCAafPor7pImenYQ2U70
X-Gm-Gg: AY/fxX5hBe2tvJhTfFbYc9qi2oaX1DyQGWePvM9iEDSEciZRXs2stI21ANuI35VHlRY
 JRDllHLSr0nDcXEVewTYNlOTAeFbMSiGon+d24o7vYyHsurPuFol7j9lcTbZhE6oBa6EJEPeSct
 iMn8ClpcsAfv+sqZuFxEfiFTXe+EBGGiDfGwCay+/RFFtl5+RZmv1JjPENNiZCPAQ6C9pfnCCQA
 AgR+TyfjiVUB9hV5Wn3PBLuKK0ETagDYBdZLZJp1mbGL3Giy1qxOxcl+IFmMTxVDNdeeXJawNhs
 DOjGmtgepKGIBrA2PpR3ITjbOrvga8DOqcBPeicqavpnzv+cB8L1jKqCw+ImFZVBtRtvs3eWWUg
 vex+CXxXFVO3w2EzAd2MPDCsmZqsqgib7C+NI9wQd87Re/dnEdiJTcYfh2QIdFwAPs92X6bqT9O
 YZZYgsQ3IH2PFb1ZwqQeHS375vwg==
X-Received: by 2002:a05:6a00:929c:b0:81e:4a9e:f809 with SMTP id
 d2e1a72fcca58-81f8efbbe25mr13964911b3a.2.1768909069116; 
 Tue, 20 Jan 2026 03:37:49 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:9fa0:1400:5c26:1419])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c5edf264b9csm11462134a12.15.2026.01.20.03.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 03:37:48 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 20 Jan 2026 12:36:59 +0100
Subject: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
X-B4-Tracking: v=1; b=H4sIANpob2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMD3dyS7JTiTF0jy1STZAuTVPMkYwsloOKCotS0zAqwQdGxtbUAlxA
 E9VgAAAA=
X-Change-ID: 20260120-mtkdsi-29e4c84e7b38
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909063; l=2852;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=ETsLcSZWKB9eq3Cr6keAewRWPWzheGP6F9hf6pabzj8=;
 b=vFf5Qdlbwe4FiGiI83Db84ydmZAaWLQ3TMiZXuLTGwCAwsOUAzY4UJTj0cTS0qPmPPd3VjN5F
 RL5WhoIxZDkAMo+KcW2ej0+SI1Sze9wVe2bNPa23aYLM49ontoyVwcq
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-Mailman-Approved-At: Tue, 20 Jan 2026 12:11:05 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:bisson.gary@gmail.com,m:matthiasbgg@gmail.com,m:bissongary@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ffwll.ch,collabora.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[bissongary@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[bissongary@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 840A7477C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some bridges, such as the TI SN65DSI83, require the HS clock to be
running in order to lock its PLL during its own pre-enable function.

Without this change, the bridge gives the following error:
sn65dsi83 14-002c: failed to lock PLL, ret=-110
sn65dsi83 14-002c: Unexpected link status 0x01
sn65dsi83 14-002c: reset the pipe

Move the necessary functions from enable to pre-enable.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.

Left mtk_dsi_set_mode() as part of the enable function to mimic what is
done in the Samsung DSIM driver which is known to be working the TI
bridge.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0e2bcd5f67b7..b560245d1be9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_dsi *dsi, u8 irq_flag, u32 t)
 	}
 }
 
+static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
+{
+	if (!dsi->lanes_ready) {
+		dsi->lanes_ready = true;
+		mtk_dsi_rxtx_control(dsi);
+		usleep_range(30, 100);
+		mtk_dsi_reset_dphy(dsi);
+		mtk_dsi_clk_ulp_mode_leave(dsi);
+		mtk_dsi_lane0_ulp_mode_leave(dsi);
+		mtk_dsi_clk_hs_mode(dsi, 0);
+		usleep_range(1000, 3000);
+		/* The reaction time after pulling up the mipi signal for dsi_rx */
+	}
+}
+
 static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 {
 	struct device *dev = dsi->host.dev;
@@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_set_vm_cmd(dsi);
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
+	mtk_dsi_lane_ready(dsi);
+	mtk_dsi_clk_hs_mode(dsi, 1);
 
 	return 0;
 err_disable_engine_clk:
@@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	dsi->lanes_ready = false;
 }
 
-static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
-{
-	if (!dsi->lanes_ready) {
-		dsi->lanes_ready = true;
-		mtk_dsi_rxtx_control(dsi);
-		usleep_range(30, 100);
-		mtk_dsi_reset_dphy(dsi);
-		mtk_dsi_clk_ulp_mode_leave(dsi);
-		mtk_dsi_lane0_ulp_mode_leave(dsi);
-		mtk_dsi_clk_hs_mode(dsi, 0);
-		usleep_range(1000, 3000);
-		/* The reaction time after pulling up the mipi signal for dsi_rx */
-	}
-}
-
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 {
 	if (dsi->enabled)
 		return;
 
-	mtk_dsi_lane_ready(dsi);
 	mtk_dsi_set_mode(dsi);
-	mtk_dsi_clk_hs_mode(dsi, 1);
-
 	mtk_dsi_start(dsi);
 
 	dsi->enabled = true;

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260120-mtkdsi-29e4c84e7b38

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>

