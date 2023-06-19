Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5051735C4C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3EB10E227;
	Mon, 19 Jun 2023 16:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D829410E154
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:44:26 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f841b7a697so4384635e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687193063; x=1689785063;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hk3+XLzwvUhnac+YdwTL34Deb6BoH9HZb6xFXJBKUGM=;
 b=TBZG7v7If7o/5pSou59M0mIZP5qeoKj+Nh+mbYavYalVGusJMKNk7Tc4+mD14X24Rl
 gB144EyGtNJUDAbx2Dsov95atHXw81pvbEShQTNGjnhskR2lKGiuqaeviwqtAJPxFxGi
 6TKUdnGIRwDL3EvyiH+nKoOZF6HOKPUD7UBcqhZZwCYoEbNaXQpF2F3L5kNEIy07hvmT
 Bf+Yg6MqCVGqiv4GzptJG4WS51vdxd7vEkjMKfcH8M3tVFUY9UcLWx8ITARFmsGVYGI3
 PyjSn1jqOfeTL1hel2r5maJzPRuz2fUJO6S0O4I9IjQYrQJuddFvVaOnwf51mPVSYooa
 9srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193063; x=1689785063;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hk3+XLzwvUhnac+YdwTL34Deb6BoH9HZb6xFXJBKUGM=;
 b=hExPDwh/5mYeBfIObPLASRnKh6QOwErrZO0MkIPnqbbNogBr1OgI2uIegEOV5IhKxw
 40jIFI6e3ioWw2CE0VIYa/ISAq2Z8aI0DQhKRMXapgT7ygXQSMWU0Hq1tH2ByJsBvlq/
 4JmQrw/KNru1D87yOQMQDECKChDvDxVR7j4/FaKiynL6PxH7r4AENVidXUKGAfUO3HvE
 9rQX3dtu+2h/1MtSKOC6H4v5T2Bj7B3vF1/+kiLZJAZSOT0zjG0L+jSRSbpy1Ftd8ZVv
 B7V/Bk4whi9AK6/ykfhXei3UjWzuL1BhQPFthuCjm2FradVyxZ2ARWj5l90BtHDE2seN
 7rBQ==
X-Gm-Message-State: AC+VfDz+Xq6hupYACuM1q37WWrMX++aRPnY2XZT3xnpRQAUWIBjMDH7r
 K01oeWyw4GzCEP2Y/KWnE64OeQ==
X-Google-Smtp-Source: ACHHUZ43YVyyMvpV79hwaPfXJTAxmlC/6e/OWjQ1pc/ydVIDwICbEz1/Yu+VrbtJj+Npcj/Fmg5R2Q==
X-Received: by 2002:a19:e016:0:b0:4f8:5886:1868 with SMTP id
 x22-20020a19e016000000b004f858861868mr4674410lfg.24.1687193063082; 
 Mon, 19 Jun 2023 09:44:23 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
 by smtp.gmail.com with ESMTPSA id
 d9-20020ac24c89000000b004f849605be7sm1774293lfl.292.2023.06.19.09.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:44:22 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/6] Adreno QoL changes
Date: Mon, 19 Jun 2023 18:44:20 +0200
Message-Id: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOWFkGQC/4WNQQ6CMBREr2K6tqZ8hFpX3sMY81taaEJa0iLBE
 O7uh50L43ImM+8tLNvkbWbXw8KSnXz2MVAojwdmOgyt5b6hzEBAKapC8jEO3nCU8/wckh24vEi
 slZGNcI7RS2O2XCcMpqNfePU9lbR0ft419wflzucxpvdunYqt/S2YCi64RFWfHVilDNx6HzDFU
 0wt22AT/AEAASqtGkTQYJz4Aqzr+gGkors4BQEAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687193061; l=1497;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fU7IOvGFZT+jtDrFsHSlPtEO+e2x+lA6EVgMfmK5BgE=;
 b=UBAMGsIGb0WZMAKEbrHuoXl8s1shs2X+HNxHtR5cntD9grU6aO3tDG/rzyE3s2Ad67Wy68QFc
 nhLhLOplWgZDaveJw0ANYhBIme+xR984zvUcx/LroWMxZSBcJ3WxeZu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series brings some niceties in preparation for A7xx introduction.

It should be fully independent of the GMU wrapper series.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v3:
- Pull more definitions from mesa
- Decode CP_PROTECT_CNTL bitfields
- Rebase on next-20230619
- Link to v2: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org

Changes in v2:
- Drop switching to using the GMU_AO counter in timestamp
- Add a definition for REG_A6XX_GMU_AHB_FENCE_STATUS_CLR, may be subbed
  with a register sync after mesa MR22901
- Link to v1: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org

---
Konrad Dybcio (6):
      drm/msm/a6xx: Add some missing header definitions
      drm/msm/a6xx: Use descriptive bitfield names for CP_PROTECT_CNTL
      drm/msm/a6xx: Skip empty protection ranges entries
      drm/msm/a6xx: Ensure clean GMU state in a6xx_gmu_fw_start
      drm/msm/a6xx: Improve GMU force shutdown sequence
      drm/msm/a6xx: Fix up GMU region reservations

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 21 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 ++++++++++----
 3 files changed, 29 insertions(+), 8 deletions(-)
---
base-commit: 47045630bc409ce6606d97b790895210dd1d517d
change-id: 20230517-topic-a7xx_prep-787a69c7d0ff

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

