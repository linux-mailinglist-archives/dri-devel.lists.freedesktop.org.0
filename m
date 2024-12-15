Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3939F2207
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 04:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC9810E36D;
	Sun, 15 Dec 2024 03:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="oUi/fNOW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF9D10E36D
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 03:22:28 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2ef8c012913so2101831a91.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 19:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734232948;
 x=1734837748; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BKaaCH8tfJcoJLt++OW7uI/MHy3AUbsrG7mnbMpZLCg=;
 b=oUi/fNOWwntd5Dpw5g+40pvUkPU/dNnYQj1Mm8k4gg87Gpd6WsorGBAk6wwvuotTyP
 m5yKGGaLV8oM4eAArXQzb8J8JiArQGVEg4fANYF4H0FT44DNOs9J0TBiMjVdeG2BzGBG
 yBBs7RWjRqWikMd+6mB5cDiw3iC+gfR7RAPw5J13p47r05TVWDhga7MduCzWJj5HGaIX
 WMggcCNX/52Pmh54WFsXpOUnjuHg8evgvY90W/0XUJKRT8cjrn8rkaere40DUmhJnFLt
 nRCRsmqCm8kK7a8A8H9arZ8DJxTjKEFdFb8muZF8jth6f2ySO+HZr9LWflXoBn9fRaaW
 dHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734232948; x=1734837748;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BKaaCH8tfJcoJLt++OW7uI/MHy3AUbsrG7mnbMpZLCg=;
 b=mw/kjp92g2xGy1+5mMz8bqO1Gpy+ebfSfo6Yim7LGUb0ZkSTRJtIbsIsJs5cux1TwG
 k6bA2EgbgcOl6y1Pe+blBOVeyu+w+HSD0u1ylAMF9KPzwbTe0bERSwr8aX7XRoWaAaoM
 muricJVAzq19pI/zbrbdz6Ki4bFcf0yDOimEQHnOUbbqTSo1eC9TgxEOfxxrAM1kXSWF
 CEbWPtMl71PRMeGzA871oelLxQ4/YleQm12Xmsv8IIRuiZ42N7OAiHq2LUM4qycOkAz7
 5zeyl3IW70v83Yb63qHMB698T3GdOs68bC2rg8PupaHQny8l0QTnRoazaa2t8ib6ltDY
 lfSg==
X-Gm-Message-State: AOJu0YxupfBHkl12gEjBMUrkjKibjl340KlJx246E9JU98+fAkiLTVZF
 4O9E8bXRNHsGEaJvRbffuo1AQrWdhp1kTQwRzhHa0/Q2aj75jngNT+HwZ2iNTrs=
X-Gm-Gg: ASbGnctJ7pSVhPKi737nKBNFP6HgiVONajDwAj0TbSbe+8/UaXEHk7swY8Q+tT68dfj
 MVJP9BozTC3bRDNEPRqY2PN4rxVUqSglHLG6L9ba0FX9Cfn/AR0nR+AoibMN+ebR83CaUPvFfFJ
 QLrcyFI2+xM7K6fkcdzQQCkYNkPQQlbTUA2ckBsJVzwd5+vQmxEFlriHqqiIBMpuLasde8bnYaK
 zh/bPNXDnAZ9CCBv/VSIapW+5vs4NGFcnPCMqT1mhzP6A2Le9cM8mX6ZBinOOJgHKmfVCr5MeQH
 CwWxapOXwLUqKSyr0HYr8wclY5n7lXnUCMUMchRDmew=
X-Google-Smtp-Source: AGHT+IGbKYG+nYU0cCAvUGQRfIbnP68FfhbQLJtTHqryHdMmzXERh/xvQU2zNnOGIC00GYy9lCSVsw==
X-Received: by 2002:a17:90b:5108:b0:2ee:e18b:c1fa with SMTP id
 98e67ed59e1d1-2f2900a986dmr10276477a91.28.1734232947670; 
 Sat, 14 Dec 2024 19:22:27 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp.
 [133.32.227.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f142de347esm5568883a91.25.2024.12.14.19.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2024 19:22:27 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] gpu: ipu-v3: fix OF node reference leaks in
 ipu_add_client_devices()
Date: Sun, 15 Dec 2024 12:22:22 +0900
Message-Id: <20241215032222.2507759-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
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

ipu_add_client_devices() does not release the obtained OF node reference
in the error path. Call of_node_put() on the OF nodes before returning
an error.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 17e052175039 ("gpu: ipu-v3: Do not bail out on missing optional port nodes")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/gpu/ipu-v3/ipu-common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 947323f4a234..8091b959b7ea 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1178,6 +1178,7 @@ static int ipu_add_client_devices(struct ipu_soc *ipu, unsigned long ipu_base)
 			ret = platform_device_add(pdev);
 		if (ret) {
 			platform_device_put(pdev);
+			of_node_put(of_node);
 			goto err_register;
 		}
 	}
@@ -1185,6 +1186,8 @@ static int ipu_add_client_devices(struct ipu_soc *ipu, unsigned long ipu_base)
 	return 0;
 
 err_register:
+	while (--i >= 0)
+		of_node_put(client_reg[i].pdata.of_node);
 	platform_device_unregister_children(to_platform_device(dev));
 
 	return ret;
-- 
2.34.1

