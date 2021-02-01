Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42730B9A3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63F36E8DC;
	Tue,  2 Feb 2021 08:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF0B899A7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 10:37:33 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id y10so5477848plk.7
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 02:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wI/EH3fEWAPQS3Xf8crYapoATgbi++9o7dF8fi8itpo=;
 b=GvSpQ9KHSTEV3BtrFXzKZ3LVIY2dzpbcfAEmkcSMsAdAS2jsalfwuq6eL1iePNGt96
 gg2Cjr2vDVh7p+8JwUfH7Z0/Z6bfThDA8mpL0fWg5zUsQ5JXFRJt9L7pvBCHJyaRyGio
 i/6A3ji1ouqhJEhaC9dqkaMDSoPcM2xAoMTvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wI/EH3fEWAPQS3Xf8crYapoATgbi++9o7dF8fi8itpo=;
 b=NVVM4DV6upMg9uzuUccS5xO17jbeKE7np0H3JRi5o6cChOwGUleuUgEA0ldH+Vus0l
 DdZ0GWyOCaRs/t6MuoysBQzsaS+jWfugY35vgtfPq7NmF61D6cZBeWNKZF8I+6b6uRVX
 1oMflr7YZmzjuUpq+1uEIJbG9rjUkcEufNeoAah1lEXXtfKuIbqW+WkMtfT20zSVlhwJ
 t9W/ZDWhlP91l0daVffVnd/NHin7QM7PJB34KHML2k5munt1GaeYx1d7NZ3gpgV4ji7v
 TXS82gu64olTKUN1GFw3M4AlwmP5dN4UYS4gT0iPuqeN0b+62SDpHJ5XkgQHZnn/h5QY
 LunQ==
X-Gm-Message-State: AOAM532k9QGqXdc82rxHv7hhYBxWktx5Sa/BidhqxIrYlabee8y8ABqr
 UviB7FXILUGbxJfgJ9yDkp6NiQ==
X-Google-Smtp-Source: ABdhPJxv3LXDVs7fBfg/uKaO6x5vyk1u6dhU+xMb6ixBUYJz8bISQZMnKJFdPHiRfCAsn90W3LZJRg==
X-Received: by 2002:a17:902:67:b029:de:c5e0:87ca with SMTP id
 94-20020a1709020067b02900dec5e087camr17600276pla.64.1612175852674; 
 Mon, 01 Feb 2021 02:37:32 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:32 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 0/8] drm/mediatek: add support for mediatek SOC MT8192
Date: Mon,  1 Feb 2021 18:37:19 +0800
Message-Id: <20210201103727.376721-1-hsinyi@chromium.org>
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


Yongqiang Niu (8):
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  drm/mediatek: separate ccorr module
  drm/mediatek: Fix ccorr size config
  drm/mediatek: add matrix_bits private data for ccorr
  soc: mediatek: add mtk mutex support for MT8192
  drm/mediatek: add support for mediatek SOC MT8192

 drivers/gpu/drm/mediatek/Makefile            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c    | 236 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h      |  17 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c      |  20 ++
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 150 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c     |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  | 166 ++++---------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h  |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c       |  52 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   2 +
 drivers/soc/mediatek/mtk-mutex.c             |  35 +++
 11 files changed, 564 insertions(+), 125 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c

-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
