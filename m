Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABDA21E8F9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32896E907;
	Tue, 14 Jul 2020 07:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA636ED80
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 00:50:00 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id q198so7103968qka.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=20pV1CIodg74lrZACp1xknXljGhFXMhtlkIxrWqAh18=;
 b=sV02vE9byfWPbEVCcYwB3QUisTSlxWw7Wi25mI64f6uBLTgJ7C1UIFPI7plN8Ppa55
 RWkKcGXCGGzzeWcIZ2l4BWa68ebOnIhN8nFMRxCLZ4XD/edYZOD33+jcNEZHpAP8qiNm
 8DULOUGv9/JVrSLGD8/BR5jWVlTfxOIn8+njnKmX7sJ140zwLZumfWH/NYQcxH+n8A+q
 whRojYp1oHJd04TAtKeFIw3xRpBQrfTtSejwrYPASsxt2zONNy0Obb9DCZhTlVPEA2D3
 Icrj4b/v5bO/Cf98AOWQLuMiAwuCFSPhFFhtISOOWNDT40E7OiNKjET7Cqmg+E4eKQni
 WtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=20pV1CIodg74lrZACp1xknXljGhFXMhtlkIxrWqAh18=;
 b=ibJqx67qWYOcTc1qtsSj37mzwdoNyFosGU0ZqKWWQABTKV0dK8Nz23Sn0pQ53VI8to
 xNzadIoBdcAAgPKrmXvWypTIhFPIpqobHhPdDRB6FDttAffmC8QEI/8ySLn4FwgC2bd5
 YW0xIHglsUIjGF4bIS5y3awO7idHKBqiUgTn8hDNWhk7LJTlXbaVGw92Zdy78FwKD3l3
 Abw/nlnawZz3hbM4JFJ5zrrn9UcCRqh63uEEqETsDUX+hVAdxpHpOT4IfoH00ULjLg9L
 ZGTN+8YWGqLAbFV33OgOlDrmUth7QPWKoh/ED4qOfY6dbyJEruvHLrJL+yATvbjJX2ax
 wGBQ==
X-Gm-Message-State: AOAM533WP/nxeJHFGn8uh1CCtdSW5JBrmm+Cgag7PVi7OHo8FZfu4IoK
 M8t+GwfQP/z0zeQVRIdivvsiAQ==
X-Google-Smtp-Source: ABdhPJyVyrsZVLhaxkXm9h29nJJCU9M+eXdlkKV3LKb55qN6JAcw8Ss1bKD7yrrXGUmy/Q5IkV8e7A==
X-Received: by 2002:a37:6642:: with SMTP id a63mr72203468qkc.5.1594428599315; 
 Fri, 10 Jul 2020 17:49:59 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 17:49:58 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/8] Initial SM8150 and SM8250 DPU bringup
Date: Fri, 10 Jul 2020 20:47:23 -0400
Message-Id: <20200711004752.30760-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Sean Paul <sean@poorly.run>, Krishna Manikandan <mkrishn@codeaurora.org>,
 Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, zhengbin <zhengbin13@huawei.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches bring up SM8150 and SM8250 with basic functionality.

Tested with displayport output (single mixer, video mode case).

v2: rebased

Jonathan Marek (8):
  drm/msm/dpu: use right setup_blend_config for sm8150 and sm8250
  drm/msm/dpu: update UBWC config for sm8150 and sm8250
  drm/msm/dpu: move some sspp caps to dpu_caps
  drm/msm/dpu: don't use INTF_INPUT_CTRL feature on sdm845
  drm/msm/dpu: set missing flush bits for INTF_2 and INTF_3
  drm/msm/dpu: intf timing path for displayport
  drm/msm/dpu: add SM8150 to hw catalog
  drm/msm/dpu: add SM8250 to hw catalog

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   8 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 288 +++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  48 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  18 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  75 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   6 +-
 12 files changed, 364 insertions(+), 158 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
