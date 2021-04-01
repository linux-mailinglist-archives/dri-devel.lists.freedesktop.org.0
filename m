Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F626350EF3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 08:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597886EC6D;
	Thu,  1 Apr 2021 06:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2135F6EC6D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 06:22:04 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id r20so1009764ljk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 23:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J4Zq0HjOinbfHP5aBY53rgZkCipWhKts2kh7ZSzk5ms=;
 b=nNPmQoBz383rd79jRE8PX7JDh4GxKdLSr5KrqmQXgAH+JEHkkKVh+wcRLB3w3gqxhp
 28YVmMzbcwbyWxNsh81zFdYCp8Mi4IPrrP4QRHqbVgsJIXssB/XGuhKKiLNoaTWimTF9
 59E2s+ADMs6oibIMXI09iVb9oxOLD+UhcqK+368KZ+My8/sVdP7+LC6603ja66WWd3BD
 MvNdHtPOElIXY08uoXD1HtRUgF0wIVWa1AEE5YlBO6wyuMI2FTRqONNuDqkNyrvw5RYz
 6k3c8F7CCDUzP7OluS6uOypQtDIRo7qaoDTof32sFi1jitSLnXP7VHbvKsf8j7PGzzG2
 gCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J4Zq0HjOinbfHP5aBY53rgZkCipWhKts2kh7ZSzk5ms=;
 b=XPkfhrsgLyrkTfhGR8eF4Gvx0WAzd4nXZ7oB9cs0ootXVV+JxhJTtfTSu80/CpSDYM
 R8DTY6AYJMVaBHkaopB99LBlb8gvTzjtZ+qFlOj5j+u2yldtCBvA4saJkTVolXdykaae
 RMY5EiMpPXxy6ouf9sfvQ9eTFvoHgAoMj2TapIjiiJhLIx5Lar+nuGo+SNn8Pugz2/wY
 PH6diYjFJL6oVGloQ9IH2ZjG90GE6Lm/O87TzHV+5awmgdP//WGXBLNnsDODZ0b2q7RJ
 aKP+inKa/ubQwl4poqiz1TV7K6CEPQkn+XsGBMobVdDjkizmbZXe08gh+OjkP92Lkw16
 0sWA==
X-Gm-Message-State: AOAM530lkteVrN1EDQTIT1XT+swyK4clE6t30XCrIBvHscYytVhnIuV/
 f91mvo1MstkszuG7aO5sTuo=
X-Google-Smtp-Source: ABdhPJxogPj7Otl1m3M2d2zKHtaf0HLq3zXFlpS4kjvFTAT4v1rDHDTNPvgGvOV5uDOSFCbkMD9wYA==
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr4477993ljk.169.1617258122518; 
 Wed, 31 Mar 2021 23:22:02 -0700 (PDT)
Received: from gentoo (cable-hki-50dc2f-26.dhcp.inet.fi. [80.220.47.26])
 by smtp.gmail.com with ESMTPSA id l6sm442160lfp.13.2021.03.31.23.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 23:22:02 -0700 (PDT)
Date: Thu, 1 Apr 2021 09:21:54 +0300
From: Hassan Shahbazi <h.shahbazi.git@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] fix NULL pointer deference crash
Message-ID: <20210401062154.5evjajj64r4tjseh@gentoo>
References: <20210331163425.8092-1-h.shahbazi.git@gmail.com>
 <YGSyFgeNd7gfsbR6@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGSyFgeNd7gfsbR6@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 h.shahbazi.git@gmail.com, jirislaby@kernel.org, yepeilin.cs@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 07:32:06PM +0200, Greg KH wrote:
> On Wed, Mar 31, 2021 at 07:34:29PM +0300, Hassan Shahbazi wrote:
> > The patch has fixed a NULL pointer deference crash in hiding the cursor. It 
> > is verified by syzbot patch tester.
> > 
> > Reported by: syzbot
> > https://syzkaller.appspot.com/bug?id=defb47bf56e1c14d5687280c7bb91ce7b608b94b
> > 
> > Signed-off-by: Hassan Shahbazi <h.shahbazi.git@gmail.com>
> > ---
> >  drivers/video/fbdev/core/fbcon.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index 44a5cd2f54cc..ee252d1c43c6 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -1333,8 +1333,9 @@ static void fbcon_cursor(struct vc_data *vc, int mode)
> >  
> >  	ops->cursor_flash = (mode == CM_ERASE) ? 0 : 1;
> >  
> > -	ops->cursor(vc, info, mode, get_color(vc, info, c, 1),
> > -		    get_color(vc, info, c, 0));
> > +	if (ops && ops->cursor)
> 
> As ops obviously is not NULL here (you just used it on the line above),
> why are you checking it again?

Yes, that's right. I will remove that check and will submit a new patch.


> And what makes curser be NULL here?  How can that happen?

Honestly, I don't know. I reproduced the crash on my local, followed the
stack trace, and then changed the line to avoid the crash. If you think this
patch is not the best solution, I can drop it and investigate more to find
the root cause.


> Also your subject line can use some work, please make it reflect the
> driver subsystem you are looking at.
 
This was a mistake, I did not intend to change the subject. I will ensure
the next patch reflects the subsystem.

> thanks,
> 
> greg k-h

Best,
Hassan Shahbazi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
