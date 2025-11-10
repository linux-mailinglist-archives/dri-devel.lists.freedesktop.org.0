Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275BC481DB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661B510E43D;
	Mon, 10 Nov 2025 16:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BqWgfWEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2E410E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:52:20 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso13633835e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762793539; x=1763398339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u+yoMHzq4OWCUa/io8A/Ge/syIs6RyyUhmU2sJkLMP4=;
 b=BqWgfWENHRySLp+nkcVdDaxzYzq5ylYwyDqfw1y+PM8z02G5PWg3LhuAcCgXUDcCMd
 Ap2ddcQgBDiYKK+6qjq0LD/QbB9tskVLHoC3QmCnUWyMDD/qgmlH+NO4MOUr3Ya1+z2x
 ljZ67dgmSaM0Ticdo+M4lLHtSkIMtCiwE2hqcPbMWeIiUgqMrQGis83oMPVsEDX25gQr
 AGfl1Ba9RUNzx/TpNYmU7XAKtGKqucX7ucMk3phLrx/qxQWloxFLpv6BLPyIR2oogRkL
 3mnDDX6c6p7ZkhghKYldIFQwHXwJrJXSqNRDd3CuM0OchOxSuOcOlf92GRyWRXZoR/gp
 bVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762793539; x=1763398339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+yoMHzq4OWCUa/io8A/Ge/syIs6RyyUhmU2sJkLMP4=;
 b=dpP6dS6vrYiyVN+Irash5Sg56YLZjB7xjdEm7sY9YH+/3AWPta2dgjGt/fdIwHt+ba
 jHqxP/qGfiyxW5dIcG8dRNULL2MNAa0OS19+/D9fQ7ncmsAQUS/SLpI3l5kL/A2lOAc2
 YEx1JQh79dg0i8qKGhcmfPWoV9mAFqd6apxgggP44H+8gn/A7LL+7mqtlPKjc4WjRuWA
 8QE6cY8tNk8QwuHaXTkcHnyNf0oPojtNIqQf2yeEj+RRPhQd0lVbqwzwKPZBTNXmwgYi
 RyPGwgZrdV1MdWGO0UeM3HXn70OClaiN8r9emgDjnCXKpSysHvTrCDxw6KvbDWvNihqs
 /bHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA+D5CpuaojnAskcZaoQho+rNHKL2E4u0ovVicBucRzSGFjq2T6emjhnEAdkfPp0FTgl7v0hjnCWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7Klp2oE9hDTxqQ6RsQuKckByHUoC3tJHviTRZ5UKuCd+0tUgz
 Rtk9WnMrCMzo9GyqvGhQU6ZYSymOajN3AAltDNY8NOX+V1R0yhflednD
X-Gm-Gg: ASbGnctnbruchVbduyA4hoiaPOyaizCTwAqXSvB2o2lxLrfXkPyi3JS5fD3/JJ3pQa6
 kD6s1QuoeBoWZNjkuQl5L5iZgiQW8DIdx4WEVYtDprUofFCQ6JLQ9d1Ag7s13gy2GoNZcTsP/Pw
 isG5Fx4Ylvor6yY58+vConQNMnMilKfL+F7hgWzVgLUOEeSzwNSOpOd0MRnSFM/eiivjr9nnAIN
 KNvQ2f5UiTIgBL9yJ9PUKKPE5zkKSz6XT8KXxL8UXQyP8SBjQZdg9l15TkoRiGV+NxKy/R7ZJY9
 EhC3mtpJYpIcd5DOv6TT3d8h5uF73PC740jDMEWWzEfWN8NcdIyFQJc1coB2HcQNx7L0Wb49Zlx
 tQI+ciifkI3uAHPwqjETR0Sg19VOx9rd4sg2qC0NcnR1CwAp1b4JR3JLCC3PNnpXvIQrgIlGQSl
 9DzgaNXkVTyKMQfLbGMVJWLvo7l5I69DrtvWwPmjKsa90PCY2mXMLl26W883Q=
X-Google-Smtp-Source: AGHT+IFEBkHfG5WjmgHWOwlDV9Phr4+xIjNcsuxFIG53bO4xWInLPdps27JCx6DYqmMEKGbWLuk6Dw==
X-Received: by 2002:a05:600c:6384:b0:477:5aaa:57a6 with SMTP id
 5b1f17b1804b1-477732372aemr64753305e9.10.1762793538848; 
 Mon, 10 Nov 2025 08:52:18 -0800 (PST)
Received: from dell (229.red-88-1-12.dynamicip.rima-tde.net. [88.1.12.229])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4777f1b61acsm32926005e9.3.2025.11.10.08.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:52:17 -0800 (PST)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH] fbdev/gxt4500: Use dev_err instead printk leftover.
Date: Mon, 10 Nov 2025 17:52:14 +0100
Message-ID: <20251110165214.3076586-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
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

I coundn't test as not have that hw but cross compiled to check the code
change.

Fixes: a3d899839064 ("[PATCH] Fbdev driver for IBM GXT4500P videocards")
Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
 drivers/video/fbdev/gxt4500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
index 15a82c6b609e..27a46e364419 100644
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -704,7 +704,7 @@ static int gxt4500_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 	info->var = var;
 	if (gxt4500_set_par(info)) {
-		printk(KERN_ERR "gxt4500: cannot set video mode\n");
+		dev_err(&pdev->dev, "gxt4500: cannot set video mode\n");
 		goto err_free_cmap;
 	}
 
-- 
2.50.1

