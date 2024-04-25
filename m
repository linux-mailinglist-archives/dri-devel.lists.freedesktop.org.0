Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C951C8B24EB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 17:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF8E11A543;
	Thu, 25 Apr 2024 15:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839A811A543
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 15:20:13 +0000 (UTC)
Received: from i5e861d82.versanet.de ([94.134.29.130] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1s00tE-0003kV-3Z; Thu, 25 Apr 2024 17:20:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, hjc@rock-chips.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 s.hauer@pengutronix.de, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 0/1] Fix the port mux of VP2
Date: Thu, 25 Apr 2024 17:19:58 +0200
Message-Id: <171405838036.2897712.4067984796758491640.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240422101905.32703-1-andyshrk@163.com>
References: <20240422101905.32703-1-andyshrk@163.com>
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

On Mon, 22 Apr 2024 18:19:04 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> The port mux bits of VP2 should be defined by RK3568_OVL_PORT_SET__PORT2_MUX,
> this maybe a copy and paste error when this driver first introduced.
> Hi Heiko:
>    Maybe thi is the problem you met when you porting the dsi2 driver.
> I previously sent you this patch when you ask me about this issue on
> email,but I'm not sure if you received it.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Fix the port mux of VP2
      commit: 2bdb481bf7a93c22b9fea8daefa2834aab23a70f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
