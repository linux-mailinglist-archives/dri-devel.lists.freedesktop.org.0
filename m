Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3A89D68BE
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 12:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CCF10E43D;
	Sat, 23 Nov 2024 11:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oviE+CVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8D010E1B6
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 11:06:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 239755C4AC7;
 Sat, 23 Nov 2024 11:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B647C4CECD;
 Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732359974;
 bh=k3s+kIa0CozrUauq1AcjHwaHwwjQ2E8jG+8stGujCCA=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=oviE+CVpuTZXtf5OLx/Jc0YlFoqL1kFGvep4KnFkcqPZVjYiimaYq/AqXMLZIWvll
 lWwLEw7Gc2ecp7Se9bW2uuiiWbYGsBZ1UfMH7WFUwmOadkxQmz9PRowPvpObETm8uZ
 59hI6ogX5+sQCOrnNgMM7CDw2IbdWZuJ43Svkt2uZCGISMbjtMY3OTnOSni593E3e4
 yYk/87ljuD5CIudQWmUXfiK5Rz7TMVYkYPDP93Si2KhYIIlSUQUzeervJSGO2tIwQp
 hZyy9IyX0NIabyoUMc1Liy48nqsk3NgLNseKjQWL0uAaH+BhJROd6+qYphfmRa5v9V
 kaGB0T1WhisAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 70140E6ADF5;
 Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH 0/4] Asus vivobook s15 improvements
Date: Sat, 23 Nov 2024 12:05:50 +0100
Message-Id: <20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA63QWcC/x3MywqAIBBA0V+JWSeovahfiQixsQZ6OhSF9O9Jy
 7O4NwCjJ2RokgAeL2La1giVJmAns44oaIgGLXWulCqF4ZP7w25LPxDvs3mExcK5StdZlkuI3e7
 R0f0/2+59Pxu0/GpjAAAA
X-Change-ID: 20241116-asus_qcom_display-ce5ff7293340
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732359972; l=801;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=k3s+kIa0CozrUauq1AcjHwaHwwjQ2E8jG+8stGujCCA=;
 b=z1bfmanqY+F+p3ytY2hnlRngqnTu7lFNHbAn7lzUqGHYP7BtJcw8ub8fLIDszw/fvWfCho3e1
 FBXlSkGgSnTDom3LJS3emaPssGL7hj1bpn5QqFd+GTa2XJbiTp16ZqD
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improves several parts of the devicetree:
1. The eDP panel bindings
2. Adds a lid switch
3. Adds bluetooth

---
Maud Spierings (4):
      dt-bindings: display: panel: samsung,atna56ac03: Document ATNA56AC03
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

 .../bindings/display/panel/samsung,atna33xc20.yaml |  2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 59 +++++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)
---
base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>


