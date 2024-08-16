Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2A955368
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 00:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C1810E84D;
	Fri, 16 Aug 2024 22:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ni1WbB95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFC210E84D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 22:38:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8C27BCE1EFC;
 Fri, 16 Aug 2024 22:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D75C32782;
 Fri, 16 Aug 2024 22:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723847908;
 bh=Fjk1qhh8MhiVCg0maoWKTtUgd8BuOC//8pVyrOmXtIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ni1WbB956Qo8TD6hjwwrk9k+6YrtuO2dkesGFQxQLCgYgPnkAnP8me9WRPBdFkYVb
 elEVCbpG2IpUFiH9gOy+KM4198FDIKx6SlTjCMdKft04RYkqr0XPg3zjjt3y8VuTV+
 D/PU47mhdiHpjadj1eVctKE30UB8JWSKdPhTMI+om7ADAvP/hKr+fIfoZV++FF1vZ9
 D4fj/ujxmZc5bYMLbE3uxoRyNEfDnUWn+ow33chGavQAy6dgPdslNjTGQfv/Qcqt8/
 t1YvklfkdUIAXy2L/L+3TkKGzf1eWA3biJkGnGu/Bmfp+rDdEUgAqW0zybAVaLJF1J
 uaBZOXrP2T3tQ==
Date: Fri, 16 Aug 2024 16:38:27 -0600
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
Subject: Re: [PATCH v3 05/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller AXI performance counter
Message-ID: <20240816223827.GB2394350-robh@kernel.org>
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <20240724092950.752536-6-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724092950.752536-6-victor.liu@nxp.com>
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

On Wed, Jul 24, 2024 at 05:29:36PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller contains a AXI performance counter which allows
> measurement of average bandwidth and latency during operation.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch. (Rob)
> 
>  ...sl,imx8qxp-dc-axi-performance-counter.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
