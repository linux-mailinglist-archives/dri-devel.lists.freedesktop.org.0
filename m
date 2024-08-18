Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D09955CF3
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 16:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901D210E06B;
	Sun, 18 Aug 2024 14:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xq7IggzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7344510E06B
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 14:24:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 11D4BCE016A;
 Sun, 18 Aug 2024 14:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE5CC32786;
 Sun, 18 Aug 2024 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723991044;
 bh=p3xChge9ucTtWR9EXLrqY/hgcj62+4knZXEk2TA3eQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xq7IggzJZvSFhjmkhMAzVG4GSJYhuSulvTLRuDNrGl34WSAtAJG7Csa/WXtnTTOSq
 j12xW3EkfpjsteJm+igFb/YjxL6dWJA3/b3E7Y67Hat14V+YPKBGzYoHo1QaAtsbiZ
 ip6IIQwmlEYULQmKEPJipIET54djlSTzVySuYQlXP6c7VGwSvfyoo23x40ZNcAckJz
 pClhBJfTM2CMxEH13Xm2lALBccoY/NdzbJOgXnxL3/36o63I6B2sHXZJE+aw77prR/
 CMe/dKyvV6ZgGENkEvp+/3bKUtLvY1Cjd+WL9wctN44T7OiKf/NVzQ+9H4eOlWU4st
 zoqNPLiDa/Hqw==
Date: Sun, 18 Aug 2024 08:24:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: aisheng.dong@nxp.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 kishon@kernel.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, festevam@gmail.com,
 airlied@gmail.com, francesco@dolcini.it, kernel@pengutronix.de,
 conor+dt@kernel.org, s.hauer@pengutronix.de, agx@sigxcpu.org,
 shawnguo@kernel.org, frank.li@nxp.com,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, vkoul@kernel.org, mripard@kernel.org
Subject: Re: [PATCH v3 08/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
Message-ID: <172399104139.23572.10090663935384596561.robh@kernel.org>
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <20240724092950.752536-9-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724092950.752536-9-victor.liu@nxp.com>
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


On Wed, 24 Jul 2024 17:29:39 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller(DC) is comprised of three main components that
> include a blit engine for 2D graphics accelerations, display controller for
> display output processing, as well as a command sequencer.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * No change.
> 
> v2:
> * Drop fsl,dc-*-id DT properties from example. (Krzysztof)
> * Use generic pmu pattern property. (Krzysztof)
> 
>  .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 ++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

