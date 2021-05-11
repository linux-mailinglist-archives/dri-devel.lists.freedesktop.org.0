Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D8A379E44
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 06:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B996E9AD;
	Tue, 11 May 2021 04:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4866E9AD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 04:20:52 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id x15so4121604oic.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sAnreHKyEqLrxBWePiwhRu930iTUs8+45ufhMRReXo=;
 b=zH6hgGNYjGqj2IMIUj5mNl+3TVZadxNEV50zVtX+0J6nuVggTisVFFsYuN3EHs4u0z
 21UOgf2M3zYl7eB7JIStzDf4Q8V3hoMWES4S3L9PLuG5S3cAiueFXZJFnwDe/ozFoQ2F
 ocqEPPY9E4EiMsLr3PESgaSifyp4zDW6DbkcqDwr1On0rlb/Rw/G4tpEj8DPilF8EUVc
 TVIxN42CAf5ndDM677Hb92pXr+3bHwG9xi6MRrRG/xwgjvxWdkGlrfZL8mklS7tRiZZV
 LctmGTxJ8w34HuduKQPjX/POXOUVnkWrAqdYNAlPtsMbBGzMnni7B+f969XFI79k7a+5
 5rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sAnreHKyEqLrxBWePiwhRu930iTUs8+45ufhMRReXo=;
 b=Q9ZgkeMdPaxbGoXD8HiYg1UsIF9dq0Gxf9TE0O/sOZlx9g08nUbtd/j2bwK0MO5qfn
 naFt5j1QlC6RIlc8PdYo+g93ESI+tjWdY1AUw8ilfrxvUZD91IF6z/hdrlvIlMYqh5rn
 PAeJHNB0Eppq2XJX0VT3RDTIEv5KMbDAETWM/bCikfhyeUS38VS1HiyQmBIlZPgaAQtU
 Kh7h8QKJePp19nydAmJAIahkB2qjBudgihi67tDxspmihyv89Kf4hNKLSA2RpFD+M1J4
 YOQrnDdnX4kxzLIAcco7BzQZVONTP45lG/XEBM22Q7zr+ptiyiH8updJK2YU3LnL8EqV
 ei4g==
X-Gm-Message-State: AOAM531oqXyXo6RMR2XCMr2VA+H8D5/vGUr6ciWIvJGN4qW99XNvtqgd
 0RkBWRceo48o5ZTJMRge7p+kGA==
X-Google-Smtp-Source: ABdhPJwojnmqufg0lJ4akmfDWkkObUb4HRQ0v8GMtG0dAG2Vf9ooU4W4IGX+N8IzuFQ1r8r8SyJnsQ==
X-Received: by 2002:aca:d8d5:: with SMTP id p204mr1967717oig.151.1620706852170; 
 Mon, 10 May 2021 21:20:52 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id r124sm3042294oig.38.2021.05.10.21.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:20:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org
Subject: [PATCH 0/4] drm/msm/dp: Add support for SC8180x eDP controller
Date: Mon, 10 May 2021 23:20:39 -0500
Message-Id: <20210511042043.592802-1-bjorn.andersson@linaro.org>
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch in the series is somewhat unrelated to the support, but
simplifies reasoning and debugging of timing related issues.

The second patch introduces support for dealing with different register block
layouts, which is used in the forth patch to describe the hardware blocks found
in the SC8180x eDP block.

The third patch configures the INTF_CONFIG register, which carries the
configuration for widebus handling. As with the DPU the bootloader enables
widebus and we need to disable it, or implement support for adjusting the
timing.

Bjorn Andersson (4):
  drm/msm/dp: Simplify the mvid/nvid calculation
  drm/msm/dp: Store each subblock in the io region
  drm/msm/dp: Initialize the INTF_CONFIG register
  drm/msm/dp: Add support for SC8180x eDP

 drivers/gpu/drm/msm/dp/dp_catalog.c | 99 +++++++----------------------
 drivers/gpu/drm/msm/dp/dp_display.c |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c  | 22 +++++++
 drivers/gpu/drm/msm/dp/dp_parser.h  |  8 +++
 4 files changed, 53 insertions(+), 77 deletions(-)

-- 
2.29.2

