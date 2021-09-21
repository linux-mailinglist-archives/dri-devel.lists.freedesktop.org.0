Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B84413129
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 12:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBBC6E926;
	Tue, 21 Sep 2021 10:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02D46E921
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 10:04:12 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mScdE-0001rd-Hx; Tue, 21 Sep 2021 12:04:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>, Alex Bee <knaerzche@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Daniel Vetter <daniel@ffwll.ch>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jonathan McDowell <noodles@earth.li>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] drm/rockchip: handle non-platform devices in
 rockchip_drm_endpoint_is_subdriver
Date: Tue, 21 Sep 2021 12:03:38 +0200
Message-Id: <163221857584.2031971.6026620150373954389.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914150756.85190-1-knaerzche@gmail.com>
References: <20210914150756.85190-1-knaerzche@gmail.com>
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

On Tue, 14 Sep 2021 17:07:56 +0200, Alex Bee wrote:
> As discussed at [1] rockchip_drm_endpoint_is_subdriver will currently always
> return -ENODEV for non-platform-devices (e.g. external i2c bridges), what
> makes them never being considered in rockchip_rgb_init.
> 
> As suggested at [1] this additionally adds a of_device_is_available for
> the node found, which will work for both platform and non-platform devices.
> Also we can return early for non-platform-devices if they are enabled,
> as rockchip_sub_drivers contains exclusively platform-devices.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: handle non-platform devices in rockchip_drm_endpoint_is_subdriver
      commit: 37825e07ab413187e1ea078bc33dcdb835008be2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
