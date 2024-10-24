Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C549AE9E0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB93710E95F;
	Thu, 24 Oct 2024 15:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZvPDyC2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21A710E960
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:09:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9F5725C6037;
 Thu, 24 Oct 2024 15:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB4EC4CEE4;
 Thu, 24 Oct 2024 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729782578;
 bh=GIiZShzCqbp99Okh9K2VfkZMwriJp7KN0xaKA+283IY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ZvPDyC2Un38oYBtXvX62d7ZiTOxbZfyC6ow/5abzyjUw3l5wdjqrX+maMLCxsR4Hd
 sRNWXU9EdpeaIeGxfMMwYLRbm6VNHAJRUeD2vf5/cGiA2Y8ZpvTLygF1N71EpJJ2CY
 5W84akyxhzpMGZY0Eulx8m+WnlIKA8CZUqE3GBza5Pi9rhTYPkJjG55F7QSngHM5NI
 mfuVjIqjRpjLYkSR11vOuiePNEjHfHfr2GW6ABT8jDV0nb+Vu0pzBiOYA6aukTXLVo
 9hcGC22txWIX0M1ttV5FEfeQjBKTvB/aE4IhyePcahWN12A1RaQarZy/1z65AQNd81
 tTLlgpCR2iyuQ==
Message-ID: <66e7319a4805b42af2b2a4a20dc8faa9@kernel.org>
Date: Thu, 24 Oct 2024 15:09:36 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 26/37] drm/vc4: hdmi: Support 2712 D-step register map
In-Reply-To: <20241023-drm-vc4-2712-support-v1-26-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-26-1cc2d5594907@raspberrypi.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "David
 Airlie" <airlied@gmail.com>, "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Ray Jui" <rjui@broadcom.com>, "Rob
 Herring" <robh@kernel.org>, "Scott Branden" <sbranden@broadcom.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Will Deacon" <will@kernel.org>
Content-Transfer-Encoding: 7bit
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

On Wed, 23 Oct 2024 17:50:23 +0100, Dave Stevenson wrote:
> The D-step has increased FIFO sizes of the MAI_THR blocks,
> resulting in changes to the register masking. Add support for
> it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
