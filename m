Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F337AA2E87B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 11:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F2610E0F1;
	Mon, 10 Feb 2025 10:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cx/wuaXV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203E110E0F1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:03:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ECCB35C49B0;
 Mon, 10 Feb 2025 10:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CA7C4CEE5;
 Mon, 10 Feb 2025 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739181802;
 bh=3qI78dSTgjezorW3Ya+Br1RW/kymvh01hDyW5ZpBCgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cx/wuaXVFgPCx8jZ1bW4nazcSY5RlQYySWTJXTltFkV/5ld9k/js6nMZXzZg4YMrg
 /ivsmp2fHYGxN/+Etk2N+cLEtyfw43A+6I6xtIRJwNqeV5kCGisyM5UnSJJqiLzdxe
 RCYms7WiGR+lHK01AiNNOYd73PCXyTvFTKTCRh8hS63HszDc62+LnrgbjogHawTTMj
 GfbN3hX1w9vozO/hjXbIn1EIWJV+ctbSs6t4MOv0JdRFg6zpRKlWchtxp61pSXKHLj
 7dAVCVYMExThWFQuP0vzYWSnSUlhHxGUnzgOQ0EyEFFnYR7OTp/Fte117dHT+6wojt
 evupnaYZH69JA==
Date: Mon, 10 Feb 2025 11:03:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 11/13] dt-bindings: display: vop2: Add missing
 rockchip,grf property for rk3566/8
Message-ID: <20250210-vermilion-bittern-of-diversity-cd4ef9@krzk-bin>
References: <20250206064457.11396-1-andyshrk@163.com>
 <20250206064552.11466-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206064552.11466-1-andyshrk@163.com>
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

On Thu, Feb 06, 2025 at 02:45:48PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The clock polarity of RGB signal output is controlled by GRF, this
> property is already being used in the current device tree, but
> forgot to describe it as a required property in the binding file.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

