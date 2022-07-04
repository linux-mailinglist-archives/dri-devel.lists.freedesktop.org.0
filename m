Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D875B565BC0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921DF10F402;
	Mon,  4 Jul 2022 16:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDB110E170
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 15:31:12 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1o8O2T-00038m-2I; Mon, 04 Jul 2022 17:31:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Steven Price <steven.price@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/rockchip: Detach from ARM DMA domain in attach_device
Date: Mon,  4 Jul 2022 17:31:02 +0200
Message-Id: <165694865211.1434291.3332055091205134554.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615154830.555422-1-steven.price@arm.com>
References: <20220615154830.555422-1-steven.price@arm.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 16:48:30 +0100, Steven Price wrote:
> Since commit 1ea2a07a532b ("iommu: Add DMA ownership management
> interfaces") the Rockchip display driver on the Firefly RK3288 fails to
> initialise properly. This is because ARM DMA domain is still attached.
> 
> Let's follow the lead of exynos and tegra and add code to explicitly
> remove the ARM domain before attaching a new one.

Applied, thanks!

[1/1] drm/rockchip: Detach from ARM DMA domain in attach_device
      commit: 8490cad4dc4e2ee265ba9e12cd47bdfd6b9a3d34

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
