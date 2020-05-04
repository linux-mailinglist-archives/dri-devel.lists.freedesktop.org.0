Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D771C3385
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 09:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E899D6E32F;
	Mon,  4 May 2020 07:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A646E326
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 06:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588574124;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=7AJE0t3Ye2JtIPldifxdO7zQhwDUrIcXjVkKWVxf02o=;
 b=FU3xxPGBFinwak7esbXgc5FDijgE/QXr6IrTYQk6UW8bbCWSktPlsinHqgviHr7c1P
 IwXHBntsItAZFIRs7817FSFgZDGGvHLZqMXcZbn1XE0kmJkV86/n8yWjonb4LGV7SBx9
 f69eLFzYKLN6ZUco5ZjKhVWA9LNzuoql+BkHfzxlL2gBarbvdmI1SJHN6/00jz6VBI3E
 dgLcflrt1YykUdN6DaNIFlytWNOiHVk265mvJH9DsUoZrQtGCPR+9KhU9Bc9MH38P2Sd
 3QK9NR8gwHNee14Bo/crcmm+9kvkfgNSUVp8EDTr2HpPH3kbku1ac24T9BSVkT0pwfn8
 FY1Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CPNbw="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
 with ESMTPSA id R0acebw446ZCh4T
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 4 May 2020 08:35:12 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Boddie <paul@boddie.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: ingenic-drm: add MODULE_DEVICE_TABLE
Date: Mon,  4 May 2020 08:35:12 +0200
Message-Id: <1694a29b7a3449b6b662cec33d1b33f2ee0b174a.1588574111.git.hns@goldelico.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 May 2020 07:17:19 +0000
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, stable@vger.kernel.org,
 letux-kernel@openphoenux.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

so that the driver can load by matching the device tree
if compiled as module.

Cc: stable@vger.kernel.org # v5.3+
Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx SoCs")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 9dfe7cb530e11..1754c05470690 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -843,6 +843,7 @@ static const struct of_device_id ingenic_drm_of_match[] = {
 	{ .compatible = "ingenic,jz4770-lcd", .data = &jz4770_soc_info },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
 
 static struct platform_driver ingenic_drm_driver = {
 	.driver = {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
