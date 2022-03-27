Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE54E89FF
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 22:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5A410E26C;
	Sun, 27 Mar 2022 20:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BE010E253
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 20:26:52 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id 10so10799815qtz.11
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 13:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8UVxZLedNpHTbRo7IKHmaBenq+x1GF8T/vpr9/COFw=;
 b=5Xj7QIclTvrgSeXF+IP/WwaPT8yZo0PxRfFAqiZqBjcDNtnjxD0mek5rMxQ0apA6Ul
 bafTXYVSqEDNG8kf1iYuAnOUjXb5qi2oCFDcQE/5uYNK3bZkTgoe0DBepeCXES+YaFHy
 uUSODGqLQGtJQtv5VugwkPgpPVJ7vryhokzOW0Afh5lkxrKh1Fk1xd1uMpw2hyQsccHV
 eJjs0ODSNWhsUCnemc7fZSNqvkCppoEijTCKRkwvwUGlle+EBscLvzxCwIDwQdd1VU4r
 LrHixLpHdso5hm3MW7ETrDT5zUdsZDTsY3q8DSKWsqAUZsobp3QQEeZ78PpeI3s2YU5G
 2c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8UVxZLedNpHTbRo7IKHmaBenq+x1GF8T/vpr9/COFw=;
 b=48VigsYvrFLhBB4Y4KXYu5Xqh7N8oEwIrnerNmuHyDAMYukFUp2fvQ/5iEY/xzu8KH
 uKhKSDFRnbCMX/VjXlxDcXlhxgHwNG1+54aXkVpaTZJ4RRxhDUBPlzl0q4ZIbaKEXFoJ
 eEs75UF8XxycjaiRhN9Jm+tzw5ktY8hIWQStAMAqrUUllOgFBJHYCyn473QiBfbRrCnt
 kq7IhO8A55eSFAmeXWRpXFWuCcl4hPYDe0YhUSpwIa86Fql0r3Ec7dAM5+IYntkHM/Ug
 Rb9x/fdGPFetwlZ/TJLDQWtW+IZw0SyHDYcgsxPvnZ7qwg0stN5PKnQMNzbB8uZpJpKc
 g6Yw==
X-Gm-Message-State: AOAM530Yigvo3hmPOyUzNqyb+iGFkVi1zP/UCLuGg1S87Wftf9Hnkb2w
 9FEnpgrlTig/10Z912fNtD+zXQ==
X-Google-Smtp-Source: ABdhPJwjikefcEW6EE3MzZqkcTWwsp93SdKPjKGmaMKv4cGZBM3L1ZE4fkjaC0trhlqVgv+ImjZTsQ==
X-Received: by 2002:ac8:5e10:0:b0:2e1:cdc7:a73 with SMTP id
 h16-20020ac85e10000000b002e1cdc70a73mr19139444qtx.72.1648412811092; 
 Sun, 27 Mar 2022 13:26:51 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm6720386qkk.52.2022.03.27.13.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 13:26:50 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/4] drm/msm/adreno: add support for a730
Date: Sun, 27 Mar 2022 16:25:53 -0400
Message-Id: <20220327202643.4053-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on a6xx_gpu.c, stripped down and updated for a7xx based on the
downstream driver. Implements the minimum to be able to submit commands to
the GPU and use it for userspace driver development. Notably this doesn't
implement support for the GMU (this means that the clock driver needs to
support the GPU core clock and turning on the GX rail, which is normally
offloaded to the GMU).

Register updates: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15602

Jonathan Marek (4):
  drm/msm/adreno: move a6xx CP_PROTECT macros to common code
  drm/msm/adreno: use a single register offset for
    gpu_read64/gpu_write64
  drm/msm/adreno: update headers
  drm/msm/adreno: add support for a730

 drivers/gpu/drm/msm/Makefile                |   1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |   3 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  27 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  17 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   3 +-
 drivers/gpu/drm/msm/adreno/a7xx.xml.h       | 666 +++++++++++++++++
 drivers/gpu/drm/msm/adreno/a7xx_gpu.c       | 777 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a7xx_gpu.h       |  26 +
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  12 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   9 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h |  45 +-
 drivers/gpu/drm/msm/msm_gpu.h               |  12 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h        |   1 +
 15 files changed, 1550 insertions(+), 78 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx.xml.h
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_gpu.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_gpu.h

-- 
2.26.1

