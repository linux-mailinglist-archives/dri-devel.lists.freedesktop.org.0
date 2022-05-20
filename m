Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B2F52E4A4
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 08:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFAA11B3FD;
	Fri, 20 May 2022 06:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE57411B3FD
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 06:03:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4F7F9CE2746;
 Fri, 20 May 2022 06:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395ACC385A9;
 Fri, 20 May 2022 06:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653026626;
 bh=kavH15HxjDABcLAwAacr39uq4nUfy4tlsuWMTt/128Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aOfHvGMOxvEuR9SFoPJZPTQfK8HRiFCRtbgNpYwHFUbKX3pf+N/k1xxGmITkUsOpI
 SS9npiymCKID5I11EguHR33/+NDyFPVNu6x5OtdUK25T+jL+V2MqA0wvAx1BhAPHDo
 o7X3eCexebnDZx9IxiGdZZRoA/h369PY02RtaiuU=
Date: Fri, 20 May 2022 08:03:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uri Arev <me@wantyapps.xyz>
Subject: Re: [PATCH] staging: fbtft: fix checkpatch.pl struct should normally
 be const
Message-ID: <YocvQJNfA8726Kf6@kroah.com>
References: <20220519172503.10821-1-me@wantyapps.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519172503.10821-1-me@wantyapps.xyz>
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
Cc: Srivathsa Dara <srivathsa729.8@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Len Baker <len.baker@gmx.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 19, 2022 at 08:25:01PM +0300, Uri Arev wrote:
> This simple patch fixes a checkpatch.pl warning in `fbtft/fbtft-core.c`.
> 
> Reported by Checkpatch:
> WARNING: struct fb_ops should normally be const
> 
> Signed-off-by: Uri Arev <me@wantyapps.xyz>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Always test-build your patches before submitting them :(
