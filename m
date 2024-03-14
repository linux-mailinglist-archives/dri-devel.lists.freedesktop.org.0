Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469E87B605
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 02:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FF510E396;
	Thu, 14 Mar 2024 01:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vRHxUMNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C2810E105
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:10:46 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d4360ab3daso4771671fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710378645; x=1710983445; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GJyH63K/3kfz/t7TmUobgQSHCuwrTCRn+6jW9teKGDY=;
 b=vRHxUMNYwEI+rVER559L/S8oTJZpklrXwIIsl8lbRPzMauAX2Tk2XWfy9RqSCPXRss
 s/77y12Hu+G3JWMFUYtV9T+H4KiWsI0T3Ys/e1phQ3274RuI0yerqJTEfmAUUtfPkhdE
 52dGTZMngPHn8ib10Jgy1r1V6sl02kZJfYxI2GuCgvzr00c5CbgFMhhAm+p0N90nyo9X
 MWpUXtvYjbBU04GeiselAiYzlYmIzO7LaCortLnoANvOnuVDsO3WNWj+oBvobHuwTXwD
 aKU0qLgycUh4jEfiKjVTFMgrc4t4hfNbgPMiI0USqWbUoyL6ka1dXL30Xi0Mq3sFYQxh
 E64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710378645; x=1710983445;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GJyH63K/3kfz/t7TmUobgQSHCuwrTCRn+6jW9teKGDY=;
 b=rG2KZhFkL5cpSloHlpxcNfQIkiDIuK5nPeOvIplC716MDhjeFW0ZMLWjBuCyVR4MJq
 ip/4vtYU7L/KBzyaADFtcoqw1OBlVjHeEcTmH/5nT0WyeuI5q2h4wN0VWMLpQgromWUv
 ZTn8YFmsOBjqaj+0TbfPGpjwOMJmXoOmvz5KfNbu7GX+60L1mTmicF0f9OdDlRd0gAk/
 0/TUfQ6TXcgvw5g2JfZGxIZin9AMPd5681s5ae7bW9J6NN90Agy/TP3QvVtnF5NU7lM+
 dWqEdyCJmeVS0Euw0rArYCf9+NjWFgV712DN2/a2zQwESKBvTwNmmILgZLwdcIZGFt5/
 ej1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWun+oCLdP/yripX9KtCJzu9zjT5hlbfW9n8wIgmmcPB5eeOqiSHA7q1OiuG4xV8Cgf/+ymqvS9/erb+upB1010PidQjaCPDZbF7cGYh/H
X-Gm-Message-State: AOJu0YzWbajmnvnzcfv1pQus/OCDRGvofKdpb4xyWzNrPJA5qKC+Lnxa
 cBYIb/tF9JMmxP/FhuM3EtffeDvlUq9cDihabJiiif7B6nMzWNBwijju9Z+aQVg=
X-Google-Smtp-Source: AGHT+IHNqyh4yHjx4f2lbz11ebvSoKS23d+YkWVSiV98SJzvaX38j7nrhbk5X0mfm3vdlYU9TCfASg==
X-Received: by 2002:a2e:a409:0:b0:2d2:3915:cfc4 with SMTP id
 p9-20020a2ea409000000b002d23915cfc4mr132809ljn.4.1710378644793; 
 Wed, 13 Mar 2024 18:10:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 18:10:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/5] drm/msm/dpu: rework debugfs interface of dpu_core_perf
Date: Thu, 14 Mar 2024 03:10:40 +0200
Message-Id: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBO8mUC/x3MTQqAIBBA4avErBuolMKuEi2sxhoCk5F+QLp70
 vJbvJcgkjBF6IsEQhdHPnyGKguYN+tXQl6yoakaXala4xJODCQOhe5DdjSdm60xhibdQq6CkOP
 nPw7j+36H2rq9YQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mcoRDZpsdRWUc9CzNSaO1uzjelf+jpM6O+E6SIXUuPc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6S939S1AGBh+umrCI3yOyxFUeiuid7YfY9J
 eLvmg21yFKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkgAKCRCLPIo+Aiko
 1WYIB/9eQm1HoYYH4yjNQBS3+epCQ27cMCuT+cnF/b3Ygyzw9AmJcywdSc6XIb0Ga/KCxabJ6i9
 lWxXehoAdlnOXS36njJa0QEMb+hlBWx/SX1MgVRJBmq9q923yNKX5QYDgHoSYk5KC3o0epp1nBs
 GuC3uDm5UZcFzxKuScDTSKS+zAYLowsch6Clj+2XXwiRyyHbw714/qO5LqdMIk6AP804rUVHFrr
 yg08sOItnWxqXfYXHR56uyb+zaKuh6trBbAnNQMbO9gzCh1muTENOtitnvv0BGWoOF1X1vH6oKd
 VXh/rvoTq6PbqUQjN0q0gK8baYFrGeki5oi9RKm9levz4zen
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

Bring back a set of patches extracted from [1] per Abhinav's suggestion.

Rework debugging overrides for the bandwidth and clock settings. Instead
of specifying the 'mode' and some values, allow one to set the affected
value directly.

[1] https://patchwork.freedesktop.org/series/119552/#rev2

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (5):
      drm/msm/dpu: don't allow overriding data from catalog
      drm/msm/dpu: core_perf: extract bandwidth aggregation function
      drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
      drm/msm/dpu: rework core_perf debugfs overrides
      drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 160 +++++++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   2 -
 3 files changed, 44 insertions(+), 130 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240314-dpu-perf-rework-97fca999eb46

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

