Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A700A2B4078
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 11:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EB889DA6;
	Mon, 16 Nov 2020 10:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E4B89DA6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 10:09:53 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 10so23158987wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 02:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4MLjK6J0k3buFVe3tEUAsMN0q98BNbXOGLlBrDEbH84=;
 b=a6i4D5Y+4nk3y2ls3YB96MU9fUh3mrXTMUe7VWAWUO3gFEHiRJQkOBB1u+DeDeRvx1
 eHxFOkkp52v2pmkNR/GLFPHURXZW/zkqIWmLE4cb76mndPZDbjTiwpngE6kr21lARrEO
 GxzLEG61dbv150CtbZBkFr0qmeEUf0PnoJx+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4MLjK6J0k3buFVe3tEUAsMN0q98BNbXOGLlBrDEbH84=;
 b=CmQTvNBxvN4fDjHAKwU8Ip8kBlaik1+9qtyVUu143LGHri/4z+I3Bzzoqm4w9e/Q9+
 mW4Ge9u6/6cSHddgTwqWVruu2FpIxRWgRALqHAm9vh8LGAgXrPKqfT/x19OBDlrckR1j
 mcADusHhAj7zdr+KY562JPxvF0L/DHU49ux6x6sPegmHyycyucMZud3Ay774vwFg8UXi
 mGjXar9ExSd/PtPb1xE6gQ9KVKHer1VFnnWRlhahqlTqUDrksaXM+on7bPE5yOM4QaVI
 FXfqRXZ3ErvtDb3UwOgX4NyY4uXAslduMXBScrZZKLzmyEwaMzwo/+QeFBuPT3jh9UBo
 MEtg==
X-Gm-Message-State: AOAM531dsloNvhx1vw2kkmYqyaVPrfVk2Pg8ABXIdqR0CM3hmQ0NKeJy
 psQFliDpB76oZkLEuxHQInXkqw==
X-Google-Smtp-Source: ABdhPJwONcExmyTYHidHN0GxV7kDjejfxFlk6aedYSxZdK1kyQtA0Gq67bmGzc2T92ICVkGj4qFCXw==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr14508609wmg.3.1605521392276;
 Mon, 16 Nov 2020 02:09:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u23sm20369149wmc.32.2020.11.16.02.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:09:51 -0800 (PST)
Date: Mon, 16 Nov 2020 11:09:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
Message-ID: <20201116100949.GA401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
 <X68NFzaAuImemnqh@kroah.com> <20201114081021.GA11811@PWN>
 <X6/K/S9V7rj2hI5p@kroah.com> <X6/L/lE2pA7csBwd@kroah.com>
 <20201114124716.GA12895@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114124716.GA12895@PWN>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 07:47:16AM -0500, Peilin Ye wrote:
> On Sat, Nov 14, 2020 at 01:22:22PM +0100, Greg Kroah-Hartman wrote:
> > On Sat, Nov 14, 2020 at 01:18:06PM +0100, Greg Kroah-Hartman wrote:
> > > On Sat, Nov 14, 2020 at 03:10:21AM -0500, Peilin Ye wrote:
> > > > Thanks for reviewing!  Questions about the last patch [5/5] though, it
> > > > depends on the following assumption:
> > > > 
> > > > """
> > > > For each console `idx`, `vc_cons[idx].d->vc_font.data` and
> > > > `fb_display[idx].fontdata` always point to the same buffer.
> > > > """
> > > > 
> > > > Is this true?  I think it is true by grepping for `fontdata`.  I also
> > > > noticed that fbcon.c is using `vc->vc_font.data` and `p->fontdata`
> > > > interchangeably, see fbcon_get_requirement():
> > > > 
> > > > 		vc = vc_cons[fg_console].d;
> > > > 		[...]
> > > > 			p = &fb_display[fg_console];
> > > > 			caps->x = 1 << (vc->vc_font.width - 1);
> > > > 					^^^^^^^^^^^
> > > > 			caps->y = 1 << (vc->vc_font.height - 1);
> > > > 					^^^^^^^^^^^
> > > > 			caps->len = (p->userfont) ?
> > > > 				FNTCHARCNT(p->fontdata) : 256;
> > > > 					   ^^^^^^^^^^^
> > > > 
> > > > If it is true, then what is the point of using `fontdata` in `struct
> > > > fbcon_display`?  Just for the `userfont` flag?  Should we delete
> > > > `fontdata`, when we no longer need the `userfont` flag?
> > > 
> > > Yes, after a quick look, I think your analysis here is correct.  So if
> > > you can delete that, it would be nice if possible.
> 
> I see, at the moment we still need `userfont` for refcount handling, I
> will try to delete both `fontdata` and `userfont` after refcount is
> taken care of.

+1 on sunsetting fondata. I think there's a bunch of these in fbcon code,
because the console subsystem is older than the standard "allow drivers to
embed the subsystem struct into their own private struct" subclassing
model. So lots of global arrays indexed by the console id :-/

> > > > In this sense I think [5/5] needs more testing.  Do we have test files
> > > > for fbcon, or should I try to write some tests from scratch?
> > > 
> > > I don't know of any direct tests, I usually just booted into that mode
> > > and saw if everything looked like it did before.  There must be some
> > > tool that you can use to change the current font, as it seems to happen
> > > at boot time on some distros.  I can't remember what it's called at the
> > > moment...
> > 
> > Ah, here's a hint:
> > 	https://wiki.archlinux.org/index.php/Linux_console#Fonts
> > 
> > The setfont tool should help you out here.
> 
> Oh, I didn't know about this one.  I'll go experimenting with it,
> thank you!

We're also trying to start some kind of test suite for fbdev chardev ioctl
interface in the gpu test suite. fbcon tests are maybe more related to
tty/vt, and I have no idea whether anything exists there already.

But if you want to do some automated testcases for fbcon and there's
absolutely no other home for them, the gpu test suite might be an option
of last resort too:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-and-validation

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
