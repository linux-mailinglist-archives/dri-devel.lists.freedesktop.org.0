Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD6971CAD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 16:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A9810E10D;
	Mon,  9 Sep 2024 14:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IJ2taYqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969F910E10D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 14:34:19 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3a018296fffso15280925ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 07:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725892459; x=1726497259; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yalQ0PqAoEpQ+0mxi6q4Zu3SSW0r6fWcxEYqzEdiBY=;
 b=IJ2taYqr+kSgTevkUitGT0f5cM+y0owPFgQDmxkT2paivyfQdFiOELQN/O8tObwl6N
 pYbfopioZ/SPFVYu5D6BeBtQfg67cYRpVyEtcsgDUtEZDZNrRi/Xk3gpOu71LU7V8Heo
 +uk706rUUe+ka5uxZgfq2M052WWWRWZwizsIfEi05aJuh+5iHDEsuBzvbEGsvz3B1RyA
 XuRiDy9iNFSkV+P/VNJ2CnkW0JSVQIIthuHUQ85ybxyWTarx+D/pcLDJHgreYnL2wyKL
 UTXC8URMMo4hdWMsWaEPmQhEvA7DYNWWQaKrv0uvODA2d7AYWYbBhgh9Z4ZRNB1ovo+6
 CAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725892459; x=1726497259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1yalQ0PqAoEpQ+0mxi6q4Zu3SSW0r6fWcxEYqzEdiBY=;
 b=QVEOVWhYA2CFx7gDJFghZdLg4NUNXhiqaXl/oJsnrcat9ETX4tlHkR103uZXQDSXci
 miXcismuzYYuuESFYpY0ZtAcgYONBYlwdwoiS2hIUZ2VSjoM31qJ1qvh3bu5myyVO41K
 7V3rWTMM9wI6aub7NXFG2BWcAsTaCp5otedSL9GAH1VR8w4AFuyEeSBbu5GuHWeMXD1p
 WfM3LtkU0bP05fYwb5Ktpjr/8U0O0vj+WlnxBfL+NsQMNe6WNxAMvLEqX8aKf9gWJRnH
 B/e9xwuvdPGtZ3nkwEnIeSITvdxkRVkCEmg+kFQBal1/0DSwryq9segV4wTNcU/pircZ
 bt0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Og3P912wNmKBFatL2D3hm98nGTSRZa42EjH4scPaqP4827BIH1y0NySk1omHen4hKuaX3uGEuP0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjgxGK3hYSHrFO8fcVRg5/vG3/fyvKARoenVI4A/Tpzs7WrUDq
 El99IgEHbulUnQfBc0fbrqMLfByk5uGAYvNWIuvHA/BJlc991rHtVLb15ydiEgxabL6HFyYx6zK
 tJ5otnCDzw/k99jMN+VmxIKuqQYY=
X-Google-Smtp-Source: AGHT+IFBQdvcvKf3ouDXUIT4AyxgVHQSjnjakGcNquoK+Hpgd855BZSPSjrjxrspmJdDHl5O2911+JiC1M8uihdgR9s=
X-Received: by 2002:a05:6e02:194e:b0:3a0:4355:11f7 with SMTP id
 e9e14a558f8ab-3a0576adeddmr70214565ab.17.1725892458629; Mon, 09 Sep 2024
 07:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
 <Zn72laHlmWW3So9f@phenom.ffwll.local>
 <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
 <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
 <CAF6AEGtCEbhBo2CXLQymf2g5RogtdYv2LLXUNQO7Tvuw7x6ujA@mail.gmail.com>
 <ZofMlSIjFV9iGZNM@phenom.ffwll.local>
 <CAF6AEGvDFLBC6BWUdC6L1czn044EuTerPWqLib5hhRVkZyEpig@mail.gmail.com>
 <Zouo16MCRRCNyYAs@phenom.ffwll.local>
 <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
 <CAA8EJppyM_-5fBL6VFp+kxyg36LAbjxqUgA+ico9LBuJvaahxQ@mail.gmail.com>
 <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
 <CAA8EJpoe=Ei7fjZNd24OCVrapt5Y13ZFk8mheqPOy2FBF1a43Q@mail.gmail.com>
In-Reply-To: <CAA8EJpoe=Ei7fjZNd24OCVrapt5Y13ZFk8mheqPOy2FBF1a43Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Sep 2024 07:34:04 -0700
Message-ID: <CAF6AEGub4O86pRM6iM5xaDKVrR57D=OCm00ifFksG1LT9a4+og@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>
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

On Mon, Sep 9, 2024 at 2:54=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.com> wrote:
> >
> > Hi,
> >
> > On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> > > On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel.vetter=
@ffwll.ch> wrote:
> > > > >
> > > > > On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > > > > > On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <daniel.ve=
tter@ffwll.ch> wrote:
> > > > > > >
> > > > > > > On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > > > > > > On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <danie=
l.vetter@ffwll.ch> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote=
:
> > > > > > > > > > On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter =
<daniel@ffwll.ch> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark w=
rote:
> > > > > > > > > > > > On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vet=
ter <daniel@ffwll.ch> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry =
Baryshkov wrote:
> > > > > > > > > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel =
Vetter wrote:
> > > > > > > > > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Hel=
en Koike wrote:
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > > > > > > > > Basically, I often find myself needing =
to merge CI patches on top of
> > > > > > > > > > > > > > > > > > msm-next in order to run CI, and then a=
fter a clean CI run, reset HEAD
> > > > > > > > > > > > > > > > > > back before the merge and force-push.  =
Which isn't really how things
> > > > > > > > > > > > > > > > > > should work.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > This sounds more like you want an integration=
 tree like drm-tip. Get msm
> > > > > > > > > > > > > > > branches integrated there, done. Backmerges j=
ust for integration testing
> > > > > > > > > > > > > > > are not a good idea indeed.
> > > > > > > > > > > >
> > > > > > > > > > > > But AFAIU this doesn't help for pre-merge testing, =
ie. prior to a
> > > > > > > > > > > > patch landing in msm-next
> > > > > > > > > > > >
> > > > > > > > > > > > My idea was to have a drm-ci-next managed similar t=
o drm-misc-next, if
> > > > > > > > > > > > we have needed drm/ci patches we could push them to=
 drm-ci-next, and
> > > > > > > > > > > > then merge that into the driver tree (along with a =
PR from drm-ci-next
> > > > > > > > > > > > to Dave).
> > > > > > > > > > >
> > > > > > > > > > > I guess I'm confused about what kind of pre-merge tes=
ting we're talking
> > > > > > > > > > > about then ... Or maybe this just doesn't work too we=
ll with the linux
> > > > > > > > > > > kernel. The model is that you have some pile of trees=
, they're split up,
> > > > > > > > > > > and testing of all the trees together is done in inte=
gration trees like
> > > > > > > > > > > linux-next or drm-tip.
> > > > > > > > > >
> > > > > > > > > > pre-merge: for msm we've been collecting up patches fro=
m list into a
> > > > > > > > > > fast-forward MR which triggers CI before merging to msm=
-next/msm-fixes
> > > > > > > > > >
> > > > > > > > > > Ideally drm-misc and other trees would do similar, we'd=
 catch more
> > > > > > > > > > regressions that way.  For example, in msm-next the nod=
ebugfs build is
> > > > > > > > > > currently broken, because we merged drm-misc-next at a =
time when
> > > > > > > > > > komeda was broken:
> > > > > > > > > >
> > > > > > > > > > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#=
L9520
> > > > > > > > > >
> > > > > > > > > > If drm-misc was using pre-merge CI this would have been=
 caught and the
> > > > > > > > > > offending patch dropped.
> > > > > > > > >
> > > > > > > > > That sounds more like we should push on the drm-misc pre-=
merge CI boulder
> > > > > > > > > to move it uphill, than add even more trees to make it ev=
en harder to get
> > > > > > > > > there long term ...
> > > > > > > > >
> > > > > > > > > Short term it helps locally to have finer trees, but only=
 short term and
> > > > > > > > > only very locally.
> > > > > > > >
> > > > > > > > The path to have fewer trees (ideally only one for all of d=
rm) is to
> > > > > > > > use gitlab MRs to land everything :-)
> > > > > > > >
> > > > > > > > drm-ci-next is only a stop-gap.. but one that we need.  The
> > > > > > > > ${branchname}-external-fixes trick covers _most_ cases wher=
e we need
> > > > > > > > unrelated patches (ie. to fix random ToT breakage outside o=
f drm or in
> > > > > > > > core drm), but it doesn't help when the needed changes are =
yml
> > > > > > > > (because gitlab processes all the yml before merging the
> > > > > > > > -external-fixes branch).  This is where we need drm-ci-next=
, otherwise
> > > > > > > > we are having to create a separate MR which cherry-picks dr=
m/ci
> > > > > > > > patches for doing the CI.  This is a rather broken process.
> > > > > > >
> > > > > > > So what I don't get is ... if we CI drm-misc, how does that n=
ot help
> > > > > > > improve the situation here? Step one would be post-merge (i.e=
. just enable
> > > > > > > CI in the repo), then get MRs going.
> > > > > >
> > > > > > I guess post-merge is better than nothing.. but pre-merge is be=
tter.
> > > > > >
> > > > > > post-merge can work if you have a "sheriff" system where someon=
e
> > > > > > (perhaps on a rotation) is actively monitoring results and "rev=
ert and
> > > > > > ask questions later" when something breaks.  Pre-merge ensures =
the
> > > > > > interested party is involved in the process ;-)
> > > > >
> > > > > So ... make that happen? And it doesn't have to be for all of drm=
-misc,
> > > > > mesa after all switched over to MR also on a bit a driver/area ba=
sis. So
> > > > > agreeing among all drm-ci folks to use gitlab MR in drm-misc for =
pre-merge
> > > > > testing shouldn't be that hard to make happen. And unlike a separ=
ate
> > > > > branch it's not some kind of detour with a good chance to get stu=
ck in a
> > > > > local optimum.
> > > >
> > > > Tree vs branch doesn't really have much in the way of distinction,
> > > > modulo gitlab permissions.  In that it doesn't do much good if drm/=
ci
> > > > patches are landing on a different branch.
> > > >
> > > > I guess what you are suggesting is that we have a single tree/branc=
h
> > > > that drm/ci + drm/msm + (plus whoever else wants to get in on the
> > > > drm/ci, so probably at least vkms) lands patches into via gitlab MR=
s?
> > >
> > > This again brings a separate CI-enabled tree. I think it has been
> > > suggested to start with enabling DRM CI for drm-misc branches. Then w=
e
> > > can possibly start landing MRs with CI testing (probably starting wit=
h
> > > vkms).
> >
> > It's something we've discussed with Sima for a while, but enabling CI o=
n
> > drm-misc at some point will make sense so we could just as well start
> > now.
> >
> > The biggest unknown at the moment to start doing so is how we could kee=
p
> > drm-tip and the rerere repo with MR.
>
> Let's do a slow start and begin with post-merge testing. At least this
> gives us an idea of how stable it is (and what does it take to keep it
> green). Maybe we can perform post-merge testing for both drm-misc and
> drm-tip.

The one thing is that currently the runtime for igt is quite long
(~1hr) because you can't really parallelize kms tests.  So maybe
nightly scheduled runs would be a better idea.

BR,
-R

>
> --
> With best wishes
> Dmitry
