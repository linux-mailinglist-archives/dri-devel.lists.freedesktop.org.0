Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A88D1E47E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 12:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E1110E5B2;
	Wed, 14 Jan 2026 11:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dZ0cfQp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD39410E5B2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 11:01:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E572F6001D;
 Wed, 14 Jan 2026 11:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B6BC4CEF7;
 Wed, 14 Jan 2026 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768388494;
 bh=CxZaqvDp/yK4Rd9ngRIzWQdh5v9AGp8wJjmAlsEJXfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dZ0cfQp+06Brz8jBqjMIuo42ObvtE2y/Icegaex6GbcBmGWltMjwy2k13Jt7bKBcB
 CBrpsb7p6n+mRGIcxr3rv1rFv7GPX2RqoVlEOiOeo8+g7hOAm2Cyc9h/Dk8c/uAM5o
 qzRmAHLcrd5mNu4CUEuK/6ihiWffDJTBwi5Y4W6dW+ABjgtR6SU/flQ7ANDAKxQ3cA
 vQa8DFXVZAqtEy6pbZP19qpFq0uq7SklU6egShQ+09s9dtp42aeIfF19HpG2bIUcQp
 I20tZu0jRb89jBQel0+eFniFYoXn+Qu90Ja7INmguFaP/G+AFI9Zf1rSgjHEhfVcbR
 3DXDPYsOY/gVg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vfycy-0000000031h-0Xfv;
 Wed, 14 Jan 2026 12:01:28 +0100
Date: Wed, 14 Jan 2026 12:01:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] drm/tegra: dsi: fix device leak on probe
Message-ID: <aWd3iFrujbRWyyyx@hovoldconsulting.com>
References: <20251121164201.13188-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121164201.13188-1-johan@kernel.org>
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

On Fri, Nov 21, 2025 at 05:42:01PM +0100, Johan Hovold wrote:
> Make sure to drop the reference taken when looking up the companion
> (ganged) device and its driver data during probe().
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.
> 
> Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
> Fixes: 221e3638feb8 ("drm/tegra: Fix reference leak in tegra_dsi_ganged_probe")
> Cc: stable@vger.kernel.org	# 3.19: 221e3638feb8
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Can this one be picked up now?

Johan
