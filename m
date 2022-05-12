Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED5F524F37
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 16:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3B10F96C;
	Thu, 12 May 2022 14:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D7A10F96C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 14:02:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id p189so3093639wmp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 07:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y5zEOR8a2tEkZy/r6HUczq8om3FfL9i9nYmMHgZoVJY=;
 b=HprFLMVg4LbqJ+pbrw6wTtnHQb3AMb89BE3vhNP+EI+RbD0KiLCACPrCAyu1q2fDWw
 kJHivbngQXjomyStmHAncejy/E/iy4Cr+uGLfgohOAciGYUTD5YZAKiKF/wZABnIH7bQ
 jr5XdpGMMTm3GBXy5SC9VULk+3EFB9sjBTuCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Y5zEOR8a2tEkZy/r6HUczq8om3FfL9i9nYmMHgZoVJY=;
 b=7eKY0lZY5Pw87cE2EbCx5FxtYAKLwU8P5e+6ULpX8tJDf2vOKydjf8GwgluYCkO9V7
 QP5lRoWzFXfCjrL68WpiJ/8+GQdkTQAyrTPEXIZFaW5QMiexH+R8luPOcYd6uxB1VEZ9
 CxIYnkz8brnUQmkAHIDdK4i5nzS8hRZbrYEVybJvVT6t27uEVR44kY0c2CNfMJKHVNUv
 tDO/EQ2ZEYT0XR6lEqzQK4657sfoRTEuPYxJPXKrHH296tWuyAbqf2NavX21/30r5h+s
 yt2WrSyc+joStUvl2e69NHBEtAsXYUx45OzOn2y/Uhs7OYI1ZcwL065aUW4IxENKsa0A
 ZMzw==
X-Gm-Message-State: AOAM531a1HcBMiyF6viAbBp+xw+2b6Kzq6TukvEwetW9Cw40yUrhX4Ln
 +I8aH4IPfKunFbTr0Nj17Zj41Q==
X-Google-Smtp-Source: ABdhPJzPtiUjtRrz1hCSkubjaMF5DK7FhphPaMUkyQlWPr7RMXTEB7eQTDkzhJR0n4ZglX3xo1X1ng==
X-Received: by 2002:a1c:2c6:0:b0:38f:f280:caa2 with SMTP id
 189-20020a1c02c6000000b0038ff280caa2mr25599wmc.87.1652364149421; 
 Thu, 12 May 2022 07:02:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adff285000000b0020c5253d8desm4241643wro.42.2022.05.12.07.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 07:02:28 -0700 (PDT)
Date: Thu, 12 May 2022 16:02:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [Freedreno] [RFC v2] drm/msm: Add initial ci/ subdirectory
Message-ID: <Yn0TcgMbOY1R0fuQ@phenom.ffwll.local>
Mail-Followup-To: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <e4e03cd8-3ebc-e5e1-e7d0-6bdc038049b5@quicinc.com>
 <CAF6AEGueadnRMiatO3MoHS+NTQ1o1sgcV0cVjJM3iu-6JUNmNw@mail.gmail.com>
 <CAKMK7uGRuCZwF6m02tcxxrgQGaijsYaNkowjxR+cw0JM3UpDkQ@mail.gmail.com>
 <CAF6AEGthpxPLxyt_i-aUFgW485hA5qw+xXcJ3gKQUJ+fM=ZBhg@mail.gmail.com>
 <79d79110-9fbc-0e96-d17e-68a1f8f2c224@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79d79110-9fbc-0e96-d17e-68a1f8f2c224@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 12, 2022 at 03:28:16PM +0200, Tomeu Vizoso wrote:
> On 5/11/22 7:46 PM, Rob Clark wrote:
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
> > > > > >     - Fix names of result expectation files to match SoC
> > > > > >     - Don't execute tests that are going to skip on all boards
> > > > > > 
> > > > > > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > > > > ---
> > > > > >    Documentation/gpu/msm_automated_testing.rst   |  70 +++++++++
> > > > > >    drivers/gpu/drm/msm/ci/gitlab-ci.yml          |  11 ++
> > > > > >    drivers/gpu/drm/msm/ci/msm.testlist           | 148 ++++++++++++++++++
> > > > > >    .../gpu/drm/msm/ci/msm_apq8016_results.txt    | 140 +++++++++++++++++
> > > > > >    .../gpu/drm/msm/ci/msm_apq8096_results.txt    | 140 +++++++++++++++++
> > > > > >    drivers/gpu/drm/msm/ci/msm_sc7180_results.txt | 141 +++++++++++++++++
> > > > > >    drivers/gpu/drm/msm/ci/msm_sdm845_results.txt | 141 +++++++++++++++++
> > > > > >    7 files changed, 791 insertions(+)
> > > > > >    create mode 100644 Documentation/gpu/msm_automated_testing.rst
> > > > > >    create mode 100644 drivers/gpu/drm/msm/ci/gitlab-ci.yml
> > > > > >    create mode 100644 drivers/gpu/drm/msm/ci/msm.testlist
> > > > > >    create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
> > > > > >    create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
> > > > > >    create mode 100644 drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
> > > > > >    create mode 100644 drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
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
> 
> Yep, these scripts are currently being used as-is from Mesa, so we got that
> functionality for free.
> 
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
> I think some drivers are currently a bit too buggy to behave reliably under
> CI unless one reduces coverage (rockchip on rk3399, for example). And some
> other drivers (in other subsystems as well) could do with a review of what
> they print to the console. I guess these are things we could and probably
> should fix?

I think the best way for these is to still run the tests, but supress the
results. At least if the flakiness is only in whether the test passes, and
not in the test run outright killing the kernel/machine somehow.

But yeah sometimes just having an explicit run list is the way to go, and
we have plenty of that in intel ci. But for i915 it's more a testament to
how terrible the i915-gem tests in particular have become, largely also
because people simply kept adding crap and never removed much at all (and
sometimes even removed important tests, oh well).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
