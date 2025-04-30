Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33C6AA44C6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 10:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D3010E6FE;
	Wed, 30 Apr 2025 08:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hs5MgAWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C130610E708
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:05:18 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so23473415e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746000317; x=1746605117; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qD6CtIO/TisXjPtHYMRMSY8vPIJC8aCPMTopK7WpI/k=;
 b=hs5MgAWqQnJZ/N2FCOjtup2RwKlamYdJpPYW45yLSbkEzCjWR4EOtby75117HmrIz3
 8nQVfW5T4Vfua7g4T05cWBp7/QYojmVyhtShN8sEc5dlY5vHjxTxGHGJyz7wq/9ze+ne
 zXZl4dPfjKvarNY+d0N5Lpd3+WVuTLfQevvGx2rBbsJAoxABdG6LoCkeD3SnPk/gQiLR
 3APcE0eIzdPI9xXPjyXJa1+DDWnYWPMqv0qPQ1L657E6vt2CdNKlMb1cHZ8mB/+YKd0N
 G+t/tIm8YegusI5UHhJ98e1qYz0N1PnutaXMB7gul6uzNFTOPAo8kK7xq6zU9WabMh0L
 jtfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746000317; x=1746605117;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qD6CtIO/TisXjPtHYMRMSY8vPIJC8aCPMTopK7WpI/k=;
 b=TllLUmubL5eMnuQSXr0ced77Igv6WwkHBEFZsCqhAyrGVfy2WKZgm8aowQHLagbcA6
 yE2M1xb2EuKktyiIkoJVMfIMaQXiDSEbs5cQSIc1baDwjvKbUECkVeYo8yd1jXWSYwAp
 DdqDpr0jUM96Xp4andAQhRvvjePG6Q5eJkD144UbQbvYxi0XLhdB8gnOacomNIRNEjpv
 5S6XOAzkO96DFNL4v8Y6LLVusnmMLpYlX9z709crcRsDe4rh8OlAQw7Bl3iz7gXrPiPQ
 pgg7Ij+EMBYkidLW/ml5jc3vZ3C6TITEvFGx07GGk2AzjG+qO9VPiYYY6VOhXNvD68Xw
 GOiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXisirFieXGYohBh7dU+dUXI0j7LMV0UgoK+YBPWM0iJP4KDyz8mn1AkicbacKIJ5UncMhe7M+KtgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjuY00g+2PK0KsWMZncMIrxN2L8ziKS+IJWBBaU3QXO6pxOmYb
 CLy7RQ8ZwCWUEcyYzUVnP3E/ahUZTQfWc9AdfTr3pGShQNfE0ZeOyMomVSVONVE=
X-Gm-Gg: ASbGncub03CSYDHMDLHW15+7keMvg5/F3mwFiaSY7o3tuH7StsfPbdoKnL1G7TcuiEC
 qqNR2Xt5omdRCzltDx2dQ7ZQGgwkO2QlTtbt6TUXgLB2fa0vc+eR4I3lt7ONsJAnwylPhgbzcKF
 zJbPJWDdh6kyR95w8HN/acl/DbxYAhKz1CI5cG8lSHw48+Y7luzepmBredZXdwZOIUMjGpDFHjP
 0BA5NSLPn/iYiDdaPzouy58e6HkTryl8Bji615NxUYdn+pDYBja0VOKdrrN9k0/Yr2ugGx7f36R
 b5ZmCo0zqfW6x4cVAw1GNvXxBfoI1xxxsIHCVd0X2YCODA==
X-Google-Smtp-Source: AGHT+IHdEtFR63Z6oiW9IVvngwXx6ZQiZzLOjAXgoM9uBkm6EKIWAveHvb1hm/cJiMmkSf12Z002jw==
X-Received: by 2002:a05:600c:c054:b0:43d:300f:fa1d with SMTP id
 5b1f17b1804b1-441b1f5fffbmr15536155e9.31.1746000317302; 
 Wed, 30 Apr 2025 01:05:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2b20c3fsm15479405e9.28.2025.04.30.01.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 01:05:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:05:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
Message-ID: <aBHZuejTTKkdnGaZ@stanley.mountain>
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

The "ticket" pointer points to in the middle of the &exec struct so it
can't be NULL.  Remove the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index b0e8098a3988..7505d920fb3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
 			clear = false;
 			unlock = true;
 		/* The caller is already holding the reservation lock */
-		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
+		} else if (dma_resv_locking_ctx(resv) == ticket) {
 			clear = false;
 			unlock = false;
 		/* Somebody else is using the BO right now */
-- 
2.47.2

