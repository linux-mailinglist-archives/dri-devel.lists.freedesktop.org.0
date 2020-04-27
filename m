Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784D51BBE11
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5586E3F5;
	Tue, 28 Apr 2020 12:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD9089BEC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:31:27 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w2so12797413edx.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WPH5/Zlcqqn9jGHb2A/nk7Bqq0SDpzjFGzAMIfPBowQ=;
 b=mYjyhUXFbxEIMXtgY0vSdYqGUr1EbrvFAIQjTkRr1ALQCGiJvo7s6Bcx4m7NS1IwuB
 uRh/LzJNgY89RlGpRkq+u4mZ6jAvNtGW9rvhAlMDK3pc9dV/b6ruLFaZ32gGsPz3MxFY
 wqhIUEWUwN2ZJ39Y+PYE54BQ1WqmIju37doUrpO/SbUQ0rFO+isDIsgqPacYITyRlk6P
 q2YqHEwIEN3LW8d63Y7TiHgP9P/+RcvcDrhT7bqOzXh378wDK453x8L5j5WZSoqUFOm2
 tzy/rl/kc4V5G7mwbCb2r/fM2uaaK5t8GQGRJw1QXwmNNHKn6b+StnGdM6EPaG4AkJQn
 mwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WPH5/Zlcqqn9jGHb2A/nk7Bqq0SDpzjFGzAMIfPBowQ=;
 b=sNpBnYNSYfuc3sWFV7619TRcfpBKQJOOX8CThM+pKpS78SV6RSa9NZZgmYuF88gDoi
 dHxpi2tJg0HbfBJxrBIvTkOyFg+eA8IAvbQyRAree6v2Jm1q81QWdNrY+UNpiDBwvm+R
 UA2bhs6KxXQrIIwTVZSqd+KeXusc4ARsRUJ3zx/Kf7nRF1GHzBm6dLmz16yvu/qpzPOX
 ydb3KTCHJ7mTVewvGmqSr/l7X71eEAyGKJazPLx66V13BG52WloDXksEGU6ouaEHRv+m
 JUR3wPbUjxw+cxOFtERxHUwGQO4zbsl7XfAGmGPL9ZNdKiMkfXr8bth6YBl3UtDEl3CO
 inTA==
X-Gm-Message-State: AGi0PuZiPxbHm90pKaO7isJ9teW8NZTonrJvsOpepVS9iJlKRsP4PBD4
 LnMf0kIcatmG6rPP8AJrVps=
X-Google-Smtp-Source: APiQypJYZ21+xAeHnds1LUPiq55TXGrzfyODDqdoQ37szQSXON7GL+0GbZVJL5ws5i/hPdVWqYs5zQ==
X-Received: by 2002:a50:d98b:: with SMTP id w11mr16355293edj.196.1587976286295; 
 Mon, 27 Apr 2020 01:31:26 -0700 (PDT)
Received: from localhost
 (ipv6-80adf4751ff4da96.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:80ad:f475:1ff4:da96])
 by smtp.gmail.com with ESMTPSA id w4sm2005854eds.92.2020.04.27.01.31.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 01:31:25 -0700 (PDT)
Date: Mon, 27 Apr 2020 10:31:24 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v1] staging: fbtft: fb_st7789v: enabled inversion
Message-ID: <20200427083124.GC18436@portage>
References: <1586424250-25897-1-git-send-email-oliver.graute@gmail.com>
 <20200409101416.GN2001@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409101416.GN2001@kadam>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
 gregkh@linuxfoundation.org, Oliver Graute <oliver.graute@kococonnector.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/04/20, Dan Carpenter wrote:
> On Thu, Apr 09, 2020 at 11:24:05AM +0200, Oliver Graute wrote:
> > From: Oliver Graute <oliver.graute@kococonnector.com>
> > 
> > Enable inversion mode
> > 
> > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> > ---
> >  drivers/staging/fbtft/fb_st7789v.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> > index 3c3f387936e8..84c5af2dc9a0 100644
> > --- a/drivers/staging/fbtft/fb_st7789v.c
> > +++ b/drivers/staging/fbtft/fb_st7789v.c
> > @@ -120,6 +120,10 @@ static int init_display(struct fbtft_par *par)
> >  	write_reg(par, PWCTRL1, 0xA4, 0xA1);
> >  
> >  	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
> > +
> > +	/* enable inversion mode */
> > +	write_reg(par, 0x21);
> 
> Use the define and delete the comment.
> 
> 	write_reg(par, MIPI_DCS_ENTER_INVERT_MODE);

ok, I'll do on next version

Best regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
