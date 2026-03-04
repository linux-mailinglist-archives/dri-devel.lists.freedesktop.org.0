Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIYAKMVnqGl3uQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:11:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C92204EFE
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB2210EA2C;
	Wed,  4 Mar 2026 17:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E8tRBpPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AB610EA6F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 17:11:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-439af7d77f0so3663985f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772644287; x=1773249087; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6+ERZG98Y+SteZfiVlR3jzzX4R2QxjyojMlsxgWSx7U=;
 b=E8tRBpPX2OOLhdVvYP3DcJi2thxfGaGLZFsrwatfmFMp8tERs5BGKohXFvx1QTbef4
 AK7/WRTv0vOkPlKGZivy+Qx97RO0rrYBcDeOZC9Jmzm8jlqLChUqAPi5cYdqaLCCzWDN
 JdxNaduZyCQspe1V4si9cgOEjDhgsLQFrc5hSQBy/bRcvHv6yZSrxBqUOhS033ZOSdyd
 FL6OLTRq3hQydJSe5T7yLf8dtAWuPYREsWtibbp44vqAwoyIiMARZGRm1jpp1lEFAg/g
 yg7OmlGXyoWneSuUZdh6n4VE75OMFun0rvXYL/5ea7iYw8Df9eDQGj+2q2+Zg49i6OW+
 pA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772644287; x=1773249087;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+ERZG98Y+SteZfiVlR3jzzX4R2QxjyojMlsxgWSx7U=;
 b=oIFsFsqZdPi1RujzHdxbLaQJEpyrF3ngWfRIytgFes/Qila5rahZC7vVhYljaZfztN
 K7OJrs7OP4C14x92jwct9g8IQMFz/sCZqTLIj7Lsm52E0krLucS0kYq7HwvR9DIuUJM+
 kUIjeRJtNxfnEgNWqqxEIDMGPnYrOM8FhJIhytATRnK8DQ7V+eAv0f1C9/rv4iUeuRev
 JEET5j5ZlI5YQU8iNYDmLMsFhJ8oZexULbLsoJohaI9l0TxbSM9zuqgaE7OaiJLu8oMp
 jBzGBmHYgx2jPi/QuJaIVHYMqFqfpS+sQgisPcZqfiRBb+wmvETkSDsZFCih310Hzakk
 q+eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrF+G4ZPoqyjRFP9jvZMeJRV/BtDVpiS+sqvhuc6r2Sfvq1qf4t9ZGTiFNtsHlcQq11ZpulyM5loE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww6O/k0HxghxIHPysjTOu6xZDhE1VBQDvKRUhVTq5g4WVJrE2i
 onZGho32cRJDAreJJSSZpQXYzETP8V3CDDkb4zjz/mgFZsBx9x6uKqvwU3pWRNIK
X-Gm-Gg: ATEYQzyb4Li4DiHbD74X7MF0vCCpG9woXVDBI2CYQT+MjecoY8D+Th4rRlsWDNAGj4W
 RCKDsx2NUVpWjz/VJJynawxItvBQ+mw+kzez2dCFwd80+zPXQCZ+MllBO+IFDLK76LzygTIqBOK
 oEFdu+58XNob0wSqAixgTqEIl5BYLUYUk/TpPiVFdp9sbkaox5nw/PIi5OPSVmLn6j2XsdMqCZ1
 jrB5P3ZDUXq1NyBTjml5sJtbMb2wRlATkBpS/3ZhoL5oEqSLgLUBS4Of8kPyPwj9clZwCpI07tL
 BxbhQVs/1iFnyY2GPFiG9rgi7LuzCrfAGalD4SO4VZqvci9jfPDarwNXsIOYm7eFc7/UwLaiUkB
 y+2N7e7w3xqvgCGfYv5WI1dDBwQbxg+u9pM4e+Be7dSkuCQRiVlaiISOHi1FWf0IdTRD/GqI1ZT
 xpavLtX2tuGSdRiiu/WCWR9txHoIge/g==
X-Received: by 2002:a05:6000:2dc3:b0:439:bf38:16f7 with SMTP id
 ffacd0b85a97d-439c7f7e3aamr5793716f8f.14.1772644286733; 
 Wed, 04 Mar 2026 09:11:26 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3007:da20:bc65:66ea:698d:4a44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b130abfasm27138542f8f.34.2026.03.04.09.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 09:11:25 -0800 (PST)
From: Amin GATTOUT <amin.gattout@gmail.com>
Date: Wed, 04 Mar 2026 18:10:42 +0100
Subject: [PATCH] fbdev: wmt_ge_rops: use devm_platform_ioremap_resource()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-master-v1-1-2bfeb1b9559f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJFnqGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNj3dzE4pLUIl2TlKQkYxOTZMtEY0sloOKCotS0zAqwQdGxtbUAA9j
 Lt1gAAAA=
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Helge Deller <deller@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Amin GATTOUT <amin.gattout@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772644285; l=1961;
 i=amin.gattout@gmail.com; h=from:subject:message-id;
 bh=fvm+1TuVEfBZgWEioDiGHAQkV9PHuQ2+SLQAWe7HMDg=;
 b=iKDzURGU6c9p1RaVBuYzo76POHmO10cJlkMXVJt7qWoZi/pfdEawYK9LwvspVtgF3iSrXLohY
 M5lAcaB+zeECKSvVIgxHTKrJ37eI8XvJ0JFwlCpZmwOaJkDiLWf7nBg
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=C9HM6Jf5d9dPl9fnP9pM/nhMwm+c280ldqYZ0ESu3a8=
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
X-Rspamd-Queue-Id: F0C92204EFE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alchark@gmail.com,m:krzk@kernel.org,m:deller@gmx.de,m:linux-arm-kernel@lists.infradead.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,m:amin.gattout@gmail.com,m:amingattout@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,gmx.de];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[amingattout@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[amingattout@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,lists.freedesktop.org,suse.de,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Replace the open-coded platform_get_resource() + ioremap() pair with
devm_platform_ioremap_resource(), which requests the memory region and
maps it in a single call, with automatic cleanup on device removal.

Also reset regbase to NULL in remove() so that the single-instance
guard in probe() works correctly if the device is re-probed.

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 drivers/video/fbdev/wmt_ge_rops.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 2bd26bfb2b46..0cf78bcadfa6 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -148,25 +148,15 @@ EXPORT_SYMBOL_GPL(wmt_ge_sync);
 
 static int wmt_ge_rops_probe(struct platform_device *pdev)
 {
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "no I/O memory resource defined\n");
-		return -ENODEV;
-	}
-
 	/* Only one ROP engine is presently supported. */
 	if (unlikely(regbase)) {
 		WARN_ON(1);
 		return -EBUSY;
 	}
 
-	regbase = ioremap(res->start, resource_size(res));
-	if (regbase == NULL) {
-		dev_err(&pdev->dev, "failed to map I/O memory\n");
-		return -EBUSY;
-	}
+	regbase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regbase))
+		return PTR_ERR(regbase);
 
 	writel(1, regbase + GE_ENABLE_OFF);
 	printk(KERN_INFO "Enabled support for WMT GE raster acceleration\n");
@@ -176,7 +166,7 @@ static int wmt_ge_rops_probe(struct platform_device *pdev)
 
 static void wmt_ge_rops_remove(struct platform_device *pdev)
 {
-	iounmap(regbase);
+	regbase = NULL;
 }
 
 static const struct of_device_id wmt_dt_ids[] = {

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260303-master-4dbb344c9a39

Best regards,
-- 
Amin GATTOUT <amin.gattout@gmail.com>

