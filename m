Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ACD84DFCA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 12:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B572310E0D5;
	Thu,  8 Feb 2024 11:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="otMJJuv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383E510E0D5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 11:34:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 90BD6CE1C3E;
 Thu,  8 Feb 2024 11:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209BEC433F1;
 Thu,  8 Feb 2024 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707392069;
 bh=yyQjmff7mDe+PFwHUjspM3GhT+PcMskz98VGgV0pDXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=otMJJuv7xmoVBxGBtHlNHS60vRtgbaz98hCw3I7+YzfJQaSpyfJeT1zQgiIFs47jZ
 EYWZn6Um2d+JCdWamZy7zfyEzMm6WIBZzTi7vCgQgEDHToI59x+8MxL95urvBQ6ta4
 0Os/gPU9xbgj1J6ryDeUwEjUfP0if1AQ8vwO9pEdDvYh7AUFUmoSO6WHhCH+9luC2h
 ZZirBBZm90ey9nXVvQaOjQAGVLrFRRRNdyfk++m4VU2xXTuJ2R84XNsMbUdqskxHi7
 3EVMEOYWaiTLgP9eOINvOWb2QcUiCbFsrYSAcwFr4HS8/CSKPJK09ugsIAKVpgx2eQ
 sh+iz4fazo2/w==
Date: Thu, 8 Feb 2024 11:34:25 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-ID: <20240208113425.GK689448@google.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
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

On Thu, 01 Feb 2024, Andy Shevchenko wrote:

> Allow to use driver on non-OF platforms and other cleanups.
> 
> Changelog v2:
> - rename pm3309c_parse_dt_node() --> mp3309c_parse_fwnode() (Daniel)
> - add tags (Daniel, Flavio)
> - new patch 2
> 
> Andy Shevchenko (3):
>   backlight: mp3309c: Make use of device properties
>   backlight: mp3309c: use dev_err_probe() instead of dev_err()
>   backlight: mp3309c: Utilise temporary variable for struct device
> 
>  drivers/video/backlight/mp3309c.c | 88 ++++++++++++-------------------
>  1 file changed, 35 insertions(+), 53 deletions(-)

Set no longer applies.  Please rebase, thanks.

-- 
Lee Jones [李琼斯]
