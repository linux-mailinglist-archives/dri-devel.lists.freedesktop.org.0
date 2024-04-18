Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2508A990E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC1D113BF4;
	Thu, 18 Apr 2024 11:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rffD6A7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7185C113BF4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:51:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CAEA1CE17A6;
 Thu, 18 Apr 2024 11:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8425BC113CC;
 Thu, 18 Apr 2024 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713441105;
 bh=kKCBekfE4dBm8z1f/Jm+KxsNndEKb4bU3RKDH6Hjj6g=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=rffD6A7ofnfKBlgVlvRl2XWBz+IYAt333b6i5WV2mHAc+C9cWVR/YhwKwJW7lNLxT
 /10+eZ9/CTsp2RhHOiiEe7C21o2C9NA1rrV8J1a+BvmFyymtrzKoUE4rzUWp7p5f2d
 LRfiJ2wfXunXljxkJVo7Ct1t1Lfy0hGN8yPRMcL+ouvyVuXVbvw+XTuFl7IhtYbPkt
 yLtsboXmBh8UDiAjo3IWSk96/Io/0p9jnsL8AMASFNHIJrA5DXP47SB35RMCGwAPNA
 hmtHRkIz2ouSec+Nmw6GrDsHmOi3kH8T8N8IRS5xghrJDljT+digmP2HqL/xmLUptG
 nrWfbSRy6JfOg==
Message-ID: <aa328a01f193821ea324bb00248e03ce@kernel.org>
Date: Thu, 18 Apr 2024 11:51:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 06/15] drm/sun4i: hdmi: switch to struct drm_edid
In-Reply-To: <0967dde8ae35cd58ab8ea58397d514bb9df29fd1.1713273659.git.jani.nikula@intel.com>
References: <0967dde8ae35cd58ab8ea58397d514bb9df29fd1.1713273659.git.jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, "Chen-Yu
 Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Samuel Holland" <samuel@sholland.org>
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

On Tue, 16 Apr 2024 16:22:20 +0300, Jani Nikula wrote:
> Prefer struct drm_edid based functions over struct edid.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
