Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMW2M0A9qGl6rQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:10:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E8201034
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAD210E0FA;
	Wed,  4 Mar 2026 14:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ck/QOp0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2026 14:10:03 UTC
Received: from mx-relay49-hz3.antispameurope.com
 (mx-relay49-hz3.antispameurope.com [94.100.134.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA7110E0FA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 14:10:03 +0000 (UTC)
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6,
 headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2qgonF5w2c8p56bKXYWtL97G1fsfaN/h16mnAE/Q9wM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772633074;
 b=prpTLBGILiyIpIgSh9jDqbSLUFIDG3SG62BFHjtzCAelyD14o9vNB1ntLgeXNj1iYEd6vT+C
 Pe+WEhBEzM0OPMm2aQusFRqJ01Nr3AGBpYd838aleVGvlZoXHqf3nld76RDVhqJaKvj5PP193ok
 Ox4e0pkeHm1w3PDPYdbui3PhYOKMEM4uvWzLd6oaIi6I8yumN5pUWXN5q7v88WWGpVC22Jpantt
 46j4fef1686Je6oNMyq7JqV7q0Lc9iQciF9ZGPuMH9b13w2Saf6FHSpqgYjC7R/uVH4iSfq/Tzj
 DMSvWkNO7C73K1iRs4r7uKfWbXIN497l2KzoiJE2uoL1A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772633074;
 b=nCYgy2df5Smb6e6nwjk29KO7SurZ8ohTdyNu9sm6PMa50UDO3VCqT3PIH2WAcMiVa/xAVZD9
 +Mt5dXirxg3YUv+fydpN/tzRZjMHyYYejmkl4tqJ7bjLnnF4Qyvsg0nhrIGgxTLNTEz4nf4K13Z
 jJ0ueRhjbXr5tEjbHQlLRFJjv85zxbq6qjEBrURmeYfJZd2OYNRvagAfonN7L3gLp9dbYkBiw3G
 iaArlVXKcj7aZDmdudCK4RduSGEqT9st9zfMEUlUDLi8A9cVNarqS1+YT7ilQl9YJGKRIP6FrGR
 bImYDai2GnJIuD4isf1V0fl4znpJANus7pwJ+92Auki4g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by
 mx-relay49-hz3.antispameurope.com; Wed, 04 Mar 2026 15:04:34 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net
 [82.135.125.110])
 (Authenticated sender: alexander.stein@ew.tq-group.com)
 by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6AF095A0A7A;
 Wed,  4 Mar 2026 15:04:28 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 1/1] drm: lcdif: Use dev_err_probe()
Date: Wed,  4 Mar 2026 15:04:25 +0100
Message-ID: <20260304140426.1499446-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: dri-devel@lists.freedesktop.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for:
 alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay49-hz3.antispameurope.com with 4fQvYT2nvYz3ynSL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1,
 IP=94.100.132.6
X-cloud-security-Digest: fbf676b47f4878b0afe26766cd0a8878
X-cloud-security: scantime:1.444
DKIM-Signature: a=rsa-sha256;
 bh=2qgonF5w2c8p56bKXYWtL97G1fsfaN/h16mnAE/Q9wM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772633074; v=1;
 b=Ck/QOp0IArAZPwNjZiTkEmYfqUHfiIq1K+ZhFN4CrQ3D9IgNltTCLwBJJSq3dCHB/c2aUEN4
 +vnOlZ0JKoLb7eoHfmFp04eaNX4aSQNpVFGO1rf9zgkSP0oDu8feF4R2gcK8+Y8+iWVdiuo2zhW
 CDWRkEZgf+Ic+24rjGCpdN6BJHYk3x3/RxsYbGFjy6utV1LECsP8RGGXCgxkiM5Jd5kKAHGsq/R
 SGnW7GeddlyD6yCAIJOf+M3OWXs4tG9fnS+OcoMTyCApkpgtVyZm6X0k5wRECuyBEsNeD5pUo1i
 fzle54YcpgbwFXqol1ivY45/+xK7PzQTt3/9t9+Bga1pw==
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
X-Rspamd-Queue-Id: 218E8201034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[hornetsecurity.com:s=hse1:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[alexander.stein@ew.tq-group.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:marex@denx.de,m:stefan@agner.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:alexander.stein@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:victor.liu@nxp.com,m:m.felsch@pengutronix.de,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[denx.de,agner.ch,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tq-group.com:email,ew.tq-group.com:dkim,ew.tq-group.com:mid,pengutronix.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Use dev_err_probe() to add a reason for deferred probe. This can
especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Collected Frank's R-b

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index fcb2a7517377e..47da1d9336b90 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -149,15 +149,17 @@ static int lcdif_load(struct drm_device *drm)
 
 	lcdif->clk = devm_clk_get(drm->dev, "pix");
 	if (IS_ERR(lcdif->clk))
-		return PTR_ERR(lcdif->clk);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix clock\n");
 
 	lcdif->clk_axi = devm_clk_get(drm->dev, "axi");
 	if (IS_ERR(lcdif->clk_axi))
-		return PTR_ERR(lcdif->clk_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
+				     "Failed to get axi clock\n");
 
 	lcdif->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
 	if (IS_ERR(lcdif->clk_disp_axi))
-		return PTR_ERR(lcdif->clk_disp_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
+				     "Failed to get disp_axi clock\n");
 
 	platform_set_drvdata(pdev, drm);
 
-- 
2.43.0

