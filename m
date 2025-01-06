Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA2DA02AE4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 16:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDCF10E6A7;
	Mon,  6 Jan 2025 15:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="AdRV+Zs1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF05F10E6A7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xIHJ3N6FbqQwLKdBookcSrozPRMb1anppfm1oqShOzQ=; b=AdRV+Zs1KfV5w9RyuCicb7IK1Z
 +PMU7vNfSRy8IV6SFLlggCMXeDf6Pmh2ruBGN8/XD9X/5CVAX2Uu6h269MkPrGjrbYMrOz5Uv0YEl
 UKa4HhfRoTnXZDDMfHmkOhWbEAXP2rktYfQJlWoi+IO1sf+aBB4F5Wki1f92TDZ0YvKoUsaew85Ky
 TOcws2XXplYBLYjrIYD8IwJ7zafd4j3xjZLxKhtCpx/uX8nNqmw5TqWcNO8QmNGBUzHIjKYTd7HC1
 avLKuunwyzsToQwCMMPkiCi6JQz4Xx5WuzM2bM3Pnc/Jft4bqB6TAhpxD+06DIpBnflsSSjW0rdIl
 h/csPflw==;
Received: from i53875aad.versanet.de ([83.135.90.173]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tUpBQ-0006Va-4T; Mon, 06 Jan 2025 16:38:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, krzk+dt@kernel.org, mripard@kernel.org,
 robh@kernel.org, hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 0/3] Add HDMI support for rk3576
Date: Mon,  6 Jan 2025 16:38:11 +0100
Message-ID: <173617782282.2587484.17610708009808824460.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241231094425.253398-1-andyshrk@163.com>
References: <20241231094425.253398-1-andyshrk@163.com>
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


On Tue, 31 Dec 2024 17:44:16 +0800, Andy Yan wrote:
> RK3576 HDMI TX Controller is very similar to that of RK3588, but with
> some control bits for IO and interrupts status scattered across different
> GRF.
> 
> PATCH 1/3 is add platform ctrl callback for IO setting and interrupts
> status handing.
> PATCH 2/3 ~ 3/3 are add support for rk3576
> 
> [...]

Applied, thanks!

[1/3] drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
      commit: 3f60dbd40d3f7aca312d1aa1131e204eb97a68b3
[2/3] dt-bindings: display: rockchip: Add rk3576 hdmi controller
      commit: 3a5981b65f77bfb8abcc6f29c13f1b89ce9df3a3
[3/3] drm/rockchip: Add basic RK3576 HDMI output support
      commit: 36439120efbdc62e2f47053e7ddfcc4e34364640

I've fixed some minor stuff
patch1: my review nits (empty line + hardird)
patch3: drop Detlev's Signed-off
patches1+3: fixed some more checkpatch warnings


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
