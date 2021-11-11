Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D34F44D4E0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 11:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BCF6EA3D;
	Thu, 11 Nov 2021 10:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68566EA3D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 10:15:10 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id c4so5235214pfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 02:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMj6CFqfhL4iOecGVcAiOfse+gmqDDndmoFPIv2jpIs=;
 b=nOgx0jpn0zJXrzZTM8/UjdE+0fAf6Bpmd6X0rUpQ2/AiRP6B1ENJwR8mgqRZxUi75w
 HbwSGe1Hn8JnMgMEeKZtwgS3Kmsy9cxspL7USrDD53lrymvFiuYFf42wkCoVleKavfBN
 zrqk4EU1y+B5f52K2Te2jZ8lGtOK2Tvqg8oyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMj6CFqfhL4iOecGVcAiOfse+gmqDDndmoFPIv2jpIs=;
 b=e071KJ7gZdamuQokxko1snyeB4NFlBlQ/pg33cIFeEKB2ApNps+p68OzoA4hcwMj7a
 GIRzlyKcwd/KrpvJujVCcJLCoyY9iwvOAlb5aN5QTLjlpw4BRUI7wLZGdlzVDPG+HTG3
 pm8/ajvSxxozEdMFq1FYvexq0RTrXfUSZn7dY7WDmYgA1qiX2DvdX3VmdJqsH6ygpQaC
 8o4TQHlP6HYblhg+SsvDcqg5GkgOLH7ABqAvQM4hb7hdV5tDr3MNNj5mA0UTPv0etQrP
 mtTlNQ1V6LPOn/GOaCYiBXTeS5VcMzu2isZ+nyiUptBbbLYqyolb/qsw6gus0mx6teis
 CRNQ==
X-Gm-Message-State: AOAM5327oZNu5M/2VMamQaqgQrfRaIMxLhNYWrjwcDPcCh3kqZ8cCEoW
 xR0FilZMOLAQpY+Qqf7j/PMsHA==
X-Google-Smtp-Source: ABdhPJz3LviSpE9O7f+y4AmkZbN/0ro0kiSAycoWbUT/9NaVP2q6EjXFJGgHdpUcnQvM0P4lqUd3zg==
X-Received: by 2002:a63:1862:: with SMTP id 34mr3890080pgy.239.1636625710112; 
 Thu, 11 Nov 2021 02:15:10 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:3041:135c:4e21:846c])
 by smtp.gmail.com with ESMTPSA id t12sm8035667pjo.44.2021.11.11.02.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:15:09 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Marek Vasut <marex@denx.de>, Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [RFC PATCH v2 0/3] arm64: imx8mm: Add MIPI DSI support
Date: Thu, 11 Nov 2021 15:44:53 +0530
Message-Id: <20211111101456.584061-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series support MIPI DSI on i.MX8MM.

The DSIM bridge still need to work to make it compatible for
exynos drm dsi hardware block.

This series work directly on to of linux-next with recent
dispmix-blk-ctrl changes.

Tested on i.Core MX8M Mini SoM with EDIMM2.2 and CTOUCH2
Carrier boards.

Required changes:
1. DSIM driver
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210704090230.26489-1-jagan@amarulasolutions.com/
2. DPHY change
https://www.spinics.net/lists/devicetree/msg381691.html
3. Bus format fix
https://github.com/openedev/linux/commit/6ca9781ed53ea75e26341dd57250e63794638b20

Complete repo:
https://github.com/openedev/linux/commits/111021-imx8mm-dsim

Any inputs?
Jagan.

Jagan Teki (3):
  arm64: dts: imx8mm: Add eLCDIF node support
  arm64: dts: imx8mm: Add MIPI DSI pipeline
  arm64: dts: imx8mm-icore: Enable LVDS panel for EDIMM2.2

 .../freescale/imx8mm-icore-mx8mm-edimm2.2.dts | 85 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 74 ++++++++++++++++
 2 files changed, 159 insertions(+)

-- 
2.25.1

