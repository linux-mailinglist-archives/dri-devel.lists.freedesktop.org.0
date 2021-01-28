Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF1307EE9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA886EA21;
	Thu, 28 Jan 2021 19:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F646E152
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:23:20 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id f63so3773851pfa.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MitNH2RViQ9M+l824b3X/mBw9Aai/EXP4oM357HcQBQ=;
 b=ZEqOJcZ0ynUWANxO+EaI+p6TC+ZC7yNGpplc3fOZU8yoDhecz0DxWj2vpouFVQP2me
 6eFAZ1LV+MBQ0CAGtx3XG1Y86rC1cVIh45O2aEZPo+QI6hkseN7xTo8znpXOcFeYnjW7
 pHgNTWWCv3dotgE6JZiZ5kP2SJVKarIHfAFro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MitNH2RViQ9M+l824b3X/mBw9Aai/EXP4oM357HcQBQ=;
 b=GAZbnrKWmbm3ppknMtGvWEgJfccUbTrZQ9pDEMfSQg1xCuYW4vor/zlI4BNM3fKQWs
 DdAXrJssY6EkHrhCHhG+qfT7FHLqN8ij3yexKUioNztQCjJV3JZSGdbsmCB2wULvXS7s
 KE2Cl0N2lMWxKexYJHRKTnco7qkQXt1ezflgUDq3GBea6cWhUj0acIDCHxziWYQrfch6
 9mueBuzr77COOmwvE94Pbwd7L1irctPzGNtWyts2NLaFMxF47RCeDj+/zhztXjYTT7TX
 6vg5Wl+PKHsK70/2spPN9AV0kpb7w0a2Ywpc9Cl04zta/akqDMm4UfrhQy7kgW3sKCq1
 gFMw==
X-Gm-Message-State: AOAM530ZLOXnLIfwpQITNs53wIFo8ViQkxEcZ1j50mKt8MPUUOps1xtD
 +5NNAFnRfNUW05R6I5pqd7q6JQ==
X-Google-Smtp-Source: ABdhPJykNoU5MwajtlO/UqGNGOvj8VeKIu1HgqMarpCtFdqrqZXAI1Ruxgro9gUBNXNDwZCSFiFGAA==
X-Received: by 2002:aa7:87d8:0:b029:1bd:d756:bdc9 with SMTP id
 i24-20020aa787d80000b02901bdd756bdc9mr15240312pfo.68.1611832999795; 
 Thu, 28 Jan 2021 03:23:19 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:19 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 0/8] drm/mediatek: add support for mediatek SOC MT8183
Date: Thu, 28 Jan 2021 19:23:06 +0800
Message-Id: <20210128112314.1304160-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is based on kernel/git/chunkuang.hu/linux.git mediatek-drm-next
The series is tested on a mt8183 krane device.

Change since v11
- fix review comments in v10
- drop "drm/mediatek: add RDMA fifo size error handle" patch

Change since v10
- fix review comments in v9

Change since v9
- change several function to rebase to mediatek-drm-next

Change since v8
- fix some review comment in v8
- separate gamma module for mt8183 has no dither function in gamma
- enable dither function for 5 or 6 bpc panel display
- separate ddp mutex patch from the whole Soc patch

Change since v7
- add dt-binding for mt8183 display
- base mmsys patch
https://patchwork.kernel.org/project/linux-mediatek/cover/1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com/
- base dts patch
https://patchwork.kernel.org/project/linux-mediatek/cover/20201127104930.1981497-1-enric.balletbo@collabora.com/
- add mt8183 function call for setting the routing registers
- add RDMA fifo size error handle

Change since v6
- move ddp component define into mtk_mmsys.h
- add mmsys private data to support different ic path connection
- add mt8183-mmsys.c to support 8183 path connection
- fix reviewed issue in v6

Change since v5
- fix reviewed issue in v5
base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219

Change since v4
- fix reviewed issue in v4

Change since v3
- fix reviewed issue in v3
- fix type error in v3
- fix conflict with iommu patch

Change since v2
- fix reviewed issue in v2
- add mutex node into dts file

Changes since v1:
- fix reviewed issue in v1
- add dts for mt8183 display nodes
- adjust display clock control flow in patch 22
- add vmap support for mediatek drm in patch 23
- fix page offset issue for mmap function in patch 24
- enable allow_fb_modifiers for mediatek drm in patch 25

Hsin-Yi Wang (1):
  drm/mediatek: add mtk_dither_set_common() function

Yongqiang Niu (7):
  arm64: dts: mt8183: rename rdma fifo size
  arm64: dts: mt8183: refine gamma compatible name
  drm/mediatek: separate gamma module
  drm/mediatek: add has_dither private data for gamma
  drm/mediatek: enable dither function
  soc: mediatek: add mtk mutex support for MT8183
  drm/mediatek: add support for mediatek SOC MT8183

 arch/arm64/boot/dts/mediatek/mt8183.dtsi    |   7 +-
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 198 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 111 ++++-------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  49 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 drivers/soc/mediatek/mtk-mutex.c            |  50 +++++
 10 files changed, 380 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
