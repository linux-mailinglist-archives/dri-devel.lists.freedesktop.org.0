Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB66705BAF
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 02:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE91F10E387;
	Wed, 17 May 2023 00:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A05F10E387
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 00:07:44 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac78bb48eeso379041fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 17:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684282062; x=1686874062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yRzm5PPT5BD4ODS2ILevH+j7moTPTHenEszoJjog9vI=;
 b=vzEteEUQLRTDATg5aX9R0gyoWSONUCSJJ8/F8XGbtYjJKUgobI32Y+lTSwIOsMY27a
 K6fylQr7HO3dDIdF/OFqy9VXRJD0NqUQwXsEjl3S1folTzTeyBIgj5bj/Yzg4nvjjS65
 I4RYnGEH3uXf9jOHpsD6t/S1TKP55aD+uQUNc0j13iKc2N0wfi9rTyT0HjZw66Lo/tiC
 xtacgui7WyH9P9VAJV2mtTBJiMeUqXGsBVvuW1Mlbwmqi8LFdwhkaZbKIFhHr+Qb1E6P
 zTEl+9WtWPBYOT4G9Ka91+V+6ygcAhNKIfeuCHtVGWRbmFq+C6Brs3F+/9e2h1OOmg9B
 b44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684282062; x=1686874062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yRzm5PPT5BD4ODS2ILevH+j7moTPTHenEszoJjog9vI=;
 b=k9R6pXVziqbWYCOMki4Qqd5GZ1EfYFzsaQMF9Wv2//dxhh+Dc5cG6CWp0Typ7ut+d2
 wSyMv1ozrQglthoJUhIemNte+6W21SRAerYZ8bzSBJNZqCWefxjW141lLbNXHKpGG19n
 +IYBL8YPUL1L2Q1jakHxCDPVfqbGlh5DXEd11Rs6RK+gs2ViPl1ybIYkI6eDzv4/tniL
 ZmgmWgxpAC+0CUE7dgcZSW07DS39fq7KXaQ0NP1P09RNuI2QZ8tG6z7DmFLLMtvLDoVr
 ajYDP9ri3Yhb7zvdSZcAGc+NOjg0NtVHWdffNKxWC96H0NnQDsUJDAL7WlqWVbcryWDS
 YUAQ==
X-Gm-Message-State: AC+VfDxr3pNE9OT44Bed8a78bY6HiJAAEPNRPmJZ19qS8yQxcjzJZ2q8
 3BnXzZ/i+O6CNdS+Y/kOb2CG6Q==
X-Google-Smtp-Source: ACHHUZ40f4hA+3iHT9y3PR8mYkQ29Qlz5E8qrWBVOt9wkGSenObRHlE4jiFU3r6qIVM/5zILpoVJHg==
X-Received: by 2002:a2e:878c:0:b0:2ad:99b6:1720 with SMTP id
 n12-20020a2e878c000000b002ad99b61720mr9172373lji.22.1684282062271; 
 Tue, 16 May 2023 17:07:42 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y22-20020a2e9d56000000b002ac71095b61sm4214858ljj.64.2023.05.16.17.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 17:07:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v6 0/8] drm/i915: move DSC RC tables to drm_dsc_helper.c
Date: Wed, 17 May 2023 03:07:32 +0300
Message-Id: <20230517000740.2102599-1-dmitry.baryshkov@linaro.org>
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

Chances since v5:
- Fixed typo in patch #2 commit message (Marijn)
- Reworded/fixed RC table comments to mention DSC standards and C model
  versions (Suraj)
- Renamed enum drm_dsc_param_kind to drm_dsc_param_type (Suraj).

Chances since v4:
- Rebased on top of drm-intel-next
- Cut the first 8 patches of the series to ease merging. The rest of the
  patches will go afterwards.

Chances since v3:
- Rebased on top of drm-intel-next
- Dropped the msm patch to make patchset fully mergeable through
  drm-intel
- Made drm_dsc_set_const_params() ignore rc_model_size, picked up
  drm_dsc_set_initial_scale_value() patch by Jessica and switched
  intel_vdsc.c to use those two helpers.
- Added a patch to make i915 actually use rc_tgt_offset_high,
  rc_tgt_offset_low and rc_edge_factor from struct drm_dsc_config.

Chances since v2:
- Rebased on top of drm-intel-next

Dmitry Baryshkov (8):
  drm/i915/dsc: change DSC param tables to follow the DSC model
  drm/i915/dsc: move rc_buf_thresh values to common helper
  drm/i915/dsc: move DSC tables to DRM DSC helper
  drm/i915/dsc: stop using interim structure for calculated params
  drm/display/dsc: use flat array for rc_parameters lookup
  drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
  drm/display/dsc: include the rest of pre-SCR parameters
  drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters

 drivers/gpu/drm/display/drm_dsc_helper.c  | 1006 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c |  443 +--------
 include/drm/display/drm_dsc_helper.h      |    9 +
 3 files changed, 1062 insertions(+), 396 deletions(-)

-- 
2.39.2

