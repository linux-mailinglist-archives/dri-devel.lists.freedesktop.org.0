Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5A411CF9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 19:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE56E58E;
	Mon, 20 Sep 2021 17:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D236E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 16:37:55 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 72so32781075qkk.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BKUIuDa3lioYwj9MZ6lMDEtCsGFXka8J1qfR+h8017M=;
 b=NKrskdfWN0WAOiTgNq/TS/Lif0HqFgj+7S6+Ndm/PekHxHuLWDgv3W7htyv2KlXywN
 kWeONl9LV3wRd3OVySEspRcoliPbBRO6h6IPmIFyW15OJW1tuZmnU8PieoFtdl9i3BHB
 N64vglgYcGTxgU5hR1VUbCw73gW2TUNGM0MOLut03dOspRUzDVr0M0ugjgB3+dZavc33
 8vTN8tprGor08uPumXKlRhUuWVgoEnKii6YJiXkY/w0BfQTFJyTGKhyD/9HkDqJq4e5k
 AaOBjOkCNJKM0EGkIu6pAzt8NLH2tJkqEhAEpbUl07jps7+aT2tpfwE9rZgEWzx31skI
 XaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BKUIuDa3lioYwj9MZ6lMDEtCsGFXka8J1qfR+h8017M=;
 b=MBhlPIHEDin3K0U6SVU3mP02pOWWyQ/tZ+dr5pyKvXulORh4yxYFPerii5x4Hprfz4
 L5SCqFnuO+/Do4kL/Vgl344zXZfwVdz2zHDr05XPBmsaeDKjrxDU27NpEN04ZnG/gS/l
 p2Tf6uyyghsklQlIpz+7Fj0T85XvAr/rsWD7kYLZvSqPhYCy5u90PvfvEX1OcCAHXkoW
 Qas6Ilb/e2HwphNI8UfPnUT55qgrACoGa79uvnisPl87qERQBAuZqfudthj5JSFy8zL3
 2yjMRf82w7Z6iu2p1gRYc3igKDgkowCQEcUWyeRl4L1jP6Hmal1gaU+PT+UYHBdoWj0L
 /6Qg==
X-Gm-Message-State: AOAM532F0CoRHPqI7UdiGE8riMMr8tb0yTiaJFvhWAZRFoJt70pq6Du3
 uFzYiyFga0yrVFZj5hbI5YY=
X-Google-Smtp-Source: ABdhPJx7457/YOz2A/7ARQa6hRfDYJpiXBfHG+CGYmhJaagoF60H55lHrfaZNIAncABqQ8VwL9IFOw==
X-Received: by 2002:a37:9b43:: with SMTP id d64mr4250565qke.111.1632155874981; 
 Mon, 20 Sep 2021 09:37:54 -0700 (PDT)
Received: from Zachary-Arch ([128.211.185.212])
 by smtp.gmail.com with ESMTPSA id e22sm9090215qte.57.2021.09.20.09.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 09:37:54 -0700 (PDT)
Date: Mon, 20 Sep 2021 09:37:53 -0700
From: Zachary Mayhew <zacklukem.kernel@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@lists.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: add docs for fbtft_write_spi()
Message-ID: <YUi44c1mlkZR14v4@Zachary-Arch.localdomain>
References: <20210920152601.170453-1-zacklukem.kernel@gmail.com>
 <YUiq9iDGLN6+5+rd@kroah.com>
 <YUixsZQ/J0dPfJqj@Zachary-Arch.localdomain>
 <YUi0coGlTkQ0C5Rm@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUi0coGlTkQ0C5Rm@kroah.com>
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

On Mon, Sep 20, 2021 at 06:18:58PM +0200, Greg KH wrote:
> On Mon, Sep 20, 2021 at 09:07:13AM -0700, Zachary Mayhew wrote:
> > On Mon, Sep 20, 2021 at 05:38:30PM +0200, Greg KH wrote:
> > > On Mon, Sep 20, 2021 at 08:26:03AM -0700, Zachary Mayhew wrote:
> > > > Subject: [PATCH] staging: fbtft: add docs for fbtft_write_spi()
> > > 
> > > Odd, this shouldn't be in the body of the email :(
> > > 
> > > > 
> > > > This patch adds documentation for fbtft_write_spi() to make its
> > > > calling context clear and explain what it does.
> > > > 
> > > > Signed-off-by: Zachary Mayhew <zacklukem.kernel@gmail.com>
> > > > ---
> > > >  drivers/staging/fbtft/fbtft-io.c | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > > 
> > > > diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
> > > > index de1904a443c2..985d7cf8c774 100644
> > > > --- a/drivers/staging/fbtft/fbtft-io.c
> > > > +++ b/drivers/staging/fbtft/fbtft-io.c
> > > > @@ -5,6 +5,19 @@
> > > >  #include <linux/spi/spi.h>
> > > >  #include "fbtft.h"
> > > >  
> > > > +/**
> > > > + * fbtft_write_spi() - write data to current spi
> > > > + * @par: Driver data including driver &struct spi_device
> > > > + * @buf: Buffer to write to spi
> > > > + * @len: Length of the buffer
> > > > + * Context: can sleep
> > > > + *
> > > > + * Builds an &struct spi_transfer and &struct spi_message object based on the
> > > > + * given @buf and @len.  These are then used in a call to spi_sync() which will
> > > > + * write to the spi.
> > > > + *
> > > > + * Return: zero on success or else a negative error code
> > > > + */
> > > >  int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len)
> > > >  {
> > > >  	struct spi_transfer t = {
> > > > -- 
> > > > 2.33.0
> > > > 
> > > > 
> > > 
> > > Is this file being imported into the kernel doc tools?  If so, great, if
> > > not, this isn't going to help out all that much, right?
> > 
> > It doesn't appear to be imported at this time, as such it may not be
> > necessary.
> 
> So is this change needed?

No it isn't.  Sorry for the trouble :)

> 
> thanks,
> 
> greg k-h

Thanks
-Zachary Mayhew
