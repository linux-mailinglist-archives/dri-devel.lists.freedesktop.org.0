Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35160B323EE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF30F10EBB2;
	Fri, 22 Aug 2025 21:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="m50fFHfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AF210EBB2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=cypEHEpRR2kJqbcPVa7GjXp1ID7KVO6yBwZP58hpPu8=; b=m50fFHfFtMqgCcu9VSJ5v/1T6H
 rXZjeTd4nbm4TotaElmywFPoV8XWbvuSL8GfaN6a0xWhFP1p1hlUN8ukE7DdXvkYtnaWjfoG4D0je
 JC2lnZk/8KsCYsbU7QoRjO0hQVndHLLDaOe1i3U2ep9K0lAY7RWGhPeiEDWtCxbc+9se5lg8uEIxD
 LMATyPUYvXPGh7wsS4XepSWRK68sUL0SfF70hBPSFw85dmzzccZSp629CltlOpyppucRM1bRNIUJq
 DtYXKHHGXdselR2BtScg+0iTxTl/8apdFsRowbsNS1kCHLh2PbDTLr5VOOgZj+nmkxAlVGRVI3Yh3
 ObWwOPog==;
Received: from i53875a83.versanet.de ([83.135.90.131] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1upYzr-000415-Uo; Fri, 22 Aug 2025 23:08:28 +0200
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
Date: Fri, 22 Aug 2025 23:08:25 +0200
Message-ID: <175589689704.3303128.5679950731528883388.b4-ty@sntech.de>
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

[01/13] drm/panel: ilitek-ili9881c: turn off power-supply when init fails
        commit: 6c66eba502709a78281333187c1add7b71f7201f
[02/13] drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to (un-)prepare
        commit: 5efa82492066fcb32308210fb3f0b752af74334f
[03/13] drm/panel: ilitek-ili9881c: convert (un-)prepare to mipi_dsi_multi_context
        commit: 9002f55ee4480f23bd2ce91fb5fca536ce31717e
[04/13] dt-bindings: vendor-prefixes: Add prefix for Shenzhen Bestar Electronic
        commit: 8e484ff181b177ea2e86e537fd7a5c8f9d7532ad
[05/13] dt-bindings: display: ili9881c: Add Bestar BSD1218-A101KL68 LCD panel
        commit: 157ba8c6742931a617a34555c27dd10b36385cf3
[06/13] drm/panel: ilitek-ili9881c: Add Bestar BSD1218-A101KL68 support
        commit: 38dbbbb41c515d72b0a82fde3cec450d068f5e94

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
