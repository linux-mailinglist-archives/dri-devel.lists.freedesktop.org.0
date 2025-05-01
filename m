Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E500BAA5D8E
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 13:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2542410E24E;
	Thu,  1 May 2025 11:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="1caFzCaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1F810E24E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=rDixLVJkJSr18pzCi3I0mc9yi7XCZ3dvASfzpKmBjGA=; b=1caFzCaEIheOlZdhkSdrPr/m/L
 dOyj2gNULahSxTBEWMVYwOnUOlZhUY7mH4bFy6Maw4wC+VvIBvKFYdes6SDWkgM1OgzKYDs9GfGpM
 O4IDJ2lJAWd+I8qU0gXouPgNw36xGfPHAC6XEFyvMhFZeHu0aO14gD0GyhrmiIeYh74kemsNT1Ia/
 0tZz8In13dEW5at2YezKMRL2b//83IBEYlMUyqHRgTXSQLJXzoahcKIstDAfn8FZYlh2f/nkTyCYr
 78oqLz7jpYWpAh8GzMt8zgToj/idx5JjenvQQbCfEKlS/ZI39q2kVmY0GhKb8r7VwP1w2kxvq4V6q
 s99JoitA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uARhj-000890-IR; Thu, 01 May 2025 13:03:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Damon Ding <damon.ding@rock-chips.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: add CONFIG_OF dependency
Date: Thu,  1 May 2025 13:03:44 +0200
Message-ID: <174609741908.389921.4591931319484146397.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250423164422.2793634-1-arnd@kernel.org>
References: <20250423164422.2793634-1-arnd@kernel.org>
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


On Wed, 23 Apr 2025 18:44:16 +0200, Arnd Bergmann wrote:
> DRM_DISPLAY_DP_AUX_BUS cannot be selected when CONFIG_OF is disabled:
> 
> WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>   Selected by [y]:
>   - DRM_ROCKCHIP [=y] && HAS_IOMEM [=y] && DRM [=y] && ROCKCHIP_IOMMU [=y] && ROCKCHIP_ANALOGIX_DP [=y]
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: add CONFIG_OF dependency
      commit: 4f1a965d592a0ca7d4ee2125f54d19ba8292295a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
