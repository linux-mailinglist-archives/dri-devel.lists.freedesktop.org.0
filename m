Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F0735C1AB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55E6E07B;
	Mon, 12 Apr 2021 09:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C596B6E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:39:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id y204so5005803wmg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1BnG+IENM4qvrGt9ztIqEmR2ezH1D5tkiZdEencp0c=;
 b=NDC4fFT+scz5EapADelZyfCl195sOOv2zwhoQ7BzUsreOAT5gl9FUXPVafJeb8KFEa
 RlPUeT5uW4WhE6OFY12guQS1IyIzcWkywAtXk4TagSimQUiX17NgHp1rBiUtlqxnuYJ+
 bHqR2fmTaAcpw9d/M7Y/8H5cvOpBhYovJnQVE0HfKiyR6zqdxEdfMZBxW1PZJAiWQQnb
 PWpqFJVji72qnuCyvG1reW8Dkob+9H8ZQsj5DbMR4lIrz93/9Qthv+I3DXrknc0J6qwD
 AECk8CYfRPH+/s0Y9AguuIG7RNv7Aq0ClpZ/jfAzLS8pqY8h14nWDfbHM5qvdT/qvE4B
 FGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1BnG+IENM4qvrGt9ztIqEmR2ezH1D5tkiZdEencp0c=;
 b=UGwc3hljxJeQcArLI//1l5y1zP2/MZTtRAN1VbVFXlxwqSyDS6oYpAKKTKhSqtv7Ar
 9qlrtzkhImXAYg88clNZW7joYzYWdkCm1zekPtEuOggSd7FyOYSEG4u7Rn172gTyvz5d
 7pCNJRKw8f4+0VLyoBLBKozDRAU1m0y7TZK6loBfL+gJhnZMGXaKcaoj+c6hqt1sUjmp
 5lv47g+u1egzdRM8BHEbN1NapDbwC6I/I3hlohprKSGAtfMOJJogP4zDVDH3F5NcZrPQ
 ftjQSVnuf+Udk5lp7OnfelqQyuTgEyDDXCsTCEDXzyeGLeto42tl/d+i01glxWqM29AI
 sBNQ==
X-Gm-Message-State: AOAM530zmtm+UX5MjjijUSO+LAsNSuD1dmXeSJcVd6ssCk2461dCkxY/
 xdeeal+EIKWpDc7gkqDnSOm2Jg==
X-Google-Smtp-Source: ABdhPJzb8zquyRlhr97rmCN1MNzd5KVvMYgqyH3tT3JQ6U4D10kioViIzexWKJVu3EQa2ZFNYH9qzg==
X-Received: by 2002:a05:600c:4d91:: with SMTP id
 v17mr4377091wmp.28.1618220373362; 
 Mon, 12 Apr 2021 02:39:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Subject: [PATCH v2 0/5] mediatek: hdmi: add MT8167 configuration
Date: Mon, 12 Apr 2021 11:39:23 +0200
Message-Id: <20210412093928.3321194-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MT8167 SoC have a hard limit on the maximal supported HDMI TMDS clock,
and is not validated and supported for HDMI modes out of HDMI CEA modes.

To achieve this:
- switch the mediatek HDMI bindings to YAML
- add the MT8167 compatible
- add a boolean to discard the non-CEA modes
- add a value to specify mac TMDS supported clock
- add a conf entry for the MT8167 compatible

Neil Armstrong (5):
  dt-bindings: display: mediatek,hdmi: Convert to use graph schema
  dt-bindings: mediatek: add mt8167 to hdmi, hdmi-ddc and cec bindings
  gpu/drm: mediatek: hdmi: add check for CEA modes only
  gpu/drm: mediatek: hdmi: add optional limit on maximal HDMI mode clock
  gpu/drm: mediatek: hdmi: add MT8167 configuration

 .../display/mediatek/mediatek,cec.yaml        |  52 +++++++
 .../display/mediatek/mediatek,hdmi-ddc.yaml   |  58 ++++++++
 .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
 .../display/mediatek/mediatek,hdmi.yaml       | 132 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  17 +++
 5 files changed, 259 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
