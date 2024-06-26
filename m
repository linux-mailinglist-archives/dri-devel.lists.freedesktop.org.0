Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA529184B3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D7410E8E2;
	Wed, 26 Jun 2024 14:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kd1Go5Rw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBD610E8E1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:44:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5036761A2D;
 Wed, 26 Jun 2024 14:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0F4C116B1;
 Wed, 26 Jun 2024 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719413089;
 bh=Hd7daRwxk/5b3ynTV/NWquiYpBPUHgnrHUul26N5148=;
 h=From:To:Cc:Subject:Date:From;
 b=kd1Go5RwfdzjsxpX50Q9C9qSQyieHnReXq62iln9jiHWNngprPriaPPiH5p9rFDWv
 myL54IJMQqvbT77+L4meE1KgzHUTKkz+1OxqkhahEmIVYNVVi3HKNBzdIC0mFI0YIb
 hx3qtPIiKXIC55CrGozm9R5ndws8Y8kB6okk4+wHG/saou0S6eQ5PKUmgDze/+aAPm
 s9RzFS4e9B3DqswOaitVgzRkMnvMKyLJzQh+qEl37ax6kNoIag7Hjirk/+/Hfb68Yr
 0Jsuvx2Vn9l2iF4B+ceVjB1vfal7bduYMYh0DWgXB2YMZX07IgRXUtQPai7wayevmy
 fEWivTYdiaJBg==
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>
Subject: [PATCH v2 0/2] drm/panel: initial support for the Ortustech
 COM35H3P70ULC
Date: Wed, 26 Jun 2024 16:44:31 +0200
Message-Id: <20240626144433.3097793-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add initial support for the 480x640 DSI panel from Ortustech. The
panel uses an Ilitek ILI9806E panel driver IC.

v2:
 - use drm_connector_helper_get_modes_fixed(), thanks Dmitry.
 - slight header files cleanup

Michael Walle (2):
  dt-bindings: display: panel: add Ilitek ili9806e panel controller
  drm/panel: add Ilitek ILI9806E panel driver

 .../display/panel/ilitek,ili9806e.yaml        |  63 +++
 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 402 ++++++++++++++++++
 5 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c

-- 
2.39.2

