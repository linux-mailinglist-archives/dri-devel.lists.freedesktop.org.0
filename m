Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6D5AB6EEE
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BBD10E663;
	Wed, 14 May 2025 15:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gtmGolZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9310E646
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:08:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F2E744A841;
 Wed, 14 May 2025 15:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DACAC4CEE9;
 Wed, 14 May 2025 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235295;
 bh=eoORac1gBP0K24jAQNXvarZwHndAx8L/gcj9v3uvkaE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=gtmGolZzqjU/IW/AW8Fo0tSG9niKnfJv/4iEDRupVvGE2fi1Jf7/B4+wfpehDhZqY
 37EjgzJEIAp1KAXH3cBoaOQlgKe1wCxiayDTft+4lnwMB3A0hVie2UEybV9QbTmhBB
 DhMFcVmtk9qWHYh04tG7wxdvYbLX5vtbUOU1+LJCBgsHxkhCPxBI9yYmvJ1PPXToXD
 GWW/lFUMcfzWOgVoP0I/Gje5cTMPdFY0Ldbe9t4WZa1MDM24YveCrkFVAVc7PwPAFf
 Z+2btScigTXgXV1PpG4b8MHctVfXvbFfJ++r/W0ery9PLDmXNmR+TsWtWEiC0Qw5re
 6bnjqdNJ3kvGw==
Message-ID: <9c56a24fed529c79f5946f7ddf743b98@kernel.org>
Date: Wed, 14 May 2025 15:08:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 03/11] drm: sun4i: de2/de3: add generic blender
 register reference function
In-Reply-To: <20250511104042.24249-4-ryan@testtoast.com>
References: <20250511104042.24249-4-ryan@testtoast.com>
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

On Sun, 11 May 2025 22:31:12 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
