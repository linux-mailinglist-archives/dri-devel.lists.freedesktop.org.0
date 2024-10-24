Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E969AF3CA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 22:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F1C10E3BF;
	Thu, 24 Oct 2024 20:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sEJE8izB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E1610E3BF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 20:41:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 70CBEA45825;
 Thu, 24 Oct 2024 20:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CF7C4CEC7;
 Thu, 24 Oct 2024 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729802459;
 bh=mMLwDduZ3xaKPZLGXPUhMR7+mEPMB7iB0xxVnV3jIAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sEJE8izBJ+cP82Efa7daFEyfmBgH8QvXEHr6eQ3e+5/ZURby2Zdg1uv4iK05E7/Zm
 vpQboJImDbckilahc63B+vU8c75+KdIId4vZWDuFoMIoptGO5iHs/GVX3WMFCru76o
 aNCuJVRliOZ9DDYRCfTqQwkN6s5SJhTtP0BWk0coYUxbKWgH4AN1HekU6hNZBePpUs
 UIOMggTnoSPxtV8wLbnlPyU6JgO9QyIYK7ROez3Ng4s83KCIvVawXGn3OKEoGrOgAh
 xVeWve4B3YNLDlD4G0J53rSmJbfdr6iFX5e7I5YniyOVWMcUmwr8CWw1HJSg9lzqz/
 xbPoiSIRV0wFQ==
Date: Thu, 24 Oct 2024 15:40:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 linux-rpi-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 dri-devel@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 06/37] dt-bindings: display: Add BCM2712 PixelValve
 bindings
Message-ID: <172980245756.1013194.11978023436348943569.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-6-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-6-1cc2d5594907@raspberrypi.com>
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


On Wed, 23 Oct 2024 17:50:03 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 has 3 different pixelvalves that are similar to the ones
> found in the previous generations but with slightly different
> capabilities.
> 
> Express that using a new set of compatibles.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

