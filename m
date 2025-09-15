Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C5B57FCD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3AE10E4E2;
	Mon, 15 Sep 2025 15:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f5VmtA5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AEE10E4E2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:02:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4620F44281;
 Mon, 15 Sep 2025 15:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6991C4CEF5;
 Mon, 15 Sep 2025 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757948552;
 bh=ZafX87MMcfI5y2IRaqNAT6HmdaHGKFoLkfY+lm2hc14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5VmtA5g70F71yXQYaxm3xCQGg6KvCFDB7chmTjFVILW8w/K2+eM3qI9j0DVE/mD9
 MAIw0c8APm9rnxbauU+AbwBM1iTtXFuG3lWjdo3ho8OR2Axr4A857sy7pYLC+ashiZ
 7A8z9djjmRDEBuvya/tt4gu7BUse4qW9tJhlyxIBf6AjcXxDfAbcYNscJaooa00DgD
 DzjHb84yQGuqoSA1S9VJQapyTKLwGbbWjsTrPwZt+yKDmAKXzTZIUOpH3rrCkcaxsL
 ojh1Qd8gZMMPIEn2HqaVu1Jb/tISXdkTGS2Zs+qk1NFMOvT4jS7ACtTQZWgFYSPxQ0
 okYTlG8LjFpfw==
Date: Mon, 15 Sep 2025 16:02:25 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, deller@gmx.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
 j@jannau.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev,
 support.opensource@diasemi.com, duje.mihanovic@skole.hr,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 15/15] backlight: Do not include <linux/fb.h> in
 header file
Message-ID: <aMgqgSMaxFsM4eES@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-16-tzimmermann@suse.de>
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

On Tue, Jul 15, 2025 at 02:24:52PM +0200, Thomas Zimmermann wrote:
> The backlight interfaces don't require anything from <linux/fb.h>, so
> don't include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
