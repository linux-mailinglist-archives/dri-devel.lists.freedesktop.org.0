Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C169566B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 03:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02B210E7BF;
	Tue, 14 Feb 2023 02:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA6A10E7C2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 02:09:59 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id z37so6733591ljq.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 18:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NUZxia39KmOd95/1X/mi4qtVDn1DxbEw4iWrgdt25uI=;
 b=D884lBTIs+xeTiJamcskBqMMshJVklBckHxzHVJxhoDR4+M994/O9OxtVHJEN+i9bR
 /9gFPB+SnSUvedKTMQH3YalhfCiY/CB01RrF120YLcEHn/HKeMmLCmfGyHQIwSh86bSv
 1icvXTgLruDkuPJ+GW6/9ZevCu+F6Ouh1tkBjaOJgnk3aNDxYJ22Zd5XluzKQJpf/1op
 HJgRqTz5lQF7H6lPsUKqVfOq1meXrYabA9JfyibStLrKCiVmG5zv4Lh7BROKOrzvfU4W
 TCtLm0Ds8wesAkHC/pkQomKL+FftX9nIHyQXVEksO3EPfW2kyoM9roeOm3SLvAEfYqU6
 C//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NUZxia39KmOd95/1X/mi4qtVDn1DxbEw4iWrgdt25uI=;
 b=AfSGU7GrdNN7svDqC0nRsQ5Lh/nAuC+pnfBFhvJXGEBChQleKJBCIdfQEisrMdAANt
 I+oCLVpmm5wHWk+uzl57yyQO67ZNL+IIQ/VkRZoSGEhNSYPsOTnaF659lS74d9R+JQp9
 GhzDVSzwOzKOqPPoYc7AcFuthi48m7F0fqN31612fypyWYsjdvIgGISBJjYZidyQUqZA
 96j1t7ZNyd4yxlB8+aDj9CAIhHoPLT7kBQ3Qwe5X+hGsy+6HXcgsR9JRcGYeGNJLFubn
 sOQtmfaNPM4mUN3c/ndCDT0pDalSAdbeU+5I/lzzFT3T3pv+TDAw3sRrLaivayB2sx2H
 +BSQ==
X-Gm-Message-State: AO0yUKX2ckSlxw9zH4i8y/FNRkD/nfNNcz09aVkVX1XB2NHxykzcaZMl
 8wMvFpXfaoGrQAhXSN+Pqi8llg==
X-Google-Smtp-Source: AK7set/UWLb5Lkz55p0NgV+9IoDwUsfA2RFxX3Vl1on0pxk2ofkmeDEDDcfWuFkHvYwooh4eknAC1A==
X-Received: by 2002:a2e:6a08:0:b0:293:4b59:52a3 with SMTP id
 f8-20020a2e6a08000000b002934b5952a3mr97952ljc.2.1676340597847; 
 Mon, 13 Feb 2023 18:09:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 18:09:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/4] drm/msm/a5xx: make it work with the latest Mesa
Date: Tue, 14 Feb 2023 05:09:52 +0300
Message-Id: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mesa 22.3.x changed the priorities used for the GPU contexts, making
kernel switch between different ring buffers. This uncovered several
issues in the A5xx preemption code, which are now being resolved by this
patchset.

Dmitry Baryshkov (4):
  drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
  drm/msm/a5xx: fix highest bank bit for a530
  drm/msm/a5xx: fix the emptyness check in the preempt code
  drm/msm/a5xx: fix context faults during ring switch

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 6 +++---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.30.2

