Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F09DAA55
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A1A10E0F5;
	Wed, 27 Nov 2024 15:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ept6l6sl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F3B10E0F5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 15:05:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5CAD5C3A6D;
 Wed, 27 Nov 2024 15:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25E8C4CED3;
 Wed, 27 Nov 2024 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732719933;
 bh=sB5WsF2yTtwAJZFMBi4Ub30MJ2hXC4QT4NG4uzLcRRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ept6l6slC82V06hpuS5FuclQ4x/1Oo7ci31otvDJKT8wxxgrFr+TrYAC6SwVz7cfw
 BTpUnHj15/vdehiZspar722ryFF4mXbbuCt7B7iYEEG/ONglHHnya1lhfZh66c9paQ
 d80g1Tf4C3vjhBpdlBJIgs/4/BWbZUCbJffNNwUxCIA1G2//4kcw2fJpGwFsO8I+ht
 RLKa4KxposzT9J6o+xR6nR2RHUbjYfCairL/JawkR7ruhhycSGgfGwBRZrKSX8iRXh
 SU3PiZat6A0VKGvQ5bjVIBLXvZGisz2uChmgk89ABMHwSY4FO2uLkSOADd1cmOjvao
 yZdAXShismNyA==
Date: Wed, 27 Nov 2024 09:05:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: rfoss@kernel.org, neil.armstrong@linaro.org, quentin.schulz@cherry.de,
 maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, Laurent.pinchart@ideasonboard.com,
 linux-rockchip@lists.infradead.org, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, Heiko Stuebner <heiko.stuebner@cherry.de>,
 andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: display: rockchip: Add schema for
 RK3588 DW DSI2 controller
Message-ID: <173271993052.3509811.7014863879823500729.robh@kernel.org>
References: <20241126201213.522753-1-heiko@sntech.de>
 <20241126201213.522753-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126201213.522753-3-heiko@sntech.de>
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


On Tue, 26 Nov 2024 21:12:12 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The RK3588 implements this
> specification in its two MIPI DSI-2 Host Controllers that are based on a
> new Synopsis IP.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

