Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC234C612C3
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 11:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED8A10E138;
	Sun, 16 Nov 2025 10:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aawreOUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3158D10E13E
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 10:52:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 598EB60195;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05B97C4CEFB;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763290345;
 bh=OgNY0TEu2bd8MQFRjXHDBVM6Zf/pc0Mf/wDhXncFk3Y=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=aawreOUeyzM7eKFoQun7b1q9C3ld0LkwIxvAbQPNDT3i/vp0occ//6ywDyqm4/vUB
 ChB8SXHzCJZvw+X8DmkMpRgS60SSNo/9owoACmVdjaFQlT3P4qzj2UL4/D9sv5QBPv
 OL2um0HwD1Ku5ZxPD9b0pyGWNjYnuJhy/pu6VKsi1Hdr6n6Dh8TyY/Bssvxts6VfvL
 Pg3O2IeBQ8fFevmhVnp5kD5/9/VQIFKkvdmJeUoKLftR9neXWTzTCR7wFJu/MFoGsb
 F2qq6thKZ07TF0RxGYtfW05Qb8h2EtRhpqZMuTQsf4RGdtoK/t92OceSLyRugMoJgD
 4R5rLnG8lMy7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F04F7CEBF8D;
 Sun, 16 Nov 2025 10:52:24 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v2 0/6] arm64: dts: qcom: x1e80100-vivobook-s15: add more
 missing features
Date: Sun, 16 Nov 2025 11:52:05 +0100
Message-Id: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWsGWkC/1WP3YqDMBCFX0VyvSn50TSRZel7LKXEzKQGqnETl
 S7Fd99or/byDMx3vvMiGVPATNrqRRKuIYc4liA+KuJ6O96RBiiZCCYapnhNbV7ybcmdu8FEmWD
 Silo4ZTQpL1NCH54H7vv6zgl/lkKd30cyYM72oLbV5w7ljEs6xyk4+uSoGWeM9jAEuirKqLTGa
 X8u1aAujzDaFE8x3b/2ss5mpC4OQ5jbyugOdMeVxeaM2ovGmQZqo7wDlOABtBASak52rT7kOab
 fY/TKD69Dpbj837fy4mA81NgZIxvUlz7Ogw2PU+kl123b/gBJHp0pQQEAAA==
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
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763290343; l=1859;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=OgNY0TEu2bd8MQFRjXHDBVM6Zf/pc0Mf/wDhXncFk3Y=;
 b=aVNV0zq9yDJOdukxpIrRcYXhBFzEz0xnrtAB5fTCu5jAkv1ohHWcjSBhY4HwMA/Zkw4exH9e3
 rvF41rFguQnACBrRSLvN6eW5VTgIrknj4VYyUQaKukDrdO2FXtN/YgQ
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
Changes in v2:
- Fix the place of the rtmr regs to maintain alphabetical order
- Link to v1: https://lore.kernel.org/r/20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com

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


