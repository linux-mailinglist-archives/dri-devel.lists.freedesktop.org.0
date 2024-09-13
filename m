Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C321978296
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 16:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72BB10E271;
	Fri, 13 Sep 2024 14:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zhXnumfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B82110E271
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:35:01 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so3059479e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726238099; x=1726842899; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NOZr+XBM5WUt/TfPaFfV5hj8BjCZLS7DmNzXffMIGd4=;
 b=zhXnumfx2LVCVJ05vyUdRZbl5wlRggjdg75/Myz8sKopEFnQlrhgdrwDYofiLDmXny
 hN11fLncOtfGxYJvxY74pS3mfuHFXIpcnyV3LNrw9ZeF1rZKbU2oHKXH29bSbVItH7Ey
 rPcGxY73tmVRWJ3546m1RAhIBa3hE56ga2CBKrT2QBZh1fYWfza3sJeCRFNGY+k+gJSG
 s2BRtaBSlhKAODIlkuJAF30o9ixHQ3gv5dnYOqyNt9fWqeertWL7E2ZMEJUEYtZyTWhO
 +DXz6iKEQcDbpexHU++CowqXzZ8SkFxS06KrCUCA8TCwd0K/fIAmkBeFtkYiz693JhOX
 bMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726238099; x=1726842899;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NOZr+XBM5WUt/TfPaFfV5hj8BjCZLS7DmNzXffMIGd4=;
 b=Byt+b0kAuG0Cm14lj6G/cJ102uo1CIRnE0pq+rPphSyCz19RazS4779PN6EceA4Q7H
 Jy/8R454WgQtCY7Bb8pHytRoh+Es4l2s8hrDlUxldMRXzq18nk8Ht/qidXnnn2qU2y4F
 a9VehKApNc21lrNu91AMLXu82XOcP2qV5dfGurPFR4roJRSVRdhOEo7yptCC7cDJbkjg
 U+YdRr+50yEsLX0JmXbx8WH2QdT6t0300NEYauryI09cXgrFo6yCjP2a45FxMcOXtXUc
 FEsumD70eycXQscUpBVD9LrW5ev+9u4cJIwqpR77ysl/fYALJUlyDA/90e5ne4EFy06j
 Y2Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+UI3x0w2Wmpz3zcyPzEZRMz3JQ2ipFjwRBEps5N4c6eTj7TLcY/TKsixbJZq8HVX/kEBYnhMiFOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ4YLbr/Y+ay/198591p1hTH+mTCxiNU4K1TxkceTo48P5m8Y1
 OENoZuvdvwzenayIt65po0cZz6H+N7nbufmsjFARWNbeqmd3oS3ECu02h1/xXdo=
X-Google-Smtp-Source: AGHT+IHjq2mTTdTFTKK8BFKScueI01WIN6K5Za4D/dlGAyZ5cP1Y+EQegQPXkmLZH/xNBLTD7hORWw==
X-Received: by 2002:a05:6512:1289:b0:533:e4d:3374 with SMTP id
 2adb3069b0e04-53678ff4b06mr4059065e87.57.1726238099288; 
 Fri, 13 Sep 2024 07:34:59 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd466dcsm7692145a12.24.2024.09.13.07.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 07:34:58 -0700 (PDT)
Date: Fri, 13 Sep 2024 17:34:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/tegra: Fix NULL vs IS_ERR() check in probe()
Message-ID: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>
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

The iommu_paging_domain_alloc() function doesn't  return NULL pointers,
it returns error pointers.  Update the check to match.

Fixes: 45c690aea8ee ("drm/tegra: Use iommu_paging_domain_alloc()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tegra/drm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index c9eb329665ec..34d22ba210b0 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1153,8 +1153,8 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	if (host1x_drm_wants_iommu(dev) && device_iommu_mapped(dma_dev)) {
 		tegra->domain = iommu_paging_domain_alloc(dma_dev);
-		if (!tegra->domain) {
-			err = -ENOMEM;
+		if (IS_ERR(tegra->domain)) {
+			err = PTR_ERR(tegra->domain);
 			goto free;
 		}
 
-- 
2.45.2

