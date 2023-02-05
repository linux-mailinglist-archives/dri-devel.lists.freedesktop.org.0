Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2936368B074
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 15:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2C010E272;
	Sun,  5 Feb 2023 14:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E6610E282
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 14:56:41 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pOgRM-0007OK-N9; Sun, 05 Feb 2023 15:56:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v3 0/6] drm/rockchip: vop2: add support for the
 rgb output block
Date: Sun,  5 Feb 2023 15:56:21 +0100
Message-Id: <167560896725.1025063.3856906837169382269.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
References: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
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
Cc: Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023 06:47:00 +0100, Michael Riesch wrote:
> This series adds support for the RGB output block that can be found in the
> Rockchip Video Output Processor (VOP) 2. Version 2 of this series
> incorporates the feedback by Dan Carpenter and Sascha Hauer. Version 3
> fixes a dumb mistake pointed out by Sascha :-) Thanks for your comments!
> 
> Patches 1-4 clean up the code and make it more general.
> 
> [...]

Applied, thanks!

[1/6] drm/rockchip: vop2: initialize possible_crtcs properly
      commit: 368419a2d429e2438bef333959732c640310bdc7
[2/6] drm/rockchip: rgb: embed drm_encoder into rockchip_encoder
      commit: f8a852f1f86391127ab57b1c41fe0e62bc14f27c
[3/6] drm/rockchip: rgb: add video_port parameter to init function
      commit: 03db8f25cf16c579fe75fd2230bbe64c221bfe25
[4/6] drm/rockchip: vop2: use symmetric function pair vop2_{create,destroy}_crtcs
      commit: cddddc066b056e7bb629a8c4d99c9c4a8ca70a6a
[5/6] drm/rockchip: vop2: add support for the rgb output block
      commit: c66c6d7c47058a72a00b50d7f5c4538e3fa49b1c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
