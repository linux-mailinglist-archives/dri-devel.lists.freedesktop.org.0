Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEAF6E4577
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 12:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0257C10E0DF;
	Mon, 17 Apr 2023 10:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E78010E0DF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 10:43:53 +0000 (UTC)
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1poMKr-0002c5-0t; Mon, 17 Apr 2023 12:43:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: fix suspend/resume
Date: Mon, 17 Apr 2023 12:43:42 +0200
Message-Id: <168172821104.3902783.8715720558110042171.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230413144347.3506023-1-s.hauer@pengutronix.de>
References: <20230413144347.3506023-1-s.hauer@pengutronix.de>
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
 Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Apr 2023 16:43:47 +0200, Sascha Hauer wrote:
> During a suspend/resume cycle the VO power domain will be disabled and
> the VOP2 registers will reset to their default values. After that the
> cached register values will be out of sync and the read/modify/write
> operations we do on the window registers will result in bogus values
> written. Fix this by re-initializing the register cache each time we
> enable the VOP2. With this the VOP2 will show a picture after a
> suspend/resume cycle whereas without this the screen stays dark.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: fix suspend/resume
      commit: afa965a45e01e541cdbe5c8018226eff117610f0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
