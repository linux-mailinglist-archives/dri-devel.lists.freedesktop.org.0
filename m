Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D0F66BC6C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA3710E3C6;
	Mon, 16 Jan 2023 11:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180A010E3C6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:08:30 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so15629753pjl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dfRiQXYTUx6y8hhtdcAlsfGS9AhT12f1GNqfx+pyyDk=;
 b=Eztij/jKwvQgLi8FDIq5tc40NYED6o9kyjWUtMs94tSD3Q0DoNhh88GZK3QOx5Mbjl
 rqQtvulivsl9z30WiH5kwhs7vxyc4rBEs5Fa8Om0dq5CDMPtVdMp6i/fb/Ex37GBMe9q
 TDCD8Ft7g+ZKdLIbmLWSTdQqsosUGLE69BZUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dfRiQXYTUx6y8hhtdcAlsfGS9AhT12f1GNqfx+pyyDk=;
 b=ZQ1UGYVUQQAkCRYBdQiZx5tvqqBN+LefPAA//4UX/GW6JLJW6MhkJAT/mFr5QaUtD9
 LID/Q1iOVchX/GpGiYWD7WdGscbF5+tE/uoqE8rLL6wtlvmo8d/0iVhlx2UpNRsRUaqf
 RYJbWiCtt2CtGUPDy2SDSzZUsD/kClFPP45lUQ4ZkuTc9se9BRyrVl1DwDNMFoVtbvjM
 SPffhVe2RSFmcB18942Lj7FnnKmtLibsS3JmFPA6TkXzsVSorMlbilLl5Pg7JxXTgXST
 6FBkF3MBfqwItu7NaE0xCOfeYlWF3uQREKyoIjQm9X2fWAx6rPUjZLJH2VR9l2OXR1OF
 EQaA==
X-Gm-Message-State: AFqh2kokWDsOIYpPlALw+sNyHRjsyQ2M2TgCfRoNkqzkk7fCDO8k5FNB
 jWBDC7MxIRZgDuNPIJzr3fzd0A==
X-Google-Smtp-Source: AMrXdXsggwYVYYGhO1zejEuuLPLjf5Zi64UVNlp925UPkPrexYScta5K/8VyKE2HL32TxjKI4YFFag==
X-Received: by 2002:a17:90a:b110:b0:223:4308:1ab4 with SMTP id
 z16-20020a17090ab11000b0022343081ab4mr93379792pjq.46.1673867309636; 
 Mon, 16 Jan 2023 03:08:29 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:a3f3:9ba9:fe36:fbcb])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm17993686pja.21.2023.01.16.03.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 03:08:29 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/2] Add generic-display-mux driver and bindings
Date: Mon, 16 Jan 2023 19:08:18 +0800
Message-Id: <20230116110820.2615650-1-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the v2 the mux driver part of v1. This series is developed for
and tested on MT8173 board, whose layout looks like:

                                  /-- anx7688
-- MT8173 HDMI bridge -- GPIO mux
                                  \-- native HDMI

v1: https://patchwork.kernel.org/project/dri-devel/cover/20191211061911.238393-1-hsinyi@chromium.org/

The other drm bridge callbacks is dropped in this version because:
- The non-atomic callbacks are deprecated
- It would be complicated to pass the atomic state to the downstream
- We actually don't have the hardware to test them

Changes in v2:
- Referenced existing dt-binding schemas from graph.yaml
- Added ddc-i2c-bus into the bindings
- Dropped attach/mode_set/enable/disable callbacks
- Fixed style issues
- Removed the special case for the HDMI connector
- Made the driver only read the GPIO status in IRQ handler
- Rebased to drm-misc-next
- Updated the license: "GPL v2" --> "GPL"

Nicolas Boichat (2):
  dt-bindings: display: bridge: Add GPIO display mux binding
  drm: bridge: Generic GPIO mux driver

 .../bindings/display/bridge/gpio-mux.yaml     |  95 +++++++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/generic-gpio-mux.c     | 201 ++++++++++++++++++
 4 files changed, 307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
 create mode 100644 drivers/gpu/drm/bridge/generic-gpio-mux.c

-- 
2.39.0.314.g84b9a713c41-goog

