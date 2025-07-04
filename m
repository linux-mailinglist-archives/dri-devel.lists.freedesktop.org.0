Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F57AF955C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 16:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A56588EA1;
	Fri,  4 Jul 2025 14:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RuvPT1Z3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D275288EA1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751639011;
 bh=ue3704ExvIRhPugRmJAEoUTNWcIk9NV2FgJK3CY4rxU=;
 h=From:Subject:Date:To:Cc:From;
 b=RuvPT1Z3nR1nAKyEIgczNL1PLkYjDSzT1PUnSRnSSjxTEAmEsjc+nwJMGmbm2k24X
 R/6l/i3a4qYkL4q+cuC65REWLNnGW773kSx+OLN58vr+Ws33tYw5xntruVs41OwZXC
 eSkMxY5/ssh72sEkQ8mJU6YuNmL1si6vRUxH1azQXFWSm2CCI2yRjb/GAhBECZHWMF
 Ujts/SLIpENyXlXOvEwH/4GT5IBHuy1Af+0Lvxl1npOC7AJbBGuIsbr2sJ6a/HXz9v
 LRFG1gsZ+S/RquWhM2zznKT11GGMEa3ZDYlJdldepkwg95oxBrThHyAPQ51sdv25Wt
 t4tkfcJWr1BRg==
Received: from localhost (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 59E0717E07FF;
 Fri,  4 Jul 2025 16:23:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/5] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Date: Fri, 04 Jul 2025 17:23:21 +0300
Message-Id: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANnjZ2gC/x2MQQqAIBAAvyJ7TjBNkr4SHUTXXCILhQjEvycd5
 jCHmQoFM2GBhVXI+FChK3UZBwYu2rQjJ98dpJBazELxfChtDI/+JO7QdawJWiofJgO9ujMGev/
 jurX2AX9RG4RhAAAA
X-Change-ID: 20250703-rk3588-hdmi-cec-cea8f523df48
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>, 
 Derek Foreman <derek.foreman@collabora.com>
X-Mailer: b4 0.14.2
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

The first two patches in the series implement the CEC capability of the
Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.

This is based on the downstream code, but rewritten on top of the CEC
helpers added recently to the DRM HDMI connector framework.

The next two patches are needed for RK3576 in order to fixup the timer
base setup according to the actual reference clock rate, which differs
slightly from RK3588.

Please note the CEC helpers are currently affected by a resource
deallocation issue which may crash the kernel and freeze the system
under certain test conditions.  I've already submitted a patch [1] that
seems to correct the problem.

[1] https://lore.kernel.org/all/20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (5):
      drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
      drm/bridge: dw-hdmi-qp: Add CEC support
      drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
      drm/bridge: dw-hdmi-qp: Fixup timer base setup
      arm64: defconfig: Enable DW HDMI QP CEC support

 arch/arm64/configs/defconfig                   |   1 +
 drivers/gpu/drm/bridge/synopsys/Kconfig        |   8 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 231 ++++++++++++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h   |  14 ++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  17 +-
 include/drm/bridge/dw_hdmi_qp.h                |   2 +
 6 files changed, 269 insertions(+), 4 deletions(-)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250703-rk3588-hdmi-cec-cea8f523df48

