Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C6A92AC0F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 00:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F96410E3CC;
	Mon,  8 Jul 2024 22:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="feZGhk8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D579510E3CC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 22:28:03 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6561850a7bcso19607697b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 15:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720477683; x=1721082483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UT1AWue9gXScVviLKDuY+3G1NnCeFz5TwGx7QDoFTZA=;
 b=feZGhk8w98HznAUxKhsCdgUZ+R7SuvupSXKzetONGiDxDKADRpI9XExkwa1h7TYA64
 4bKAWnw3ZdmpVOJ4T/8in6wRu+oEfwsMnhk5oktT1WuA2tyVLGlfzsLrZ4mwUrcbWMyM
 jllSNnbvPg8mPsFF9sfJrzDiQFQPao2FcqhgeKhASoPfGGRhp1Pj67fKHQtNLbFNTzDs
 nJ1hAT9aiNk57TFwIOy5usDT56tSXoJCDo5KheUN0QuBsFSjU2glZRdZMeiSe8cULwYv
 Lj3Xq7rVgmy8phGoToVlj8ck/eIVICGvxO1SSbDdlBaP1WG1tAb4hfUyqeiyzuWFuF9H
 PxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720477683; x=1721082483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UT1AWue9gXScVviLKDuY+3G1NnCeFz5TwGx7QDoFTZA=;
 b=qqH/nfiFHQ3MCurebiJpeq8K4jMuM0uyZhTUE778j+6Goe3l/2zoaHNmOF6DibUbMN
 /wNLBgoGZ1ZTFLn+Y+D6ue9fkqQXKT73ug0mMciRgjrI5pJsoKHGnbkFKhWmqfC25sey
 L9LGLp7XJTx4pwCXep4BVKkMRFLq0r0vXpC7mKVXWwt/5rxxxOWBkOV8/KMaDL+3ddZX
 EpwDK8MAmQO7u4s/M+61L7bHpspu8I4Qwmzq6QNwdmBiUIWYym0yreHY+24/19NSMKXQ
 BX8aGx5HjNW8ATdMcnNT+rxi3JluEFkEd8HVF935GJuaYVWlMkVXpIYfmM/HLTiuocVO
 LTsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPt6Rht+3HSAptl/JaMTkiXLgIRjtCqbuFaLhTeinvrbvdbt0OndIdyRbHM+nhInRVJ60z4aWv9/V3e9DQALO9TRI3zS3pAPKmJXNCh2ca
X-Gm-Message-State: AOJu0Yxu0sHzeLlDyNhStDxbImsPRGSVv/4nf9CVXbPmYiA7+WiTXjUt
 cayX71qqDWGR4uQhKqMNHXoOFHcb37/4aB8ie0xrAsNMysykuVAZMlI43IMxOO+ZnADf3Fi3PIQ
 rG3tHQNSTQuIuV7QSeNQFSg0msarxktXAGMxkKg==
X-Google-Smtp-Source: AGHT+IHkGBBrdyM/h8MLdnQJ6sFrv8zrB+IBvCB+2hSb8FCltaIa+vzpiOlYqnqvqQHZfGbb0BteQtfYGlg84W1f7Ws=
X-Received: by 2002:a0d:ec07:0:b0:645:8fb:71c8 with SMTP id
 00721157ae682-658f09c9039mr10325627b3.37.1720477682893; Mon, 08 Jul 2024
 15:28:02 -0700 (PDT)
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
 <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
In-Reply-To: <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jul 2024 01:27:51 +0300
Message-ID: <CAA8EJppyM_-5fBL6VFp+kxyg36LAbjxqUgA+ico9LBuJvaahxQ@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Rob Clark <robdclark@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel@ffwll.ch>, 
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

On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel.vetter@ffwll=
.ch> wrote:
> >
> > On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > > On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <daniel.vetter@f=
fwll.ch> wrote:
> > > >
> > > > On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > > > On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <daniel.vett=
er@ffwll.ch> wrote:
> > > > > >
> > > > > > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > > > > > > On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <danie=
l@ffwll.ch> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > > > > > > > On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter <d=
aniel@ffwll.ch> wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Barysh=
kov wrote:
> > > > > > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter=
 wrote:
> > > > > > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koi=
ke wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > > > > > Basically, I often find myself needing to mer=
ge CI patches on top of
> > > > > > > > > > > > > > > msm-next in order to run CI, and then after a=
 clean CI run, reset HEAD
> > > > > > > > > > > > > > > back before the merge and force-push.  Which =
isn't really how things
> > > > > > > > > > > > > > > should work.
> > > > > > > > > > > >
> > > > > > > > > > > > This sounds more like you want an integration tree =
like drm-tip. Get msm
> > > > > > > > > > > > branches integrated there, done. Backmerges just fo=
r integration testing
> > > > > > > > > > > > are not a good idea indeed.
> > > > > > > > >
> > > > > > > > > But AFAIU this doesn't help for pre-merge testing, ie. pr=
ior to a
> > > > > > > > > patch landing in msm-next
> > > > > > > > >
> > > > > > > > > My idea was to have a drm-ci-next managed similar to drm-=
misc-next, if
> > > > > > > > > we have needed drm/ci patches we could push them to drm-c=
i-next, and
> > > > > > > > > then merge that into the driver tree (along with a PR fro=
m drm-ci-next
> > > > > > > > > to Dave).
> > > > > > > >
> > > > > > > > I guess I'm confused about what kind of pre-merge testing w=
e're talking
> > > > > > > > about then ... Or maybe this just doesn't work too well wit=
h the linux
> > > > > > > > kernel. The model is that you have some pile of trees, they=
're split up,
> > > > > > > > and testing of all the trees together is done in integratio=
n trees like
> > > > > > > > linux-next or drm-tip.
> > > > > > >
> > > > > > > pre-merge: for msm we've been collecting up patches from list=
 into a
> > > > > > > fast-forward MR which triggers CI before merging to msm-next/=
msm-fixes
> > > > > > >
> > > > > > > Ideally drm-misc and other trees would do similar, we'd catch=
 more
> > > > > > > regressions that way.  For example, in msm-next the nodebugfs=
 build is
> > > > > > > currently broken, because we merged drm-misc-next at a time w=
hen
> > > > > > > komeda was broken:
> > > > > > >
> > > > > > > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> > > > > > >
> > > > > > > If drm-misc was using pre-merge CI this would have been caugh=
t and the
> > > > > > > offending patch dropped.
> > > > > >
> > > > > > That sounds more like we should push on the drm-misc pre-merge =
CI boulder
> > > > > > to move it uphill, than add even more trees to make it even har=
der to get
> > > > > > there long term ...
> > > > > >
> > > > > > Short term it helps locally to have finer trees, but only short=
 term and
> > > > > > only very locally.
> > > > >
> > > > > The path to have fewer trees (ideally only one for all of drm) is=
 to
> > > > > use gitlab MRs to land everything :-)
> > > > >
> > > > > drm-ci-next is only a stop-gap.. but one that we need.  The
> > > > > ${branchname}-external-fixes trick covers _most_ cases where we n=
eed
> > > > > unrelated patches (ie. to fix random ToT breakage outside of drm =
or in
> > > > > core drm), but it doesn't help when the needed changes are yml
> > > > > (because gitlab processes all the yml before merging the
> > > > > -external-fixes branch).  This is where we need drm-ci-next, othe=
rwise
> > > > > we are having to create a separate MR which cherry-picks drm/ci
> > > > > patches for doing the CI.  This is a rather broken process.
> > > >
> > > > So what I don't get is ... if we CI drm-misc, how does that not hel=
p
> > > > improve the situation here? Step one would be post-merge (i.e. just=
 enable
> > > > CI in the repo), then get MRs going.
> > >
> > > I guess post-merge is better than nothing.. but pre-merge is better.
> > >
> > > post-merge can work if you have a "sheriff" system where someone
> > > (perhaps on a rotation) is actively monitoring results and "revert an=
d
> > > ask questions later" when something breaks.  Pre-merge ensures the
> > > interested party is involved in the process ;-)
> >
> > So ... make that happen? And it doesn't have to be for all of drm-misc,
> > mesa after all switched over to MR also on a bit a driver/area basis. S=
o
> > agreeing among all drm-ci folks to use gitlab MR in drm-misc for pre-me=
rge
> > testing shouldn't be that hard to make happen. And unlike a separate
> > branch it's not some kind of detour with a good chance to get stuck in =
a
> > local optimum.
>
> Tree vs branch doesn't really have much in the way of distinction,
> modulo gitlab permissions.  In that it doesn't do much good if drm/ci
> patches are landing on a different branch.
>
> I guess what you are suggesting is that we have a single tree/branch
> that drm/ci + drm/msm + (plus whoever else wants to get in on the
> drm/ci, so probably at least vkms) lands patches into via gitlab MRs?

This again brings a separate CI-enabled tree. I think it has been
suggested to start with enabling DRM CI for drm-misc branches. Then we
can possibly start landing MRs with CI testing (probably starting with
vkms).

--=20
With best wishes
Dmitry
