Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA49AF3D3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 22:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDCE10E3B8;
	Thu, 24 Oct 2024 20:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G8vXDmco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3129F10E3B8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 20:41:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE7625C57C2;
 Thu, 24 Oct 2024 20:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08A8C4CEC7;
 Thu, 24 Oct 2024 20:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729802495;
 bh=2DFjeejvSg1/g8YEFkWGIl9SUrFAuPI0K/9R2+B0tbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G8vXDmcopDAg+E6IfwWfxt1SIi2OTrV+p57757L56J6DkFbVeASNzKsKhgbKtVMR+
 m4FKkc6IoNmfyY4eoY830QK2WvC/1QV4hHcVfH++XYiy3yIsslT3e3VpANdo8YoyEr
 gd5OnOjtpOGjEQy1akqGvger/7vuEbbFGryxT/8uikHxKosd9V1f28Yc/EF3wf4r4K
 pTWRIjm8aynFXwoszlvKl81h+ii9bGjFQc509GWr5VCMYT8uMc9P0TfIyeorO0WKkK
 LE5FxJ4J+9E3cnmu5qK8vOfsaVYyDtqyUYcgdpGGvzcmWglnHHI0R6i8/PNqGWvFLX
 aRdDlFd3jc+jw==
Date: Thu, 24 Oct 2024 15:41:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org, Scott Branden <sbranden@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 08/37] dt-bindings: display: Add BCM2712 MOPLET bindings
Message-ID: <172980249374.1014064.8269086234792348096.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-8-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-8-1cc2d5594907@raspberrypi.com>
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


On Wed, 23 Oct 2024 17:50:05 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 has a MOPLET controller which is basically a TXP without the
> transpose feature.
> 
> Express that by adding a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

