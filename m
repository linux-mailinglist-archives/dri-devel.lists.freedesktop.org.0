Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCBE90BC2D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 22:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042DE10E4E8;
	Mon, 17 Jun 2024 20:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF4A10E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 20:30:30 +0000 (UTC)
Received: from i5e8616c2.versanet.de ([94.134.22.194] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sJIzi-0003be-1t; Mon, 17 Jun 2024 22:30:26 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Yakir Yang <kuankuan.y@gmail.com>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/13] clk: rockchip: Set parent rate for DCLK_VOP clock
 on RK3228
Date: Mon, 17 Jun 2024 22:30:25 +0200
Message-ID: <19757196.sIn9rWBj0N@diego>
In-Reply-To: <20240615170417.3134517-3-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
 <20240615170417.3134517-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Samstag, 15. Juni 2024, 19:03:53 CEST schrieb Jonas Karlman:
> Similar to DCLK_LCDC on RK3328, the DCLK_VOP on RK3228 is typically
> parented by the hdmiphy clk and it is expected that the DCLK_VOP and
> hdmiphy clk rate are kept in sync.
> 
> Use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags, same as used
> on RK3328, to make full use of all possible supported display modes.
> 
> Fixes: 0a9d4ac08ebc ("clk: rockchip: set the clock ids for RK3228 VOP")
> Fixes: 307a2e9ac524 ("clk: rockchip: add clock controller for rk3228")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

did your mailer have a hickup? Somehow I got patch2 (only this one)
2 times


