Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A5BCBEBA1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C172410E605;
	Mon, 15 Dec 2025 15:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nDPtDi6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A667F10E605
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:46:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2E2F60158;
 Mon, 15 Dec 2025 15:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2B4C116B1;
 Mon, 15 Dec 2025 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765813574;
 bh=RBcP/eSO2QNmdalyQxiVfyGHG3izklUqdyBs1bazKGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nDPtDi6y6AReGXrwzZJU/MPynvSNnFn5P2VOXFwC3Q9DsyOxbJ4JcLQ73AC6qQgiM
 RP2AdeMar9cJeS2YDWlNJMkECGX6sdIX2XPNRXldvL3HcOISkbsc5GGD87quvhyUKa
 +MIaCU9wQumdmwhmraFETLzSMIyOQmJHoCV9ILIT0FyQCnm0GVdpNDCRIxvaIsMuYx
 EZJqvmAEzQvWYzkTPf3Hff2OvEPkNTQ/CuFuC3AUAII53L3G16SPofInDiAwlOxNrq
 6xL/7RrJda1tfFINlnHJJwHBkK7wTqOSq1SY9DmtxHXXxJpkY1sqNCol7w4LbM84hw
 W7+yEkobgRV1A==
Date: Mon, 15 Dec 2025 15:46:07 +0000
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dharma.b@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: Re: [PATCH 2/2] drm: atmel-hlcdc: add LCD controller layer
 definition for sama7d65
Message-ID: <20251215154607.GE9275@google.com>
References: <20251215090639.346288-1-manikandan.m@microchip.com>
 <20251215090639.346288-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215090639.346288-2-manikandan.m@microchip.com>
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

On Mon, 15 Dec 2025, Manikandan Muralidharan wrote:

> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add the LCD controller layer definition and atmel_hlcdc_of_match
> entry for sama7d65.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 81 ++++++++++++++++++++

>  drivers/mfd/atmel-hlcdc.c                    |  1 +

Please separate this into its own patch.

>  2 files changed, 82 insertions(+)

-- 
Lee Jones [李琼斯]
