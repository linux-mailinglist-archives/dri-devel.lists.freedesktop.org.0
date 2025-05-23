Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998BAAC2730
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 18:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D8210E82D;
	Fri, 23 May 2025 16:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y8ctUDuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1F810E82D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 16:08:14 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-551efd86048so37298e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748016493; x=1748621293; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
 b=y8ctUDuM8b4RiaQegDn5WTGd2/ZOlKIdTSFLeJ2LNFRfP5gBeCoKGmL/Y4SuZK3xek
 ZzZdUSeFsSBg6lkaMmiIP6ZkCcaZRmrzF+OlNp4pD2Gp6Qx3gDjnmtPABV40W8gtjRLM
 P64Sy12k+A17DZ92YVjM3R7gXBCIrewS9kIOABHwQkloMi2SUOBkBScQs/8mTydjuLRe
 BKfHqvdNQJ814spp9hP2EkenHA4E+z5+FDllKPNb/aicpqCY+Ny3l8ISkIGEqjGdvlO+
 jjJVQ5A+OHGbH8417r4xqR1P31rVJZGfy8ki5q/VdeD1boZwmSeca8jWGreXmTjuvUTm
 A+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016493; x=1748621293;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
 b=f3gu1DJ8zthLbXZdefnZ64Hngv/eNYFI1qAXUu6HLoHU/E1HkkcpFXYIm+qoANpYwx
 tn+H3RTY+ED9gjmxyqxftFsMo5JOi4ivr6vb6idPSc7VcrHhqdwwZpI8CPAlZ9OEazUU
 NWnAzIUXI9bmOl5xgXKDi8RogzDIejaO0qMQgRmDSQXmxE0MxZxwQl8qdcrCa/Ypbm28
 mXblJGbM6EOhLPDkHlkCpqfVNBK7lN07/ciAm3hiEqbUaMH2WJFMek+yCqyKznKTuNbq
 RByo705xEA07/WKshP7zClX6w5bcilA3GHxMETQZQUX7OMf9+brYqSYTqgw6B4bx7VaK
 NCpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd5qAToOr41C8g90aFeAsQl79wxSgNuXv/yQk1e083YcY3wSGCXluDMqhPZM8FIIcD/l0dKOEOs6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywwmw5IjH4/mf0eTmaDlvcoziGnQLSolFk7GWNdwGgdA5TX6BKg
 KYLOTq63wXMp0tcOOfqnAWquB7pDA3p5E7hl5Sb+JA7cvLZv+yP3dcrTo0F/yQYbsCvKKndLFL8
 XNUOf
X-Gm-Gg: ASbGncuKMQsEpsqtOH9cGQCIQgDSFeMIthaSdSjkrW0Y1WkOr3l+KlGTzwoYH5z0O3o
 PD/Rso7KalQMO3kVD4Ex7uYIljmdhHSrNzXH8pIuWwcRR87wjqAURSp50IWFOeRD+bx0Y6Rk08g
 0ITPkQ/cq4OIW+3A4GjF23IZYYi0SrhpCExS0erw4dLW7tmKI9/5ejPM5XYqNqSJspQHqwvJsrr
 gq2zxoH+TcgXt8e+ig9oyWU8IZOuX/1G2GUswoa3hGGCJ1QJu6xXcJK4Jflr5sG2kS71FAnMcN+
 zeWH8Oz9EvFijmsUY+dUbGNzVra6O8DD970+eI2H2xUViYFh69I1syMAbMO1cyC3Rcg=
X-Google-Smtp-Source: AGHT+IEgnqQ89pTDpIiXTK+5YoVr8iR1h5pIE/WFcVljNceH6shNrv9ACEId9Fo5qIq8B9APct4R0g==
X-Received: by 2002:a05:600c:3b21:b0:441:b3eb:5720 with SMTP id
 5b1f17b1804b1-442ff0396b5mr274072555e9.29.1748016482352; 
 Fri, 23 May 2025 09:08:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a368136014sm22978069f8f.92.2025.05.23.09.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:08:01 -0700 (PDT)
Date: Fri, 23 May 2025 19:07:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Timur Tabi <ttabi@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/nouveau/tegra: Fix error pointer vs NULL return in
 nvkm_device_tegra_resource_addr()
Message-ID: <aDCdXk98AhLBcWvK@stanley.mountain>
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

The nvkm_device_tegra_resource() function returns a mix of error pointers
and NULL.  The callers only expect it to return NULL on error.  Change it
to only return NULL.

Fixes: 76b8f81a5b92 ("drm/nouveau: improve handling of 64-bit BARs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 0ca2dfe99676..114e50ca1827 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -196,7 +196,7 @@ nvkm_device_tegra_resource(struct nvkm_device *device, enum nvkm_bar_id bar)
 	case NVKM_BAR1_FB : idx = 1; break;
 	default:
 		WARN_ON(1);
-		return ERR_PTR(-EINVAL);
+		return NULL;
 	}
 
 	return platform_get_resource(tdev->pdev, IORESOURCE_MEM, idx);
-- 
2.47.2

