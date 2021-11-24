Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2A45CF22
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869EB6EDBD;
	Wed, 24 Nov 2021 21:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FD36EDBC;
 Wed, 24 Nov 2021 21:37:01 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id y8so2951995plg.1;
 Wed, 24 Nov 2021 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRF5/BPRjl5xERSBa/eHuny9wgPdbY3r/MnMZJGIw7o=;
 b=EHmaQZkVMD66f2U2Qqy4MaqvTVwTmwgelAFIUevB40nJrwEn6hyUUMWbOoshgJ9crs
 4yjyIVj+/rLtviQ58+SWifmvhwBMebRtapn14tCucvjTpHwgqGNLAP73zarMfzSM0sli
 /iZt6Eml2ZvGZkk6TcFlj5e8OwUM9NP1OkKv93+bZqUcWW3vaVo8Wwfc7huhX+ZsEqz/
 8QHoypZxATegM6zjUTYY37UdByet2Nj+JuwwdFTbkYF5WAczl79gB7Z+SEXfVY8Udt32
 tAW6RCC6jLjtD2HKWJNgRUYsELTvwewOMYlmN/UhJpB96fsQC4rKq7b7zGzczak676FI
 ElDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRF5/BPRjl5xERSBa/eHuny9wgPdbY3r/MnMZJGIw7o=;
 b=aHhUu30OQcpWMT2pBTxOA299RxSl6aFlDTeb1HkdQ2AWpBuunf9oOSEiV+jl1S9lja
 T+Lr/QY3uXM2XZjujcYExB3ndeYN9i5OrYOLelAHy0g7G4n7fUiX1/o5lXA6Q+Ts6J9E
 v118qWR8hulkxNyFsWK2YHhYcVlINf0H+w7ewIF2HH16kShFsLXRV6RrTd2GCxSttH7p
 u7tng5UjPVg4k5RZenEIrgJgut2jD+qTnIpMfXjEVMcxNuKHLkVljtrNeRHjbLDQAXRF
 57rT6CHyppEoYunJi0BnY10aAcXXst9l047Z+cJ8NtYmIGjQrEQEuy1IuVX4uwnYza2V
 msfA==
X-Gm-Message-State: AOAM530iPR5uJr/aneVYFswAnZSO9FAIvAGrq4MdLxmitGzmnElDNfLk
 jRCmlqAE2eoqv6CpwJUIzA44ufbCd2E=
X-Google-Smtp-Source: ABdhPJzNY9alqqLMH5XF+boo4aSfrFYcpd0d0oay1oiaKp8gXNWA3mqfUqnALD0Yyl0mbzY64/q2Hg==
X-Received: by 2002:a17:902:ec8f:b0:142:11aa:3974 with SMTP id
 x15-20020a170902ec8f00b0014211aa3974mr23244200plg.30.1637789820845; 
 Wed, 24 Nov 2021 13:37:00 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b18sm527998pjo.31.2021.11.24.13.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:36:59 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/msm: Improve GMU debugging
Date: Wed, 24 Nov 2021 13:41:25 -0800
Message-Id: <20211124214151.1427022-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Yangtao Li <tiny.windzz@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This adds additional snapshotting for interesting GMU buffers to the
devcore dumps, adds a couple WARN_ON()s, etc.  (Plus a bonus comment)

Akhil P Oommen (1):
  drm/msm/a6xx: Capture gmu log in devcoredump

Rob Clark (6):
  drm/msm/gpu: Name GMU bos
  drm/msm/gpu: Add some WARN_ON()s
  drm/msm/gpu: Make a6xx_get_gmu_log() more generic
  drm/msm/gpu: Also snapshot GMU HFI buffer
  drm/msm/gpu: Snapshot GMU debug buffer
  drm/msm/gpu: Add a comment in a6xx_gmu_init()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 25 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 95 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c       | 10 +++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h       | 11 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 +
 6 files changed, 138 insertions(+), 10 deletions(-)

-- 
2.33.1

