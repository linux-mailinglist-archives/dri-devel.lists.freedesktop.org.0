Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32F517A68
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 01:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9F510EDE3;
	Mon,  2 May 2022 23:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2587 seconds by postgrey-1.36 at gabe;
 Mon, 02 May 2022 23:07:20 UTC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A939E10EDE3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 23:07:20 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nleSe-0005bu-O7; Tue, 03 May 2022 00:24:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 inki.dae@samsung.com
Subject: Re: (subset) [PATCH 0/5] Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Tue,  3 May 2022 00:24:02 +0200
Message-Id: <165153020899.255051.7449667943189045907.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421170725.903361-1-jose.exposito89@gmail.com>
References: <20220421170725.903361-1-jose.exposito89@gmail.com>
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
Cc: jernej.skrabec@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 alim.akhtar@samsung.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, samuel@sholland.org, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, wens@csie.org, hjc@rock-chips.com,
 alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 lgirdwood@gmail.com, kyungmin.park@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Apr 2022 19:07:20 +0200, José Expósito wrote:
> After implementing a similar change in the VC4 driver [1], as suggested
> by Laurent in the ToDo list [2], I noticed that a similar pattern is
> used in the Exynos, Rockchip, STI and sun4i drivers.
> 
> This patchset replaces drm_detect_hdmi_monitor() with is_hdmi in the
> mentioned drivers.
> 
> [...]

Applied, thanks!

[2/5] drm/rockchip: inno_hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
      commit: d449222dd533ca83a3a2f88aafe06fdd8d589280
[3/5] drm/rockchip: rk3066_hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
      commit: d2eabdb64474c2101953859601794f1ea08ec1d9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
