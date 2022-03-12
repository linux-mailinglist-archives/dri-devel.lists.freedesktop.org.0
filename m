Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B24D6D47
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 08:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BEB10E197;
	Sat, 12 Mar 2022 07:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A6410E197
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 07:46:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id yy13so23574523ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 23:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=opm0RTYgKsezOjMybsaQMQvfYC2eFXeXWanMke4xljQ=;
 b=doCEK9S9d11Ijh3AYCuvnbhhbjt1qtI9IrlKFVyEJL82m7ptsCxASUOlgeWaBQpEKQ
 nj6OghomR4bQiFV/g7IDhRPKlaenccetxNreiB2DmLnlR44omRF0smVkECSNlSVgTjoV
 gnv/L3jw2YY3mariSCK9RCrsjR4H6lX/F/MIwZYOsT9Uh/VJ9CGQ0fzpCxW56lTkKCQu
 8FaHi3F25wOwSgdZMVHrxIHYDNg82VRLveU8q7NaF9QSW9+oL/A6BgVnMD2VdqJlVh+c
 6XTcXoLfD+7Nd7wZr4FBCbhdKgMo78PFk2tx9Gl9eiaFjzAvNckPj/jjovp7y422kz6t
 WfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=opm0RTYgKsezOjMybsaQMQvfYC2eFXeXWanMke4xljQ=;
 b=MFcoqXgCeqCdyCt4HnxnX+LZMC8yCNgzuJ4WR9Pz1q3iUreptrPfidLk0NezkOvxwP
 lweJU5n6jSbuKzaDBe3/Q8LuqD8L9dYe8xK3h6FGiysSvPFmz15wkAhbz7+evz9VPhmj
 +idzJykZt84aUV8iu85qOamdP4hgvCA0p9ulEUlxjGF8d9heTy1CP3jMJVXAizyxOT1X
 Wcu7j9+PIrkhNZYsn4knf33XrHA4ilCrGB07Wy7g62w4w2+jAABEgFi2h8hm8yjFQJvg
 eJhQ0MdNY5R+cSYVOYQXkT3R7o3H1BJPyYU/vOV8b1gxx89zRMhy1V4gUV9n0bYHUYDJ
 hwcQ==
X-Gm-Message-State: AOAM533fATiYFzTC/o2Oy43MzRT0SuuJO5jNdX+3NXozZZ8p8dVCNQ9c
 GFh+wFIsNYStwQhy86XD9QpcAmvtpe2qL5LCexg=
X-Google-Smtp-Source: ABdhPJw1/g3wq98ZWZ7Mub/gSMRzcKLI2KSYxEUZBwFPH9q46gVskXknhgzycEgPOLrxJEcqlXSe/EjRm92OzoRwM0w=
X-Received: by 2002:a17:907:968f:b0:6db:a3c5:ae3e with SMTP id
 hd15-20020a170907968f00b006dba3c5ae3emr5601661ejc.770.1647071189988; Fri, 11
 Mar 2022 23:46:29 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txhThmkeKMjTVXGL+RYQDxBZv2c4syb_3V7WF=8sZhaHQ@mail.gmail.com>
 <c5d6fd7b-54ff-e407-2da8-ea2a6157fbff@leemhuis.info>
In-Reply-To: <c5d6fd7b-54ff-e407-2da8-ea2a6157fbff@leemhuis.info>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 12 Mar 2022 17:46:18 +1000
Message-ID: <CAPM=9twQe2S11C+kLBLbqt1aabnu8x79BZugRnjg6aN4NBvw-A@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.17-rc8/final
To: Thorsten Leemhuis <regressions@leemhuis.info>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Mar 2022 at 17:51, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 11.03.22 06:15, Dave Airlie wrote:
> >
> > As expected at this stage its pretty quiet, one sun4i mixer fix and
> > one i915 display flicker fix.
> >
> > Thanks,
> > Dave.
> >
> > drm-fixes-2022-03-11:
> > drm fixes for v5.17-rc8/final
> >
> > i915:
> > - psr fix screen flicker
> >
> > sun4i:
> > - mixer format fix.
> > The following changes since commit ffb217a13a2eaf6d5bd974fc83036a53ca69f1e2:
> > [...]
>
> Out of curiosity: I might be missing something, but why wasn't the
> (afaics simple) fix for a build problem caused by 9d6366e743f3 ("drm:
> fb_helper: improve CONFIG_FB dependency") (merged for v5.16-rc1) not
> among these fixes? I mean this one:
> https://lore.kernel.org/lkml/20220203093922.20754-1-tzimmermann@suse.de/
>
> It's sitting in next for a few days already:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=eea89dff4c39a106f98d1cb5e4d626f8c63908b9
>
> I already asked a few days ago why this fix was not on track for merging
> in this cycle, but I didn't get an answer:
> https://lore.kernel.org/lkml/782a683e-c625-8e68-899b-ce56939afece@leemhuis.info/
>
> Fun fact: It seems the problem and at a rough fix were already kinda
> known mid November when 9d6366e743f3 was still in next:
> https://lore.kernel.org/all/20211117062704.14671-1-rdunlap@infradead.org/
>
> Then the issue was reported again two times in February:
> https://lore.kernel.org/dri-devel/CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com/
> https://lore.kernel.org/lkml/YhofdlzadzRmy7tj@debian/
>
> And the fix is relative simple, that's why I wonder why merging is
> delayed. What am I missing?

My radar just missed it, though someone else should have realised it
was necessary on fixes earlier, it also had incorrect Fixes: tagging,
so I fixed that and sent it to Linus,

Thanks,
Dave.
