Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9096C2948AD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836B56E979;
	Wed, 21 Oct 2020 07:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10376ECF7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:42:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q5so2932485wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KolONEJ0/kBt/8YOlOvYo0QZLfG99esXIK0wMwF8lc4=;
 b=mtc2L/eKqA8TBWtNj1lh1nggWXnyR45rPOaumTksxHaV/nb4d/T4zAlD2P9bjzpHyn
 dfu3yTG/We2OKP1fQIc4+Lj1428T5LiozVeaflzq8AolVXTn21CFIl9ulS4Qau5gLq1J
 IRHbGN2i8IDhOy8UUmMXccWL1xNSJqz4YbnSPOvPH89tfwD+a/yz7rEUFLjBBTPpgesM
 3f1X0/IMnDRSGBqiQK5nS0hhXiexW/y6iLionKupQXckqGP06dQHWHoCjeLx0EIIgq6c
 iwtxhRYwRLZBIK1XSuO9zqjgT7EPREzS1V+iRqvqhw1IW7EkCjA0J2023QN0mRwI4q+u
 yZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KolONEJ0/kBt/8YOlOvYo0QZLfG99esXIK0wMwF8lc4=;
 b=NioYKa6GWOcQl3U2dgkedGI8a5HmVYavvWS8btX4CBpAWcNWyj8xUUFjjjpBWLfzXf
 b9tKPjiGjuxx9J2RLxa4HNzbFZwQZ4FLUxwbDCKkuOqJUUB3IgCkT0/wkRmFfYvk0UPg
 PIGb9XTB4qw/SJD3Hw2uUSmJ2niM9dw7pafxE33AbD0BYFWboxg5HZ59BfW6yBLUx+Kw
 w9bpoCFtybZhbRYMmLq7S3YDzPrjcnQo7Qtec+UW52gzJjWMwc/YAggi2JUWSKLARFpQ
 ORtB56T/N7Rfc5gd+kfQCAo14Pa8dt6DWyVFPKiGtlVAsIdvm62hPvA5Dv4dNAvWtWni
 e0gA==
X-Gm-Message-State: AOAM532DeLhVxUlqa/0O6N0z0BNJB+mUDk6JmNvUNgg1BdrewSMd5sSq
 4Q6bs7eTalcaa/+r+M60ytKxgA==
X-Google-Smtp-Source: ABdhPJxdhFa4U3zvDL3nve6Smzr3olv0OJGGCpFVU2nQZJ2SRN4kwERM99KqsVG5ZE8vhs1527lNKg==
X-Received: by 2002:a05:600c:cb:: with SMTP id
 u11mr3925064wmm.112.1603215777481; 
 Tue, 20 Oct 2020 10:42:57 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:42:56 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] Add DRM/DSI support for MT8167 SoC.
Date: Tue, 20 Oct 2020 19:42:45 +0200
Message-Id: <20201020174253.3757771-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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

Fabien Parent (8):
  dt-bindings: display: mediatek: disp: add documentation for MT8167 SoC
  dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC
  drm/mediatek: add disp-color MT8167 support
  drm/mediatek: dsi: add pdata variable to start clk in HS mode
  drm/mediatek: dsi: add support for mipi26m clk
  drm/mediatek: dsi: add support for MT8167 SoC
  drm/mediatek: add DDP support for MT8167
  drm/mediatek: Add support for main DDP path on MT8167

 .../display/mediatek/mediatek,disp.txt        |  4 +-
 .../display/mediatek/mediatek,dsi.txt         |  7 +--
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  7 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 50 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 38 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 20 +++++++-
 6 files changed, 120 insertions(+), 6 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
