Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAcyC9LSpmnHWgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:23:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A6E1EF53B
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49FA10E041;
	Tue,  3 Mar 2026 12:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MgfVUSaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B39D10E041
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 12:23:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso46188755e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 04:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772540618; x=1773145418; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xJ7JLm9HHhra60wi72CXzKV/8KnCXZClrEsgloI2Vjc=;
 b=MgfVUSaTK7fr2yQJnati/Jpg+Wp+9rLLqbRu9FzcKR7O0aBN5ACMZDy5em+wAHOr+/
 wzg1Md6qD1h+aFjTtmjel7Dc6xh0+j92Cr/L8GE5Nb2rTP5xW5EEfMn7oErG3e9HLWu7
 fXBM2NWoS28PVq8II1lNFWPl8DrdLku4gdHK5FWTsL3Pjtr5Hkzj85In3ErJvHSNphjK
 i44U322dwl3+N/rE8nbGp3u3dcatzrW9QBuV/JKtH0bmvtO3uT6GcF7QEroyEkgM2bNt
 z0awBsHeZXRDWxH/BQDM8v5MVOBgbJO03EziTweHwct+seUAIFAi1jwTWL8Ifx/JjnLj
 YqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772540618; x=1773145418;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJ7JLm9HHhra60wi72CXzKV/8KnCXZClrEsgloI2Vjc=;
 b=dAff/btKZi1ieBBptdX1mQWrZxXfal5JIvvS9ssqM9JB/PMqWBkBNx1ngl4BM6oke7
 TWZYA5L0TCph4DMfUfbyFsweGhQ7rpX4Z+Sm2xaAus3FrbbUcF2EbXTi/idzqM+1Bcch
 eIlVCQZ8nXxQfx2VEwZ/KVffAHAJnnL1B7pPBeSxqIgFbqYeu7ErIvr4qVbANjbN5RYt
 VWwU0u6hPeFRUTIwcPZFYJ9tOp3wuci/VhR3JyaeYqIrX+XwkjXZLX6HqiOGiDP38U8d
 S2f+luGjz3gjzzf1eL6EX09IaRAe/Fun3Xw/avPUKT+aB/iyt/RRgBWF6yLc44KmdWqy
 36xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK7DAJoZH9z0t9MrwgAWc7K9xFp0hFtwTzaNN8mYLtdR0bbA24DAlC89DNwDgLYAFqiAxVpYM19/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG3WgL3TGVQRzOaI2scGYCJBxdcWqVd5cmBdIHDWUSD/4qMQOc
 vXEO8+sFJ8fzzlLh9c2UkejHMhyOxNk16kwyej09iAv26LXKCZnIXkX/
X-Gm-Gg: ATEYQzxDTlCAzL6DEQbsxkqBGvDvBmKoVy0Ic8eAQGQYale5RCsiE2y4JSfmHheLCHP
 xZYSpkcggccpAIdiVw03W7THQaNH/d2OFdZLE14Zn2Tij1XpNWiwfZ/CVgWdSbL+9mqPlwfayTz
 eXGEWDTB09PD+Ze4/LrHaEu5TTM7pQcI8BzI80SuscwgpAjkAZ6GhgsU8PrJ9Mm0/Lbnxzf1P8F
 7m/HmL0XGqXdq3NmSob+slBnRuYal2+z27h/78hf/emZ8NkVD5dZRbbIGLJ0XnzQ2WwySKGA9jP
 EV7HUvBhxmy/ZDQcFBEgT5fNJr1FcTZZQCjtLUAS3+E/ddwsJr8lVsT4OeK3V6204I/kpqRF1k1
 c/Sn3MQo9sN8EV6GgDl9FijQHQ2v1KA0iytwcrdA7a39Nqbz0eXWodGmS2igILD04oDU1LJcb5U
 uJ5oWINmdapsOCn7GlBDbTSksjnavwScNOElhZV5R8psb0IQGaFsmpY5CtrpRcow5jJXInH4YOA
 MQl+2914HXHuQa3rEwstHjR5y87Aw==
X-Received: by 2002:a05:600c:c16e:b0:480:69b6:dfed with SMTP id
 5b1f17b1804b1-483c9bf448bmr279884895e9.24.1772540617896; 
 Tue, 03 Mar 2026 04:23:37 -0800 (PST)
Received: from [127.0.1.1]
 (2a01cb06907588f0d6267e1b423820b8.ipv6.abo.wanadoo.fr.
 [2a01:cb06:9075:88f0:d626:7e1b:4238:20b8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439abdf5430sm23922899f8f.5.2026.03.03.04.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 04:23:37 -0800 (PST)
From: Amin GATTOUT <amin.gattout@gmail.com>
Date: Tue, 03 Mar 2026 13:22:24 +0100
Subject: [PATCH] fbdev: goldfishfb: use devm_platform_ioremap_resource()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-master-v1-1-85eb5ff584b0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH/SpmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNj3dzE4pLUIl1jE8NUcwODRCMzS0sloOKCotS0zAqwQdGxtbUAK/1
 wflgAAAA=
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Amin GATTOUT <amin.gattout@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772540616; l=1990;
 i=amin.gattout@gmail.com; h=from:subject:message-id;
 bh=VaG5WWK3PEEYYRL3hvYzQ6mrxETdljwGnFaNLiRNSxs=;
 b=lVG5GTj/mX7rh2hMdUCHq5iZE7MhF1bTee8t0BYfN09GJ89vBP26l4TVOoAE1jsdSg1Giabkj
 QwYhrCt0YB0AhEwqlZmAo/1x2BT/41wBlYN8eo3FyO+0xXO3to+ZVJc
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
X-Rspamd-Queue-Id: 49A6E1EF53B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amin.gattout@gmail.com,m:amingattout@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amingattout@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[amingattout@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Replace the open-coded platform_get_resource() + ioremap() pair with
devm_platform_ioremap_resource(), which requests the memory region and
maps it in a single call, with automatic cleanup on device removal.

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 drivers/video/fbdev/goldfishfb.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/goldfishfb.c b/drivers/video/fbdev/goldfishfb.c
index ffe33a36b944..c9871281bc1d 100644
--- a/drivers/video/fbdev/goldfishfb.c
+++ b/drivers/video/fbdev/goldfishfb.c
@@ -174,7 +174,6 @@ static const struct fb_ops goldfish_fb_ops = {
 static int goldfish_fb_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct resource *r;
 	struct goldfish_fb *fb;
 	size_t framesize;
 	u32 width, height;
@@ -189,14 +188,9 @@ static int goldfish_fb_probe(struct platform_device *pdev)
 	init_waitqueue_head(&fb->wait);
 	platform_set_drvdata(pdev, fb);
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (r == NULL) {
-		ret = -ENODEV;
-		goto err_no_io_base;
-	}
-	fb->reg_base = ioremap(r->start, PAGE_SIZE);
-	if (fb->reg_base == NULL) {
-		ret = -ENOMEM;
+	fb->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(fb->reg_base)) {
+		ret = PTR_ERR(fb->reg_base);
 		goto err_no_io_base;
 	}
 
@@ -273,7 +267,6 @@ static int goldfish_fb_probe(struct platform_device *pdev)
 				fb->fb.fix.smem_start);
 err_alloc_screen_base_failed:
 err_no_irq:
-	iounmap(fb->reg_base);
 err_no_io_base:
 	kfree(fb);
 err_fb_alloc_failed:
@@ -291,7 +284,6 @@ static void goldfish_fb_remove(struct platform_device *pdev)
 
 	dma_free_coherent(&pdev->dev, framesize, (void *)fb->fb.screen_base,
 						fb->fb.fix.smem_start);
-	iounmap(fb->reg_base);
 	kfree(fb);
 }
 

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260303-master-341e700a2699

Best regards,
-- 
Amin GATTOUT <amin.gattout@gmail.com>

