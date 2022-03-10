Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340DD4D5173
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 20:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ECD10ECFA;
	Thu, 10 Mar 2022 19:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9668010ECFC;
 Thu, 10 Mar 2022 19:35:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id i66so3855526wma.5;
 Thu, 10 Mar 2022 11:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9CBEzwEknBs8VyjFQD6e1+L1HmnLUJuajNmzIiMf3Yo=;
 b=eLaariK5R2G8RUv7VkVrEhbfRmFFWqD2ufSDz+BGleVJyC6zAyf1NI1CPC5EO1EmNP
 /rAwYiAd5b4eF06DuV+wMkoSSEc0wphYCZqzdvrMAeBIMmO0rdiBmLZOz9oZJU0iDkFd
 LeaB6I31H/uS0OfDdDaC23ZH2BTIPRHJj3+vnK1vYZYScngE5ctTUBSKMatvpESQusyD
 Ca9DF4YAR06h0czDhH8mwOcAs+EuTO5LR29c5qCC314PP14JUC5k5ZICn1Us4Xuej3AB
 y3cmrqHznRPbzPkpCFkYiJlKS8PuyWrsbKeHOG78LsEFW2bhhEI84ZueQ9C1Hdv3cx1W
 aUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9CBEzwEknBs8VyjFQD6e1+L1HmnLUJuajNmzIiMf3Yo=;
 b=qxNgYsYp/hxTZml5zPmCvchSPUzSVPizt/tmCo5zw5g5H9Up4COHl/EOG5qVD/3oaA
 j3IRaFzKJFN5T1Ure1ehOj7rQoZueZpHtmDxfgrWLdvBDHZ8DWksGgkVqnw3mi88mcxC
 mEddJmrxta4C+AE+njSIX0ESIHMgCKFSytCdqlowmx7KW3z4g+rjKWiSv1sLyCbmCrUY
 ffcLN6ldoUmIy+s6Tzqdi/TdXAaPrhu+5yi8OnDsHGRaPlvuirs8FNuM1FKhHiMaQ0wo
 IAwJryWpoDngCW8LKKb8L50108XnQoxPj8ToyVNBfbfwZ2TN/zrJnDQXLNEIHLdTxXCI
 SfbQ==
X-Gm-Message-State: AOAM531KajvoOxQbjve9stOXen+AJDK4U9BPYAu9CcmxlWUxI5RfD32E
 6r2LeOWbIkncjwIljV3NpF0NMLrOmNWMA79OEig=
X-Google-Smtp-Source: ABdhPJxS9fwBulH9fxBrzFcpkmYPZKr269Xz3vmj/LoMj8sfId7SsRVteIvy0ZuRB5dyCZj5kXAwbnLlvo3WQg/XZQc=
X-Received: by 2002:a05:600c:35c4:b0:389:e7b6:b417 with SMTP id
 r4-20020a05600c35c400b00389e7b6b417mr2559062wmq.102.1646940951964; Thu, 10
 Mar 2022 11:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
In-Reply-To: <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Mar 2022 11:35:39 -0800
Message-ID: <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: "Sharma, Shashank" <shashank.sharma@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 10, 2022 at 11:14 AM Sharma, Shashank
<shashank.sharma@amd.com> wrote:
>
>
>
> On 3/10/2022 7:33 PM, Abhinav Kumar wrote:
> >
> >
> > On 3/10/2022 9:40 AM, Rob Clark wrote:
> >> On Thu, Mar 10, 2022 at 9:19 AM Sharma, Shashank
> >> <shashank.sharma@amd.com> wrote:
> >>>
> >>>
> >>>
> >>> On 3/10/2022 6:10 PM, Rob Clark wrote:
> >>>> On Thu, Mar 10, 2022 at 8:21 AM Sharma, Shashank
> >>>> <shashank.sharma@amd.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 3/10/2022 4:24 PM, Rob Clark wrote:
> >>>>>> On Thu, Mar 10, 2022 at 1:55 AM Christian K=C3=B6nig
> >>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> Am 09.03.22 um 19:12 schrieb Rob Clark:
> >>>>>>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
> >>>>>>>> <contactshashanksharma@gmail.com> wrote:
> >>>>>>>>> From: Shashank Sharma <shashank.sharma@amd.com>
> >>>>>>>>>
> >>>>>>>>> This patch adds a new sysfs event, which will indicate
> >>>>>>>>> the userland about a GPU reset, and can also provide
> >>>>>>>>> some information like:
> >>>>>>>>> - process ID of the process involved with the GPU reset
> >>>>>>>>> - process name of the involved process
> >>>>>>>>> - the GPU status info (using flags)
> >>>>>>>>>
> >>>>>>>>> This patch also introduces the first flag of the flags
> >>>>>>>>> bitmap, which can be appended as and when required.
> >>>>>>>> Why invent something new, rather than using the already existing
> >>>>>>>> devcoredump?
> >>>>>>>
> >>>>>>> Yeah, that's a really valid question.
> >>>>>>>
> >>>>>>>> I don't think we need (or should encourage/allow) something drm
> >>>>>>>> specific when there is already an existing solution used by both
> >>>>>>>> drm
> >>>>>>>> and non-drm drivers.  Userspace should not have to learn to supp=
ort
> >>>>>>>> yet another mechanism to do the same thing.
> >>>>>>>
> >>>>>>> Question is how is userspace notified about new available core
> >>>>>>> dumps?
> >>>>>>
> >>>>>> I haven't looked into it too closely, as the CrOS userspace
> >>>>>> crash-reporter already had support for devcoredump, so it "just
> >>>>>> worked" out of the box[1].  I believe a udev event is what trigger=
s
> >>>>>> the crash-reporter to go read the devcore dump out of sysfs.
> >>>>>
> >>>>> I had a quick look at the devcoredump code, and it doesn't look lik=
e
> >>>>> that is sending an event to the user, so we still need an event to
> >>>>> indicate a GPU reset.
> >>>>
> >>>> There definitely is an event to userspace, I suspect somewhere down
> >>>> the device_add() path?
> >>>>
> >>>
> >>> Let me check that out as well, hope that is not due to a driver-priva=
te
> >>> event for GPU reset, coz I think I have seen some of those in a few D=
RM
> >>> drivers.
> >>>
> >>
> >> Definitely no driver private event for drm/msm .. I haven't dug
> >> through it all but this is the collector for devcoredump, triggered
> >> somehow via udev.  Most likely from event triggered by device_add()
> >>
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fch=
romium.googlesource.com%2Fchromiumos%2Fplatform2%2F%2B%2FHEAD%2Fcrash-repor=
ter%2Fudev_collector.cc&amp;data=3D04%7C01%7Cshashank.sharma%40amd.com%7C86=
146416b717420501fc08da02c4785b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7=
C637825340130157925%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DLncI%2F5mIpeG1Avj2YX=
LmbZ5f1ONUfpf6TzJZH3%2Fs8%2Fw%3D&amp;reserved=3D0
> >>
> >
> > Yes, that is correct. the uevent for devcoredump is from device_add()
> >
> Yes, I could confirm in the code that device_add() sends a uevent.
>
> kobject_uevent(&dev->kobj, KOBJ_ADD);
>
> I was trying to map the ChromiumOs's udev event rules with the event
> being sent from device_add(), what I could see is there is only one udev
> rule for any DRM subsystem events in ChromiumOs's 99-crash-reporter.rules=
:
>
> ACTION=3D=3D"change", SUBSYSTEM=3D=3D"drm", KERNEL=3D=3D"card0", ENV{ERRO=
R}=3D=3D"1", \
>    RUN+=3D"/sbin/crash_reporter
> --udev=3DKERNEL=3Dcard0:SUBSYSTEM=3Ddrm:ACTION=3Dchange"
>
> Can someone confirm that this is the rule which gets triggered when a
> devcoredump is generated ? I could not find an ERROR=3D1 string in the
> env[] while sending this event from dev_add();

I think it is actually this rule:

ACTION=3D=3D"add", SUBSYSTEM=3D=3D"devcoredump", \
  RUN+=3D"/sbin/crash_reporter
--udev=3DSUBSYSTEM=3Ddevcoredump:ACTION=3Dadd:KERNEL_NUMBER=3D%n"

It is something non-drm specific because it supports devcore dumps
from non drm drivers.  I know at least some of the wifi and remoteproc
drivers use it.

BR,
-R
