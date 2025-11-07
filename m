Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81645C3ED3A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 08:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7FB10E055;
	Fri,  7 Nov 2025 07:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MIH4cW3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4953110E055
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 07:54:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9CEB86190B;
 Fri,  7 Nov 2025 07:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82EAC116C6;
 Fri,  7 Nov 2025 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762502072;
 bh=3t8OmQN+HWYwvBz12hbfBvBSJ0jdJVm7jFSV6g0Km68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MIH4cW3M/RQ8AdoJIJenlu9nKammXIewaPCtUDKifyrThHEXQ5kSlXxi2GPaClpZR
 jGykLAz3i530vApg7DV/VcBCCHArXeSWdN8xIeTBy8gdoyZVQirlaQBoNhW3gwIZKV
 S+eYCI+vxJlSUacb5MojnsnSYSJOr5Hs7fSkT/+35r/zINWl1Mh9GlYFl+2IHfYLXz
 eCYEqtpNNFEj3PHG3R+VboKSowfbKxLvUHUUPurABTZTg/Xk2jmFE01WhYb2J2gsVR
 dvjO1AxDgcOyzZmzxtdCqFkEC7rK26FyYAWlUxIe7PUBU/6v+ecxH7FuFLcQwrMQ8x
 ASUUGtzDbOsKg==
Date: Fri, 7 Nov 2025 08:54:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 louis.chauvet@bootlin.com, 
 aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/5] dt-bindings: display: ti,am65x-dss: Add
 clk property for data edge synchronization
Message-ID: <20251107-amaranth-platypus-from-betelgeuse-7673b9@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-2-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-2-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:23PM +0530, Swamil Jain wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> The dt-bindings for the display, specifically ti,am65x-dss, need to
> include a clock property for data edge synchronization. The current

clock properties are called "clocks". Please rephrase commit msg or use
proper clocks to indicate you access here a clock (if that's the case).

> implementation does not correctly apply the data edge sampling property.

Where is "data edge sampling property"? I do not see it in this binding.

> 
> To address this, synchronization of writes to two different registers is

How this binding achieves that "synchronization"? What are you even
describing here?

> required: one in the TIDSS IP (which is already described in the tidss
> node) and one is in the Memory Mapped Control Register Modules.
> 
> As the Memory Mapped Control Register Modules is located in a different

And now another therm - MMCR...

This commit msg is barely parseable - language is correct but it is a
mix of completely wrong terms.

In case you used LLM to write this - don't. Ever.

> IP, we need to use a phandle to write values in its registers.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")

You still did not describe the actual bug being fixed here.

> Cc: stable@vger.kernel.org

Best regards,
Krzysztof

