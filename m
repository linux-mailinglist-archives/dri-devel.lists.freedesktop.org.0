Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7E2A59802
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 15:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552E310E310;
	Mon, 10 Mar 2025 14:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CcWcSGC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FD110E310
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 14:45:14 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3d450154245so14258725ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741617911; x=1742222711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6I7oKc+k4ZiUEIbSRuGf136vLGNF+F3USlEahkQHs/w=;
 b=CcWcSGC4ZS3ICMWcBEqt5cseSOI1fHeNxiZySPbXpcsO77gBoPhtxASOyYbBGCcclh
 X0KpEgeQyInGF1/3etJKTw3uSeXj0lEAtl8UPWA4SHkrB2p8iOi5J/JJmBlcw2jqByo4
 afQ1RJLuotq+IWYAedZMMsGxi5m3wk5ScVw+sIwfVONBSgCtONyf1gG/kYyQr3ROv4k2
 8aU4QBj9XavIqE7Ce0qIUNqEKZ6q3EGxW8qvNBcZpjBlMZ9LGexS5nFRGAv9d4Axv5OU
 ugpCIEFTkkUZRiEg5SNfM9PwDlJEDIo8cgKY7mT4WPHHMu2Pb4myEuMouOAHTwVSJzqI
 gQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741617911; x=1742222711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6I7oKc+k4ZiUEIbSRuGf136vLGNF+F3USlEahkQHs/w=;
 b=L63Ohk15rMRYZeJDSQ8tu4/CIDy/BL6AOyirn5FkdBBfPHH0ZfG5F6uAg9lFSkuizT
 6TWMKI32JbgwdoajyFs6ZVkRJoPZ9IjG3f7xhYaCXNo3hZ8Y7R6dX5FTiNsgc9f/bPOj
 DeKigKj/aUyKwkd35pCs7Zlho5ya8joaxMQXxqsmk75NPc3F1+P6/+d6puxqMXzidtCM
 wz6FNvN1nXvHN/yUrDvnsRt4MlrZkdPZ2ExXuYPO1yL82hsGXLhOGZKh0B68PQzsanua
 opPTcLOJ4ElZfyri+hT7SdklWg314JwV3lRuNyGLLBfPbaF05WssvTdiALDnAOczXhCK
 K1nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCaPkwoQ4vftTQpzyHAi7cg7zVQ2gftzhROqCWsEWUEgGZ0aonF7Z4NqWT2f5T0lh8tbFOFxvu4EI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHYbEekvTIoJGEksRrLIUoyPIATkItpjx21Sm6tMhfwYMWkMM7
 ZW7s6hNOZ8U4vNxJ5dzdUxSgrpVGacGoALPcCzSj0lc2Qol+Fj44JVMrqvdRkRd2NT8YHYKIo5s
 OGFZtdR/juPeLQcqJ4/199XocnVI=
X-Gm-Gg: ASbGncvohzvNo2PZ3NBCTR5JJtmGY8jqgo/56LuiYKPYxa+sK7ScwZZLoTFjE5DkjS5
 VsszxOIi90Hwl6ElOa83qY0GZlQSIdtky7aKFCfEzyVkYAP6bpu9HPW+1EbvBLHojo4/WMoKdVy
 YbiA7A2w1U2/fz3V70ZHb/Lm8ZYa6jXNpQoDFQ+MfBibvdy9Y7BufnyI8E
X-Google-Smtp-Source: AGHT+IE/rBjoiyE6SeRoqWPTTu3VjsCy1zuUKVR91nIgqRe3AhzRr6YlWj+TySeV4cAJswidFBLao2rf/++4AMdtZkY=
X-Received: by 2002:a05:6e02:188b:b0:3d0:4e0c:2c96 with SMTP id
 e9e14a558f8ab-3d44187c11bmr171943325ab.2.1741617910428; Mon, 10 Mar 2025
 07:45:10 -0700 (PDT)
MIME-Version: 1.0
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
 <20250310-spicy-flawless-ermine-bfc74f@houat>
In-Reply-To: <20250310-spicy-flawless-ermine-bfc74f@houat>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 10 Mar 2025 07:44:58 -0700
X-Gm-Features: AQ5f1JrqC29TaO1LiO3Cd28UqiXDSgHgYA58NbxA0kM8SUJTJjp2h8V1Nc26XPw
Message-ID: <CAF6AEGvfjAxHGzANX8WhnfUma_aj=+tf_7KcePxUhG_8S38skQ@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Maxime Ripard <mripard@redhat.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>,
 Helen Koike <helen.koike@collabora.com>, 
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

On Mon, Mar 10, 2025 at 4:07=E2=80=AFAM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> On Fri, Mar 07, 2025 at 09:26:54AM -0800, Rob Clark wrote:
> > On Fri, Mar 7, 2025 at 9:00=E2=80=AFAM Maxime Ripard <mripard@redhat.co=
m> wrote:
> > > On Fri, Mar 07, 2025 at 08:42:46AM -0800, Rob Clark wrote:
> > > > On Tue, Sep 24, 2024 at 5:27=E2=80=AFAM Vignesh Raman
> > > > > On 12/09/24 11:18, Dmitry Baryshkov wrote:
> > > > > > On Mon, Sep 09, 2024 at 07:34:04AM GMT, Rob Clark wrote:
> > > > > >> On Mon, Sep 9, 2024 at 2:54=E2=80=AFAM Dmitry Baryshkov
> > > > > >> <dmitry.baryshkov@linaro.org> wrote:
> > > > > >>>
> > > > > >>> On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.c=
om> wrote:
> > > > > >>>>
> > > > > >>>> Hi,
> > > > > >>>>
> > > > > >>>> On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wro=
te:
> > > > > >>>>> On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com=
> wrote:
> > > > > >>>>>>
> > > > > >>>>>> On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <dani=
el.vetter@ffwll.ch> wrote:
> > > > > >>>>>>>
> > > > > >>>>>>> On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote=
:
> > > > > >>>>>>>> On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <da=
niel.vetter@ffwll.ch> wrote:
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wro=
te:
> > > > > >>>>>>>>>> On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <=
daniel.vetter@ffwll.ch> wrote:
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>>>> On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark w=
rote:
> > > > > >>>>>>>>>>>> On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vett=
er <daniel@ffwll.ch> wrote:
> > > > > >>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>> On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark=
 wrote:
> > > > > >>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Ve=
tter <daniel@ffwll.ch> wrote:
> > > > > >>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry =
Baryshkov wrote:
> > > > > >>>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel V=
etter wrote:
> > > > > >>>>>>>>>>>>>>>>> On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen=
 Koike wrote:
> > > > > >>>>>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>>>>> On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > >>>>>>>>>>>>>>>>>>> Hi,
> > > > > >>>>>>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>>>>>> On 15/03/24 22:50, Rob Clark wrote:
> > > > > >>>>>>>>>>>>>>>>>>>> Basically, I often find myself needing to me=
rge CI patches on top of
> > > > > >>>>>>>>>>>>>>>>>>>> msm-next in order to run CI, and then after =
a clean CI run, reset HEAD
> > > > > >>>>>>>>>>>>>>>>>>>> back before the merge and force-push.  Which=
 isn't really how things
> > > > > >>>>>>>>>>>>>>>>>>>> should work.
> > > > > >>>>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>>>> This sounds more like you want an integration t=
ree like drm-tip. Get msm
> > > > > >>>>>>>>>>>>>>>>> branches integrated there, done. Backmerges jus=
t for integration testing
> > > > > >>>>>>>>>>>>>>>>> are not a good idea indeed.
> > > > > >>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>> But AFAIU this doesn't help for pre-merge testing,=
 ie. prior to a
> > > > > >>>>>>>>>>>>>> patch landing in msm-next
> > > > > >>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>> My idea was to have a drm-ci-next managed similar =
to drm-misc-next, if
> > > > > >>>>>>>>>>>>>> we have needed drm/ci patches we could push them t=
o drm-ci-next, and
> > > > > >>>>>>>>>>>>>> then merge that into the driver tree (along with a=
 PR from drm-ci-next
> > > > > >>>>>>>>>>>>>> to Dave).
> > > > > >>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>> I guess I'm confused about what kind of pre-merge t=
esting we're talking
> > > > > >>>>>>>>>>>>> about then ... Or maybe this just doesn't work too =
well with the linux
> > > > > >>>>>>>>>>>>> kernel. The model is that you have some pile of tre=
es, they're split up,
> > > > > >>>>>>>>>>>>> and testing of all the trees together is done in in=
tegration trees like
> > > > > >>>>>>>>>>>>> linux-next or drm-tip.
> > > > > >>>>>>>>>>>>
> > > > > >>>>>>>>>>>> pre-merge: for msm we've been collecting up patches =
from list into a
> > > > > >>>>>>>>>>>> fast-forward MR which triggers CI before merging to =
msm-next/msm-fixes
> > > > > >>>>>>>>>>>>
> > > > > >>>>>>>>>>>> Ideally drm-misc and other trees would do similar, w=
e'd catch more
> > > > > >>>>>>>>>>>> regressions that way.  For example, in msm-next the =
nodebugfs build is
> > > > > >>>>>>>>>>>> currently broken, because we merged drm-misc-next at=
 a time when
> > > > > >>>>>>>>>>>> komeda was broken:
> > > > > >>>>>>>>>>>>
> > > > > >>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/jobs/605756=
81#L9520
> > > > > >>>>>>>>>>>>
> > > > > >>>>>>>>>>>> If drm-misc was using pre-merge CI this would have b=
een caught and the
> > > > > >>>>>>>>>>>> offending patch dropped.
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>>>> That sounds more like we should push on the drm-misc =
pre-merge CI boulder
> > > > > >>>>>>>>>>> to move it uphill, than add even more trees to make i=
t even harder to get
> > > > > >>>>>>>>>>> there long term ...
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>>>> Short term it helps locally to have finer trees, but =
only short term and
> > > > > >>>>>>>>>>> only very locally.
> > > > > >>>>>>>>>>
> > > > > >>>>>>>>>> The path to have fewer trees (ideally only one for all=
 of drm) is to
> > > > > >>>>>>>>>> use gitlab MRs to land everything :-)
> > > > > >>>>>>>>>>
> > > > > >>>>>>>>>> drm-ci-next is only a stop-gap.. but one that we need.=
  The
> > > > > >>>>>>>>>> ${branchname}-external-fixes trick covers _most_ cases=
 where we need
> > > > > >>>>>>>>>> unrelated patches (ie. to fix random ToT breakage outs=
ide of drm or in
> > > > > >>>>>>>>>> core drm), but it doesn't help when the needed changes=
 are yml
> > > > > >>>>>>>>>> (because gitlab processes all the yml before merging t=
he
> > > > > >>>>>>>>>> -external-fixes branch).  This is where we need drm-ci=
-next, otherwise
> > > > > >>>>>>>>>> we are having to create a separate MR which cherry-pic=
ks drm/ci
> > > > > >>>>>>>>>> patches for doing the CI.  This is a rather broken pro=
cess.
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> So what I don't get is ... if we CI drm-misc, how does =
that not help
> > > > > >>>>>>>>> improve the situation here? Step one would be post-merg=
e (i.e. just enable
> > > > > >>>>>>>>> CI in the repo), then get MRs going.
> > > > > >>>>>>>>
> > > > > >>>>>>>> I guess post-merge is better than nothing.. but pre-merg=
e is better.
> > > > > >>>>>>>>
> > > > > >>>>>>>> post-merge can work if you have a "sheriff" system where=
 someone
> > > > > >>>>>>>> (perhaps on a rotation) is actively monitoring results a=
nd "revert and
> > > > > >>>>>>>> ask questions later" when something breaks.  Pre-merge e=
nsures the
> > > > > >>>>>>>> interested party is involved in the process ;-)
> > > > > >>>>>>>
> > > > > >>>>>>> So ... make that happen? And it doesn't have to be for al=
l of drm-misc,
> > > > > >>>>>>> mesa after all switched over to MR also on a bit a driver=
/area basis. So
> > > > > >>>>>>> agreeing among all drm-ci folks to use gitlab MR in drm-m=
isc for pre-merge
> > > > > >>>>>>> testing shouldn't be that hard to make happen. And unlike=
 a separate
> > > > > >>>>>>> branch it's not some kind of detour with a good chance to=
 get stuck in a
> > > > > >>>>>>> local optimum.
> > > > > >>>>>>
> > > > > >>>>>> Tree vs branch doesn't really have much in the way of dist=
inction,
> > > > > >>>>>> modulo gitlab permissions.  In that it doesn't do much goo=
d if drm/ci
> > > > > >>>>>> patches are landing on a different branch.
> > > > > >>>>>>
> > > > > >>>>>> I guess what you are suggesting is that we have a single t=
ree/branch
> > > > > >>>>>> that drm/ci + drm/msm + (plus whoever else wants to get in=
 on the
> > > > > >>>>>> drm/ci, so probably at least vkms) lands patches into via =
gitlab MRs?
> > > > > >>>>>
> > > > > >>>>> This again brings a separate CI-enabled tree. I think it ha=
s been
> > > > > >>>>> suggested to start with enabling DRM CI for drm-misc branch=
es. Then we
> > > > > >>>>> can possibly start landing MRs with CI testing (probably st=
arting with
> > > > > >>>>> vkms).
> > > > > >>>>
> > > > > >>>> It's something we've discussed with Sima for a while, but en=
abling CI on
> > > > > >>>> drm-misc at some point will make sense so we could just as w=
ell start
> > > > > >>>> now.
> > > > > >>>>
> > > > > >>>> The biggest unknown at the moment to start doing so is how w=
e could keep
> > > > > >>>> drm-tip and the rerere repo with MR.
> > > > > >>>
> > > > > >>> Let's do a slow start and begin with post-merge testing. At l=
east this
> > > > > >>> gives us an idea of how stable it is (and what does it take t=
o keep it
> > > > > >>> green). Maybe we can perform post-merge testing for both drm-=
misc and
> > > > > >>> drm-tip.
> > > > > >>
> > > > > >> The one thing is that currently the runtime for igt is quite l=
ong
> > > > > >> (~1hr) because you can't really parallelize kms tests.  So may=
be
> > > > > >> nightly scheduled runs would be a better idea.
> > > > > >
> > > > > > SGTM. So, the question would be, who can set it up?
> > > > > >
> > > > >
> > > > > We will test the nightly pipelines in a forked repo and then will
> > > > > set it up for drm-misc and drm-tip.
> > > > >
> > > >
> > > > Revisiting this old thread...
> > > >
> > > > It's becoming increasingly clear that landing drm/ci changes via dr=
m-misc
> > > > (where gitlab CI is not used) isn't working out.
> > >
> > > Why?
> >
> > Some of it has been breakage in drm/ci, which would have been noticed
> > if drm/ci went thru CI.
> >
> > And some of it is that expectation changes in other drivers when we
> > backmerge drm-next/drm-misc-next aren't cared for.  So we end up not
> > enforcing a green-pipeline, and just ignoring failed jobs on other
> > drivers.  I guess we could just make expectation updates for other
> > drivers as part of drm/msm MRs, but that feels a bit strange.
>
> Yeah, ok, I can see how that can happen and how it can be frustrating :)
>
> > Related question, should we just smash expectation updates into the
> > merge commit?  Or keep it a separate commit?  In the latter case, I
> > think the expectation update commit should not need a r-b on list,
> > since it is just updating expectations to the reality of changes
> > merged elsewhere without a CI run.
>
> My gut feeling is that we should review that change still, because
> people will mess the expectations up just to get that green light. But
> both suck, really, so I'm not really sure.

Either way I'd want to notify maintainers of the respective drivers.
If we need to add a new expected fail, due to a backmerge, the change
that caused the failure has already been merged.  The expectations
update is just to reflect reality, so not really much to review.

And I should mention, at this point I'm not proposing opening up MRs
to _everyone_, just to driver maintainers of whichever drivers want
to participate.

> > > Also, tbf, drm-misc doesn't use gitlab CI because nobody solved the
> > > drm-tip issue. And because the mail I sent 6 months ago about didn't =
get
> > > any feedback.
> >
> > If gitlab MRs were used to land changes in drm-misc, this would solve
> > the problem.  I'd be happy to start landing drm/msm changes through
> > that path.
> >
> > But I don't think there is any good way to mix/match gitlab MRs with
> > other processes (dim, or raw git) in the same tree.  We need to be
> > able to enforce a green CI run to land changes.
>
> So, I agree, and it's been the intent to make drm-misc this since even
> before we moved to Gitlab.
>
> But there's different things to consider:
>
> - We frequently enough merge patches affecting other subsystems that
>   will need to be notified, and will need to review our work. Just
>   saying that a random maintainer that gets 2 MR each year from us
>   should watch our Gitlab frequently doesn't work. So, how do we solve
>   that? Do we take it to the ML, and once we get their AB, we merge it
>   through a MR?
>
> - The kernel kind of mandates of maintainers / committers to put their
>   Signed-off-by, how do we automate that in Gitlab?
>
> - Similarly, Linus *really* likes signed PRs, how do we make one
>   switching to Gitlab?
>
> - Do we require people to still use dim, or do we just drop dim?
>
> - Do we have enough runners to begin with?
>
> - And the final one that really stinks: how do we make sure we send the
>   right branches to linux-next?
>
> So far, nobody really decided or solved those things. And we would have
> to solve this (except for dim) for the tree you're suggesting, because
> most of it really is about dealing with the impedance mismatch with the
> rest of the kernel.

What we've been doing with drm/msm (since v5.18) is pretty transparent
to patch submitters and PR consumers:

1) Patches sent to list and reviewed on list

2) Driver maintainers (Dmitry, Abhinav, and myself) take turns
   collecting up reviewed patches from list into an MR

3) The gitlab tree is set to only allow ff merges, which sidesteps
   the signoff/etc issues.  It would be nice if gitlab (or margebot?
   Or something?) could apply the s-o-b's, etc.  We'd need that if
   we wanted to open things up for submitters to send MRs directly.

4) Gitlab CI runs on the MR..  so in addition to ad-hoc local testing,
   we have on-device igt runs, a variety of build tests, etc.  (I'd
   like to get to having deqp runs with a known good mesa, but we
   aren't there yet.)

   This part is still a bit messy because we frequently have to pull
   in drm/ci fixes, etc.  Which is what I'd like to fix by having a
   drm-gitlab tree which is used for drm/ci and drm/msm patches (and
   open for other drivers to join in).

   We do have an ${target_branch}-external fixes mechanism which we
   can use for required fixes that would land via some other tree,
   in case (for ex) one of the CI boards doesn't boot properly without
   some fix in another subsystem.  But this has the limitation that
   it can't deal with yaml changes, since the branch is merged in the
   build job, after gitlab has already slurped in all the .yml

5) PRs sent to Dave and Sima are tagged and sent as normal.  It isn't
   automated (yet), but the PR notes are collected up from however
   many MRs were merged.  (Typically one or two for display side
   changes from Dmitry/Abhinav and maybe one or two for GEM/GPU/etc
   from myself.)

You can sum all that up as just inserting an MR step into the process.
Ie. rather than push directly to msm-next, I push to msm-next-robclark.
Which then gets merged thru gitlab after a CI run.

It might be possible to implement a similar thing with dim, ie. the
drm-misc maintainers push to drm-misc-next-staging which gets merged
into drm-misc-next after an MR pipeline?

> We talked about it some time ago with Dave, and we concluded that the
> best course of action was to create a few actions for DRM to run when we
> send PR (like a build test and kunit run), and then expand and figure
> things out as we use it more and more.

Build test and kunit can accomplish _some_ things.. but kunit in
particular can only test the hw you have.  But gitlab CI can leverage
the CI farm we already have in place for mesa, and run on-device CI
across a range of DUTs.  I don't see how you can replicate that any
other way.

(Not to mention the side benefits of having a record of test runs and
artifacts.)

BR,
-R

> And that would mean doing a transition phase.
>
> > > > On the drm/msm side, we pretty regularly end up needing a 2nd dummy=
 MR
> > > > with additional drm/ci, etc patches on top for running our CI
> > > > pipelines, which is really _not_ the way this is supposed to work.
> > > >
> > > > So I think we want a single tree to merge drm/ci, drm/msm, and chan=
ges for
> > > > any other driver that wants to participate in the CI process.  We c=
ould
> > > > call it drm-gitlab or drm-ci or whatever.  The rules would be:
> > > >
> > > > * _Only_ land changes via MR with passing CI pipeline.  We should c=
onfigure
> > > >   the gitlab tree to disallow MRs without a green pipeline.
> > > >
> > > > * All drm/ci changes go thru this tree.
> > > >
> > > > * When we need to backmerge drm-next/files or drm-misc-next/fixes, =
that
> > > >   goes via an MR into this shared tree, just like any other change.
> > > >
> > > >   If there are expectation updates (tests start to fail or pass, we=
 make
> > > >   the fails/flakes/skips changes on the same MR, no questions asked=
.
> > > >   (But would be polite to tag the associated driver maintainer on t=
he
> > > >   MR for visibility.)
> > > >
> > > > * Once we've done this, we could conceivable use similar file-path =
rules
> > > >   like mesa does to only run applicable jobs.  Ie. if the MR only t=
ouches
> > > >   drm/msm there is no need to run i915 CI jobs.  So we could optimi=
ze
> > > >   the CI runner utilization this way.
> > > >
> > > > * Only ff-merges.  At least to start with it would be only driver
> > > >   maintainers submitting MRs with patches collected up from list, s=
o
> > > >   it would be few enough people that this shouldn't be a problem to
> > > >   coordinate.
> > > >
> > > > * I'd be open to the idea of allowing drm core and cross-driver cha=
nges
> > > >   thru this tree.  These are especially the sorts of things that we=
'd
> > > >   like to see have a clean CI pipeline.  But not sure how this woul=
d
> > > >   conflict with drm-misc.  One possible future is that it replaces
> > > >   drm-misc eventually.
> > >
> > > And we get back to the drm-tip discussion here. If you want to do any
> > > meaningful cross-driver or core changes, you need to have an integrat=
ion
> > > tree like drm-tip. And if we solve that, afaict, we solve the only
> > > obstacle to using gitlab ci in drm-misc so we might just take drm/msm
> > > in instead.
> >
> > I definitely agree about the usefulness of an integration tree.  And
> > an integration tree is where CI is especially valuable.  So I'm open
> > to ideas to have gitlab CI integrated in this tree.  But I don't see a
> > good alternative to requiring a green CI pipeline for merging changes
> > into this tree, which means using gitlab MRs.  Maybe I'm not thinking
> > creatively enough here, but landing changes without a green CI run
> > just means discovering unrelated breakages when the next batch of
> > changes comes in via an MR.
>
> To a large extent, that pain is here because msm is an early adopter.
> It's up to you to decide whether the trade-off is worthy, but forcing it
> down to everybody without address what prevents everybody else from
> switching doesn't really work.
>
> It worked for you, with a smaller set of constraints, but we just can't
> get rid of them.
>
> Maxime
