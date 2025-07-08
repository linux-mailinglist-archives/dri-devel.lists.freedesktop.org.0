Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C9AFD7D9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 22:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E7210E1CE;
	Tue,  8 Jul 2025 20:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g4N5WICr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CB110E1CE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 20:06:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F22B55C6417;
 Tue,  8 Jul 2025 20:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F494C4CEED;
 Tue,  8 Jul 2025 20:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752005186;
 bh=HDLqHrKZ1e4Ds5mIXoKkXDCqyY7kRwjcE9DFq6MMAn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g4N5WICrmD6zSglt9NfiMB8vGGcYz+8jPoBYBSGZZASLbORLSJDj8OJzZUlOSSyBb
 NG1/gudwdTanb53TJTrol3rriN3nGKwhu2X0yqBlblsbVq9M4a9gbcPO0XtTWmTqub
 GXD517dKtNBixH3zqsm/juSs6ut5tOqKIYiRCHWr/sW04jEM2RvzW2GTYU80Iytfd2
 7KmwiMseUVP4ROtQUU8T1c8SV40Fd/Tp7QUCkfHuS19gpuVpRddMT+DV+KQzAXRGLL
 tBg0+9fBh6yXeipd7pnPO7Yoh/IFYEfwrl1a8iSoXs2UBTgzNOjqpY1d2pp5tId4MV
 gQugYxuETyzwQ==
Date: Tue, 8 Jul 2025 15:06:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, krzk+dt@kernel.org, hjc@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, andyshrk@163.com,
 tzimmermann@suse.de, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, neil.armstrong@linaro.org,
 linux-rockchip@lists.infradead.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nicolas.frattaroli@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: Re: [PATCH 07/13] dt-bindings: soc: rockchip: add rk3576 mipi dcphy
 syscon
Message-ID: <175200518482.886634.10939442043560095261.robh@kernel.org>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-8-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707164906.1445288-8-heiko@sntech.de>
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


On Mon, 07 Jul 2025 18:49:00 +0200, Heiko Stuebner wrote:
> RK3576 CSI and DSI support requires the GRF for its DC-PHY.
> The "general register files" provide additional setting-bits
> outside the regular ip-block reg-space.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

