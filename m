Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40399D1408
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BAB10E509;
	Mon, 18 Nov 2024 15:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o5xIuiv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F0D10E4F8;
 Mon, 18 Nov 2024 15:08:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E2855C498D;
 Mon, 18 Nov 2024 15:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7127AC4CECC;
 Mon, 18 Nov 2024 15:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731942499;
 bh=Jq9qBPGj+NNUX4ncwRPBzR9LEbcSp1xBwEwNkIm+pbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o5xIuiv6XPUDH8kNSx52IS02wPfquG4bA7d+2SY5AdIw+Gq9CdEetNyMdcmNKwHIF
 4geRmGscFQytkxt2561Zomekw7TEUH1lnuKGdHWSAiTKJgh90PNYvZm4GRqBGMc9c9
 pgiTU5iPq/WfkptlQMEYlHD/1q/6PGHwua8x9evqUGUpME18dBVWslTZYx+M9NmP9K
 Eu0H6S/niusliGCRn6GAe4zu+ZqKM4LhPfp3X5KiyNEXUa1oC4n7hE88A8xK5ohrSy
 Sa1DhlzgSwucIqp5WYf0z/RsP1xuNvMK1PFk6+XbTBYZfV4hVM1NROrerXvnaVwtNM
 QJV0AMnrTtMRA==
Date: Mon, 18 Nov 2024 08:08:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <20241118150816.GA3706736@thelio-3990X>
References: <deeef745-f3fb-4e85-a9d0-e8d38d43c1cf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deeef745-f3fb-4e85-a9d0-e8d38d43c1cf@linux.intel.com>
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

On Thu, Oct 31, 2024 at 02:41:38PM +0100, Maarten Lankhorst wrote:
> Cristian Ciocaltea (3):
>       drm/rockchip: Add basic RK3588 HDMI output support

Can someone please apply [1] to resolve a link time failure seen with
32-bit clang builds? I am still seeing it in -next and my ping on the
patch does not appear to be seen...

[1]: https://lore.kernel.org/20241018151016.3496613-1-arnd@kernel.org/

Cheers,
Nathan
