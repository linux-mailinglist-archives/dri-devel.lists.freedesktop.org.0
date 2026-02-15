Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKdRNt9Xkmm9tAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1C9140192
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63AC10E0B7;
	Sun, 15 Feb 2026 23:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M06O0gch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9962710E0B4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 23:33:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-483487335c2so23784515e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 15:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771198425; x=1771803225;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ivo/Wb4H9AjzUdzXBvtBO+/I7i8l2LirEG2mTIslkVQ=;
 b=M06O0gchpDc00SmtKDVkz/+c5LByUqXd+4xc25P+6ZbM5UJng6HxCpcvKxbXf9BPlh
 LWyD9n3MbMcPSMMjJYBqCfEgpCXfeRgTlamNhr+V5qNBCqLJj7c+aBLyHchbsKsTAm6m
 k7ys7CwMyvwj5YZ/Mc6pWVVLM5TiSY/WLj6Q6/Vt6cKz/eT4VBwz4uNra4NAGgssf3OM
 9yb0GXBGOG0x9kpXQ8pYolMVXv9uz/EUCq1+z5WAUv60Ux1mvuIeAoZ9DQmmtSoAu/8b
 HqY3jG0NgxsbVrUWxgsv8K5KuOxi/qc1XOxLiw32Jlaw6LE1mfTUebhYS0NgsZmQQGr+
 tttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771198425; x=1771803225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ivo/Wb4H9AjzUdzXBvtBO+/I7i8l2LirEG2mTIslkVQ=;
 b=sJ7ajbBq5xZVVMHRmRx0cus0eaP6VcYgTogZ3zRpXfSS1Osfgs3vcGE4X7pfK76W+C
 zSQtFmVfwebAXPhXsOztAJBILpjHA+KlRoIs1w+eTdJNjcakmxclcdyWP7Qhmc8Cep1J
 px63AQgoSXAgR+V6fdlsJIvHwI9pRlzTVAyV2UAr+4STWVE9HBRTqBlDWeFMDMGwEfTi
 xqV+kvRGIon1UjKpMkQv4Z+1esCJMTTlu8as+AQj4KQVOIw2ueW0RbowEt6KKuU0ax5w
 T8exFBN7m5YS4nqyVZRn2ZNzOpvrvt8/kcS4feLuR29sTHkY9e4fEmw6GyFqX5l6aFvX
 brKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmXl2ikm3jOY0obf/gH2Ph1HoRU43C4njBSaDCL27VcMA1C33KecY6cLE9yW1zd9EBqs3v7g1syY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5MOsGWuysQGKc7bzwmBa4d2tlat0O/iSIBzSr/edBRjWXuzq/
 lIO41exvskvXtQZpQUq4SG6kEQZWsaWMqnXEpPBH0smDcE6+0ApmEuFYUVWWcovDLw8=
X-Gm-Gg: AZuq6aKrZtlJx4UFvKPpTp/Q3L/YLDiFz573yV0cofOJtGoU4zRYuHjNie6LRTApXK4
 Y2bOxtP+0+WmbLuzrnsxzV7GIR1oIRNPpIIJ5I2p7U9sg4xLODPQ3/AZnbBv7Wz54Uy2yJk6K45
 AQGJb9ZYvfXWEai+kGtdzBWXyU8FwhpaB57EG9mQtqjx8r/keNrSLUDi+ZbU0KGZMZ0TUf4JoYg
 UYlUIi+rZsnX62gYLYWG/NCU3Vs+nQB3UkWkzCqKCvu/gifsGWW8soaPo/4qnCTOnVpuiSuvvaB
 FmlGPqWJZoIRhbWVGnpNB/k3WZj3rgnJMW1oMUTgsbdU+NvL2UDzGTvr73BvPc6qBfSgSnyfPFi
 3EgzxVvEzLPYtRcpA0ybOc6RKGYR6AwDR+GyUg2uG6rU2BR+UIplUYaJ86mOP80KfV6L1Oi4t7f
 AZoP8mEBTWUPVMqgCLZIj/r410XrTFHM7DtCU+5qs=
X-Received: by 2002:a05:600c:6989:b0:480:3a71:92b2 with SMTP id
 5b1f17b1804b1-48373a44055mr155545025e9.26.1771198425059; 
 Sun, 15 Feb 2026 15:33:45 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4834d82a4c4sm661803245e9.10.2026.02.15.15.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:33:44 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/7] fbdev: au1100fb: Mark several local functions as static
Date: Mon, 16 Feb 2026 00:33:18 +0100
Message-ID: <3c08f87439d503ade5a6c0a628ff23f1e32af91e.1771198101.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
References: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2959;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=cNISZOqeKk8QMk5edubEElUWhcYpjBpybGx8Xr4QHLk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpklfClP4HcN9n84CROa8hNaWVi+C24Wt3+Mh2+
 206HBosg5qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZJXwgAKCRCPgPtYfRL+
 TvGHCACQxypYsmo2xxRZ9jvO3UjvW8dFTUZQ4486H52AcIcTov/FuAOG6oOcNUUIh3BzACgp2Vj
 7s0K7IY1+5mnJZvKvJFUokOEFrbBJy7vXSRcZ/32Q4G86qfE+Lry3cbfrP5ywxsMiGRYBL9W7h4
 9uT5gUrOenc6yyaMzmg/bGZXnaiPAouustxStXI+SpcFKuz+hfGJcSzG8N/U3IvKO3vslLQbKpe
 FBuWn3OIG8vF0UDfZNnzTwjyZwSC0CkX3ltcwZoUixuYgjD3Dcr2UkWkP6DNrJbi8PAcBqPYnlr
 6pYnZs+JHMQZujtHc0YM56WEaIcAmCoEFgG4Siv02catdwj1
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
X-Rspamd-Queue-Id: 8E1C9140192
X-Rspamd-Action: no action

This fixes several (fatal) compiler warnings à la

	drivers/video/fbdev/au1100fb.c:530:6: error: no previous prototype for ‘au1100fb_drv_remove’ [-Werror=missing-prototypes]
	  523 | void au1100fb_drv_remove(struct platform_device *dev)
	      |      ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 7bc224a8455c..1abaa8e81315 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -120,7 +120,7 @@ static int au1100fb_fb_blank(int blank_mode, struct fb_info *fbi)
  * Set hardware with var settings. This will enable the controller with a specific
  * mode, normally validated with the fb_check_var method
 	 */
-int au1100fb_setmode(struct au1100fb_device *fbdev)
+static int au1100fb_setmode(struct au1100fb_device *fbdev)
 {
 	struct fb_info *info;
 	u32 words;
@@ -219,7 +219,8 @@ int au1100fb_setmode(struct au1100fb_device *fbdev)
 /* fb_setcolreg
  * Set color in LCD palette.
  */
-int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned blue, unsigned transp, struct fb_info *fbi)
+static int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned blue,
+				 unsigned transp, struct fb_info *fbi)
 {
 	struct au1100fb_device *fbdev;
 	u32 *palette;
@@ -278,7 +279,7 @@ int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned
 /* fb_pan_display
  * Pan display in x and/or y as specified
  */
-int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
+static int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
 {
 	struct au1100fb_device *fbdev;
 	int dy;
@@ -325,7 +326,7 @@ int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
  * Map video memory in user space. We don't use the generic fb_mmap method mainly
  * to allow the use of the TLB streaming flag (CCA=6)
  */
-int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
+static int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 {
 	struct au1100fb_device *fbdev = to_au1100fb_device(fbi);
 
@@ -517,7 +518,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	return -ENODEV;
 }
 
-void au1100fb_drv_remove(struct platform_device *dev)
+static void au1100fb_drv_remove(struct platform_device *dev)
 {
 	struct au1100fb_device *fbdev = NULL;
 
@@ -557,7 +558,7 @@ static int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 	return 0;
 }
 
-int au1100fb_drv_resume(struct platform_device *dev)
+static int au1100fb_drv_resume(struct platform_device *dev)
 {
 	struct au1100fb_device *fbdev = platform_get_drvdata(dev);
 	int ret;
-- 
2.47.3

