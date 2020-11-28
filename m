Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D82C7C37
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE9C6E3F7;
	Mon, 30 Nov 2020 01:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 593 seconds by postgrey-1.36 at gabe;
 Sat, 28 Nov 2020 13:03:32 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3346EC7E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 13:03:32 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 6FAA920E81
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 12:53:38 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 93395260EC
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 12:53:34 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id 485993F162;
 Sat, 28 Nov 2020 13:53:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 6A7EC2A0E7;
 Sat, 28 Nov 2020 07:53:31 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1606568011;
 bh=haVbWWtOlmfffJSZ2e1CSTbj+zcqJYd/xyQWDJ2MCtk=;
 h=From:To:Cc:Subject:Date:From;
 b=uTPNSS3uTThsnAL3ljU2Y3pHsA/OFScmEHqRmeNAYR5/+V5+ohz6XiW9oTcKV7D3q
 1CsOzpW7Fun6vhY4ZD5amyC4Fuld3Qvw4MafbyIP/gWiDieqG3VjfeMqXBKHnj35HQ
 H2DxPVB0rYqBxyRXYiTQhNUhWsZoxdDNkR8sjf6Q=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbM23_V9wgP1; Sat, 28 Nov 2020 07:53:30 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 28 Nov 2020 07:53:30 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id C0F53400D3;
 Sat, 28 Nov 2020 12:53:28 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=aosc.io header.i=@aosc.io header.b="Q+2gjec4"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.160.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id A1AFB400D3;
 Sat, 28 Nov 2020 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1606568004; bh=haVbWWtOlmfffJSZ2e1CSTbj+zcqJYd/xyQWDJ2MCtk=;
 h=From:To:Cc:Subject:Date:From;
 b=Q+2gjec4r2+daWzwCGSAM6bOPavOPnTSgDAi8khHoeQwlB1IzUqFNk3OnF+dRVZ9S
 vAWJATwxnu6aSrEcrREzsZhuQGl4TR3XjHHVqhD2pPfBVXSvGa+qeZJELIGOt8rIsa
 iXwHTlvRZJ+w9ZpD9mTrDAaPHx6Pl54mwirbLrQg=
From: Icenowy Zheng <icenowy@aosc.io>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: feiyang-fy07024di26a30d: cleanup if panel
 attaching failed
Date: Sat, 28 Nov 2020 20:52:57 +0800
Message-Id: <20201128125257.1626588-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: C0F53400D3
X-Spamd-Result: default: False [6.40 / 20.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(0.00)[~all];
 ML_SERVERS(-3.10)[148.251.23.173]; DKIM_TRACE(0.00)[aosc.io:+];
 RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[amarulasolutions.com,gmail.com,ravnborg.org,linux.ie,ffwll.ch];
 RCVD_NO_TLS_LAST(0.10)[];
 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.160.1:received];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[aosc.io:s=default];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DMARC_NA(0.00)[aosc.io];
 MID_CONTAINS_FROM(1.00)[];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
 RCVD_COUNT_TWO(0.00)[2]; SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: mail20.mymailcheap.com
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Attaching the panel can fail, so cleanup work is necessary, otherwise
a pointer to freed struct drm_panel* will remain in drm_panel code.

Do the cleanup if panel attaching failed.

Fixes: 69dc678abc2b ("drm/panel: Add Feiyang FY07024DI26A30-D MIPI-DSI LCD panel")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index 581661b506f8..f9c1f7bc8218 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -227,7 +227,13 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = 4;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int feiyang_dsi_remove(struct mipi_dsi_device *dsi)
-- 
2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
