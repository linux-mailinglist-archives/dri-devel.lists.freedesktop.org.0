Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D13825A5AC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 08:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6896E0FC;
	Wed,  2 Sep 2020 06:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E056E0FC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 06:44:16 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id y6so1826171plk.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 23:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2/PwrHkXfRPQTDfnYkByFyhHKkP+0jKSPgxEEXELOwQ=;
 b=TQ/3KCYqasru32p2OO2IQhCCSo6aHlnixswEpGXVnVJY9KZ9cp7xEOtjds86wKSDTT
 KXys35zg30v70pQ6LiCi/nY+Vd7o+E3KJIiQpnaiVnoEU4ER3yBjJn2U9TpmHbbEG94s
 XMQHQkuBViGZn4I5xowJCyWtDNIDe0NUYeqZN4uZUdkBmEdEsGzCgG/1cwiB/VeJAJkA
 9B9X1dZtaRsO5AenaU5e6WyiMGkeke3Qhupbfv/YQPIbWDtD7w/GIEiqe5DKHb866D6p
 frW0BlCXL+PH5QBJK2NQ58ohO4jEJCaVdBijhEnacUspto7zMjlOz2bAVyNSJ/CCgtRP
 cchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2/PwrHkXfRPQTDfnYkByFyhHKkP+0jKSPgxEEXELOwQ=;
 b=MSKRyIsb1oXESRTpOLwBaZn8pghZUdpkEPkrTJZnGbbeyRY9TgGJwbRQLLOU5fF2e4
 OgfDz+pTphwoqEQwobvxBcVGNTEPcYTTbg7WoPPPgMXKiLwCwgBukW+l/bNIQmuOwMMp
 pSC1ViGjF8cbmWFf/CGpoyt0LBUq94LcaopbS0vtmonpjqApsvW2YlaT63qm1SEXpuc+
 m6Bgml/7vCyHlRoiq2hVVG1p+JXavIPSD7xmhUkkOLj7MVG2rBw82bB54n3jxW5rM4dW
 vBRyXC0C2KuQ32+74bzEIGN5IWrCZ2bU3wr/Pm8K098jLS/XYRSbCYQ2b6BpIvzDZ4eq
 wwGg==
X-Gm-Message-State: AOAM531PAbI5B2il4yNp1qgqZfSsrzXv+Rz+odedi3XYeYq6g/SyCszY
 Nf2WiwAqTzWr9xYGNzZixK8M3Q==
X-Google-Smtp-Source: ABdhPJz/SU0piZAdKNsX5HeYwxbkxz1Gg1UHcNE8g8LDx3kbH2bjdelUhi3dSWlcWovFCH6Q5d1lPA==
X-Received: by 2002:a17:90a:a882:: with SMTP id
 h2mr1015667pjq.180.1599029056297; 
 Tue, 01 Sep 2020 23:44:16 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id i23sm4317434pfo.207.2020.09.01.23.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 23:44:15 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v7 0/2]dd support for Tianma nt36672a video mode panel
Date: Wed,  2 Sep 2020 12:14:05 +0530
Message-Id: <20200902064407.30712-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.28.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Poco F1 phones from Xiaomi have a FHD+ video mode panel based on the
Novatek NT36672A display controller; Add support for the same.

Most of the panel data is taken from downstream panel dts, and is converted to
drm-panel based driver by me.

It has been validated with v5.9-rc1 based drm-misc-next on Poco F1 phone; my tree with other
dependent patches is here [1]

[1]: https://git.linaro.org/people/sumit.semwal/linux-dev.git/log/?h=dev/poco-panel-upstreaming

---
v2: In dt-binding, removed ports node, making port@0 directly under panel@0 node.
     Also updated the panel_on delay to a safer 200ms as needed for latest Android.
v3: Replaced port@0 with just port in panel@0 node.
v4: Since "0425662fdf05: drm: Nuke mode->vrefresh", we have to calculate
     vrefresh on demand. Update for it.
v5: Fixed review comments from Sam:
      - rebased on top of drm-misc-next
           remove return of drm_panel_add()
           remove drm_panel_detach()
      - renamed the panel driver file to reflect that this is a novatek
           nt36672a display driver and not only for tianma panels.
           Adjusted some internal names also to reflect the same.
      - corrected changelog to add info about the generic Novatek DSI IC
      - corrected compatible string accordingly
      - removed pinctrl
      - used drm_panel* API for prepare/unprepare/disable/remove
v6: Fixed few review comments on v5 from Sam:
      - add dev_err_probe() support
      - move DRM_* error printing to dev_err()
      - removed a few unnecessary bits
v7: Fixed review comments on v6 from Bjorn:
      - Reworked the send_mipi_commands functionality
      - removed regulator disable_loads; moved active_load setting to probe
        time
      - made function names and struct less generic
      - updated the reset_gpio working to active_low
      - update MAINTAINERS for file name changes

Sumit Semwal (2):
  dt-bindings: display: panel: Add bindings for Novatek nt36672a
  drm: panel: Add novatek nt36672a panel driver

 .../display/panel/novatek,nt36672a.yaml       |  87 +++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 711 ++++++++++++++++++
 5 files changed, 816 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672a.c

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
