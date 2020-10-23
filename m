Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7502297DA2
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4986E902;
	Sat, 24 Oct 2020 17:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DA96E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 13:31:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l15so1572068wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0g5y25aamnJmaPgpvLpUPjcowdDVx0DC7LsyytrI5g=;
 b=MlR6wK4kuxU+Ax9dRf4/DR9QDEr/ma6S6Y2sM20AWbwA7RfrDwTOOLYdZaax7G0v1y
 zsFqOdkKJfXeOi3Yyhs6Zhol6iJX6NsnuMRaRnAoCfQxi4JEXtn5GNKWELkTTWb8WdHn
 ajtN6cIlBo/KjFgAgqvJLHPTaCSxPtg6NuFnBiti0+aY7y+Wnahua1t8VjnSDG5TyTLx
 L1xGw/h7u5Qp+D2SR2Y9/0TmbwOwUPdOkLI6ydPX2T/GrZA/QQDjLoEen9L6CFXZVUxy
 /N8Bwq19JrKxMCxvNX6YwY8+cSYhFxAnjWHLzaBIJHX31b0Ppkepn0BNjIrPH6qfGGsh
 CqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0g5y25aamnJmaPgpvLpUPjcowdDVx0DC7LsyytrI5g=;
 b=BLdfaLh983jbsDS6cGSZLntbSd8t2v/4hwIewqJY9RwGS0b4ELEMXGMcsf4H+Rfo1h
 8ZeWzfIwIC6P311hzjTHcG48l4GConytzhyhtF5EMoxOeVmVmxlX83Cfy3glNmog7aG1
 Th1H35KjjMqygGOPb+vbQmmt3bVz/Bd94S0VldF79k8+Jr9Q3W4MdZ67lD2WmLoIO226
 zhGEyJxUDmEj3a4ggYR3/gs7T9GVnvsO2vUgwWMunJqkxSMs4PZQMsjXyA48Jt4fe1Zk
 XLdG4vAuY0Pda9SlWRoAVLueytDYGANmfzvahXZ7jmhwRzb12jNLOFFQCwi4Xw8D5c1Y
 xQdA==
X-Gm-Message-State: AOAM531cQBd53W1aHUDqA+FsZQTB4opk+Z3EgDhjL3IWh8LQwgKxEdp+
 GkxHmTE4TUCEHYEspoFoq9Dp7Q==
X-Google-Smtp-Source: ABdhPJx3KXkKjPhuP5F8RgAsbrby6ayVAwe3PQJpsJ7APdCh/zspU8uMjMlSQ4RwHHypPHprj6j/XA==
X-Received: by 2002:a1c:bb84:: with SMTP id l126mr2267365wmf.141.1603459894574; 
 Fri, 23 Oct 2020 06:31:34 -0700 (PDT)
Received: from localhost.localdomain (211.160.185.81.rev.sfr.net.
 [81.185.160.211])
 by smtp.gmail.com with ESMTPSA id f6sm3146107wru.50.2020.10.23.06.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:31:33 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] Add DRM/DSI support for MT8167 SoC
Date: Fri, 23 Oct 2020 15:31:25 +0200
Message-Id: <20201023133130.194140-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for DSI on the MT8167 SoC. HDMI is not yet supported
as secondary display path.

mmsys is not supported by this series and will be sent in a seperate series
based on [0].

[0] https://patchwork.kernel.org/project/linux-mediatek/list/?series=360447

Changelog:
	V2: removed 3 patches

Fabien Parent (5):
  dt-bindings: display: mediatek: disp: add documentation for MT8167 SoC
  dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC
  drm/mediatek: add disp-color MT8167 support
  drm/mediatek: add DDP support for MT8167
  drm/mediatek: Add support for main DDP path on MT8167

 .../display/mediatek/mediatek,disp.txt        |  4 +-
 .../display/mediatek/mediatek,dsi.txt         |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  7 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 47 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 38 +++++++++++++++
 5 files changed, 96 insertions(+), 4 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
