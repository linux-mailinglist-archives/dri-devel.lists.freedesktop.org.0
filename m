Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4857B1B27
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C8710E60F;
	Thu, 28 Sep 2023 11:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A069410E056
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:35:38 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50481a0eee7so3283686e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695900937; x=1696505737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yd9c6ztV9NgOdZFl/EIKNBqH7SPpFlvCiJ4afy1QU2w=;
 b=EUXahAG+xS3GnKZVR+nulRVAUlQanOeukQjbIpz4CTNDTMbSB6Kewqdp5MEg32hoxY
 UbVUkOqspuTgvwOudY5MhM5+Hl8R8g2W85a1LZLpahzu9r3snTO/NSu3ipliavc7e0LL
 DFTw1Hm2DJM7f5Kf8wSV9rPka++OVNlcGfiJaate/N1Eq8PsH9VPh1Qi2XAsm/PLoHeI
 hyiBY6R/JOTlqh4bbF7rDYVRqEkwwg70dYoTUdlzCX/5zwFpUTBTZtKYrjtHz21eoUGe
 9SHCjKbwaSYNqs3lP6cnHLXu0oq0oMtKVo0Kdkk9Gnguzp6wF0mRfGY58MjP9ogpkRtF
 TLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695900937; x=1696505737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yd9c6ztV9NgOdZFl/EIKNBqH7SPpFlvCiJ4afy1QU2w=;
 b=ND1sGRxbw8ifry9J2PFHoDNkUIQ3U+bY58ggYz6NfyacmGi6YDtqjLkkTL0R73x7Mt
 ZdlC4iHNYKVzUUw3ujWdqpm8zCo/iyPZuaMlFh9vj+oCYjoo4SYbgkp8vbCWHr4Pb8ho
 UvPTzgQx5P/FtpkoL31Yr7AmNmWn4oEHQX1OG/APf51bPaTX1mYbzubK0RLUCE8ZrxCG
 pbrUw9GGqViv8rG8m4MuqqJ9AYHGD+SUJnksl3hzqBMIO72kBAhYHZ1VMCss/y43nhD9
 E/ZOWBsmuoiQiR3ijvhQf5XlsJw369N9lWHTT2WafViDHka9RM5BE2XVkqI3vGwr1fO2
 yUxw==
X-Gm-Message-State: AOJu0YwHQtR/a0/OKlmMgwrEw6OskuU8z8QYWQepdoD/LVQggR3zhTtv
 0e1rqqTtfVJeNuIkS+QxyAl0Nw==
X-Google-Smtp-Source: AGHT+IFptf8IZrGVaiyuvv1Y/4tf1gDesh8LBU7Yonb5WudtCFrSsWJ2l7SSrzYkZ+tT6JDJHTOP5A==
X-Received: by 2002:a05:6512:110f:b0:503:cca:e535 with SMTP id
 l15-20020a056512110f00b005030ccae535mr781994lfg.12.1695900936756; 
 Thu, 28 Sep 2023 04:35:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:35:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 0/6] MDSS reg bus interconnect
Date: Thu, 28 Sep 2023 14:35:29 +0300
Message-Id: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per agreement with Konrad, picked up this patch series.

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects. from none to otherwise
inexplicable DSI timeouts.

This series tries to address the lack of that.

Changes since v2:
- Rebased on top of msm/next aka 6.6-rc2, Dropped merged patches.
- Dropped the *1000 factor from reg-bus BW values (Konrad).

Changes since v1:
- Dropped the DPU part, the MDSS vote seems to be enough
- Reworked MDSS voting patch. Replaced static bw value with the
  per-platform confgurable values.
- Added sm8450 DT patch.

Dmitry Baryshkov (3):
  drm/msm/mdss: switch mdss to use devm_of_icc_get()
  drm/msm/mdss: inline msm_mdss_icc_request_bw()
  drm/msm/mdss: Handle the reg bus ICC path

Konrad Dybcio (2):
  dt-bindings: display/msm: Add reg bus and rotator interconnects
  drm/msm/mdss: Rename path references to mdp_path

Linus Torvalds (1):
  Linux 6.6-rc2

 .../bindings/display/msm/mdss-common.yaml     |  2 +
 Makefile                                      |  2 +-
 drivers/gpu/drm/msm/msm_mdss.c                | 96 ++++++++++++-------
 drivers/gpu/drm/msm/msm_mdss.h                |  1 +
 4 files changed, 65 insertions(+), 36 deletions(-)

-- 
2.39.2

