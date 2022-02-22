Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498864BF1FE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 07:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5B410EF2C;
	Tue, 22 Feb 2022 06:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED7510EF03
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 06:22:49 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id f11so10087970ljq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 22:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIq4bg+MO6Oyb37j5MwhzM5fJY4ZyeCVsa1dQRFEVag=;
 b=M9KyMlC5z7brdQgMY8m7UEY+DN4P18MeL7FBguxBLadrVu7YscCPClmcEAdrnGHkJ+
 Zll6X5mzu9C7UQNAMdJeSQnh4VnoruGB1WL4/fYt+YgA36Ig2N4T4SnrmIc+Mz8kxxXb
 luOmdhvvXjWdyLn1BMXLH6WC9STKmS9VL2FQHv9GXcDQe9qctmvdnZb9fll76AAb9v6y
 Bb+Lv+Z7NbvFDoojK839CrYuiLImyhGWIUlBE4DU77vRAKeuc1YUxtl4W73bGV2sl95j
 ozljGlv2MK0zXmw53HvuCQwfOHptsDWS7khKVD2hEB7rNAckRWSEmStM1U2kbdO1B6hN
 2loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIq4bg+MO6Oyb37j5MwhzM5fJY4ZyeCVsa1dQRFEVag=;
 b=b6eQUn59sLm8DENpSpgEn5mmzQ/pAIy6BeArEPAjJz99drOUoIZVbeQZ86I63YZKCG
 VU+rjXNZRD5mHyFcAKoVAFTOqLf3wL2qSrHxkDSDCuN2z9RudpfRKup1K9fyZm64rk9W
 wOVOgi8Yni850ZD43NR15fOapHbW980nYvMLObBDjoNQPZQCjrZbb16/HCj7odAmdf6K
 JPnAU+m5eGA6MkZy/dOWUmn7B/trekaMXO6Rdq6qevvOWS0OBNchAP5hGibnsrVvpo7W
 Xx8tvIFJSHBT3VGodPR2G6egb3GbV6pFQ46SNFdnDV/t477EaHBvF/nvBzhDzG6mH12a
 4gZw==
X-Gm-Message-State: AOAM532ls4uRwDv7qIC5fC9BAfW8b5F2B6zf8aqK1m31QL0Zoy1LatMr
 XpINFoZ6mctkUhdAmFX4shWlog==
X-Google-Smtp-Source: ABdhPJzwn/5oF3bIJoVV/+i21nTWzNVckHU+8VeQm2lh4uABLti6/ykYwPcHN5EkYFE0IsGYCA2oEg==
X-Received: by 2002:a2e:86cb:0:b0:246:12b0:940c with SMTP id
 n11-20020a2e86cb000000b0024612b0940cmr16682411ljj.40.1645510968017; 
 Mon, 21 Feb 2022 22:22:48 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
 by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 22:22:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/4] drm/msm/dpu: clearly document INTF_DP vs INTF_EDP
 difference
Date: Tue, 22 Feb 2022 09:22:42 +0300
Message-Id: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recent dicussion on the mailing list [1], [2] outlined a need to document
which intf type is used for DP and which one is used for eDP interfaces.

This series implements my proposal [3]:

- Keep INTF_EDP reserved for 8x74/8x84
- Use INTF_DP for all contemporary DP and eDP ports
- Documet this in dpu_hw_mdss.h
- Remove INTF_EDP usage in dpu1 driver.

Main reasons behind this proposal:
- It's not always possible to separate eDP and DP. For example INTF_5 on
  sc7280 is connected to combo eDP/DP PHY.
- Using INTF_EDP would require us to split too many pieces, ending up
  with a singnificant amount of code duplication...
- ... for nothing. From the DPU point of view there is no difference
  between DP and eDP interfaces as found on current SoC generations.

[1]: https://lore.kernel.org/linux-arm-msm/0dac8ffa-89a6-d972-bdc1-3f7755c5169d@linaro.org/
[2]: https://lore.kernel.org/linux-arm-msm/be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com/
[3]: https://lore.kernel.org/linux-arm-msm/e2fab93e-82a6-4837-4ee5-ee1b16caa84d@linaro.org/

Dmitry Baryshkov (4):
  drm/msm/dpu: document INTF_EDP/INTF_DP difference
  drm/msm/dpu: drop INTF_TYPE_MAX symbol
  drm/msm/dpu: drop obsolete INTF_EDP comment
  drm/msm/dpu: drop INTF_EDP from interface type conditions

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  9 ++++++++-
 3 files changed, 10 insertions(+), 15 deletions(-)

-- 
2.34.1

