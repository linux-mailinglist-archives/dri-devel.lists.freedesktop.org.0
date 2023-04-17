Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE99C6E5410
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0569310E618;
	Mon, 17 Apr 2023 21:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828A310E618
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 21:44:20 +0000 (UTC)
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1poWe0-0006wK-FQ; Mon, 17 Apr 2023 23:44:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: Use regcache_sync() to fix
 suspend/resume
Date: Mon, 17 Apr 2023 23:44:14 +0200
Message-Id: <168176784870.3951774.15858460527087012477.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230417123747.2179695-1-s.hauer@pengutronix.de>
References: <20230417123747.2179695-1-s.hauer@pengutronix.de>
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
Cc: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
 Sandy Huang <hjc@rock-chips.com>, stable@vger.kernel.org,
 Chris Morgan <macroalpha82@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Apr 2023 14:37:47 +0200, Sascha Hauer wrote:
> afa965a45e01 ("drm/rockchip: vop2: fix suspend/resume") uses
> regmap_reinit_cache() to fix the suspend/resume issue with the VOP2
> driver. During discussion it came up that we should rather use
> regcache_sync() instead. As the original patch is already applied
> fix this up in this follow-up patch.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume
      commit: b63a553e8f5aa6574eeb535a551817a93c426d8c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
