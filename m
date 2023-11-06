Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DB97E2C4F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F24B10E3C5;
	Mon,  6 Nov 2023 18:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3430C10E3C5;
 Mon,  6 Nov 2023 18:50:33 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6c320a821c4so4305751b3a.2; 
 Mon, 06 Nov 2023 10:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699296632; x=1699901432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6cU21C5fA+9HfxPv3J8m9Wghhy7CjkmSAa3XrNBXmko=;
 b=kzgPxIiofchmHNMl93giaHHh2YJ+NBLFdumLDwLXenoiR5XrVJ5dkvGqwJgTJi8/dU
 T1UVKvgfm5f5DscfljXiiI5VUgTxbYSRwAwfKfawpQ0ypV23TAOTAgUmtC1HWYleEB8+
 VKl+6UDER6+iBc2xLU5r8rMg/3zpqtF4aJyuF95wpoQtETa0k+cQOebmpUiodXb1USBQ
 /tfA1Y4CGtBGTPJEBhYPK1quujVP8UDA4yuYII49k4AMlO6puOMTCKu4Zm3J2oUUifa2
 LQBdcaffxoyFSzhUO7SPEFXGqX6VKWMmyYdkXqf6yJFHEpleaCJD23K6gb3eIKFh2BpA
 r8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699296632; x=1699901432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6cU21C5fA+9HfxPv3J8m9Wghhy7CjkmSAa3XrNBXmko=;
 b=fBiLdN2zSfLN6FJ9JDgLQ5xe7oe78DpWVd1faiIFuBQ6PXQ/NkWzh0ZDo4UqS4u8J2
 0oF2GrRljT944opq6M7HXYko97PR2MvrzDX19lH3c/3Cfgkf6PCXrG3/ASDEWZOgZna9
 XxbmuG8jaiTmhuUPjdQHsE86Uv8K+LXgnZEEszSoBNNdeNL63RPok2T4Nd14s9/5H4uH
 wqcoag3qNmd6rCSt85IOKvDDy4RzGA2Fa6acwydMrx4k59gHLhNFzHKDNTvpThzUWGBE
 5GgwqoFhylm5fR4QZY+JC1WJWCARWtkrozy/eYKWUkSM3HwzVrRVCTg2ySXILuIcz0Hw
 uT0g==
X-Gm-Message-State: AOJu0Yx+qKuEOONS6XWq9LtnTSC1yvoM/N4rHojptExFscvpQdV16PPd
 yjuX4CguKnwFG8AgyLJ2HN5cn/JQSyE=
X-Google-Smtp-Source: AGHT+IErzhlvo3uGRZ8ikMypK9vCw5+kSuhekjr2LhVNm7lhbCURZcq8B5VN8mniHRSxNPPNfQAchw==
X-Received: by 2002:a05:6a00:330a:b0:6c3:3bf9:217e with SMTP id
 cq10-20020a056a00330a00b006c33bf9217emr11111970pfb.19.1699296631673; 
 Mon, 06 Nov 2023 10:50:31 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a056a000d6300b006b90f1706f1sm5941925pfv.134.2023.11.06.10.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 10:50:30 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/msm/gem: Add metadata uapi
Date: Mon,  6 Nov 2023 10:50:24 -0800
Message-ID: <20231106185028.209462-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add metadata mechanism to provide a back-channel to communicate image
layout information between vk and gl, because EXT_external_objects
doesn't support explicit modifiers and "OPTIMAL_TILING_EXT" is not
enough information for the importer to deduce the layout.

Rob Clark (2):
  drm/msm: Small uabi fixes
  drm/msm/gem: Add metadata

 drivers/gpu/drm/msm/msm_drv.c | 94 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gem.c |  1 +
 drivers/gpu/drm/msm/msm_gem.h |  4 ++
 include/uapi/drm/msm_drm.h    |  2 +
 4 files changed, 99 insertions(+), 2 deletions(-)

-- 
2.41.0

