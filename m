Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA8B92A90A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 20:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C72510E3C9;
	Mon,  8 Jul 2024 18:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2HxZe0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FCA10E3C9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 18:39:01 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso5058877a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 11:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720463939; x=1721068739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PAih6j5ihNGVUjJQt6fHiMuGB9TgkvdVd2zf85IhhMY=;
 b=f2HxZe0IBmXJVY2PSP3MZKLSfW3QrzHrmeGbi/NSFyL0pOuxE/kfLUgfIBM1jnf0ts
 FmNmX55g4YWbL1Gj0iiHDJcOCfij8dEABDm6CYSu76fcLXFiqNp/eua/2b16OC+j/In3
 iS9dQElHTBe22LliHegsxdhhlSN23WEFrgAz191j3iZqb7RnIYDidAsx/jYBfuQXwMQo
 99L/DUa3f18c/9r+69eqz61Rt7G0jqaGpn4kRa6wWT1qKYlAM0Aa/jVerKxMAh9a85la
 0sk1MUG3D6+zILkqPAQEN/Hoy3n2qyixSraXEketqiAfYE40wbTpJJbFPPnZZROU4Z/C
 Zf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720463939; x=1721068739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAih6j5ihNGVUjJQt6fHiMuGB9TgkvdVd2zf85IhhMY=;
 b=HUzWebuLvvznlkULt01JidNExRLlVQDWZTXOvnT+sbtdhze2IsajOG3U/XfZx//9tZ
 soLorbxHirMkel2h69SXx+yGq9I0movT8hX8ywCrCvCYadK/jZLs8c8WdlmzXoW8N09s
 kE7pDPbP1XwHXooqmxyMcmvgB6g+Yk4ab5YBIlpBhhC0t3fKdELPn7fBAwDYwmn55HRo
 IG6EnJyNT1ubR+AdpvEb2s1hkbVBborNwMK3NoX69N2rAOuwYxN57nZP3T4B3fA8mo+y
 5hQz5reXIKvW6lYvX+2cjwSFp+W0HVVCNObnD1O8NR48Y1tznDdmHjgLupnm6cT1pQjy
 /KAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjdPa1DXuQN8J9Tkc25KUgijAcBfGrwXgNhl9HXLfne74jd2kQ/RdL/UjO00qT2XKPT/trErw2Pm2ZbaHfnPHKLdjMHEGrtip5KfSnXfbt
X-Gm-Message-State: AOJu0YykH7hO/Svx2iBog3XXwh+uRTLYUxa4/0VjibeDGJSzj6BTxHrq
 2RFthDPRl7ZMG71FZXEKbDixb7KlB6Y1EO5h0+UWLcarDvfon69Bpl+12TJeyqDozGQx4Gz3PFx
 K5CxW9QYQVKKbbunhwlCWU2+u22w=
X-Google-Smtp-Source: AGHT+IEaoHXoOfzGNSmSoKjMWvBpOHFbClS41nTDLtYx57ohOHi5kQiYAAd2apDXp1OHsQIh2101vMyX2+eFEXvUfYs=
X-Received: by 2002:a05:6402:308e:b0:58e:3501:5c0a with SMTP id
 4fb4d7f45d1cf-594baf8d6cfmr261149a12.11.1720463939161; Mon, 08 Jul 2024
 11:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
 <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
 <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
 <Zn72laHlmWW3So9f@phenom.ffwll.local>
 <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
 <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
 <CAF6AEGtCEbhBo2CXLQymf2g5RogtdYv2LLXUNQO7Tvuw7x6ujA@mail.gmail.com>
 <ZofMlSIjFV9iGZNM@phenom.ffwll.local>
 <CAF6AEGvDFLBC6BWUdC6L1czn044EuTerPWqLib5hhRVkZyEpig@mail.gmail.com>
 <Zouo16MCRRCNyYAs@phenom.ffwll.local>
In-Reply-To: <Zouo16MCRRCNyYAs@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 8 Jul 2024 11:38:46 -0700
Message-ID: <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
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

On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
>
> On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <daniel.vetter@ffw=
ll.ch> wrote:
> > >
> > > On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > > On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <daniel.vetter=
@ffwll.ch> wrote:
> > > > >
> > > > > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > > > > > On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <daniel@=
ffwll.ch> wrote:
> > > > > > >
> > > > > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > > > > > > On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter <dan=
iel@ffwll.ch> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshko=
v wrote:
> > > > > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter w=
rote:
> > > > > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike=
 wrote:
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > > > > > Hi,
> > > > > > > > > > > > >
> > > > > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > > > > Basically, I often find myself needing to merge=
 CI patches on top of
> > > > > > > > > > > > > > msm-next in order to run CI, and then after a c=
lean CI run, reset HEAD
> > > > > > > > > > > > > > back before the merge and force-push.  Which is=
n't really how things
> > > > > > > > > > > > > > should work.
> > > > > > > > > > >
> > > > > > > > > > > This sounds more like you want an integration tree li=
ke drm-tip. Get msm
> > > > > > > > > > > branches integrated there, done. Backmerges just for =
integration testing
> > > > > > > > > > > are not a good idea indeed.
> > > > > > > >
> > > > > > > > But AFAIU this doesn't help for pre-merge testing, ie. prio=
r to a
> > > > > > > > patch landing in msm-next
> > > > > > > >
> > > > > > > > My idea was to have a drm-ci-next managed similar to drm-mi=
sc-next, if
> > > > > > > > we have needed drm/ci patches we could push them to drm-ci-=
next, and
> > > > > > > > then merge that into the driver tree (along with a PR from =
drm-ci-next
> > > > > > > > to Dave).
> > > > > > >
> > > > > > > I guess I'm confused about what kind of pre-merge testing we'=
re talking
> > > > > > > about then ... Or maybe this just doesn't work too well with =
the linux
> > > > > > > kernel. The model is that you have some pile of trees, they'r=
e split up,
> > > > > > > and testing of all the trees together is done in integration =
trees like
> > > > > > > linux-next or drm-tip.
> > > > > >
> > > > > > pre-merge: for msm we've been collecting up patches from list i=
nto a
> > > > > > fast-forward MR which triggers CI before merging to msm-next/ms=
m-fixes
> > > > > >
> > > > > > Ideally drm-misc and other trees would do similar, we'd catch m=
ore
> > > > > > regressions that way.  For example, in msm-next the nodebugfs b=
uild is
> > > > > > currently broken, because we merged drm-misc-next at a time whe=
n
> > > > > > komeda was broken:
> > > > > >
> > > > > > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> > > > > >
> > > > > > If drm-misc was using pre-merge CI this would have been caught =
and the
> > > > > > offending patch dropped.
> > > > >
> > > > > That sounds more like we should push on the drm-misc pre-merge CI=
 boulder
> > > > > to move it uphill, than add even more trees to make it even harde=
r to get
> > > > > there long term ...
> > > > >
> > > > > Short term it helps locally to have finer trees, but only short t=
erm and
> > > > > only very locally.
> > > >
> > > > The path to have fewer trees (ideally only one for all of drm) is t=
o
> > > > use gitlab MRs to land everything :-)
> > > >
> > > > drm-ci-next is only a stop-gap.. but one that we need.  The
> > > > ${branchname}-external-fixes trick covers _most_ cases where we nee=
d
> > > > unrelated patches (ie. to fix random ToT breakage outside of drm or=
 in
> > > > core drm), but it doesn't help when the needed changes are yml
> > > > (because gitlab processes all the yml before merging the
> > > > -external-fixes branch).  This is where we need drm-ci-next, otherw=
ise
> > > > we are having to create a separate MR which cherry-picks drm/ci
> > > > patches for doing the CI.  This is a rather broken process.
> > >
> > > So what I don't get is ... if we CI drm-misc, how does that not help
> > > improve the situation here? Step one would be post-merge (i.e. just e=
nable
> > > CI in the repo), then get MRs going.
> >
> > I guess post-merge is better than nothing.. but pre-merge is better.
> >
> > post-merge can work if you have a "sheriff" system where someone
> > (perhaps on a rotation) is actively monitoring results and "revert and
> > ask questions later" when something breaks.  Pre-merge ensures the
> > interested party is involved in the process ;-)
>
> So ... make that happen? And it doesn't have to be for all of drm-misc,
> mesa after all switched over to MR also on a bit a driver/area basis. So
> agreeing among all drm-ci folks to use gitlab MR in drm-misc for pre-merg=
e
> testing shouldn't be that hard to make happen. And unlike a separate
> branch it's not some kind of detour with a good chance to get stuck in a
> local optimum.

Tree vs branch doesn't really have much in the way of distinction,
modulo gitlab permissions.  In that it doesn't do much good if drm/ci
patches are landing on a different branch.

I guess what you are suggesting is that we have a single tree/branch
that drm/ci + drm/msm + (plus whoever else wants to get in on the
drm/ci, so probably at least vkms) lands patches into via gitlab MRs?

BR,
-R

> -Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
