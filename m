Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129305B9C4C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1137D10EB2D;
	Thu, 15 Sep 2022 13:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E38F10EB4C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:49:14 +0000 (UTC)
Received: from [89.101.193.72] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oYpEt-00053R-QK; Thu, 15 Sep 2022 15:49:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	Hugh Cole-Baker <sigmaris@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] drm/rockchip: support gamma control on
 RK3399
Date: Thu, 15 Sep 2022 15:49:09 +0200
Message-Id: <166324955276.172936.12777081012658137817.b4-ty@sntech.de>
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

[3/3] arm64: dts: rockchip: enable gamma control on RK3399
      commit: 3a5247120668041c8e9eb190497296656b66bf9a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
