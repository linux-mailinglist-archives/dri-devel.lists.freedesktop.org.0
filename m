Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD06BE0A35
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 22:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AC210E279;
	Wed, 15 Oct 2025 20:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="Yfz7vK+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F5210E279
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=fLl6q1Y+72vHxOIMF4slDKrUf5187PWqHxWI44dG6yE=; b=Yfz7vK+9g3WW7BmyFBFji3dkMU
 UevXDzFQ4ydupk++uQA9CA0Kni3han+FwzAvwR1aU2BFfJ6pKsTFz8BXw/B4dY28bnusWTOcilWIq
 c5tT3UCH41N0TqRuXgZYdT1jnvonWs1mYI7vkq0kQ53SMjy0hakUfxwHDXc6KMNHe2sdPT8guKzGV
 SLDjaMJm2Ce7EM6fEw9FapvU2XaIlLVoyFSK+kWCiYyyJ1aWdU2lTKwtizn8jxC/H2TXSuQkufMLK
 JS0q3ff+QkqkfAJCiLHiCrCMGVMhAJ6y5nElRZXCJt86E9KkViyTeu9wmkejJwNgyfRqhE2eDurvE
 8f/4GNWA==;
Received: from i53875a40.versanet.de ([83.135.90.64]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1v98AD-0002OA-JH; Wed, 15 Oct 2025 22:32:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: (subset) [PATCH v4 0/6] Add HDMI CEC support to Rockchip
 RK3588/RK3576 SoCs
Date: Wed, 15 Oct 2025 22:31:51 +0200
Message-ID: <176056029579.2036456.8048983695806935631.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
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


On Wed, 03 Sep 2025 21:50:58 +0300, Cristian Ciocaltea wrote:
> The first patch in the series implements the CEC capability of the
> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
> This is based on the downstream code, but rewritten on top of the CEC
> helpers added recently to the DRM HDMI connector framework.
> 
> The second patch is needed for RK3576 in order to fixup the timer base
> setup according to the actual reference clock rate, which differs
> slightly from RK3588.
> 
> [...]

Applied, thanks!

[1/6] drm/bridge: dw-hdmi-qp: Add CEC support
      commit: e4a2d54a2f1a9c9a1971651832c8f0ad9d3782c4
[2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
      commit: f7a1de0d86221000dc0699a8b48ad3a848e766d9
[3/6] drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
      commit: b6736a4ea3fa68524074a18334f344a34a05bee8
[4/6] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
      commit: 9baa02327adf2b1e919e95af23036102cfd0133f
[5/6] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
      commit: 33ea4d520fbda505e2cfe5b36ebf522de1f3f5e9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
