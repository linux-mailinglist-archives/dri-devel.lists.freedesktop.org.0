Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B232C153FDB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E886F9EE;
	Thu,  6 Feb 2020 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D60C6F9AB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 03:18:11 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id a31so2429621pje.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 19:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=uzNslwih52mut38yu2zPYARWSPgX7/Fj9tEkbUQiLCY=;
 b=kQipj1HOw6H9RjfqtABkLQr6XZs45QySHOuXfNbVYLTKTbVR6lJvlWXrJJqmXEvNHv
 7KYy3ZYtw0T7EMWkG267WNwwf4j5dBwiBhQN/aWL6NT+/nrNvt+BqaLm69DMvYP1KeMz
 533QlILj02oeM4k42xqA5qS3IicNO2AP9Y6p0MiBG1SswCLxhpani/zASYBossTXapj7
 xCOIY45RzAA3+a98PuK+kRfWpAFwI10l/MgT8hrB85mslJA+g8whCZVdw4+dXVcmGT90
 G6nhcNyzFXY1D15PmKFR/A1K2wIyT/Vaz5RxYW4oxehV7MFgH2WlXGb26+pAoO8+LBRG
 Lrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=uzNslwih52mut38yu2zPYARWSPgX7/Fj9tEkbUQiLCY=;
 b=Lu25v8vQ5A4KmrhHf/n5iwoBxd4YsGpLYFklz2jhkznhni1WxbQGRHRLiDgP2lPTSK
 ANzApG/zvW+ZIDhnJy4+Kr9oaoMj1wqEugWbi32ObyUHaqKQbu/BAE9e8EXsg7cecbqz
 Jchzanyw1Iel1da5iNYlScb2GT65WEF/N/ALCuosYGAfAtv0C1u7MjVADFccpZRmCDl9
 ArSu62/GCxOjeEWLkvEH455sNTFqeVMG1QE50+L7ZTfD30DF6YTYftSM8ag2p7TK5YAN
 HLYilcP8+Bj8FvrF/8d/iQg4bc0/kJVmTpfRprsZzR7SCC6t/msGwu8rUbbZlZJtbjj8
 r7qA==
X-Gm-Message-State: APjAAAVdyQ2xtpXBrJvk7OA77dSYte0NaUKZATWLLtxSAMAuBwOAFl+Y
 mlgk3kkTm07dkYp4kzl1LVKQRStQRi0A
X-Google-Smtp-Source: APXvYqxvANnV5oSf4Bvv4neQ0kGoZkwLa+xHXPicON44dm/8skMS0QJiNuOflobRRu27n/GdR45z8/gaqNb5
X-Received: by 2002:a63:2bc3:: with SMTP id r186mr1296081pgr.294.1580959090963; 
 Wed, 05 Feb 2020 19:18:10 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:49 +0800
Message-Id: <20200206031752.193298-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 0/3] ASoC: mediatek: mt8173-rt5650: HDMI jack reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series supports HDMI jack reporting to mt8173-rt5650.

The 1st patch is less related.  It stops running in probe() if failed
to register audio driver.

The 2nd patch supports jack reporting in DRM driver.

The 3rd patch supports jack reporting in mt8173-rt5650 ASoC machine
driver.

Changes from v1:
- refactor the 2nd patch to simplify the code

Tzung-Bi Shih (3):
  drm/mediatek: exit earlier if failed to register audio driver
  drm/mediatek: support HDMI jack status reporting
  ASoC: mediatek: mt8173-rt5650: support HDMI jack reporting

 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 45 ++++++++++++++++++++---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 17 ++++++++-
 2 files changed, 55 insertions(+), 7 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
