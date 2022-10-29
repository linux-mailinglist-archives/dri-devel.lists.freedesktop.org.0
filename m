Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D6D612628
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 00:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA2B10E02C;
	Sat, 29 Oct 2022 22:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152A010E02C
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 22:08:56 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oou0W-0008NZ-5E; Sun, 30 Oct 2022 00:08:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	hjc@rock-chips.com
Subject: Re: [PATCH] drm/rockchip: dsi: Remove the unused function
 dsi_update_bits()
Date: Sun, 30 Oct 2022 00:08:43 +0200
Message-Id: <166708118165.1656095.106090992653500085.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221017084330.94117-1-jiapeng.chong@linux.alibaba.com>
References: <20221017084330.94117-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Oct 2022 16:43:30 +0800, Jiapeng Chong wrote:
> The function dsi_update_bits() is defined in the dw-mipi-dsi-rockchip.c
> file, but not called elsewhere, so delete this unused function.
> 
> drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c:367:20: warning: unused function 'dsi_update_bits'.
> 
> https://bugzilla.openanolis.cn/show_bug.cgi?id=2414
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: dsi: Remove the unused function dsi_update_bits()
      commit: 3daf391fee830f2343cc6b1ba131b1b5115dea1f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
