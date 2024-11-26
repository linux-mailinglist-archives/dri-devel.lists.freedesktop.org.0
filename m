Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B794F9D9209
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 08:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8479910E0DA;
	Tue, 26 Nov 2024 07:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cB1i18XR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0248D10E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 07:01:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF5795C5CD2;
 Tue, 26 Nov 2024 07:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00088C4CECF;
 Tue, 26 Nov 2024 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732604496;
 bh=pnZXHU+pm2FOHMliUsr0+YCgaJf05DWVG2lDNbNCuig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cB1i18XR6w6irbGEd1ZTKwH7OIigDPHYg8Kq7GONOGgjSvHx9ED5Uy5IZAIVXiewU
 iT/FmiBEtqg27QvoY4/voafulDNNa8hgpMeram6kKnl8Lgzzn73f7ifqI3rWv6Qolc
 r77J9ny+nyejUCgpl54W+wInTm2eFv52l2qPXRXLytmXeq2F2cBp6xP0+VdQeZ+0TF
 NV3ms8WC66GumGf9xreRBkZrL2++LEctZTHQeRtj9KQX6S5fjLLeRAgypIRbJ07VE0
 j8Gzqk3LJXCV1ue+0StVHe5JtQ3U7guTatPqjINO7GlQ1Qr5rzBCZdqAmEzuBpfNyX
 2m+H9dmOlgNAA==
Date: Tue, 26 Nov 2024 08:01:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, 
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com, 
 dmitry.baryshkov@linaro.org
Subject: Re: [DO NOT MERGE PATCH v4 15/19] dt-bindings: firmware: imx: Add
 SCU controlled display pixel link nodes
Message-ID: <6rijytubyumhgvhlvzx3dtyfncknizs3iz7arhno2mjottyu33@subihom7khzl>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-16-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125093316.2357162-16-victor.liu@nxp.com>
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

On Mon, Nov 25, 2024 at 05:33:12PM +0800, Liu Ying wrote:
> Document SCU controlled display pixel link child nodes.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * No change.
> 
> v3:
> * No change.
> 
> v2:
> * New patch as needed by display controller subsystem device tree.

DO NOT MERGE means also do not review?

Your cover letter does not explain what you want here, except not
merging. Why posting things which should not be merged, without context?

I'll ignore this patch for now.

Best regards,
Krzysztof

