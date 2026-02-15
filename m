Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HH7FOFXkmm9tAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E4B14019A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D2B10E0C0;
	Sun, 15 Feb 2026 23:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wIZ3YJWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C164310E0B7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 23:33:48 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so33114735e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 15:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771198427; x=1771803227;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=riZ6PWdFfyeNlDheq9J/VZWbSjXQ8eOOU0u+w/mWLKY=;
 b=wIZ3YJWR2jLPQwkY+PLiBtbLCuKWIadFLfTrKcMnQ54TmyFPSEORwPhf7YVobD2+mZ
 CKsafwTISq61rE9LrlywFl3+c7XtbEq/zO8gKDI3BiLpnvbcdQNvBU5+YMoo0o8AvuNs
 OQPeML97ovydTz6fzhKFGlZ/nTRiLM3tW9KNHa5iXCc4OJo9tH08sEkzm/ckY+QcAV13
 98IKceWPG7JeA7Ttj/89XNEExuTJLeTO5yaIkY0RRi0+j9qAOM/L/a1bQ7BY4ImRz89K
 EJLos+Rx5PrS7FRvB+45ubuProV+pCC1kdR17uxtyXKEVRuXG2ZL+GhAANRe3MXupMeZ
 cnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771198427; x=1771803227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=riZ6PWdFfyeNlDheq9J/VZWbSjXQ8eOOU0u+w/mWLKY=;
 b=c3tB29zzO5xHpBq67DAXFXhGG90aG58mbhin+gsJDLDr7dR4V+IgqUJ1SO47wTCtkv
 h3XFJ+GmSmFkNqBItSt16XBDuH+Kh/Xahdm3vYve+F4i9S8h3XWerh5Nyxj+f7pIENPo
 VUBoludyMex3N9NZwLFTgMgo3tsV8ckDvkksC5a2ZVNdtC1XDwb5My3jdu4BLJXpsQHv
 ePyeGjA+AQysD12oMcq+Afq5GkHKEMQIfKz/Bc3wSYx+1AYo858cvzztJAsgT+pGwwS9
 w0EcCNZRb5klA08LDH3sHyWRDT3he854hsXBdBuKWBxiJZQli0XOmGokA9dIAPZ48K+d
 qCKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJp+KNfJPppM0F+i6b55bUc505kPRyeiRECAaRsvca1U89IuDmQs/gyDi35v/mi6c/qAX+nKZKcSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6a0+wkcXY4lRdcpdxCUJDaLa3GCz5Mqe9OehHaJRuoxc60WUl
 +t34rm2aJDS2gBkncNj317r6HSv0TfND59jZs8fb2Ly5yQo4TYuICkI15bPD/xZeeiU=
X-Gm-Gg: AZuq6aLfvCzioNnQMWxTC2gsDZW0X6tAcK9MB8rYMiGoD0rU0NFWgFsW/YgkEP0XJOM
 kvzb3hpU9YZyH7/QKQ3/+MFNQz06cda54KS3gQEaL5m0DSZ2fRKbNFSq/9KBtmfu7uOs5cKkJGd
 9nVX1nw1M/TenjhCIu8fW34i22wxrOLwToeVDfsu9NPin30/aYOVcE2DR0I5syFaN0r6VgY9P+e
 9xvpYP1QmxCiMTvX78Xh+guGPkBnbmxxxSnxuf9VaCHmtLvrmHJhik3BQCLo0ANJghubOPtqk3k
 Pbor7yWO1btYc5/fzmx2lT6B9cHhjZ1PVEYa0qr+wDIxI2z7ERJY9GAJBLZVYfRzOQeL1dkjwHV
 DmB0Y5SmIGrZNPRC1dtqgRY+5EV1Sw7o+7xLe6RYhERf7Ez2UweAoO3dc3P8fxyuulOce5mywNv
 fT4djDzb39vEfnMHNYBr6Yo83U5pjh
X-Received: by 2002:a05:600c:8b32:b0:47e:e59c:67c5 with SMTP id
 5b1f17b1804b1-48378d7250emr126740185e9.8.1771198427340; 
 Sun, 15 Feb 2026 15:33:47 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43796ad112bsm22934376f8f.36.2026.02.15.15.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:33:47 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/7] fbdev: au1100fb: Use proper conversion specifiers in
 printk formats
Date: Mon, 16 Feb 2026 00:33:19 +0100
Message-ID: <67e84da83038879b933c3c40a3715c2ca82a4813.1771198101.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
References: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2019;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=C+TkgfpREa8zIVzwPsqZ+/CMmjGONBaTrnA3gNijQlo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpklfEdt8klR1hZb6Sfbm5eRG4XF5wQH2rt73y2
 XmGiszbXzeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZJXxAAKCRCPgPtYfRL+
 TqQFCACcqZCdYcACZnKLN5Af2fitxAn5w9sPoYdRoIUuln7Qx55503VKvU5tCcQoeejdWT2ccR5
 89msNoXlP8uUh9/B/+1Pa5orfqRDdC7aA6u0BA8RowS72J3xrGUSbZWa1EArGfxR+5l7GQVWfdx
 boWk1NhDNVTGUNXX8taTGpm7k8DTSS2HTuTM2oeKzAGn3zxWfEMP9q4ALSZT7dWR9Oox0q+vY2m
 f/f/bXYI0UarJsZNKf8gmVuKO/vXFhkjy9kjbNIrUKs0UcfSjgXwwW+PL9RN4s/8eCJrrfY7ktm
 DqmeQ8rwnXcgwEIi9E6OYzT0W62r5SGpXdSsfjZJBslcWaBS
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 05E4B14019A
X-Rspamd-Action: no action

%zu is the dedicated type for size_t. %d only works on 32bit
architectures where size_t is typedef'd to be unsigned int. (And then
the signedness doesn't fit, but `gcc -Wformat` doesn't stumble over this.
Also the size of dma_addr_t is architecture dependent and it should be
printkd using %pad (and the value passed by reference).

This prepares allowing this driver to be compiled on non-mips platforms.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 1abaa8e81315..398375793f57 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -440,7 +440,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
 
 	print_dbg("Register memory map at %p", fbdev->regs);
-	print_dbg("phys=0x%08x, size=%d", fbdev->regs_phys, fbdev->regs_len);
+	print_dbg("phys=0x%08x, size=%zu", fbdev->regs_phys, fbdev->regs_len);
 
 	c = clk_get(NULL, "lcd_intclk");
 	if (!IS_ERR(c)) {
@@ -457,7 +457,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 					    PAGE_ALIGN(fbdev->fb_len),
 					    &fbdev->fb_phys, GFP_KERNEL);
 	if (!fbdev->fb_mem) {
-		print_err("fail to allocate framebuffer (size: %dK))",
+		print_err("fail to allocate framebuffer (size: %zuK))",
 			  fbdev->fb_len / 1024);
 		return -ENOMEM;
 	}
@@ -466,7 +466,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	fbdev->info.fix.smem_len = fbdev->fb_len;
 
 	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
-	print_dbg("phys=0x%08x, size=%dK", fbdev->fb_phys, fbdev->fb_len / 1024);
+	print_dbg("phys=0x%pad, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
 
 	/* load the panel info into the var struct */
 	fbdev->info.var = (struct fb_var_screeninfo) {
-- 
2.47.3

