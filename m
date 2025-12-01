Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24CAC9833F
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5E510E046;
	Mon,  1 Dec 2025 16:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eQvC5z7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D82210E046
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 16:16:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 857F843E51;
 Mon,  1 Dec 2025 16:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D03C116C6;
 Mon,  1 Dec 2025 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764605774;
 bh=nAo7+l8wCFAaFzIzx43qISSVJ7YSWKcFCq7hsq/mSac=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=eQvC5z7uHyvBUckhMRZfaV95EZYUhZi8E80nSbWVtaoZUa2ORBctCzJcOlDkNHT6Q
 VX77oY4COiz9QqAsDlsq9nB2kucu+bJ5Px/CrhJgDs+2kH/0v8shPCej9K/ffQTGV+
 ZyZaqbazpYsMNLISh/d3QYOOiuQFT11KBvMyC9y6JgmcGxD53oY1H/6WFO+FyG37jm
 2d6/BOdrFCz0BL3a+4O1GvtdpMUvzAy2H84J2stDHwBIgevbbpP6Z6VyPCD8DDhtY0
 JKL04ZpoaK+AZZ4j9OVsXcMKw4tWNyOc4A6nrS3DqxlSoH21kETxoJ7lb3GYOiB8OT
 6Bg0+y0ptXAvg==
Message-ID: <3073f5ced0bb51db0b9fc52b048b26d4@kernel.org>
Date: Mon, 01 Dec 2025 16:16:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
Subject: Re: [PATCH v5 2/3] drm/mcde: Create custom commit tail
In-Reply-To: <20251130-mcde-drm-regression-thirdfix-v5-2-aed71a32981d@kernel.org>
References: <20251130-mcde-drm-regression-thirdfix-v5-2-aed71a32981d@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 "Aradhya
 Bhatia" <a-bhatia1@ti.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Vasut" <marek.vasut+renesas@mailbox.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
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

On Sun, 30 Nov 2025 13:11:18 +0100, Linus Walleij wrote:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks when used with MCDE.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
