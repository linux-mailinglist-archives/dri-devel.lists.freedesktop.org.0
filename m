Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D5408C41
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F7D6E183;
	Mon, 13 Sep 2021 13:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C847B6E183;
 Mon, 13 Sep 2021 13:17:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w29so13882849wra.8;
 Mon, 13 Sep 2021 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZdomM/e/zSdALEInWCh/AvZjZ5yHPc4saWmSbkGx8Dc=;
 b=ouCR+3aNsA1DiTowvBNcV8DKE3ifr2meLpymuJYbnE0iyPBxH3K2CRGIogq0MrDrRd
 Ah1C/sRwYxZoygqorAHIuOyDajlC5xLvlNs/P+aq4En6ifOF1IaRUtwN/DPE7u0t289Q
 BkzADtUG7taEXdtKsr9cZEPU2cggQoh7zrxMN1S6yUHPn0qYMQr246TdMCeTUJWI6B5C
 hX7gGoP5jEq04DtHwdWuSCAVJEIKnvaH1LaTNVMsRzD1qScXKm8R3xxpd+dtekJmHpjr
 90+O9aUK5BlBYMY/H4cT3mg98HMNCHS9z0/dSn3DbSxoBFYcQEOB5XD5A3HgQ4xhmzi/
 +v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZdomM/e/zSdALEInWCh/AvZjZ5yHPc4saWmSbkGx8Dc=;
 b=DUh2a99T4WAeQqqjBmblkP3e+tyN4ZLPJPtcsfQObozCAw//6oWuocRK98tRVJKI4X
 Spm2b9Rv6bqJuLCfk9lj1mrFMcoRSckXhjMwhxuopgGsblZLASHzOn5H+8aE2UbeB88O
 kOEYZKzmzueTrUyiJw5c3NEBZdIcMefoPScs43n/wVMqrJ9LNvpa3kQytktyFJB01R9F
 X0J1Hkv3Nt0yNK32JQ8WMYTfObv5K4EVRz7nlTq2335BDbQA+UAsaTgB6mErkdVArGtR
 rFIC5PKczS0Mn8GlFVka3/uNn3jwyo7nP1zEhJYqR4ppq8Lohig7bpMS6hOMpER8MDTp
 1eIA==
X-Gm-Message-State: AOAM531CgW67Jui1449pywi7gEJ/hz82g9zNt5vYSzIU6jQCm139gahH
 aBukpXsA3Kkf2C51NWz2Xeg=
X-Google-Smtp-Source: ABdhPJwqVroUXWf2cq8qtCQb/MmqMUlY4BONTjLjBugzEnJvbKfR5QsL1Vb0BBVo//Fn92ciq/iymg==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr12486672wrs.71.1631539031462; 
 Mon, 13 Sep 2021 06:17:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: Deploying new iterator interface for dma-buf
Date: Mon, 13 Sep 2021 15:16:41 +0200
Message-Id: <20210913131707.45639-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everybody,

we recently found that a good bunch of the RCU accesses to the dma_resv object are actually not correctly protected.

Those where fixed by either dropping the RCU approach and taking appropriate locks or using a central function to return the current fences as array and then work with that snapshot.

This set now tries to prevent adding any new broken code by rolling out two new interfaces to access the fences in a dma_resv object:

dma_resv_for_each_fence() - Iterator which should be used while holding the reservation lock.
dma_resv_for_each_fence_unlocked() - Iterator based on RCU which can be used without holding the reservation lock and automatic restart on concurrent modification.

While doing this we also move the decision which fences to use for write and read accesses into the dma_resv object which results in a quite nice code de-duplication and simplification.

The only two remaining users of the RCU shared fence interface are removing shared fences in amdkfd and debugfs code in qxl which will both be addresses in the next patch set.

Please review and/or comment,
Christian.


