Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB07A2A938C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 11:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AA16E99F;
	Fri,  6 Nov 2020 10:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F8F6E99F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 10:01:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3052DD4A;
 Fri,  6 Nov 2020 05:01:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 06 Nov 2020 05:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=szcaW1ToeyMxKGu7yk8Mf0GSWRD
 agbG3DtAqq9F1Iyg=; b=4sX5WLB/R+Jl+VsHSdfpSyDxymjmv8bdL79JJAZNVht
 HQq+M4D+pE0srvxQ6ejqsEYWSmB54qFJ1KoTvP4a4SEbDGAZ3r1JjigbbCtKvYNm
 QSH/6k84cWd5fh0aE4jPsy7DGifwvDmn6z2NlyrSbWmJ4Ip3R90avVdAIHXGFi4g
 QZXsE+kJt8kP2nt9yb5QwAQZVEhPNIJMmUtf+bG1W9mSknwr2heFXKd8BNvTjz68
 yOU/K0M5m60rR+TiVYzAtv9ckQ5T4GSkBtPmUF9VGG+UxSq5wGXIXCXwpvFwMUkS
 QWcj1dtGUYBAZcA3t9/1O1DZe6cPYnsd/51sy03B3yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=szcaW1
 ToeyMxKGu7yk8Mf0GSWRDagbG3DtAqq9F1Iyg=; b=X4ubWlI9r+eZZFCf6nLhjz
 hIUmw66Vjl++mvFIGrlZSqlAJRVwxSl9nMzMQupMtGzuDLNji8nPdU/5CEa5Z+bB
 jeobGpIzGUehwzUonWcM/NxA1vMULWSPIf9JU1OxXaUejHvrGlbEdw0RGFOSFtAK
 Dv6yrikobKuBz4mnDacPijIkdyKKuYgtAM8usRT02TTGDvFv9QrZ0XlPQ4GTNv0T
 VKvGp5/p5k3P+VfC91UqQ0IpJy/Ukj1Gmxbv8usZa8+izw2UsrhUWXXAAtXnalu2
 LRNUZ+9bY1ruPsfsRXQnsGrfYZsdkMJMKR7//i6RV0owcOKUEWo5AxSUWNuNYVuw
 ==
X-ME-Sender: <xms:3x6lXxyp-3Y1gKDK8tJCHRSpuu7Vs7pU2dRZg_6N8fYrnTBwlxStMw>
 <xme:3x6lXxRF3DiNf4tnVRXPsulHAHBSbVVTCHysWyeTQYk3Sw34K7tMMx46-hIta3WUf
 hdaNBNznVGY_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtledgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:3x6lX7W5qRlyLieuL3Iy97EByRmQm8uJnsEkOx3mHNPdPEQIK8_2jA>
 <xmx:3x6lXzgc3Nde2GU_p__eBXmVUXvZaHtAwBqo4gcdjJrlEBPLZs9sSg>
 <xmx:3x6lXzAY9nkPPem6EBylH9ECjiU26w19DoVSwmcrGA4ZH3gnmWAJ5A>
 <xmx:4B6lX2P7eZ170otgRg7J_fwn8mW2T1jjrrwMXLIruPgPYOs5A7VnIw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59BB53060065;
 Fri,  6 Nov 2020 05:01:03 -0500 (EST)
Date: Fri, 6 Nov 2020 11:01:49 +0100
From: Greg KH <greg@kroah.com>
To: Hassan Shahbazi <hassan.shahbazi@somia.fi>
Subject: Re: [PATCH] staging: fbtft: fb_watterott: fix usleep_range is
 preferred over udelay
Message-ID: <20201106100149.GA2705820@kroah.com>
References: <20201101002010.278537-1-hassan@ninchat.com>
 <20201101063948.GB432418@kroah.com>
 <20201101103244.GA284952@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101103244.GA284952@ubuntu>
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 01, 2020 at 12:32:44PM +0200, Hassan Shahbazi wrote:
> On Sun, Nov 01, 2020 at 07:39:48AM +0100, Greg KH wrote:
> > On Sun, Nov 01, 2020 at 02:20:10AM +0200, Hassan Shahbazi wrote:
> > > Fix the checkpath.pl issue on fb_watterott.c. write_vmem and
> > > write_vmem_8bit functions are within non-atomic context and can
> > > safely use usleep_range.
> > > see Documentation/timers/timers-howto.txt
> > > 
> > > Signed-off-by: Hassan Shahbazi <hassan@ninchat.com>
> > > ---
> > >  drivers/staging/fbtft/fb_watterott.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/fbtft/fb_watterott.c b/drivers/staging/fbtft/fb_watterott.c
> > > index 76b25df376b8..afcc86a17995 100644
> > > --- a/drivers/staging/fbtft/fb_watterott.c
> > > +++ b/drivers/staging/fbtft/fb_watterott.c
> > > @@ -84,7 +84,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
> > >  			par->txbuf.buf, 10 + par->info->fix.line_length);
> > >  		if (ret < 0)
> > >  			return ret;
> > > -		udelay(300);
> > > +		usleep_range(300, 310);
> > >  	}
> > >  
> > >  	return 0;
> > > @@ -124,7 +124,7 @@ static int write_vmem_8bit(struct fbtft_par *par, size_t offset, size_t len)
> > >  			par->txbuf.buf, 10 + par->info->var.xres);
> > >  		if (ret < 0)
> > >  			return ret;
> > > -		udelay(700);
> > > +		usleep_range(700, 710);
> > 
> > How do you know that these ranges are ok?  Are you able to test these
> > changes with real hardware?
> > 
> > thanks,
> > 
> > greg k-h
> 
> No, I don't have the hardware to test with. I just used the current
> value as the minimum and added an epsilon to it for the maximum
> param.

It's best not to guess about this, sorry, you should have the hardware
to test this type of change.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
