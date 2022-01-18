Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA6A492512
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 12:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A588410E133;
	Tue, 18 Jan 2022 11:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CE410E133
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 11:41:31 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id g205so27972726oif.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 03:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x78/TbYfX5QsnYZyr52VgAAejiGos9kR5zRjc4vUcCI=;
 b=BHIqFD6eJovLYxKCszVQrtc4G+FVdv6Af3+lRJEtvGKcldsEv7St9cpQiHsu8HtM0U
 NVcEdyoH7nAWqEdWzcNUGjIgads4GWtLnBxoviCJOps7kYsK27aZW2mZEhBLUqWgzRPE
 VN+r7kLysZOMORWrbBThHM57uYpD/YgJdfDHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x78/TbYfX5QsnYZyr52VgAAejiGos9kR5zRjc4vUcCI=;
 b=uN0scc13tVslrlndkM3pt55PKqcfJv3xlrDpOhH6UOoGpAp0ugr4jFB/KgplNu6ZYd
 Jfd6eSQlhrSpR8A8sRPQreA4CAoKpkap/XiIPR4UKj630S1D7S1uVXut2uDl/dZPo7p7
 8Bu3l3J41NrfQKBxhmne+8o4PgIitj9aom2RpuQslIjUXMEr7EAODzXlQldMOxq4FfjY
 f4fslhrRakjcusiqeQM/FR47giGkbf4QzH7CLNuXYv5VY/JV7+bFHE/pIZHUEl8FFZyg
 4XDVaB67auIqyirXYOKiee3c6iGFhlCJzkuaSxnIXGgPWwbSkldZLM95WKW/B/uB5htZ
 o28Q==
X-Gm-Message-State: AOAM532t0LKtRMi8TPcA9k9EamzCWg//cmqjjUY01RrLDNfBLw4QiNJJ
 TdyApYZgkd+RFBVAoEeWexOcMl2nM87eXeaZjwo2kw==
X-Google-Smtp-Source: ABdhPJy5bFsGvTTo9Rj+B1mnhsO4OFpJd/bnRdu8kgbMxvhGzvZK0wJseXPAtmukitDgS+zCuzX4XwI2yFZBlgTFLbQ=
X-Received: by 2002:a05:6808:3a3:: with SMTP id
 n3mr12476341oie.128.1642506089204; 
 Tue, 18 Jan 2022 03:41:29 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <87ee5659dt.fsf@intel.com> <4f1d6018-d74e-8e62-ea4d-0ca79c6bbbc5@gmx.de>
 <87a6ft5thv.fsf@intel.com>
 <CAMuHMdVE6OY29qB+F-QPgQt2q5xAYfyuPhKqSDrh_HhD9PPw9g@mail.gmail.com>
In-Reply-To: <CAMuHMdVE6OY29qB+F-QPgQt2q5xAYfyuPhKqSDrh_HhD9PPw9g@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 18 Jan 2022 12:41:17 +0100
Message-ID: <CAKMK7uHtdjyeasnJw2ZVwJJjuCn1KGT05kJu-x5jdmEmnBB-dA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 9:41 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Jani,
>
> On Tue, Jan 18, 2022 at 9:38 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Mon, 17 Jan 2022, Helge Deller <deller@gmx.de> wrote:
> > > On 1/17/22 22:40, Jani Nikula wrote:
> > >> On Mon, 17 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >>> Seems like few people read linux-fbdev these days.
> > >>
> > >> How much traffic is there to linux-fbdev that is *not* Cc'd to dri-devel
> > >> also?
> > >
> > > Doesn't seem like much traffic - which IMHO is OK for such a tree with
> > > mostly just maintenance patches.
> > >
> > >> Do we still need a separate linux-fbdev mailing list at all?
> > >
> > > Yes. I want to have it seperate of dri-devel.
> > > Actually I'd prefer to drop dri-devel from the list where patches
> > > for fbdev are sent...
> >
> > Disagreed. If anything, this thread shows we can't have fbdev and drm in
> > silos of their own.
>
> Unless DRM drops fbdev support. Isn't that the long-term plan anyway?

No. There's way too much old stuff still using the fbdev interface to
do that. We've even done things like standardize the vblank wait
ioctl, because people need that.

There's some effort to make fbdev drivers like efifb obsolete, and
there's been discussions to have a drm-native fbcon. But none of these
are going to make fbdev on top of drm obsolete and something we can
remove. Pretty sure at least not this decade.
-Daniel

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
