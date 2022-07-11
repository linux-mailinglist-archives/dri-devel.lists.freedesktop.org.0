Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878FF56FE13
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 12:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5B28D55E;
	Mon, 11 Jul 2022 10:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460F38D559
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:04:35 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id c15so5630332ljr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hj13ZiqObkaOLcE6w4x7CF884wdDv2XU3xp3e5G9fI=;
 b=NgzvOqIKxrVJxaa2RzduvweIyjbPQgBTVmvuuj3+0fexuOz0aEYqY2Djy2qGE2/KR4
 rDT5+ujcm8qnaoC57bJvASmSclvRRaO7HPrN9C9mp15RAY7Ob2idWcyMxmyOQ//jhb+q
 MsDvr0/PhFD7zdHXvXuZWKuTJHt1jhkf3dJg31b6pgYLbf8wGabplR98rWzoZJQw6DwG
 G277Lg72mOdBeJ8B9ojOxX97n7jd07UatZqOwft0u1zxjltY4fM3QhnIhXnX6b8DPYJ3
 2v3/lUPvYpb3SMvOgdqCnyJ4bifnhJ+QDNzt4Kr+03sKAOXXGxssiWAS1QUdgGIltec3
 m6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hj13ZiqObkaOLcE6w4x7CF884wdDv2XU3xp3e5G9fI=;
 b=koCPQZomF64rsYIdxI7hIZYkwZRH9V3sTPiWuf66FqpekNOzpDEbd0Ttjc/T4X7e3p
 o8qDKhz6sqqQWtgFEuEAyt6OXZdaXXM+2uDeGncz/YORQm0ElAZJf669VcQQUGaYDv89
 +2rL3OsFo4r7s1EVjlqga9k5wTlS3Yn8ECedaBbyUx1fl3FncAGM4Wh4JbaWxh/9hUtI
 xgv8GG9yi0gPrG0+PBMDgQuUlRNkpHZG5AJOr5BR53CbpyNs+wauoOydSt0Ue0Tgkyyr
 gkyX/SfHZ+2tkeK5XGChKfduuKzVBqmt4gMB1tQvkEHNrxdhZUm7zlRHMKjhBo2rnmrh
 w0qA==
X-Gm-Message-State: AJIora+dg1dFLP+08yqxds85S1AsH+P7bzsAYBNod2T1TLE7fJE7niM1
 /+kj1L4ZTj8Hhy9LE6ON/0D4HQ==
X-Google-Smtp-Source: AGRyM1s47svy/ETNMOOakiUtI0KzdReepltH2PaGmccM97MBg1UxHp2hlAdAppUtyrVWlCOgkGZxTA==
X-Received: by 2002:a2e:a7c7:0:b0:25b:b72d:aa3c with SMTP id
 x7-20020a2ea7c7000000b0025bb72daa3cmr9621303ljp.318.1657533873552; 
 Mon, 11 Jul 2022 03:04:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b0047faab456cesm1442882lfr.237.2022.07.11.03.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 03:04:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/2] drm/msm: remove struct msm_display_dsc_config
Date: Mon, 11 Jul 2022 13:04:30 +0300
Message-Id: <20220711100432.455268-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct msm_display_dsc_config contains just a single member, a
pointer to struct drm_dsc_config. Use the later one directly instead of
wrapping it in the additional struct.

Dmitry Baryshkov (2):
  drm/msm/dpu: use drm_dsc_config instead of msm_display_dsc_config
  drm/msm/dsi: use drm_dsc_config instead of msm_display_dsc_config

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  25 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  |  74 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  |   4 +-
 drivers/gpu/drm/msm/dsi/dsi.c               |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.h               |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c          | 157 +++++++++-----------
 drivers/gpu/drm/msm/msm_drv.h               |   9 +-
 8 files changed, 131 insertions(+), 144 deletions(-)

-- 
2.35.1

