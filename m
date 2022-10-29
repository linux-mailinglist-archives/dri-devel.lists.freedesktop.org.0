Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B61961231D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 15:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB1410E29A;
	Sat, 29 Oct 2022 13:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C9B10E246
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 13:00:55 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oolSE-0006ID-AS; Sat, 29 Oct 2022 15:00:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Clean up 'usage_mode' when failing
 to attach
Date: Sat, 29 Oct 2022 15:00:45 +0200
Message-Id: <166704843775.1532410.17134222926830396000.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221019170255.1.Ia68dfb27b835d31d22bfe23812baf366ee1c6eac@changeid>
References: <20221019170255.1.Ia68dfb27b835d31d22bfe23812baf366ee1c6eac@changeid>
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Sandy Huang <hjc@rock-chips.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Oct 2022 17:03:48 -0700, Brian Norris wrote:
> If we fail to attach the first time (especially: EPROBE_DEFER), we fail
> to clean up 'usage_mode', and thus will fail to attach on any subsequent
> attempts, with "dsi controller already in use".
> 
> Re-set to DW_DSI_USAGE_IDLE on attach failure.
> 
> This is especially common to hit when enabling asynchronous probe on a
> duel-DSI system (such as RK3399 Gru/Scarlet), such that we're more
> likely to fail dw_mipi_dsi_rockchip_find_second() the first time.
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: dsi: Clean up 'usage_mode' when failing to attach
      commit: 0be67e0556e469c57100ffe3c90df90abc796f3b
[2/2] drm/rockchip: dsi: Force synchronous probe
      commit: 81e592f86f7afdb76d655e7fbd7803d7b8f985d8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
