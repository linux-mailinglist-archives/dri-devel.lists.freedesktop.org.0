Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C28D6A5831
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AAB10E054;
	Tue, 28 Feb 2023 11:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8003910E054
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:33:45 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i9so12719298lfc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 03:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gksnxxX/SJU2VlO4S7zB6Wz+KfFZU/24XQ8BPKrME5w=;
 b=NtrmDXViP7EaLyJEdD7F+GwcHKGGv5Q3nGsFLVTXQh22Ev3JjLpBUDCys87d6I80Mt
 FPKVMcrsiYuHpJX5Q+1XwH4aANtwIc2KPClmfs5gZ8OnXKPHCCBLkwzP/ty6/aj9mwTw
 e7zvElqY+r7PS3FOpFnwBTMxiwrdyha9+fveC8flGbwOfYKPJ4oyGKcrrE6NNf1hng3Y
 /N+kq1kpDgCJgueGAGkl4r8apJAVK+mr6y4q9dmGgNEPiPbDKyS6RjaxaaQlJTSJB0Qk
 Gw3oQFK/Mx7/eePDkC75SftPYjPhWZi27cz+wRAXyEKpgPrYyOUWyG23H+T1R3J0ibQC
 QSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gksnxxX/SJU2VlO4S7zB6Wz+KfFZU/24XQ8BPKrME5w=;
 b=mX7go91FeupkT3B9ws7JOV9pn8EC11vQ21dEHFIL7I5E8phEuaS2MIHhcCbfi1bWkY
 HePslAt/gPcZuFL3sJDPPJgNM0xb3LnlznoDd+pxKh7V5HQZipNxyIidQWK/ejBIpOuW
 DGgBIspPpdhB+Ecx2SDfCSTS/Y37Z4pQutJhUJr1PyOR+E3o1pqdgUOFNA1QGULd7JJt
 rJHJIU5TFAmGpQymF8L6tax/kZC1j17k/kz3jcpr21NQwYKzTSMOdis8EVpjsXswHk84
 O2VSUhblTJk58+MHQbVGV6hyb2FGyBe+woQamLgbr1W2SUxeoIA2EDxXbdmeyHG6ceq3
 CgVw==
X-Gm-Message-State: AO0yUKVLOhNcOxPTrw4ZHAwMIR/jjXHs7Pj5quzk8PKwOR7I29OPaGLW
 cWatoz8iAlMcvjP+1/nlKM6KpQ==
X-Google-Smtp-Source: AK7set8LyLZxJ6mqchlZfX9cUnQCtJhEHIcCkYIveiPayIAkSS+07aUaymBatka4CHPDvAxThlXnew==
X-Received: by 2002:a05:6512:481:b0:4db:ee9:7684 with SMTP id
 v1-20020a056512048100b004db0ee97684mr681618lfq.56.1677584023607; 
 Tue, 28 Feb 2023 03:33:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:33:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 00/10] drm/i915: move DSC RC tables to drm_dsc_helper.c
Date: Tue, 28 Feb 2023 13:33:32 +0200
Message-Id: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other platforms (msm) will benefit from sharing the DSC config setup
functions. This series moves parts of static DSC config data from the
i915 driver to the common helpers to be used by other drivers.

Note: the RC parameters were cross-checked against config files found in
DSC model 2021062, 20161212 (and 20150914). The first patch modifies
tables according to those config files, while preserving parameter
values using the code. I have not changed one of the values in the
pre-SCR config file as it clearly looks like a typo in the config file,
considering the table E in DSC 1.1 and in the DSC 1.1 SCR.

Dmitry Baryshkov (10):
  drm/i915/dsc: change DSC param tables to follow the DSC model
  drm/i915/dsc: move rc_buf_thresh values to common helper
  drm/i915/dsc: move DSC tables to DRM DSC helper
  drm/i915/dsc: stop using interim structure for calculated params
  drm/display/dsc: use flat array for rc_parameters lookup
  drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
  drm/display/dsc: include the rest of pre-SCR parameters
  drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters
  drm/display/dsc: add helper to set semi-const parameters
  drm/msm/dsi: use new helpers for DSC setup

 drivers/gpu/drm/display/drm_dsc_helper.c  | 1001 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c |  432 +--------
 drivers/gpu/drm/msm/dsi/dsi_host.c        |   61 +-
 include/drm/display/drm_dsc_helper.h      |   10 +
 4 files changed, 1058 insertions(+), 446 deletions(-)

-- 
2.39.2

