Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9223F56CF37
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 15:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7A31131B5;
	Sun, 10 Jul 2022 13:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6351131B5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 13:00:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d13-20020a05600c34cd00b003a2dc1cf0b4so1620030wmq.4
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=URkBqTaJYZiBKaHkMPyuusVxdAfWQV7wmB1QtdU3dqc=;
 b=H28NNWSz9kCHmESG/8FbsQ+m+Jzxy0qUH0fyz1nTVT1VnfBfH5jiuEPkD53FXHjSzn
 B/1dX86SUM+LrKgLI+OYmFPx82FdsB7V7yt8sf5XzwbtSzPbPhDXFQePbTiQi3lyyDyP
 gMD3/4c+Za4D22NF6y4FK7z/NMbKVISAdm+vnmThUgp797/YBqaFhAmGGecJT+SZcrvc
 nZn0bWReEM8Dfarg2Hm6x7djFxVUPsFttf22okgYsWEwwHRp6hldOhLKJUHUfEK3zrDn
 HiqibjwQLKcAMiflSho4wiD/UVJX6XpYIzFXuACDbKgxRHdZNZO8RPbciEo4gE2fs92g
 WkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=URkBqTaJYZiBKaHkMPyuusVxdAfWQV7wmB1QtdU3dqc=;
 b=12UDYGo7DoM6T1NhsKw5DTrhVAAGyM0UVEqhjoTtKcoExY0mmOUNGgtmJldz1fwtPG
 aaONq2oWhKh5+qhzFbNnT0o52gSqIzI6WssJGFIbvwjRt4PzQLYnIrhOrlfR9B+6hamU
 W/PQzLwMChVtBC3g9ESGWBI6FzLSLa65xwTiUEnbKC9gE7uG4zv003zaVNtllLx9+vus
 yAA5mQQfoSen/UZByrJJ4dbCf6yBtVUqw+WtDBmydn8Xlcuke0QivDs/3cLoLGi0JoFD
 1dx4g4/KRxoquC75PLfRcUxkEcagrhzgcF1By2fD0vAJMOhWblAaCF06KmYh1tXprevT
 9qzQ==
X-Gm-Message-State: AJIora+x6QyX3//tlYWDZ5FTsGxntDz3/JABk/+93bsV37629HWyGxIX
 wLhSdhOBXFWzrK2shNlF0pTCV1AUiZYvft9i
X-Google-Smtp-Source: AGRyM1vsTGSbf96VTwX0XNh02DsOlmP27A9LgNPMyEn1EV6Jd3PuivbWE971HAL4v79NdOzdGIsDng==
X-Received: by 2002:a05:600c:4f4d:b0:3a1:98de:abde with SMTP id
 m13-20020a05600c4f4d00b003a198deabdemr10439595wmq.36.1657458022784; 
 Sun, 10 Jul 2022 06:00:22 -0700 (PDT)
Received: from mandalorian.koija ([2a02:587:4ba0:ca00:f1ee:516:279c:45e9])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a05600c2b8200b0039c8a22554bsm3876989wmc.27.2022.07.10.06.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 06:00:22 -0700 (PDT)
Date: Sun, 10 Jul 2022 16:00:19 +0300
From: Christos Kollintzas <c.kollintzas.92@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: fbtft: replace udelay with usleep_range
Message-ID: <YsrNY+uU8tUXJiPV@mandalorian.koija>
References: <YslTQLhM7GSaGXki@mandalorian.koija> <YslY25NnW6O5Tn+p@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YslY25NnW6O5Tn+p@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 09, 2022 at 12:30:51PM +0200, Greg KH wrote:
> On Sat, Jul 09, 2022 at 01:06:56PM +0300, Christos Kollintzas wrote:
> > Adhere to Linux kernel coding style.
> > 
> > Reported by checkpatch:
> > 
> > CHECK: usleep_range is preferred over udelay
> > 
> > Signed-off-by: Christos Kollintzas <c.kollintzas.92@gmail.com>
> > ---
> >  drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
> > index c680160d6380..eeafbab4ace1 100644
> > --- a/drivers/staging/fbtft/fb_upd161704.c
> > +++ b/drivers/staging/fbtft/fb_upd161704.c
> > @@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)
> >  
> >  	/* oscillator start */
> >  	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
> > -	udelay(100);
> > +	usleep_range(100, 110);
> 
> When doing these types of changes, you really need access to the
> hardware involved in order to be able to properly test it.
> 
> Especially for this type of function which is trying to do timing
> changes which the hardware requires.
> 
> Did you test this on the real hardware and did it work properly?
> 
> thanks,
> 
> greg k-h

I did not.

I will try to find the hardware and send a patch that is
properly tested.

thanks,

Christos Kollintzas
