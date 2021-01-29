Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74DD3086DC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C40A6EA95;
	Fri, 29 Jan 2021 08:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4913F6E440
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:34:42 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id j12so5679548pfj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 23:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+JP5pdQIMiJpdb9A5szcfBUiP1gg4B51D5kz0l1qAg=;
 b=E09IVCDKJaw1pM4q9Xnmre77m650iwDkHBLJ3i/9bSNUoekaS/8ot9t6W56VmjAKwa
 QjiDOqS16pIL5sVYk5KttRbM8MdUaKpIQ541ryhlPLJo44VwPoArxWoB+MH/B7/QUGjU
 5V3VMnLqlD7cvK4kj/n/txS4UXBazFby9qp6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+JP5pdQIMiJpdb9A5szcfBUiP1gg4B51D5kz0l1qAg=;
 b=ukU5NqQBNBH7XPId0f6BCFn5iRM1+a7T9nfb5bZAEEnmooeAu8sLZrWvdDRkMPDv8S
 WQKCIX9SnVpIjJuu8XxS+vGPWMBty3GnwyvgtK/WfR1fHrQe0Y5lcAnExTX+1uBOtVY8
 v7aFQUbiOkwifNmbeslNRH9ld1RuO/v8h7lAYF62yxBgZzL2T+cpCDqAkdMzdsrN90zW
 puHyw3bvN1Bl4inmvpaAvg+WLXYPH8yJvvA+Xm60l1n7ihGaQQNDXPyg2+iYzTf8TkCc
 4+pb6Lbvj7k+iRhDp2K6oDl7PL3FK2XZaP5itWU8IsJUYEOOzah/JoIGSgqk2kVzMyYY
 KjWQ==
X-Gm-Message-State: AOAM533Iv47yKHu2wqw27VuCOgBUP7mcOYFewpkRQQjEuiAXlJ6WkBlU
 uKGQ/KRaz+EnxQwWfOqdFbj0EA==
X-Google-Smtp-Source: ABdhPJyTJmer89hnTyIzUeFUMxU3MW8yNhou7rK4sLjU8tB7m00M0/MUS/wOTfNcVHzJo8qqSaZxiA==
X-Received: by 2002:a05:6a00:14c8:b029:1bb:8436:497c with SMTP id
 w8-20020a056a0014c8b02901bb8436497cmr3190934pfu.68.1611905681713; 
 Thu, 28 Jan 2021 23:34:41 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:41 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 0/8] drm/mediatek: add support for mediatek SOC MT8192
Date: Fri, 29 Jan 2021 15:34:28 +0800
Message-Id: <20210129073436.2429834-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 29 Jan 2021 08:11:32 +0000
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
This series also depends on component support in mmsys[1]:
- [v4,06/10] soc: mediatek: mmsys: add component OVL_2L2
- [v4,07/10] soc: mediatek: mmsys: add component POSTMASK
- [v4,08/10] soc: mediatek: mmsys: add component RDMA4

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-7-git-send-email-yongqiang.niu@mediatek.com/


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
  drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
  drm/mediatek: separate ccorr module
  drm/mediatek: add matrix bits private data for ccorr
  soc: mediatek: add mtk mutex support for MT8192
  drm/mediatek: add support for mediatek SOC MT8192

 drivers/gpu/drm/mediatek/Makefile            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c    | 244 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h      |  17 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c      |  37 +++
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 162 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c     |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  | 108 ++------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h  |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c       |  52 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   2 +
 drivers/soc/mediatek/mtk-mutex.c             |  35 +++
 11 files changed, 572 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c

-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
