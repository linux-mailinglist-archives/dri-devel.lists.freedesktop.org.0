Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5920A42D64
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5F810E35A;
	Mon, 24 Feb 2025 20:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j9WqobFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A651610E35A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:09:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E45BE5C3A57;
 Mon, 24 Feb 2025 20:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFD3C4CED6;
 Mon, 24 Feb 2025 20:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740427784;
 bh=YWblvzyL6cWwWDLx/Cb21hLUSZ83nNZh13vfA6xbIdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j9WqobFEmTEBiK03iSDs7rBWeNj2Enp3iOKbXMubwdCVqTH3nR7Z6Orq2THBIQCa6
 zIsqI2hSJvv8RohqUfpxeUDzAdGknsZ/+3W/kxe409xhPovrxLr7xHdy0waAMMWXju
 RfsTSuvr0gFY68ScJwgAX+qMUX14rPFUEJgRO9s1FhJAWAEq4w10TvVOObvqldia9d
 pb0Bqp/f8NaTDha2k/C71GuXPDL8M9JzTRflwH18Eh/RfsSLKyyKQS1hKwlFyF5VgM
 ak7+42bDdgp2CrkD7ZDEXBu/Gce+GuYtHiXIeEvjqdECRCr66UOZOV5wi6ezFKRVtv
 hzjlS8AA6+Tug==
Date: Mon, 24 Feb 2025 14:09:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andy.yan@rock-chips.com, boris.brezillon@collabora.com,
 cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
 andrzej.hajda@intel.com, conor+dt@kernel.org, hjc@rock-chips.com,
 linux-kernel@vger.kernel.org, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, jonas@kwiboo.se,
 sebastian.reichel@collabora.com, Laurent.pinchart@ideasonboard.com,
 jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, krzk+dt@kernel.org, dianders@chromium.org
Subject: Re: [PATCH v7 11/15] dt-bindings: display: rockchip: analogix-dp:
 Add support for RK3588
Message-ID: <174042778228.4021934.12821302542409218645.robh@kernel.org>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
 <20250224081325.96724-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224081325.96724-12-damon.ding@rock-chips.com>
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


On Mon, 24 Feb 2025 16:13:21 +0800, Damon Ding wrote:
> Compared with RK3288/RK3399, the HBR2 link rate support is the main
> improvement of RK3588 eDP TX controller, and there are also two
> independent eDP display interfaces on RK3588 Soc.
> 
> The newly added 'apb' reset is to ensure the APB bus of eDP controller
> works well on the RK3588 SoC.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the main defferences of the RK3588 eDP and the previous versions
>   in commit message
> 
> Changes in v3:
> - Expand the property clock-names, resets and reset-names
> 
> Changes in v4:
> - Remove 'spdif' clock which added in v3
> - Add the comment of newly added 'apb' reset in commit message
> 
> Changes in v5:
> - Put the differences between RK3288/RK3399 and RK3588 into 'allOf'
> 
> Changes in v6:
> - Keep the widest constraints and add only RK3588 related constraints
>   into 'allOf'
> 
> Changes in v7:
> - Fix the errors related to 'reset-names'
> - Remove unnecessary 'maxItems' under 'reset-names'
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

