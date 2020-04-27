Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A031BBDFA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F4B6E3B8;
	Tue, 28 Apr 2020 12:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3FA89AE6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 12:36:29 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g16so13311045eds.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 05:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PLUp+H7tLoE7SqL2B/5Sr5RyPMPq2y7xz4BTXAvd9zk=;
 b=Mf1WP5XnzaDH9wPHukRV8bbvRPNRmZ2+SC0Y3EZgsPhYhW+DN+4m+XsX6HAJMlmJFd
 9wjS25y9Zb1+0Z7IxanewEwe1SvR1CymsXiS0Mvyy7I3Ymvn7ek3E7B6bVbN3Gni+Or4
 vlleN1AxUg+T/IJGQ3MDxDoeeQqj6mhCk2Q+1WzBPAMItDnER+7Hv0oOQBpWUVyYUbKl
 YTKdKJ/tk7xyobHPvOf1TOkEVdTCvPggyXpDfakHgb1jrn722RJRqf2B+bx2gaQhJGS8
 lLNnttJpyVU4XSwBqVvcDR7jUydDRzNvqiIUOrzcK+pEu4QoPT8/8y8FbjnLzq553q9v
 utPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PLUp+H7tLoE7SqL2B/5Sr5RyPMPq2y7xz4BTXAvd9zk=;
 b=MqqDvL7Jg2xfsgr4nEK30rizrej+h9nMK73PrVHfsBrXYWrwbONuVqTh+o8YnY0J83
 DWkWywl5nKZYV9qKyhDD9kw50qZjD5ZMrDVPpKJDIKvkhENo8mI3i51tl/0dYsY6aC0+
 sZGm+VrL7Yhq+o2h0fi11GWzzNvRdtmcUZgv5fGStMNSmo5m7WKctekTnH875NLgbJ6j
 YMwWR0R8ndnF9ipyv8pBx5AHnZzvHVCZrHPe+NMlVgDU4N4fp58yfipYDKckAGnxh/a6
 cE3kE2BlyjoZDGrUb4Nkcf7EATwWbojnxgWJN+DnJkB3PJ5mBKEcsPd3BGU6uwOAZRxy
 RxeA==
X-Gm-Message-State: AGi0PuaMY3k5IyMQYa03fV7933PLh8ZxOKfqnWNSiAN+WZimt1GPC2Bk
 jWPlodXIDfXrQYQe9G4x4ZA=
X-Google-Smtp-Source: APiQypIWrAvc4+fSH7YxABePAo7Zu9cVJBR6VJKr1ooQvQPnNyq7X9TWDSeFjgjWJ2uHKxGNGt1ZSA==
X-Received: by 2002:aa7:dd84:: with SMTP id g4mr14403690edv.257.1587990987953; 
 Mon, 27 Apr 2020 05:36:27 -0700 (PDT)
Received: from localhost
 (ipv6-80adf4751ff4da96.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:80ad:f475:1ff4:da96])
 by smtp.gmail.com with ESMTPSA id z26sm2941505ejb.36.2020.04.27.05.36.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 05:36:27 -0700 (PDT)
Date: Mon, 27 Apr 2020 14:36:25 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v1] staging: fbtft: fb_st7789v: Initialize the Display
Message-ID: <20200427123625.GE18436@portage>
References: <1586424337-26602-1-git-send-email-oliver.graute@gmail.com>
 <20200409102013.GP2001@kadam> <20200427083642.GD18436@portage>
 <20200427093306.GU2682@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200427093306.GU2682@kadam>
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

On 27/04/20, Dan Carpenter wrote:
> On Mon, Apr 27, 2020 at 10:36:42AM +0200, Oliver Graute wrote:
> > On 09/04/20, Dan Carpenter wrote:
> > > On Thu, Apr 09, 2020 at 11:25:32AM +0200, Oliver Graute wrote:
> > > > From: Oliver Graute <oliver.graute@kococonnector.com>
> > > > 
> > > > Set Gamma Values and Register Values for the HSD20_IPS
> > > > 
> > > > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> > > > ---
> > > >  drivers/staging/fbtft/fb_st7789v.c | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> > > > index 84c5af2dc9a0..b0aa96b703a8 100644
> > > > --- a/drivers/staging/fbtft/fb_st7789v.c
> > > > +++ b/drivers/staging/fbtft/fb_st7789v.c
> > > > @@ -17,8 +17,8 @@
> > > >  #define DRVNAME "fb_st7789v"
> > > >  
> > > >  #define DEFAULT_GAMMA \
> > > > -	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25\n" \
> > > > -	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25"
> > > > +	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
> > > > +	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"
> > > 
> > > How do you know this won't break someone else's setup?
> > 
> > Should I declare an extra define for my values?
> > 
> > +#define HSD20_IPS_GAMMA \
> > +	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
> > +	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"
> > 
> 
> That's fine, but it can't be a compile time thing.  Both types of
> hardware have to be working/available at run time.

ok, what is the proper way to handover the gamma values during run time?

Best Regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
