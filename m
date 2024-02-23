Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D44861358
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 14:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BED610EC18;
	Fri, 23 Feb 2024 13:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y2oyc5ze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE64D10EC18
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:52:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33F856346C;
 Fri, 23 Feb 2024 13:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324DAC433C7;
 Fri, 23 Feb 2024 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708696344;
 bh=V8TznJ0k0V6DJyvkcGoCJqMKzz//BdtNKBjJlJ3UDjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y2oyc5zesXUWqfHsjlsEnMs1YHxloW1tzQHKvZdPAm1WzCmzZVDcoDIaj7PqVTlTg
 MtTmg8P+g9Q6Ofx6FmBgC92jsq7OjMH1MZkDup1/cIgvpo89YYX5RlC7+IZQqHv4q7
 wB/dd5SGfhlwszZ0GHlno5wK3FbXwWCNOO4brEjxTFA+QIkynhn5A4VtC9Lm1DL8XW
 ImhWSGJm4Ngj5IJxndSs2D1mz5DnoJLmfCk0s7sNf3V1q3E660U5yGP9o5Dmr14ERn
 sVRlzd3+vGwPgJ+f0ZX4pXeQvqY+bDorlAcadMnoELWUUDpxQvG4kX9ZoM9+IzCNkC
 pU/NQUdrsn/2Q==
Date: Fri, 23 Feb 2024 13:52:19 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [resend, PATCH v3 0/3] backlight: mp3309c: Allow to use on
 non-OF platforms
Message-ID: <20240223135219.GB1613065@google.com>
References: <20240208184313.2224579-1-andriy.shevchenko@linux.intel.com>
 <20240223134908.GA1613065@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240223134908.GA1613065@google.com>
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

On Fri, 23 Feb 2024, Lee Jones wrote:

> On Thu, 08 Feb 2024, Andy Shevchenko wrote:
> 
> > Allow to use driver on non-OF platforms and other cleanups.
> > 
> > Changelog v3:
> > - rebased on top of the last changes against this driver (Lee)
> > - added tags to patch 2 (Daniel, Flavio)
> > 
> > Changelog v2:
> > - rename pm3309c_parse_dt_node() --> mp3309c_parse_fwnode() (Daniel)                                             - add tags (Daniel, Flavio)
> > - new patch 2
> > 
> > Andy Shevchenko (3):
> >   backlight: mp3309c: Make use of device properties
> >   backlight: mp3309c: use dev_err_probe() instead of dev_err()
> >   backlight: mp3309c: Utilise temporary variable for struct device
> > 
> >  drivers/video/backlight/mp3309c.c | 88 ++++++++++++-------------------
> >  1 file changed, 35 insertions(+), 53 deletions(-)
> 
> Sorry for the delay, I was on vacation and I've been fighting fires this
> week.
> 
> This set still doesn't apply?

Disregard, my fault.  Applied now, thanks.

-- 
Lee Jones [李琼斯]
