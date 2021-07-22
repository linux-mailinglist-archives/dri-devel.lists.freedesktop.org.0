Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7633D2FAC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 00:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9F86EA81;
	Thu, 22 Jul 2021 22:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CDD6EA81;
 Thu, 22 Jul 2021 22:17:39 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso1242500pjs.2; 
 Thu, 22 Jul 2021 15:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMkDgOrvQyP1SLItHDLnfmWsC7sgMNSITNSdc/ws6zA=;
 b=d/QmizXKgwPlJFSmjjZrZ/EgTWN90QjKd3XvOAoGwkYwx8JLJmaULlhMenIUrIs9LU
 ehoxkuSV20H/pO0m1w8PRbYqzVVyNkRmE0wBRd9WiuOm0yu66uPzbUu4wYbsNBMwef04
 UNJ9ul7B67GnRxs5B1hv4ayctM2agheWYSl0k/NFx/aPRn8ZYf3jkp8CshMpK3GtZUN9
 HIuNhYXkr9mKDjLNmf3ndcpc6p4J1oFRjbaPIAsEp3A7Kgf97FEsBrZLRBT8Hhed+Kba
 K1gLPl+onz1fwf+XCjL+po+xsWhMRFOgiT2o7Upub+Pr6EsDeQLAS66c1s5YDjgAr97t
 UMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMkDgOrvQyP1SLItHDLnfmWsC7sgMNSITNSdc/ws6zA=;
 b=hPgf9/mpY2um+633Ilw+7MnSchLCkdg431TFiJpRBdxOwXm0ILhZO36qcOMI0/vhLA
 +1t9/AJkAI5U2OMZOXEnfh6+Ae5u3TZ5ILvRochwDLqaG9knWwBBYriQedT6kEfPjflv
 vxWKW/mPpJClE02U9NBC7Cm6UTgi+9F6e30mvh/wAvQsznGMiRoNVAJUs5I+pDyKQ4KB
 xynDpyFf5XsxRtJN4gzLFg3f7kZi9VRggBxMgpPomiF/itOan/9CfSTlDFM/3KR3ODkD
 MvZbskd2vh9KKMBO8+55GKBKri7zN4QABdktWfxp/qIihx9Hn9++CxFVyVniqNT43s7j
 oHgg==
X-Gm-Message-State: AOAM532ZLao1cKzdqjER9AEp/uGF7/nFEIk6xGSwJbijGD79F5GGgvAv
 1H/8zlsQJM5PKOikoufoTZbOWd2UIxrmaA==
X-Google-Smtp-Source: ABdhPJzScGN6hhj5xPi+zBl19RrPH3Q+8v9QGVI6j6NSNBBqFSAkVc5t6gwgG5Ph6MH6vg4f7iYzXQ==
X-Received: by 2002:a17:903:2082:b029:12b:a0e9:5c88 with SMTP id
 d2-20020a1709032082b029012ba0e95c88mr1731398plc.27.1626992258242; 
 Thu, 22 Jul 2021 15:17:38 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 x10sm34105015pgj.73.2021.07.22.15.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 15:17:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: Improved devfreq tuning
Date: Thu, 22 Jul 2021 15:21:38 -0700
Message-Id: <20210722222145.1759900-1-robdclark@gmail.com>
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

Rob Clark (3):
  drm/msm: Split out devfreq handling
  drm/msm: Split out get_freq() helper
  drm/msm: Devfreq tuning

 drivers/gpu/drm/msm/Makefile          |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   4 +-
 drivers/gpu/drm/msm/msm_gpu.c         | 124 ++--------------
 drivers/gpu/drm/msm/msm_gpu.h         |  27 +++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 203 ++++++++++++++++++++++++++
 5 files changed, 238 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c

-- 
2.31.1

