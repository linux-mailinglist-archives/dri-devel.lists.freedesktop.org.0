Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A22696C3D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 19:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604DE10E237;
	Tue, 14 Feb 2023 18:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0467910E237
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 18:03:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id hx15so42086069ejc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 10:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:to:content-language
 :references:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dFzXSZqTrKlRvGhc3FKZFlyiDoUaB7hSdoBObzMUKUE=;
 b=Y1nyFHXeor778Pkci3mbZgoqWYq6EFgaoDaD9Ck+xxU9TIDq+84sVRPV7xhXK6WFy9
 W7CgYfjChBcF9dY4y0XmREWz33d73B/Gkt0Qr3rU0uAmDTX1jXVkSLXbDsZKIUk/NXYz
 SXfPp3NzWpVs0SvG3jwaHz75ZwSOZPuArxFHS5/rOu+KDhRlg3pLLXcFkLx0n7NNSRCn
 W3JMyxZcXRcCJG5PWOjZLfpCFXo8nuqUCWht2msV162zWguq9i7v3//+tB+EHqEE0AAh
 1W7hw6xI2QlXmk7fQa9FQgrV0WCx/2YH93HDWT2LCQ22U8ORAiHHQ4t3FuRMQ4QfdlFR
 feNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:to:content-language
 :references:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dFzXSZqTrKlRvGhc3FKZFlyiDoUaB7hSdoBObzMUKUE=;
 b=hpVctb2aMi3d/q4eXz7YDAtYQPRVOpZ6UDyQ/NSPvzuacmYZHyv+OlfmxKBfrZBLKG
 yo9RlUqasJ0LPltnzUk2UzULbpND7mZTFRwygh9AySgahiCjA1WzMwh/U5uI+GtCut1h
 kLZkHh9H94mc9XxOVq8n/3EzscIHALe8i32ABQW749p1XKjGBI8oBiyIfXKeWgbb/dfb
 Il931WxerfEWtUScQ5uO5ksGVzjzmv9SKl78HSMfrf9GDJtqno1JsnGZheXI0L7IiqaC
 p+cEKYnbhBsXKeh9Y1uKE0ON/wD5+Fl/VgJIWQBMQkLq/xidP5vVB0xodHXN1Ygsz6TI
 Tzpw==
X-Gm-Message-State: AO0yUKWuQ0QpLuvX+ms5kmJUiHAQL861m7NlWS7+rxJtcn+16SbijWFT
 +ebftu9ArBqYLMPnTaOeeD9Ebw==
X-Google-Smtp-Source: AK7set/PjVP8k6wMDYx7UTo0AnHE/v/Bi07XTTqTljyW8qfRQL84edTcGsx3CFf3CreuJFhYhz9LWQ==
X-Received: by 2002:a17:907:a075:b0:87b:7c1d:e02b with SMTP id
 ia21-20020a170907a07500b0087b7c1de02bmr3142420ejc.36.1676397813413; 
 Tue, 14 Feb 2023 10:03:33 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709060b0800b0088550a1ce6esm8491519ejg.222.2023.02.14.10.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 10:03:33 -0800 (PST)
Message-ID: <ee96d47a-be2c-e85f-8150-57a77325fe6c@linaro.org>
Date: Tue, 14 Feb 2023 19:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH v2 00/14] GMU-less A6xx support (A610, A619_holi)
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
X-Forwarded-Message-Id: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


v1 -> v2:
- Fix A630 values in [2/14]
- Fix [6/14] for GMU-equipped GPUs

Link to v1: https://lore.kernel.org/linux-arm-msm/20230126151618.225127-1-konrad.dybcio@linaro.org/

This series concludes my couple-weeks-long suffering of figuring out
the ins and outs of the "non-standard" A6xx GPUs which feature no GMU.

The GMU functionality is essentially emulated by parting out a
"GMU wrapper" region, which is essentially just a register space
within the GPU. It's modeled to be as similar to the actual GMU
as possible while staying as unnecessary as we can make it - there's
no IRQs, communicating with a microcontroller, no RPMh communication
etc. etc. I tried to reuse as much code as possible without making
a mess where every even line is used for GMU and every odd line is
used for GMU wrapper..

This series contains:
- plumbing for non-GMU operation, if-ing out GMU calls based on
  GMU presence
- GMU wrapper support
- A610 support (w/ speedbin)
- A619 support (w/ speedbin)
- couple of minor fixes and improvements
- VDDCX/VDDGX scaling fix for non-GMU GPUs (concerns more than just
  A6xx)
- Enablement of opp interconnect properties

A619_holi works perfectly fine using the already-present A619 support
in mesa. A610 needs more work on that front, but can already replay
command traces captures on downstream.

NOTE: the "drm/msm/a6xx: Add support for A619_holi" patch contains
two occurences of 0x18 used in place of a register #define, as it's
supposed to be RBBM_GPR0_CNTL, but that will only be present after
mesa-side changes are merged and headers are synced from there.

Speedbin patches depend on:
https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/


Konrad Dybcio (14):
  drm/msm/a6xx: De-staticize sptprac en/disable functions
  drm/msm/a6xx: Extend UBWC config
  drm/msm/a6xx: Introduce GMU wrapper support
  drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
  drm/msm/adreno: Disable has_cached_coherent for A610/A619_holi
  drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU GPUs
  drm/msm/a6xx: Add support for A619_holi
  drm/msm/a6xx: Add A610 support
  drm/msm/a6xx: Fix some A619 tunables
  drm/msm/a6xx: Fix up A6XX protected registers
  drm/msm/a6xx: Enable optional icc voting from OPP tables
  drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
  drm/msm/a6xx: Add A619_holi speedbin support
  drm/msm/a6xx: Add A610 speedbin support

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  55 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 427 +++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  34 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  19 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       |   2 +-
 9 files changed, 492 insertions(+), 66 deletions(-)

-- 
2.39.1

