Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4A956C26
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 15:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4160010E27A;
	Mon, 19 Aug 2024 13:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="byE4dY67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5037310E27B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 13:33:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A7C07CE0ABA;
 Mon, 19 Aug 2024 13:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32B0C4AF0F;
 Mon, 19 Aug 2024 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724074407;
 bh=5qvpBIw8uzv3nxKxx4KUdm+35UYTokqviRkRhaMimwQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=byE4dY67yrPNWy/u7DbowN6EI5QRrnaIeQALVFl13qv/VV96esQdazaXTRF+ZoxGA
 2sLcXjXePGCEeRj9vaXeDoXRiM98RQhhrkIrcFrycHoSlFnX1JdfryY12/pRnX/kO4
 ch5S7vPi8q29mL3I/dgB9fO6NdVaVMY8pGOA1O7Oj5kOVTaPqKHITVOE/II+collRl
 jqBEtO8DlLQtGPFquk+97j19f8F0DT7bSndRGFYrkQmS2gdOCWV65/lhqd/Fr3xSRX
 r/H3ULYg3dgU150bskMFVy9LQQG/WFhpiejPNf5h9TYfk7pnSFC5Y9YY5S/iMdvAn0
 Ua2wXnBEkVoBg==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240731201407.1838385-4-robh@kernel.org>
References: <20240731201407.1838385-4-robh@kernel.org>
Subject: Re: [PATCH] drm: bridge: anx7625: Use
 of_property_read_variable_u8_array()
Message-Id: <172407440450.1407402.570433127422255941.b4-ty@kernel.org>
Date: Mon, 19 Aug 2024 15:33:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

On Wed, 31 Jul 2024 14:13:59 -0600, Rob Herring (Arm) wrote:
> There's no need to get the length of an DT array property before
> parsing the array. of_property_read_variable_u8_array() takes a minimum
> and maximum length and returns the actual length (or error code).
> 
> This is part of a larger effort to remove callers of of_get_property()
> and similar functions. of_get_property() leaks the DT property data
> pointer which is a problem for dynamically allocated nodes which may
> be freed.
> 
> [...]

Applied, thanks!

[1/1] drm: bridge: anx7625: Use of_property_read_variable_u8_array()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/11c742bb5a26



Rob


