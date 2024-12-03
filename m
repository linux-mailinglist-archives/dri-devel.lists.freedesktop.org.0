Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039FA9E2864
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C5910EABE;
	Tue,  3 Dec 2024 16:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YA/+5FUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F35510EABE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 16:58:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89AB75C6B93;
 Tue,  3 Dec 2024 16:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD3DC4CECF;
 Tue,  3 Dec 2024 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733245109;
 bh=arF+AUtSeu6ScqKrFJj4z1B2pVwQCLt63eW9K0h113I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YA/+5FUCNsnzc7OLhztiJaztpx3YVhqilIZltxUkySH8DqVvnFKO/OXroDo3LgeWn
 uE8dW8TU8STjU4G3thzdB8bI2m7LSqs1TlH0rahyfAt2Ok5J0pZO4UMMSRIogcgJh9
 FI2tGRgC//SEy3MVb/TGxsLK6kahOu3BPmkeZkUmHwUFIfkERsKMN+ZRszO4q6LyF8
 DRKgCORo7yHFban6Du/ieT/y1Bzi5WI+xhsOwX6zDdR5tvnVdyb2F/Vn+3fEQbT/Q1
 LUfN4eTq6DIdmmjvfZuHVgQHZVvizSHYxgmD6D/D36aELHM/cDPt6xDUQPxslOU0UE
 k0d+YW0B12Xew==
Date: Tue, 3 Dec 2024 10:58:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 krzk+dt@kernel.org, rfoss@kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de, algea.cao@rock-chips.com,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 conor+dt@kernel.org, vkoul@kernel.org, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 heiko@sntech.de
Subject: Re: [PATCH v1 07/10] dt-bindings: display: rockchip: Fix label name
 of hdptxphy for RK3588 HDMI TX Controller
Message-ID: <173324510682.1955832.14077962445640350158.robh@kernel.org>
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <20241127075157.856029-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127075157.856029-8-damon.ding@rock-chips.com>
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


On Wed, 27 Nov 2024 15:51:54 +0800, Damon Ding wrote:
> The hdptxphy is a combo transmit-PHY for HDMI2.1 TMDS Link, FRL Link, DP
> and eDP Link. Therefore, it is better to name it hdptxphy0 other than
> hdptxphy_hdmi0, which will be referenced by both hdmi0 and edp0 nodes.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

