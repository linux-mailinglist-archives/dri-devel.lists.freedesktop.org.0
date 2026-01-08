Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B78FD01F98
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F9410E6D7;
	Thu,  8 Jan 2026 09:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="voJ74TeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3626510E6D7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:57:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 898A243269;
 Thu,  8 Jan 2026 09:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE17DC116C6;
 Thu,  8 Jan 2026 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1767866276;
 bh=KJMLKtgmBZCJWuHGsXbhRkAkjlHzsouDdRM0RG+aySw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=voJ74TeGuTkwCbMTG4VIwF7ZBwZyHb4NT8S94qGEHQk0yHJzG5q4U9jEPLNS0mKlk
 f/hnYG61IX9aWBUG46ZnSzrASvEsvzuhOvuyAZsw+YFTVjwHVpBsZPpytA33KHPvaz
 79YRDQrhvcJGeTk2ViyDEsaU/PtMkrVrN0Mobp4Q=
Date: Thu, 8 Jan 2026 10:57:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
Cc: andy@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: align tinylcd write_reg args
Message-ID: <2026010823-floral-alphabet-4aef@gregkh>
References: <20260108094709.92561-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108094709.92561-1-chaitanyamishra.ai@gmail.com>
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

On Thu, Jan 08, 2026 at 03:17:09PM +0530, Chaitanya Mishra wrote:
> Checkpatch reports a misaligned continuation line in the
> 
> fb_tinylcd init_display() write_reg() gamma table. Align the
> 
> continuation line with the open parenthesis to match kernel style.
> 
> No functional change.
> 
> Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
> ---
>  drivers/staging/fbtft/fb_tinylcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
> index 9469248f2c50..60cda57bcb33 100644
> --- a/drivers/staging/fbtft/fb_tinylcd.c
> +++ b/drivers/staging/fbtft/fb_tinylcd.c
> @@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
>  	write_reg(par, 0xE5, 0x00);
>  	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
>  	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);

That kind of makes the code harder to read, right?

checkpatch is a guide, always use it as a hint, not as a rule.

thanks,

greg k-h
