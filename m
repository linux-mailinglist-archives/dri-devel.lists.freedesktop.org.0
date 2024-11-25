Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E79D89E3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE09510E697;
	Mon, 25 Nov 2024 16:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aYqZLs9V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C636C10E69B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:01:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A042DA4182A;
 Mon, 25 Nov 2024 15:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F267AC4CECE;
 Mon, 25 Nov 2024 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732550498;
 bh=TktsUwGeNhxSeHi0bdQOkR9d4PL26TzalaIYfQZs+o4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=aYqZLs9V5Pxn7mIDQ5JSas85KEi//yGTAKVknCvaz0D7gciR09Pvhjk/kdo8YTLg7
 yw1p7r2yI4yEmXdzv8CgDGoX187WTjrfLsunESoR4rfMUJGdi22W3qjaptiS5kiTM2
 wlvpCXqNp4sFtCKa03uGLsUP0zw91Vd1XT8Rwq1orgIOKcwZcH9lynO+5b1lZ4jsd+
 T3yVlX3WoRq86USUd1D0aqjkMIJV4kPc0kRkixUdWc9396mYbv6bNqZOMWNblTlQAd
 KRXEeb6MK4eCcxqLcpXQadelJTRvL9OuRPyOis5oP5UuFVPS/y80skLhNLYN0UCPWz
 pR2WSlqxE5v9w==
Message-ID: <1b1c0819f0a4ecafc13ed25c19e5d3d7@kernel.org>
Date: Mon, 25 Nov 2024 16:01:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sean Nyekjaer" <sean@geanix.com>
Subject: Re: [PATCH v2 3/3] drm/stm: dsi: use drm_mode_validate_mode()
 helper function
In-Reply-To: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Chen-Yu Tsai" <wens@csie.org>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Philippe Cornu" <philippe.cornu@foss.st.com>,
 "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>,
 "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>
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

On Mon, 25 Nov 2024 14:49:28 +0100, Sean Nyekjaer wrote:
> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> to reguire the requested and the actual px clock to be within
> 50Hz. A typical LVDS display requires the px clock to be within +-10%.
> 
> In case for HDMI .5% tolerance is required.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
