Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A599D9EE0C9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB1A10E1C9;
	Thu, 12 Dec 2024 08:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FHI+2dRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7AE10E1C9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:02:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B95A5C6782;
 Thu, 12 Dec 2024 08:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F65CC4CECE;
 Thu, 12 Dec 2024 08:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733990567;
 bh=buq2YfDCNnqDDY4VdlNh9UeBIdPGX2vT8DdJKHmmo+4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=FHI+2dRVceqzA7+ClviUj8W8iC6LRGzm8ssbFU1dyWdSKl3ECY/lmoWMpGCkzZntz
 2aS0F4PPDM9B9uyF/0mXHCTsoiayweGFTMPMoCmCfIaAaexhHuylEXX8h1EdQgLugI
 BQqX43R9L1NGfRPylatrJBKhQhyVJssJvI31PSSQyTL3wFysVHgJJjRA2iIIHyndjy
 BmCBowcbMq7h0sT8UYGTcb6/EKwlaLfML0ax0ydV4ra1BNyKxQIFiU3lMcV9ximzAF
 /OYrk0lmuZnPNNrHYjMFRt+aFLY1Tw+GI8RGH7KImIMKagHXuk+0LwJNOgaT0FLUW5
 mvbcE166qJrUw==
Message-ID: <f5e1154a6a3a60856553716cdb8f6fd2@kernel.org>
Date: Thu, 12 Dec 2024 08:02:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
In-Reply-To: <20241209033923.3009629-11-victor.liu@nxp.com>
References: <20241209033923.3009629-11-victor.liu@nxp.com>
Cc: agx@sigxcpu.org, airlied@gmail.com, aisheng.dong@nxp.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com, francesco@dolcini.it,
 frank.li@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de,
 kishon@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 tglx@linutronix.de, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
 vkoul@kernel.org, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
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

On Mon, 9 Dec 2024 11:39:14 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing
> units that operate in the AXI bus clock domain.  Add drivers for
> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
> well as a pixel engine driver, so that two displays with primary
> planes can be supported.  The pixel engine driver and those unit
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
