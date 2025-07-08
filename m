Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17FAFD577
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 19:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2693D10E027;
	Tue,  8 Jul 2025 17:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="K+fXiJeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB86610E027
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=97sopF4YX8DzwzP4nGmiVk6JsICCBAIUEmsCTEqAsyE=; b=K+fXiJegfbH6kmmryc/nvRZ32h
 2f5QyP6HwtLFc5dTntmsHLxgJLrij4Qt4/gJ/3TroxssEYXqNNbn06FkJjexbGh5hTClQhsJjEHSx
 2ycwocXh5XQENybGOw2UcGAtgOxI5apVYQR86a4wjzR9bMiS8iNSDqmoP5Ud0tK2yoCpgaKCMvt9S
 DfbyC9t5pwrjTgZS/sRPH7Ik9oIpdl9hSq5i/SM7Cke0/01WbpoE9FLVPzVabI6loaCsUA4lnUX9y
 m7JmHwKzhC5yDs6YjNMFZqB3m95P55K9W5zSGKuFDe12adgGGfZDGWVgWatRE9d3CDC05BDubJW4p
 KcOTePnQ==;
Received: from i53875a8d.versanet.de ([83.135.90.141]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uZCE5-0005cC-HY; Tue, 08 Jul 2025 19:35:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com,
	Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 neil.armstrong@linaro.org, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v5 00/10] Convert inno hdmi to drm bridge
Date: Tue,  8 Jul 2025 19:35:13 +0200
Message-ID: <175199006060.1731917.17930590258834910843.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
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


On Mon, 12 May 2025 20:46:01 +0800, Andy Yan wrote:
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Patches that have already been merged in drm-misc-next are dropped.
> 
> PATCH 1~8 are some cleanup and refactor.
> PATCH 9 converts the curren driver to drm bridge mode.
> PATCH 10 add Add entry in MAINTAINERS file.
> 
> [...]

Applied, thanks!

[01/10] drm/rockchip: inno_hdmi: Merge register definition to c file
        commit: 9c3111df6a681f7b0057f05e7211a98d240237eb
[02/10] drm/rockchip: inno_hdmi: Refactor register macros to make checkpatch happy
        commit: 372a927f93fe0477dd1a5f15f11888391f8ef33f
[03/10] drm/rockchip: inno_hdmi: Remove unnecessary parentheses to make checkpatch happy
        commit: 7431c5462c7f20b7f111c9957a007b8de5b8a76a
[04/10] drm/rockchip: inno_hdmi: Rename function inno_hdmi_reset to inno_hdmi_init_hw
        commit: 55137487bdee89189873e437452a077bb591f33a
[05/10] drm/rockchip: inno_hdmi: Move ddc/i2c configuration and HOTPLUG unmute to inno_hdmi_init_hw
        commit: 52ac749b4505339a321b9695fe9d2977294c98da
[06/10] drm/rockchip: inno_hdmi: Use sleep_range instead of udelay
        commit: 1749267beee76bfd8108f5071afb870903c83dab
[07/10] drm/rockchip: inno_hdmi: switch i2c registration to devm functions
        commit: 078bb17c7bbfe5bb119943fb7a9ef4f9a8c8c543
[08/10] drm/rockchip: inno_hdmi: Simpify clk get/enable by devm_clk_get_enabled api
        commit: 6a1b9229ecf11f409edd9392c96bded1672ea5f3


I've picked up the rockchip-specific cleanup, but the actual bridge-
conversion needs additional eyes.

Also comparing the recipients of this thread, I think your missing some
bridge maintainers/reviewers.

scripts/get_maintainer.pl drivers/gpu/drm/bridge lists:

Andrzej Hajda <andrzej.hajda@intel.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Robert Foss <rfoss@kernel.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)

and not all of them are in the recipient list.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
