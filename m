Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE600B04950
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 23:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5348010E4E9;
	Mon, 14 Jul 2025 21:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BvoMcceW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B9B10E4E9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 21:22:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED0ED5C65B6;
 Mon, 14 Jul 2025 21:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C3DC4CEED;
 Mon, 14 Jul 2025 21:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752528148;
 bh=XWvyEJu17/NYmt5lKHJpnUX0PIhb311yUkoU6DfI3wU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BvoMcceWv1Y6tF61U88roTUWlaNIqhWe/DqowtENh0zvk+4MWV1j3cMWFwYHttF/Y
 UuvxMs5JqKQDgeJqqv1PwxSNDnq+nobMH6BW91rOqgo+W9RaZfzlgy0xLQymd8wq/h
 OLtfnMf1xHtD3XVRiFBBMUUyByiryS60CL+gi0WSsucdf3JYGScxsO1d/SVXYZhO9u
 6pUzFqIrpBOgodGDqQ+shI8uUwNvx7rEF+BHh1tP3pBxlBZjCSfEkTwW1AQM+bXBKE
 eijRQ/V8mVvJSwur+UYSibH9tMi7VYjn56cipMASCVu/Mei73KqUlomr/26Gu6h0Jl
 0pOnmP1G58bGA==
Date: Mon, 14 Jul 2025 16:22:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Samuel Holland <samuel@sholland.or>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add Allwinner
 A523 compatible
Message-ID: <175252718830.3073791.16346905793933146110.robh@kernel.org>
References: <20250711035730.17507-1-iuncuim@gmail.com>
 <20250711035730.17507-2-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711035730.17507-2-iuncuim@gmail.com>
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


On Fri, 11 Jul 2025 11:57:27 +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Add a compatible for the Allwinner A523 SoC, with an integrated
> ARM Mali G57 MC1 (Valhall-JM) GPU.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

