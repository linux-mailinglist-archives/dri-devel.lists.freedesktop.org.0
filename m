Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E84D5005
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 18:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D550B10E267;
	Thu, 10 Mar 2022 17:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC60010E267;
 Thu, 10 Mar 2022 17:15:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q14so9058260wrc.4;
 Thu, 10 Mar 2022 09:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1/2w1z2ZdiRCpt+xqlwISIibTqwiqtI2JJAckWTEef8=;
 b=Otp/txesNxe6HPTeVSiBfnCOfDtXsXmrlOSvX51M6Jpyidr/8KMMx9dED6Ud+iJSGe
 0tjFTBl1O/uZlNJhXqJiwBPcLGNPSRblq/3UhMdfT0Xj5twLpOlooQR1QzO4I/6hE0+Z
 J+bM4Yvp9rtngE4j6WaL80fW6lFPDITAv3seTayzMw9PGvcJh8TTLHApNyRzKKUYZs17
 MIaBzFV+4w/GvbFhhxsRs3Ca1CNJLpBMZB6/X4TH0mIspBbKn5armOkn3xzrX3AoBPWA
 f5eJJC8kbgC0BuGjApLj4kimdLHN1w9X6NPRpQBugXVgpcDqnEzk3IHAW9d83eyY50LB
 KDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1/2w1z2ZdiRCpt+xqlwISIibTqwiqtI2JJAckWTEef8=;
 b=azcO24PxAp9VIeJi196CRkMaAfyE2+Q/KhI4FK96A0E2u2SitHvAcTmxvMRpVtw1w+
 OMPZJ34Uqn14NY/HcUbpRpFXd6yl/qneiJ+Z173yWH+PNkl0dM6YzFqPyquzg5IHgo79
 ALe3+KDbDsQicVWLeICoM77KKzgxoECgWgouEbF+8Qnh4qpult4K2S8d181FG9jLGXhf
 ufniO8WFM0i6G52uxm1RBuzmAMiUeKMPxPdRok6I3x2iysMLPBP4WxQK2tGpbzzl0hsv
 irMetGHPHNB+UxiO/0zeQrXvG7y+JTdsiHab1X/rlggKZ/eX5xmZ8HLIZz0fKHNEzMPS
 d+Yw==
X-Gm-Message-State: AOAM531lxLU3Mlu0fLLThDpL7w+rJalhcCCKmgfniPKZL6ADPeMGVzvl
 3Z9j21vbB4stee4FLvEhVKwUllENDeQEam9PBgKladqy594=
X-Google-Smtp-Source: ABdhPJz/UiTOyx5v+j5fTvDPXPhNr6qLNq/ycaaf5Qd/f4nYCdLP1NeIghrQovNm1Q4RLutwoPBLrQzjVuStrOPMUjI=
X-Received: by 2002:a5d:64c1:0:b0:203:7aa5:9390 with SMTP id
 f1-20020a5d64c1000000b002037aa59390mr4386356wri.328.1646932526158; Thu, 10
 Mar 2022 09:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <5f6f6d7a-240f-f82d-b1dd-d3328ed75c07@amd.com>
In-Reply-To: <5f6f6d7a-240f-f82d-b1dd-d3328ed75c07@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Mar 2022 09:16:05 -0800
Message-ID: <CAF6AEGtrNOdgH7wEpM7vrFxq8088Pv+H_F+3qrBtixsdVTROCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 10, 2022 at 8:27 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
>
> On 2022-03-10 11:21, Sharma, Shashank wrote:
> >
> >
> > On 3/10/2022 4:24 PM, Rob Clark wrote:
> >> On Thu, Mar 10, 2022 at 1:55 AM Christian K=C3=B6nig
> >> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>
> >>>
> >>>
> >>> Am 09.03.22 um 19:12 schrieb Rob Clark:
> >>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
> >>>> <contactshashanksharma@gmail.com> wrote:
> >>>>> From: Shashank Sharma <shashank.sharma@amd.com>
> >>>>>
> >>>>> This patch adds a new sysfs event, which will indicate
> >>>>> the userland about a GPU reset, and can also provide
> >>>>> some information like:
> >>>>> - process ID of the process involved with the GPU reset
> >>>>> - process name of the involved process
> >>>>> - the GPU status info (using flags)
> >>>>>
> >>>>> This patch also introduces the first flag of the flags
> >>>>> bitmap, which can be appended as and when required.
> >>>> Why invent something new, rather than using the already existing
> >>>> devcoredump?
> >>>
> >>> Yeah, that's a really valid question.
> >>>
> >>>> I don't think we need (or should encourage/allow) something drm
> >>>> specific when there is already an existing solution used by both drm
> >>>> and non-drm drivers.  Userspace should not have to learn to support
> >>>> yet another mechanism to do the same thing.
> >>>
> >>> Question is how is userspace notified about new available core dumps?
> >>
> >> I haven't looked into it too closely, as the CrOS userspace
> >> crash-reporter already had support for devcoredump, so it "just
> >> worked" out of the box[1].  I believe a udev event is what triggers
> >> the crash-reporter to go read the devcore dump out of sysfs.
> >
> > I had a quick look at the devcoredump code, and it doesn't look like
> > that is sending an event to the user, so we still need an event to
> > indicate a GPU reset.
> >
> > - Shashank
>
>
> Another point I raised in another thread is that it looks like we might
> want to use devcoredump during ASIC reset to dump more HW related data
> which is useful
> for debugging. It means the use client will have to extract the pid and
> process name out from a bigger data set - Is that ok ? We can probably
> put it at the beginning
> for easiest parsing.
>

Yes, this is what we do for drm/msm.. the start of the devcore file
has something like:

----
kernel: 5.14.0-rc3-debug+
module: msm
time: 1632763923.453207637
comm: deqp-gles3:sq0
cmdline: ./deqp-gles31 --deqp-surface-width=3D256
--deqp-surface-height=3D256 --deqp-gl-config-name=3Drgba8888d24s8ms0
--deqp-visibility=3Dhidden
--deqp-caselist-file=3D/home/robclark/src/deqp/build/modules/gles31/new-run=
/c33.r1.caselist.txt
--deqp-log-filename=3D/home/robclark/src/deqp/build/modules/gles31/new-run/=
c33.r1.qpa
--deqp-log-flush=3Ddisable
--deqp-shadercache-filename=3D/home/robclark/src/deqp/build/modules/gles31/=
new-run/t499826814672.shader_cache
--deqp-shadercache-truncate=3Ddisable
revision: 618 (6.1.8.0)
----

We capture quite a lot of state, cmdstream that triggered the hang,
register/state dumps, microcontroller state, etc.  But we do go out of
our way to not capture textures or caches that might contain texture
data by default (for privacy reasons)

It has been hugely useful for debugging a few issues that happen
rarely enough that they are difficult to reproduce.  I guess that is
crowd-sourced debugging ;-)

BR,
-R
