Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A631CC15D
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 14:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1009F6E33F;
	Sat,  9 May 2020 12:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAF56E340
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 12:39:09 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b8so1897743plm.11
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 05:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=zz6Bha52VCZ61VoetFX6PmuaWb+O9/LCwGgsnXFAyiY=;
 b=Zhr8xkcT/iFzof+8Lq/M9MZn7g26C7RBMOmnVug1qXGSTBCXQnz/ChHs/kf5zBhZxS
 CUO45SVfyihUDzPPrW3YtxnkKJrULl2FOTQI6VDNEsK41/hpPXFB1COOP7fM24ckQmST
 a9dmXLIC2HllaOujQVp3/Q0s9f9oxatHZ/LjUGqDdNpF8EK1NvnPtwyZQ22B8IsIp9Sl
 HHY91TRuYwk9GHNIeg5zdUtQ6fmeV1PgGFeYiEYQH6uqVf/yLFFeXjUVsEjaX4iCdUOY
 Sd0RATJf9q/HYxWiBXznULNGDlcfwfkgt+XcLZsyp5CwSAeYbkpsFpTIAKZ+Ow+VIHdP
 njWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zz6Bha52VCZ61VoetFX6PmuaWb+O9/LCwGgsnXFAyiY=;
 b=VdY8U8c7C1gEWfprYNWQ+Ph3OS9SYtazPPTbt8AKgHwYGL1wl1t3dkeZS9S+I28/6k
 ZInmwauIDcOHWCjowUZaIAhFYuGH5XANzhzv5oXdOraJDXbONpi2A/nT/KnXqNC2SDjz
 iqto4EMT4Cdr3yaN5vLcz/5vBKOm667lZ0WUaElqPOzr3sfk5cB1NmImjw1n6GKvZ7e0
 HoN+FySkTVqYijf5ZxOs/8aWpwNRH5gMD4ipyddxRctX8V1b2bhlq7GzPDtZX3ALZFVY
 bCRBFcn6q1753M8KJkfRaRb2LqGIRHKyBD5/z325CyyzoLZri5caoTjUeW4YhYO8VpZK
 abig==
X-Gm-Message-State: AGi0PuZVJxQyYrxh4+56ve9TkjE48hqE/DO+3H6HhYxw/+BWYwIRr+wz
 qA1I8MisaTw+OBUUzhkmCSRi3/pI9c8=
X-Google-Smtp-Source: APiQypIDp6M2kg12boFEgMkHohjl3ZCmHkBzrqrA40GcGuCiJCUfA199wQAB34aIsB+rp94t27z9ag==
X-Received: by 2002:a17:90a:a012:: with SMTP id
 q18mr10307037pjp.220.1589027949364; 
 Sat, 09 May 2020 05:39:09 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
 by smtp.gmail.com with ESMTPSA id o6sm4447828pfp.172.2020.05.09.05.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 05:39:08 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] Add adreno a405 GPU support
Date: Sat,  9 May 2020 20:38:44 +0800
Message-Id: <20200509123846.27932-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Konrad Dybcio <konradybcio@gmail.com>, Brian Masney <masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds support for adreno a405 found on MSM8936/MSM8939 and APQ
variants.

Shawn Guo (2):
  drm/msm/a4xx: add adreno a405 support
  drm/msm/a4xx: add a405_registers for a405 device

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      | 82 ++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++
 4 files changed, 84 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
