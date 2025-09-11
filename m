Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD06B53E21
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 23:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695D510EB96;
	Thu, 11 Sep 2025 21:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PXS3ZON4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2750510E133
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 17:02:18 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b00a9989633so202153766b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757610137; x=1758214937; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RSnllEdABgmRcLsHtfpUL8gI7RsqTdIWFArVq050vuk=;
 b=PXS3ZON4C2DXDmNLlmuavYwHjBEv13EKffC6ulLSOEXn3yEdfa5HpZ/hbmaD21SgSC
 YkHE5wY4QGTGJvJlr7/HvZbHNIi+3kZq3hsC+ifBBQsZPXwbJg0pAjj+LWFnF7l0tQqm
 1eGseU3j1Nj/36Q10kRq1VhmR0Dspvl7ydVM0QI2MA4/nxk8sKj2Z9uO2yvQpVZJZz4f
 DYi4BSefhWUzGi9lCOBO0k69KrC3kRqSvurM8bT1cPZdte68KKx/iZQQbfGZq9wKd+oh
 x0vssEPaTYFp54i0yfKq69zPRweCGi3WjRrthRH1qY5kvVCkf8vNw1/37AtnYoyJqKq+
 HYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757610137; x=1758214937;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RSnllEdABgmRcLsHtfpUL8gI7RsqTdIWFArVq050vuk=;
 b=KPRTFcgc6ZYCxkguH7BCMdmNoXAoIJjJTwftRxk51ZxG0Gw+AcNdIBd0PeMkpZdSZ4
 gjlHCi2aZJsYlb7kkBxoe7B4PX0vM+j8kRpPj1+juVBAIrY1LMY5w2tJWB/JQnuPZQWc
 kSfwp8sAa7cV+XROh0M42Iq9Zm8sdeSDl6Jlt9syyjezqKkbrQraIl12FVY/31vKEt7c
 hZ2S8lkvqrVJpndXFAtNpwYXwZFSgMT0+9N0M45O15Q+HH6bKT693sAU+t8bvuMukM+E
 fpSigWNHe4RUwd4IsJJ6wMQ/o3IF5oVutXM9ynYnIArtM7YLCR1W70Q+ZTc18ODdNMf6
 /oyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUERtgUYqffcDSTzUpEE5lpbUHiqkBKK8icQVDOrPFhhdo1W+mgV0/0Dt+GPRUTIotmjwVOAzjfwgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTtm5uWtkaJVXKGWMpg3xDUoTYlii0rlZ/cXoblBiftsxUhf6F
 79JhCRfOZRV4lYqtLpZS+UPkGFGSCO8I9Z7CJKswDZEqk8RFNMXrDl4=
X-Gm-Gg: ASbGncu2BR8j3Ok/eUGXdFnaEn1GFE4gVAJtLELQ0uNtwEo51xSzhqoQrF1Fhso4hsk
 wAXodRsiswZ82SVFiPQr/twrX4/MOAEu0tbz8aXdgcTdZpEzFC2NR2xidAXuypYLXzTr7eRMU60
 +ylWDXFza9XF+lSuo80eqdab/HbTnXV/p+TVbkqgwyct/9NQD4XP3ICO94aX6UwDXxBAOlId013
 1D+MRUu4jVgfpwrVQ2C6uUUICp2zXU1+fbjWiztZQVUzr9lDPDaCy+pSOSqR2JzGGgNNhUW+OzN
 4wFql5mCqiXRvOuyrwcE5GM72lb60kA7KfcwmUVB7E4IQ5l/PRPrUu/nFm5g3joj3MV+A5rbmIy
 bQuTyOvDVmluUrUyuv6tlOGdzwZ8IFcQ7jsFQbz0hSF7sIQIjGn0InumP+pu032c+tiDsnSDVXC
 5LVxKfi4JzAqba9GZeVxTx
X-Google-Smtp-Source: AGHT+IGVr9IIEZr+8Z2efkcqBDn+wu417ZpSCDs1Qv8LcIf/zr0I3mWUWCQKBCdz8daDEq9iNNIPEg==
X-Received: by 2002:a17:907:9623:b0:afa:1d2c:bbd1 with SMTP id
 a640c23a62f3a-b07c25b5bf1mr8227066b.30.1757610136353; 
 Thu, 11 Sep 2025 10:02:16 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-163-148.retail.telecomitalia.it.
 [79.12.163.148]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da43esm166632966b.14.2025.09.11.10.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 10:02:15 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Subject: [PATCH 0/2] Make hang check aware of preemption
Date: Thu, 11 Sep 2025 19:01:03 +0200
Message-Id: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8Aw2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0ND3YKi1NTcghKgsvjE8sSi1HiQquSM1ORsXYskyyRjcwOL1LTkZCW
 gAUClaZkVYMOjY2trAfxZh5lsAAAA
X-Change-ID: 20250911-preemption_aware_hangcheck-8b9b3708efcc
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757610134; l=1269;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8R6+RH+mErEiPPdYOOstKc0iqhFv59uOICnzE3FZ1Uc=;
 b=pxPb5b9aCV51Le4kGnwLMyZIQhK3o8Ug+ZnmnU6U5fkPwQolNF6qcJjTKzmy8b1c8ePzdfTmi
 FM4IB/E95smA3LI7KRo9fVl+MPFLaG0croAd8N0tJ33O723VIYSQ2nd
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Mailman-Approved-At: Thu, 11 Sep 2025 21:52:23 +0000
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

Ever since we added support for preemption hangcheck has been somewhat
broken as it is not aware of multiple rings.

In some cases it might not recognize that one ring is stuck if the gpu
switches in and out of it.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Anna Maniscalco (2):
      drm/msm/registers: Sync GPU registers from mesa
      drm/msm: preemption aware hangcheck

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 28 +++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     | 25 +++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c                 | 51 +++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_gpu.h                 |  3 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h          |  6 ++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  1 +
 10 files changed, 103 insertions(+), 21 deletions(-)
---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20250911-preemption_aware_hangcheck-8b9b3708efcc

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

