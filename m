Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81716AB6EED
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8F610E287;
	Wed, 14 May 2025 15:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fuXPIW9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7D710E2C6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:08:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B174F5C626E;
 Wed, 14 May 2025 15:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0EFC4CEE9;
 Wed, 14 May 2025 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235288;
 bh=FwP8uryXOsUK+TKg53CoKmdnuxln2EK5xDiRjRLSGZI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=fuXPIW9/1iuCaAuWi6VNcHOkDoB306E14Fn2sjd4B0pwxFNwPbPEdIOs2/vRlAT2C
 HxqyMfLwPgK06uYzoPSHWyPHlM87EZPnuH41UzxbrypLU005mSIO/F2/fH4GGnLBgM
 Dpv2kH09qWBsF/fTxi4sIlhmrhfAFUF6zpYnrACIHbkNXLUvzqbM/BVYU+R5IG4sFf
 YXn98suvuLuOTm3geIRQd2fo9fIO7PJclsl1NObGC78/XjKa1fbDOI/0ZtTbhiHTjm
 ZjOZUC+Z1u2xC66O8TzbRAaaDRhcHzgJVyc29vJXsAP+/l1V89I4Q6bxRYPQfkOdP7
 79c1XND+SFiKA==
Message-ID: <8d835eecfcd7d7b4ef88d06b7bd9ed21@kernel.org>
Date: Wed, 14 May 2025 15:08:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 04/11] drm: sun4i: de2/de3: use generic register
 reference function for layer configuration
In-Reply-To: <20250511104042.24249-5-ryan@testtoast.com>
References: <20250511104042.24249-5-ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Chris
 Morgan" <macroalpha82@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>,
 "Philippe Simons" <simons.philippe@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Sun, 11 May 2025 22:31:13 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Use the new blender register lookup function where required in the layer
> commit and update code.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
