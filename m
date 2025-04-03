Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D91A79C12
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 08:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3513510E208;
	Thu,  3 Apr 2025 06:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ic7VPpVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D072A10E208
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 06:35:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C0EB75C64E5;
 Thu,  3 Apr 2025 06:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776B1C4CEE3;
 Thu,  3 Apr 2025 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743662096;
 bh=qRM3eG6gqLVGutDjiR2oQQ4su3EUaT75uA7KTA4luMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ic7VPpVbqDl+foe4m6vFPehXrEaNTdi6Fn3uQKFgASy7+TZXiOAWo9cHZLLtV2uQ4
 U6A0a4ir7DbesULikeqlrXDugQQXaPnY9xf+mtJfIIlKZsI9HY1+lKnj9jTnKNup3h
 VISQvK+3JPQzvfUtXTZsZSKlHwOndyyQSxNpUU12qFn891JZOisLp5HkLUalRF4JP7
 L/9EeEkAB9SApAhYYQpaHOlHCTZfpHs1LUgUqfJXAXcSjQGn0mts8WiQoEmnJwoQ7x
 NJA9ZmIbnTiFWBfGN2ujLCTXwg4pufVuK1BAWXNz8sD8vSkSf6v2BE7ZKJa6gxkeK1
 /oN04mr+AN4CQ==
Date: Thu, 3 Apr 2025 08:34:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, hjc@rock-chips.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: display: rockchip,inno-hdmi:
 Document GRF for RK3036 HDMI
Message-ID: <20250403-first-dandelion-orca-ed9bbe@krzk-bin>
References: <20250402123150.238234-1-andyshrk@163.com>
 <20250402123150.238234-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402123150.238234-3-andyshrk@163.com>
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

On Wed, Apr 02, 2025 at 08:31:36PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> HDMI on RK3036 use GRF control the HSYNC/VSYNC polarity, but this part
> is missing when it first landing upstream.
> 
> Document that it is mandatory for RK3036 HDMI.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - First included in v2

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

