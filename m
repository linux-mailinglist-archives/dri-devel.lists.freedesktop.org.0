Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F8D523EF5
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 22:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3316910FF40;
	Wed, 11 May 2022 20:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC2010FF40;
 Wed, 11 May 2022 20:32:41 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k2so4531521wrd.5;
 Wed, 11 May 2022 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HUHLy25jGYvlKwa6rO2wZGsa1KELWrC5u8KS5wDsStM=;
 b=WmgQRvBkrk/wB6ua+NbYMxd32Cxri0mtP4W62mjoMEacLD6EjtDPkvHOSHwx0R0ffX
 X4Vpso7mAVpxyJdW4jM5j2sOxnka+FOExiFNZxW+5YZEgxDPHSn+QUMh3lQGrFx/DbNz
 0cJOoOrcQLt9XOL+/IPQHERLnOtyvOKoNRTVfil4vq/fwjylAbIVLAHLuL0xAKYKPrQX
 43wYhqGxPpNHxoPgkVOmDw618dW+PJvVoQmHDL8aPNlAmRNOc/kfKYMSes5u94UUUMIr
 UehgH4yfZdBFoCXclHTNE5cUtc3QZIlIMXSO05b99QnvuU3mKYJKMNGAYNou0QwLT3py
 Tr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HUHLy25jGYvlKwa6rO2wZGsa1KELWrC5u8KS5wDsStM=;
 b=anZ9u4ZSYN/aZKZRCwxiaVEWhEj1EfXFcd13lbJz+46NP5LRYvqkaO0+ZKmYtNlvPt
 zCCJnmluhTNehVwCX1QygTOgc2dIHujRIa9nmPry+nCBjL4q63a+88TvsctC00ief0ha
 bg796pls3CAsELkLFXyc1yJmHKZbg4tbIx84XbHWdQw9Yb9nYVv/nNV0l3aA+YbcXu3a
 YQgUCSwUiJVcwzizWSGmijCySZAgmXIkFbUX60DLvDwKeHIpYNGcJ4lCwmo7gXYtuvg/
 23UIZ+sEInvIwu37JXgQFrgf7nnKui8G0orhQ+7RKBE+CNnrhh8Deq+7ZaoIhiQs05Zc
 Xfeg==
X-Gm-Message-State: AOAM532Up9uxOssgIsGyzv+/5x37tWG4AaIwjRNySdURJOVlVgB98aBb
 aZL8gCpLhfIKu4AGiL9P+sdmae0tK5wG013zgxs=
X-Google-Smtp-Source: ABdhPJy++BOB5kcunxbHexH/sQCoMbPtAC4SMhnBUKC2eCkE4F+c58lBTJlGt/3FbgyepCi0MOTySGrhWK8Z9c0AkKg=
X-Received: by 2002:adf:fec2:0:b0:20c:6ffb:9598 with SMTP id
 q2-20020adffec2000000b0020c6ffb9598mr24542703wrs.418.1652301159638; Wed, 11
 May 2022 13:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <e4e03cd8-3ebc-e5e1-e7d0-6bdc038049b5@quicinc.com>
 <CAF6AEGueadnRMiatO3MoHS+NTQ1o1sgcV0cVjJM3iu-6JUNmNw@mail.gmail.com>
 <CAKMK7uGRuCZwF6m02tcxxrgQGaijsYaNkowjxR+cw0JM3UpDkQ@mail.gmail.com>
 <CAF6AEGthpxPLxyt_i-aUFgW485hA5qw+xXcJ3gKQUJ+fM=ZBhg@mail.gmail.com>
 <CAKMK7uGQvay9-twVuEKJe7Hz88iQGBP+bdO+3tKJnsjZsnfV9Q@mail.gmail.com>
In-Reply-To: <CAKMK7uGQvay9-twVuEKJe7Hz88iQGBP+bdO+3tKJnsjZsnfV9Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 May 2022 13:32:26 -0700
Message-ID: <CAF6AEGu1tzz5NgLzXC9X5NwX8XxgJUkJ5CJ5Au8Wt2ZeD815gQ@mail.gmail.com>
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

On Wed, May 11, 2022 at 12:14 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, 11 May 2022 at 19:46, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, May 11, 2022 at 10:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, 10 May 2022 at 22:26, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Tue, May 10, 2022 at 12:39 PM Jessica Zhang
> > > > <quic_jesszhan@quicinc.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On 5/10/2022 7:13 AM, Tomeu Vizoso wrote:
> > > > > > And use it to store expectations about what the drm/msm driver is
> > > > > > supposed to pass in the IGT test suite.
> > > > > >
> > > > > > Also include a configuration file that points to the out-of-tree CI
> > > > > > scripts.
> > > > > >
> > > > > > By storing the test expectations along the code we can make sure both
> > > > > > stay in sync with each other, and so we can know when a code change
> > > > > > breaks those expectations.
> > > > > >
> > > > > > This will allow all contributors to drm/msm to reuse the infrastructure
> > > > > > already in gitlab.freedesktop.org to test the driver on several
> > > > > > generations of the hardware.
> > > > > >
> > > > > > v2:
> > > > > >    - Fix names of result expectation files to match SoC
> > > > > >    - Don't execute tests that are going to skip on all boards
> > > > > >
> > > > > > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > > > > ---
> > > > > >   Documentation/gpu/msm_automated_testing.rst   |  70 +++++++++
> > > > > >   drivers/gpu/drm/msm/ci/gitlab-ci.yml          |  11 ++
> > > > > >   drivers/gpu/drm/msm/ci/msm.testlist           | 148 ++++++++++++++++++
> > > > > >   .../gpu/drm/msm/ci/msm_apq8016_results.txt    | 140 +++++++++++++++++
> > > > > >   .../gpu/drm/msm/ci/msm_apq8096_results.txt    | 140 +++++++++++++++++
> > > > > >   drivers/gpu/drm/msm/ci/msm_sc7180_results.txt | 141 +++++++++++++++++
> > > > > >   drivers/gpu/drm/msm/ci/msm_sdm845_results.txt | 141 +++++++++++++++++
> > > > > >   7 files changed, 791 insertions(+)
> > > > > >   create mode 100644 Documentation/gpu/msm_automated_testing.rst
> > > > > >   create mode 100644 drivers/gpu/drm/msm/ci/gitlab-ci.yml
> > > > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm.testlist
> > > > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
> > > > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
> > > > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
> > > > > >   create mode 100644 drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
> > > > > >
> >
> > [snip]
> >
> > > > > > diff --git a/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt b/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
> > > > > > new file mode 100644
> > > > > > index 000000000000..01f7b4b399b5
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
> > > > > > @@ -0,0 +1,141 @@
> > > > > > +igt@core_auth@getclient-simple,dmesg-warn
> > > > > > +igt@core_auth@getclient-master-drop,pass
> > > > > > +igt@core_auth@basic-auth,pass
> > > > > > +igt@core_auth@many-magics,pass
> > > > > > +igt@core_getclient,pass
> > > > > > +igt@core_getstats,pass
> > > > > > +igt@core_getversion,pass
> > > > > > +igt@core_setmaster_vs_auth,pass
> > > > > > +igt@drm_read@invalid-buffer,pass
> > > > > > +igt@drm_read@fault-buffer,pass
> > > > > > +igt@drm_read@empty-block,pass
> > > > > > +igt@drm_read@empty-nonblock,pass
> > > > > > +igt@drm_read@short-buffer-block,pass
> > > > > > +igt@drm_read@short-buffer-nonblock,pass
> > > > > > +igt@drm_read@short-buffer-wakeup,pass
> > > > > > +igt@kms_addfb_basic@unused-handle,pass
> > > > > > +igt@kms_addfb_basic@unused-pitches,pass
> > > > > > +igt@kms_addfb_basic@unused-offsets,pass
> > > > > > +igt@kms_addfb_basic@unused-modifier,pass
> > > > > > +igt@kms_addfb_basic@legacy-format,dmesg-warn
> > > > > > +igt@kms_addfb_basic@no-handle,pass
> > > > > > +igt@kms_addfb_basic@basic,pass
> > > > > > +igt@kms_addfb_basic@bad-pitch-0,pass
> > > > > > +igt@kms_addfb_basic@bad-pitch-32,pass
> > > > > > +igt@kms_addfb_basic@bad-pitch-63,pass
> > > > > > +igt@kms_addfb_basic@bad-pitch-128,pass
> > > > > > +igt@kms_addfb_basic@bad-pitch-256,pass
> > > > > > +igt@kms_addfb_basic@bad-pitch-1024,pass
> > > > > > +igt@kms_addfb_basic@bad-pitch-999,pass
> > > > > > +igt@kms_addfb_basic@bad-pitch-65536,pass
> > > > > > +igt@kms_addfb_basic@size-max,pass
> > > > > > +igt@kms_addfb_basic@too-wide,pass
> > > > > > +igt@kms_addfb_basic@too-high,dmesg-warn
> > > > >
> > > > > For test results on Trogdor, is is possible to have them be
> > > > > success/fail/skip only?
> > > > >
> > > > > Results such as dmesg-warn/dmesg-fail are igt_runner specific and
> > > > > because there isn't support for igt_runner on ChromeOS, they will be
> > > > > difficult to replicate and debug.
> > > >
> > > > Actually, I wonder if it would be better to just treat
> > > > dmesg-warn/dmesg-fail as pass/fail?  I'd noticed some flakes on
> > > > rockchip which looked just like unrelated dmesg msg which just
> > > > happened to show up while the test was running.
> > >
> > > This is kinda the reason behind standardizing on drm dmesg logging, so
> > > that we have some chances at filtering stuff out. Not sure that's a
> > > good idea, since when your entire box splats and lockdep is dead, then
> > > continuing to run drm tests is still fairly pointless.
> >
> > I'm not sure if we are using it yet for drm-ci, but for mesa-ci we
> > monitor dmesg (over serial port, from the controller) for splats, so
> > we already have the tech for restarting or aborting the CI run.  We
> > don't need igt-runner to tell us.
> >
> > > I think this is another reason why trying at least to standardize this
> > > stuff over drivers would be pretty good idea.
> > >
> > > > Additionally, some of the tests, like msm_recovery, are *expected* to
> > > > generate some dmesg spam since they are intentionally triggering GPU
> > > > hangs to test the recovery mechanism.
> > >
> > > Uh I don't like that. It just allows userspace to spam dmesg, which
> > > doesn't seem like a great idea. That's at least why i915 dumps these
> > > at a lower level, and in the past had a special "I'm going to whack
> > > the gpu real hard expect hangs" knob in debugfs.
> > >
> > > Having tests which intentionally spam dmesg above info level isn't
> > > really good since then you need endless amounts of test-specific
> > > encoding of what is considered a success and what not. Like when a
> > > backmerge breaks a testcases which is already at dmesg-fail, is that
> > > bad or not? Probably bad, but was the situation before that really
> > > good or already kinda on fire?
> >
> > I guess I could add some debugfs knobs to squelch the dmesg msgs on
> > gpu hangs.  In the normal case, I'd prefer that gpu hangs are not
> > silent.. since that is something we get in feedback reports if a user
> > (or dogfooder) reports a bug.
> >
> > The rockchip case I mentioned was some unrelated dmesg about
> > linktraining failing.. presumably because there was no display
> > attached?  IDK, I didn't look too closely.  But my point is we could
> > be getting unrelated and asynchronous dmesg spam, even from other
> > kernel subsystems.  Letting that be part of the test results just
> > sounds like asking for flakes.
>
> That's why I think you need to filter dmesg, otherwise you'll just get
> random stuff in there that causes flaps.

We've evolved a bit of that over the time, see:

https://gitlab.freedesktop.org/gfx-ci/drm-ci/-/blob/main/.gitlab-ci/bare-metal/cros_servo_run.py#L94

It tends to be a bit specific to the runners and their quirks.  But
mesa does a lot of CI runs, so once-in-a-blue-moon quirks quickly turn
frustrating if the CI machinery doesn't detect them, and (for ex)
reboot and restart the DUT

BR,
-R

> And then in another level you need different filtering to figure out
> when your kernel is too busted and you need to reboot (like when
> lockdep splats anywhere).
>
> Maybe we should pull that part of igt_runner out so that it can be
> used in places where the full thing cant? Maybe even in mesa as a "my
> kernel is in really bad shape" kinda test. There's a lot of tea leaves
> reading heuristics involved in this stuff ime.
> -Daniel
>
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > > BR,
> > > > -R
> > > >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
