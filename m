Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B31B4B2D87
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941B710EAFB;
	Fri, 11 Feb 2022 19:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDDB10EAFB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 19:30:30 +0000 (UTC)
Received: from p508fd6b0.dip0.t-ipconnect.de ([80.143.214.176]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nIbcg-0001n3-UG; Fri, 11 Feb 2022 20:30:26 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Riesch <michael.riesch@wolfvision.net>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v6 0/5] Add GPU for RK356x SoCs
Date: Fri, 11 Feb 2022 20:30:24 +0100
Message-Id: <164460777903.839530.14036676510603904155.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209215549.94524-1-michael.riesch@wolfvision.net>
References: <20220209215549.94524-1-michael.riesch@wolfvision.net>
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Feb 2022 22:55:44 +0100, Michael Riesch wrote:
> This series aims to bring the GPU support for the RK356x mainline. In
> conjunction with the VOP2/HDMI TX patches v4 [0]) it has been tested
> successfully on a RK3568 EVB1 with weston and glmark2-es2-wayland.
> 
> It should be noted that on the RK3568 EVB1 the supply of the GPU power
> domain needs to be set to "always-on" in the device tree. There is an
> ongoing discussion to provide a clean solution [1], in the meantime one
> has to apply a hack.
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: rockchip: add gpu node to rk356x
      commit: 810028668c6d9da25664195d6b906c98a8169f72
[3/5] arm64: dts: rockchip: add cooling map and trip points for gpu to rk356x
      commit: c0a7259fad2df72469b602418083516c2cb3a7af
[4/5] arm64: dts: rockchip: enable the gpu on quartz64-a
      commit: 6ac383456452378de07e55fc687069d1898a567d
[5/5] arm64: dts: rockchip: enable the gpu on rk3568-evb1-v10
      commit: 679f048a10d8322d79010e0e52f18a6c17bdf306
[6]   arm64: dts: rockchip: enable the tsadc on rk3568-evb1-v10

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
