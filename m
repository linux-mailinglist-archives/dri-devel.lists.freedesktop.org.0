Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B380A9963B5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBD410E694;
	Wed,  9 Oct 2024 08:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YVC8bN9V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B6210E696
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:50:26 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7e9ad969a4fso4122798a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463825; x=1729068625; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2OyEUM3ayYo8115Z625s6QVnBUkxirDaFIlKShu8dWI=;
 b=YVC8bN9VqwQZnenW0n0AOYekcHFdPcYgVY9sT44hjVL0lXyTC+B1dRSvxd+WcTKvmx
 Pox555qDAFEMdEvu36vEb9m3RW7TYmO6RZhFgHDadWYMLzJ53o1hK7Cl6Q9bPKS4yogm
 016ony3VeFWFRisEtteayzTvFTsefzkCUQQOpCuobVYDlLiKDBBDuxvaJ0ubXye5piPz
 Mpso4GFBVrMDP8r0PTkELabN20HkpBBWm0erfFDjltV9ECCuYNow5WwwPOx27fC6Htwu
 bvhHKxDdv6LC+6qW5COyc0VwxNKZ/Lu2Bgd6ZeANfhBb6GiACvY3rSDtpc4ahtDLzsl7
 cMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463825; x=1729068625;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2OyEUM3ayYo8115Z625s6QVnBUkxirDaFIlKShu8dWI=;
 b=Ke4/Y4xejp72L1HNHitdqXhzuwJbVpvup8ew1pTktO1ns86mjXi58Ox77fEYwuRtrT
 oGSUF7ucH8b2YVv2IQlK5FbDiCbDIAvhjgbbQv6n2VJJgDTW/AAxqSl+AfBe3/HWhh9H
 eZF/ApdIqUvJk0ItaQPJaenfDp42bZ8/94gz2KGheVMIem0Kqoocbbucf4+PZ0ekZocx
 nIts6h6yZoNXYuZ5dSmrNJgDzEovGGEByHOkk3zBTHCRn1b+QIoqu5lyAInng8KwYx/R
 DFuHXnKa6hXjNaUBh0V3OjS3U5nvZg1nyxVn0RnoD3Xl+2fI0bqGgoKIpuUK5PlAecgo
 GY9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxA+ugZVqAD2u4GTCHx1SYbJ30l8RhUnJIP1fPsZxsXoKbr/Wuknl0LN3PNKWDZ3gZB91/DD96yLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSHW8bHEC2fZ+/uRe9Y7MdcKppoUx3oITcOk/6dPaVoWe5eayy
 JmhBJAcSrAr2N8Dw9tvv6ga6t2uR6xlw2aS4p3eF3YST/cUup4Lpw36JmrAFsbU=
X-Google-Smtp-Source: AGHT+IEi7ccLOgI20JoLj/kcBWBw13/ExjkVwWKywTKVTU9eWF12FpV2TM3Gltp794cZr9uzgadrLg==
X-Received: by 2002:a17:90a:8a04:b0:2e2:bd4b:ac2c with SMTP id
 98e67ed59e1d1-2e2bd4bacdfmr3881a91.31.1728463825310; 
 Wed, 09 Oct 2024 01:50:25 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:50:25 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2 00/14] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Wed, 09 Oct 2024 16:50:13 +0800
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMVDBmcC/x2NQQqDMBAAvyJ77sJm0bT2K6WH1Kx1D9E0q1IQ/
 97Q48Awc4BJUTG4NwcU2dV0mSvwpYFhCvNbUGNlYOLWEfVo6eY7wt2jcziliHkZRkzRDD9biLh
 lW4uEhOyq0XJHV9/zK0At5iKjfv+3x/M8f677qxR9AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=3537;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=XuK8SW++hJbjdzuyT7G+3SNIautCdVNCl8sCs8qP274=;
 b=ypkLgaejJJBfn8jsdKs5HuLSGpjaaUfbXDqk4/kz6wm2nHJj7vcUY3P8taEhMblC4agtxfgWQ
 Azg2zfY8HxMATfMLlvCfmkvT4cBepPS1zuDt+iWQaLiu/jHWkCI5hpA
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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


---
2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
And 4 DSC are prefered for power optimal in this case. This patch set
extend number of pipes to 4 and revise related mixer blending logic
to support quad pipe.  All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

This patch set depends on virtual plane patch set v5 and flexible
number of DSC patch set:
https://patchwork.freedesktop.org/series/135456/

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>

---
Jun Nie (14):
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: update mixer number info earlier
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: Support quad-pipe in SSPP checking
      drm/msm/dpu: Share SSPP info for multi-rect case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  74 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  69 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 408 +++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 210 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 15 files changed, 478 insertions(+), 364 deletions(-)
---
base-commit: eac5b436019c2eeb005f7bdf3ca29d5e8f443d67
change-id: 20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-1142507692ba

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

