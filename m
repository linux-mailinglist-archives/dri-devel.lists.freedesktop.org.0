Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E69396CE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 01:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEBF10E165;
	Mon, 22 Jul 2024 23:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GRHIZiUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF8710E165
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 23:06:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76DB860B94;
 Mon, 22 Jul 2024 23:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4E2C4AF0A;
 Mon, 22 Jul 2024 23:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721689589;
 bh=cC5eyWtTP19+7MNd7JmetoV2H8+x45FW1NUV40fuwgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GRHIZiUIVpBScGRm9xbLaUYGpJcDXoWRnV0M3ZsGI/g/HEID7Iw1+in0LjpYpLbF+
 nGdv8aSeztRhfOp/G751tSkgIw60t5W4bIinFFc/sgMXCwvXU+OoEW9B12juQhv9Zz
 dmR5yNCiPdjOm5Ml6Ec26FHWaKSJqCoNNk8WkWDwA+hBeguGZHPR1BNhHw6oPxE/wF
 xYHxvLjxGSuvsCPN4mWLY/GX35mBAcfjabgi9wX/jO3eF8USuiPIUrDHg2v5mzKNZy
 XpLGu0eExUL/St9Jn64YPUYLM7Puiw41FUNNObDuWm0CMGjFEyLrry4+8GC1ibXehL
 AIhdxpECb2RkA==
Date: Mon, 22 Jul 2024 17:06:23 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: francesco@dolcini.it, aisheng.dong@nxp.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 airlied@gmail.com, mripard@kernel.org, s.hauer@pengutronix.de,
 frank.li@nxp.com, kishon@kernel.org, agx@sigxcpu.org,
 maarten.lankhorst@linux.intel.com, tglx@linutronix.de,
 devicetree@vger.kernel.org, shawnguo@kernel.org, festevam@gmail.com,
 tzimmermann@suse.de, kernel@pengutronix.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, daniel@ffwll.ch
Subject: Re: [PATCH v2 04/16] dt-bindings: interrupt-controller: Add i.MX8qxp
 Display Controller interrupt controller
Message-ID: <172168958076.231033.5039687741098447913.robh@kernel.org>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-5-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712093243.2108456-5-victor.liu@nxp.com>
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


On Fri, 12 Jul 2024 17:32:31 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller has a built-in interrupt controller to support
> Enable/Status/Preset/Clear interrupt bit.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * Drop unneeded "|". (Krzysztof)
> 
>  .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++++++++++
>  1 file changed, 318 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

