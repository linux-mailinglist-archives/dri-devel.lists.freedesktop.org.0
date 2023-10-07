Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D232B7BC90F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 18:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5469A10E06C;
	Sat,  7 Oct 2023 16:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BD610E040;
 Sat,  7 Oct 2023 16:24:45 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-536b39daec1so5442016a12.2; 
 Sat, 07 Oct 2023 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696695884; x=1697300684; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vFIriXocAA6Pr+bHRL9FIc9QJhfcR0NHPuOKRd2IbkI=;
 b=CLnjpsVoCn8T6cSSW3ADMM8Eo6qKlFr+aK0ZYdQE8H9RuYkXp22aj/hK2DWK95BBsm
 33FriDIwiqDqIFQ1imBlZ+6rg716n1ItL+QUOv3e5N/XCpOwlw1T3cl5Fw051wniC0cC
 /S6lpXhWAdRR8CDv+0i4jEzqCx11/gu9C7366bvNljybmDfErygtFO9Wausc5f6SY7RQ
 yp8Z04jKh1W9ThrrldB58uzW18j/e00IATz5WSRL++etZalhanETESlTqzYWtbecR2L6
 ykQZPHOJRGPy1CY93OkG1SqsCiuECBRfqixxbJvGFQkPYmKlnT0yYMGpykuPodnQgLfa
 tdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696695884; x=1697300684;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vFIriXocAA6Pr+bHRL9FIc9QJhfcR0NHPuOKRd2IbkI=;
 b=vBqAHDeRPMsmyAj3cPK8z3fWg7NuBgTAgbpo/KJS/kWP4tkXKAWlSDiA/4xnyKTozc
 +2qmVeLEZJgzEZoz38CBVn70xlCP3cmGa9P6qmvck0NvSMeeZkIWjLMUxS1Yk4FGIi3q
 Vluw7TVO26MqAJxLQKa9VHTZzphHdK1p32sNJrxUymOtcWus6iZug980c77XzmtMaoWF
 FiPf31GFblB6HqtBm9t9eaDHWUnm4tNGnOywT89dOelcXobFg0SGFKg+hVravI0R26gI
 KsrxRQBF/wzbb09ZkM6yH+dCbO9+pdXIcoVCySIrlg33HNWgNQN5i9Hn5CZgYw/DimJg
 Lk5g==
X-Gm-Message-State: AOJu0Ywie6UJrQaomS0OiQYDVEwG/RgV/AT0ZjbeSHv79huJIQKA20zl
 lp9lVh6mzn4ngfLAuXq4xZnH6D4WekbF8cHLys0=
X-Google-Smtp-Source: AGHT+IHsD4j1DRc/IkP3+RAGwobooxqBt64YmDAsovbTVmBVaJWqPkWECd69kpfWAN3zIo/dDfY1AkNerWDQ66imRaw=
X-Received: by 2002:a05:6402:1b0e:b0:532:b974:671e with SMTP id
 by14-20020a0564021b0e00b00532b974671emr10209082edb.41.1696695884006; Sat, 07
 Oct 2023 09:24:44 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 7 Oct 2023 09:24:32 -0700
Message-ID: <CAF6AEGv-HNxQ=VBtZ8geGzYJum9jtManEdbvhcjo_WWF_J9Ziw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-10-07 for v6.6-rc5
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Late fixes for v6.6, description below.

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-10-07

for you to fetch changes up to 10f20628c9b8e924b8046e63b36b2cea4d2c85e4:

  drm/msm/dpu: fail dpu_plane_atomic_check() based on mdp clk limits
(2023-10-05 10:18:10 -0700)

----------------------------------------------------------------
Fixes for v6.6-rc5

- fix to not reset the PHY everytime we start link training but only
  do it if link training fails. Without this, the PLL unlocked
  interrupt fires causing "Unexpected DP AUX IRQ 0x01000000 when
  not busy" spam in the logs since last 2-3 cycles
- correct the highest bank bit to match downstream device tree for
  msm8998
- skip the video mode wait if the timing engine is not enabled. This
  was introduced after pre_enable flag for DSI video mode panels
  where we would end up waiting for the video mode done interrupt
  even before enabling timing engine causing error spam and long
  bootup times.
- check the correct return code of irq_of_parse_and_map() in DSI code
- avoid overflow issues in the dpu bandwidth calculation . This was
  exposed for high resolution displays and a critical fix to avoid
  atomic_check failure
- minor fix to add new lines in DP print messages.
- Fix to fail atomic_check() if the resolution exceeds max mdp clk.
  This leads to underflow otherwise if we try to allow that frame.

----------------------------------------------------------------
Abhinav Kumar (3):
      drm/msm/dsi: skip the wait for video mode done if not applicable
      drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to avoid overflow
      drm/msm/dpu: fail dpu_plane_atomic_check() based on mdp clk limits

Dan Carpenter (1):
      drm/msm/dsi: fix irq_of_parse_and_map() error checking

Dmitry Baryshkov (1):
      drm/msm/mdss: fix highest-bank-bit for msm8998

Kuogee Hsieh (1):
      drm/msm/dp: do not reinitialize phy unless retry during link training

Stephen Boyd (1):
      drm/msm/dp: Add newlines to debug printks

 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_ctrl.c          | 13 ++++++-------
 drivers/gpu/drm/msm/dp/dp_link.c          |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c        | 19 +++++++++++++++----
 drivers/gpu/drm/msm/msm_mdss.c            |  2 +-
 5 files changed, 42 insertions(+), 23 deletions(-)
