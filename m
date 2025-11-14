Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E412C5F8DB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 00:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6EA10E269;
	Fri, 14 Nov 2025 23:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="uzjjlbLb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E63410E269
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=pKSiJLPUAR9HsRgDUrGDGMtk9hgHROgW9DBE1l02DWg=; b=uzjjlbLbFXvlizzyq8tBfXfVCD
 wbKlVB2/6PiXeRAKOvcu5j0bQlSkCwg/o2xb6hc3R+rePi0ylu+YPrO4WSyl15brFYeoweQ03F849
 wBHPrsaxUY6IIbE1cD1raSY6FRHUp+dpHC/r1zd6LIUK28CAdRtUVBtmW2Y8qP21ITGviaBt9j5AP
 poixYaj0jNG2aLxOnCuEGwZ8cJAWekAVhmmX5D3qFm0uExLVoWUUnMwqtcx24SnhxyTFjo/AAOTUL
 G8A6vBeI7FLb0vxt1oEw6ECYDWML8Sr+864Oro2NkciieBxcRphndWot+IqBym7OJ4ik4jmq+76Vc
 HL1+a+gQ==;
Received: from i53875ae8.versanet.de ([83.135.90.232] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vK2pw-0008IQ-Tp; Sat, 15 Nov 2025 00:04:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 0/2] drm/rockchip: dw_hdmi_qp: Fixup usage of
 enable_gpio
Date: Sat, 15 Nov 2025 00:04:08 +0100
Message-ID: <176316144239.624283.9548416396481211446.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
References: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
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


On Tue, 28 Oct 2025 00:26:39 +0200, Laurent Pinchart wrote:
> The dw_hdmi_qp driver supports a "enable-gpios" DT property that is not
> documented in the corresponding DT bindings, and is not used in any
> upstream device tree sources. This patch series renames the property to
> "frl-enable-gpios" to express its purpose more clearly, and documents it
> in the bindings.
> 
> In the previous these two patches were part of "[PATCH v2 0/5] arm64:
> dts: rockchip: Add device tree for the Orange Pi CM5 Base board" ([1]).
> I have split them from the Orange Pi CM5 Base DT and rebased them on top
> of the drm-misc-next branch to ease integration.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display: rk3588-dw-hdmi-qp: Add frl-enable-gpios property
      commit: ca408d8d93d33423cafe3046f40bcc81bc6ee5f3
[2/2] drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio member in main struct
      commit: 53dd063bb6b342ca00d2a0c138ba58807a690417

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
