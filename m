Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E4F9C9196
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 19:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B9610E0B6;
	Thu, 14 Nov 2024 18:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="mDA2wWXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A41710E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bzMfq51YBw3fK66Y4Obj6vDkHx4AScY6wD/SzgxHHl4=; b=mDA2wWXhKfxROFPmQQJpxx72zj
 0To+tuOSzd9zK8q5PTY3C3NLf6GzXmJ4x4no0wpM9pYWeGaqHgjbQTOtm0BRDZ0UFfgxudLz+VOVF
 IN5RQ1p/aW6vT7O8ewDG6l84kzG/VakL9qOiZW6XxXWXOVq9MWokesR0TOEB+WrCyGAnvMag5SuhG
 K946c33JCkSAaNjZY1XUqHl/vT31iI9zoqiDSdAXqU3ieuQ6PNvvPfzpNmpzY63qsj7CIi7ZtzNid
 SFFvnYpXFOJRSKh0qp+mGYN5php4Nloz6kAomKKXfT53IW1snuKq2i/Qa+Km6f/dH2iULE/8uQepY
 7dWRu5zw==;
Received: from i53875a30.versanet.de ([83.135.90.48]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tBeU9-0005D3-G0; Thu, 14 Nov 2024 19:22:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Lucas Stach <l.stach@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH] drm/rockchip: analogix_dp: allow to work without panel
Date: Thu, 14 Nov 2024 19:22:17 +0100
Message-ID: <173160851639.206583.9258442032788784452.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621201755.500271-1-l.stach@pengutronix.de>
References: <20240621201755.500271-1-l.stach@pengutronix.de>
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


On Fri, 21 Jun 2024 22:17:55 +0200, Lucas Stach wrote:
> When the DP output is routed to a external connector there is no
> need for a fixed panel, as the panel may be detected via EDID on
> the AUX channel. Allow to continue probing if no panel reference
> is present.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: analogix_dp: allow to work without panel
      commit: 86caee745e4506528801d9542db54e7b4c4d834b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
