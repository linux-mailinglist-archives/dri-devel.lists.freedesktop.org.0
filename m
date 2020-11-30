Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9E2C7C8D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532586E415;
	Mon, 30 Nov 2020 01:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD63C6E415
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 01:52:09 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1kjYME-0007OY-Vw; Mon, 30 Nov 2020 02:52:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: (subset) [PATCH v5 0/7] Enable rk3066a HDMI sound
Date: Mon, 30 Nov 2020 02:51:58 +0100
Message-Id: <160670107988.1055391.2625216014157320355.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118135822.9582-1-jbx6244@gmail.com>
References: <20201118135822.9582-1-jbx6244@gmail.com>
MIME-Version: 1.0
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
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, lgirdwood@gmail.com, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 sboyd@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Nov 2020 14:58:15 +0100, Johan Jonker wrote:
> First fix some legacy things in clk-rk3188.c that was never updated,
> because probably nobody used rk3066a I2S before in the mainline kernel.
> Update the rk3066a HDMI documents with a #sound-dai-cells property.
> Include the code for sound in the HDMI driver.
> Add a simple-sound-card compatible node to rk3066a.dtsi,
> because I2S0 and HDMI TX are connected internally.
> And as last enable rk3066a HDMI sound in the rk3066a-mk808.dts file.
> 
> [...]

Applied, thanks!

[1/7] clk: rockchip: add CLK_SET_RATE_PARENT to sclk for rk3066a i2s and uart clocks
      commit: 5868491e1257786628fdd2457dfb77609f49f91d
[2/7] clk: rockchip: fix i2s gate bits on rk3066 and rk3188
      commit: caa2fd752ecb80faf7a2e1cdadc737187934675e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
