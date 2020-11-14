Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E952B2D30
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 13:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4906E913;
	Sat, 14 Nov 2020 12:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73CE6E913
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 12:47:26 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id w20so1696577pjh.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 04:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/alDDGu77kr1jyJS2Dgo0f8lEWMLifOcaqhyEonywU8=;
 b=aZZUKtrUI7FUZgNGTm6DhtaXCamioS0bcVM4yFOgeZ+hB3mXPddqxnr31T1x6L9cUR
 MWquPRrsz+r8KdnHNpo23GDU1SPGYQ+vxFD3gzNIm15BlwfVU7/+Q/Hqt6qG1jgRGplg
 R75u0DD9C2uGSJj+wOvc8R9h97myHYN0cywbq8d0Wg1qglgQ6ELvlpKqYORyUQOW/Y7o
 G5zBMMdU2blRUi2RtuFa4x/SW6tllf97FApPk2ItQlc9+UQdy1ljwxYr/STw5eW9g4a8
 WFmU+f13dm0rNIwTUURrUGfbfVZpqQOm6rHy0nJdoFYUWBQvIXMSwaFo0wBQSs/X6hAD
 Xi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/alDDGu77kr1jyJS2Dgo0f8lEWMLifOcaqhyEonywU8=;
 b=lWphjnD8fVqFXVV9NHVGH2dEmRvK4tUNaRKw0BFfCluun9IvCQHjBlwTStxCGP+83K
 dzl5gEhRN7dQpPRXkx03wBvrksBU2zY578qhP6EWfE+133VxQlh0NsqS2L0JisB/djjy
 Y6jwlDXc+G1GZKSgvpSCvmly7B7jiri41PzbWhV5N137/E4se17E85Nh5G59wsiStl6C
 3Z56LjNsUI5iJXty3jfAWXXJkmxq85/cIe9u+6JKmO0MMBDGhbby/u5ZYVauxB4IC/gN
 vspSeHnFgxlVT0ocRCTVBVqNdgI73urIa1Y1Dry0rU1GnJSzcyCZaxY2pWOq7fjYBVp8
 Lzyw==
X-Gm-Message-State: AOAM531E8gOLP6eR+tuTHluG5X35qmvp8Hq/CqeNX1wLZsHQEJxQqMIH
 x5Qe98HVKBHjKFP/soZXyw==
X-Google-Smtp-Source: ABdhPJxSMdYyDAOZ38fW7UFYncbtCKRMWFct9sclLFI+IJLblPh6HQkyy4+V8bEkfe5qfFkLISAaeA==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr7589631pji.7.1605358043132; 
 Sat, 14 Nov 2020 04:47:23 -0800 (PST)
Received: from PWN ([221.124.243.27])
 by smtp.gmail.com with ESMTPSA id s9sm12522743pfs.89.2020.11.14.04.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 04:47:22 -0800 (PST)
Date: Sat, 14 Nov 2020 07:47:16 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
Message-ID: <20201114124716.GA12895@PWN>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
 <X68NFzaAuImemnqh@kroah.com> <20201114081021.GA11811@PWN>
 <X6/K/S9V7rj2hI5p@kroah.com> <X6/L/lE2pA7csBwd@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X6/L/lE2pA7csBwd@kroah.com>
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
Cc: dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 01:22:22PM +0100, Greg Kroah-Hartman wrote:
> On Sat, Nov 14, 2020 at 01:18:06PM +0100, Greg Kroah-Hartman wrote:
> > On Sat, Nov 14, 2020 at 03:10:21AM -0500, Peilin Ye wrote:
> > > Thanks for reviewing!  Questions about the last patch [5/5] though, it
> > > depends on the following assumption:
> > > 
> > > """
> > > For each console `idx`, `vc_cons[idx].d->vc_font.data` and
> > > `fb_display[idx].fontdata` always point to the same buffer.
> > > """
> > > 
> > > Is this true?  I think it is true by grepping for `fontdata`.  I also
> > > noticed that fbcon.c is using `vc->vc_font.data` and `p->fontdata`
> > > interchangeably, see fbcon_get_requirement():
> > > 
> > > 		vc = vc_cons[fg_console].d;
> > > 		[...]
> > > 			p = &fb_display[fg_console];
> > > 			caps->x = 1 << (vc->vc_font.width - 1);
> > > 					^^^^^^^^^^^
> > > 			caps->y = 1 << (vc->vc_font.height - 1);
> > > 					^^^^^^^^^^^
> > > 			caps->len = (p->userfont) ?
> > > 				FNTCHARCNT(p->fontdata) : 256;
> > > 					   ^^^^^^^^^^^
> > > 
> > > If it is true, then what is the point of using `fontdata` in `struct
> > > fbcon_display`?  Just for the `userfont` flag?  Should we delete
> > > `fontdata`, when we no longer need the `userfont` flag?
> > 
> > Yes, after a quick look, I think your analysis here is correct.  So if
> > you can delete that, it would be nice if possible.

I see, at the moment we still need `userfont` for refcount handling, I
will try to delete both `fontdata` and `userfont` after refcount is
taken care of.

> > > In this sense I think [5/5] needs more testing.  Do we have test files
> > > for fbcon, or should I try to write some tests from scratch?
> > 
> > I don't know of any direct tests, I usually just booted into that mode
> > and saw if everything looked like it did before.  There must be some
> > tool that you can use to change the current font, as it seems to happen
> > at boot time on some distros.  I can't remember what it's called at the
> > moment...
> 
> Ah, here's a hint:
> 	https://wiki.archlinux.org/index.php/Linux_console#Fonts
> 
> The setfont tool should help you out here.

Oh, I didn't know about this one.  I'll go experimenting with it,
thank you!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
