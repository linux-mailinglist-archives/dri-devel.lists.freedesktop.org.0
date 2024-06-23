Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB89137EB
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 07:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C5610E048;
	Sun, 23 Jun 2024 05:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yaMpSkrg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0861310E048
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 05:40:20 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cc671f170so3735657e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719121219; x=1719726019; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8gsboRjLNvP365oqxS3SRWYp46DTNXjyQa5IQ3IG07o=;
 b=yaMpSkrgQXrSA5+j9Z0GoXJlXwS2954/lz00RX7oU/XDaahtXC9NsHQhAG88F6tjVN
 oZtCckvdINAJrbjYd25+qXClEXqGo2zZw/iUPQiuIn/je6GwWF3UvpTmwwmGFsMKgWnB
 m5gp/jChEmNoWAXNm4p9r4hz09/fbd3Sv29Iv04UhDRqyjUEVVp2uirqG8cZ769tJF7d
 uc5i719xqw8aVsKaOkKZYJcdmBiUqSxo4A4Nwc1hT9GQqRY1NiNYXNzlnRHJ8UeHSO5X
 hT9lw6Uxy2j41UHEvNGV9qKTmWCQbji/qRGsLyxIv+4r2OEpiA67M128/Ti8qP4eKAFB
 5FVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719121219; x=1719726019;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8gsboRjLNvP365oqxS3SRWYp46DTNXjyQa5IQ3IG07o=;
 b=bv4+RDXxPxDKo63poS+86fQm1Mw0T56xoKoWVFOqJ6R73muuLP+LNMOn3YKdt1gvSq
 LUqMeCwUNdHiLQ1MVxSVnOKJK5O6Mqb8Wbdw3DzPxqd3NsJjEXZQKUWD2Xxo+nh7QvxH
 /3yYhKZdJBKr8cAhcls+gqir6EJFqN80FPyxLZ7wSBaVkOK1Rp4Yk69oYvCz2khs7QL0
 kKAavRZhpCP4pGJ8DkfKkKhjTYfAZnzcw3t4Oo1m+5MLQIUZwkrXF+FMpi1od+Bl/tgQ
 +oC6gtQyDNe0sdXXxJ8O66kCRWZxTylwU2rtJpAVVtP1wkgtz4t1zRPCG8OVe5RDhiAV
 5miw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKYNohTmCzlQZqMrc0uGgnXCvjmkN2cqbNujCuqoEQjySpnLgaf8NGnJYMvNaDUvfq1Wxl4yasZ9HPin9P8/S2CGf65mtvt6IvDRdDTvdL
X-Gm-Message-State: AOJu0YzfisHVF474gvqS7IYatkslSvTps/ROCRnR47ZbjZINEUoGU2q0
 l652CqTyJzlt9tudVFD5A4+A0i1qG4+Xsd77Klj6Q9wFU570wyUZJ/QCF4mEQEk=
X-Google-Smtp-Source: AGHT+IH5bFasAMzG10xpgyO+i11yH1ExZrFAHzShjvIIzPkIswWRS/NjOB/xAMV9oDfsLvEVFOl0/w==
X-Received: by 2002:a05:6512:3b95:b0:52c:d5ce:16f with SMTP id
 2adb3069b0e04-52cdf348135mr1031235e87.19.1719121218828; 
 Sat, 22 Jun 2024 22:40:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63bcd32sm659696e87.65.2024.06.22.22.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 22:40:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] drm: fix two issues related to HDMI Connector
 implementation
Date: Sun, 23 Jun 2024 08:40:11 +0300
Message-Id: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADu1d2YC/5WNSw6CMBCGr0Jm7ZhSkIAr72FY1HaASaQ1U0I0h
 Ls7cgOX3//cIJMwZbgWGwitnDlFBXsqwE8ujoQclMEaW5vGVhhkxodwUMenGMkvSXDgN05hZhT
 KtKDx1DZuMJfKOdCll5Amjpd7rzxx1tbnOF3Ln/rf/lqiwbqkru3q4AP525Ojk3ROMkK/7/sX9
 6ErpNcAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=x3zgeMUTwoUy9QgsxTnuE+bkVAeAn87c0VbBknwvLvo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd7VBXUml0sqm6bcf7Rq40RxW7g1MXSd+b4MAH
 fNki5/F/kaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZne1QQAKCRCLPIo+Aiko
 1ZPZCACLQUaputyh1cxkGrc4CMFkKMrm+u6ACOXjAd0JE0g+8Xc1ERNFtsSlvdaot4QjhZszF5k
 OGXu7Wmew4TyW5qT3B+oVMqTeQim7z+xzDV5BqGxYlxcKtRlyqDjvhcyoPAvyPusxN75qzpJqeQ
 DcYf/LPLlLESejoQy1MUvfvxF9+G8Jc6ejhD5I/xGOgCUPvWBX/rJDy77Dv8SLllNjQnKYU9i/f
 ykV4hq623Y8DRUxGoQp4VGWKMQQX+gq2TA2JqJ/w4IXTlJKVL5T7+Z1fyWBCqM2JCU+qLdvle2p
 bZeYLdDhes+ZGEa2IOyrpXYKeC5kAMbPEtyd1CBeyD7pnqRE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Running IGT tests on Qualcomm Dragonboard820c uncovered two issues with
the HDMI Connector implementation and with its integration into the
drm_bridge_connector. Fix those issues.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Actually pass the flags to drm_property_create_range().
- Link to v1: https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org

---
Dmitry Baryshkov (2):
      drm/bridge-connector: reset the HDMI connector state
      drm/connector: automatically set immutable flag for max_bpc property

 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 ---------------------
 drivers/gpu/drm/drm_atomic_state_helper.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c          | 13 ++++++++++++-
 drivers/gpu/drm/drm_connector.c                 |  7 ++++++-
 include/drm/display/drm_hdmi_state_helper.h     |  3 ---
 include/drm/drm_atomic_state_helper.h           |  2 ++
 6 files changed, 41 insertions(+), 26 deletions(-)
---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240623-drm-bridge-connector-fix-hdmi-reset-0ce86af053aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

