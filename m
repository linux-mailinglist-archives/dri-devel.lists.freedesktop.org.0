Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A73A57B6D
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 16:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26AE10E15A;
	Sat,  8 Mar 2025 15:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iKWvLh/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFA110E15A
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 15:06:10 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-855bd88ee2cso68871639f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Mar 2025 07:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741446369; x=1742051169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oHOwT3n1PCUo/y6NdHENnjQLFXdpyvoVHDUJfhV/W6g=;
 b=iKWvLh/3wcXNs/sBf2qGeQxi+OBHIzHUk1NZi3OMKLcyWMro/Hm7xuluoUDmNwYqvz
 7FBJzlKQoXnaJl8SvvB7nVXLyF9H92c07yuhon/c7JnCJaO181SDXnhzEIM7BGzZyMe2
 SeJjAtBIZfrBXKvQJzU4voMKoVxE5TadJphSDIpchyo4btzkqk0RxScHtbiBsQ2NzUNs
 lR9ug2XaZz2eJfZZm7eNWuQa55VM4nAhjbM4nqtpSJJt5bwVC5gslbjqOb9vmLKFG2SQ
 8kjYNSg4THvWAoysQoON3j5WvAEZ2xhEZepkE7Z0fBAPjaJWILFZ3gU15bOiJKZiEkWx
 U1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741446369; x=1742051169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oHOwT3n1PCUo/y6NdHENnjQLFXdpyvoVHDUJfhV/W6g=;
 b=Bo4YgoGl+RGioY8oqhpzxRJUZ9q4QcZCfrOdBKR1HcnDnNUFi/uEa6e5MAL8rTzYNP
 zGv1qtiO6zW5wlVmJFfrExa2Dnf5CW5PDE3ttMTRWOn00NDIXWyvqTaK/sP1zfJsLOwZ
 Hoyt5YBgJBgQEelf0SphFL1LuY/qUDmxwa9ydwO5B+lgW3OleCjNmYSu0VD1imKWqJna
 JnnahOZFt7XlGkm6UGUOW84cWT2ez5Cwm9s9/TDuXVkwO5Bh2PsogNQAZbjZZTtyb8lo
 s/aoS0AM2oJ4656uUyM/KMUhZ0kZLa9cKlfZsxWsVtDQyOTOSfJ0CUtsRSxnhWyOAsNF
 G7sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+JudarCmyyBoGcS5sl417ABWohg1wZuKiH5JudKxNnwmy0mAeO0qvIPXGq/TKmfwX5MuPp1JHeaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX0OxcSrEa+pwZKFVHUZWjdHJEto9dcD7G4oE6lP9tyOMTPImW
 2lEHrelkcpzS59R4S3fkx2r1R+Q4EjwPskYOaeRTn0p5KYoLF+/CSTXcfbK0HeV+ZQDYwt8IYoz
 qPEJZqmbiJB0GC4KuBoxWYMdMYj4=
X-Gm-Gg: ASbGnctPycGTJrW+88DxqzJJ+UtYFh/4IT9QOBXblJo/gi5lQ7Ib1VMvQLdi6eP+WDS
 9TjVMw9QDYu1YGYv7wjYwqYJd50k6H23mUbtNeIVokJgPRAOOkcjxNjER3+4s+DqYhRWI5oyend
 DJ65qRzFqsj0qs1PE3wYNGBlyV42y1rVFeDa5g
X-Google-Smtp-Source: AGHT+IE6rMhIOcUDTE9g+KCKbXkQJ6AA9pb8ULsdh0ph11ccSmoOt0Po2EHEXMAWJApHuVHh3LPZsU0Ywh+KmUc+5s0=
X-Received: by 2002:a92:c543:0:b0:3d4:28c0:1692 with SMTP id
 e9e14a558f8ab-3d4418d5121mr86422555ab.5.1741446368590; Sat, 08 Mar 2025
 07:06:08 -0800 (PST)
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
 <ppohyz3ibdaoifqkhgp6ym5qm33hutak54dlgfb75hpxfhepjl@2u3bf75ixyac>
In-Reply-To: <ppohyz3ibdaoifqkhgp6ym5qm33hutak54dlgfb75hpxfhepjl@2u3bf75ixyac>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 8 Mar 2025 07:05:55 -0800
X-Gm-Features: AQ5f1Jrj_V-6G_U7KJy-tuGYdT8WD6FDhEVoUWJQLBCYxxO4m6oWcI9zU4rxarU
Message-ID: <CAF6AEGsapCc2=j31=spWkcrB25+OHSq_uOne_my=mS9rbOfVuw@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@redhat.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>
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

On Fri, Mar 7, 2025 at 7:14=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Mar 07, 2025 at 09:26:54AM -0800, Rob Clark wrote:
> > On Fri, Mar 7, 2025 at 9:00=E2=80=AFAM Maxime Ripard <mripard@redhat.co=
m> wrote:
> > >
> > > On Fri, Mar 07, 2025 at 08:42:46AM -0800, Rob Clark wrote:
> > > > On Tue, Sep 24, 2024 at 5:27=E2=80=AFAM Vignesh Raman
> > > > <vignesh.raman@collabora.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
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
> >
> > Related question, should we just smash expectation updates into the
> > merge commit?  Or keep it a separate commit?  In the latter case, I
> > think the expectation update commit should not need a r-b on list,
> > since it is just updating expectations to the reality of changes
> > merged elsewhere without a CI run.
>
> I'd still think that it needs _some_ review. Otherwise it's easy to miss
> the IGT issue. Consider the kms_invalid_mode@overflow-vrefresh on
> sc7180-trogdor-kingoftown. It would be really easy to mark it and the
> next failing test as 'failures', then face that some of the tests sart
> being flaky or randomly failing just because they are scheduled after
> the offending test.

I'm only talking here about changes flowing in from
drm-next/drm-misc-next, not drm/msm or drm/ci (incl igt uprevs).

And we should still ofc notify driver maintainers.

My only point was to not block backmerging of changes that didn't go thru C=
I.

> >
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
> I thought that the first step should be to enable at least daily testing
> of drm-misc and drm-tip.

That could help, if people pay attention to it.  There has been a lot
of work from collabora on monitoring results of longer nightly jobs on
the mesa side, without something like that it is rather easy to just
not notice the nightly results.  Nightly runs and automated generation
of patches to expectation files on drm-misc/drm-tip would make things
easier for whoever ends up needing to backmerge into drm-gitlab (ie.
less manual work to update expectations).

BR,
-R

>
> >
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
>
> I think this is what we already have for drm-misc.
>
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
> >
> > BR,
> > -R
>
> --
> With best wishes
> Dmitry
