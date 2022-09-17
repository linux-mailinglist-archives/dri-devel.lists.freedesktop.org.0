Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A145BBEFC
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 18:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517D510E513;
	Sun, 18 Sep 2022 16:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E6F10E156
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 23:44:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id ay36so8736392wmb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 16:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=W3nhAj+Ke6/Uwv03jjSajWifh5DcxgPw+hL4S6YxCV4=;
 b=UK4e+Q7zlslsnRrAZvCs5rgoD34RiB23NPU0DmBIjpn3WeSGgnupAn8G59B55scPCa
 LHVp3hHJaB11hkdxkoaqTary9JapiOzxhb+juX+QIIq2RZJmFwKyvRmIuXrwsBqgbnPL
 gYCImEl3qNCnNFEfuCWsjgtJ2GIMurc1aZd5PQWYSqC2MJGnWZcCk39H5agE83cR2z7n
 7iQvSt2l0Tl88pods4Jvww2UtnyE70D9H00kyv5Q/WU807GxqgaIFzNotd/NKIc/YHS8
 Qeyqtjgt7pV5X2urZTKjWwM7Yz3cFvdj8X1/cvohp9rqjNP8voZs/wZeHVvkTJtstJ/9
 kwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=W3nhAj+Ke6/Uwv03jjSajWifh5DcxgPw+hL4S6YxCV4=;
 b=p5+mmVDA1bXJOXagdgF2YRRZLsLMJGABKex3y+9JfoxE3WLktDX8tRSeAo0D0w+PW4
 6v5wbYFNJ7BdswdJoHPDJ4Zha+yMOcqGJOLenSefWNJS7tnb288lxY84sd5WpGWrcrYt
 AxuT3GCJagcBByX9ppInH1ImAJINUfGTXck0k3pZ9Kjt4Wcd5j3RJ0tIiISMagJbz/ut
 p4MdlqQfxq7FwXi3baEZ60TNIGmEb6ERkriNmz+2PFgpJRhSkSxOY+im7pZi/CFBjzW/
 DtGvf0Me0vtPVG8bFx6ml8NEG7kBkSvf1LHJb6sQdJtvsfYlQCRGT7Tq0ssyko4cCaNv
 H3CA==
X-Gm-Message-State: ACgBeo22+CBv3rM5siRw5pX0XEnMXUVmbvjA87JBT614qIRleDQ/fK7g
 /8SwGhKDFUEzSjzjedskJQ==
X-Google-Smtp-Source: AA6agR7ibmaN71mj81zoCI5dwXNfIqMvf72bJvx/Dkej067FTQsXPS6tJoZ/pbunZ8OUEiwLKwSUHw==
X-Received: by 2002:a7b:c4cc:0:b0:3b4:757b:492f with SMTP id
 g12-20020a7bc4cc000000b003b4757b492fmr14828250wmk.74.1663458271950; 
 Sat, 17 Sep 2022 16:44:31 -0700 (PDT)
Received: from playground (host-92-29-143-165.as13285.net. [92.29.143.165])
 by smtp.gmail.com with ESMTPSA id
 bn20-20020a056000061400b0022aeba020casm3237229wrb.83.2022.09.17.16.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 16:44:31 -0700 (PDT)
Date: Sun, 18 Sep 2022 00:44:20 +0100
From: Jules Irenge <jbi.octave@gmail.com>
To: spock@gentoo.org
Subject: [PATCH 2/2] video: fbdev: uvesafb: convert snprintf to scnprintf
Message-ID: <YyZb1K9b1gapCfep@playground>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 18 Sep 2022 16:41:09 +0000
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
Cc: Elana.Copperman@mobileye.com, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Coccinelle reports a warning

WARNING: use scnprintf or sprintf

Adding to that,
there has also been some slow migration from snprintf to scnprintf
This article explains the rationale for this change

https: //lwn.net/Articles/69419/
Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/video/fbdev/uvesafb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 4df6772802d7..fd5d701106e1 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1580,7 +1580,7 @@ static ssize_t uvesafb_show_vendor(struct device *dev,
 	struct uvesafb_par *par = info->par;
 
 	if (par->vbe_ib.oem_vendor_name_ptr)
-		return snprintf(buf, PAGE_SIZE, "%s\n", (char *)
+		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
 			(&par->vbe_ib) + par->vbe_ib.oem_vendor_name_ptr);
 	else
 		return 0;
@@ -1595,7 +1595,7 @@ static ssize_t uvesafb_show_product_name(struct device *dev,
 	struct uvesafb_par *par = info->par;
 
 	if (par->vbe_ib.oem_product_name_ptr)
-		return snprintf(buf, PAGE_SIZE, "%s\n", (char *)
+		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
 			(&par->vbe_ib) + par->vbe_ib.oem_product_name_ptr);
 	else
 		return 0;
@@ -1610,7 +1610,7 @@ static ssize_t uvesafb_show_product_rev(struct device *dev,
 	struct uvesafb_par *par = info->par;
 
 	if (par->vbe_ib.oem_product_rev_ptr)
-		return snprintf(buf, PAGE_SIZE, "%s\n", (char *)
+		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
 			(&par->vbe_ib) + par->vbe_ib.oem_product_rev_ptr);
 	else
 		return 0;
@@ -1625,7 +1625,7 @@ static ssize_t uvesafb_show_oem_string(struct device *dev,
 	struct uvesafb_par *par = info->par;
 
 	if (par->vbe_ib.oem_string_ptr)
-		return snprintf(buf, PAGE_SIZE, "%s\n",
+		return scnprintf(buf, PAGE_SIZE, "%s\n",
 			(char *)(&par->vbe_ib) + par->vbe_ib.oem_string_ptr);
 	else
 		return 0;
@@ -1639,7 +1639,7 @@ static ssize_t uvesafb_show_nocrtc(struct device *dev,
 	struct fb_info *info = dev_get_drvdata(dev);
 	struct uvesafb_par *par = info->par;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", par->nocrtc);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", par->nocrtc);
 }
 
 static ssize_t uvesafb_store_nocrtc(struct device *dev,
-- 
2.35.1

