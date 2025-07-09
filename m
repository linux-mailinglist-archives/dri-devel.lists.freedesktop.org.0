Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A3AFF48D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 00:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5DF10E0E5;
	Wed,  9 Jul 2025 22:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HBfvFcaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB5610E0E5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 22:21:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0405A61139;
 Wed,  9 Jul 2025 22:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A46C2C4CEEF;
 Wed,  9 Jul 2025 22:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752099709;
 bh=8Py4CsLgnmpWgZRh1uEJmzkqgvbjtzPIElp16HtIFTs=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=HBfvFcaZ+8jcr+v7imsDJsg32eBayfg4OcN1N35Rb/2WdL3QWZ61xxmERhRqq4YoT
 zb45D1+W93gMKq0V862RxNUQXNwUotFEI3l/EokenOgRh1uklRlMJ/1gJV2z0OsbMW
 uQup/ezaDSDf10wOudk9RfnNP+D8xaueV+SjJ3imfb9A+FlTv+MjGCZmLACbSbyRTV
 VAhBh85qPsdfc/l4ZfBTW9Xis31W+f3fuwtCfmObZdhx5CmZy6ceg61B4TXBNG7wF1
 4NcRiWGyllrd/XjplJu4FD7gKIZYjuJmjRMCZyx85o+0IOfpTk1CU/5pLbCbqZdHfu
 gwc82rCxwFHig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 912FFC83F10;
 Wed,  9 Jul 2025 22:21:49 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] Bindings and DTS for Apple SoC GPUs
Date: Thu, 10 Jul 2025 00:21:43 +0200
Message-Id: <20250710-sgx-dt-v3-0-299bb3a65109@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHfrbmgC/02MQQqDMBBFryKzbkomaVS66j1KF0lMdKBqSSRYx
 Ls3WhBhNm/47y0QXSAX4V4sEFyiSOOQQV4KsJ0eWseoyQyCC8WVRBbbmTUTu2k0+aQR3EMef4L
 zNO+h5ytzR3Eaw3fvJty+/0SJRyIh46zSiF7WtbIlf7S9pvfVjj1siSTOmjw0kTVvhKkatNL76
 qyt6/oD8URQgdMAAAA=
X-Change-ID: 20250531-sgx-dt-4a1ba1b3b20f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752099708; l=2111;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=8Py4CsLgnmpWgZRh1uEJmzkqgvbjtzPIElp16HtIFTs=;
 b=foDGSjtL1i/eBdaakPKFBpNpRz+4dnUGdroXFiKgmtpeTraJsuKgTFcqT14/2KXYfD8btZ29F
 VgtSzPatqGjCLkIaADJVX81nV5WUK5aJBdeLBqmWQ1JDECJJphLr7mB
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi.

This patch series adds the DT bindings and tree entries for the GPU
present in Apple M-series SoCs. The driver itself is in Rust and
upstream is currently missing several prerequisite bindings, so will
be sent later.

The kernel and m1n1 (bootloader) that are using those bindings are
available at the following branches:
Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
m1n1: https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v3:
- Just adding trailers, effectively a resend
- Link to v2: https://lore.kernel.org/r/20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com

Changes in v2:
- s/firmware-compat/firmware-abi/
- drop the agx-g13x compatible
- rework reserved regions
- Improved memory region and register descriptions
- Link to v1: https://lore.kernel.org/r/20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com

---
Sasha Finkelstein (2):
      dt-bindings: gpu: Add Apple SoC GPU
      arm64: dts: Add Apple SoC GPU

 Documentation/devicetree/bindings/gpu/apple,agx.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                          |  1 +
 arch/arm64/boot/dts/apple/t6000.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6001.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6002.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi          | 34 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi            | 28 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 293 insertions(+)
---
base-commit: aef17cb3d3c43854002956f24c24ec8e1a0e3546
change-id: 20250531-sgx-dt-4a1ba1b3b20f

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>


