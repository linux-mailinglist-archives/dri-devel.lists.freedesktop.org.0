Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B8DBF4FAD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3899610E576;
	Tue, 21 Oct 2025 07:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZGmpJuog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EB410E576
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:34:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 486E01A158A;
 Tue, 21 Oct 2025 07:34:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1CC1A606DC;
 Tue, 21 Oct 2025 07:34:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 402C5102F23EB; 
 Tue, 21 Oct 2025 09:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761032067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=k8izWHbKqzUmMmmsOINNCS8K5Jl2Km69X2C2UUxs0cg=;
 b=ZGmpJuogJrl8d9hqJ14Da08yy4HUxuO2dbr85y1EEu7gyS6qJ3TJJasWI7GJ2F/1UG4YlP
 BnNz0nC1iZ7tyS0weufg11hOWdu0WV9Q+APgCPU8zTPd/SmIGvDbPkeAujbLb5QNPud+F5
 fyWh8O3C+Dp7Ic8ZFatjSxxovCCAzSlP/fncP0kHu0Wuxm6B42uAjSdoAlOqGJh2U3ZQsc
 JAALIU/etH8jVqPmB45g5i82QrAz6ktvRSDYHRXsm0i3GA4bujNZvCrH8ANlIAJmgrHgyA
 Da48R0IGjFrYHsxOHyVDir1Ct5dQoEti4CendgvBVrKCbWHrtrEub2RiH3MJ2w==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/3] Add support for the Leadtek LTK028QV25BYL display panel
Date: Tue, 21 Oct 2025 09:34:02 +0200
Message-ID: <20251021073408.195959-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

The Leadtek LTK08QV25BYL is a 2.8" 240x320 DSI display.

This series adds support for this device.

Best regards,
Hervé

Herve Codina (3):
  dt-bindings: display: panel: Add the Leadtek LTK08QV25BYL panel
  drm/panel: Add support for the Leadtek LTK08QV25BYL panel
  MAINTAINERS: Add the Leadtek LTK028QV25BYL panel driver entry

 .../display/panel/leadtek,ltk028qv25byl.yaml  |  55 ++++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-leadtek-ltk028qv25byl.c   | 304 ++++++++++++++++++
 5 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk028qv25byl.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-leadtek-ltk028qv25byl.c

-- 
2.51.0

