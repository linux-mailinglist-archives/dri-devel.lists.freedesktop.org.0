Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B53612319
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 15:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BBF10E287;
	Sat, 29 Oct 2022 13:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042A910E246
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 13:00:53 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oolSF-0006ID-3J; Sat, 29 Oct 2022 15:00:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Ondrej Jirman <megi@xff.cz>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: dsi: Fix VOP selection on SoCs that support
 it
Date: Sat, 29 Oct 2022 15:00:47 +0200
Message-Id: <166704843774.1532410.10169614627003469571.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221023160747.607943-1-megi@xff.cz>
References: <20221023160747.607943-1-megi@xff.cz>
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
Cc: Chris Morgan <macromorgan@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 "open list:DRM DRIVERS FOR ROCKCHIP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Oct 2022 18:07:47 +0200, Ondrej Jirman wrote:
> lcdsel_grf_reg is defined as u32, so "< 0" comaprison is always false,
> which breaks VOP selection on eg. RK3399. Compare against 0.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: dsi: Fix VOP selection on SoCs that support it
      commit: 553c5a429aee26c9cfaf37ae158a8915540270fe

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
