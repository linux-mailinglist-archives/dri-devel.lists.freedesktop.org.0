Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D7E492307
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56DF10EBFB;
	Tue, 18 Jan 2022 09:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D7B10EBFB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:45:13 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id m15so35386859uap.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 01:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uRFhx0l+e0ed4wS3RUIFPjxFMaQUtU4eks+w7Sri8W8=;
 b=IkghonLl/df/9h+u7LHGLQqC4hPaLUS0RNqjxKPG3Vro3IERU6XoHx7b9NwGFAzPCn
 Zq827RPG09sw9ob2zLVM1/5Jhy/fPuKkdt6E/MrD46UvtMH+hQZnN1vC1Lk3x7OYG0uH
 b9LgTiybIpK3do17V01W0h9QwixphmeRFZzD6SOychBDUvUsFkHmsWX7mKOK1NUvS2Mn
 m+n8lEy/PnNwzY0ZuEqbVsK3yxFtinHReGuVIjR5pWv3LxJTSYnlTbnk4DiLNbwmet++
 Wowac5HTbbrE9hVeJ+gfZBsLzqGaJ0k9DcCyB3jdiQIUc+fTQm5b5P38NnwOFz/NDTj2
 DDew==
X-Gm-Message-State: AOAM531MQfrJrVAvSY9wiQKyki8zzOVndl0OgAgSpsTalcecbhVXsR3i
 nxupA4LdjsJHvGFtpzo/CO+wzxzJqnIOcQ==
X-Google-Smtp-Source: ABdhPJyVVCAIOWyGLK5m52xSY9tJiT7Ez1LtQAeU7MMYuu6VN3FAwAy92lNBs8diHTv64U+usf+khA==
X-Received: by 2002:ab0:26ca:: with SMTP id b10mr9323079uap.75.1642499112511; 
 Tue, 18 Jan 2022 01:45:12 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182])
 by smtp.gmail.com with ESMTPSA id n15sm3694776vkf.35.2022.01.18.01.45.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:45:12 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id n9so11084093vkq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 01:45:11 -0800 (PST)
X-Received: by 2002:a1f:384b:: with SMTP id f72mr9456081vka.0.1642499111709;
 Tue, 18 Jan 2022 01:45:11 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <87ee5659dt.fsf@intel.com> <4f1d6018-d74e-8e62-ea4d-0ca79c6bbbc5@gmx.de>
 <87a6ft5thv.fsf@intel.com> <5ba33e10-7d75-9f9a-dfd6-c04608d230a4@gmx.de>
 <4f65fdd9-4b73-ca83-cf6e-c60c7ccd6558@redhat.com>
In-Reply-To: <4f65fdd9-4b73-ca83-cf6e-c60c7ccd6558@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jan 2022 10:45:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUWRkMhU1=2V85iqdP8Hec6CoMAy3CwE9SjPhPBjGjuag@mail.gmail.com>
Message-ID: <CAMuHMdUWRkMhU1=2V85iqdP8Hec6CoMAy3CwE9SjPhPBjGjuag@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Jan 18, 2022 at 10:33 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 1/18/22 09:54, Helge Deller wrote:
> > On 1/18/22 09:38, Jani Nikula wrote:
> >> On Mon, 17 Jan 2022, Helge Deller <deller@gmx.de> wrote:
> >>> On 1/17/22 22:40, Jani Nikula wrote:
> >>>> On Mon, 17 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>>> Seems like few people read linux-fbdev these days.
> >>>>
> >>>> How much traffic is there to linux-fbdev that is *not* Cc'd to dri-devel
> >>>> also?
> >>>
> >>> Doesn't seem like much traffic - which IMHO is OK for such a tree with
> >>> mostly just maintenance patches.
> >>>
> >>>> Do we still need a separate linux-fbdev mailing list at all?
> >>>
> >>> Yes. I want to have it seperate of dri-devel.
> >>> Actually I'd prefer to drop dri-devel from the list where patches
> >>> for fbdev are sent...
> >>
> >> Disagreed. If anything, this thread shows we can't have fbdev and drm in
> >> silos of their own.
> >
> > Patches to fbdev usually don't affect DRM.
>
> Patches for fbdev drivers don't usually affect DRM but that's not the
> case for patches to fbdev core and fbcon as you and others mentioned.
>
> > Patches which affect DRM needs to through to dri-devel.
>
> And how would people know which ones need to go through dri-devel ? Are
> you planning to add another entry to MAINTAINERS for fbdev core/fbcon ?

Those are nicely contained in drivers/video/fbdev/core/, so an entry
in MAINTAINERS listing both linux-fbdev and dri-devel would do.

> > In addition this would take the burden of the dri-developers to receive
> > unrelated fbdev driver updates and patches.
>
> In my opinion having fbdev patches in the dri-devel mailing list isn't
> a big burden, but rather getting people to review and push say patches.
>
> Since you are volunteering for the latter, that should improve things.
>
> I still fail to see the benefit of doing that split, same for having a
> separate fbdev tree. Using drm-misc only have advantages, among other
> things providing redundancy in cases that a maintainer isn't available
> for a period of time.

The above is the point of view from a DRM developer?
For an fbdev developer, the burden to receive unrelated DRM driver
updates and patches would be significant.

The first page of https://lore.kernel.org/dri-devel/ goes back to yesterday.
The first page of https://lore.kernel.org/linux-fbdev/ goes back to Nov 30th.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
