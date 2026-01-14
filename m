Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9DDD1E38E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 11:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7688E10E5F0;
	Wed, 14 Jan 2026 10:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="UEIBZrdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E47810E5F0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=htkP6Pi1hR5sLWZLIAp5bvw4UNy0AcaV5hG702kfd58=; b=UEIBZrdr1CmlYzAy7kRNlvxawY
 IDzrS4vRHXt+fHD+cx3IXvqcDTN0QW8v068Gi1oA4GrB0WKM0yGvFeNIBKfin62LNUuOuV/wfEgrV
 TqZLFUa5ijcXJN095vLknAdY/vkDShw6gMtQggZW/vjh5pySxNxKEmdiAsdSCIC3JK33N9Kucjuw3
 Wbmvadt9deH+XyMLSRtslWTMYoML1KXeGDgqyIiINIvqsOPY1DX2GV7yt+s48I4yPPcUrXs6pJnn/
 NiITrxMGcg4py/kF41oY4Mqw3WGgyspoJr9LXyoTEGy47TxGmoAGnH+/0y6uZId2gtdqMql0FVY7r
 W8PKwZgg==;
Received: from i53875b96.versanet.de ([83.135.91.150] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vfyS7-002HSK-Vs; Wed, 14 Jan 2026 11:50:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: DRM_ROCKCHIP should depend on ARCH_ROCKCHIP
Date: Wed, 14 Jan 2026 11:50:14 +0100
Message-ID: <176838780308.4067705.6421121345360126054.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <5db192d31cc51f027f107c01c01a353a0569ebf4.1768310045.git.geert+renesas@glider.be>
References: <5db192d31cc51f027f107c01c01a353a0569ebf4.1768310045.git.geert+renesas@glider.be>
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


On Tue, 13 Jan 2026 14:15:01 +0100, Geert Uytterhoeven wrote:
> Rockchip display hardware is only available on Rockchip SoCs.  Hence add
> a dependency on ARCH_ROCKCHIP, to prevent asking the user about this
> driver when configuring a kernel without Rockchip platform support.
> 
> Before, this dependency was implicit through a hard dependency on
> ROCKCHIP_IOMMU.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: DRM_ROCKCHIP should depend on ARCH_ROCKCHIP
      commit: cd98e73492102a2ff54923f08c37a2780979ac4c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
