Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33C47497A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620B710E193;
	Tue, 14 Dec 2021 17:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F34210E244;
 Tue, 14 Dec 2021 17:33:55 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id l10so6912781pgm.7;
 Tue, 14 Dec 2021 09:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aiq9nNSvlZRUirau9B4I1N3QBcTBVS4NyHnI1Y/cwlI=;
 b=mZkyLk6P3Fp0rIPqxiycuhn3j5MLBRUp2miZAgxJhL0SIlwWwjdR6y+PuFOQi9pg1z
 f0vJkHft1DfFaFyxh6nB/BI4Gs1M0f+ceJtVSg7dkI+oSnL3GdC/wf7mVgx2w1BuHacQ
 xvAW3TzawJRnN2JZdJvyzSIZiM4F7cN4CGmQmv6cUvVUr929Uu+KQwSHu6iYWMUttB1M
 LUBk/9EjVuw/g8bSyY2jiYlfmONM/IGUNnI3qYluzJfcTSdAb8c1e35D6beJPwcROSdO
 /h41ViHPDrk9Fu4pH8fdaQuHdLBhSwiAhmAtfDwe02wAAmTUqVbTCtyeIMlBDaTybmrX
 Xnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aiq9nNSvlZRUirau9B4I1N3QBcTBVS4NyHnI1Y/cwlI=;
 b=QRew2CROTFyvGg6llGyhQamkvYojckB2Wwtb2NPlZgvVIw5q2J8VsTvyBcCsx5tHBl
 LQ0/YfzdA1Z3246bE2b102VMU1RRl9QIOVRWJ6wbOQj7DRqcfqBrOcXfDsoz35yrddv9
 lgUpWkCqnh43CYgn7uawXu8Reu9STxIuKbRJVnDGTxeuZyqhpVeJNgiuB5pmuAt+qerB
 qphdzdSxoJE5O+bR8kTkyQamNceG9K8+pSbO20h7KGfBNlaLmxyRqONl5oyfHHNO0x3C
 nqeVK+QsqxWw1Rf4FgQ+UaznLFXCaRK83bNBvjdx1nWOV6Qm5mOMiVSTldyEfLgEJf89
 umOA==
X-Gm-Message-State: AOAM531KTOITH36FzfbYF86hwd6KZ0+3fZXB8GURq1WpmRwvNwOx/sXr
 QjUtIft+6F4FHOKzlxk9dWXcwLcfNfc=
X-Google-Smtp-Source: ABdhPJxQRcmEWi0VOIERaMxn3AGDNXnCT28ghoDG1tX8uXegK9zrHvboi8MntbRDd9WYTe1yrWhwCA==
X-Received: by 2002:a05:6a00:809:b0:4b1:33bd:82f5 with SMTP id
 m9-20020a056a00080900b004b133bd82f5mr5350689pfk.71.1639503234457; 
 Tue, 14 Dec 2021 09:33:54 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 l13sm438617pfu.149.2021.12.14.09.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 09:33:53 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: Add display snapshot debugfs
Date: Tue, 14 Dec 2021 09:38:58 -0800
Message-Id: <20211214173917.1496290-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>,
 linux-arm-msm@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <seanpaul@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, Alexey Dobriyan <adobriyan@gmail.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This series adds a "kms" debugfs file to dump display register + atomic
state, which is useful for debugging issues that don't trigger a display
error irq (such as dsi phy misconfiguration).

Rob Clark (3):
  drm/msm/disp: Tweak display snapshot to match gpu snapshot
  drm/msm/disp: Export helper for capturing snapshot
  drm/msm/debugfs: Add display/kms state snapshot

 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  | 28 ++++--
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 14 ++-
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  9 +-
 drivers/gpu/drm/msm/msm_debugfs.c             | 90 +++++++++++++++++++
 4 files changed, 129 insertions(+), 12 deletions(-)

-- 
2.33.1

