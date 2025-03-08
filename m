Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8727A577D0
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 04:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76710E1B0;
	Sat,  8 Mar 2025 03:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0FC10E1A2
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 03:14:47 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54991d85f99so1509855e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 19:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741403685; x=1742008485; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3EqbZ+BYD7vMuW2Dsbf5NrzPF3F7j3lge+N9Yv0ak9c=;
 b=HrUgJZF/xy5UVGP0sT+V6YlWU1B6NXH2CjqSHWS67IRaETVf89Yzc9Z04O++1Ywnqj
 KfPl3vDaw536fk+UYLbUOaF8HCGDRTo/AgMAIKhPLEKPMgJyY4ETlBkUMmqglK1pnZmx
 wzWaa/JJCihV7NFnP9wkwrRcf25jpkGgoM2FLKRYJciaTi9tnRsO/blNzOgkAQ9DEinV
 EMn0lIYS8MValoBdlxR3EpQrzVYLIxNhMTjLClacFHbmyrpoNKI64tdvR9wo51MDWQLk
 qSKXjVmhxG0PeTF/vXDHPchcXknApkVYxYWg95qROFTe6p5PHaqs5d6ZJyPKVVHg+iu5
 QhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741403685; x=1742008485;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3EqbZ+BYD7vMuW2Dsbf5NrzPF3F7j3lge+N9Yv0ak9c=;
 b=TDbGnyOlz6rNlvM/87nfa4cc2mZqJjPX8rjdK9P65syQbMA5DCR02aZrc3BLih8MCI
 Ue1cfe6ixIZpMO3QUXqHCExySxR6LPn9YzIGYJIStWjSD6ImjkKcbZHD0E3QhMQ4pRnr
 YOBHuipuCCy59sJe/j72r2wY+2h9u6LuzN8ewfMlQ1obqFuAY7tHPXUOuBwlZxx5JUzV
 TDNgdrWsdBrRGEGilz2ifZZ5Xe8IExnsPlqDHyNx3mR/9Oext9++YvSRdrrgX9Yf77yb
 QiUSMZmXWZgR9WO7DlEAx8ZiYH0NzCFIBgkB4bSNejgYz3P35/PERcKMPfRXBaFWP0Ta
 2GTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlgKKh5NoOCQ67R6/Y3BTBxPoNW4LuiEn9fXND0D7Qu08m1EYiMMXvv4mruRCswVlpvysP0O1Ax+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwjbqXc85HL/+hDdyCqUf6jQw1TfzA1ql5ZMTKFvIhZ9FMLWkJ
 LVLc8P/cy5rjz4ixjF2rEY00hVUBvp6SrFAwX7M8ex+SoSck17eMoL3rIA6C6tg=
X-Gm-Gg: ASbGnctSEvO8auWayjyJnEPOhWdv5ZMbu2aCokrMSFHDmMrSTixI0v77e7ZdG6D6y2f
 3KN/MJq10Ci1Z3KBwpM648l1sbyctFVUFUKbkvTO6y3eaBvunzTLNr6Mekm2pmKBwyo/8+xlA89
 3gf1+Rz3Fffaf+Fkpx/XCgyRU63jSdZn0E+Mz9uPl4szINc51UXgKTTg25RCrfpDfUQQZk3p9n1
 EGjmOzFjy5BudaQEzEeU9W75ZNfJq1JRfbvErKjRQatB9z0LthfKEslROBdqmfcb5GlkKPLGE3L
 /S4qt0X6gBjbuyQuqwRGgIh8finzVut+6cQ8pY6sXKWL1yHKVEMGEMDSonXSHWJvt4YB/fgeH0b
 fq8SJ7A544l3nVZ1tjPMdXBOx
X-Google-Smtp-Source: AGHT+IGGagxB83olzHYPuDZE5wXMWhkZqzJM+ZctbMzJEMFrP6a4omRNv0TVeatmhS0/MGwUMUtQLg==
X-Received: by 2002:a05:6512:12c3:b0:549:6030:a720 with SMTP id
 2adb3069b0e04-54997ef5214mr625205e87.23.1741403684938; 
 Fri, 07 Mar 2025 19:14:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b0bcf5csm684391e87.147.2025.03.07.19.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 19:14:43 -0800 (PST)
Date: Sat, 8 Mar 2025 05:14:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>,
 Helen Koike <helen.koike@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, 
 Rob Clark <robdclark@chromium.org>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: Time for drm-ci-next?
Message-ID: <ppohyz3ibdaoifqkhgp6ym5qm33hutak54dlgfb75hpxfhepjl@2u3bf75ixyac>
References: <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
 <CAA8EJppyM_-5fBL6VFp+kxyg36LAbjxqUgA+ico9LBuJvaahxQ@mail.gmail.com>
 <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
 <CAA8EJpoe=Ei7fjZNd24OCVrapt5Y13ZFk8mheqPOy2FBF1a43Q@mail.gmail.com>
 <CAF6AEGub4O86pRM6iM5xaDKVrR57D=OCm00ifFksG1LT9a4+og@mail.gmail.com>
 <qs72n3l6l63er3d5lrxoravqbjrjllscnyhs7crb6anabvaez4@4hathpqkwnnd>
 <67c8cf4c-f224-4c24-96b2-92aaa3224321@collabora.com>
 <CAF6AEGvDc7RfZ2Y4B2oBag=MaAuUTJxjMwvD0yieA6qb42QMVQ@mail.gmail.com>
 <20250307-just-calm-centipede-b617ab@houat>
 <CAF6AEGsaqy0rXFMTV-6nrusqK1wpV2AkHP4=fwJJC_xd7kQROA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsaqy0rXFMTV-6nrusqK1wpV2AkHP4=fwJJC_xd7kQROA@mail.gmail.com>
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

On Fri, Mar 07, 2025 at 09:26:54AM -0800, Rob Clark wrote:
> On Fri, Mar 7, 2025 at 9:00 AM Maxime Ripard <mripard@redhat.com> wrote:
> >
> > On Fri, Mar 07, 2025 at 08:42:46AM -0800, Rob Clark wrote:
> > > On Tue, Sep 24, 2024 at 5:27 AM Vignesh Raman
> > > <vignesh.raman@collabora.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On 12/09/24 11:18, Dmitry Baryshkov wrote:
> > > > > On Mon, Sep 09, 2024 at 07:34:04AM GMT, Rob Clark wrote:
> > > > >> On Mon, Sep 9, 2024 at 2:54 AM Dmitry Baryshkov
> > > > >> <dmitry.baryshkov@linaro.org> wrote:
> > > > >>>
> > > > >>> On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.com> wrote:
> > > > >>>>
> > > > >>>> Hi,
> > > > >>>>
> > > > >>>> On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> > > > >>>>> On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wrote:
> > > > >>>>>>
> > > > >>>>>> On Mon, Jul 8, 2024 at 1:52 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > >>>>>>>
> > > > >>>>>>> On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > > > >>>>>>>> On Fri, Jul 5, 2024 at 3:36 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > >>>>>>>>>
> > > > >>>>>>>>> On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > > >>>>>>>>>> On Thu, Jul 4, 2024 at 7:08 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > > > >>>>>>>>>>>> On Fri, Jun 28, 2024 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >>>>>>>>>>>>>
> > > > >>>>>>>>>>>>> On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > > >>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 10:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> > > > >>>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > > > >>>>>>>>>>>>>>>>> On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > > >>>>>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>>>>> On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > >>>>>>>>>>>>>>>>>>> Hi,
> > > > >>>>>>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>>>>>> On 15/03/24 22:50, Rob Clark wrote:
> > > > >>>>>>>>>>>>>>>>>>>> Basically, I often find myself needing to merge CI patches on top of
> > > > >>>>>>>>>>>>>>>>>>>> msm-next in order to run CI, and then after a clean CI run, reset HEAD
> > > > >>>>>>>>>>>>>>>>>>>> back before the merge and force-push.  Which isn't really how things
> > > > >>>>>>>>>>>>>>>>>>>> should work.
> > > > >>>>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>>>> This sounds more like you want an integration tree like drm-tip. Get msm
> > > > >>>>>>>>>>>>>>>>> branches integrated there, done. Backmerges just for integration testing
> > > > >>>>>>>>>>>>>>>>> are not a good idea indeed.
> > > > >>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>> But AFAIU this doesn't help for pre-merge testing, ie. prior to a
> > > > >>>>>>>>>>>>>> patch landing in msm-next
> > > > >>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>> My idea was to have a drm-ci-next managed similar to drm-misc-next, if
> > > > >>>>>>>>>>>>>> we have needed drm/ci patches we could push them to drm-ci-next, and
> > > > >>>>>>>>>>>>>> then merge that into the driver tree (along with a PR from drm-ci-next
> > > > >>>>>>>>>>>>>> to Dave).
> > > > >>>>>>>>>>>>>
> > > > >>>>>>>>>>>>> I guess I'm confused about what kind of pre-merge testing we're talking
> > > > >>>>>>>>>>>>> about then ... Or maybe this just doesn't work too well with the linux
> > > > >>>>>>>>>>>>> kernel. The model is that you have some pile of trees, they're split up,
> > > > >>>>>>>>>>>>> and testing of all the trees together is done in integration trees like
> > > > >>>>>>>>>>>>> linux-next or drm-tip.
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> pre-merge: for msm we've been collecting up patches from list into a
> > > > >>>>>>>>>>>> fast-forward MR which triggers CI before merging to msm-next/msm-fixes
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> Ideally drm-misc and other trees would do similar, we'd catch more
> > > > >>>>>>>>>>>> regressions that way.  For example, in msm-next the nodebugfs build is
> > > > >>>>>>>>>>>> currently broken, because we merged drm-misc-next at a time when
> > > > >>>>>>>>>>>> komeda was broken:
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> If drm-misc was using pre-merge CI this would have been caught and the
> > > > >>>>>>>>>>>> offending patch dropped.
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> That sounds more like we should push on the drm-misc pre-merge CI boulder
> > > > >>>>>>>>>>> to move it uphill, than add even more trees to make it even harder to get
> > > > >>>>>>>>>>> there long term ...
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> Short term it helps locally to have finer trees, but only short term and
> > > > >>>>>>>>>>> only very locally.
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> The path to have fewer trees (ideally only one for all of drm) is to
> > > > >>>>>>>>>> use gitlab MRs to land everything :-)
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> drm-ci-next is only a stop-gap.. but one that we need.  The
> > > > >>>>>>>>>> ${branchname}-external-fixes trick covers _most_ cases where we need
> > > > >>>>>>>>>> unrelated patches (ie. to fix random ToT breakage outside of drm or in
> > > > >>>>>>>>>> core drm), but it doesn't help when the needed changes are yml
> > > > >>>>>>>>>> (because gitlab processes all the yml before merging the
> > > > >>>>>>>>>> -external-fixes branch).  This is where we need drm-ci-next, otherwise
> > > > >>>>>>>>>> we are having to create a separate MR which cherry-picks drm/ci
> > > > >>>>>>>>>> patches for doing the CI.  This is a rather broken process.
> > > > >>>>>>>>>
> > > > >>>>>>>>> So what I don't get is ... if we CI drm-misc, how does that not help
> > > > >>>>>>>>> improve the situation here? Step one would be post-merge (i.e. just enable
> > > > >>>>>>>>> CI in the repo), then get MRs going.
> > > > >>>>>>>>
> > > > >>>>>>>> I guess post-merge is better than nothing.. but pre-merge is better.
> > > > >>>>>>>>
> > > > >>>>>>>> post-merge can work if you have a "sheriff" system where someone
> > > > >>>>>>>> (perhaps on a rotation) is actively monitoring results and "revert and
> > > > >>>>>>>> ask questions later" when something breaks.  Pre-merge ensures the
> > > > >>>>>>>> interested party is involved in the process ;-)
> > > > >>>>>>>
> > > > >>>>>>> So ... make that happen? And it doesn't have to be for all of drm-misc,
> > > > >>>>>>> mesa after all switched over to MR also on a bit a driver/area basis. So
> > > > >>>>>>> agreeing among all drm-ci folks to use gitlab MR in drm-misc for pre-merge
> > > > >>>>>>> testing shouldn't be that hard to make happen. And unlike a separate
> > > > >>>>>>> branch it's not some kind of detour with a good chance to get stuck in a
> > > > >>>>>>> local optimum.
> > > > >>>>>>
> > > > >>>>>> Tree vs branch doesn't really have much in the way of distinction,
> > > > >>>>>> modulo gitlab permissions.  In that it doesn't do much good if drm/ci
> > > > >>>>>> patches are landing on a different branch.
> > > > >>>>>>
> > > > >>>>>> I guess what you are suggesting is that we have a single tree/branch
> > > > >>>>>> that drm/ci + drm/msm + (plus whoever else wants to get in on the
> > > > >>>>>> drm/ci, so probably at least vkms) lands patches into via gitlab MRs?
> > > > >>>>>
> > > > >>>>> This again brings a separate CI-enabled tree. I think it has been
> > > > >>>>> suggested to start with enabling DRM CI for drm-misc branches. Then we
> > > > >>>>> can possibly start landing MRs with CI testing (probably starting with
> > > > >>>>> vkms).
> > > > >>>>
> > > > >>>> It's something we've discussed with Sima for a while, but enabling CI on
> > > > >>>> drm-misc at some point will make sense so we could just as well start
> > > > >>>> now.
> > > > >>>>
> > > > >>>> The biggest unknown at the moment to start doing so is how we could keep
> > > > >>>> drm-tip and the rerere repo with MR.
> > > > >>>
> > > > >>> Let's do a slow start and begin with post-merge testing. At least this
> > > > >>> gives us an idea of how stable it is (and what does it take to keep it
> > > > >>> green). Maybe we can perform post-merge testing for both drm-misc and
> > > > >>> drm-tip.
> > > > >>
> > > > >> The one thing is that currently the runtime for igt is quite long
> > > > >> (~1hr) because you can't really parallelize kms tests.  So maybe
> > > > >> nightly scheduled runs would be a better idea.
> > > > >
> > > > > SGTM. So, the question would be, who can set it up?
> > > > >
> > > >
> > > > We will test the nightly pipelines in a forked repo and then will
> > > > set it up for drm-misc and drm-tip.
> > > >
> > >
> > > Revisiting this old thread...
> > >
> > > It's becoming increasingly clear that landing drm/ci changes via drm-misc
> > > (where gitlab CI is not used) isn't working out.
> >
> > Why?
> 
> Some of it has been breakage in drm/ci, which would have been noticed
> if drm/ci went thru CI.
> 
> And some of it is that expectation changes in other drivers when we
> backmerge drm-next/drm-misc-next aren't cared for.  So we end up not
> enforcing a green-pipeline, and just ignoring failed jobs on other
> drivers.  I guess we could just make expectation updates for other
> drivers as part of drm/msm MRs, but that feels a bit strange.
> 
> Related question, should we just smash expectation updates into the
> merge commit?  Or keep it a separate commit?  In the latter case, I
> think the expectation update commit should not need a r-b on list,
> since it is just updating expectations to the reality of changes
> merged elsewhere without a CI run.

I'd still think that it needs _some_ review. Otherwise it's easy to miss
the IGT issue. Consider the kms_invalid_mode@overflow-vrefresh on
sc7180-trogdor-kingoftown. It would be really easy to mark it and the
next failing test as 'failures', then face that some of the tests sart
being flaky or randomly failing just because they are scheduled after
the offending test.

> 
> > Also, tbf, drm-misc doesn't use gitlab CI because nobody solved the
> > drm-tip issue. And because the mail I sent 6 months ago about didn't get
> > any feedback.
> 
> If gitlab MRs were used to land changes in drm-misc, this would solve
> the problem.  I'd be happy to start landing drm/msm changes through
> that path.
> 
> But I don't think there is any good way to mix/match gitlab MRs with
> other processes (dim, or raw git) in the same tree.  We need to be
> able to enforce a green CI run to land changes.

I thought that the first step should be to enable at least daily testing
of drm-misc and drm-tip.

> 
> > > On the drm/msm side, we pretty regularly end up needing a 2nd dummy MR
> > > with additional drm/ci, etc patches on top for running our CI
> > > pipelines, which is really _not_ the way this is supposed to work.
> > >
> > > So I think we want a single tree to merge drm/ci, drm/msm, and changes for
> > > any other driver that wants to participate in the CI process.  We could
> > > call it drm-gitlab or drm-ci or whatever.  The rules would be:
> > >
> > > * _Only_ land changes via MR with passing CI pipeline.  We should configure
> > >   the gitlab tree to disallow MRs without a green pipeline.
> > >
> > > * All drm/ci changes go thru this tree.
> > >
> > > * When we need to backmerge drm-next/files or drm-misc-next/fixes, that
> > >   goes via an MR into this shared tree, just like any other change.
> > >
> > >   If there are expectation updates (tests start to fail or pass, we make
> > >   the fails/flakes/skips changes on the same MR, no questions asked.
> > >   (But would be polite to tag the associated driver maintainer on the
> > >   MR for visibility.)
> > >
> > > * Once we've done this, we could conceivable use similar file-path rules
> > >   like mesa does to only run applicable jobs.  Ie. if the MR only touches
> > >   drm/msm there is no need to run i915 CI jobs.  So we could optimize
> > >   the CI runner utilization this way.
> > >
> > > * Only ff-merges.  At least to start with it would be only driver
> > >   maintainers submitting MRs with patches collected up from list, so
> > >   it would be few enough people that this shouldn't be a problem to
> > >   coordinate.

I think this is what we already have for drm-misc.

> > >
> > > * I'd be open to the idea of allowing drm core and cross-driver changes
> > >   thru this tree.  These are especially the sorts of things that we'd
> > >   like to see have a clean CI pipeline.  But not sure how this would
> > >   conflict with drm-misc.  One possible future is that it replaces
> > >   drm-misc eventually.
> >
> > And we get back to the drm-tip discussion here. If you want to do any
> > meaningful cross-driver or core changes, you need to have an integration
> > tree like drm-tip. And if we solve that, afaict, we solve the only
> > obstacle to using gitlab ci in drm-misc so we might just take drm/msm
> > in instead.
> 
> I definitely agree about the usefulness of an integration tree.  And
> an integration tree is where CI is especially valuable.  So I'm open
> to ideas to have gitlab CI integrated in this tree.  But I don't see a
> good alternative to requiring a green CI pipeline for merging changes
> into this tree, which means using gitlab MRs.  Maybe I'm not thinking
> creatively enough here, but landing changes without a green CI run
> just means discovering unrelated breakages when the next batch of
> changes comes in via an MR.
> 
> BR,
> -R

-- 
With best wishes
Dmitry
