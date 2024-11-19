Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7A79D3021
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 22:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB4410E372;
	Tue, 19 Nov 2024 21:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P5mA0+pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F5F10E0CA;
 Tue, 19 Nov 2024 21:49:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AC0BE5C58F2;
 Tue, 19 Nov 2024 21:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6FBC4CECF;
 Tue, 19 Nov 2024 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732052958;
 bh=ASxBQIJ5phOVF/lqp7cu5lm2e0X0VL6JX96nVk8EP90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5mA0+pnBAjWAcN0dLBkPyxYaE4PwYv5dOBv0NiI3CBn7WolFibDfV2dASYpRem5I
 2YNCLPKNrBjqwmxdK+2NFMEIOk8lJ6xTKpIuPZEHF/kSdv0zfDMoWPjXVIygvNGIBR
 8ODu3nC0dpiHQpTDS6gT6btmWRFeg+Ru8ZhXzPJWLHzVWN8xBpDpJBHf4X8N0D55Xt
 eURkH9kGvYm8GpNyNCPqrWK/4uWD+71NHQWO0vMigeNFYqpJZjOrf05nD/As8xyYnq
 g113GDUVJ2+tBksbRf6gi8sK7ECQDAgydHi+U+ENbIlnoVyE/mFM93MhZgGAHeKhR+
 HZroW2PgXRzgA==
Date: Tue, 19 Nov 2024 14:49:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Liviu Dudau <liviu@dudau.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <20241119214915.GA848207@thelio-3990X>
References: <deeef745-f3fb-4e85-a9d0-e8d38d43c1cf@linux.intel.com>
 <20241118150816.GA3706736@thelio-3990X>
 <Zzy9Afen1GhV/DHm@bart.dudau.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zzy9Afen1GhV/DHm@bart.dudau.co.uk>
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

On Tue, Nov 19, 2024 at 04:29:53PM +0000, Liviu Dudau wrote:
> On Mon, Nov 18, 2024 at 08:08:16AM -0700, Nathan Chancellor wrote:
> > On Thu, Oct 31, 2024 at 02:41:38PM +0100, Maarten Lankhorst wrote:
> > > Cristian Ciocaltea (3):
> > >       drm/rockchip: Add basic RK3588 HDMI output support
> > 
> > Can someone please apply [1] to resolve a link time failure seen with
> > 32-bit clang builds? I am still seeing it in -next and my ping on the
> > patch does not appear to be seen...
> > 
> > [1]: https://lore.kernel.org/20241018151016.3496613-1-arnd@kernel.org/
> 
> Pushed to drm-misc-next.

Thank you! Is there going to be another pull request from drm-misc-next
into drm-next for 6.13? I suspect not, so I believe this fix needs to be
cherry-picked into drm-misc-next-fixes, as the problematic change is
already in drm-next.

Cheers,
Nathan
