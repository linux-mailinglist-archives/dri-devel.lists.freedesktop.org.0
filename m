Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFAE9F2BC0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9724210E3DD;
	Mon, 16 Dec 2024 08:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ll797d2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B04F10E09F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:28 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30227c56b11so37988751fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337646; x=1734942446; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TrrxPcocFaYUg6/aaiKr4KpBya9ZDGEcbUvoC1inEjc=;
 b=Ll797d2zG8NLiXtqY/q/TzbqbtLLhsAjAzUlADtRgUadcENGiVvBJX6yVHnekQGJFu
 XCBApuTOitONyPZ6lvcZeMe0ezGvdfNA7tFWrp1UdDUIQlPMzDrBUYW1UzxfK0W8o32t
 MDwXGUdQD3lppAOs8U7gaO98M+gdiQq4W523pSPA69f/gb3I/z2fLWw0OOHCDdxHV5zC
 /ByMDXoV9fbcbIopwyKgAwGqdrYFgKZT1D95YUm34PTDHmjUi3PnaxjB3scnAC6A1uvF
 PnlnyfaNM+QlBRJHKmmDKGDMXgEwGjUAYc00Tumv1+HCCti02dfY7uqlXwgzDKOjHE7A
 JJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337646; x=1734942446;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TrrxPcocFaYUg6/aaiKr4KpBya9ZDGEcbUvoC1inEjc=;
 b=YM3du8xETYYJs1OoUxF88D+oxNYUyrKM2UUSth6JsXtkT4TljKONXG3UB75RrU0dlS
 rwDmTpMO6PtfS1TPLR4q3FMamiSVjacWd1aGKa5EjC5PCxB6ycobGzqYKJ0HqmlkpoWR
 Kdl2Aw7Nu8P+DWAFok0FNC4PXDtaO7hXUnwZZjd2gf9HCJq7F8YwuxMf/NScKdHzpFg4
 FzxsxthvrdinmxBbAJyhGevOsSgefifZS7PnOPEd6vpdnhFqZYfh1ssHHXPM/2tnJLtF
 wFwb1jhfCrNb64B6PmL+Yv7uzJqrJvLFA7rG8FArvOC0mcmS9uu2fDu2dIkPy9qWRYfV
 2L1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/iCDYQd6TN8REXjb/9mfOMd/1gSPOTrmRKUQwdh+DZdDxI0UNdCDcbdYqw2t0168WtdvQwhZKFdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwterRcawDLgBdi2R+6nHpavAH2qsgNOsXwvKLFxhOs5nwBxHCv
 d8KjxeqXKWfCYqii6QP+rR4oHvWmytBNA8WQaWuvXkl0lzcWHZfo61Z5T1X+y3k=
X-Gm-Gg: ASbGncup2iftgIXSrK8j2jv7U3Vbqprl6fN+5RrJAkRW9K4C6yLYplDp4uaBues0jtm
 12n8mvA6k4qOpxU+C6B3yPygfJn0xrwU9qsupyH9ec14WvBi7+ZTTjfriNo+oa+Y9vUNH6jQOmM
 pD1Fqg7hmiKAzRQFMwcqygSUDPXSsKwGrHE9IPisF25mLerojjzFUE7NqW760d3XZpJD302oe2s
 ZiaYGb/SlECwvdZRdmUM5m+eISZ65aVXsIXelExDT5i/m9HFsM2iaGlQ0RMGZjJ
X-Google-Smtp-Source: AGHT+IHJD+NR/PgyKHAepDFxbWTM+bPz0btqfBlgq5msCTR8EAXGlLoqNe5rUltrMZ1fu4+D0KYY+w==
X-Received: by 2002:a2e:a304:0:b0:2ff:d7cf:ba1d with SMTP id
 38308e7fff4ca-302544d3e10mr22023831fa.41.1734337646540; 
 Mon, 16 Dec 2024 00:27:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/8] drm/msm/dpu: catalog corrections
Date: Mon, 16 Dec 2024 10:27:21 +0200
Message-Id: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGrkX2cC/x2MSQqAMBDAvlLm7EAX6cGviIcuYx2QKq2KIP7d4
 jGE5IFKhanCIB4odHHlLTdQnYCwuJwIOTYGLXWvtLIY9xNnvjG4w61bQmuc8UFGbxRBq/ZCTf/
 HcXrfD2b2XZ5hAAAA
X-Change-ID: 20241216-dpu-fix-catalog-63a3bc0db31e
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ykwoi/viuVCnZ52OOZsyH+WMXqN9YSgRldwQks5nM6I=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBnX+Rrj5j0J476K3SjRlnLe3dn/SHhLoulfsOer
 1SNLqNKw46JATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kawAKCRCLPIo+Aiko
 1eNiB/jdFVPQLWJTAqF2b7SQPaUkr+lMQqnqZ9FD2Trnx1/ZwVfm7m97liH9CqMc1xRiYyQm9LC
 QGIsgTt/kCynT3KiZA0e/5vQHw2lkoMLl/EejnQm7EaePkGl2yqfKbgfUoQpq7JYQdeRpDzz8PB
 y2HV5jzJGaL2nUP1e4QFMrYxCogCHfegRm2VX5N4iC0Hd1n4A93U6gw4Prfts7LK2R5kin9NPqk
 Gkfz/q0yXlD3JOYX5CoohmqcIazE2VVpsVzCmrJ7Ok997COxERZe6msT8Qln7MPcbuq/amWQrmo
 amx6DuPtTNU720Yf4ywYQnULpgnaWBPjP7olviV/DG6O/JU=
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

After checking the DSPP units in the catalog vs the vendor devicetrees,
link several DSPP units to the corresponding LM units. Each correction
is submitted separately in order to be able to track and apply / skip
them separately based on the feedback from Qualcomm.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (8):
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
      drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
      drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
      drm/msm/dpu: provide DSPP and correct LM config for SDM670

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  2 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  2 +
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  2 +
 8 files changed, 66 insertions(+), 2 deletions(-)
---
base-commit: 4172e9bbb583a2af5f1a3db437caf72a90714ad9
change-id: 20241216-dpu-fix-catalog-63a3bc0db31e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

