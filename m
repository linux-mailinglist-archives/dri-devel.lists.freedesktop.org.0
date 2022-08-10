Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B94258E5AC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 05:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63078AEB8C;
	Wed, 10 Aug 2022 03:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BF3E6634
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 03:47:36 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id c185so16303195oia.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 20:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=oqmMiH/UG5akAdTqRaQ83MpJc5vNolPSY4pZFXlMR3U=;
 b=d2yNKN82ZsRLLnQyeZHfug7oj60n9rVTtuJzZxuzdA2uZr+3pJ7kKuFjVbqmF3FSBW
 4skQlE5iUTHLGyp/FuF0QBnJeWk00M4vjhk812IJfF+zPejn9uTSTwnZdqkQWxEzzvWT
 +UJ8W/NctdKqU9QGFk/qBy7m9x4vbvftfyItSygujwwLdh9VWOuL5YV52XadM5Fk323+
 FLJz8pGe3QfKGa39qGrPpl3hIF48ZYWfFtwm8Fn8idGijDnTzFMIS/FhBBFt6hG3NI72
 e8JW9VKueRF6q0kqHz2ghhWbwbuZP8DiC416SnZKnUJWzly5Qivzk2EzOZlt5xBEGRUt
 5NbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=oqmMiH/UG5akAdTqRaQ83MpJc5vNolPSY4pZFXlMR3U=;
 b=wFU2bvXJ6Eij1lAMZEpm4AhizVGwi7mUdEdLqEIabHhE2FUuBW/eC+NheE05seJ12h
 JdeWNbtmvueCw5HCCrarrXXTwfpgPsDs0K1Oj/pyDmbPBRU5ZfpEeOeufqT7clCe59Tm
 S7L8gf/hCqFnuucK32tCFSjxhfLVRj9cTPunbWhH8R+BhqYzX44R2FUH3U/8qw2Uqo2e
 MscNj73c4TVW64Qagl19rGfgQvVdfiX6L86S6n4C3xIG1sXP5XLn1S6A3i0swbgAuzpC
 MO3Wq1HmSqlfB5ognwzwhSYHqUfvFXKuupx2dyLrMivUU8oJYLz1WuZ8QhQ25xEokcKw
 K2yw==
X-Gm-Message-State: ACgBeo034wcKhUDZRdmZ+eGuE0P0mvbqTHbakGu43xz03srXt+32yHkj
 FLi4ZaujiClhXgW4+Q8jLpLJpQ==
X-Google-Smtp-Source: AA6agR6LW5x3u433YcgepMxhYX8BW9RBRp7nZ1Z8Bewtym4fkGsFpK5iTiXaqxM+6e7a63AdFH4k1A==
X-Received: by 2002:a05:6808:ec3:b0:2ec:8fcb:1d4a with SMTP id
 q3-20020a0568080ec300b002ec8fcb1d4amr681609oiv.162.1660103255928; 
 Tue, 09 Aug 2022 20:47:35 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 20:47:35 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 0/7] drm/msm/dp: Support for external displays
Date: Tue,  9 Aug 2022 20:50:06 -0700
Message-Id: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce support for DisplayPort on SDM845 and SC8280XP, followed by
introduction of drm_bridge based HPD handling.

The version of these patches are restarted, as the previous
drm_connector_oob_hotplug_event()-based approach was abandoned and this only
barely resembles that effort.

In this effort the HPD handling is based on the reliance of the hpd_notify()
being invoked by a downstream (next_bridge) drm_bridge implementation, such as
the standard display-connector, or a something like an USB Type-C controller
implementation.

Bjorn Andersson (7):
  dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
  drm/msm/dp: Stop using DP id as index in desc
  drm/msm/dp: Add DP and EDP compatibles for SC8280XP
  drm/msm/dp: Add SDM845 DisplayPort instance
  drm/msm/dp: Implement hpd_notify()
  drm/msm/dp: Don't enable HPD interrupts for edp
  drm/msm/dp: HPD handling relates to next_bridge

 .../bindings/display/msm/dp-controller.yaml   |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c           | 136 +++++++++++-------
 drivers/gpu/drm/msm/dp/dp_display.h           |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |   3 +
 drivers/gpu/drm/msm/dp/dp_drm.h               |   2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 6 files changed, 92 insertions(+), 54 deletions(-)

-- 
2.35.1

