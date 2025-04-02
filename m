Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D0A789CD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 10:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8B110E6E2;
	Wed,  2 Apr 2025 08:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j+rKbt4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B3E10E6E2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 08:28:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 99EA961145;
 Wed,  2 Apr 2025 08:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2AEC4CEE5;
 Wed,  2 Apr 2025 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743582503;
 bh=AxDNNMZJCuIzgSEb/lxlToXjKumuqj6WXPlR2NT09I4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j+rKbt4fDfq0taKoNa1fnbEnb6Fwlh8WKOxXrfE30NjnAbH4N86gQLXQ5Io81xblV
 ASKGdfE32usra1zAPoVRDPM37ui3XHQlhm8xpEJEyTuWGZokvc9cig4I0Cy24TKrs6
 nIHwd5hEh+MiJ+k4aNZ68mizpuA5xf+/P6WDfD4bVaf+6Rg3Hwowf+eSm0inVwC0OC
 Towx3EnNi4NFX7rLIpQo6eTKO+AibF9OwUocdOjjGj3BSu0H/vTP581se3qWbLm2i4
 xJ3xOMutes+wxGY0yMOZa9XyIKyoCvgZhzXr6EbFTZwFcorrsQBmJsx/4NmPjkivwv
 Wo5wdJ5pizIIw==
Date: Wed, 2 Apr 2025 10:28:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] MAINTAINERS: add antry for Sitronix ST7571 LCD
 controller
Message-ID: <20250402-gabby-orthodox-numbat-ebf605@krzk-bin>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-3-351d6b9eeb4a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402-st7571-v1-3-351d6b9eeb4a@gmail.com>
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

On Wed, Apr 02, 2025 at 08:12:12AM +0200, Marcus Folkesson wrote:
> Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
> controller.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..00d19d45679f6d18a7e9c9e619b7642176b7ef95 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7572,6 +7572,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
>  F:	drivers/gpu/drm/tiny/st7586.c
>  
> +DRM DRIVER FOR SITRONIX ST7571 PANELS
> +M:	Marcus Folkesson <marcus.folkesson@gmail.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc

Are you one of the maintainers and do you actually push there? If not,
drop.

Best regards,
Krzysztof

