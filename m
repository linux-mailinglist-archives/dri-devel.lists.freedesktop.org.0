Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5EC2A1F6C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 17:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C549E6EAD9;
	Sun,  1 Nov 2020 16:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9B66EAD4
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 16:08:39 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t6so5543293plq.11
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 08:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4ujqaNLZTDijEUF2WH6i+J3ZjLlaqzw6Z31jdKSaeZk=;
 b=WgDEvNCc6v7J3BuCABRlYis995Jsp1Wha9cp/pKVJQgCH5REDq1P+J61T73puqB4Yb
 tUTYgtpxT8KiAmzlTpxkgnDLSBT1j3C+nwk3UTIYMvud7MWvHhnl6PLeb3jobllhhlx1
 LtfjlBzM7kez9GfoR+bmQjfAOOFIZzcQ6fzfoAk0IqTJOnI8NlS5OypxBOUCjX4jZt1D
 er6SAT1ZWjlsNC0ENxQV/Mcbmy8plKp0LnAeJj1/pKErK+KWiR65zUdW7eiKOSPhUeFB
 TwKrK9SYUuOWRPMIMhU9QrMOe9RFTukJUbXjSWXacTZM2WMSnW3c4gwtvyNrIWwuDBkT
 DZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4ujqaNLZTDijEUF2WH6i+J3ZjLlaqzw6Z31jdKSaeZk=;
 b=UukTY+Vs4I+STvSj2DxVQJpUwOObr5mTDi99eK64VLOd3/xxqz7xdppMrBlMaNEMW/
 aRslVr11NYngbgIcKlYejh+7r+7ydVkl/WNO3D60rpNh4ZQ/AWHR7Mob4oG0Nh0lxi6p
 s5k1AFn0y8SBrmByTQ1RFwwm9Y6zNkkwz9Ynb+33mNdhx3JEzczNdUKnvte+N/MHTk60
 pAzyNu3NhEN93AsuPcAg1w8qQJ4FtIbJ6ZXf9sRoZT+qchQSeOStTvNSgEJF3f7nONBg
 78ZS2lGcNzdc+ILx3hcbhGUIu8REk01MscNDPfdbAti6dCanBRn5gWWEId+UnzhTqPwy
 GKLQ==
X-Gm-Message-State: AOAM532ayHwV6AejU5dKepf8iaQVHQbfmWS4fK/TGNKvOr1VXK3B23GO
 Li2Ww8i+CeQBf4s1pF0U6w==
X-Google-Smtp-Source: ABdhPJw1hyry3WkSvNfiy0flw8faWsiqz2DnvqGWZQK98KPX+tzNklOTt9QdIjEQraS6KPvwrKIWcw==
X-Received: by 2002:a17:90a:5204:: with SMTP id
 v4mr12240028pjh.188.1604246919513; 
 Sun, 01 Nov 2020 08:08:39 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id t15sm11459126pfq.201.2020.11.01.08.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 08:08:38 -0800 (PST)
Date: Sun, 1 Nov 2020 11:08:30 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] fbcon: Replace printk() with pr_*()
Message-ID: <20201101160830.GA1526929@PWN>
References: <20201101094718.GD1166694@ravnborg.org>
 <20201101144904.1522611-1-yepeilin.cs@gmail.com>
 <20201101154113.GA41883@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101154113.GA41883@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 01, 2020 at 04:41:13PM +0100, Greg Kroah-Hartman wrote:
> On Sun, Nov 01, 2020 at 09:49:04AM -0500, Peilin Ye wrote:
> > Replace printk() with pr_err(), pr_warn() and pr_info(). Do not split long
> > strings, for easier grepping. Use `__func__` whenever applicable.
> > 
> > fbcon_prepare_logo() has more than one callers, use "fbcon_prepare_logo:"
> > instead of "fbcon_init:", for less confusion.
> > 
> > Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> >  drivers/video/fbdev/core/fbcon.c | 42 +++++++++++++-------------------
> >  1 file changed, 17 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index cef437817b0d..a3e87ab0e523 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -659,8 +659,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
> >  
> >  	if (logo_lines > vc->vc_bottom) {
> >  		logo_shown = FBCON_LOGO_CANSHOW;
> > -		printk(KERN_INFO
> > -		       "fbcon_init: disable boot-logo (boot-logo bigger than screen).\n");
> > +		pr_info("%s: disable boot-logo (boot-logo bigger than screen).\n", __func__);
> 
> Shouldn't this be:
> 		dev_info(info->dev, "...");
> instead?
> 
> It's a driver, and you have access to the struct device that is being
> worked on, so always try to use the dev_* versions of these calls
> instead when ever possible.

Ah, I see. I'll fix them in v2, thank you!

Peilin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
