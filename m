Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A576DAB7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 00:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B0510E074;
	Wed,  2 Aug 2023 22:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE99C10E05D;
 Wed,  2 Aug 2023 22:22:32 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686f8614ce5so280972b3a.3; 
 Wed, 02 Aug 2023 15:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691014952; x=1691619752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WqGEoOUd/ESEtcnLMxxkmmF+2HvAWe507ZrVsUYfvB8=;
 b=OZEvcpqTsk5jpWwDIykftqID19fsX3SOufb9DrLDherZlc5274MgSh1+i+496ZqGOk
 as+PSGpWPsvqG871b/RM7rD4jvxmwZKWwhV7RlfvcCgmGdaFqBmMfZhCoF2GqLP/J5dA
 eZcseDJH7xny2uktvB80RgF2OrDF3H5u83lgzvFNTRhA7O2vsCGgXzlssljQREN4IqdR
 QVgE01sreLd2x6WM/9Y6AFQq02dDszg9Fmakfae3IXD8Ne9MpHXGGDX2ApX1pukvx/FC
 RKnJJuFTtaJY5MCGXB4LoAqtTti01fCIiLwY2NLeFLlFOQno+1odnaJVBwlVdc5o9IW6
 rjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691014952; x=1691619752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WqGEoOUd/ESEtcnLMxxkmmF+2HvAWe507ZrVsUYfvB8=;
 b=Kj290JnmBJRHev3f8cf8EEGoprXW/r3DpWeMWyCssPj+G9lZGicz910pu96zF7DOrb
 tIzDfzd90asMcrI5ASesyVyuZJYJSpEJOV/graV6KioBDgjlfein3iNLY1UagpjGUI6R
 cXzD56nkUXNJIaTWWxV/EH9NYGl0QHC271lsphQEdpIA7dwaPM9epvNKYYXNwsnQ+CL0
 KE2Erl77psXr23iBBS3wC6A193OZY9G5DGqsLzE5KqbKdZ4nXejWG9QwP9Ws2tKe3cWR
 GmRr7sDq6ux2bX3LatIstPPuHCR9KuOllkPh9bSEjZmd96NLsUZfjOjJy1c7pmFNaYKL
 dQ4A==
X-Gm-Message-State: ABy/qLbvIZ0gR/tI5W+7OVQQO2Ad9FUFqvuKGmYgiXqIQd+JhWVeCZJ0
 b/pfl8Ob02Zmg+RPB3L1bBedLxnh0To=
X-Google-Smtp-Source: APBJJlEVl/jx8lxgTCVEF4qXOsOTXbqHOZPKR0q9TTQi6IBaid3v2Q0uzFoeq/tX416LiqSgz/urTg==
X-Received: by 2002:a05:6a00:1887:b0:687:7a30:deb with SMTP id
 x7-20020a056a00188700b006877a300debmr3224479pfh.15.1691014951825; 
 Wed, 02 Aug 2023 15:22:31 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:33de:aac3:fe1d:788])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a62b511000000b006875df47747sm2379495pfe.154.2023.08.02.15.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 15:22:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/msm: Submit overhead opts
Date: Wed,  2 Aug 2023 15:21:48 -0700
Message-ID: <20230802222158.11838-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Elliot Berman <quic_eberman@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Guru Das Srinagesh <quic_gurus@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

I recently wrote myself a submitoverhead igt test[1] and spent a bit of
time profiling.  The end result ranges from 1.6x faster for
NO_IMPLICIT_SYNC commits with 100 BOs to 2.5x faster for 1000 BOs.

[1] https://patchwork.freedesktop.org/series/121909/

Rob Clark (4):
  drm/msm: Take lru lock once per job_run
  drm/msm: Use drm_gem_object in submit bos table
  drm/msm: Take lru lock once per submit_pin_objects()
  drm/msm: Remove vma use tracking

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  6 +--
 drivers/gpu/drm/msm/msm_gem.c         | 57 ++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h         | 15 ++----
 drivers/gpu/drm/msm/msm_gem_submit.c  | 62 +++++++++++++------------
 drivers/gpu/drm/msm/msm_gem_vma.c     | 67 +--------------------------
 drivers/gpu/drm/msm/msm_gpu.c         | 20 ++++----
 drivers/gpu/drm/msm/msm_rd.c          |  8 ++--
 drivers/gpu/drm/msm/msm_ringbuffer.c  | 10 ++--
 8 files changed, 91 insertions(+), 154 deletions(-)

-- 
2.41.0

