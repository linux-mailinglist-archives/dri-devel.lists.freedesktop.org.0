Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E7BD9515
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB09010E5DC;
	Tue, 14 Oct 2025 12:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="k8DUbYZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC2B10E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=KrD15lH7IUb1YniDYdLmkUnzg/+PCDE4bFnXHniYJUY=; b=k8DUbYZQER5zJacQEJZcChExiJ
 vhPUeZ/Zv2fV5lYzYR7IW+20M6hSqq83JjRMMrdU8xD2M7uo6GSDBwFtbwR7dPyOWBgEcLQOZPe8q
 VG9rnq397wQkFIaTpDA1CXF85u+HpmIEtiszRnJYuclchiLDT8Lh98oeSBlFQcPIn3dD/uDHMk9qk
 uGk3Z7s3dSb7PukDAhu23N6xrSiXJwONj2QVhnfx7FhvFt12Og4RjcwMNFEMBLa7BEDFAuBWN1xih
 IUXpLgrinQP7f85hy+nghNIpbdYXB6I9665GL2NiMUSfj7VMtR8kEFbHrPfQadCVbwmLfPraZH/nL
 7R0uH3CQ==;
Received: from i53875b75.versanet.de ([83.135.91.117]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1v8e3t-0007Hl-3y; Tue, 14 Oct 2025 14:23:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andy.yan@rock-chips.com, hjc@rock-chips.com,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3] drm/rockchip: analogix_dp: Apply
 devm_clk_get_optional() for &rockchip_dp_device.grfclk
Date: Tue, 14 Oct 2025 14:23:19 +0200
Message-ID: <176044455976.1550590.2860570275886738546.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250928103734.4007257-1-damon.ding@rock-chips.com>
References: <20250928103734.4007257-1-damon.ding@rock-chips.com>
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


On Sun, 28 Sep 2025 18:37:34 +0800, Damon Ding wrote:
> The "grf" clock is optional for Rockchip eDP controller(RK3399 needs
> while RK3288 and RK3588 do not).
> 
> It can make the code more concise to use devm_clk_get_optional()
> instead of devm_clk_get() with extra checks.
> 
> In addtion, DRM_DEV_ERROR() is replaced by dev_err_probe().
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: analogix_dp: Apply devm_clk_get_optional() for &rockchip_dp_device.grfclk
      commit: 0dc25a11b8936bb752d6217f9db9857641c3d266

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
