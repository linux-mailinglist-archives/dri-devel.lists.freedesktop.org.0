Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063E4A83D48
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571C710E7D0;
	Thu, 10 Apr 2025 08:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="wVDaAKIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF5E10E7D0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=PHgurkr3hfzIhUm3LgtYoYaBD5Ipt+sR4+jQYwAKKxg=; b=wVDaAKIYQLbajvye4IbWs10b1p
 /C3Ez7SoN9FvjdXQ3wyMQwdQqvl0I+sukLGw675cakYQUpv/KWIAegmQSiYrbA7n1dDK1vh+RGRA6
 Qlle8/0O/SEhx3WO/v3DwVV7wg7ggwzQs99YUxN1drFtvJYjvH2fxsCExdvsImiLQE5eou/BZf4iS
 r56xWG/gi+UUDOAjoY15WK7Bf5J3YW0axV2hC37g/sspKK26lOb0uDsloxTrpTfmhMcoJw98pNOss
 s5Hc58KIstJg42996lQmlnveFW5Gil2s7Clz6ZOJnnt2jytJDT/fKI9d/e22E990+6GUZPbXEUzoy
 aVgjWJ7Q==;
Received: from i53875b95.versanet.de ([83.135.91.149]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1u2nTu-0002qP-Ux; Thu, 10 Apr 2025 10:41:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Make overlay layer select register
 configuration take effect by vsync
Date: Thu, 10 Apr 2025 10:41:42 +0200
Message-ID: <174427445692.820310.6392572128244429943.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318062024.4555-1-andyshrk@163.com>
References: <20250318062024.4555-1-andyshrk@163.com>
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


On Tue, 18 Mar 2025 14:20:17 +0800, Andy Yan wrote:
> Because the layer/window enable/disable is take effect by vsync, if the
> overlay configuration of these layers does not follow vsync and
> takes effect immediately instead, when multiple layers are dynamically
> enable/disable, inconsistent display contents may be seen on the screen.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Make overlay layer select register configuration take effect by vsync
      commit: c5996e4ab109c8bb5541453b20647eaaf9350f41

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
