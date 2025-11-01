Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE73C27E59
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 13:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605AD10E0BD;
	Sat,  1 Nov 2025 12:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m2Ja8INm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088F410E0BD
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 12:54:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9A02A44320;
 Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5798DC4CEF1;
 Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762001682;
 bh=u8wLUW6Z9fiKj5eOJYtlEh+2BUk0OgRlOVt2xpH117E=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=m2Ja8INmdmWC+X9QiZI/7Ju8nffsDc41U90B44Ib7WcVp6vUo4JqlJjoOl1yKT56E
 7MVzY84TraRsZpgUsoPw6XoRF1fjyeo3GnboQIK+okHNo7n3d8FSVqo2ROoiF5qtiC
 vVOPO8hqGk/oOyQ91JT35BHZDkVzFmJuogMnFXVffC9ugf12XovXvInne/ZWBNA+yN
 HeTmy9FXRi+RheaBoqM1YaSFP7yyTOcS8wi6DDalSRYYVL1BGDuP+IyPsXJiJTZbo7
 9SIFt54sqomIX79v1eu1KCYF5VKHt0pmXePMZBkB8zaD+Pn+CLqbmsSImSi2U2JFd6
 BKF0dZ7BePKOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB1FCCFA00;
 Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH 0/6] arm64: dts: qcom: x1e80100-vivobook-s15: add more
 missing features
Date: Sat, 01 Nov 2025 13:54:11 +0100
Message-Id: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPMCBmkC/yWN24rCMBRFf6Xk2SO5tDEpg/gfg0iac6IB23SSV
 gTx3yfVx7Vhr/VihXKkwvrmxTI9YolpqiB2DfM3N10JIlZmksuOa9GCK2u5rGXwF5yBS66cbKX
 X1rB6mTOF+Pzofs9fzvS3VuvyHdlIpbiPtW9+NqngQsGS5ujhKchwwTnccIzw0MBBOetNONQ06
 tM9Ti6nfcrX4xYbXCHwaRzj0jfWDGgGoR11BzJBdt522FodPJLCgGikVNgKdn6//wG1sxP+9QA
 AAA==
X-Change-ID: 20250614-asus_usbc_dp-0203a242c698
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762001681; l=1678;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=u8wLUW6Z9fiKj5eOJYtlEh+2BUk0OgRlOVt2xpH117E=;
 b=zZCnXRfNh5ObdUMoRA0mRNkebgUnURd3FVRw3ClZhVV36UkJPFZ1zarismFBaXyve+lPr+fvc
 kaeH65WFNenAPU5QkTPWLPNiEoi1BjmzdZOjk+cYd85IxnBzVV8D7Zi
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

There are still many missing features on this machine, add the ps8830
retimers for display over usb-c, the simple bridge/HDMI port and set up
to use IRIS.

Currently IRIS gives a ETIMEDOUT, not sure what that is coming from.

lots of these patches are very strongly based on the work of other
maintainers of these snapdragon machines, like the HDMI part on that of
Neil Armstrong, many thanks to those who laid the baseline for me to
follow.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
Maud Spierings (6):
      dt-bindings: display: bridge: simple: document the Parade PS185HDM DP-to-HDMI bridge
      drm/bridge: simple: add the Parade PS185HDM DP-to-HDMI bridge
      arm64: dts: qcom: x1e80100-vivobook-s15: enable ps8830 retimers
      arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI port
      arm64: dts: qcom: x1e80100-vivobook-s15: add charge limit nvmem
      arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS

 .../bindings/display/bridge/simple-bridge.yaml     |   1 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 402 ++++++++++++++++++++-
 drivers/gpu/drm/bridge/simple-bridge.c             |   5 +
 3 files changed, 400 insertions(+), 8 deletions(-)
---
base-commit: 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
change-id: 20250614-asus_usbc_dp-0203a242c698
prerequisite-message-id: <20251013-topic-x1e80100-hdmi-v6-0-3a9c8f7506d6@linaro.org>
prerequisite-patch-id: 5af0a76cad087e18b0a2f771a78d030f9bf3bd68
prerequisite-patch-id: 5b908c1f0c5a0c52da384a181a75f17c5e2d19b5
prerequisite-patch-id: ed40af8d7e99a3f1bcb33b4c678b5f21b0618612

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>


