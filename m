Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5511829205A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 23:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6116E8B4;
	Sun, 18 Oct 2020 21:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88366E8B3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 21:51:30 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id u17so10304053oie.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 14:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOm0rH6s2Inn755KHRA5gyyrbT/Z7MN7Wu94ps17kzM=;
 b=PtP8AXVD5f+47NsKbqu4NiODWxLDn19lVbSVwxYhNGSh+fG5k9ev+in+zI5toF9YIl
 ziHwu7efYWqlJQiUKyfnHgOUIq/uWgYyDqbQ4Zoum18JyJRAPQ5AiXVZ6e1ns47ZRSPa
 HMDzHnJzmzzjLa/NxzqzidWBSY80KuAoUTXsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOm0rH6s2Inn755KHRA5gyyrbT/Z7MN7Wu94ps17kzM=;
 b=qypVJfJj0uWrHKmVoaqCmxNBSLTHnQyI0HpK+oOxjfQBAO2KLUgPl2f11n4plU9BfI
 ubwC3pEkrxVOvBtjOiHJ2ZYNlcd/iR8wOAX3+86fh5NZypKXWCHlGAOLLvDHs0o3Z7ry
 Z5YEooYv5OeQo9IT6kSSW3emK0FVU4AKtjR6DKb0iDFmcEsL3Q30CyNRdjL92bl/juwF
 QRoXl7K03IWx5GgoZf3jVNn5PEc5dzntYtuXDahWEq1XZr6JBgpj1GrDblEtGFE2r4Xj
 3DVKKhaRPmZ6kh08ei43mcgdjDspvgimrK2GO+8Gi2pqGbzW0pR57TGvS87sTqna5Avz
 1OXA==
X-Gm-Message-State: AOAM532YOrc5U170jx14h1lURcth5FG8DwTYtg3DHEtk8qUMw17jwZP2
 Ny1wiTQm6B5yB1SwqD/ykENZCXRaJFz8MPYwE6H69g==
X-Google-Smtp-Source: ABdhPJzG61giwgOVJs6TJgWAxcPwMe72Rr1NDVTFtSLV5ouxvE6lsZ05+zjuB9xdjnjWFDbqTmfjkeBtCWPPXv0873w=
X-Received: by 2002:aca:52c4:: with SMTP id g187mr8709278oib.101.1603057890244; 
 Sun, 18 Oct 2020 14:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200820082137.5907-1-s.hauer@pengutronix.de>
 <926453876c92caac34cba8545716a491754d04d5.1603037079.git.yepeilin.cs@gmail.com>
 <CAKMK7uF9E24P=vzKt28=1_iaFTYD7obHs+tEPwwZPNMhh7DBrg@mail.gmail.com>
 <20201018201811.GA697615@PWN>
 <CAKMK7uFEmNnBdpoHYqvCUYS=nxh99gKs6P1-1pgp-ouvTSioGw@mail.gmail.com>
 <20201018204456.GA697766@PWN>
In-Reply-To: <20201018204456.GA697766@PWN>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 18 Oct 2020 23:51:19 +0200
Message-ID: <CAKMK7uEoCqaPifM7CiaNwtSe8uZ9V-7joJfXSYLjy5pedAcjOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fonts: Support FONT_EXTRA_WORDS macros for font_6x8
To: Peilin Ye <yepeilin.cs@gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 18, 2020 at 10:45 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Sun, Oct 18, 2020 at 10:33:11PM +0200, Daniel Vetter wrote:
> > On Sun, Oct 18, 2020 at 10:18 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > 2/2 is just updating the fb documentation:
> > >
> > > [PATCH 2/2] docs: fb: Add font_6x8 to available built-in fonts
> > > https://lore.kernel.org/lkml/717bb41dda8e2ed615f3faadfbc3e215de726d38.1603037079.git.yepeilin.cs@gmail.com/
> > >
> > > I did `git format-patch -2 --thread=deep`, did I do something wrong when
> > > sending it?
> >
> > No idea, it just didn't arrive anywhere I could find. And I did get
> > your previous patch series. Maybe just try again with dri-devel
> > included and hope it works then?
>
> I'm confused, I see it on LKML in the link above. Sure I'll resend soon.

My brain didn't work, sorry about the confusion.

I'll pick up the patches tomorrow, probably not a good idea I do
anything more today :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
