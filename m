Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DEF93FF17
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 22:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331DF10E382;
	Mon, 29 Jul 2024 20:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E1610E382
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 20:21:16 +0000 (UTC)
Received: from i5e86192c.versanet.de ([94.134.25.44] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sYWrp-0007Xp-T4; Mon, 29 Jul 2024 22:21:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 00/13] rockchip: Enable 4K@60Hz mode on RK3228,
 RK3328, RK3399 and RK356x
Date: Mon, 29 Jul 2024 22:21:06 +0200
Message-Id: <172228429364.2312452.1578932007616149726.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
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

On Sat, 15 Jun 2024 17:03:51 +0000, Jonas Karlman wrote:
> This prepares and enable use of HDMI2.0 modes, e.g. 4K@60Hz, on RK3228,
> RK3328, RK3399 and RK356x.
> 
> Patch 1-3 fixes some issues to help support use of high-resolution modes.
> 
> Patch 4 fixes reading of EDID on RK3328 when using a forced mode.
> 
> [...]

Applied, thanks!

[02/13] clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228
        commit: 1d34b9757523c1ad547bd6d040381f62d74a3189

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
