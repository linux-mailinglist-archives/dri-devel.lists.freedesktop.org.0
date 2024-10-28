Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5D9B353B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E5489135;
	Mon, 28 Oct 2024 15:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OVIGKbOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284A489135
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:47:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BBA40A427B3;
 Mon, 28 Oct 2024 15:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7E4C4CEC3;
 Mon, 28 Oct 2024 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730130424;
 bh=x6VESZnS0gIlbcKwxei1ocmQNprficyyBXLPPehCmTg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OVIGKbOdV7oQGJmmpjDGpadtrLcPJWrWSNedlqK0EFPjKQJeWuxZq3z8d6zhy9IzJ
 qDouzo2ZW9UgJrFO8P/lrdUmrUxxpUBqDDkD2ibgdnoS1/LyY9vRpo/b0zKMQpuoxZ
 H8jHFaUzCUiKSf7m3vV2Qc///5kTFs0V9r5qDS4/o7E6avMdOf/KZ5ZONwDGd06w0m
 kjrOGbkTA7P6BpHaPhngWKNBcqxm6rZMSi/tbxyRpJdwMaJ4ewKhVclaZnEqqNc7MS
 e83Fv6s6p2UsxsWJ0Xd0BT0Uz/FYqlj32l9evodBV0Gtgq4puipxiznyfWXslOnfRt
 J4uv9UmSFzFfg==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20241026041057.247640-1-marex@denx.de>
References: <20241026041057.247640-1-marex@denx.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Fix use of unadjusted mode in
 the driver
Message-Id: <173013042133.325619.9978456107237628412.b4-ty@kernel.org>
Date: Mon, 28 Oct 2024 16:47:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sat, 26 Oct 2024 06:10:42 +0200, Marek Vasut wrote:
> The driver configures mostly Pixel PLL from the clock cached in
> local copy of the mode. Make sure the driver uses adjusted mode
> which contains the updated Pixel PLL settings negotiated in
> tc_dpi_atomic_check()/tc_edp_atomic_check().
> 
> 

Applied, thanks!

[1/1] drm/bridge: tc358767: Fix use of unadjusted mode in the driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b59d1d9d9ab2



Rob


