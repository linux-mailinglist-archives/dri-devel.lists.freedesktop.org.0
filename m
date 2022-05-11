Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CD523CB7
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 20:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6721129D4;
	Wed, 11 May 2022 18:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0451129D4;
 Wed, 11 May 2022 18:40:09 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f7d621d1caso31256397b3.11; 
 Wed, 11 May 2022 11:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gacAQnuTjXI3dz5TBJm0cWWRDuAqQVNEJfTWj1bBIpg=;
 b=QcTRIebnvYiCLvVVye/uet+vfZJgWbzfp1uLdVVnlMnPKm01s0LuUJUZ91Xq0MB9Vr
 UvJ31JfGq+SEWZ/FnBrJstqzQahaDs4gfi2jYP96zXZMoyWJRCbQjC+8BTGNblnigo4i
 TvhQFLN+5/vohU/bN8z9bLHVLaZLJS3z+dZYTZdnb3KD65mJqrn37NewG3VMLPxk0JdJ
 hSRNeZyyAddkDt1GafBCleGW7l8iaZWLLpop8J/VUfnRHMwixxlz9JXsSWtrgqV4zwJx
 4xhFLuYsbOhpVnyJBYcM/wKPrOu/YABlYqo35H2KKherBlAV90VG0HVQlT3v75juxVZX
 EfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gacAQnuTjXI3dz5TBJm0cWWRDuAqQVNEJfTWj1bBIpg=;
 b=oUGyh/wyBJbLdSbVyjRmejpl3ghdZF597BP0vpsCnG3p+8xb+q+wbn1X1GhcKAqpZ9
 Zw0zDvOYE1Ylk0DpCHp6bTWH6tb8c7Ad1/xeuVmqxtWyescIcnH9V+1HjtYdawSogLAn
 OymJou0kLXzqRQFMH0S+6JkY/urOlkZUqtsq2RYXq6fcKG85abiddVmH8tcWRSV0g1m2
 inzeMiv/I2UHQ3vV7/jhnaCDiwRhr3cb6/YFCmsth6CPJ1AwdPdLav6Qk9bC+Hf/nGFf
 BRrHqzHQYjsbP/PqAdwGXsNF7IPFtafIC++poSznjeWDntMayCApgDtlqkTgwaNKqtJC
 pbVw==
X-Gm-Message-State: AOAM533vG/qoK7PMWq+tXwB6fRrxwgFZ7o4BLBnoILhPfvbJCS1rTYgS
 EzDEXkOE359U41WDe8Y24e2DCfr9GddXW7FIGi4=
X-Google-Smtp-Source: ABdhPJyMUehcufRfIX14setohpSGBpeP18SXvT0KMG1vCIhPypdsZ3bdLIhs3tcx/6SKNJM6VYHywe/u8k/I9as5dlI=
X-Received: by 2002:a0d:e645:0:b0:2f4:dbd6:261e with SMTP id
 p66-20020a0de645000000b002f4dbd6261emr26676104ywe.7.1652294408357; Wed, 11
 May 2022 11:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
In-Reply-To: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 May 2022 11:39:56 -0700
Message-ID: <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 10:33 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, May 10, 2022 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > > And use it to store expectations about what the drm/msm driver is
> > > supposed to pass in the IGT test suite.
> >
> > I wanted to loop in Linus/Greg to see if there are any issues raised
> > by adding CI results file to the tree in their minds, or if any other
> > subsystem has done this already, and it's all fine.
> >
> > I think this is a good thing after our Mesa experience, but Mesa has a
> > lot tighter integration here, so I want to get some more opinions
> > outside the group.
>
> Honestly, my immediate reaction is that I think it might be ok, but
>
>  (a) are these things going to absolutely balloon over time?
>
>  (b) should these not be separated out?
>
> Those two issues kind of interact.
>
> If it's a small and targeted test-suite, by all means keep it in the
> kernel, but why not make it part of "tools/testing/selftests"
>
> But if people expect this to balloon and we end up having megabytes of
> test output, then I really think it should be a separate git tree.
>
> A diffstat like this:
>
> >  7 files changed, 791 insertions(+)
>
> is not a problem at all. But I get the feeling that this is just the
> tip of the iceberg, and people will want to not just have the result
> files, but start adding actual *input* files that may be largely
> automated stuff and may be tens of megabytes in size.
>
> Because the result files on their own aren't really self-contained,
> and then people will want to keep them in sync with the test-files
> themselves, and start adding those, and now it *really* is likely very
> unwieldy.

It is missing in this revision of the RFC, but the intention is to
have the gitlab-ci.yml point to a specific commit SHA in the
gfx-ci/drm-ci[1] tree, to solve the problem of keeping the results in
sync with the expectations.  Ie. a kernel commit would control moving
to a new version of i-g-t (and eventually deqp and/or piglit), and at
the same time make any necessary updates in the expectations files.

BR,
-R

[1] https://gitlab.freedesktop.org/gfx-ci/drm-ci

> Or if that doesn't happen, and the actual input test files stay in a
> separate CI repo, and then you end up having random coherency issues
> with that CI repo, and it all gets to be either horribly messy, or the
> result files in the kernel end up really stale.
>
> So honestly, I personally don't see a good end result here.  This
> particular small patch? *This* one looks fine to me, except I really
> think tools/testing/selftests/gpu would be a much more logical place
> for it.
>
> But I don't see a way forward that is sane.
>
> Can somebody argue otherwise?
>
>             Linus
