Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EEB81149F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A74310E7AF;
	Wed, 13 Dec 2023 14:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2922810E233
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:30:23 +0000 (UTC)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rDQFd-00008V-35; Wed, 13 Dec 2023 15:30:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: (subset) [PATCH v5 00/16] Add VOP2 support on rk3588
Date: Wed, 13 Dec 2023 15:30:15 +0100
Message-Id: <170247779733.724099.13674557093099995192.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211115547.1784587-1-andyshrk@163.com>
References: <20231211115547.1784587-1-andyshrk@163.com>
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
Cc: devicetree@vger.kernel.org, sebastian.reichel@collabora.com,
 linux-kernel@vger.kernel.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 chris.obbard@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 19:55:47 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> This patch sets aims at enable the VOP2 support on rk3588.
> 
> Main feature of VOP2 on rk3588:
> Four video ports:
> VP0 Max 4096x2160
> VP1 Max 4096x2160
> VP2 Max 4096x2160
> VP3 Max 2048x1080
> 
> [...]

Applied, thanks!

[01/16] drm/rockchip: move output interface related definition to rockchip_drm_drv.h
        commit: 8c8546546f256f834e9c7cab48e5946df340d1a8
[02/16] Revert "drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume"
        commit: 81a06f1d02e588cfa14c5e5953d9dc50b1d404be
[03/16] drm/rockchip: vop2: set half_block_en bit in all mode
        commit: bebad6bd4fbdc448ad3b337ad281b813e68f6f53
[04/16] drm/rockchip: vop2: clear afbc en and transform bit for cluster window at linear mode
        commit: 20529a68307feed00dd3d431d3fff0572616b0f2
[05/16] drm/rockchip: vop2: Add write mask for VP config done
        commit: d1f8face0fc1298c88ef4a0479c3027b46ca2c77
[06/16] drm/rockchip: vop2: Set YUV/RGB overlay mode
        commit: dd49ee4614cfb0b1f627c4353b60cecfe998a374
[07/16] drm/rockchip: vop2: set bg dly and prescan dly at vop2_post_config
        commit: 075a5b3969becb1ebc2f1d4fa1a1fe9163679273
[08/16] drm/rockchip: vop2: rename grf to sys_grf
        commit: c408af1afc4b74ea6df69e0313be97f1f83e981a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
