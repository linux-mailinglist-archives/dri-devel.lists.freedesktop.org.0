Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933DAA79C3A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 08:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2745310E21A;
	Thu,  3 Apr 2025 06:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qgce0Ewg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75BD10E21A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 06:42:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E31F768424;
 Thu,  3 Apr 2025 06:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC26CC4CEE3;
 Thu,  3 Apr 2025 06:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743662544;
 bh=Mm5UvShqJfS6Bo3gBY57Tk/+isrXqZzI84v5T2TgGyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qgce0Ewgkd+Cumb5f6U4T1HhR7WHTnXMeJrlK6+7f+dxtNnJnHGzn4rG1Mh0jfzKG
 GYtkJizV2zO7Q72uwCvGV+9tZ7MjW203gozPMAbCeIkZnsgByXUV8z2r4qJ1sEcryJ
 0RX3uL8ze5r0AjY4Ymw5pMLgaJum8G4C9JgeHAZwZMjMg60yGnZf9DZiVvrnA2uncK
 TTDMv92scWRTufXVLVNFCgXkbUkZZHANAES+VwsOK7DGMrgpmPDjadzPqVXME1DnVt
 96T/3vhXiBiJsHJydOyNmnrUJcYxXPYniJ1sxotmez8xtYriIU6Ck4lRHhZfRByenT
 hz65jzoVWTjgg==
Date: Thu, 3 Apr 2025 08:42:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, heiko@sntech.de, hjc@rock-chips.com, 
 mripard@kernel.org, naoki@radxa.com, stephen@radxa.com, 
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, 
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, 
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: display: simple-bridge: Add ra620
 compatible
Message-ID: <20250403-big-hog-from-ganymede-6aa617@krzk-bin>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-5-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403033748.245007-5-andyshrk@163.com>
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

On Thu, Apr 03, 2025 at 11:37:32AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> RA620 is a DP to HDMI bridge converter from RADXA, which first
> found be used on ROCK 5 ITX.
> 
> This chip can be used without involving software.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - First introduced in this version.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

