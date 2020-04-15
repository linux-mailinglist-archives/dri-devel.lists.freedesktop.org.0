Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B215C1A93C9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B736E84A;
	Wed, 15 Apr 2020 07:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77696E849
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:01:01 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id b7so10096835oic.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lU+luablGvCrZZtuzKXbUNbAb0SeQVBtIxM0fjG8aoM=;
 b=VT3Xb8HdbY9XlVf29v4w+Xwo5ORekLw2e++rDmOtEP1JfGMoODXfqn8wtd3R0y3mSE
 lstc8ruVU0gAreenkfI1n4OgFIsb8TUrFCwVOz/C7sGiMVVdyjeHw2AoyFJUgF0HNznz
 SQTVArJracLIE795F2Qu4/M/3LQa+TYANhygw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lU+luablGvCrZZtuzKXbUNbAb0SeQVBtIxM0fjG8aoM=;
 b=ni74H12IBfJ3UGDQuCPLiySqGZVeUrTrq6QMhb93/cqKNSEF39IPL52v8frh3uNAik
 rxxeVyiX/ybgJ0DKvSd7qnjbLb+qpo0VEuATXJs7vmyLvVs2Ic5G+Z0vj7zWBvMwO2/c
 Uc6ZKw6yDAiSIcb4/RycIM2btgh3zrVdI00ByufdGEk4xge2MDFABzNwiadm2fzNV/Rd
 J2PPpFS4Q9bTtFHDpgHtkIKD0EneYLtVKjDaTDl6tASxvbXT6EwI1crHD1thNAJHK7mu
 r25nns/hKaA49ENYIWc/UJOP+fqceA5CV9D2mdTyaqDTpo52ag09ekqP4mu/CUIBVxKJ
 6aMw==
X-Gm-Message-State: AGi0PubaqC109Q9KDh8HxXWfy34I1FNjHTYxbMmEGXdFfyHv88efC+Tk
 DvlVkgJuiMbmQloP5p6YXCorjcNbjzOMh6ZZL/GeVA==
X-Google-Smtp-Source: APiQypLbgQnruNzn4opx1TRRqUTZGpBXHYEqPa0rcXM0gpdgBfu246aBX6AHOSSsTzjZ8P1+NXBUlZlElr1agqD54ew=
X-Received: by 2002:aca:b20a:: with SMTP id b10mr16880893oif.101.1586934061134; 
 Wed, 15 Apr 2020 00:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <efb3d0d9-2cf7-046b-3a9b-2548d086258e@linux.intel.com>
 <87wo6h5k0d.fsf@intel.com>
In-Reply-To: <87wo6h5k0d.fsf@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 15 Apr 2020 09:00:50 +0200
Message-ID: <CAKMK7uEWkGA2e2ZV9H0m8ParE_9DNtgAhG3FuqPzvgv-xeVcng@mail.gmail.com>
Subject: Re: [PULL] topic/phy-compliance
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexdeucher@gmail.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 8:40 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Wed, 08 Apr 2020, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> > Hey,
> >
> > Here's a pull request to pull in the DP PHY Compliance series.
> > It's based on top of drm/drm-next, and contains all patches for core, amd and i915. :)
>
> Ping, I don't see this merged in any tree yet.

Generally topic pull requests get pulled into all relevant trees,
which would be drm-misc, drm-intel and drm-amd here. All of the
optional ofc if you do instead maintainer-acks for merging through
another tree.

Since I wasn't involved in this no idea who requested the topic tree
instead of acks, and the pull isn't addressed to specific people who
should pull it in (I generally add that to avoid confusion like this
here), but this aint something that drm.git needs to pull. Just stuff
it into one of the trees as usual. Also just noticed that amd
maintainers arent even cc'ed, adding Alex. You guys pls figure this
out :-)
-Daniel

>
> BR,
> Jani.
>
>
> >
> > Cheers,
> > Maarten
> >
> > topic/phy-compliance-2020-04-08:
> > Topic pull request for topic/phy-compliance:
> > - Standardize DP_PHY_TEST_PATTERN name.
> > - Add support for setting/getting test pattern from sink.
> > - Implement DP PHY compliance to i915.
> > The following changes since commit 12ab316ced2c5f32ced0e6300a054db644b5444a:
> >
> >   Merge tag 'amd-drm-next-5.7-2020-04-01' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-04-08 09:34:27 +1000)
> >
> > are available in the Git repository at:
> >
> >   git://anongit.freedesktop.org/drm/drm-misc tags/topic/phy-compliance-2020-04-08
> >
> > for you to fetch changes up to 8cdf727119289db3a98835662eb28e1c5ad835f1:
> >
> >   drm/i915/dp: Program vswing, pre-emphasis, test-pattern (2020-04-08 14:41:09 +0200)
> >
> > ----------------------------------------------------------------
> > Topic pull request for topic/phy-compliance:
> > - Standardize DP_PHY_TEST_PATTERN name.
> > - Add support for setting/getting test pattern from sink.
> > - Implement DP PHY compliance to i915.
> >
> > ----------------------------------------------------------------
> > Animesh Manna (7):
> >       drm/amd/display: Align macro name as per DP spec
> >       drm/dp: get/set phy compliance pattern
> >       drm/i915/dp: Made intel_dp_adjust_train() non-static
> >       drm/i915/dp: Preparation for DP phy compliance auto test
> >       drm/i915/dp: Add debugfs entry for DP phy compliance
> >       drm/i915/dp: Register definition for DP compliance register
> >       drm/i915/dp: Program vswing, pre-emphasis, test-pattern
> >
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   2 +-
> >  drivers/gpu/drm/drm_dp_helper.c                    |  94 +++++++++++
> >  .../gpu/drm/i915/display/intel_display_debugfs.c   |  12 +-
> >  drivers/gpu/drm/i915/display/intel_display_types.h |   1 +
> >  drivers/gpu/drm/i915/display/intel_dp.c            | 171 +++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.h            |   1 +
> >  .../gpu/drm/i915/display/intel_dp_link_training.c  |   9 +-
> >  .../gpu/drm/i915/display/intel_dp_link_training.h  |   4 +
> >  drivers/gpu/drm/i915/i915_reg.h                    |  18 +++
> >  include/drm/drm_dp_helper.h                        |  33 +++-
> >  10 files changed, 337 insertions(+), 8 deletions(-)
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
