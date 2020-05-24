Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65451E07BE
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980E589D1D;
	Mon, 25 May 2020 07:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2488789DD5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 17:52:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l15so18050216lje.9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7aR3YE6Bd8ZKirlEsF7qmRCiqSqK5gXeUv4sa0t1B5c=;
 b=tMPJkT7nYXzIltgSxd8IMB1ZfmKN7RQ0Vo6jw6DbXG/aftDjIm52h3KjdYosFIX2sT
 RzGuS+TYtE6hiLTN0iQbigzokbZAKHcxf9wx7XKLCbaQwIdYTpOGaaeT4grZeaKRTk8R
 r+Kd8SsNnkBm1BTxWA4B713AxaeYjTfjYwgvl+CDmulG9VXTFkHhQmVaTfrIKKTp0mVk
 Bhyf5rQbxEPM/uxJ4AE1+NiBHpoeNutdt7uIQSQ451dTP+EgKIcJNGZ3NhKYjiqhewaG
 uMoo4vY6ZHHmtcqJa733wowG86MYgEOB7pfA42MrwsiSfEsXKtGaKKzIj4R71TIQSYOh
 nkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7aR3YE6Bd8ZKirlEsF7qmRCiqSqK5gXeUv4sa0t1B5c=;
 b=Okwh24TIDWPVuoNOqW20JTAj7XqDgW/MhG+anEWkTeINNVsCqACQ0ueJNOC2MVSMPo
 ufJknHqLKCAlRa2XakJM6CGD9musVtnAsnU/xMIj0FLNHiLD5uQyBYuQ784KiTGyYNVX
 A7RNPHyF7toxc731AT3zhLgiK5B07KVAxmqv2hY0bz9dRlT+DUEdH0+2cqd1BNlyvye9
 ZLBIKXNBYBNbFJKCmUfdcek/UwWaVKYKL05ZQz4bD/T3qtVECaoZGEMbjrISIAyN0gN6
 IzpJVPZP3PoL9ZOtEAA+doTAr+3dn+sIgAZh4Qe8eAeM44ZCftugVCEeKgfuV+VpBrc4
 MaoA==
X-Gm-Message-State: AOAM532eaitOle30Y8ka535sHeqcw4zWiLcTKhldYkxfaPfBI1J0kJT8
 6FarRApq7u0xpFtL054PtdY=
X-Google-Smtp-Source: ABdhPJx/D1WOpoi7YhAWGUmlWW8wdWMarJABuwSnWKv1uUXtK7oI2xLYIypZ0T3+PlXs0jNbKLMkxg==
X-Received: by 2002:a2e:3517:: with SMTP id z23mr11915394ljz.147.1590342764482; 
 Sun, 24 May 2020 10:52:44 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru.
 [91.76.17.204])
 by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:52:43 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 0/4] Minor improvements for Host1x driver
Date: Sun, 24 May 2020 20:50:56 +0300
Message-Id: <20200524175100.9334-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series contains some minor improvements for the Host1x driver which
I picked up from an older local git branch. I selected the less invasive
and most relevant patches and added one new patch that dumps the push
buffer state, a day ago it helped me to debug SMMU driver issue that is
easily triggered using the vanilla upstream Host1x driver.

Dmitry Osipenko (4):
  gpu: host1x: Optimize BOs usage when firewall is enabled
  gpu: host1x: Put gather's BO on pinning error
  gpu: host1x: debug: Fix multiple channels emitting messages
    simultaneously
  gpu: host1x: debug: Dump push buffer state

 drivers/gpu/host1x/debug.c       |  4 ++++
 drivers/gpu/host1x/hw/debug_hw.c |  6 ++++++
 drivers/gpu/host1x/job.c         | 27 ++++++++++++++++++++-------
 3 files changed, 30 insertions(+), 7 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
