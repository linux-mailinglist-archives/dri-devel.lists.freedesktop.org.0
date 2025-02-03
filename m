Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EEEA26130
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596E510E11D;
	Mon,  3 Feb 2025 17:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l3c4ZSy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664CF10E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738603186;
 bh=sX9Hi4YxY4bBH/BFRBxWiGviGy+3yNXN+SWo1wqDHKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l3c4ZSy1N3Z9UfC1XawNz6Ce8IOjFnrMOQiZPHC+WLF40+OdCV2hO5w2/eOMeL+1f
 //dDp1QxxTQLDm+vWRT9HFLwvySzHlcfeFeftbLEn1zAHaFsUcEX0oHBAOlwzqq0qu
 +uLxuzJAlbeB8rH60ZtWc+Q67mk1w+9gW2OMZh4118FeRFZNfy/XSRWwHsbT4CNyV8
 Xn04B1xINICllt9LUFr9AcQ7QmYg4V8wbN0bMXz+O7V6F42WYd1z58OsgugMoJs7bX
 BFwW6DSdwaRPuR+vdWF7VE0vU3RjQkD5GHzlnCjH08kYHcjcw9Vo67HG525OIs3bUF
 Vew/AUe5ZVTFA==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CC2EB17E1511;
 Mon,  3 Feb 2025 18:19:42 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Johan Jonker <jbx6244@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v5 3/3] arm64: dts: rockchip: Enable HDMI0 audio output for
 Rock 5B
Date: Mon,  3 Feb 2025 12:16:33 -0500
Message-ID: <20250203171925.126309-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203171925.126309-1-detlev.casanova@collabora.com>
References: <20250203171925.126309-1-detlev.casanova@collabora.com>
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

HDMI audio is available on the Rock 5B HDMI TX port.
Enable it.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d597112f1d5b8..88ff5d9db2817 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -204,6 +204,10 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &hdmi0 {
 	status = "okay";
 };
@@ -318,6 +322,10 @@ i2s0_8ch_p0_0: endpoint {
 	};
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
 &package_thermal {
 	polling-delay = <1000>;
 
-- 
2.48.1

