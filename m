Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C9E777B22
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9162A10E54E;
	Thu, 10 Aug 2023 14:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6036710E540
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1691678699; x=1723214699;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xRc7+oLrKLGvmsF4AbFMU4toS0SSVJPBFSx+GMgjtNw=;
 b=PEXHm52xfPNtNUnlkZ2RtYE+EGfh/KAaYOrDEaZQLgS1B0zh16Vw7yM8
 tAlthsc6sVsX672Bp3IId3WzFyVpCXrMFXrWZD+2qwo+FJXu3rZLfSN3C
 qA97sHNtVHYwy+8+3rE+MbcdVEGu18QiFF9CaYxU1saAZ5paBzLrsl6wR
 6Gsj9l/63pJdy6WTauSPkyYBNKEA+RmTekz0kWnwALcipO2b1BblVoVEa
 xKoLDAStmXHmBLkiT6F6I8fBvCBlFLvzdenwYvE+GzB5mRUdpqmrCCLQx
 zl01b9KJtt8dl8zcuw8iHnP1FZ4nylZF58LwjPeBKeSqe4d1dK1ckuXBh A==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684792800"; d="scan'208";a="32396716"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Aug 2023 16:44:57 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EF35A28008D;
 Thu, 10 Aug 2023 16:44:56 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/6] imx6q related DT binding fixes
Date: Thu, 10 Aug 2023 16:44:45 +0200
Message-Id: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

while working on i.MX6Q based board (arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dts)
I noticed several warnings on dtbs_check. The first 5 patches should be pretty
much straight forward.
I'm not 100% sure on the sixth patch, as it might be affected by incorrect
compatible lists. Please refer to the note in that patch.
I'm also no sure whether thse patches warrent a Fixes tag, so I only added that
for patch 3. All of these patches are independent and can be picked up
individually.

Best regards,
Alexander

Alexander Stein (6):
  dt-bindings: trivial-devices: Remove national,lm75
  dt-bindings: imx-thermal: Add #thermal-sensor-cells property
  dt-bindings: display: imx: hdmi: Allow 'reg' and 'interrupts'
  dt-bindings: net: microchip: Allow nvmem-cell usage
  dt-bindings: timer: add imx7d compatible
  dt-bindings: timer: fsl,imxgpt: Add optional osc_per clock

 .../bindings/display/imx/fsl,imx6-hdmi.yaml   |  3 ++
 .../bindings/net/microchip,lan95xx.yaml       |  2 ++
 .../bindings/thermal/imx-thermal.yaml         |  6 ++++
 .../devicetree/bindings/timer/fsl,imxgpt.yaml | 31 ++++++++++++++++++-
 .../devicetree/bindings/trivial-devices.yaml  |  2 --
 5 files changed, 41 insertions(+), 3 deletions(-)

-- 
2.34.1

