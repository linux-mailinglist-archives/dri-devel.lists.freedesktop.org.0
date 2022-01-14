Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC70B48F2BB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 00:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FCA10E2E4;
	Fri, 14 Jan 2022 23:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E119410E2E4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 23:02:25 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id s1so3911662pga.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 15:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVKiFbTgrN+4dfFsvMUyjh+c0889xN5w0pTkQdz39q4=;
 b=RlhP0wuSMGhXyZ0phG35Nuw+vFNDE+c2d0FJlvmi0+5DgQ5O5JmdPQeR7DqGCdMJCC
 /VlrAAmzilfFOfy2kC38ITfTjtJpZv4kTsfB7s/L1ganW6OWvpHUVXoHEafET0oHBu4M
 Ppj9Vq7LGVUguy0vkS7dCTqHlj8W7ppW3F7jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVKiFbTgrN+4dfFsvMUyjh+c0889xN5w0pTkQdz39q4=;
 b=QxnP+qq6RyXI2UPABXlGoQPR+wX+zM6ZdZ/pn3Ccj44J/QYmumo5ZH1gvffynTgOYF
 0NFpGixaCgMRl31HIpTyO0eNnkrXvYp6hCqSMoSHAd0iUoQHBDCoPA7rhaOTKCcnCU1X
 pq2zVoSe6Rk3LrDwo5VeNx/NKnxA+3FHw3okOFKVa2UyQ8cFy4NayJH9NSRmtABQnwSJ
 nH3ExgDZ9W9GJImTpzDbc5qj1IhgDDzY4bzxlrIRebQrKGC5nZjglfkX4EFQFyy4xEsk
 N/MbiqsQaLDErsxIhOdw1tdr2CuWe447PqwJ5IQRp03tchn0eKofM0qWFuCvqwsTajXF
 sMyw==
X-Gm-Message-State: AOAM530C1HAwbWWR0K4zwV9ApjdmkTDbAfUFvMCaMNELfMPWGG6PtODK
 qkB+bZh1inK995rc85o3aL17/g==
X-Google-Smtp-Source: ABdhPJygQAhOjz++7gMBKAe+FDohBuatX363kR5ClyepF85gLiZS7G/unLnFqdy+/LSmnjDXX93GWQ==
X-Received: by 2002:a05:6a00:890:b0:4bd:347d:8aaf with SMTP id
 q16-20020a056a00089000b004bd347d8aafmr11000008pfj.61.1642201345551; 
 Fri, 14 Jan 2022 15:02:25 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id c10sm6750264pfl.200.2022.01.14.15.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 15:02:24 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/3] (Re)enable DP/HDMI audio for RK3399 Gru
Date: Fri, 14 Jan 2022 15:02:06 -0800
Message-Id: <20220114230209.4091727-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes DP/HDMI audio for RK3399 Gru systems.

First, there was a regression with the switch to SPDIF. Patch 1 can be
taken separately as a regression fix if desired. But it's not quite so
useful (at least on Chrome OS systems) without the second part.

Second, jack detection was never upstreamed, because the hdmi-codec
dependencies were still being worked out when this platform was first
supported.

Patches cover a few subsystems. Perhaps this is something for arm-soc?

Changes in v2:
 - (Un)set pinctrl, because the default assumes we're routing out to
   external pins

Brian Norris (3):
  arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
  drm/rockchip: cdn-dp: Support HDMI codec plug-change callback
  ASoC: rk3399_gru_sound: Wire up DP jack detection

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 17 ++++++++----
 drivers/gpu/drm/rockchip/cdn-dp-core.c       | 28 ++++++++++++++++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.h       |  4 +++
 sound/soc/rockchip/rk3399_gru_sound.c        | 20 ++++++++++++++
 4 files changed, 64 insertions(+), 5 deletions(-)

-- 
2.34.1.703.g22d0c6ccf7-goog

