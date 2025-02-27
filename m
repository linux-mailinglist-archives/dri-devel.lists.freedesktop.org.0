Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF9A47ADB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 11:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526E110EA90;
	Thu, 27 Feb 2025 10:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="mZCQsiU8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7849810EA90
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gCe2jlYqgmYdsKTqxHV+zNuMNWku2qaKvILRO2g7d1k=; b=mZCQsiU8HZvV7jkLzjo+lal+WH
 LsfjYGypihPdUloXEmpXdNrHBkHWx9rYAq4f8TF1eTVSj7VY4Q1KjO+X+Z2EkHhmgZcP0UaPQt9N1
 v5++30LaFz2OlWbladXzqwhkDsgVmWTNnxK92HabyCIKYJ5eTwwTkeIS/eKmcojIPANyirlFBkJBH
 vc/uGbfRUMyKCSd5BYWHDzqP2ybgkSq6aZvdB+mYX1aw9DSVbpIkWLvLDiDQlCJsF+Z/kjmkQ+iiW
 DyLqTeK0saCCFZJJnm+i2I5BzFRl+yHjRK8cFs76X8UuqWOIjTY9PXmb9aQVKZODZspjqIaBmJvmm
 0d+221uQ==;
Received: from i53875b47.versanet.de ([83.135.91.71]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tnbY8-00008f-2X; Thu, 27 Feb 2025 11:55:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, andy.yan@rock-chips.com,
 hjc@rock-chips.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org,
 dianders@chromium.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com,
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v7 00/15] Add eDP support for RK3588
Date: Thu, 27 Feb 2025 11:55:15 +0100
Message-ID: <174065370895.4124124.17821350735219515790.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250224081325.96724-1-damon.ding@rock-chips.com>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
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


On Mon, 24 Feb 2025 16:13:10 +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=927765
> 
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> on RK3399 sapphire excavator board.
> 
> [...]

Applied, thanks!

[01/15] drm/rockchip: analogix_dp: Use formalized struct definition for grf field
        commit: 2bf9f610494d75cfaf3c8a0cef93135ce83f7254
[02/15] drm/rockchip: analogix_dp: Expand device data to support multiple edp display
        commit: 718b3bb9c0ab87bc90914799e6999bf4b1ecc67b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
