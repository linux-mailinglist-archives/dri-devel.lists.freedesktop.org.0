Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD4560B8A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 23:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FE510E03D;
	Wed, 29 Jun 2022 21:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE0110E03D;
 Wed, 29 Jun 2022 21:19:07 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id a15so16214176pfv.13;
 Wed, 29 Jun 2022 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=os8p+GPAgFQmOrekd67LxmGjSZ9E3oajR6XVGq4rXGs=;
 b=Fxa7JJ3tBHPzRrzLasvGyK11P7IMVCNsoz9yBpjCyeHc+PjcVwYvdEk6F3Sj/Hqe5K
 27ZH6wW65NtW05mDIiGHxfl7iulE9Wb6ZDLfc7N0wkfnaZQ0u255pw6f2ZXioQ+g8zJu
 r+XjqGvAG6Ob5J7fABtrw1dIC2hpuIR/FhFAPBXj5qkZ8WaqG6hQ/Igpw9WWVV3svRmU
 atSV23qmTPeuOeBv5E2I0bJJOrDLZIL6JcpKnuLDwy7kBcPEnOvgHIjJMEi7DjaQA/Zn
 gGq6ws2qdCXzxmBU1lNcFRbR2Hno+yiStMuyzqmdQvtLAEV30/cFeLOOUIjZWB9Gwn0k
 IV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=os8p+GPAgFQmOrekd67LxmGjSZ9E3oajR6XVGq4rXGs=;
 b=vKIs2SUkRyd8U8VtLUFZSwwgQw8niQZfytwdhfK1Ael3OYZAAtLGmjTGKZvoa58CQW
 K7hSvTGREL+yBW/ED+Es/YaU+alpmE5JzGBkd5NG8uycp+pc7GYoMNQsiSNZoFU3h3j9
 +su0j7SVn5RkTlmx8tQ42DWEawjcCmuVlc0AtqrEpx7QX0GdCdk7MAaYeN9BRs4OuY3S
 YZVwbYxDbn0uWHKgnGcDfocplqV4/+XJq7k1wNZau39hg9X0nw2gzCQC/pidoVh/u9Nm
 owefBsQakwTpuyxrH9Zni5mWvkSG0FGWew7LFpxXqa5eMysVwwHnLAjSF1bYfFPkiMkK
 6zYQ==
X-Gm-Message-State: AJIora8XT1xeh7atmalK7QyEM/UNcVezwW1epQjv9FDue89l2xTww3hA
 N/WD07BCVyoQjlU+dKI5yj6ySoSflf8=
X-Google-Smtp-Source: AGRyM1uwm93lIJuDOjZiKwc+5OlO5luquq44ur9YrjetzeEh60E0gVYtcFvgBeeABInX7xJ5DufvRw==
X-Received: by 2002:a05:6a00:21c8:b0:4fd:f89f:ec0e with SMTP id
 t8-20020a056a0021c800b004fdf89fec0emr12174218pfj.83.1656537546574; 
 Wed, 29 Jun 2022 14:19:06 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 bt11-20020a17090af00b00b001d95c09f877sm2660330pjb.35.2022.06.29.14.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 14:19:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: A couple GPU devcore enhancements
Date: Wed, 29 Jun 2022 14:19:14 -0700
Message-Id: <20220629211919.563585-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

A couple things useful for debugging iova faults:

1. caputre all buffer addresses and sizes even if we don't capture their
   contents.
2. capture the GEM buffer debug labels

Rob Clark (2):
  drm/msm/gpu: Capture all BO addr+size in devcore
  drm/msm/gpu: Add GEM debug label to devcore

 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 40 ++++++++-----------------
 drivers/gpu/drm/msm/msm_gpu.h           |  1 +
 3 files changed, 14 insertions(+), 28 deletions(-)

-- 
2.36.1

