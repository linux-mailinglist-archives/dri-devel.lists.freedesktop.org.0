Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E6495536B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 00:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F2510E84E;
	Fri, 16 Aug 2024 22:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="drt0e7SJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEF310E84E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 22:39:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE418622FA;
 Fri, 16 Aug 2024 22:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAC1C32782;
 Fri, 16 Aug 2024 22:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723847998;
 bh=yLgBm9EHFdqhhjPZ0xAEPGSJiVwgSWNa0lcI/kftets=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=drt0e7SJlXPXlA5dgoJrHp/EE6nyWURgh3JHxpgb3xvT7uRmoe2zziG2njkn2Obcx
 P1jWxlq/Z/NbE8rNjwIzmworTxqMWk48ZFT2EZ9FF5vmAirX8Tg1MFUfV6e2FcFyHD
 FbIWKcl6cdSSz5kwxbrFjJadhLYGvZKCCU5bZ4faHRp02Tz9oFKNkzE/a9XQBC1NVo
 NqUNd6WOu4KaDu0bHzQU1/cha920gSrChM+k9GHvgP3DLqd8kWXFROosgadTWRLD+d
 oCRLWdN5t3dGxJprHRVdgtAY6DIOEIg4LLPE5FJLBKMqZNtZjLpyQZ5NCrkGgwFlJM
 Tz+YKhKeAsiHg==
Date: Fri, 16 Aug 2024 16:39:57 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v3 04/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller pixel engine
Message-ID: <20240816223957.GC2394350-robh@kernel.org>
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <20240724092950.752536-5-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724092950.752536-5-victor.liu@nxp.com>
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

On Wed, Jul 24, 2024 at 05:29:35PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing units
> that operate in the AXI bus clock domain.  Command sequencer and interrupt
> controller of the Display Controller work with AXI bus clock, but they are
> not in pixel engine.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * No change.
> 
> v2:
> * Drop fsl,dc-*-id DT properties from example. (Krzysztof)
> * Fix register range sizes in example.
> 
>  .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++++++++++++
>  1 file changed, 250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
