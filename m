Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD0A96810
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 13:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEDC10E1D6;
	Tue, 22 Apr 2025 11:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="RPdD3O+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654EA10E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 11:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=eduKEqp989VtzN3pDbGRSZ0xqVFdb4NEGh4iT4GHVrg=; b=RPdD3O+sR+4EnrNmrEOnEEmUMV
 /yKMQq0LSvT22Ew3S6R3GbyVqT7cYb3nD8Rnf3j/IiK2D1FvASRWsycgcxRiLJuacnp/t1w+kLr1Y
 GCSl/B5pvkyVH/G05Rf9xQdznVPNfqOZ38q+6/CoNxo3CzRs6Lck/RNGlVJx6abaliWuDxRoJATXb
 wDRoF027reZTKxbCGVsTHqttErf+jH8qS9LeyRN94b/3zPEKNMPr96CjCndhE/M9c4MrnY62rTtZd
 yy2vumGQ+j+wCNQGIVeTfKKkMgrWEMKl166XPhV6EgEfRr7HC4sBiDsexAT3898T9/y66GXZYm+rq
 RwpZglGQ==;
Received: from i53875b95.versanet.de ([83.135.91.149]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1u7C3H-0002kK-AM; Tue, 22 Apr 2025 13:44:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, andy.yan@rock-chips.com,
 hjc@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dianders@chromium.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 boris.brezillon@collabora.com, l.stach@pengutronix.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v8 00/13] Add eDP support for RK3588
Date: Tue, 22 Apr 2025 13:44:23 +0200
Message-ID: <174532226019.263993.6647221833577832330.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310104114.2608063-1-damon.ding@rock-chips.com>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Mon, 10 Mar 2025 18:41:01 +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=936932
> 
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> on RK3399 sapphire excavator board.
> 
> [...]

Applied, thanks!

[12/13] arm64: dts: rockchip: Add eDP0 node for RK3588
        commit: dc79d3d5e7c7b2c177b4a4ca84d20d271fb68da0
[13/13] arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
        commit: 53862b991e79d8816d5ff54b5954d6a0fe1dcd4c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
