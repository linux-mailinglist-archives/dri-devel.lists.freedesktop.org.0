Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B05B9C1F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F91010EB24;
	Thu, 15 Sep 2022 13:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0F110EB24
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:40:18 +0000 (UTC)
Received: from [89.101.193.72] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oYp6D-0004w0-Po; Thu, 15 Sep 2022 15:40:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	Hugh Cole-Baker <sigmaris@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] drm/rockchip: support gamma control on
 RK3399
Date: Thu, 15 Sep 2022 15:40:11 +0200
Message-Id: <166324919922.172360.5495329788768781703.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20211019215843.42718-1-sigmaris@gmail.com>
References: <20211019215843.42718-1-sigmaris@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 ezequiel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Oct 2021 22:58:40 +0100, Hugh Cole-Baker wrote:
> This extends the Rockchip VOP driver to support setting the gamma LUT on the
> RK3399 SoC. Previously, the driver supported gamma control for the RK3288
> only. On the RK3399 the method for updating the LUT is slightly different.
> This implementation was based on the code and description from the vendor
> kernel [1].
> 
> The RK3399 also has the address resources for the VOP general registers and
> the gamma LUT located adjacent to each other, not on either side of the IOMMU
> address as on the RK3288, but for simplicity this series follows the existing
> DT binding which requires the gamma LUT as a second address resource.
> 
> [...]

Applied, thanks!

[1/3] drm/rockchip: define gamma registers for RK3399
      commit: 3ba000d6ae999b99f29afd64814877a5c4406786
[2/3] drm/rockchip: support gamma control on RK3399
      commit: 7ae7a6211fe7251543796d5af971acb8c9e2da9e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
