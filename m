Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D837F8202D8
	for <lists+dri-devel@lfdr.de>; Sat, 30 Dec 2023 00:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B70710E0B1;
	Fri, 29 Dec 2023 23:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ED810E0B1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 23:42:21 +0000 (UTC)
Received: from i53875a56.versanet.de ([83.135.90.86] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rJMUX-0004oA-5r; Sat, 30 Dec 2023 00:42:13 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, Sandy Huang <hjc@rock-chips.com>,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alex Bee <knaerzche@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: (subset) [PATCH v4 00/29] Add HDMI support for RK3128
Date: Sat, 30 Dec 2023 00:42:11 +0100
Message-Id: <170389332196.2712965.572879488382890334.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Dec 2023 18:41:51 +0100, Alex Bee wrote:
> This is version 4 of my series that aims to add support for the display
> controller (VOP) and the HDMI controller block of RK3128 (which is very
> similar to the one found in RK3036). The original intention of this series
> was to add support for this slightly different integration but is by now,
> driven by maintainer's feedback, exploded to be a rework of inno-hdmi
> driver in large parts. It is, however, a change for the better.
> 
> [...]

Applied, thanks!

[13/29] drm/rockchip: inno_hdmi: Drop HDMI Vendor Infoframe support
        commit: aa4f96e2de82f5e0dfc0102d08f66918c5e3637f
[14/29] drm/rockchip: inno_hdmi: Move infoframe disable to separate function
        commit: cc9ec38cb2cd32518fe02615d004e96ce2fd0348
[15/29] drm/rockchip: inno_hdmi: Switch to infoframe type
        commit: 4278ff62b73936a9138b60cc0610381003132b77
[16/29] drm/rockchip: inno_hdmi: Remove unused drm device pointer
        commit: 153fe8dbd866869846af3a359ecf82d5ad9fe247
[17/29] drm/rockchip: inno_hdmi: Drop irq struct member
        commit: 073aa696f8cbc170a2c3502c2165aeb835be0156
[18/29] drm/rockchip: inno_hdmi: Remove useless include
        commit: f68a68fe9d9197ea6aa9cb461270685f370b165e
[19/29] drm/rockchip: inno_hdmi: Subclass connector state
        commit: ceeb0f0104a62c867656c2730a51df47e7350b8f
[20/29] drm/rockchip: inno_hdmi: Correctly setup HDMI quantization range
        commit: 164abbd2b7ef62aae6fc80450a2d085acdc3da3e
[21/29] drm/rockchip: inno_hdmi: Don't power up the phy after resetting
        commit: 71892cee6ceb3e1b88e0bb44b05c8397d8261a85
[22/29] drm/rockchip: inno_hdmi: Split power mode setting
        commit: f01e33cb586b5fd354cba73052f82c3b4246109d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
