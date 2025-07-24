Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E5B10753
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 12:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E3F10E043;
	Thu, 24 Jul 2025 10:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TjwqsnFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE1610E043
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 10:03:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C8C4C6112D;
 Thu, 24 Jul 2025 10:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F70C4CEED;
 Thu, 24 Jul 2025 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753351424;
 bh=20uopEcddKtOz2si11V0GlpOFH798R4/RoR91R0ERDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TjwqsnFDaHw/giRbw6Vl10tXHvW49hp6s8+GLLwMHBGdg8o7Kbk6L0VQcl9W9XUC1
 caNB2jJE75tRr4BZSIgSG5ircpDkmlVCpN2HGfBe1q9qxakFoJjdddD9I2i56fwS12
 zig9eFZAYrgoVg2aXfQp9L9yv2jtaxwKUmpDMrnBbMNcckR3SZJ5R7nOgyXy3k2QJj
 CQ5X9ZF6GUwG9hN0yigjBHCdgppO/n9gCYWOEezQln+jxtlssk9Qq7mLaMMelXfGy4
 smqo9aZZtGDYngZ3OfRPaneCyBcI9Z3TOjTVKshhcfEAplO+hk8e+Vvu8NvYtku3OM
 1t/Q9I2CxZuPw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1uesnb-000000006u3-1nU1;
 Thu, 24 Jul 2025 12:03:39 +0200
Date: Thu, 24 Jul 2025 12:03:39 +0200
From: Johan Hovold <johan@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: fix OF node leak
Message-ID: <aIIE-zomDEuBb6eZ@hovoldconsulting.com>
References: <20250708085124.15445-1-johan@kernel.org>
 <20250708085124.15445-2-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708085124.15445-2-johan@kernel.org>
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

On Tue, Jul 08, 2025 at 10:51:23AM +0200, Johan Hovold wrote:
> Make sure to drop the OF node reference taken when creating the aux
> bridge device when the device is later released.
> 
> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Any chance we can get this one into 6.17-rc1?

Johan
