Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8B411CFA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 19:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B12F6E591;
	Mon, 20 Sep 2021 17:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B64D6E55E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 16:07:15 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id ay33so44182053qkb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JR0eY503IkHJjk9jTmWA+lRcED24SP8xeTX1ZCjwatw=;
 b=F0o/6n6KN+ekB/ZkFTt9D3rjV8YW/1lrBw73xIsa9IvuPtDwj0uwMmPtuXgY+QvKHa
 HdSxdEjZdaxIG1wjaMScQzwLefU3zRrfSwhJ1bg6iPVe7xXF8UPkajxbuWR0dKamuivS
 DNo2Fb6k47ZXUoJSFOQQa5TJK0Te5Dgpsgrvr96TY/Oalo6BX8efPVQLyMJFs3mfOuAU
 97Uqm2Fm+cnXccDungqscRAOjf1HPrJ2tgQDfW9btTqwJ8LbXcxXe0i3yOl5k/b5WZ/l
 cdW00uPceGN1O7sMVG3gkm95dhN2mrHt931s34OdNwPCBuPzsaizw2dkcbnCY4THIPDr
 gRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JR0eY503IkHJjk9jTmWA+lRcED24SP8xeTX1ZCjwatw=;
 b=IRrS5bw8mCSkKufR76wYAbU3/8AccQGLlkDyD+QkzGz8QrK80Ee3a8vO6ihPYVs54V
 vESbwFZ+sM8h5J8kzkM6D43ngV3RnP3p0NmdLutxE5UjnPLzWQ/SKPstcVzFtSQlU6VU
 W3d3cKElIkHj4MeAA3xVIWrujj+4fDXB5foyJ2/2n/CK+Em8aG8oygff8c9NTcW3o4n1
 hXIgfvHV0D08nzkTEKOnRICoXM6qk+0oaVXGdiHqCw96eGnfDYvizAE9oZhg8j2BCJMD
 NjKLAdCKb9YPzPajO5rSoWosL96t9/hCUaFYEhSevpbURxyYcFiZrW3WVJ2jSKy4YIK6
 3kOg==
X-Gm-Message-State: AOAM531WSuobDm/KQEPICgEgJmlrUwtQHwqkoiGv6NCKDHQS0WZb/RUY
 4d9/7ndEfsEOtvutpAhO9/c=
X-Google-Smtp-Source: ABdhPJzH7fvxRNhTIJY6Fa1bhJ6FfAhbXKwduBasI9xtxCION+BPW7g4JPtBNgY3xnuUSpyTsTkIkw==
X-Received: by 2002:a37:9244:: with SMTP id u65mr25338431qkd.46.1632154034728; 
 Mon, 20 Sep 2021 09:07:14 -0700 (PDT)
Received: from Zachary-Arch ([128.211.185.212])
 by smtp.gmail.com with ESMTPSA id p12sm3180353qkj.54.2021.09.20.09.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 09:07:14 -0700 (PDT)
Date: Mon, 20 Sep 2021 09:07:13 -0700
From: Zachary Mayhew <zacklukem.kernel@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@lists.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: add docs for fbtft_write_spi()
Message-ID: <YUixsZQ/J0dPfJqj@Zachary-Arch.localdomain>
References: <20210920152601.170453-1-zacklukem.kernel@gmail.com>
 <YUiq9iDGLN6+5+rd@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUiq9iDGLN6+5+rd@kroah.com>
X-Mailman-Approved-At: Mon, 20 Sep 2021 17:13:41 +0000
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

On Mon, Sep 20, 2021 at 05:38:30PM +0200, Greg KH wrote:
> On Mon, Sep 20, 2021 at 08:26:03AM -0700, Zachary Mayhew wrote:
> > Subject: [PATCH] staging: fbtft: add docs for fbtft_write_spi()
> 
> Odd, this shouldn't be in the body of the email :(
> 
> > 
> > This patch adds documentation for fbtft_write_spi() to make its
> > calling context clear and explain what it does.
> > 
> > Signed-off-by: Zachary Mayhew <zacklukem.kernel@gmail.com>
> > ---
> >  drivers/staging/fbtft/fbtft-io.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
> > index de1904a443c2..985d7cf8c774 100644
> > --- a/drivers/staging/fbtft/fbtft-io.c
> > +++ b/drivers/staging/fbtft/fbtft-io.c
> > @@ -5,6 +5,19 @@
> >  #include <linux/spi/spi.h>
> >  #include "fbtft.h"
> >  
> > +/**
> > + * fbtft_write_spi() - write data to current spi
> > + * @par: Driver data including driver &struct spi_device
> > + * @buf: Buffer to write to spi
> > + * @len: Length of the buffer
> > + * Context: can sleep
> > + *
> > + * Builds an &struct spi_transfer and &struct spi_message object based on the
> > + * given @buf and @len.  These are then used in a call to spi_sync() which will
> > + * write to the spi.
> > + *
> > + * Return: zero on success or else a negative error code
> > + */
> >  int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len)
> >  {
> >  	struct spi_transfer t = {
> > -- 
> > 2.33.0
> > 
> > 
> 
> Is this file being imported into the kernel doc tools?  If so, great, if
> not, this isn't going to help out all that much, right?

It doesn't appear to be imported at this time, as such it may not be
necessary.

> 
> thanks,
> 
> greg k-h

Thanks,
-Zachary Mayhew
