Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D652C7BEC66
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B21910E2EA;
	Mon,  9 Oct 2023 21:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D5F10E2E8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:11:36 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qpx07-00058Z-20; Mon, 09 Oct 2023 22:37:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Convert to use maple tree register
 cache
Date: Mon,  9 Oct 2023 22:37:09 +0200
Message-Id: <169688381984.192795.6257914410959231324.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231001-drm-rockchip-maple-v1-1-ca396ab75be7@kernel.org>
References: <20231001-drm-rockchip-maple-v1-1-ca396ab75be7@kernel.org>
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 01 Oct 2023 01:42:50 +0200, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Convert to use maple tree register cache
      commit: 3d59c22bbb8d03f3f14e6d0845d44c146fb48f35

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
