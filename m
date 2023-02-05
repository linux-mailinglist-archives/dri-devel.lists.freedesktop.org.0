Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E639668B070
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 15:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F75B10E19F;
	Sun,  5 Feb 2023 14:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8E310E19F
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 14:56:32 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pOgRL-0007OK-UW; Sun, 05 Feb 2023 15:56:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] drm/rockchip: vop: Quiet always-warning AFBC log
Date: Sun,  5 Feb 2023 15:56:19 +0100
Message-Id: <167560896726.1025063.9551484368846993659.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221031101557.1.Ic1569d394173c1c3016142fee4bb87a09753db94@changeid>
References: <20221031101557.1.Ic1569d394173c1c3016142fee4bb87a09753db94@changeid>
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
Cc: linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Oct 2022 10:16:01 -0700, Brian Norris wrote:
> The downstream code from which this was derived didn't ever run through
> this 'switch' block with non-AFBC formats, but the upstream code does --
> we use this function to probe whether a given format is supported.
> 
> Demote the warning to eliminate this sort of warning seen on every
> boot:
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop: Quiet always-warning AFBC log
      commit: 582212ee1611f77e0360d249f11c0f703ed723dc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
