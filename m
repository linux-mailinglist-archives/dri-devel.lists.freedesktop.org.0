Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF863ADB7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 17:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7737610E2F4;
	Mon, 28 Nov 2022 16:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [IPv6:2001:690:2100:1::15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA4210E2F1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 16:29:34 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id A5D9C600C80C;
 Mon, 28 Nov 2022 16:29:32 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id J2fqvRtdZJwH; Mon, 28 Nov 2022 16:29:29 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 5415D6008839;
 Mon, 28 Nov 2022 16:29:28 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1669652968;
 bh=db/Y5kLR1fnMZqSfN2ssqMxjqhgoeKL+QD8qUjHVlMI=;
 h=From:To:Cc:Subject:Date;
 b=bUOa+oKYD6vrPO/k34r7G0FCk6Sp4erYL/mG/FnpJbL/i5d4cPIWq4Q0+06zjuwms
 1d4Witoinm+0Yakxzcpv/chUKo3msZqkkh3a+f3KXyLfMIdW8xprTLOyaZc/JY6ZA2
 STP73WQEaFs4SKbOZNFZzSlQlDZg02/oSlkolj4k=
Received: from wslaptop.lan (unknown
 [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 56DFB360073;
 Mon, 28 Nov 2022 16:29:26 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: 
Subject: [PATCH v2 RESEND 0/4] Add JDI LPM102A188A display panel support 
Date: Mon, 28 Nov 2022 16:28:48 +0000
Message-Id: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.38.1
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 arnd@arndb.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

These patches add support for the JDI LPM102A188A display panel,
found in the Google Pixel C.

Patch 1 adds the DT bindings for the panel (omitted in RESEND).

Patch 2 adds a register clear to the Tegra DSI driver, needed for the
panel initialization commands to be properly sent.

Patch 3 adds the panel driver, which is based on the downstream
kernel driver published by Google and developed by Sean Paul.

Patch 4 adds the DT node for the Google Pixel C. 

The first version of this patch series can be found at:
https://lore.kernel.org/all/20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt/

The first submission of v2 can be found at:
https://lore.kernel.org/all/20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt/

Changes in v2:
 - Patch 1: remove touchscreen reset gpio property
 - Patch 2: clear register based on its value rather than a DT property
 - Patch 3: tune backlight delay values
 - Patch 4: add generic node names, remove underscores

Thank you.

Diogo Ivo (4):

  dt-bindings: display: Add bindings for JDI LPM102A188A
  drm/tegra: dsi: Clear enable register if powered by bootloader
  drm/panel: Add driver for JDI LPM102A188A
  arm64: dts: smaug: Add display panel node

 .../display/panel/jdi,lpm102a188a.yaml        |  94 ++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  70 +++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 509 ++++++++++++++++++
 drivers/gpu/drm/tegra/dsi.c                   |   9 +
 6 files changed, 694 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c

-- 
2.38.1

