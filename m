Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815F928DC5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 21:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F1B10E12A;
	Fri,  5 Jul 2024 19:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IImcWP6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD1A10E12A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 19:31:51 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ee90f56e02so16937621fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720207909; x=1720812709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3a/IP9UAI0MMzDfJcGVj3efcyNq722ZVixAUuw6OvDM=;
 b=IImcWP6ZK0eQl/aJJilRoQ7hUWk9PZImtIYWDE+0+OnODtyYUgbo66FEJBLPUqFKmy
 5HdSsndiwX+lOUonobwkl/23eGcDTg+keWFmTI7VWLYgQlDoWb+KWqKmjkre6sFrqZsx
 huzw2t1x5nuLPBi/ypTVVe1R6b4fj388r67qyCulF7gVnHt1Y75K9oLe9X1GEnXVZevF
 i2HF3lH3Rfc2txJIV9PVu07z2PUAIChWVUIG0NtwjlwztypfFgK1dUcjeCPNVVUNwEnE
 L+ySjF/EW+27vD2nv18shpaQZdjML4DT3MpECLs/qilIK3H8uozuM9iS/O2GfKPjTcCq
 hqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720207909; x=1720812709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3a/IP9UAI0MMzDfJcGVj3efcyNq722ZVixAUuw6OvDM=;
 b=uIsfM4fR8c/w321CT7VvVF6guJvsQhMlwa/1kOhBHLTdhCP72z7TIWEria0MXF4LGp
 jqGksHemI9TFQflhWf1+lxuZhTJSZP2mwUXC8EltO2k6CaeMVqy6juEis5ll9V0a+KCO
 ZT3IvoMb+NeC9PrR4tHuv3PVWtHy9JQD1GG6iL8DiR7HYjM2S9nh4l7TLrSkw29IDNvI
 qmype6r6/7his7Q4OhC9414q4RUDW7KAK8Tz26mtB/uJ9YWJ492bCUAlfil7s4Cz85AG
 Y/6a4DiTwx0Avtzv3SZuylGrx70I/0oF3cYY9KEtBcknYVD5cv2opyYRyoA4HAb4pEf2
 EFyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr7XK45TBTrKCyPDy7wiE5DVT/6uSBj/Hmd566fPlP0kMarAs1NIBrr2r4qrTYmJ7lFJbCxotryIkI0bhf9oW3fG+CT0ZUegfCi8XHEkxL
X-Gm-Message-State: AOJu0YwzPmrEsbXbdjPeSyUmwRVwGKb3UCPCS26HZOcm0IUGagkwIMyg
 U+sPSm+MklWfFsu7sPyg8IYFRioAuoz6inXssP+QjfBhxGP9rr8Mp3WXfQsfpoEm7dAkPRtLC4+
 odN5+WlJuQJydR5d+W2TiGiZmSwU=
X-Google-Smtp-Source: AGHT+IEGwTHUnEwxAtcRQIzolhJSZk6WkVqku3urMzgbBFOy6oE1rE6fQ+l016BGnCGGPVPlLtRBZJ2NRquAVpXNayg=
X-Received: by 2002:a2e:a167:0:b0:2ee:83f7:8b32 with SMTP id
 38308e7fff4ca-2ee8ed93dbcmr37826791fa.21.1720207908815; Fri, 05 Jul 2024
 12:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
 <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
 <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
 <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
 <Zn72laHlmWW3So9f@phenom.ffwll.local>
 <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
 <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
 <CAF6AEGtCEbhBo2CXLQymf2g5RogtdYv2LLXUNQO7Tvuw7x6ujA@mail.gmail.com>
 <ZofMlSIjFV9iGZNM@phenom.ffwll.local>
In-Reply-To: <ZofMlSIjFV9iGZNM@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 5 Jul 2024 12:31:36 -0700
Message-ID: <CAF6AEGvDFLBC6BWUdC6L1czn044EuTerPWqLib5hhRVkZyEpig@mail.gmail.com>
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

On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
>
> On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <daniel.vetter@ffw=
ll.ch> wrote:
> > >
> > > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > > > On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <daniel@ffwl=
l.ch> wrote:
> > > > >
> > > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > > > > On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter <daniel@=
ffwll.ch> wrote:
> > > > > > >
> > > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wr=
ote:
> > > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote=
:
> > > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wro=
te:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > >
> > > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > > Basically, I often find myself needing to merge CI =
patches on top of
> > > > > > > > > > > > msm-next in order to run CI, and then after a clean=
 CI run, reset HEAD
> > > > > > > > > > > > back before the merge and force-push.  Which isn't =
really how things
> > > > > > > > > > > > should work.
> > > > > > > > >
> > > > > > > > > This sounds more like you want an integration tree like d=
rm-tip. Get msm
> > > > > > > > > branches integrated there, done. Backmerges just for inte=
gration testing
> > > > > > > > > are not a good idea indeed.
> > > > > >
> > > > > > But AFAIU this doesn't help for pre-merge testing, ie. prior to=
 a
> > > > > > patch landing in msm-next
> > > > > >
> > > > > > My idea was to have a drm-ci-next managed similar to drm-misc-n=
ext, if
> > > > > > we have needed drm/ci patches we could push them to drm-ci-next=
, and
> > > > > > then merge that into the driver tree (along with a PR from drm-=
ci-next
> > > > > > to Dave).
> > > > >
> > > > > I guess I'm confused about what kind of pre-merge testing we're t=
alking
> > > > > about then ... Or maybe this just doesn't work too well with the =
linux
> > > > > kernel. The model is that you have some pile of trees, they're sp=
lit up,
> > > > > and testing of all the trees together is done in integration tree=
s like
> > > > > linux-next or drm-tip.
> > > >
> > > > pre-merge: for msm we've been collecting up patches from list into =
a
> > > > fast-forward MR which triggers CI before merging to msm-next/msm-fi=
xes
> > > >
> > > > Ideally drm-misc and other trees would do similar, we'd catch more
> > > > regressions that way.  For example, in msm-next the nodebugfs build=
 is
> > > > currently broken, because we merged drm-misc-next at a time when
> > > > komeda was broken:
> > > >
> > > > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> > > >
> > > > If drm-misc was using pre-merge CI this would have been caught and =
the
> > > > offending patch dropped.
> > >
> > > That sounds more like we should push on the drm-misc pre-merge CI bou=
lder
> > > to move it uphill, than add even more trees to make it even harder to=
 get
> > > there long term ...
> > >
> > > Short term it helps locally to have finer trees, but only short term =
and
> > > only very locally.
> >
> > The path to have fewer trees (ideally only one for all of drm) is to
> > use gitlab MRs to land everything :-)
> >
> > drm-ci-next is only a stop-gap.. but one that we need.  The
> > ${branchname}-external-fixes trick covers _most_ cases where we need
> > unrelated patches (ie. to fix random ToT breakage outside of drm or in
> > core drm), but it doesn't help when the needed changes are yml
> > (because gitlab processes all the yml before merging the
> > -external-fixes branch).  This is where we need drm-ci-next, otherwise
> > we are having to create a separate MR which cherry-picks drm/ci
> > patches for doing the CI.  This is a rather broken process.
>
> So what I don't get is ... if we CI drm-misc, how does that not help
> improve the situation here? Step one would be post-merge (i.e. just enabl=
e
> CI in the repo), then get MRs going.

I guess post-merge is better than nothing.. but pre-merge is better.

post-merge can work if you have a "sheriff" system where someone
(perhaps on a rotation) is actively monitoring results and "revert and
ask questions later" when something breaks.  Pre-merge ensures the
interested party is involved in the process ;-)

BR,
-R

> > I could conceivably see a scenario where we are landing both drm/ci
> > and drm/msm changes via the same tree.  But only if we were using
> > gitlab MRs and CI for landing all changes in that tree.
>
> Yeah that's kinda the world I'm hoping for.
> -Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
