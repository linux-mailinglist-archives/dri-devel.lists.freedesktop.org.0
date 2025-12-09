Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025A3CB0376
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F52710E5F9;
	Tue,  9 Dec 2025 14:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T3Y2kWL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FED10E5F6;
 Tue,  9 Dec 2025 14:12:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 40F6941B3A;
 Tue,  9 Dec 2025 14:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D16C4CEF5;
 Tue,  9 Dec 2025 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765289567;
 bh=dcA6/fqf5XdKH1miBHnaV1JJIsXJldco1on9OC/4Z2w=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=T3Y2kWL04vVmln/LeWD6/qfRdjTL1fZSLrrLRH7GmjO5jCarnvr3vl0AZbRKALbm+
 /1u+vzZtrqVSP/TGoAQZhFInaTdVYO6v4ghjrpHn/m8G2RHn0wwFEyEy/asgOFDSZm
 v6XxnqdaYKtNynUQiSuPo6+1GcNugkLFyxa+4bKiLLj654s8q5DwR6XWBa1oGuLn5w
 h92fxBHcFvu3SfTojN3l9PFDTo8Wld+kRtkn2ASxn0QbfNkXTc7W2jo0OzmPzB5V4p
 Tdx/tnoWBuiKFgEcT4W3+xMVSx8r/u4C6fHq2RFPya7CycL/96/HeugSyIm8eYTRWQ
 CS/NKcougDysg==
Message-ID: <6736385e287d063e19c8301550edcd17@kernel.org>
Date: Tue, 09 Dec 2025 14:12:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v5 03/17] drm: Add enum conversion from DRM_COLOR_FORMAT
 to HDMI_COLORSPACE
In-Reply-To: <20251128-color-format-v5-3-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-3-63e82f1db1e1@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alex
 Deucher" <alexander.deucher@amd.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Harry
 Wentland" <harry.wentland@amd.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
 "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo Li" <sunpeng.li@amd.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marius Vlad" <marius.vlad@collabora.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>
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

On Fri, 28 Nov 2025 22:05:39 +0100, Nicolas Frattaroli wrote:
> From: Marius Vlad <marius.vlad@collabora.com>
> 
> While the two enums have similar values, they're not identical, and
> HDMI's enum is defined as per the HDMI standard.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
