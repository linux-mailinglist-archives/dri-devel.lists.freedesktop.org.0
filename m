Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 420EF400B9D
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 16:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CF189DBA;
	Sat,  4 Sep 2021 14:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052AA89DBA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Sep 2021 14:22:35 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id fz10so1487122pjb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Sep 2021 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I/ua5yKYj8pkGfG7UiRoEoOwUToJwyNwNf/Tj0HDH/8=;
 b=C4MogmaLoR1H0yFxuV3YjeKt2Gn8IhnzECUoCNze0ifHO5rWWfLQcwal4MlbBH2NeK
 CQoYwvGs9MzxbPdD2fqsieTa5MufMQkp8dspcURqbAYR3ts8CTCge0mYfWSpWgUjkpnT
 bcXtE8LxLF8mYQM54Ki7Vy8bpFlodSyvYp6H4kpdEFI/GnmeH2nggGEtDAa0oyiVn3Tr
 apIyNXbMHdp4jNx977PIew28dnAX2UzCEfTIwgVFJIRxz35VG/aBvp11UpqCz+HtXP8g
 MDLQnUGwgcM/S9bN5KKuSFqet9kI9MonwlQzoyGG77hRY86CvIApEBafGI6RnTQuZzJS
 QOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I/ua5yKYj8pkGfG7UiRoEoOwUToJwyNwNf/Tj0HDH/8=;
 b=p7vXKshQwSNSVoe4RtuLGzLPy5BnZ/z9YbDb+bOpnKGIbhr1r7fz4ZziEtOh4Wg9vS
 iAMHUjZ5Kax2TPDSHq4Y3sddbNO8rbNqGuuL2EG9ogb+aomWmOBdMgMYrg4TPAMeC2B2
 M8O9mVU6nh79ZrcIye/CuCDu2H39j5+KynZm9Iu6qdizaoK2sMgZ1X6f9zXoUHujpohk
 361Ki/6PRZ6FOnKmjBkYbCxgWuS0mdX5/viYz2NqMhtFtC+p+DzAhCNywHTKti9/nlaX
 A5gJk4FEhLK+AROa164TMYUSzQE/KlCQ91zJ06Gjv+lE0PCX+ZsZ/e1iaewAM0HmsI1Y
 qIRw==
X-Gm-Message-State: AOAM533Ckdc/eZ5Ek8voAfu1UKb/Byd3a8NuNfPfUJ/feIeXUOh8QvQY
 Y/ejzezsmSDVy5zCBHp9mtJi3LLPa0uF8LpS
X-Google-Smtp-Source: ABdhPJxHf0ESh8pM4uIdjpjTkv4UmTjQPB9lqc7ZtM9W5E04SiwO6QKFx09EGvsPGa91UHcnSDnSow==
X-Received: by 2002:a17:90a:6b4d:: with SMTP id
 x13mr4446016pjl.88.1630765355470; 
 Sat, 04 Sep 2021 07:22:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:1c26:4b2d:32ce:9155:7c42:8667])
 by smtp.gmail.com with ESMTPSA id m11sm2480391pjn.2.2021.09.04.07.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 07:22:34 -0700 (PDT)
From: Srivathsa Dara <srivathsa729.8@gmail.com>
To: bernie@plugable.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Srivathsa Dara <srivathsa729.8@gmail.com>
Subject: [PATCH] video: fbdev: udlfb: Fix brace coding style error
Date: Sat,  4 Sep 2021 19:52:26 +0530
Message-Id: <20210904142226.23646-1-srivathsa729.8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Fix brace coding-style error for function defination

Signed-off-by: Srivathsa Dara <srivathsa729.8@gmail.com>
drivers/video/fbdev/udlfb.c:82
---
 drivers/video/fbdev/udlfb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index b9cdd02c1000..25643265947f 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1457,7 +1457,8 @@ static ssize_t metrics_cpu_kcycles_used_show(struct device *fbdev,
 static ssize_t edid_show(
 			struct file *filp,
 			struct kobject *kobj, struct bin_attribute *a,
-			 char *buf, loff_t off, size_t count) {
+			 char *buf, loff_t off, size_t count)
+{
 	struct device *fbdev = kobj_to_dev(kobj);
 	struct fb_info *fb_info = dev_get_drvdata(fbdev);
 	struct dlfb_data *dlfb = fb_info->par;
-- 
2.25.1

