Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826F94AD805
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BEA10E437;
	Tue,  8 Feb 2022 11:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C6B10E437
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 11:57:55 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHP83-00019N-Im; Tue, 08 Feb 2022 12:57:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: (subset) [PATCH v4 00/27] drm/rockchip: RK356x VOP2 support
Date: Tue,  8 Feb 2022 12:57:49 +0100
Message-Id: <164432145305.107337.14727709648090165451.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220126145549.617165-1-s.hauer@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jan 2022 15:55:22 +0100, Sascha Hauer wrote:
> This is v4 of adding RK356x VOP2 support. Due to popular demand I added
> a changelog to each patch, at least starting with changes to v3, I
> didn't care to add the older changes as well. I hopefully integrated all
> feedback I received to v3. Additionally I added some patches to the HDMI
> driver to support resolutions up to 4k@60Hz. The patches are mostly
> taken from the downstream kernel. Some have been send to public lists,
> but were never applied upstream for reasons I do not know. The patches
> are a bit more intrusive than needed for my case, but are present in the
> downstream kernel for a long time, so I decided just to take them
> instead of stripping them down to my needs. With these patches I
> successfully used the driver with 4k@30Hz. 4k@60Hz doesn't work for me,
> I hope this is due to my low quality cable.
> 
> [...]

Applied, thanks!

[11/27] clk: rockchip: rk3568: Add more PLL rates
        commit: 842f4cb7263953020f4e2f2f0005fc3e6fc56144
[24/27] clk: rk3568: drop CLK_SET_RATE_PARENT from dclk_vop*
        commit: ff3187eabb5ce478d15b6ed62eb286756adefac3
[25/27] clk: rk3568: Add CLK_SET_RATE_PARENT to the HDMI reference clock
        commit: 6e69052f01d9131388cfcfaee929120118a267f4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
