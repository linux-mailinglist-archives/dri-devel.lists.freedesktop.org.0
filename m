Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44508523BD6
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 19:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EA61125A6;
	Wed, 11 May 2022 17:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6681125A6;
 Wed, 11 May 2022 17:46:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id m62so1642448wme.5;
 Wed, 11 May 2022 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hZIhjLMbOoF976Pa2gp/bTHKHDJhsmozC2Xdhlo7Go4=;
 b=WbaD35REy4RkuI+0jS9Yz9GZbFYslRKSN3kwXxem7hTMwcXCJRi/7mSeJB4RNe+KUJ
 M7ikAVkz3pLJ/+A/Zd7OZof/hD0WjT2CoD6kwoRDnXii4/UIoRq//XkQr7rsw3AciJXV
 eW/JXs0byA6F9CltG3XlyUnpqrGxdk+vGhJD7UTD7aAaxjJrgivbmyq8JVh5cWGoAeoP
 GGy1NuKChyOz9ZnWmc4SmcP9lCn6EWUIuW4vdFKC2zBoerfScGv0yoBZZoBWfmS8DvH8
 XpH1Vpu3fYyUfcUOC8sDv7lL97hTjYYhp/GdsFmzd41J/zvu+1oLbdC2iQhYcfKukri6
 MdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hZIhjLMbOoF976Pa2gp/bTHKHDJhsmozC2Xdhlo7Go4=;
 b=YlBdlJzHJKl9cSmHthJlN8k830TYtPLXp/73OX8wFXiy0QVO91JWIoukHVKeL8PXBM
 +VvBhDAZ7y1DCK8idHjZuA+TwQ03ubAfkcz4JTDGDzc6H7QT1AJD0vglZmjvXHq+2bPQ
 MNl7TNKUAda5e/ELz8xpXrNzL1htd48/lmMTW5C1YQ0zD2DSLqK5n8JUEAOyKm7ENMk3
 aXyLwF07QWcDqpF08xpD5G/C6jrugMQcC0mg+/XwLUDtKuayrgLMpeesYUYeAN7zqZW2
 GLUS7u+f3bP04ZI9BE9mkXILAY/rwuRg6166gIWsEFVn1vxaPoEF35XAbcMcrnUlX5tI
 Wfbg==
X-Gm-Message-State: AOAM5325bpAB12hEvYEDcD1gG4qLyIyfJ6J+z1U7vlZdgk4i0zsu/ztA
 VVy5V8D7FN37Z8gmMuaOX99HrFIVg7odaKGWuow=
X-Google-Smtp-Source: ABdhPJyyI6ZQQ21PBHHrfOwIDXju3dqvOzK7tmSkFW7qgZPpqEGyfOOYbWN1XYAiCyzaICg8/Egs+zHO23GPOYNfFPc=
X-Received: by 2002:a05:600c:a53:b0:394:7a51:cb71 with SMTP id
 c19-20020a05600c0a5300b003947a51cb71mr6322859wmq.148.1652291196975; Wed, 11
 May 2022 10:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <e4e03cd8-3ebc-e5e1-e7d0-6bdc038049b5@quicinc.com>
 <CAF6AEGueadnRMiatO3MoHS+NTQ1o1sgcV0cVjJM3iu-6JUNmNw@mail.gmail.com>
 <CAKMK7uGRuCZwF6m02tcxxrgQGaijsYaNkowjxR+cw0JM3UpDkQ@mail.gmail.com>
In-Reply-To: <CAKMK7uGRuCZwF6m02tcxxrgQGaijsYaNkowjxR+cw0JM3UpDkQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 May 2022 10:46:24 -0700
Message-ID: <CAF6AEGthpxPLxyt_i-aUFgW485hA5qw+xXcJ3gKQUJ+fM=ZBhg@mail.gmail.com>
Subject: Re: [Freedreno] [RFC v2] drm/msm: Add initial ci/ subdirectory
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 10:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, 10 May 2022 at 22:26, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, May 10, 2022 at 12:39 PM Jessica Zhang
> > <quic_jesszhan@quicinc.com> wrote:
> > >
> > >
> > >
> > > On 5/10/2022 7:13 AM, Tomeu Vizoso wrote:
> > > > And use it to store expectations about what the drm/msm driver is
> > > > supposed to pass in the IGT test suite.
> > > >
> > > > Also include a configuration file that points to the out-of-tree CI
> > > > scripts.
> > > >
> > > > By storing the test expectations along the code we can make sure both
> > > > stay in sync with each other, and so we can know when a code change
> > > > breaks those expectations.
> > > >
> > > > This will allow all contributors to drm/msm to reuse the infrastructure
> > > > already in gitlab.freedesktop.org to test the driver on several
> > > > generations of the hardware.
> > > >
> > > > v2:
> > > >    - Fix names of result expectation files to match SoC
> > > >    - Don't execute tests that are going to skip on all boards
> > > >
> > > > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > > ---
> > > >   Documentation/gpu/msm_automated_testing.rst   |  70 +++++++++
> > > >   drivers/gpu/drm/msm/ci/gitlab-ci.yml          |  11 ++
> > > >   drivers/gpu/drm/msm/ci/msm.testlist           | 148 ++++++++++++++++++
> > > >   .../gpu/drm/msm/ci/msm_apq8016_results.txt    | 140 +++++++++++++++++
> > > >   .../gpu/drm/msm/ci/msm_apq8096_results.txt    | 140 +++++++++++++++++
> > > >   drivers/gpu/drm/msm/ci/msm_sc7180_results.txt | 141 +++++++++++++++++
> > > >   drivers/gpu/drm/msm/ci/msm_sdm845_results.txt | 141 +++++++++++++++++
> > > >   7 files changed, 791 insertions(+)
> > > >   create mode 100644 Documentation/gpu/msm_automated_testing.rst
> > > >   create mode 100644 drivers/gpu/drm/msm/ci/gitlab-ci.yml
> > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm.testlist
> > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
> > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
> > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
> > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
> > > >

[snip]

> > > > diff --git a/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt b/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
> > > > new file mode 100644
> > > > index 000000000000..01f7b4b399b5
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
> > > > @@ -0,0 +1,141 @@
> > > > +igt@core_auth@getclient-simple,dmesg-warn
> > > > +igt@core_auth@getclient-master-drop,pass
> > > > +igt@core_auth@basic-auth,pass
> > > > +igt@core_auth@many-magics,pass
> > > > +igt@core_getclient,pass
> > > > +igt@core_getstats,pass
> > > > +igt@core_getversion,pass
> > > > +igt@core_setmaster_vs_auth,pass
> > > > +igt@drm_read@invalid-buffer,pass
> > > > +igt@drm_read@fault-buffer,pass
> > > > +igt@drm_read@empty-block,pass
> > > > +igt@drm_read@empty-nonblock,pass
> > > > +igt@drm_read@short-buffer-block,pass
> > > > +igt@drm_read@short-buffer-nonblock,pass
> > > > +igt@drm_read@short-buffer-wakeup,pass
> > > > +igt@kms_addfb_basic@unused-handle,pass
> > > > +igt@kms_addfb_basic@unused-pitches,pass
> > > > +igt@kms_addfb_basic@unused-offsets,pass
> > > > +igt@kms_addfb_basic@unused-modifier,pass
> > > > +igt@kms_addfb_basic@legacy-format,dmesg-warn
> > > > +igt@kms_addfb_basic@no-handle,pass
> > > > +igt@kms_addfb_basic@basic,pass
> > > > +igt@kms_addfb_basic@bad-pitch-0,pass
> > > > +igt@kms_addfb_basic@bad-pitch-32,pass
> > > > +igt@kms_addfb_basic@bad-pitch-63,pass
> > > > +igt@kms_addfb_basic@bad-pitch-128,pass
> > > > +igt@kms_addfb_basic@bad-pitch-256,pass
> > > > +igt@kms_addfb_basic@bad-pitch-1024,pass
> > > > +igt@kms_addfb_basic@bad-pitch-999,pass
> > > > +igt@kms_addfb_basic@bad-pitch-65536,pass
> > > > +igt@kms_addfb_basic@size-max,pass
> > > > +igt@kms_addfb_basic@too-wide,pass
> > > > +igt@kms_addfb_basic@too-high,dmesg-warn
> > >
> > > For test results on Trogdor, is is possible to have them be
> > > success/fail/skip only?
> > >
> > > Results such as dmesg-warn/dmesg-fail are igt_runner specific and
> > > because there isn't support for igt_runner on ChromeOS, they will be
> > > difficult to replicate and debug.
> >
> > Actually, I wonder if it would be better to just treat
> > dmesg-warn/dmesg-fail as pass/fail?  I'd noticed some flakes on
> > rockchip which looked just like unrelated dmesg msg which just
> > happened to show up while the test was running.
>
> This is kinda the reason behind standardizing on drm dmesg logging, so
> that we have some chances at filtering stuff out. Not sure that's a
> good idea, since when your entire box splats and lockdep is dead, then
> continuing to run drm tests is still fairly pointless.

I'm not sure if we are using it yet for drm-ci, but for mesa-ci we
monitor dmesg (over serial port, from the controller) for splats, so
we already have the tech for restarting or aborting the CI run.  We
don't need igt-runner to tell us.

> I think this is another reason why trying at least to standardize this
> stuff over drivers would be pretty good idea.
>
> > Additionally, some of the tests, like msm_recovery, are *expected* to
> > generate some dmesg spam since they are intentionally triggering GPU
> > hangs to test the recovery mechanism.
>
> Uh I don't like that. It just allows userspace to spam dmesg, which
> doesn't seem like a great idea. That's at least why i915 dumps these
> at a lower level, and in the past had a special "I'm going to whack
> the gpu real hard expect hangs" knob in debugfs.
>
> Having tests which intentionally spam dmesg above info level isn't
> really good since then you need endless amounts of test-specific
> encoding of what is considered a success and what not. Like when a
> backmerge breaks a testcases which is already at dmesg-fail, is that
> bad or not? Probably bad, but was the situation before that really
> good or already kinda on fire?

I guess I could add some debugfs knobs to squelch the dmesg msgs on
gpu hangs.  In the normal case, I'd prefer that gpu hangs are not
silent.. since that is something we get in feedback reports if a user
(or dogfooder) reports a bug.

The rockchip case I mentioned was some unrelated dmesg about
linktraining failing.. presumably because there was no display
attached?  IDK, I didn't look too closely.  But my point is we could
be getting unrelated and asynchronous dmesg spam, even from other
kernel subsystems.  Letting that be part of the test results just
sounds like asking for flakes.

BR,
-R

> -Daniel
>
> > BR,
> > -R
> >
