Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE7976093
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 07:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736BD10E9DD;
	Thu, 12 Sep 2024 05:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FFqK6NOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417E410E9DD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 05:48:20 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53568ffc525so686331e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 22:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726120098; x=1726724898; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=67Y80IcyVFtNF05+ntsX/eyDU3tUGp9aI1V7Mj8pqIk=;
 b=FFqK6NOzebAvC4nPM536DKvPBMMBP/zFV4vJkg4es9DfDAtHoBC1PfRvMr+ffAJP/F
 eoMO+m3ZplVDikgby+KnAAjFeq5S4JZjjBra0IvAhVq4xmyBA5HWoRMS3pMgRJ6dYBTt
 A0u0fXOCrg/XdFlS8qdZRb5j7Fj9zwScOZKngpdvyK2QHCkpDxneOMJYsT+LED3+X92z
 lrssD9iuXf3PUVIvCSadQSp5TJvpVCMN4ISrQqODzX5cqUhYkHGDMG0KjxdGkbCA6Qtp
 xEWAbMCYcO9Zte+7crUmXewD57KWgErRGPLYsGgrMuq4xTtg5K0Z15VtcJqZsk7EymfN
 ScRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726120098; x=1726724898;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=67Y80IcyVFtNF05+ntsX/eyDU3tUGp9aI1V7Mj8pqIk=;
 b=LyJsM3q6PIHIMJAJs63OGziDmznH9RMNeAPTgaZS1t74JhWwKZyoZZNJ8f7fXXPwey
 VNtFIFuQ/KIZvwTmZOEHlJ6LRBaB988SvtxYLBHjDZYR2IsCAEmTCGvGNMi5/Xzke2rw
 UKAB7nkWJqALjNPsnCGBsoXtdtdmJt83f6qK/CyyXGyuI0t+W641C/KWtQgO4/AE/8KK
 5YrIcbYogBl8UmkN+oM2pvGc2rLzd0JmERTp60YeKcN+Of58czyiwRzjXoZHhwRk5Nby
 udxoMGgB3s0Q34TBk1SN1l7Z8lhtdOmez/S9zgIAuO1CRJYk4dWZ9iXiKxj02mrzmIl+
 U85g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVjBrXYIvoDl3uwF6iKvW3B9qmEXq15BM145ESwrPJvbTSy/kbKYmcNmb9D+G/N3Vk305hro+iXKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1F/5d9HW717bB/S1zU1jWBJDcbZ2CumU+Pj4h27oshk11vFND
 SUhq1tWLJICFH6pta5vc31mDi8zTzE/Jj+k0qpqcTOYnMM25wImfRoMvRYAq0yI=
X-Google-Smtp-Source: AGHT+IHCfphwntWdxOXeEYmRfAKEHq37BQ5cXsVNQKb/rOdDdIkwAvYtTZl9N0jFdK1qXAwkYkMvbw==
X-Received: by 2002:a05:6512:3e02:b0:536:569b:a59c with SMTP id
 2adb3069b0e04-53678fb1ed6mr854489e87.4.1726120097170; 
 Wed, 11 Sep 2024 22:48:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f868e6bsm1768347e87.41.2024.09.11.22.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 22:48:16 -0700 (PDT)
Date: Thu, 12 Sep 2024 08:48:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: Time for drm-ci-next?
Message-ID: <qs72n3l6l63er3d5lrxoravqbjrjllscnyhs7crb6anabvaez4@4hathpqkwnnd>
References: <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
 <CAF6AEGtCEbhBo2CXLQymf2g5RogtdYv2LLXUNQO7Tvuw7x6ujA@mail.gmail.com>
 <ZofMlSIjFV9iGZNM@phenom.ffwll.local>
 <CAF6AEGvDFLBC6BWUdC6L1czn044EuTerPWqLib5hhRVkZyEpig@mail.gmail.com>
 <Zouo16MCRRCNyYAs@phenom.ffwll.local>
 <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
 <CAA8EJppyM_-5fBL6VFp+kxyg36LAbjxqUgA+ico9LBuJvaahxQ@mail.gmail.com>
 <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
 <CAA8EJpoe=Ei7fjZNd24OCVrapt5Y13ZFk8mheqPOy2FBF1a43Q@mail.gmail.com>
 <CAF6AEGub4O86pRM6iM5xaDKVrR57D=OCm00ifFksG1LT9a4+og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGub4O86pRM6iM5xaDKVrR57D=OCm00ifFksG1LT9a4+og@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 09, 2024 at 07:34:04AM GMT, Rob Clark wrote:
> On Mon, Sep 9, 2024 at 2:54 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> > > > On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wrote:
> > > > >
> > > > > On Mon, Jul 8, 2024 at 1:52 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > >
> > > > > > On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > > > > > > On Fri, Jul 5, 2024 at 3:36 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > > > > > > > On Thu, Jul 4, 2024 at 7:08 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > > > > > > > > > > On Fri, Jun 28, 2024 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > > > > > > > > > > > On Wed, Jun 26, 2024 at 10:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > > > > > > > > > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > > > > > > > > > Basically, I often find myself needing to merge CI patches on top of
> > > > > > > > > > > > > > > > > > > msm-next in order to run CI, and then after a clean CI run, reset HEAD
> > > > > > > > > > > > > > > > > > > back before the merge and force-push.  Which isn't really how things
> > > > > > > > > > > > > > > > > > > should work.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > This sounds more like you want an integration tree like drm-tip. Get msm
> > > > > > > > > > > > > > > > branches integrated there, done. Backmerges just for integration testing
> > > > > > > > > > > > > > > > are not a good idea indeed.
> > > > > > > > > > > > >
> > > > > > > > > > > > > But AFAIU this doesn't help for pre-merge testing, ie. prior to a
> > > > > > > > > > > > > patch landing in msm-next
> > > > > > > > > > > > >
> > > > > > > > > > > > > My idea was to have a drm-ci-next managed similar to drm-misc-next, if
> > > > > > > > > > > > > we have needed drm/ci patches we could push them to drm-ci-next, and
> > > > > > > > > > > > > then merge that into the driver tree (along with a PR from drm-ci-next
> > > > > > > > > > > > > to Dave).
> > > > > > > > > > > >
> > > > > > > > > > > > I guess I'm confused about what kind of pre-merge testing we're talking
> > > > > > > > > > > > about then ... Or maybe this just doesn't work too well with the linux
> > > > > > > > > > > > kernel. The model is that you have some pile of trees, they're split up,
> > > > > > > > > > > > and testing of all the trees together is done in integration trees like
> > > > > > > > > > > > linux-next or drm-tip.
> > > > > > > > > > >
> > > > > > > > > > > pre-merge: for msm we've been collecting up patches from list into a
> > > > > > > > > > > fast-forward MR which triggers CI before merging to msm-next/msm-fixes
> > > > > > > > > > >
> > > > > > > > > > > Ideally drm-misc and other trees would do similar, we'd catch more
> > > > > > > > > > > regressions that way.  For example, in msm-next the nodebugfs build is
> > > > > > > > > > > currently broken, because we merged drm-misc-next at a time when
> > > > > > > > > > > komeda was broken:
> > > > > > > > > > >
> > > > > > > > > > > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> > > > > > > > > > >
> > > > > > > > > > > If drm-misc was using pre-merge CI this would have been caught and the
> > > > > > > > > > > offending patch dropped.
> > > > > > > > > >
> > > > > > > > > > That sounds more like we should push on the drm-misc pre-merge CI boulder
> > > > > > > > > > to move it uphill, than add even more trees to make it even harder to get
> > > > > > > > > > there long term ...
> > > > > > > > > >
> > > > > > > > > > Short term it helps locally to have finer trees, but only short term and
> > > > > > > > > > only very locally.
> > > > > > > > >
> > > > > > > > > The path to have fewer trees (ideally only one for all of drm) is to
> > > > > > > > > use gitlab MRs to land everything :-)
> > > > > > > > >
> > > > > > > > > drm-ci-next is only a stop-gap.. but one that we need.  The
> > > > > > > > > ${branchname}-external-fixes trick covers _most_ cases where we need
> > > > > > > > > unrelated patches (ie. to fix random ToT breakage outside of drm or in
> > > > > > > > > core drm), but it doesn't help when the needed changes are yml
> > > > > > > > > (because gitlab processes all the yml before merging the
> > > > > > > > > -external-fixes branch).  This is where we need drm-ci-next, otherwise
> > > > > > > > > we are having to create a separate MR which cherry-picks drm/ci
> > > > > > > > > patches for doing the CI.  This is a rather broken process.
> > > > > > > >
> > > > > > > > So what I don't get is ... if we CI drm-misc, how does that not help
> > > > > > > > improve the situation here? Step one would be post-merge (i.e. just enable
> > > > > > > > CI in the repo), then get MRs going.
> > > > > > >
> > > > > > > I guess post-merge is better than nothing.. but pre-merge is better.
> > > > > > >
> > > > > > > post-merge can work if you have a "sheriff" system where someone
> > > > > > > (perhaps on a rotation) is actively monitoring results and "revert and
> > > > > > > ask questions later" when something breaks.  Pre-merge ensures the
> > > > > > > interested party is involved in the process ;-)
> > > > > >
> > > > > > So ... make that happen? And it doesn't have to be for all of drm-misc,
> > > > > > mesa after all switched over to MR also on a bit a driver/area basis. So
> > > > > > agreeing among all drm-ci folks to use gitlab MR in drm-misc for pre-merge
> > > > > > testing shouldn't be that hard to make happen. And unlike a separate
> > > > > > branch it's not some kind of detour with a good chance to get stuck in a
> > > > > > local optimum.
> > > > >
> > > > > Tree vs branch doesn't really have much in the way of distinction,
> > > > > modulo gitlab permissions.  In that it doesn't do much good if drm/ci
> > > > > patches are landing on a different branch.
> > > > >
> > > > > I guess what you are suggesting is that we have a single tree/branch
> > > > > that drm/ci + drm/msm + (plus whoever else wants to get in on the
> > > > > drm/ci, so probably at least vkms) lands patches into via gitlab MRs?
> > > >
> > > > This again brings a separate CI-enabled tree. I think it has been
> > > > suggested to start with enabling DRM CI for drm-misc branches. Then we
> > > > can possibly start landing MRs with CI testing (probably starting with
> > > > vkms).
> > >
> > > It's something we've discussed with Sima for a while, but enabling CI on
> > > drm-misc at some point will make sense so we could just as well start
> > > now.
> > >
> > > The biggest unknown at the moment to start doing so is how we could keep
> > > drm-tip and the rerere repo with MR.
> >
> > Let's do a slow start and begin with post-merge testing. At least this
> > gives us an idea of how stable it is (and what does it take to keep it
> > green). Maybe we can perform post-merge testing for both drm-misc and
> > drm-tip.
> 
> The one thing is that currently the runtime for igt is quite long
> (~1hr) because you can't really parallelize kms tests.  So maybe
> nightly scheduled runs would be a better idea.

SGTM. So, the question would be, who can set it up?

-- 
With best wishes
Dmitry
