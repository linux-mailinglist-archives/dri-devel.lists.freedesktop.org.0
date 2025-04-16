Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B4A90458
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 15:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F318A10E90A;
	Wed, 16 Apr 2025 13:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EmWBVaNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A5310E90A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 13:30:55 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-227c7e57da2so60284265ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744810255; x=1745415055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LbNSVDiFHwq8rNV000t7lz6vq0av5GqGVYbhsOdiyA8=;
 b=EmWBVaNOM9y+EW92GIwe0iA1MjPByZyQBlU7OO1g0hJYYKhrIRHyarzkkO2L1IGG8Z
 N7R6LvyBCwDqbWFoxz4j0dZFtuS/5ZKOV7UItaAWz/AoTNcr9BqssOsVg4phY75LwLit
 iKrK853Tt8S9qdIHa1FcI1mOzcKD6DHh8LRtN4wPqiej8JMGPX8Lr7+7AgbU7/L7zXNA
 pIlLOmIFUMKjmpAAQVL8K8Lp2AdfA7Tdg3GoeXpC7+eNltDqzvI8ftkhrSGSVNBDpge5
 kxz5QajkdMkEHA387cyBYv2IB/ZsO9G+t27rAWs9j3tMuH2LXpl5Y6VjV+wslsXo6Y2b
 H3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744810255; x=1745415055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LbNSVDiFHwq8rNV000t7lz6vq0av5GqGVYbhsOdiyA8=;
 b=hbPk5mapnRiJnT53TzkZyU5F49HHoWwm4rpDaxr1RaBjQ4N73Ru3VxkvR+jyDgcrZc
 APN7+vFpZoGQZ6WNja4W0/ogdtM591nI3FMNnR0Pdj1sWPZ74x9JaaU89wLwoSK5nPZ1
 RCeOMtcQJGuh9ug96BgOpphRFtBCa2JMVdmij36M0OZ1MsH0L6C616hquAyySIomFpJ5
 YhhRqbXy1QMDZmr6c3QqkMvoc6W9/R3ouHVom8ctaIbAOLbg1HLL88YzNLQmiF7FHdzH
 J+HmoCzk7zeMxez4VDhMVzruy1/r1k8jbDg9tWmcUkEYtrcma1YRMDjTmsEK/fUwJ+Qb
 fduA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS2Vgiba6GKzYdCB5Thl4aqu/OtudxrKV25VrcYeCz3LDF1RinHdyIwPQREu6fmeqFoqMYWAaQybE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEKVYYJwJ2u//YFMVa6tWwbw5YalFCEE8m8KPlIKBWcBufswqj
 udyh0OwhQvnvjvrTNMwe4oZnxakWiGHbDtbReFAZanKXwKzFuPM5
X-Gm-Gg: ASbGnct8/Co8tbxYuPA9G0r/vbnUgwSwr2GoUdmnjlDC5zsLZZ9wSBFT4gkC0EWTRuQ
 mGCHugA0RuB8rqkP13IJoZdnSZKatyMkbIstd2KTPPUqaADO6fx/mbEwsNWbBn8IdkFpuzAj1U4
 x9iwrs50ct5Dmh1WUlhdKog16j4sAlfIBousqTwovamIiUyZL4J0JYwveYZBd4qngx4KT49YkLq
 aRsRVW9MPmU+yw4Rt45eiFd6XhEXZO+KHwvPKxYp2SJaXkCWYAZnr2eqZmdkquLY+MzyY4a+5Vs
 elJr2aLfuKO1OuxXLTJYgdbHeVk+GWg2SnoHhZmrLFoV0nWfBpiNE5U=
X-Google-Smtp-Source: AGHT+IG2vRfsCnm5TZSplWPRtz1ywxgjh6sWoTQEfUxv6dxNNa3rWkx78FM/tF2HIadzSJ6G6zfqcw==
X-Received: by 2002:a17:90b:5444:b0:2ee:f80c:6889 with SMTP id
 98e67ed59e1d1-3086417cdf7mr3401623a91.33.1744810254931; 
 Wed, 16 Apr 2025 06:30:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1040:3dd1:1e14:adfc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-308611f458dsm1525061a91.19.2025.04.16.06.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 06:30:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: noralf@tronnes.org
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>, stable@vger.kernel.org
Subject: [PATCH] drm/tiny: panel-mipi-dbi: Pass drm_client_setup_with_fourcc()
Date: Wed, 16 Apr 2025 10:30:48 -0300
Message-Id: <20250416133048.2316297-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@denx.de>

Since commit 559358282e5b ("drm/fb-helper: Don't use the preferred depth
for the BPP default") an RGB565 CFAF240320X display no longer works
correctly: the colors are wrong and the content appears twice on the
screen, side by side.

The reason for the regression is that bits per pixel is now 32 instead
of 16 in the fb-helper driver.

Fix this problem by passing drm_client_setup_with_fourcc() with the correct
format depending on the bits per pixel information.

Cc: stable@vger.kernel.org
Fixes: 559358282e5b ("drm/fb-helper: Don't use the preferred depth for the BPP default")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 0460ecaef4bd..23914a9f7fd3 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -390,7 +390,10 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, drm);
 
-	drm_client_setup(drm, NULL);
+	if (bpp == 16)
+		drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB565);
+	else
+		drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB888);
 
 	return 0;
 }
-- 
2.34.1

