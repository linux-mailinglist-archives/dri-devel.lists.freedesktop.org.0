Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B1B0FEF9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 04:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E40C10E1BB;
	Thu, 24 Jul 2025 02:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PjeGVypt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5CB10E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:56:50 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7d45f5fde50so47192085a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753325810; x=1753930610; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tya8198c6y5rCjUglNzcQUyG1Q0GYdplJmKHDjoJPmk=;
 b=PjeGVyptaaNPfweDrtS/j8uqPLfBVsx9M8VxL32+EfV56fEFQIfqgDhxhjIamTISgj
 DSp6hSG/TnnIyPmSXu+GUT0G+VZ2y6JYUw7+tyUCmqcqzGbfsxhSs+tNg7v1rD7H1j1W
 85ctXbg5QW0vJhPGldB4AXSG/722HANC95Wec13HdTLLrvwrgcZwqruzj9AnHijDolAw
 OZChNAoaE/4lt8yJJAdG9xSzDyNSHXIlqBH3Aq29X5buxM6V7vwOPmDL5zUeffDzYcOL
 Y60taHe9d4mBS8ZBt5XKugxnDCD/JrlepE7Tyz8vBJDKMf7R7bJsc4nxsQZJS2KpBPX/
 dNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753325810; x=1753930610;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tya8198c6y5rCjUglNzcQUyG1Q0GYdplJmKHDjoJPmk=;
 b=bbkPt2bwcW3mbjWFeF4vsdjaGY6qGvd3duWE//itXczmJwrB50H0f5F6ThHiYxq8pt
 DtRB+Ug6CM/MB80WOnRqjo8p2bJDI01x5YrvdyvRiGNeGYiFu452eC/Xfhjqp0hLQ2SK
 QbhcvlghgI8MJwXGIp+uzxKWULEvHr68L7jZZ5H1a1w1J8WZ8bd2tU8uc7axKubgOZjx
 Q4rCaR5bt+LqMejwNaHBf3dTh+vu5pG9L6GknpRJlt/SCdEMJodLY9ncKeLfgOz2N/Mu
 RBbHDF9/tSFZxT/fYM49lf1q+j/ujGY2JzWI0j1+sC6NKG+cldTyJV/HqHEyvBFgyWRJ
 Fs7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVe4zM7OMFgwmAXbSZ1ly1KyNOUEgn8yfKtRiagV4xB4r9S2R+8Tl3yYyH1Wa7si7XuW94rfaaUhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ/7MEMxOJy4cJ7KWgX4DQDFLNKhee5EZVc0VG0JQwtj5Kd2Vb
 LbV3scoNcGG6Pi+OxzEz29ayl8ye14il+aW8qptA8hnVlrtkdkWBSf2x
X-Gm-Gg: ASbGncv5sPouLs8lMeguztse4fr4v16Vjk2ak2hh3oVGFHKdeymp31CIyiYAd/0KHlY
 Dwsbnkisl3qS58gtNFuBsjJs8pfs2cc8rt89+9ppCg1bSWjYw8bAfGuKVhFBn5GOpZsDDprT69o
 F2xCatJdD2bCBFJraEkjj4PBme2iD7K2bogq2g8vGPLsoKS1PvJe46VuspYaDVFT6+iivN6yoNc
 Z/qgcIPLnY4KNUPCTSf2P/AxcOzL1HWqwdcsH/cMGaKzzd0EWvdjAh04fbS12y0Izai6IfyOMB7
 qgifAZU584u/DhhjvlLIcoIVt3+9jgT+ggAz2LrjzRn8oBpfBAqM6jnIuu8q1enmwfKRhMDAPBt
 XS8yqL9ZVMw==
X-Google-Smtp-Source: AGHT+IE520yI5+0BPKLPxQW3nyViV/NFLkZpgJ6MunrUBo0qqOXFxpUrTpHAPcr4S00JME2ig8XXiQ==
X-Received: by 2002:a05:620a:3bcc:b0:7d3:fb3a:675b with SMTP id
 af79cd13be357-7e62a1573d5mr588472885a.35.1753325809726; 
 Wed, 23 Jul 2025 19:56:49 -0700 (PDT)
Received: from pc ([165.51.88.28]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e632d6413csm50641385a.29.2025.07.23.19.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 19:56:49 -0700 (PDT)
Date: Thu, 24 Jul 2025 03:56:45 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] fbdev: atmel_lcdfb: Fix potential NULL dereference
Message-ID: <aIGg7erPjz1qJQ1F@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

of_match_device() returns NULL in case of failure, so check its return
value before casting and accessing to data field in order to prevent NULL
dereference.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/video/fbdev/atmel_lcdfb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 9dfbc5310210..b1017ac9c73b 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -922,6 +922,7 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
 	struct device *dev = &sinfo->pdev->dev;
 	struct device_node *np =dev->of_node;
 	struct device_node *display_np;
+	const struct of_device_id *match;
 	struct atmel_lcdfb_power_ctrl_gpio *og;
 	bool is_gpio_power = false;
 	struct fb_videomode fb_vm;
@@ -930,8 +931,11 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
 	int ret;
 	int i;
 
-	sinfo->config = (struct atmel_lcdfb_config*)
-		of_match_device(atmel_lcdfb_dt_ids, dev)->data;
+	match = of_match_device(atmel_lcdfb_dt_ids, dev);
+	if (!match)
+		return -ENODEV;
+
+	sinfo->config = (struct atmel_lcdfb_config *)match->data;
 
 	display_np = of_parse_phandle(np, "display", 0);
 	if (!display_np) {
-- 
2.43.0

