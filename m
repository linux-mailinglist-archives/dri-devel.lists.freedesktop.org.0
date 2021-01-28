Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B13070F4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FE66E920;
	Thu, 28 Jan 2021 08:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08A36E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 07:28:07 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id j2so2059679pgl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 23:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZz3ceioh1U58Fbl8S/hu4ZpgE/t+XyWasxorJvZsE0=;
 b=fSa3rYF+HYRmksYTnNnBF7iGLrcWblljS8mseahPbcqq8DhIvFNoh7Ydw+gpq01OC2
 9LKee+XfbDxx9WMW625TsChm2sa7K9XmD4uM8jZBWkKuIDqg20+LvB1GlV5pHIYN9cf7
 RkIJUUwjHD4uvVywJSaBE0Y0f3uzGWechNtQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZz3ceioh1U58Fbl8S/hu4ZpgE/t+XyWasxorJvZsE0=;
 b=GGBCjjH27hHaEOUM9b7iVSGWOynB0DO2qXeWa05BheDLqHl1GTKPwfIKoUumH8mGvB
 MAirgmGRO0n8V11QF4gvx2rJOo5aoIXY+XYHRXemDuq6LJZuoUmi4umKlliqVarIdLVe
 lYwC61I/C6Rdk5BYabNfkwenHRTB1nIlYkkI+/dfNul2q7ki2MuB8lZzIhwloEK3Xj9D
 QQKjfiunrTs4OzoNjtTgZM+okbcnYRFHWrdHMVPIs60e69SBwKXxq1nSr+1JfwutKOPy
 iTU60AvVmSHFdShn/fLObOy7U0ZBCRYL2tF6onDdHhSAL6ojpNZQoFvDqnuUf2dRpojg
 OGEQ==
X-Gm-Message-State: AOAM533Vezk6+DXrNkIHwy4PkbuKg/m2GmSxp/dyCa8k8RNyowaXqhdO
 ZKOhrX1Xn6Yfs0vZtaoCUshN6g==
X-Google-Smtp-Source: ABdhPJxuD2BvG0tK7AzWVRdSCRGTeJ9On+LJVVlKCLl4Uvo8BSo7+t7v+Wgh1kMaETX/DUQ3YbM6yQ==
X-Received: by 2002:a63:5c61:: with SMTP id n33mr15533253pgm.153.1611818887431; 
 Wed, 27 Jan 2021 23:28:07 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id h2sm4800304pfk.4.2021.01.27.23.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 23:28:06 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v11 0/9] drm/mediatek: add support for mediatek SOC MT8183
Date: Thu, 28 Jan 2021 15:27:53 +0800
Message-Id: <20210128072802.830971-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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

Yongqiang Niu (8):
  arm64: dts: mt8183: rename rdma fifo size
  arm64: dts: mt8183: refine gamma compatible name
  drm/mediatek: add RDMA fifo size error handle
  drm/mediatek: separate gamma module
  drm/mediatek: add has_dither private data for gamma
  drm/mediatek: enable dither function
  soc: mediatek: add mtk mutex support for MT8183
  drm/mediatek: add support for mediatek SOC MT8183

 arch/arm64/boot/dts/mediatek/mt8183.dtsi    |   7 +-
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 196 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  10 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 138 +++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  49 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 drivers/soc/mediatek/mtk-mutex.c            |  50 +++++
 10 files changed, 410 insertions(+), 74 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
