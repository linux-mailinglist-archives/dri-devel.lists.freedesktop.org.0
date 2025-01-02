Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E569FF6AF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 08:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB3310E306;
	Thu,  2 Jan 2025 07:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lL4vnxZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FEF10E306
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 07:58:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 90075A40100;
 Thu,  2 Jan 2025 07:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588C4C4CED0;
 Thu,  2 Jan 2025 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735804694;
 bh=gnlg1iwRA44t0Q9m776Cc0idy3V/9d7L0QBK8wPFtfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lL4vnxZ/baQURW31Bb0YBJziu0sFojruCSFEM/FqDDifOw8IHAvPPWs+Zs20M87uk
 /ECz7UP4LZd7TSLaqPLNc8yYG3QfJXFLOQTHSWimMC6rUsyklQRXW5KoWABMtVJl97
 tspPWDjaqE9peupnQdAPpIdMcScVEqx6R//8AMRPtF/qvk2U+1mf4u4w3vzVrQkYaC
 /pGclTGyDhwm8iqxMyNmLNxr5iLayZzwBAPtgLBShUyfuZY4XwLrtN+xB8XspUtv7M
 kEv96pw4/O3h9jo6Dd4GV+RLxRnhJph0y9Cu5XR6FP70l/uGx3ORHcsTzrplky5YI/
 Rve/tqri1/Xyg==
Date: Thu, 2 Jan 2025 08:58:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, 
 mripard@kernel.org, hjc@rock-chips.com, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: rockchip: Add support for
 RK3576 HDMI TX Controller
Message-ID: <zz5exgmftibayrh7vjfoq6z32xf2bm3ibejb6rc5xpqslejaab@ex4tj5am4hhk>
References: <20241225103741.364597-1-andyshrk@163.com>
 <20241225103741.364597-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241225103741.364597-3-andyshrk@163.com>
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

On Wed, Dec 25, 2024 at 06:37:30PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> RK3576 HDMI TX Controller is very similar to that of RK3588, but with some
> control bits for IO and interrupts status scattered across different GRF.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

