Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AA79AF3C5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 22:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EED10E3BD;
	Thu, 24 Oct 2024 20:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cBZVXSmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FE510E3BD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 20:40:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7143DA456C1;
 Thu, 24 Oct 2024 20:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EFBC4CEC7;
 Thu, 24 Oct 2024 20:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729802438;
 bh=X5N77Rrxi4T/tH4H721m+E/6JRcxmNxBwaisxQYuV0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBZVXSmQecnpNoesTgGk48A0ZJBBDRZnqtcfGptGRPQUL5PoNy+Z/W5XIYVQIViys
 GMIUOs3CIht4iQBKxF9qvuN40GrPbrRaewQdib1IE7H+lVyAlO6OFHi0kTxA7GjHSl
 hwoN81yXgLgorvQj34+XffNfAOoo/e2+WAj6OwkMWwpFmnip9r+mQbH6XZypFHhme2
 ZVa2DCcWLsPoHxKJRYoa6cUwYCx1iZV92pbcBlbciHuuvHrj68D28bfUaYMH2WTpDM
 Z8PQUZER5Dqdf+2+8slEF80cZRllolc1HZ8ku6kTvP0eusDr6QBido6DH1QaGvdrxn
 ohwdWQ1/yVz0Q==
Date: Thu, 24 Oct 2024 15:40:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 linux-clk@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Will Deacon <will@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 05/37] dt-bindings: display: Add BCM2712 HVS bindings
Message-ID: <172980243679.1012695.11368075486894894542.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-5-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-5-1cc2d5594907@raspberrypi.com>
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


On Wed, 23 Oct 2024 17:50:02 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 has a completely different HVS than the previous
> generations, so let's add a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

