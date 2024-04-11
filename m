Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE9A8A206A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 22:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C5510E05A;
	Thu, 11 Apr 2024 20:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OtsSrZC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F8A10F35B;
 Thu, 11 Apr 2024 20:47:24 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-56fe8093c9eso169619a12.3; 
 Thu, 11 Apr 2024 13:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712868442; x=1713473242; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pNvwduxpSq9WO+e0WyOpsKd++VksO+huhp6HjRMGyn8=;
 b=OtsSrZC18hQnu7uMSXF9EvwfdbKEw3pZFMXKr5ep0XCj/TP2Ekdrnihq0O7RtHH6oB
 WyJa088QeI4BY0RSL1jwjQ4fg90WRtrzTJ05QMD+dIf9LBj917+2s3ukG99ZyPueO+XL
 BN1q4khc8GmOrd0VSzAyt6CbaV09uVQX7mNWNO/mwzSOnyVh/gMUtqrDpVZk8EjYNwa/
 bxs+YTO2eKDwQbbzLwo+ze4Uqg7lRkA4wSEhF1vMCewg4l51EpdE9SrQoZpWP6EPlocY
 TGpbyAp/JQZS38BaR+LtdD9f9Ylo1v8piO5ScrgLvAzjsMLEhf1pBARzpPgescSdMWfo
 uUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712868442; x=1713473242;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pNvwduxpSq9WO+e0WyOpsKd++VksO+huhp6HjRMGyn8=;
 b=Dh49yZWwpFxCqBYdEHlBYxW3rWiqSgtXv99na1/96y7IbsDNM0rO1HXFlPNnrnRhbZ
 2eQWckeFjYo1p7/2/uvSm17z5zDthCPnKZuq7vjdXnGkRLKxL+MG9p/3sEqjfyXG9pWj
 0IoVOxN15g5XkY3FP68m8ttQwzdz/ezW14x82Po8kl6zeCeczxCmYd/d8C3Ls/pnI0yv
 gRUz+0Xp4hUb+WhVt2kJqDoALScW3/bTrW72U8LBhHppDd7KtrmztgqEY9gwEj/Mg9yK
 W/MpocXUbkxPNtoaIRYDA+lkkx7JvDNknq/7diXaphRqtY2VFsJt9x/WY+R9gnlcNjNj
 WUmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9gD2oqEeUQirAx7HJ/+HDFkUkR9IWyxEepEjV+CVexl6M3s2aauXbL+6TBF5ESD5axxa/6VFjpfWx4LdlsQVCQquOp31HuJtUFm+z4HKB
X-Gm-Message-State: AOJu0YzFb7IRYyLl3mn2vjB9CHXvXfpdrjn0sIYtN5HlGVbCIrY3h7Rm
 kRzMaY95StqKThD+GJJxjyKNHHagheKbLfq3UHpYQJTu2bE5iAavOMlqsD92uKxnuNxLc8MM3t7
 QidmTnuKCDesWU4IrLgWNjXz3CzI=
X-Google-Smtp-Source: AGHT+IEXC8vd601g34DAlg+5kxr80HRO5E3BH8JsV/SefNBnF2wjRLMMLGOX8rcfSfcyTwdASctFl8TSdN66D0UF2Co=
X-Received: by 2002:a50:931b:0:b0:56d:f5ff:83ab with SMTP id
 m27-20020a50931b000000b0056df5ff83abmr572001eda.39.1712868440830; Thu, 11 Apr
 2024 13:47:20 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 Apr 2024 13:47:09 -0700
Message-ID: <CAF6AEGvFwRUcHGWva7oDeydq1PTiZMduuykCD2MWaFrT4iMGZA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-04-11 for v6.9-rc4
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Dave,

Fixes for v6.9, description below

The following changes since commit 4be445f5b6b6810baf397b2d159bd07c3573fd75:

  drm/msm/dpu: capture snapshot on the first commit_done timeout
(2024-03-04 11:44:03 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-04-11

for you to fetch changes up to 9dc23cba0927d09cb481da064c8413eb9df42e2b:

  drm/msm/adreno: Set highest_bank_bit for A619 (2024-04-05 11:24:53 -0700)

----------------------------------------------------------------
Fixes for v6.9

Display:
- Fixes for PM refcount leak when DP goes to disconnected state and
  also when link training fails. This is also one of the issues found
  with the pm runtime series
- Add missing newlines to prints in msm_fb and msm_kms
- Change permissions of some dpu debugfs entries which write to const
  data from catalog to read-only to avoid protection faults
- Fix the interface table for the catalog of X1E80100. This is an
  important fix to bringup DP for X1E80100.
- Logging fix to print the callback symbol in the invalid IRQ message
  case rather than printing when its known to be NULL.
- Bindings fix to add DP node as child of mdss for mdss node
- Minor typo fix in DP driver API which handles port status change

GPU:
- fix CHRASHDUMP_READ()
- fix HHB (highest bank bit) for a619 to fix UBWC corruption

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: fix typo in dp_display_handle_port_status_changed()

Dmitry Baryshkov (3):
      drm/msm/dpu: don't allow overriding data from catalog
      drm/msm/dpu: make error messages at
dpu_core_irq_register_callback() more sensible
      dt-bindings: display/msm: sm8150-mdss: add DP node

Johan Hovold (2):
      drm/msm/dp: fix runtime PM leak on disconnect
      drm/msm/dp: fix runtime PM leak on connect failure

Kuogee Hsieh (1):
      drm/msm/dp: assign correct DP controller ID to x1e80100 interface table

Luca Weiss (1):
      drm/msm/adreno: Set highest_bank_bit for A619

Miguel Ojeda (1):
      drm/msm: fix the `CRASHDUMP_READ` target of `a6xx_get_shader_block()`

Stephen Boyd (1):
      drm/msm: Add newlines to some debug prints

 .../bindings/display/msm/qcom,sm8150-mdss.yaml     |  9 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  4 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 34 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 10 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  8 ++---
 drivers/gpu/drm/msm/dp/dp_display.c                |  6 ++--
 drivers/gpu/drm/msm/msm_fb.c                       |  6 ++--
 drivers/gpu/drm/msm/msm_kms.c                      |  4 +--
 9 files changed, 63 insertions(+), 20 deletions(-)
