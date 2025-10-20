Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50561BEFE9E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E74310E30E;
	Mon, 20 Oct 2025 08:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="DtpxN1Pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCE810E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=pOUvvxU2BJaHxDxHIo4De4OqXEVjTkBaEpIseudvhGs=; b=DtpxN1PlWm09zUHWBVJ/Gg5IPU
 PSGk1BUw4cEaCdaqGuDI8L+X6H1LWC8MhNZcTnLUXKyiRAHisS7294+McAYXLj3+JQjoF7LViXtDk
 BMAwd3d9G9P1RwNIhMFqoFMNE8rNgc2XKoX3VEyhvlFJrG3bqaq6phrvxcZ+FmPHFJXwf9eGQBec+
 vuomOk/nTgNdAV6KYi5UJOvewVTgqnUoVjODjCKgHDEgRxH9mroI0NRSAelfA4KC/pSdubIxi+tAc
 N1FGbLFz6MM7OmJvXfXSeCniDfK7mcrzgXjNNvEBF9aFtnmGL31iEtxJqIOpM2mlxCraK6GO9Wf6G
 TqtmiJew==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vAlCz-00078O-AA; Mon, 20 Oct 2025 10:25:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 4/9] arm64: dts: rockchip: Add power-domain to RK3368 DSI
 controller
Date: Mon, 20 Oct 2025 10:25:03 +0200
Message-ID: <20251020082508.3636511-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The DSI controller is also part of the VIO power-domain and it
definitly needs to be on when accessing it to no cause SError
faults, so add the power-domain property to it.

Fixes: 5023d0cd6183 ("arm64: dts: rockchip: Add DSI for RK3368")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 8f0216203241..5b2cbb3003b6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -896,6 +896,7 @@ mipi_dsi: dsi@ff960000 {
 		clock-names = "pclk";
 		phys = <&dphy>;
 		phy-names = "dphy";
+		power-domains = <&power RK3368_PD_VIO>;
 		resets = <&cru SRST_MIPIDSI0>;
 		reset-names = "apb";
 		rockchip,grf = <&grf>;
-- 
2.47.2

