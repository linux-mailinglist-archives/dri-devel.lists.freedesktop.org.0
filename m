Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2764952C7E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 12:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2FE10E108;
	Thu, 15 Aug 2024 10:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="T9wp4ksg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9F910E108
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GgTI0NyTQzsStScrcGO6aMDCmPA8tFa+LOqjkXlw7B4=; b=T9wp4ksgpK8kyWUBawTO2KYM1Y
 Py9VnW/j4d3UV7Sc5w3+L/RKZMIk7NBvlQm4xkBvOPQ2VsHUszJRQwTgD6G2x/0+2kWrP7GFXYoEQ
 cie44dv3b3mE8nKJfvGfDH8ASdZqD6rFpcHuIsH+E45wNfJXq69vfxZBLZoc9PtY9Zg1r864hruXx
 65l5Wr11sIb3oQAqF0SBsfEqegb2fP2FNeH740fWj90A9pcsnDK5VbmJsVddW0Yjw+HQJkbB2BrNW
 lsQrY+gqNJuS7bsXvco5YCd4sqJ5AEI6++dB0J48I/JqaGxpA5JrW+UtUXCux1kKV9err0jUt17Mt
 iNCLug3Q==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1seXuG-0000nZ-Lf; Thu, 15 Aug 2024 12:40:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <mripard@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Mark Yao <markyao0591@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Yan <andy.yan@rock-chips.com>, Robert Foss <rfoss@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Alexandre ARNOUD <aarnoud@me.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Luis de Arquer <ldearquer@gmail.com>, linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v3 0/5] Add initial support for the Rockchip
 RK3588 HDMI TX Controller
Date: Thu, 15 Aug 2024 12:40:30 +0200
Message-Id: <172371788339.684432.3349154890008070129.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807-b4-rk3588-bridge-upstream-v3-0-60d6bab0dc7c@collabora.com>
References: <20240807-b4-rk3588-bridge-upstream-v3-0-60d6bab0dc7c@collabora.com>
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

On Wed, 07 Aug 2024 14:07:22 +0300, Cristian Ciocaltea wrote:
> The Rockchip RK3588 SoC family integrates the Synopsys DesignWare HDMI
> 2.1 Quad-Pixel (QP) TX controller, which is a new IP block, quite
> different from those used in the previous generations of Rockchip SoCs.
> 
> The controller supports the following features, among others:
> 
> * Fixed Rate Link (FRL)
> * Display Stream Compression (DSC)
> * 4K@120Hz and 8K@60Hz video modes
> * Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
> * Fast Vactive (FVA)
> * SCDC I2C DDC access
> * Multi-stream audio
> * Enhanced Audio Return Channel (EARC)
> 
> [...]

Applied, thanks!

[4/5] drm/rockchip: Explicitly include bits header
      commit: ab03974df27e471ff03402265292f1bafafb5df6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
