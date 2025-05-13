Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8071AB48CE
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 03:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2E010E2A0;
	Tue, 13 May 2025 01:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="qcUMTVag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD9610E2A0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 01:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1747099344;
 bh=sx0QPXnSaLIf4F34i9zHng6KtwZzILwK0rjOsdgpCTc=;
 h=From:To:Subject:Date:Message-Id;
 b=qcUMTVagUdhYHjTWlumiYxxFtNcIoIf6Ns4zK8hVf1/+QXCcRVJLwUDWPLMdxixro
 u8JsHyVR8xp+f06cuveaNiqN/tKL04PiV3t6bvs1FBWt/UE5xDKjbdCMamqkX3BllP
 HzZe+moXEGBoXSzb9oy8aGnQotEafGKrcwSXtOxc=
X-QQ-mid: zesmtpgz8t1747099209t919a02de
X-QQ-Originating-IP: 5vhkHeA2dWXXDt212fbrUzKzkNBcuE37BFyAXXTQglI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 13 May 2025 09:20:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14605522553798699493
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Convert Rockchip CDN DP binding to yaml
Date: Tue, 13 May 2025 09:19:02 +0800
Message-Id: <20250513011904.102-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: ODcDgdcDagQKhJLssho9/hGvr6zYLDtK+lPPvz4OVRU0gy6zvTtU12rY
 l1i4zcHaKtcIZGoj4CjmubHAlPZyrT5W/UBtpvvF3/46DV9bBspmiy0wFsDNWh6qhQTEGU3
 8IF81IyReXuQIOFzGPnnmPEucy8EJptfYPc1DIPpWD1updD7iI/GuH3+tAqQIaoDzZHC7qN
 iRD7S2iM9/6rWhV3N/WAR/lSJ/+GOZ44OjMl9jVvCr5WmdDk5GXly4hy17I3XVV3z3RfmUU
 k2jAz33t0xy6Trgzk60r+ZIytVYDv+V8/qd74veQ9KtzulpIylHaClWWo5i3phUduC/LI25
 qnGKYOKor6d1MgTTEmMRC+0mDIh0QY4zPGHM116IsXohfgIOgeHHOLQYEyCsc/BrCzbLjKT
 vejDg1yP+a7I9JK8kok8sLEKHaQlYvZd2aVwddjUB/LSTiWpzCgHdZk6PM0i7QQ4vtHjD3C
 iKlQOosu0FtxO4J0gr7kgV6MeZBCjKpdfEOFeiYYF5Jbzy6JTBYyapvkNTeDv86IDl7lHJp
 yPYhNGrFx6gTThWcqrMTG5Bp6aOka1hS8C/qH5UEtD2FgUeAh1BSTJRqHqAEOrb3PMKtxV5
 aCGmAmxUFtf31tnXOPA8okXt0/tB2F6yYZgkffIP2bobN3FPaafORI+VKa2LUb9m8I3NXHg
 rhjbNeP5a5URXonpWPmIZma3NjgrOBR95IHEvtsDoPDRH7T7kxzFLhegskA008rI+EkFEXd
 vPP3P/ZUGFwAkeCAQTRswhFNYW32+2tnh4C4amRR83V6t+qaX8Zn4jJBGgJY5gHJwR9lflu
 M5/L3bY0qNKa13gdiPApNNKXEtiF7aYhGEZ/Ea+vD2zc/ENobdo9BDDUGqHCWPMqNc86o5t
 FVyI0yFaBuKL0ECSy4wit/ezQNsK6/o+hDiszRpY/ogPeH89fWHBTxQLduVvcM7gjFbXcel
 H3PyQleArcJlAIHVz+j9p3Jb8yEn4ysZnScyId9ISSxKAMA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series convert cdn-dp-rockchip.txt to yaml.

PATCH 1 try to improve coding style on the existing rk3399 cdn-dp
node.
PATCH 2 try to convert cdn-dp-rockchip.txt to yaml.

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250509070247.868-1-kernel@airkyi.com/
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250508064304.670-1-kernel@airkyi.com/
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

Chaoyi Chen (2):
  arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
  dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 165 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 174 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

--
2.49.0

