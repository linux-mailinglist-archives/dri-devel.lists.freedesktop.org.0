Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCDF90FF87
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCBD10E872;
	Thu, 20 Jun 2024 08:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uJ3TCUv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A203110E2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:53:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1EDA062119;
 Thu, 20 Jun 2024 08:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7574AC2BD10;
 Thu, 20 Jun 2024 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718873596;
 bh=CnRkW80aR20tltmJy5tD273I6uYO+WS7wxWDGmj86Ws=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=uJ3TCUv6MBYFCHM9PDhL15HMTnBLsM08j8JLMYtfmLmdL27yhwe5o+CmKk26JpHBC
 q4TxzR3tLj7mnaKPWDFsxXhbkjBB+s98mC1sTlVH03m356VUT3ESuZbqTd+SwNnKM1
 cXPCCvrJ7neL+CGoiqj2KniFpzgtrarO7GbZlHWPAj/eFwucNfKjqx69WpJ8pRrr7K
 iBnONQ+0pHieZbv/xUXpaweQmYAU1WwZTUVzU72i0my1XyM5ZjUc52I2DjENcvwvrG
 jcbVnKHUPu4gRJOAfivzto8MmzIbmWB5c3k4o8r4CfJL2HInBdCXAofX5eNO3m6ABV
 pDfnQ4hcPtcnA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
In-Reply-To: <20240619153913.2804051-3-dave.stevenson@raspberrypi.com>
References: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
 <20240619153913.2804051-3-dave.stevenson@raspberrypi.com>
Subject: Re: (subset) [PATCH v2 2/3] drm/vc4: Add monochrome mode to the VEC.
Message-Id: <171887359430.3857922.9613938938610320840.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 10:53:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 19 Jun 2024 16:39:12 +0100, Dave Stevenson wrote:
> The VEC supports not producing colour bursts for monochrome output.
> It also has an option for disabling the chroma input to remove
> chroma from the signal.
> 
> Now that there is a DRM_MODE_TV_MODE_MONOCHROME defined, plumb
> this in.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

