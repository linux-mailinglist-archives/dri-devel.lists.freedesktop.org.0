Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283DA83D49
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8813410E7CD;
	Thu, 10 Apr 2025 08:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="X3SXzwhr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965A510E7C9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=y+KXEI6OfVHvtP8Yf5k0bZWTlMoRiewsHyens3ukaaA=; b=X3SXzwhrZNjCMiHFIVo/6tYZp2
 J9Eq9+lx5Iy15hkVHSiZzPGG8gDoF/5kc2JgDA3EhmWLY7J4YdoUO97e6h7hNEYqCsIapXpkfBw9U
 Rod8dzIGU5gOE3nSNsgv+X3UkuviVRMtKUt5F3XRnqekucRmVJEW3wqb3lAejccWSxN4C8Z3xOMEn
 P8gNxyGsRd0MKYxVbHLXwtKipGXMxhoNRtJGpMHJ04zu99U3PQGz/RF9g91c3ZvRY6VCmSLtK4PRe
 /dDFXtWqlZShpL+/vApuPsisnRin9YMtDGM5JjbP9jpZJfxjUMC5KdXHa9wH8KqfJHMBSWG2xSluP
 WgEgkf5Q==;
Received: from i53875b95.versanet.de ([83.135.91.149]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1u2nTv-0002qP-DJ; Thu, 10 Apr 2025 10:41:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Damon Ding <damon.ding@rock-chips.com>,
 Lucas Stach <l.stach@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: (subset) [PATCH 1/2] drm/rockchip: vop: remove redundant
 condition check
Date: Thu, 10 Apr 2025 10:41:43 +0200
Message-ID: <174427445693.820310.13302074233531246812.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207182247.215537-1-l.stach@pengutronix.de>
References: <20250207182247.215537-1-l.stach@pengutronix.de>
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


On Fri, 07 Feb 2025 19:22:46 +0100, Lucas Stach wrote:
> Instead of checking the same thing twice in a row, fold the second
> condition into the first clause.
> 
> 

Applied, thanks!

[1/2] drm/rockchip: vop: remove redundant condition check
      commit: bcdc354a0a545e0e78c6f068e5a11c0285e06eeb


Andy suggested a name change for a function in patch2.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
