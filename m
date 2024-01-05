Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4FE825BAE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 21:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210A610E695;
	Fri,  5 Jan 2024 20:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FDA10E695
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 20:37:55 +0000 (UTC)
Received: from i53875a56.versanet.de ([83.135.90.86] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rLqwi-0007ui-8H; Fri, 05 Jan 2024 21:37:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 David Airlie <airlied@gmail.com>, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2] drm/rockchip: vop2: Drop unused if_dclk_rate variable
Date: Fri,  5 Jan 2024 21:37:34 +0100
Message-Id: <170448704129.3462688.7176944458440903061.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105174007.98054-1-cristian.ciocaltea@collabora.com>
References: <20240105174007.98054-1-cristian.ciocaltea@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Jan 2024 19:40:06 +0200, Cristian Ciocaltea wrote:
> Commit 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> introduced a variable which ended up being unused:
> 
> rockchip_drm_vop2.c:1688:23: warning: variable ‘if_dclk_rate’ set but not used [-Wunused-but-set-variable]
> 
> This has been initially used as part of a formula to compute the clock
> dividers, but eventually it has been replaced by static values.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Drop unused if_dclk_rate variable
      commit: 196da3f3f76a46905f7daab29c56974f1aba9a7a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
