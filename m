Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6393AD350
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 22:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3746EA93;
	Fri, 18 Jun 2021 20:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D8F6EA93;
 Fri, 18 Jun 2021 20:03:00 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id nd37so17639684ejc.3;
 Fri, 18 Jun 2021 13:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fi6kpGKdQjVL4VAwI3TWLnyLoIRCo8W/Wmq2twp+dQ0=;
 b=X1Fz77rOxxcqpgWuq28Pkno0BOBP4JeHAXfqjFMxNjzmURJx2TUlIlW2z0pAcB5Liw
 j1uStfcWmdpFOyGcHf93455iN1bD90JcXGo292KA5GFwydu+pQQZ8LVOj7EP3tX143ku
 WYGKGAGGXKQJFHUMkpNPwbkN4adHv2GktZtiiycj7VAFlnNAN/bzA/5KXBiF6Jp9QUiO
 LbYdfJAGU05heFUlCiaEIH3FaEHzQI7TgFUdfR8+yO+xyhrHjaGSfrBDOcbMdXbJzxtJ
 KB5x+U8nujyzjB9rq3ARpSSrEtbHa0yB76FAknqobfqa5iQVmUTkIniFgew5DKq4BKq2
 6zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fi6kpGKdQjVL4VAwI3TWLnyLoIRCo8W/Wmq2twp+dQ0=;
 b=m2XzXoBLtK2k7RK+1yvQ37wrU+jKleLvHRPgT6xxhfqOCTpRCBX6r3uZK2etsMIsW6
 C/Zvj4SN88bJ06RB1r5AvYpZJXuQw8OlwVaWdTDpwvjHLU9NamsCRDjEFfXwghji6BYh
 tOMoSJnzdqg66wWOJl4VB4gVTtsBWH29SJzowUwoK+0fNsikUeWmK7uQr7rV0wqglRFV
 WP5aE/x7Qd2qTV62g+97/XYmJ+Zb1zvSP4Z/GVhRhPJSIzY9QxQfX+KFBruMseP7I759
 CLec4WCFGEvxz18myJGSLYUxUy4tRQqAJRBXHKuz8MVqs6OgdjJIQR4l82OV/vKSjIN5
 BvpA==
X-Gm-Message-State: AOAM532jyMK0cbutbTulft9M2R7ZywqNgMKGm7nwtUYydr1TIcs0arfJ
 1rdpA2+W5CDYapJlVzellqB4JUUYbKS/jWDs/8M=
X-Google-Smtp-Source: ABdhPJxdUnkG9NIfoJ51aYLFXopjoDs1BDg5Wrpf+U8HwEHsTgfzI8fxesNJJA57wPITlsvq9lvtZUD1vVfWJlcT/d0=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr10152192ejz.237.1624046579119; 
 Fri, 18 Jun 2021 13:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <eb71ee2d-3413-6ca8-0b7c-a58695f00b77@linux.intel.com>
 <162340805657.68262.6607541005525077753@jlahtine-mobl.ger.corp.intel.com>
 <162340998262.68262.6045527397253780242@jlahtine-mobl.ger.corp.intel.com>
 <162366341949.32491.14244869174585877634@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <162366341949.32491.14244869174585877634@jlahtine-mobl.ger.corp.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 19 Jun 2021 06:02:47 +1000
Message-ID: <CAPM=9txge9msRdi2jLRnvrPOeup4jND3-pK0SPr+H0TRzpU1SA@mail.gmail.com>
Subject: Re: [PULL] topic/i915-ttm
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Jun 2021 at 19:37, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:
>
> Quoting Joonas Lahtinen (2021-06-11 14:13:02)
> > Quoting Joonas Lahtinen (2021-06-11 13:40:56)
> > > Quoting Maarten Lankhorst (2021-06-11 12:27:15)
> > > > Pull request for drm-misc-next and drm-intel-gt-next.
> > > >
> > > > topic/i915-ttm-2021-06-11:
> > > > drm-misc and drm-intel pull request for topic/i915-ttm:
> > > > - Convert i915 lmem handling to ttm.
> > > > - Add a patch to temporarily add a driver_private member to vma_node.
> > > > - Use this to allow mixed object mmap handling for i915.
> > > > The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67c2:
> > > >
> > > >   Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +1000)
> > >
> > > This base is not in drm-misc-next or drm-intel-gt-next, so effectively
> > > we would end up pulling 478 extra commits from drm-next as a result. And
> > > also causing all the warnings for those commits. I don't think we should
> > > do that?
> > >
> > > The common ancestor would be ccd1950c2f7e38ae45aeefb99a08b39407cd6c63
> > > "Merge tag 'drm-intel-gt-next-2021-05-28' of git://anongit.freedesktop.org/drm/drm-intel into drm-next"
> > > Should we re-do the topic branch based on that?
> >
> > This problem seems to come from the fact that only the PR from yesterday
> > that got merged to drm-next had the dependency patches. The previous
> > backmerge of drm-next was requested too early.
> >
> > I've solved this with least hassle by backmerging drm-next again and
> > then applying the PR to drm-intel-gt-next.
>
> And now I have actually pushed the merge too.. Thanks to Tvrtko
> for pointing out broken drm-tip.
>

Sorry I messed up, I missed the tip fail in my terminal before I clocked off.

Dave.
