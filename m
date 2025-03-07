Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558FA56E1A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5E510E17F;
	Fri,  7 Mar 2025 16:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Aoq3GPZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B42010E17F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:43:01 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3cfcf8b7455so22648465ab.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365779; x=1741970579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h94f/qdAqoc2HKX1xn98QYQVLTcTMlfdLXLxXmfGA8o=;
 b=Aoq3GPZW9MQGLOjYA+b2P6WD9xPL0mutRSX9zOGTEVvjMkwCaW5CbRjVRQPRCIj/RF
 NIZYl0AUyhtN3xaF7Wc9zmqvKmVHBIS8gyPgG6llHCt+XPTmAB0xE8o9S59guzdZ1qbV
 Z1chgE/3IvHLfSEF4W+r6Avu8rIR5KPG6Wsvm3DpsTiEt3jBaAfarJiUOIE0yJBT2cAO
 5PnZZ8DPbnO1Xnqu0wSqZy0SyflHoNc3cRwIewdk0N4fKED+NAxri0pPJsGqoCw2IAQN
 XPfjZebAzmgYCcZ/+wgVxZs3+p5+DtG4OUaGgWkfSj2umtrC97wj7il2a6mGF1UGtQ9c
 hKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365779; x=1741970579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h94f/qdAqoc2HKX1xn98QYQVLTcTMlfdLXLxXmfGA8o=;
 b=fhuq84o4jy91gsWQ9xXolr+pGykuqNazwwlS8tk3F54b1JUf5kBA1itwyECGxCBEsh
 JcYmPmtwSVNUR66vpIkl6ZQiKQuzNGfzCJ/Dclu7gmUDS3Q9eXOkPXgBw+1lynBjjlwF
 8UxvqErhGUH2HKaJn+UBgVleBTSwLEyWI7/ZypZcWuHIek6pNpG6HiTF3UQuXtfxAR+2
 EMjOzwQcCLwYT4jvoRDjAXai0W6UTdaa1U4bcz4oktiUzqD9HcaE9kfpmvV5cma5RW8R
 a+dcXlgVJLTIyF9/Sk5bWay51W3rrvBEVuB4iFQm6adhm7wCBd7NHBNrJfw2ONYL2j4L
 PLBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXevZdeQdB+2mH0YphlMFgrt7af1vT9di9cOTZpN5RjbayCOBfC27k6DEdhAGKnDBsb3cKV6ANVHa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwME6p9acE8KWEGXO4EayMgcyFvk7411gEdV7mO2FGIhrwFPVsr
 BQ9r6o7vNSR6Xrr4YMj1WdE2mWvXDaDG1DOkK0hLb3y8TzRZrJ0vX7tpvbFV+9aCXKgsVYTqVfH
 gQL6Do9xmvOdP+fV0ukS6QIYNSmFl7Lir
X-Gm-Gg: ASbGncu75IL5CcWXf4b2QRYoCnqbX9IzXmNuI2Sir4wglAAJmWxR3cam9rCSMo1y0U3
 D3jOkVKbty6ZPeS/1Ea7T69kcU9o9wcW+TH+aAYuRZJncgWM6Uv/BtMlawAeWGbLzq08OUT8zIs
 JhCEcxb3Kbt06tGiFU4aS78P8hNw==
X-Google-Smtp-Source: AGHT+IHYyM6Egzvko1rtQYIbezOvC8zMMm8TQk9IKtGL5oAqoSnu6R46JtsBFyATqPAVQJonpJ8byqtn40+NgN96Aro=
X-Received: by 2002:a92:ca4c:0:b0:3d0:405d:e94f with SMTP id
 e9e14a558f8ab-3d441943a25mr46489035ab.17.1741365779145; Fri, 07 Mar 2025
 08:42:59 -0800 (PST)
MIME-Version: 1.0
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
 <qs72n3l6l63er3d5lrxoravqbjrjllscnyhs7crb6anabvaez4@4hathpqkwnnd>
 <67c8cf4c-f224-4c24-96b2-92aaa3224321@collabora.com>
In-Reply-To: <67c8cf4c-f224-4c24-96b2-92aaa3224321@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Mar 2025 08:42:46 -0800
X-Gm-Features: AQ5f1JoA2304_Sb7uGkjE0Xd8A-8X3EFm7G_wTuTvfnj9aqRjlu0tIEN3u79pCg
Message-ID: <CAF6AEGvDc7RfZ2Y4B2oBag=MaAuUTJxjMwvD0yieA6qb42QMVQ@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Maxime Ripard <mripard@redhat.com>, Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, 
 Rob Clark <robdclark@chromium.org>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 24, 2024 at 5:27=E2=80=AFAM Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> Hi,
>
> On 12/09/24 11:18, Dmitry Baryshkov wrote:
> > On Mon, Sep 09, 2024 at 07:34:04AM GMT, Rob Clark wrote:
> >> On Mon, Sep 9, 2024 at 2:54=E2=80=AFAM Dmitry Baryshkov
> >> <dmitry.baryshkov@linaro.org> wrote:
> >>>
> >>> On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.com> wrot=
e:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> >>>>> On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wrote:
> >>>>>>
> >>>>>> On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel.vette=
r@ffwll.ch> wrote:
> >>>>>>>
> >>>>>>> On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> >>>>>>>> On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <daniel.vet=
ter@ffwll.ch> wrote:
> >>>>>>>>>
> >>>>>>>>> On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> >>>>>>>>>> On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <daniel.v=
etter@ffwll.ch> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> >>>>>>>>>>>> On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <dani=
el@ffwll.ch> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> >>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter <da=
niel@ffwll.ch> wrote:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshko=
v wrote:
> >>>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wr=
ote:
> >>>>>>>>>>>>>>>>> On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike w=
rote:
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> On 24/06/2024 02:34, Vignesh Raman wrote:
> >>>>>>>>>>>>>>>>>>> Hi,
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> On 15/03/24 22:50, Rob Clark wrote:
> >>>>>>>>>>>>>>>>>>>> Basically, I often find myself needing to merge CI p=
atches on top of
> >>>>>>>>>>>>>>>>>>>> msm-next in order to run CI, and then after a clean =
CI run, reset HEAD
> >>>>>>>>>>>>>>>>>>>> back before the merge and force-push.  Which isn't r=
eally how things
> >>>>>>>>>>>>>>>>>>>> should work.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> This sounds more like you want an integration tree like=
 drm-tip. Get msm
> >>>>>>>>>>>>>>>>> branches integrated there, done. Backmerges just for in=
tegration testing
> >>>>>>>>>>>>>>>>> are not a good idea indeed.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> But AFAIU this doesn't help for pre-merge testing, ie. pri=
or to a
> >>>>>>>>>>>>>> patch landing in msm-next
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> My idea was to have a drm-ci-next managed similar to drm-m=
isc-next, if
> >>>>>>>>>>>>>> we have needed drm/ci patches we could push them to drm-ci=
-next, and
> >>>>>>>>>>>>>> then merge that into the driver tree (along with a PR from=
 drm-ci-next
> >>>>>>>>>>>>>> to Dave).
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I guess I'm confused about what kind of pre-merge testing w=
e're talking
> >>>>>>>>>>>>> about then ... Or maybe this just doesn't work too well wit=
h the linux
> >>>>>>>>>>>>> kernel. The model is that you have some pile of trees, they=
're split up,
> >>>>>>>>>>>>> and testing of all the trees together is done in integratio=
n trees like
> >>>>>>>>>>>>> linux-next or drm-tip.
> >>>>>>>>>>>>
> >>>>>>>>>>>> pre-merge: for msm we've been collecting up patches from lis=
t into a
> >>>>>>>>>>>> fast-forward MR which triggers CI before merging to msm-next=
/msm-fixes
> >>>>>>>>>>>>
> >>>>>>>>>>>> Ideally drm-misc and other trees would do similar, we'd catc=
h more
> >>>>>>>>>>>> regressions that way.  For example, in msm-next the nodebugf=
s build is
> >>>>>>>>>>>> currently broken, because we merged drm-misc-next at a time =
when
> >>>>>>>>>>>> komeda was broken:
> >>>>>>>>>>>>
> >>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> >>>>>>>>>>>>
> >>>>>>>>>>>> If drm-misc was using pre-merge CI this would have been caug=
ht and the
> >>>>>>>>>>>> offending patch dropped.
> >>>>>>>>>>>
> >>>>>>>>>>> That sounds more like we should push on the drm-misc pre-merg=
e CI boulder
> >>>>>>>>>>> to move it uphill, than add even more trees to make it even h=
arder to get
> >>>>>>>>>>> there long term ...
> >>>>>>>>>>>
> >>>>>>>>>>> Short term it helps locally to have finer trees, but only sho=
rt term and
> >>>>>>>>>>> only very locally.
> >>>>>>>>>>
> >>>>>>>>>> The path to have fewer trees (ideally only one for all of drm)=
 is to
> >>>>>>>>>> use gitlab MRs to land everything :-)
> >>>>>>>>>>
> >>>>>>>>>> drm-ci-next is only a stop-gap.. but one that we need.  The
> >>>>>>>>>> ${branchname}-external-fixes trick covers _most_ cases where w=
e need
> >>>>>>>>>> unrelated patches (ie. to fix random ToT breakage outside of d=
rm or in
> >>>>>>>>>> core drm), but it doesn't help when the needed changes are yml
> >>>>>>>>>> (because gitlab processes all the yml before merging the
> >>>>>>>>>> -external-fixes branch).  This is where we need drm-ci-next, o=
therwise
> >>>>>>>>>> we are having to create a separate MR which cherry-picks drm/c=
i
> >>>>>>>>>> patches for doing the CI.  This is a rather broken process.
> >>>>>>>>>
> >>>>>>>>> So what I don't get is ... if we CI drm-misc, how does that not=
 help
> >>>>>>>>> improve the situation here? Step one would be post-merge (i.e. =
just enable
> >>>>>>>>> CI in the repo), then get MRs going.
> >>>>>>>>
> >>>>>>>> I guess post-merge is better than nothing.. but pre-merge is bet=
ter.
> >>>>>>>>
> >>>>>>>> post-merge can work if you have a "sheriff" system where someone
> >>>>>>>> (perhaps on a rotation) is actively monitoring results and "reve=
rt and
> >>>>>>>> ask questions later" when something breaks.  Pre-merge ensures t=
he
> >>>>>>>> interested party is involved in the process ;-)
> >>>>>>>
> >>>>>>> So ... make that happen? And it doesn't have to be for all of drm=
-misc,
> >>>>>>> mesa after all switched over to MR also on a bit a driver/area ba=
sis. So
> >>>>>>> agreeing among all drm-ci folks to use gitlab MR in drm-misc for =
pre-merge
> >>>>>>> testing shouldn't be that hard to make happen. And unlike a separ=
ate
> >>>>>>> branch it's not some kind of detour with a good chance to get stu=
ck in a
> >>>>>>> local optimum.
> >>>>>>
> >>>>>> Tree vs branch doesn't really have much in the way of distinction,
> >>>>>> modulo gitlab permissions.  In that it doesn't do much good if drm=
/ci
> >>>>>> patches are landing on a different branch.
> >>>>>>
> >>>>>> I guess what you are suggesting is that we have a single tree/bran=
ch
> >>>>>> that drm/ci + drm/msm + (plus whoever else wants to get in on the
> >>>>>> drm/ci, so probably at least vkms) lands patches into via gitlab M=
Rs?
> >>>>>
> >>>>> This again brings a separate CI-enabled tree. I think it has been
> >>>>> suggested to start with enabling DRM CI for drm-misc branches. Then=
 we
> >>>>> can possibly start landing MRs with CI testing (probably starting w=
ith
> >>>>> vkms).
> >>>>
> >>>> It's something we've discussed with Sima for a while, but enabling C=
I on
> >>>> drm-misc at some point will make sense so we could just as well star=
t
> >>>> now.
> >>>>
> >>>> The biggest unknown at the moment to start doing so is how we could =
keep
> >>>> drm-tip and the rerere repo with MR.
> >>>
> >>> Let's do a slow start and begin with post-merge testing. At least thi=
s
> >>> gives us an idea of how stable it is (and what does it take to keep i=
t
> >>> green). Maybe we can perform post-merge testing for both drm-misc and
> >>> drm-tip.
> >>
> >> The one thing is that currently the runtime for igt is quite long
> >> (~1hr) because you can't really parallelize kms tests.  So maybe
> >> nightly scheduled runs would be a better idea.
> >
> > SGTM. So, the question would be, who can set it up?
> >
>
> We will test the nightly pipelines in a forked repo and then will
> set it up for drm-misc and drm-tip.
>

Revisiting this old thread...

It's becoming increasingly clear that landing drm/ci changes via drm-misc
(where gitlab CI is not used) isn't working out.  On the drm/msm side, we
pretty regularly end up needing a 2nd dummy MR with additional drm/ci, etc
patches on top for running our CI pipelines, which is really _not_ the way
this is supposed to work.

So I think we want a single tree to merge drm/ci, drm/msm, and changes for
any other driver that wants to participate in the CI process.  We could
call it drm-gitlab or drm-ci or whatever.  The rules would be:

* _Only_ land changes via MR with passing CI pipeline.  We should configure
  the gitlab tree to disallow MRs without a green pipeline.

* All drm/ci changes go thru this tree.

* When we need to backmerge drm-next/files or drm-misc-next/fixes, that
  goes via an MR into this shared tree, just like any other change.

  If there are expectation updates (tests start to fail or pass, we make
  the fails/flakes/skips changes on the same MR, no questions asked.
  (But would be polite to tag the associated driver maintainer on the
  MR for visibility.)

* Once we've done this, we could conceivable use similar file-path rules
  like mesa does to only run applicable jobs.  Ie. if the MR only touches
  drm/msm there is no need to run i915 CI jobs.  So we could optimize
  the CI runner utilization this way.

* Only ff-merges.  At least to start with it would be only driver
  maintainers submitting MRs with patches collected up from list, so
  it would be few enough people that this shouldn't be a problem to
  coordinate.

* I'd be open to the idea of allowing drm core and cross-driver changes
  thru this tree.  These are especially the sorts of things that we'd
  like to see have a clean CI pipeline.  But not sure how this would
  conflict with drm-misc.  One possible future is that it replaces
  drm-misc eventually.

* We would alternate amongst the maintainers using this tree about who
  tags and sends the PRs to Dave and Sima.

Thoughts?

BR,
-R
