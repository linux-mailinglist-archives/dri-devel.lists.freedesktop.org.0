Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC2FA72AE2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 08:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B3110E08A;
	Thu, 27 Mar 2025 07:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="erB0l3R7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4245310E08A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 07:56:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 178525C5419;
 Thu, 27 Mar 2025 07:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAEEC4CEDD;
 Thu, 27 Mar 2025 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743062199;
 bh=9MOdzY1W+VK84uZ8tY1V+cmmJLQHaZQN4UG+HUI98rQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=erB0l3R7EZDRT5tgRtDDgHuHvjoMgzFzVBPut/hNLKYULis63NkBUwQ8amwI1nSGY
 H+IAjZDBV2smrpYpmatjq595O6QZIhurrBae0x9QY/tSlZr09+uipP32v+6rcJpBnx
 uDqxnJkDADTBj+t0srgIwZQFsY/RD6LNfaACBx8+UXOrkbZ3I9RuzbYBr5gTWhWd3H
 ZZyb+TYdSqBaryp4F7vmgk65ssy/xGwpZ6de7mO+AN3QRyizHBhAg+mEpGJBB8Ht7Z
 NDrScMHw/vxq+NwIT2Ag9iiePE0AdMOiK3uZ4dkw/Ryz4U2EPxi9zRyaCEnIw3l73F
 3ADvX2kN/vvLg==
Date: Thu, 27 Mar 2025 08:56:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Alessio Belle <alessio.belle@imgtec.com>, 
 Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH v5 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20250327-beneficial-crouching-rottweiler-90d0e7@krzk-bin>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
 <20250326-sets-bxs-4-64-patch-v1-v5-2-e4c46e8280a9@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-2-e4c46e8280a9@imgtec.com>
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

On Wed, Mar 26, 2025 at 04:48:22PM +0000, Matt Coster wrote:
> Unlike AXE-1-16M, BXS-4-64 uses two power domains.
> 
> Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
> integration in the TI k3-j721s2.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

