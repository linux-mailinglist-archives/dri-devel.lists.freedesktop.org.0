Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113E41308F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 11:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F80B6E91F;
	Tue, 21 Sep 2021 09:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F706E91C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:07:19 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mSbk7-0001Y8-V5; Tue, 21 Sep 2021 11:07:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, daniel@ffwll.ch,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 dianders@chromium.org
Subject: Re: [PATCH v3] drm/rockchip: Update crtc fixup to account for
 fractional clk change
Date: Tue, 21 Sep 2021 11:07:10 +0200
Message-Id: <163221519146.1860329.13773020048933671989.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210916202907.18394-1-macroalpha82@gmail.com>
References: <20210916202907.18394-1-macroalpha82@gmail.com>
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

On Thu, 16 Sep 2021 15:29:07 -0500, Chris Morgan wrote:
> After commit 928f9e268611 ("clk: fractional-divider: Hide
> clk_fractional_divider_ops from wide audience") was merged it appears
> that the DSI panel on my Odroid Go Advance stopped working. Upon closer
> examination of the problem, it looks like it was the fixup in the
> rockchip_drm_vop.c file was causing the issue. The changes made to the
> clk driver appear to change some assumptions made in the fixup.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Update crtc fixup to account for fractional clk change
      commit: e93a3ccf76996df53ff6c2c03626b70bb0b0d55d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
