Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA807A41E4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77E710E1B4;
	Mon, 18 Sep 2023 07:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68D10E11A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 01:02:18 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68fbd31d9ddso2295530b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 18:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694566937; x=1695171737; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iP1lkvVYjBN+KkdHkwdbL7/nnWbR17dZlHeb1s8O7n4=;
 b=svJ79U30ohu2IvS4m9OLAGIE9DheDzy8OI+9yymRq0S5j998DglqGpZ5tateURK7Pn
 tvnIOyYce0lp8hRXIMx6EZCyyrgO7Oq5ccqQoOBTEoqU0LxQ3jcq86v4C/urfdfzJWLz
 UXP+FrR+3jFdyjlBc5h2E0++sQ8T4uL+8I8EElQkpgV9xID0hRvlRcUlwyYS6ChsQDgr
 vUl/PzFQBrReqxxcWsxtOef+XnoJaffJu35dU7ADvHvEkm5FaEYJ8ziiU7FoNKpIkAze
 1DdiO7lwULqCxG1UGnKuuzXRz6UeoU+oe9u1Pt5y+tWOKRMfgckp25XuAG4c4JCed0S3
 CQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694566937; x=1695171737;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iP1lkvVYjBN+KkdHkwdbL7/nnWbR17dZlHeb1s8O7n4=;
 b=PWzVajbQl2jeH2qDK1I1sDYgGtncFFipBr9TlLdT6eZhyGew2fibF3bM8e3ZUqnZH4
 ss4XvE40CjNmLV5NumLE1wrZd7RB9PO23OcsAq5+Y59uc9IsWNmQPDS5r2dkEXC3KQ4O
 YLONsetKATPixBfc5PrzxaYoehOTLYO/lXnsFSNZHvfGWXt1YH9Oh7MA+SmToN3sJQtz
 Q/X8jDi/Nca0tHM+xZQ/xsyBSXqSXG54GDCSoUzztkijJUg3Birg7PPjelEjOcVUjWhW
 x+v90jwEcNKnYv64DY0MrTNkr1Wcq4fv20ka78decKi5f2ms0lcWDV9wIizMVlZU1Ywm
 HBbA==
X-Gm-Message-State: AOJu0YzdsN1F25qSq7uhw74gQ8C5dmIuDbJVbJ2UaI+UHY64PqWJHsh5
 GJfDknSIzScKsVlGISEAsmWmheVS/QHFGg==
X-Google-Smtp-Source: AGHT+IFN1PhjaXlp3JAOzpJIqkPhljBgbMWen3PGjjdkTkL3ORlcQHP+ND9StB5BT8IMPAYJA6wFWw==
X-Received: by 2002:a05:6a20:7d85:b0:13a:12c2:359e with SMTP id
 v5-20020a056a207d8500b0013a12c2359emr1424023pzj.2.1694566937349; 
 Tue, 12 Sep 2023 18:02:17 -0700 (PDT)
Received: from midnight ([2001:8003:6434:b000:c30f:d88d:412c:6e9a])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a170902748400b001bbb8d5166bsm9102235pll.123.2023.09.12.18.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 18:02:16 -0700 (PDT)
Date: Wed, 13 Sep 2023 11:02:13 +1000
From: Angus Gardner <angusg778@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Removed unnecessary parenthesis around
 conditions to comply with the checkpatch coding style.
Message-ID: <ZQEKFR1OPoXGI2lO@midnight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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

---
 drivers/staging/fbtft/fb_ra8875.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 398bdbf53c9a..658f915b8528 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)
 
 	par->fbtftops.reset(par);
 
-	if ((par->info->var.xres == 320) && (par->info->var.yres == 240)) {
+	if (par->info->var.xres == 320 && par->info->var.yres == 240) {
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0A);
 		write_reg(par, 0x89, 0x02);
@@ -74,8 +74,7 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x1D, 0x0E);
 		write_reg(par, 0x1E, 0x00);
 		write_reg(par, 0x1F, 0x02);
-	} else if ((par->info->var.xres == 480) &&
-		   (par->info->var.yres == 272)) {
+	} else if (par->info->var.xres == 480 && par->info->var.yres == 272) {
 		/* PLL clock frequency  */
 		write_reg(par, 0x88, 0x0A);
 		write_reg(par, 0x89, 0x02);
@@ -99,8 +98,7 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x1D, 0x07);
 		write_reg(par, 0x1E, 0x00);
 		write_reg(par, 0x1F, 0x09);
-	} else if ((par->info->var.xres == 640) &&
-		   (par->info->var.yres == 480)) {
+	} else if (par->info->var.xres == 640 && par->info->var.yres == 480) {
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0B);
 		write_reg(par, 0x89, 0x02);
@@ -124,8 +122,7 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x1D, 0x0E);
 		write_reg(par, 0x1E, 0x00);
 		write_reg(par, 0x1F, 0x01);
-	} else if ((par->info->var.xres == 800) &&
-		   (par->info->var.yres == 480)) {
+	} else if (par->info->var.xres == 800 && par->info->var.yres == 480) {
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0B);
 		write_reg(par, 0x89, 0x02);
-- 
2.40.1

