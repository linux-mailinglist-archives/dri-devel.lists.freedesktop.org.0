Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D04488507
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 18:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A335E10E1A6;
	Sat,  8 Jan 2022 17:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E1810E19F;
 Sat,  8 Jan 2022 17:42:55 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id l8so6082257plt.6;
 Sat, 08 Jan 2022 09:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DocxFXdAJY37L6DlG3De/ynEIKw/NoYzpHSiyKpP1us=;
 b=VN6igdtm1jasxSDZCJasInfzcPtKDYiG6dlzn5QRWC/PguzY5sQynBrkCKFzwSjmso
 2Q2C2A3qW0OF6ECecyH4pegwc67rE/l7J+snomunwR9oMcrioYQ7gi6wc9lZfAMdx44l
 n2PR1idWzWgyqzTUcYcA57Y1RLI/QP358QYV6/Wd6wTyl06Uk8vX3f9TjNixiZP5SeG5
 FwDt1Ch0l3SsPhMSsLc0eEKJIXoNJtAEdIwsAfONoX3XXAU5mbJDl+RoI4mbynM8Pn6U
 xrmM1QOpTXkIL5Vu6Q1tCN/AdbCzWPR0OAfHS3eBN5lY/7BewrrUbQs5gQgMmm4H5wV9
 ZgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DocxFXdAJY37L6DlG3De/ynEIKw/NoYzpHSiyKpP1us=;
 b=dyg47CyKJdBcReZUQekc761Ot/NFH4i2yRwZBugTa0qtXLRDZqyCurD2it7B1HT8HU
 B/vlL66va4RYZCPOeQ89zv9tAYGn1dmXnNYDUByHy24QibJmQw+8Z98n96KstamQL+jP
 SNAmPdvkR6RCDGo5Q4RRBWhiGeeRQE1zYN9B9XsUGiJhmCuGtofG4EPLxnTRZM0FYz8S
 oY4nHRu4uKyoEW4JMo1qmac+HaMFvDrLohjumtx2TYyvuRq08F9rO2QPS10WlSVw9t+R
 7q46rGk115jgzWOR5tKITUuiZhbRuoEjPA+Avr2R2+Tiz5px4PfaIpoNxB1Cq28qq73K
 lcbQ==
X-Gm-Message-State: AOAM5332yUnrFNT/INqNLwYPlrKiCQ52Rbn+eizpDLnwX/j9KXDEdGpr
 /PI8nzF3YjjgavEKhjFUn+82IObyy58=
X-Google-Smtp-Source: ABdhPJyQFElIB145usE9UleO1jJm1lgiEQlewGVf1MSY3TTEKCQ6becE6JZA8OJrSbAyNt4hxbUGAQ==
X-Received: by 2002:a17:90a:e018:: with SMTP id
 u24mr2263766pjy.95.1641663774489; 
 Sat, 08 Jan 2022 09:42:54 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z13sm2032839pgi.75.2022.01.08.09.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 09:42:53 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/msm/gpu: System suspend fixes
Date: Sat,  8 Jan 2022 09:42:45 -0800
Message-Id: <20220108174249.811872-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Because system suspend uses pm_runtime_force_suspend() we can't rely
runpm refcnt's to protect us if the GPU is active, etc.  Fortunately
*usually* the GPU is idle when system suspend is triggered.  But that
isn't quite good enough.

The first patch attempts to block for a modest amount of time until GPU
is idle (and failing that, returns -EBUSY).  We could have taken a
slightly easier approach and just returned -EBUSY if GPU is not idle,
but that would cause system suspend to fail.  And no one likes pulling
a hot laptop out of their backpack.

The second patch avoids getting devfreq callbacks after suspend, since
pm_runtime_force_suspend() breaks the pm_runtime_get_if_in_use() tricks
used to deal with devfreq callbacks while suspended.

Rob Clark (2):
  drm/msm/gpu: Wait for idle before suspending
  drm/msm/gpu: Cancel idle/boost work on suspend

 drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.c              |  3 +++
 drivers/gpu/drm/msm/msm_gpu.h              |  3 +++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c      | 21 +++++++++++++++++++--
 4 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.33.1

