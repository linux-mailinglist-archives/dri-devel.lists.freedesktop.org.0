Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86BE9EE0C4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9A610E0FE;
	Thu, 12 Dec 2024 08:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rs3Yu//w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2489710E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:02:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3413C5C6782;
 Thu, 12 Dec 2024 08:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC461C4CECE;
 Thu, 12 Dec 2024 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733990559;
 bh=QjGG+uPw1phO2lbXkJHqiIAA/RKCYzFXaFQKMiuYHrg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=rs3Yu//wQuOG540diDP7gIFMrT1Po6r7u7y4CvaDpyeT8XQ5DOf8/amogqp9klusN
 xgF+158ew4eiPaPAZNXTjXj+5CA9cYR6NWDCZyi48wZNDSe79iZ5Rm0ipF3fgRiuSj
 wk9JwG/toXsn6SWS5X0EsyL38XfbPBruEiKXPl1HBJpG1AKmpNZZBQ6dKyZ1enquWN
 C4TU6QvyIEGYtZM/svHeXj2qpcyo9+BeEBElZUU4UWoYLguHGnmdGjXlpCRJlXqe6A
 uK0f/jQ68Jl8OzNlPO4i/AOSrjF93ujZ19shfL5X01jFmP+JAPvgK6Hmux4sEkgDSH
 AlSjMPUkOM07w==
Message-ID: <e3b1230308d20b4e7525952d01eb44fd@kernel.org>
Date: Thu, 12 Dec 2024 08:02:36 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
In-Reply-To: <20241209033923.3009629-10-victor.liu@nxp.com>
References: <20241209033923.3009629-10-victor.liu@nxp.com>
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

On Mon, 9 Dec 2024 11:39:13 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The FrameGen driver, TCon driver and display engine driver
> are components to be aggregated by a master registered in the upcoming
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
