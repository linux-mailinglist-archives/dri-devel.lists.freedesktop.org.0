Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7A2B32413
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B8110EBC7;
	Fri, 22 Aug 2025 21:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="MqjXmnGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2516710EBC7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 21:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=MUyMAIJnbkOdcwtpYR/h4OiFxPawHL+4XS3+iNmUVuU=; b=MqjXmnGzSVAi7K9hMP41rVxp3H
 ZmIMpPrHojZ+uFniw/zrIG8lzmZQLGtvBp0p4cAKVhYj7dBBuCqsOIrVoNjazjh5+PnmT7I3FwM7/
 zIcVNaHivTP9nm4dZgEQVTtBvmEq2o7XvUsdu2PaavVIW1eUQS9GPVVTWpAv+J8PecKuRsbumGx8E
 yyxrGDmMfzwZ6jV2e/cbOYWZOL6eGqg/szMr+AhHkwsfkYl96E+3AsGRYslHk5mPc85CR9XMjgQzR
 7bGVtxiNIW0Uz23MNIxJSm5qmOze3zMqc33KvSgqpqjdw49k/IPwWqZ5DoBDf/UGmNoihdU6ssReP
 fUkCUIKg==;
Received: from i53875a83.versanet.de ([83.135.90.131] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1upZD7-0004lj-An; Fri, 22 Aug 2025 23:22:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 00/13] Support DSI output on rk3576 and
 roc-rk3576-pc board
Date: Fri, 22 Aug 2025 23:22:06 +0200
Message-ID: <175589772390.3317579.11344569273616285700.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
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


On Mon, 07 Jul 2025 18:48:53 +0200, Heiko Stuebner wrote:
> This enables all the necesary bits and bindings to get display output
> on the dm-m10r800-v3s addon module for the Firefly roc-rk3576-pc board.
> 
> A bit of cleanup of the ili9881c, because the driver was still trying
> to send dcs commands when the underlying DSI driver might have already
> switched to video-mode, which caused me quite a bit of headache until
> I realized this being the culprit for my garbled display output :-) .
> 
> [...]

Applied, thanks!

[07/13] dt-bindings: soc: rockchip: add rk3576 mipi dcphy syscon
        commit: 0e3f3d7c7ae3dec5ff52325915e3efcbce652a82
[10/13] arm64: dts: rockchip: add mipi-dcphy to rk3576
        commit: 21bc1a7fcea4635a49f6b2eff3e4c661e80e8f43
[11/13] arm64: dts: rockchip: add the dsi controller to rk3576
        commit: e51828f80df99a2899e263b750cada6426f14c92
[12/13] arm64: dts: rockchip: add vcc3v3-lcd-s0 regulator to roc-rk3576-pc
        commit: 3d5c0c21d86fed05caeae43549e0c13ddd203c31

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
