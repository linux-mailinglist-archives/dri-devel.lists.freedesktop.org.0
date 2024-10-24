Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2976C9AF3CD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 22:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D8910E997;
	Thu, 24 Oct 2024 20:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CrSEeHgu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A47510E997
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 20:41:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 084B9A45828;
 Thu, 24 Oct 2024 20:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AB7C4CEC7;
 Thu, 24 Oct 2024 20:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729802476;
 bh=2wGqo08YvcqvbNlSwVnfD6yQbCsQjcfQ/VQ98bfcrx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CrSEeHgumaYEhfER/YsDnXgcdHp3i3LgTZVbJLGmhameDT/m6MZMR6QNtEAlb+JAg
 CEqfkOQlPDTgooTpLmPOIHAXNX1WTqWZ/bM4R8rSt1tDdX/4VxufjGd8QOdV+mX6Fi
 GpL/jPjJdFzGXZHldvH9uZGJu6Oix5TiqtXpYyzuVMY9IQmKZK02rkXUFAat9jSMKo
 c1ECzXBROcIPi1hZEAhX0wDiDaDcR48msq19vu3oaLnX1WJp1aWm8haMxGmi3KSFT1
 7iSx6OcCNr6z0wA3/FfTZxTCg//rRmNMNnDIQoSrexBW+lXhuk4uneBC6gy3N6D53I
 SRczsOrqWud3w==
Date: Thu, 24 Oct 2024 15:41:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-clk@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Ray Jui <rjui@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 07/37] dt-bindings: display: Add BCM2712 MOP bindings
Message-ID: <172980247555.1013633.6457539285768075938.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-7-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-7-1cc2d5594907@raspberrypi.com>
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


On Wed, 23 Oct 2024 17:50:04 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 has a MOP controller which is basically a new revision of
> the TXP.
> 
> Express that by adding a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

