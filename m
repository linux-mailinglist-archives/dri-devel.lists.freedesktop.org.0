Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729D030B9CE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CC96E91D;
	Tue,  2 Feb 2021 08:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6D76E8C5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:12:43 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id q20so13814978pfu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 00:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+cMOXMiJhmN+BhMWGOCZ1mGQnNvZ1HLYwA10LUk+qs=;
 b=BE7+LLk41j5m1eELGRoOKzZpOyZhdKiTFcK4TJIWMv79mn6AOaVvhj5IrKMgLIoNO2
 Yo/GV8+n5rFxI6xgYlyjq1XC3z5pn/8bj3GSO8hFplB6ElygbiKiT5A0Efb6BbLVfHgQ
 XNxFBpDG5Xpv/852PpyOFg8QXk4fymYm7pA0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+cMOXMiJhmN+BhMWGOCZ1mGQnNvZ1HLYwA10LUk+qs=;
 b=MgIDITv4W/WHyzN53jZH3wWEMF/sM9skiFukCH+g3a93VptF16/rncb/fRQkoDTQ4F
 41ff9umgR7VFCR+g0o0VSLbR8qU95UJS7jGgNmoabTb6R2+M3OB6fZTYbUrMYa1CNCaW
 9/B1H8xLNhc5MnCacc+/bGVpYsnECvLDAWFar8otNsU/8ryCZcDgc6eKJawXrrdOl+tf
 NlXNI4eXMlsWOFWKkQL+tUImC2uWtAoi5ja7fAYv0BxAZe5UCPx5nWrzH6wbYf3BT4rU
 +qCK0RdZZQvHoD8cvGUeMCz9yT5pAyoz7GiXaxPnoPvGaGTHwCue+wDx0O5muyXx83K5
 fL7w==
X-Gm-Message-State: AOAM530gOngI5aPEsQYu/2mtCh6o17LGeYkYwYZjao3B97VAgNpi73So
 NquEdwLX9PcD6tYCSv0SmdCvgw==
X-Google-Smtp-Source: ABdhPJw76yjiccRfuMor3XXLd3rnpk4IlwGPyv9gDv0sKW+2j5Rjt4voUr1UMcCID3auXrXGcyIIpg==
X-Received: by 2002:a63:c743:: with SMTP id v3mr20558822pgg.316.1612253562732; 
 Tue, 02 Feb 2021 00:12:42 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 0/8] drm/mediatek: add support for mediatek SOC MT8192
Date: Tue,  2 Feb 2021 16:12:29 +0800
Message-Id: <20210202081237.774442-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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

This series are based on kernel/git/chunkuang.hu/linux.git mediatek-drm-next
and following patch:
("soc: mediatek: add mtk mutex support for MT8183")
https://patchwork.kernel.org/project/linux-mediatek/patch/20210129092209.2584718-8-hsinyi@chromium.org/

This series also depends on component support in mmsys[1]:
- [v4,06/10] soc: mediatek: mmsys: add component OVL_2L2
- [v4,07/10] soc: mediatek: mmsys: add component POSTMASK
- [v4,08/10] soc: mediatek: mmsys: add component RDMA4

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-7-git-send-email-yongqiang.niu@mediatek.com/

Change since v5:
- move postmask driver into mtk_drm_ddp_comp
- fix review comments

Change since v4:
- fix review comments

Change since v3:
- change several function to rebase to mediatek-drm-next
- drop pm runtime patches due to it's not related to mt8192 support
- fix review comments in v3

Changes since v2:
- fix review comment in v2
- add pm runtime for gamma and color
- move ddp path select patch to mmsys series
- remove some useless patch

Yongqiang Niu (8):
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  drm/mediatek: separate ccorr module
  drm/mediatek: Fix ccorr size config
  drm/mediatek: add matrix_bits private data for ccorr
  soc: mediatek: add mtk mutex support for MT8192
  drm/mediatek: add support for mediatek SOC MT8192

 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   | 229 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  20 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 187 ++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  50 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 drivers/soc/mediatek/mtk-mutex.c            |  35 +++
 10 files changed, 421 insertions(+), 120 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c

-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
