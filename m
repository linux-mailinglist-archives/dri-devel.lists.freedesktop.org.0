Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734783D5BF6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555DD6FDA6;
	Mon, 26 Jul 2021 14:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9203E6EC26;
 Mon, 26 Jul 2021 14:42:41 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so20100744pjb.0; 
 Mon, 26 Jul 2021 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mmZtBUD8FI8lAdMJxftPxEHcUSTCfysVGalUwueoWH4=;
 b=p6gTRrXebriroz5lpJEedRHHLPEF5PrQW1oT4GLT9AVhBp7eORVPfvllupeNgycSmR
 p5jSMkjoNKDCl6E8RtISCfFzfgZovrOraoOzWacbDlJwLCZpkBHTMNHU8NoHJtGZFlhr
 pxD6nrJcYY2R7rgnHobaAkNU1+hYNRZD4ym8PrlPFwWJ1zGW8b+fnrVNB0fqXRbkmPJ2
 GM0Xrl30CliMAo2TJk6F4/ekpu0TuwMwBwBXszH8yB3q0ILiISxRLX8X8UItLM3+8Mg5
 xaj4nMqYKJiJOXFvwMQSSthfphnxlQeoKPbNgAbGr6h6vFvF0Q0TZIwV68sihktFjK+x
 TnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mmZtBUD8FI8lAdMJxftPxEHcUSTCfysVGalUwueoWH4=;
 b=SBbadC+06new8DjKlZrUqC9tDh7qYtVpENTZ+ZMxFoio8Njj/LJ8b2hYSFzFElMtwE
 4vpuvUFIk3uVPyopbDK4MX1HpWvbZWMBCOvAhEOqggQ91/a+WNFyw2RhMwwv2IzzYvXg
 OEtJR84CR5+L5CFoPJonHLrttdtblN3Av+b/dP3+v7BiZ+p8aBdDde/b91ndatRStttN
 hRx5c8fBYzFlKuoNktq6K2idP75M3tmVa2TaD++A1ITG0AuiCD5dHv48vhk4FMb2l1Bx
 lFSnzI/85PlcxlVYUcQNTHDo7mXIAYNgnUlPeOFdT0sjp8lQMPNrGBg+maB82U4c3NUZ
 NU7w==
X-Gm-Message-State: AOAM531Eqs4IWAhetB0aH2ACS3U1nPHJ/PIT+rfG6c1rJlrzF1YC4WEB
 j8Q9P2cK5xUb1M3ihFOQwLyayfu3USIUgA==
X-Google-Smtp-Source: ABdhPJzxc+2f2N1SAJHTHCLInNoulpVt4huSwpjsfugRuLUGMSOT3GQkEv6zxQQcCZkDBlj7z4sPfw==
X-Received: by 2002:a17:90a:5886:: with SMTP id
 j6mr9527059pji.34.1627310560540; 
 Mon, 26 Jul 2021 07:42:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id f4sm47901401pgs.3.2021.07.26.07.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:42:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm: Improved devfreq tuning
Date: Mon, 26 Jul 2021 07:46:47 -0700
Message-Id: <20210726144653.2180096-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This is the outcome of trying to fix some bad gpu freq behavior seen in
some use-cases, in particular mobile games that throttle themselves to
30fps.  With the existing tuning, we'd end up spending most of the time
that we should be running fast at a low freq, and most of the idle time
at a high freq.

First two patches are prep, 3/3 is the interesting bit.  See the patch
description in 3/3 for more details.

v2: struct_mutex serializes the submit path, but not the retire path,
    so add a dedicated lock to serialize active<->idle transitions.

Rob Clark (3):
  drm/msm: Split out devfreq handling
  drm/msm: Split out get_freq() helper
  drm/msm: Devfreq tuning

 drivers/gpu/drm/msm/Makefile          |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   4 +-
 drivers/gpu/drm/msm/msm_gpu.c         | 132 +++--------------
 drivers/gpu/drm/msm/msm_gpu.h         |  61 +++++++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 203 ++++++++++++++++++++++++++
 5 files changed, 280 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c

-- 
2.31.1

