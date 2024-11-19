Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407029D2C43
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 18:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3CA10E034;
	Tue, 19 Nov 2024 17:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mFkNmuFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3E310E034
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 17:15:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 34EBE5C551B;
 Tue, 19 Nov 2024 17:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A576AC4CECF;
 Tue, 19 Nov 2024 17:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732036499;
 bh=GN8+TZ7dF+OVIe4W1EKDcGDnhm2IukYPViQYE4iYxxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mFkNmuFI0VPYtiVbAwXPrbGkTuTUbPU6g9oXTqPo6Unhg+izBDfYIR4zM3nkFGI1k
 oOxQL0b5JS3pJjPUiOjTrjYWA2LhN6xCyZYG2TZVtBzk08qRTJM0kJhbVJFuLT+VW/
 TbQmcC8SQGV4WUvDYF6C76olltJCaKuhUdRU6eyQk3iiOFpM4i+xYfMVLKPrr1JBk1
 S6/0JvVCpvknj1HblDsNHhUpBKeWvNX/SUyXyROAFV6tuaA2b25rdu9Im3V+XdZ+xt
 GSV3+QDX00RH+S8AdpGtW6W0XHTOBzM5+xJt7+kqMmhoHHX1k5Tkh3vfidy5b+PNTa
 KhiQvZ+qcSIcA==
Date: Tue, 19 Nov 2024 11:14:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 kernel@collabora.com, Sandy Huang <hjc@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/5] dt-bindings: display: vop2: Add optional PLL clock
 properties
Message-ID: <173203649757.1839089.16877007589155949446.robh@kernel.org>
References: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
 <20241116-vop2-hdmi0-disp-modes-v1-1-2bca51db4898@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116-vop2-hdmi0-disp-modes-v1-1-2bca51db4898@collabora.com>
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


On Sat, 16 Nov 2024 20:22:32 +0200, Cristian Ciocaltea wrote:
> On RK3588, HDMI PHY PLL can be used as an alternative and more accurate
> pixel clock source for VOP2 video ports 0, 1 and 2.
> 
> Document the optional PLL clock properties corresponding to the two HDMI
> PHYs available on the SoC.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

