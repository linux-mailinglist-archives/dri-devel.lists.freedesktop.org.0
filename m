Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963A8CE8F7F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 09:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACAE10E856;
	Tue, 30 Dec 2025 08:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iq0D/MjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3B010E856
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 08:05:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A605A6000A;
 Tue, 30 Dec 2025 08:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE603C4CEFB;
 Tue, 30 Dec 2025 08:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767081909;
 bh=GnoT2BMbxd3I8fElj3TLKeZfmfLN5pOG7eddMq5a8hQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iq0D/MjBWQz9DUMUB9AsqfVzilTE8AKDRVQfpRnAP1AUZzjck1gTOOP9ZHzudcTiB
 cVWSBMYf+lwF6AYa/utjRvfttuIcPayMTc9VtpJlMygTfDi/4UbSOdhE+WIFid90Tj
 t4dZ94GCWeJ1czarOSGsp3gxP5jO2DjZKVD+xtA8ybEU9DHSWtGAyg2PbugM+21gOi
 oo+AVuoilQQQZlP8Z06tViQm8kfTUKEq1oCx06XNJ24u4D0T+fJu1HYrOCXOWdBCZY
 MKusSGQYrZjt+xZ2fH20KZenSy81XKp+jp/yEypYM1e/CZL/nzj0d7bGD4TYLfgM5o
 u9YJ3AlsjElPg==
Date: Tue, 30 Dec 2025 09:05:04 +0100
From: Helge Deller <deller@kernel.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Message-ID: <aVOHsFXNx_wzG_yg@carbonx1>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-4-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-4-chintanlike@gmail.com>
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

* Chintan Patel <chintanlike@gmail.com>:
> omapfb provides several sysfs interfaces for framebuffer configuration
> and debugging, but these are not required for the core driver.
> 
> Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() to obtain the backing device at runtime.
> When FB_DEVICE is disabled, sysfs operations are skipped while the code
> still builds and is type-checked.
> 
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>

Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>  drivers/video/fbdev/omap2/omapfb/Kconfig        |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c | 16 ++++++++++++----
>  2 files changed, 14 insertions(+), 5 deletions(-)
