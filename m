Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC09AF3C3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 22:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C8110E3B4;
	Thu, 24 Oct 2024 20:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xzgqw8iV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5FF10E3B4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 20:39:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B3EBE5C5523;
 Thu, 24 Oct 2024 20:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D80C4CEC7;
 Thu, 24 Oct 2024 20:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729802386;
 bh=fu1NI55gqVY8lwDobFa1EKGS2z61s5XU7//5aqHBG3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xzgqw8iVGQU0dI3OeuHLmVLmbJ/SEFjLNv6oxbdrHizj2AZDaCc3n9Vn4SxbyTUrs
 T/qy1UKhHCnIdwOhjTrPnsCybxcQq7KfQ3XRLHHgCqjParoNauu523K51H21HrnyfN
 HqJWMrzazZJfXjP4kM65OpfLBnBh9G8Do+HPWQ8qvqwsaxwqQXRjajFWwJIVj25PJf
 S0duQysEtoqfpsCtOVRENsl9UybhyIS7YTliJcp6o81yrtGbcmiGMQwiAyDU0VywTY
 QB4HlPDkRK68GrQc+X5pk5MZEzX0UTvfHpKSBfFDzZuq1+QJkGZuHBbI9ST696kQQJ
 YPksUDIai5H6w==
Date: Thu, 24 Oct 2024 15:39:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>,
 Stephen Boyd <sboyd@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/37] dt-bindings: display: Add BCM2712 HDMI bindings
Message-ID: <172980238460.1011654.10730669025533473709.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-4-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-4-1cc2d5594907@raspberrypi.com>
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


On Wed, 23 Oct 2024 17:50:01 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 HDMI controller uses a slightly different HDMI controller
> than the BCM2711, and a completely different PHY.
> 
> Let's introduce a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

