Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC6197509
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC0A89F3B;
	Mon, 30 Mar 2020 07:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADCA6E0BC
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 09:38:57 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c20so4480014pfi.7
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 02:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=1FjUt0FY4qG4swr3glwUOGPZovJqvh5BcKDS4lGNLW4=;
 b=JTmZm4tANjipQr6DLS3RinvGorU5jef6avNVRWTXMGMOHc5zWJD8xRNxFdvfYAU4My
 dEKmoB/HJdqNKyrKgkKhGvUtY2NYkWNMrIpeZcIPjbvpkgSoKP+IlQUNP6CyEu+b4qGT
 l+YPnkDIixPJwYLwiuhYT1u38s37mYmi54uDWkT7EzzbeLUFYD5j78Upnr/2DGP4+d6m
 fXVTjObFPYSWpVc+/5VbiQy/dyhcRHQTNROPixtBi5Cc7g9PWtN2eezd9eFyd2k8FEjg
 w49fddJ9HlCac53/1mK3H20pfoGxPXiO70i0BlYo5w+3HCm3cV8SOG5GXIG7hlLiOHcB
 hA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=1FjUt0FY4qG4swr3glwUOGPZovJqvh5BcKDS4lGNLW4=;
 b=Tfy4KSl9i2e5Vulgtglkf6YEM1wqeqS3ituylBgd4v8dHfIC9ROWfs0t5wHNmORDaM
 zaswtofBPf8dC0sy1NbOsEx+pKHbwon8v8hSWSSwoqd/LdvMUZe9ceV5j78G7OrPg2LU
 ipYl+oozJ2JaeZgEeIqL6SkgkBJjqA3Z+XmVJX/QxaQ0BtIXusLHn/5EviO9K8Jw+8xx
 1tNZzVdECCDjktBdz4teUr0OPzRMRifMaaToc4DpLvnlmyVzpn1RN7O1cjQl7lskpKUM
 JsMxeIi0JUuaKnzUljnD1X0q8cwwQdls17YvX/exJAit+zSmL9pjXN+aunwlyHbCtiCw
 0QtQ==
X-Gm-Message-State: ANhLgQ2qD99crJ4Y+KW9EpBdInT3eBCthH6b1L93g3wY7bvG99vKZHQ5
 Dlp9paKUA3eHPAmQu/0wdAuxkt1dZdx4Iw==
X-Google-Smtp-Source: ADFU+vsho0XarlgM5qxPPJLJ7yrus56xN6a1QzWk0breFr82zriHlE38k99Mh8f7T/KzyYmocphc7Q==
X-Received: by 2002:a62:160b:: with SMTP id 11mr8149948pfw.189.1585474737395; 
 Sun, 29 Mar 2020 02:38:57 -0700 (PDT)
Received: from ManjaroKDE ([47.144.161.84])
 by smtp.gmail.com with ESMTPSA id y29sm7265920pge.22.2020.03.29.02.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 02:38:56 -0700 (PDT)
Message-ID: <2fccf96c3754e6319797a10856e438e023f734a7.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: fbtft: Replace udelay with
 preferred usleep_range
From: John Wyatt <jbwyatt4@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 29 Mar 2020 02:38:51 -0700
In-Reply-To: <alpine.DEB.2.21.2003291127230.2990@hadrien>
References: <20200329092204.770405-1-jbwyatt4@gmail.com>
 <alpine.DEB.2.21.2003291127230.2990@hadrien>
User-Agent: Evolution 3.36.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 Payal Kshirsagar <payal.s.kshirsagar.98@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-03-29 at 11:28 +0200, Julia Lawall wrote:
> 
> On Sun, 29 Mar 2020, John B. Wyatt IV wrote:
> 
> > Fix style issue with usleep_range being reported as preferred over
> > udelay.
> > 
> > Issue reported by checkpatch.
> > 
> > Please review.
> > 
> > As written in Documentation/timers/timers-howto.rst udelay is the
> > generally preferred API. hrtimers, as noted in the docs, may be too
> > expensive for this short timer.
> > 
> > Are the docs out of date, or, is this a checkpatch issue?
> > 
> > Signed-off-by: John B. Wyatt IV <jbwyatt4@gmail.com>
> > ---
> >  drivers/staging/fbtft/fb_agm1264k-fl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c
> > b/drivers/staging/fbtft/fb_agm1264k-fl.c
> > index eeeeec97ad27..019c8cce6bab 100644
> > --- a/drivers/staging/fbtft/fb_agm1264k-fl.c
> > +++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
> > @@ -85,7 +85,7 @@ static void reset(struct fbtft_par *par)
> >  	dev_dbg(par->info->device, "%s()\n", __func__);
> > 
> >  	gpiod_set_value(par->gpio.reset, 0);
> > -	udelay(20);
> > +	usleep_range(20, 20);
> 
> usleep_range should have a range, eg usleep_range(50, 100);.  But it
> is
> hard to know a priori what the range should be.  So it is probably
> better
> to leave the code alone.

Understood.

With the question I wrote in the commit message:

"As written in Documentation/timers/timers-howto.rst udelay is the
generally preferred API. hrtimers, as noted in the docs, may be too
expensive for this short timer.

Are the docs out of date, or, is this a checkpatch issue?"

Is usleep_range too expensive for this operation?

Why does checkpatch favor usleep_range while the docs favor udelay?

> 
> julia
> 
> >  	gpiod_set_value(par->gpio.reset, 1);
> >  	mdelay(120);
> >  }
> > --
> > 2.25.1
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit 
> > https://groups.google.com/d/msgid/outreachy-kernel/20200329092204.770405-1-jbwyatt4%40gmail.com
> > .
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
