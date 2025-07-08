Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF4AAFD7EA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 22:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438A710E1D1;
	Tue,  8 Jul 2025 20:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IfgBvxJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F87710E1D1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 20:10:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B7E786112E;
 Tue,  8 Jul 2025 20:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36164C4CEED;
 Tue,  8 Jul 2025 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752005404;
 bh=ku8L98emvYfIz4KPutlqA+m9OYjVsmlwLx2UjJrAYKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IfgBvxJrGxsZR5xYwilNvEoJfRN3Bh0FtmvTXJ3vipPzA7HmlrqkVHD8Wdyf8pyer
 YqLQlLGQwahwyhNPrFb2a7ku9wh+7fvUUjSEwlyq5rlZdDoaqFJW8LAsf7nzEsY8GO
 4uKVJqrc9MM16llgqXaNZy3Iz6hpTMma8ykcHTIMnshnweFeoQyW5cB9tFrMhNLXd9
 NYs4j8xWouuv5h0+weX7gwkS9hU1poagWDZB631nCit1Hpyk6PACUPoh6Qtvb2FRSJ
 53cNnOotNo/Q8dUqEuTBhZ8yeqe5orammUyInVm6dt5363qKvFh8cN2hEz4VOk84NR
 ZyhB9kzoKR2LQ==
Date: Tue, 8 Jul 2025 15:10:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: tzimmermann@suse.de, nicolas.frattaroli@collabora.com,
 hjc@rock-chips.com, maarten.lankhorst@linux.intel.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, andyshrk@163.com,
 quic_jesszhan@quicinc.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, neil.armstrong@linaro.org,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 mripard@kernel.org
Subject: Re: [PATCH 08/13] dt-bindings: display: rockchip: Add rk3576 to
 RK3588 DW DSI2 controller schema
Message-ID: <175200540168.891369.12402940753218880108.robh@kernel.org>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-9-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707164906.1445288-9-heiko@sntech.de>
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


On Mon, 07 Jul 2025 18:49:01 +0200, Heiko Stuebner wrote:
> The rk3576 controller is based on the same newer Synopsis IP as the one
> found in the rk3588.
> 
> Its external setting bits in the GRF are different though, so it needs
> its own distinct compatible.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

