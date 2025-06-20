Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F1BAE2361
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 22:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F59E10EBB5;
	Fri, 20 Jun 2025 20:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="g6WcKPak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3079B10EBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 20:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=5EjkAl0VuyPH4a8Z41Kx9iUxgGicQn2P0RYuSrndNqY=; b=g6WcKPakc4icPaibZXUctAKGHK
 UFU4loy9WCp3Nf11u3JwYAavj9yy3VomzxiNRqP6TnZTXmRlhThjwzHju8/9VwX7pDyd1DGICc/Zb
 XcOkCOcY43r+gLa6plk1fa8u8bo4sq7yJ8MqD4o5qMNUp+21GzUwQzWQdY7KweRWwXY7GuiA+G3Na
 gBKsEQ320EnLz3dZdp8UsuU5gYxPHLVDLxuOXvtPXHv2+/hhVRk4iE7RQaWOclu52zi4M+efuYP6C
 MGGCwQJlnjfqnrcrBgxiSsRW4hbJT6HWnIHs4SYDAlNEFIvaNNHI0Jp4ufcMjJ7lamjsWwbSVrVEm
 6+D4fbZw==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uSi9a-0005Nk-BA; Fri, 20 Jun 2025 22:16:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] rockchip: Add GPU support for RK3528
Date: Fri, 20 Jun 2025 22:15:53 +0200
Message-ID: <175045054807.1572438.8910024255365917623.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518225418.682182-1-jonas@kwiboo.se>
References: <20250518225418.682182-1-jonas@kwiboo.se>
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


On Sun, 18 May 2025 22:54:10 +0000, Jonas Karlman wrote:
> This series adds support for the Mali-450 MP2 GPU in the RK3528 SoC.
> 
> The clock used for the GPU can use normal PLL to support a rate of 100,
> 300 or 500 MHz. Or it can use PVTPLL to reach rates up to 800 MHz.
> 
> The TF-A SCMI_CLK_GPU is used to switch use between normal PLL and
> PVTPLL. When a rate of up to 300 MHz is requested TF-A switch to use
> normal PLL, and for rates above 300 MHz the PVTPLL is used.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add GPU node for RK3528
      commit: 6b88b8a640fa5d2169e0ce47b88dc30727fc1105
[3/3] arm64: dts: rockchip: Enable GPU on Radxa E20C
      commit: 669080eb7f7c4720aa4e640a49f7490cd928cfcc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
