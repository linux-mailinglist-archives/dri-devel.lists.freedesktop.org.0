Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B727916903
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 15:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42410E162;
	Tue, 25 Jun 2024 13:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o310z5fg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB1610E162
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 13:35:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9F368CE1AD7;
 Tue, 25 Jun 2024 13:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6372AC4AF19;
 Tue, 25 Jun 2024 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719322547;
 bh=MuIgi2rVJpIa0IwYNcsJ7osmJ4rVGwuAMgxuVIPDTxc=;
 h=From:To:Cc:Subject:Date:From;
 b=o310z5fgMZ/huy02LqBGnCv74F06NXRNGJe0S5JP8n/4/TDbwx9tBWtsEBTdRHkh1
 7mf3lUPnU5TX5uTneCPEumPeqG4S3cdB3TeU6p1IXcZ4U1o8MjpdgzwKX63yCN1vgc
 Htl6ioX1pmE+0vWAURLEO/InwvSQbmvC8gh9y7+2aOPCERoUtoPf/HijgekgG6Z37W
 oJQ1VxFosym/F3GaKVEobocMN2GULqo88zlZWftSu4t+zfrqiYqVTY48YqhBGw70Dk
 nTikYvs546KzjeQAcgkxQ0Q/J5MJ7uVb1uZzN2NDjrliyOpdwlzBzd3CMw5V+Ao2Vq
 q+Tamlt74NLPg==
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>
Subject: [PATCH 0/2] drm/panel: initial support for the Ortustech COM35H3P70ULC
Date: Tue, 25 Jun 2024 15:33:15 +0200
Message-Id: <20240625133317.2869038-1-mwalle@kernel.org>
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

Michael Walle (2):
  dt-bindings: display: panel: add Ilitek ili9806e panel controller
  drm/panel: add Ilitek ILI9806E panel driver

 .../display/panel/ilitek,ili9806e.yaml        |  63 +++
 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 413 ++++++++++++++++++
 5 files changed, 491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c

-- 
2.39.2

