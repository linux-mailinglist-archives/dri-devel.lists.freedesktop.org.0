Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44707AFD57E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 19:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AC210E04C;
	Tue,  8 Jul 2025 17:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="lIWxiG+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8CF10E088
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=3+KIGxp1CkEgq5QeOKsG0ykxm/nmLGoH7zIoPCk6sho=; b=lIWxiG+lxhv+WZLVxW7jiYFUAX
 BI0smJ10GR33zPSRs+M8CwtohW+p/5bvlhyEi2BtFT7t0/DSVFqFCixuTcu7YanJw2KatF88VxQgt
 Ypi04+CHzte8m0OTtzx8ELO8GER2LTTAlqvHnAj1viMh68gTbEmbBoy4srQnTjIO02qhf9qRlcKXW
 zNTZIRf0keZ3AA1a5qf6vKo/kEB4Zdwq+u/ryo8X+D9wtjhg8atw9IkjqxF7LnA+DdvpVAqEWOQTD
 UmlaUhhEcKloAH9FiOKs6Vymn5hPygrWopXG0FZfqn9+gE53r64cUeim7EcRhrbmGA26CxOWhbsPO
 GDfnDcVw==;
Received: from i53875a8d.versanet.de ([83.135.90.141]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uZCE6-0005cC-0X; Tue, 08 Jul 2025 19:35:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: vop2: fail cleanly if missing a primary
 plane for a video-port
Date: Tue,  8 Jul 2025 19:35:14 +0200
Message-ID: <175199006057.1731917.1862299195201447039.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250610212748.1062375-1-heiko@sntech.de>
References: <20250610212748.1062375-1-heiko@sntech.de>
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


On Tue, 10 Jun 2025 23:27:48 +0200, Heiko Stuebner wrote:
> Each window of a vop2 is usable by a specific set of video ports, so while
> binding the vop2, we look through the list of available windows trying to
> find one designated as primary-plane and usable by that specific port.
> 
> The code later wants to use drm_crtc_init_with_planes with that found
> primary plane, but nothing has checked so far if a primary plane was
> actually found.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: fail cleanly if missing a primary plane for a video-port
      commit: f9f68bf1d0efeadb6c427c9dbb30f307a7def19b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
