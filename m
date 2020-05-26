Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6051E1C2C
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1A289D7D;
	Tue, 26 May 2020 07:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD5F89CD3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 03:22:41 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id n141so6840372qke.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 20:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=irxvBr3fhjh3o4PcQX5WrXrjZ+soB6XClWrdckT/PEg=;
 b=wmMfYz4Q49KJhfEacTGOCEZGd7yE3D0nE8Xn5qM/BcmKBnqiZ6B7luz3x8cSBRfwTC
 3/UZNtYoswmTXLHvaHCPwGjCMMI/nfBNbClpHanLQhJ6coFId0GsNjsICZAyGj6Ca7hY
 0aQ9bcBvpbtTHKFmKmHY6lkFfbQT8C+DVZNLH7skIdJysABoMm84FnF6WUs+yYJjlBF6
 5OoMApXdGII3qUGOhb6uIvuiifELzRRIun4gCUSA5CqkgUu2yiRCnb6dkPc2f6U7ZiyR
 T3W7w3AdU5w406o6jibD13vYtURGesBheFcXiu9WWa7YzsAB8hEJ8ZlswFmN9E2eUJe7
 nDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=irxvBr3fhjh3o4PcQX5WrXrjZ+soB6XClWrdckT/PEg=;
 b=gbjgLXfDlTz/RPCNfQa1RzyzwRGPSlLV6U12VlSbp5I5OQuzk6rgllJ2wVdikhfakC
 y0qlYqTlmwpTNujGOjJYH/jEey0q6Xu4TxK25V65OwoCJFATwfeH6nFG80tcYjiuZxlM
 7bxjSyw+4EEDq7fD1vFBTH+lW2O+jzAk0O69iRhyRUe3ccPdODnnowx7y6u3x4wnPqr2
 5F2r84Sz6MIHECDG9p4QFXjklDaBJ79+hTVLdczLl7ts96NczzvyADHsDYsACWP41IHP
 XeSLIDOf3o8wpLAkDRpFMHBN33KwWEXeGR5PFsnIophzcZqoNWHwS6KPYIwg0x/ylHPI
 VxcA==
X-Gm-Message-State: AOAM532vnpyotmEsr0b35667z54jvkwi1QFM3QEy4yVjOVnxF3rrats5
 Pep2xdigw3j3RTfgASPKo+3c5w==
X-Google-Smtp-Source: ABdhPJwcJbeZ44TzgeR1njybd+DRRmfS48J8wtcs0R4IFp7dHY9QeqGiP5i6eANoJ24H0JQXZ7BQZg==
X-Received: by 2002:a37:db11:: with SMTP id e17mr28833862qki.336.1590463360740; 
 Mon, 25 May 2020 20:22:40 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 20:22:40 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/8] Initial SM8150 and SM8250 DPU bringup
Date: Mon, 25 May 2020 23:22:07 -0400
Message-Id: <20200526032235.21930-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Jayant Shekhar <jshekhar@codeaurora.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, zhengbin <zhengbin13@huawei.com>,
 Drew Davenport <ddavenport@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches bring up SM8150 and SM8250 with basic functionality.

Tested with displayport output (single mixer, video mode case).

I will send patches later to add support for merge3d and dual DSI
configurations, and possibly also patches to fix command mode on
these SoCs (note it is also currently broken for SC7180).

Jonathan Marek (8):
  drm/msm/dpu: use right setup_blend_config for sm8150 and sm8250
  drm/msm/dpu: update UBWC config for sm8150 and sm8250
  drm/msm/dpu: move some sspp caps to dpu_caps
  drm/msm/dpu: don't use INTF_INPUT_CTRL feature on sdm845
  drm/msm/dpu: set missing flush bits for INTF_2 and INTF_3
  drm/msm/dpu: intf timing path for displayport
  drm/msm/dpu: add SM8150 to hw catalog
  drm/msm/dpu: add SM8250 to hw catalog

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   6 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 287 +++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  48 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  18 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  75 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   6 +-
 12 files changed, 363 insertions(+), 156 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
