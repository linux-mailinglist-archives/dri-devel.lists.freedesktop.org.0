Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D7A49550
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EFF10EC31;
	Fri, 28 Feb 2025 09:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HZ9j7NrH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA44910EC32
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:38:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5e0373c7f55so2822950a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 01:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740735501; x=1741340301; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kAbBHBzTpenwYQ3xIDx+RFfsaRXN6FerVlZhMl5YALM=;
 b=HZ9j7NrHKdT8K1gRi3UhSFgkDeLHXnUE2Sqh0zj9Q2N0uLCNoHsbfcj0putJfC8ykf
 ZYuWZawjDEwix4+1zKBvuRAusSzj45BUlNlRWCgGwvbBIPPt5wvs2JLJJXPs15QXpCfY
 zvV5l/0wjTHtmgwxMuYgi39gmX//ID+YUaH29k7HB3XnG0jc249sET7KybH3WajQlkLU
 wnQxF7qiHJoHXdTjo8osHzwACHd4xRFZ6PlZYBkHY3PUBfzP4UNd/l1hcCDV77X9W1Cs
 Zuu8k5DkrwRE4evnN+KIWrBOUywUqvlIB07ozfHfFqCuxEr+Hv+7wvrxk+lE8bEdetCE
 yYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740735501; x=1741340301;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAbBHBzTpenwYQ3xIDx+RFfsaRXN6FerVlZhMl5YALM=;
 b=R82FqUTpDzBE9Tm2Q5PtDJGQlqTkGEm2jmVM/TjV7b1pybld00BVDfgOoU0vc1Kr6A
 q0BoIDn3q9KgNBV8aUcExgkIJ7A+YwRsl6VchMxs7gCEGOOIMO43PZCBv6ZBdEKQNMDj
 gqB6Cs7RgvdAONko/kYn8Pa8Oyg8PxJl0OjU7REJwVWdDjDiBAsSmMkIaDm0d2zgUX3/
 IqXeGHgSwI4awTY7ix52vYvcIKM3aRs9vny7fRIrrViq348kkTrd8YXPeLrS6qqiO7r2
 YPJqbkovNVLb1Ohn/X+d0OzfJvLmJzdchsoKg0wJyNQnZWpwJML9tZGGIswO+06mcSS4
 +c6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiqhT14+P/bODbozcxSLY9UmfWQpMf6MRcgluOpMrh0BiQfiyF7z/FuPlw1MmzOkrCkU54QCTpoFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4La0V5d/pM9W5iNxGQ2dQL8YPjIFZoo2OOhr0fpfeDEj3iJ1Q
 S4Nftumv+S5emSS4waB5dIxe6Hh2/sbf+xRaGAd74iFgd0gSy/b1UgH2jhM5P7k=
X-Gm-Gg: ASbGncs/P+hjD5qdGGTrfd/RExjUgB9XvAbpJ9jM8IDB7X6MNbFhM/6fHszzqHR/94R
 ctyTiu6uEEzpe1KbfrFMdyi+5d2VI+xlUknT24DdrmLBMbFEpCRBJer8+13WFf+C3+C327z35rx
 c30GcTme5T6EIVifvYPnyeuXjjzgsujqXA15Ip/EtH+k3+wyLmz97crESJb1TqbGWzXdb9+11Or
 UauVPe+2t146XcosLdQxqRnPiliGioLBYTzifnuogtjQvIyZQoV/BZ7ruimb+joOtt0HNGASASX
 zPR9PlVaJSjIO7SWBZejWIhC16qX/5c=
X-Google-Smtp-Source: AGHT+IFG/wAFc+7a3BTiB3lyA+ckJ1OhlFHzEfmEQnuDRhG6Sr2tZqzqalibYqvITqld8TmExotXDg==
X-Received: by 2002:a17:907:2d8a:b0:aab:9430:40e9 with SMTP id
 a640c23a62f3a-abf2659d531mr240459266b.32.1740735501401; 
 Fri, 28 Feb 2025 01:38:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abf0c0dc5ebsm263013666b.73.2025.02.28.01.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 01:38:20 -0800 (PST)
Date: Fri, 28 Feb 2025 12:38:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/vc4: hdmi: Fix some NULL vs IS_ERR() bugs
Message-ID: <a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The devm_platform_ioremap_resource_byname() function doesn't return NULL,
it returns error pointers.  Update the checking to match.

Fixes: b93f07cf090a ("drm/vc4: move to devm_platform_ioremap_resource() usage")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d20e5c53ba75..37238a12baa5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2928,8 +2928,8 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
 
 	vc4_hdmi->hdmicore_regs = devm_platform_ioremap_resource_byname(pdev,
 									"hdmi");
-	if (!vc4_hdmi->hdmicore_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->hdmicore_regs))
+		return PTR_ERR(vc4_hdmi->hdmicore_regs);
 
 	/* This is shared between both HDMI controllers. Cannot
 	 * claim for both instances. Lets not convert to using
@@ -2946,33 +2946,33 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
 
 	vc4_hdmi->cec_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "cec");
-	if (!vc4_hdmi->cec_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->cec_regs))
+		return PTR_ERR(vc4_hdmi->cec_regs);
 
 	vc4_hdmi->csc_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "csc");
-	if (!vc4_hdmi->csc_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->csc_regs))
+		return PTR_ERR(vc4_hdmi->csc_regs);
 
 	vc4_hdmi->dvp_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "dvp");
-	if (!vc4_hdmi->dvp_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->dvp_regs))
+		return PTR_ERR(vc4_hdmi->dvp_regs);
 
 	vc4_hdmi->phy_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "phy");
 
-	if (!vc4_hdmi->phy_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->phy_regs))
+		return PTR_ERR(vc4_hdmi->phy_regs);
 
 	vc4_hdmi->ram_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "packet");
-	if (!vc4_hdmi->ram_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->ram_regs))
+		return PTR_ERR(vc4_hdmi->ram_regs);
 
 	vc4_hdmi->rm_regs = devm_platform_ioremap_resource_byname(pdev, "rm");
-	if (!vc4_hdmi->rm_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->rm_regs))
+		return PTR_ERR(vc4_hdmi->rm_regs);
 
 	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
 	if (IS_ERR(vc4_hdmi->hsm_clock)) {
-- 
2.47.2

