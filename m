Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B19C1202B9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67ADB6E4A1;
	Mon, 16 Dec 2019 10:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5A36E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:37:12 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v140so3125853oie.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzy4MnymQY4e/i55C6UvU1p3HJsy+cqrBB14goXu6lk=;
 b=sjf7F64TPnKC5k9z1EA6Ecg2NNpHrBtNRH2dmx3PjkoD25EW45J402ocVNqWGXqK/X
 Ma4HGrvotwjo+VHmZtLatt/emzVGEVBfdIwxsX1cD0wu+O9zJVF+b039PdD1xhdKmptv
 s2AuzHlEL3Dx49EtWWLX5nQ96v9llKSTvrKhTXJn8QZHIS6wis73rZwC+7Tk06cvAUc3
 80OR/hYj+/CLwB0KyzvCseRvBao4EFZ+zpXIdodPDhwi3qSVt4nYoUDdRhsFvCWqKMGo
 BDYHLTCwvaQFfxG2wxCfPEeA9AzccJCODFZ7mKeijUHS+/L3GyuHTD6cbTEHwOOQzon/
 xvTw==
X-Gm-Message-State: APjAAAVcWHbqlqi/SoiPnoHRoI/0lA22GiMh4RACzJj29xgNrUhQy2B4
 zoz8yYYHh3gFXNjAkAb/BumZUyvYJTidVXd8X06K5g==
X-Google-Smtp-Source: APXvYqyHX4rBGNEDa6Z3oYE/ISGuH6mr8Na6Ob2WcaWaHKza4vXUSA+tgVsU4U16CGSh2bQ13Wtg76nuZkSsQK4FqgY=
X-Received: by 2002:aca:36c5:: with SMTP id d188mr9559143oia.54.1576492632030; 
 Mon, 16 Dec 2019 02:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
 <20190913090359.GC29992@pendragon.ideasonboard.com>
 <2eeacacc-f190-4ba8-32bc-b4103b41db46@ideasonboard.com>
 <20191213004812.GA27328@pendragon.ideasonboard.com>
 <19cb3d1c-6910-4bec-13bb-adb875ddd077@ideasonboard.com>
In-Reply-To: <19cb3d1c-6910-4bec-13bb-adb875ddd077@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2019 11:37:00 +0100
Message-ID: <CAMuHMdWuGxy8WH9ts7iKPsRW0fUjQ3c7jdDOb9KpViwcvXC14A@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran, Laurent,

On Mon, Dec 16, 2019 at 10:47 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 13/12/2019 00:48, Laurent Pinchart wrote:
> > On Mon, Dec 09, 2019 at 12:41:07PM +0000, Kieran Bingham wrote:
> >> On 13/09/2019 10:03, Laurent Pinchart wrote:
> >>> On Fri, Sep 13, 2019 at 10:21:29AM +0200, Simon Horman wrote:
> >>>> On Thu, Sep 12, 2019 at 01:00:41PM +0300, Sergei Shtylyov wrote:
> >>>>> On 11.09.2019 22:25, Kieran Bingham wrote:
> >>>>>
> >>>>>> Add direct support for the r8a77980 (V3H).
> >>>>>>
> >>>>>> The V3H shares a common, compatible configuration with the r8a77970
> >>>>>> (V3M) so that device info structure is reused.
> >>>>>
> >>>>>    Do we really need to add yet another compatible in this case?
> >>>>> I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
> >>>>> a patch like this one didn't get posted by me.
> >>>>
> >>>> The reason for having per-SoC compat strings is that the IP blocks
> >>>> are not versioned and while we can observe that there are similarities
> >>>> between, f.e. the DU on the r8a77970 and r8a77980, we can't be certain that
> >>>> differences may not emerge at some point. By having per-SoC compat strings
> >>>> we have the flexibility for the driver to address any such differences as
> >>>> the need arises.
> >>>>
> >>>> My recollection is that this scheme has been adopted for non-versioned
> >>>> Renesas IP blocks since June 2015 and uses of this scheme well before that.
> >>>
> >>> Sure, but we could use
> >>>
> >>>     compatible = "renesas,du-r8a77980", "renesas,du-r8a77970";
>
> We already do in arch/arm64/boot/dts/renesas/r8a77980.dtsi.
>
> However that is the *only* non r8a77980 reference in the file so it,
> itself looks *very* much out of place.
>
>
> Furthermore, the main purpose of this patch is that we clearly document
> the driver as supporting the r8a77980 in the bindings (No mention that
> you must use the ..970 binding), yet in actual fact - the driver could
> not currently support loading a device with the following compatible:
>
>         compatible = "renesas,du-r8a77980";
>
>
> >>> in DT without updating the driver. If the r8a77980 turns out to be
> >>> different, we'll then update the driver without a need to modify DT. I'm
> >>> fine either way, so
> >>>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> Thanks,
> >>
> >> This patch has an RB tag from you, and Simon, but alas I don't believe
> >> it has been picked up in your drm/du/next branch.
> >>
> >> Is this patch acceptable? Or do I need to repost?
> >
> > Could you just confirm I should apply this patch, and not go for the
> > alternative proposal above ?
>
> I believe the alternative proposal above is what we have today isn't it?
>
>
> Yes, I do believe we should apply this patch.

+1.

I'm waiting for the driver part to go upstream, so I can apply the DTS patch.
Note that this will lead to a messy situation in LTS, as the DTS patch will
likely be backported, so the driver part must be backported, too.

> I'm going to assume you haven't read the other arguments on this thread
> so I'll paste them here:

Thanks for recollecting! ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
