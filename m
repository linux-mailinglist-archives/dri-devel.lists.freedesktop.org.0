Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17828CCA6F5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 07:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD5B10E53F;
	Thu, 18 Dec 2025 06:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cAYlR1Et";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9ED10E53F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:20:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 32E8241571;
 Thu, 18 Dec 2025 06:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748E0C4CEFB;
 Thu, 18 Dec 2025 06:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1766038854;
 bh=gempZFFkfiQxbRmznm2F62NQjRfy6OMCLS3448x/nVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cAYlR1EtIxsDN9a/LHxwXyr1cUTiQeQ5vkwOj5/gE5GG6RNJQ0SewL/2en9fyifkI
 p/+NKfSuy3oUGOIXNS5Hc5R1Qnlc+bIHDHxnDlQgkMcVsT0w4vz4dUdfkUeKsiE1QM
 k/cv4wIJSBQafpicJkEGUXfEfFtkKF0pr1BH3fLY=
Date: Thu, 18 Dec 2025 07:20:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Arjun Changla <arjunchangla7@gmail.com>
Cc: andy@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix spacing before close parenthesis
Message-ID: <2025121827-lubricant-salad-860c@gregkh>
References: <20251218061406.8043-1-arjunchangla7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218061406.8043-1-arjunchangla7@gmail.com>
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

On Thu, Dec 18, 2025 at 06:14:06AM +0000, Arjun Changla wrote:
> Fix checkpatch error "space prohibited before that close parenthesis"
> on line 65 by removing the extra space.
> 
> Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 30e436ff19e4..2f7c891177fb 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -62,7 +62,7 @@ out:									      \
>  }                                                                             \
>  EXPORT_SYMBOL(func);
>  
> -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)

But you just changed the function definition, does this still work now?
If so, how?

confused,

greg k-h
