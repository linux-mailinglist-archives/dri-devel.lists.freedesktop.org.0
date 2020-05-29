Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5F1E803B
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 16:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8F56E916;
	Fri, 29 May 2020 14:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298396E916
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 14:29:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s8so3823530wrt.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AHvP7HWuIrplFnRk1R3gZDZECnz2hVQelQ8MJJGpPp4=;
 b=JyVXaI7vPP8RIoAKCzfAYb6i5pu7v9uFVKmh3ZASt0MnLcwFF+4CSjIq6zgUDdfMoC
 3IM+Hnv/gg74YXWcnAMiUitYS9LEWOzXgtuLOG1zy+X9GOQ7QeI8MHTcV2tEduGWfY6I
 MpYh9nA9Ckj1OfJH2Tbv+fyusKdDBXgYbV8q9oafFb/pnCqRuAOLaH7egp+Rr3ZQgeBG
 VJEIn65zLlEULSpX/m/cktdddAIg3edSYS7RhODzFDvy8mPZC3+rDMF99szeGL6xwT4n
 As/FOUsgVhJeNsY2XsluatpxXaPI0jbr1jmfjj+A6nf1ncQzSE8qmNW0tBJ01NO2ziaw
 i4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AHvP7HWuIrplFnRk1R3gZDZECnz2hVQelQ8MJJGpPp4=;
 b=h2wG38JR/BYmXHa5nZCZQqBFruHJ0DpqgLcAMSZ9LXdH8LxUN3dH1y62OAw5twPsdC
 wvjq7igieJyjI94oYQKLe4Kdm+MKdgKM2pS6wvjUnh87sC6wB4a40YtDy1MbkFV6ZpQA
 YijAIL22aFMMYeu8XLaSuQM66PxfqgmOD7S3wERCrB4HcdpTmJ/mNnG4swVcIaUD888H
 L1QjSJ84gtUoWX4X3OQRGeEGs2RBhVMzqQWrItQ/p7TMcSuo6/MAd4rD49EmejXhep3o
 VN5Hy0OpqvIIQ06TMh1WvlAY0m0yAZHgGGxQiAdlE0lQJYFXfRSPmqWgA9nP07QzbDBJ
 AjTg==
X-Gm-Message-State: AOAM530VjhlIZPC60qrpnUhRYD5wJL5nn6Yp3rkX0/Pf5ha8fBkrPaXF
 CQTVb31KIAjk1kc8KUEUVLvoEVZXSEHzglEaDeI=
X-Google-Smtp-Source: ABdhPJw0G7hyy0vWYuzZogVnX5refduN1S7RbcG7mq94IksEEbrkbE9tn27nNGqjDTyTVbOvxJAmzCKXn0mjt8WOJOk=
X-Received: by 2002:a5d:6789:: with SMTP id v9mr9559753wru.124.1590762597721; 
 Fri, 29 May 2020 07:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
In-Reply-To: <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 May 2020 10:29:46 -0400
Message-ID: <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 9:58 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi Alex,
>
> On Fri, 29 May 2020 at 14:29, Alex Deucher <alexdeucher@gmail.com> wrote:
> > On Fri, May 29, 2020 at 4:59 AM Simon Ser <contact@emersion.fr> wrote:
> > > OK. In this case I think it's fine to make the DMA-BUF import fail, as
> > > we've suggested on IRC. The more-or-less planned fix for these buffer
> > > sharing issues is to revive the buffer constraints proposal from the
> > > allocator project. It's a lot of work though.
> >
> > I get that, but why explicitly limit modifiers then?  Shouldn't we try
> > and do the best we can with what we have now?  If not the situation is
> > not much better than what we have now.  Why go through the effort or
> > adding modifer support in the first place if they are mostly useless?
>
> Well sure, we could add pitch alignment in there. And height
> alignment. And starting byte offset. And acceptable byte distance
> between planes. And physical contiguity / number of backing pages. And
> placement (system vs. GTT vs. local), which also implies adding a
> device-unique identifier whilst we're at it. And acceptable
> width/height bounds. All of those are perfectly valid constraints
> which could cause imports to fail, and not even an exhaustive list.
>
> How does Navi ensure that every single linear dmabuf source it can
> ever receive is aligned to 256 bytes today? How does adding support
> for modifiers - something which does solve other problems, like 'every
> three months I wearily review a patch forcing all winsys buffers to be
> allocated for scanout usage for a new random reason, regressing
> performance for a lot of other vendors' - make Navi's situation worse?
>
> > I don't quite get what we are trying to do with them.  What does this
> > mean "Modifiers must uniquely encode buffer layout"?  We have a number
> > of buffer layouts that are the same from a functional standpoint, but
> > they have different alignment requirements depending on the chip and
> > the number of memory channels, etc.  Would those be considered the
> > same modifer?  If not, then we are sort of implicitly encoding
> > alignment requirements into the modifier.
>
> Yes, of course some requirements are implicit. Given that tiles are
> indivisible, it makes no sense to have a 64x64 tiled buffer with a
> 32-pixel stride. But that isn't the same thing as encoding an
> arbitrary constraint, it's just a requirement of the encoding.
>
> The reason why modifiers have been successful and adopted by every
> other vendor apart from IMG, is exactly because they _don't_ attempt
> to boil the ocean, but are the most practical realisation of improving
> performance within a complex ecosystem. The allocator is the complete
> and exhaustive solution to all our problems, but it's not exactly
> going to be done tomorrow.

Maybe I'm over thinking this.  I just don't want to get into a
situation where we go through a lot of effort to add modifier support
and then performance ends up being worse than it is today in a lot of
cases.

Alex

>
> Playing a single video today could easily involve a V4L2 codec source
> into a V4L2 postprocessor into Chromium's Wayland host compositor
> through Chromium itself into the host Wayland compositor and finally
> into EGL and/or Vulkan and/or KMS. If you want to figure out what the
> V4L2/DRM/KMS, GStreamer/VA-API/Kodi, EGL/Vulkan, and Wayland/X11 APIs
> look for negotiating a totally optimal layout across at least three
> different hardware classes from at least three different vendors, then
> I'm all for it. I'll be cheering you on from the sidelines and doing
> what I can to help. But the only reason we've got to this point today
> is because Allwinner, AmLogic, Arm, Broadcom, Intel, NVIDIA, NXP,
> Qualcomm, Rockchip, Samsung, and VeriSilicon, have all spent the last
> few years trying to avoid perfection being the enemy of good. (And
> those are just the hardware vendors - obviously Collabora and others
> like us have also put not-inconsiderable effort into getting at least
> this far.)
>
> Cheers,
> Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
