Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5CA4B6E1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 04:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7621910E34F;
	Mon,  3 Mar 2025 03:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="EGkBSpv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33E8210E065
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 03:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=3Ff1Y
 uoW1w/9iEkrNSlA4ob8xGNWh3OyF4nmQCZ1omc=; b=EGkBSpv7f6+coIQAY/q1e
 4XoVxgIPky8dhGmOtlHM2VDzMXPhlDFfi1OqdWdusbcv2h398dmodIjVIU5ot5QN
 tYu/RVhyh+l0EGLRYW3oLINZdSxu8ef+ZfkcIKLyU+XAdRsprgBT0lidP01d6dqP
 tWY/z0xGiX2VUV2P7twm7E=
Received: from ProDesk.. (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgC3Oc2lJcVnaJliJg--.43523S2;
 Mon, 03 Mar 2025 11:44:41 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v16 0/7] VOP Support for rk3576
Date: Mon,  3 Mar 2025 11:44:14 +0800
Message-ID: <20250303034436.192400-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgC3Oc2lJcVnaJliJg--.43523S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry7uFyftrWxGryUJryDGFg_yoWrCFW8pa
 ykG3s8XrWkKr1jqan7tw1xCr1SqanxJr13Cr93K3W3Ja1DKF1UKrWS9F1Ykr9xGr12vrWj
 9F4Fy3W3K3W2vF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlfOcUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hMFXmfFIit1YgAAsm
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

From: Andy Yan <andy.yan@rock-chips.com>

Here is the v16
Patches that have already been merged in drm-misc-next are dropped.

I test it with a 1080P/4K HDMI output with modetest and weston
output.

If there are some one want to have a try, I have a tree based on
Linux 6.14-rc1 here[0]

[0]https://github.com/andyshrk/linux/tree/rk3576-vop2-upstream-v16

Thanks.

Changes in v16:
- Link to v15: https://lore.kernel.org/linux-rockchip/20250218112744.34433-1-andyshrk@163.com/
- Rebase on drm-misc-next
- Switch to dev_err_probe
- Remove redundant empty line

Changes in v15:
- Link to v14: https://lore.kernel.org/linux-rockchip/20250212093530.52961-1-andyshrk@163.com/
- Remove AFBC/AFBCD prefix of TRANSFORM_OFFSET register
- Remove redundant blank line before function vop2_lock
- Fix nr_regs arguments for smart windows register.

Changes in v14:
- Set maxItems constraint of clocks for rk3588 to 9 as a recently
  merged patch added two optional clocks[0]:
  [0]https://patchwork.freedesktop.org/patch/msgid/20250204-vop2-hdmi0-disp-modes-v3-1-d71c6a196e58@collabora.com

Changes in v13:
- Add maxItems constraint for clocks
- Remove constraint for interrupts in allOf block, as the current
  maxItems is already 1.
- typo fix
- Explain the function of this property.
- Use maxItems constraint for clocks in allOf block

Changes in v12:
- Only change the description method for existing SoC.
- Split from patch 10/13
- Split from patch 10/13

Changes in v11:
- Remove redundant min/maxItems constraint
- Remove redundant min/maxItems constraint

Changes in v10:
- Move interrupt-names back to top level
- Add constraint of interrupts for all platform
- Add constraint for all grf phandles
- Reorder some properties
- Move interrupt-names back to top level
- Add constraint of interrupts for all platform
- Add constraint for all grf phandles
- Reorder some properties

Changes in v9:
- Drop 'vop-' prefix of interrupt-names.
- Add blank line between DT properties
- Remove list interrupt-names in top level
- Drop 'vop-' prefix of interrupt-names.
- Add blank line between DT properties
- Remove list interrupt-names in top level
- Drop 'vop-' prefix of interrupt-names.

Changes in v8:
- Fix dt_binding_check errors
- ordered by soc name
- Link to the previous version:
  https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u
- Fix dt_binding_check errors
- ordered by soc name
- Link to the previous version:
  https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u

Changes in v6:
-  More specific explanation about the AXI_BUS_ID register bit of
   cluster window.

Changes in v5:
- Add axi id configuration
- Remove the non-existent CBCR scale register.

Changes in v4:
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.

Changes in v3:
- Add comments for why we should treat rk3566 with special care.
- ordered by soc name
- Add description for newly added interrupt
- ordered by soc name
- Add description for newly added interrupt
- Share the alpha setup function with rk3568
- recoder the code block by soc

Changes in v2:
- Add dt bindings
- Add dt bindings
- Add platform specific callback

Andy Yan (7):
  drm/rockchip: vop2: Register the primary plane and overlay plane
    separately
  drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
  drm/rockchip: vop2: Add uv swap for cluster window
  dt-bindings: display: vop2: describe constraint SoC by SoC
  dt-bindings: display: vop2: Add missing rockchip,grf property for
    rk3566/8
  dt-bindings: display: vop2: Add rk3576 support
  drm/rockchip: vop2: Add support for rk3576

 .../display/rockchip/rockchip-vop2.yaml       |  99 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 259 +++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  88 ++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 954 ++++++++++++++++--
 4 files changed, 1223 insertions(+), 177 deletions(-)

-- 
2.34.1

