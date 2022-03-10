Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD54D52A9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 20:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E3A10E271;
	Thu, 10 Mar 2022 19:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9778910E117;
 Thu, 10 Mar 2022 19:56:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id x15so9588868wru.13;
 Thu, 10 Mar 2022 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nr7vHmfNSDbU8v79fE1brk1VIuEqA9BxbPF/8wl5n7Y=;
 b=XOZou+JLRYiPaMTBjrT0/EWJ7cIK7WFQPXp7zY1NKLNlOFzXdMyTShPw9Nqza9xV27
 f5BUU8Sb/EtfCFXcR31x7Wdcf95cXQCp+GhjwvO2vEKqo5iPJQ/b5D0fRUJAZRUzswKs
 /bOX5PU+TspnXD+IUdGxhi/urls320cs6drEwa9whFUriutdFSf90e4WKWs4khFfnnSi
 HM/CT1ywbXV0lBsPyQK98AzBb6hprBVwlGryzHL6XonYpyqT/GP4t2awgx+CA1ebztHK
 RGuG8atFSJ2xBQzUPpLrw3mQq787H0odkj8ndzZUa+G85f4Qw4mvP5Kq0pImJfEmfRLf
 jPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nr7vHmfNSDbU8v79fE1brk1VIuEqA9BxbPF/8wl5n7Y=;
 b=NODA8TP78t6dUHhmZhR7R4lUW5LCU0ono1I7YYVIF3Oj/CY/N4ltfdAdTolin1VcVW
 oKcfe/XOTHdue4isc7LfakNy5f9sDa9ZmJLYBEZLtg4ZmtZZuFw2KeiHNRd/XSHvtyib
 WSra0a2X2NQDKmUgpF2mK2UySH4z+1t9BnTabJqeE1qMTws076RRdVRaXJ/tDL27MAib
 1PMRV4ooEWuJHb49ZwF4ptMZmjM1osK5Q3dQtyKGOQPRWalhtrY0bazm+0lyQwCFxbNE
 YWtoUs3hSEfWXg9PXKwui7CwUo6bRyDt2mjR2f3sVA5Fa+piJ2cm7oZThJ8eqmY7M3rR
 jt9Q==
X-Gm-Message-State: AOAM532cM42jQiZQMgjPoxiCkQXHpYRyCfu2Z3G2mswj/skK//gDr/Fr
 gLH8A6jO68NzCP834HYB82eyUFCDiRBcPaRPbMs=
X-Google-Smtp-Source: ABdhPJyfaa+gpeLSGdbqZZcbmFiidj5+yfhZcjyEFOeMbqFKbf505Qsv7kZE0hZJHiB2/kjOTLifLWvhajXZVSXpwjg=
X-Received: by 2002:a5d:6344:0:b0:1f0:21ee:9705 with SMTP id
 b4-20020a5d6344000000b001f021ee9705mr4753162wrw.93.1646942161915; Thu, 10 Mar
 2022 11:56:01 -0800 (PST)
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
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
In-Reply-To: <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Mar 2022 11:56:41 -0800
Message-ID: <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
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

On Thu, Mar 10, 2022 at 11:44 AM Sharma, Shashank
<shashank.sharma@amd.com> wrote:
>
>
>
> On 3/10/2022 8:35 PM, Rob Clark wrote:
> > On Thu, Mar 10, 2022 at 11:14 AM Sharma, Shashank
> > <shashank.sharma@amd.com> wrote:
> >>
> >>
> >>
> >> On 3/10/2022 7:33 PM, Abhinav Kumar wrote:
> >>>
> >>>
> >>> On 3/10/2022 9:40 AM, Rob Clark wrote:
> >>>> On Thu, Mar 10, 2022 at 9:19 AM Sharma, Shashank
> >>>> <shashank.sharma@amd.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 3/10/2022 6:10 PM, Rob Clark wrote:
> >>>>>> On Thu, Mar 10, 2022 at 8:21 AM Sharma, Shashank
> >>>>>> <shashank.sharma@amd.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 3/10/2022 4:24 PM, Rob Clark wrote:
> >>>>>>>> On Thu, Mar 10, 2022 at 1:55 AM Christian K=C3=B6nig
> >>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Am 09.03.22 um 19:12 schrieb Rob Clark:
> >>>>>>>>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
> >>>>>>>>>> <contactshashanksharma@gmail.com> wrote:
> >>>>>>>>>>> From: Shashank Sharma <shashank.sharma@amd.com>
> >>>>>>>>>>>
> >>>>>>>>>>> This patch adds a new sysfs event, which will indicate
> >>>>>>>>>>> the userland about a GPU reset, and can also provide
> >>>>>>>>>>> some information like:
> >>>>>>>>>>> - process ID of the process involved with the GPU reset
> >>>>>>>>>>> - process name of the involved process
> >>>>>>>>>>> - the GPU status info (using flags)
> >>>>>>>>>>>
> >>>>>>>>>>> This patch also introduces the first flag of the flags
> >>>>>>>>>>> bitmap, which can be appended as and when required.
> >>>>>>>>>> Why invent something new, rather than using the already existi=
ng
> >>>>>>>>>> devcoredump?
> >>>>>>>>>
> >>>>>>>>> Yeah, that's a really valid question.
> >>>>>>>>>
> >>>>>>>>>> I don't think we need (or should encourage/allow) something dr=
m
> >>>>>>>>>> specific when there is already an existing solution used by bo=
th
> >>>>>>>>>> drm
> >>>>>>>>>> and non-drm drivers.  Userspace should not have to learn to su=
pport
> >>>>>>>>>> yet another mechanism to do the same thing.
> >>>>>>>>>
> >>>>>>>>> Question is how is userspace notified about new available core
> >>>>>>>>> dumps?
> >>>>>>>>
> >>>>>>>> I haven't looked into it too closely, as the CrOS userspace
> >>>>>>>> crash-reporter already had support for devcoredump, so it "just
> >>>>>>>> worked" out of the box[1].  I believe a udev event is what trigg=
ers
> >>>>>>>> the crash-reporter to go read the devcore dump out of sysfs.
> >>>>>>>
> >>>>>>> I had a quick look at the devcoredump code, and it doesn't look l=
ike
> >>>>>>> that is sending an event to the user, so we still need an event t=
o
> >>>>>>> indicate a GPU reset.
> >>>>>>
> >>>>>> There definitely is an event to userspace, I suspect somewhere dow=
n
> >>>>>> the device_add() path?
> >>>>>>
> >>>>>
> >>>>> Let me check that out as well, hope that is not due to a driver-pri=
vate
> >>>>> event for GPU reset, coz I think I have seen some of those in a few=
 DRM
> >>>>> drivers.
> >>>>>
> >>>>
> >>>> Definitely no driver private event for drm/msm .. I haven't dug
> >>>> through it all but this is the collector for devcoredump, triggered
> >>>> somehow via udev.  Most likely from event triggered by device_add()
> >>>>
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
chromium.googlesource.com%2Fchromiumos%2Fplatform2%2F%2B%2FHEAD%2Fcrash-rep=
orter%2Fudev_collector.cc&amp;data=3D04%7C01%7Cshashank.sharma%40amd.com%7C=
b4e920f125ae4d7de29708da02cd3112%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0=
%7C637825377562005233%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DM4xHPErex4vn7l3lNP=
gniiMp%2BKb3SpOHQo2QLAndxDQ%3D&amp;reserved=3D0
> >>>>
> >>>
> >>> Yes, that is correct. the uevent for devcoredump is from device_add()
> >>>
> >> Yes, I could confirm in the code that device_add() sends a uevent.
> >>
> >> kobject_uevent(&dev->kobj, KOBJ_ADD);
> >>
> >> I was trying to map the ChromiumOs's udev event rules with the event
> >> being sent from device_add(), what I could see is there is only one ud=
ev
> >> rule for any DRM subsystem events in ChromiumOs's 99-crash-reporter.ru=
les:
> >>
> >> ACTION=3D=3D"change", SUBSYSTEM=3D=3D"drm", KERNEL=3D=3D"card0", ENV{E=
RROR}=3D=3D"1", \
> >>     RUN+=3D"/sbin/crash_reporter
> >> --udev=3DKERNEL=3Dcard0:SUBSYSTEM=3Ddrm:ACTION=3Dchange"
> >>
> >> Can someone confirm that this is the rule which gets triggered when a
> >> devcoredump is generated ? I could not find an ERROR=3D1 string in the
> >> env[] while sending this event from dev_add();
> >
> > I think it is actually this rule:
> >
> > ACTION=3D=3D"add", SUBSYSTEM=3D=3D"devcoredump", \
> >    RUN+=3D"/sbin/crash_reporter
> > --udev=3DSUBSYSTEM=3Ddevcoredump:ACTION=3Dadd:KERNEL_NUMBER=3D%n"
> >
> > It is something non-drm specific because it supports devcore dumps
> > from non drm drivers.  I know at least some of the wifi and remoteproc
> > drivers use it.
> >
>
> Ah, this seems like a problem for me. I understand it will work for a
> reset/recovery app well, but if a DRM client (like a compositor), who
> wants to listen only to DRM events (like a GPU reset), wouldn't this
> create a lot of noise for it ? Like every time any subsystem produces
> this coredump, there will be a change in devcoresump subsystem, and the
> client will have to parse the core file, and then will have to decide if
> it wants to react to this, or ignore.
>
> Wouldn't a GPU reset event, specific to DRM subsystem server better in
> such case ?
>

So, I suppose there are two different use-cases.. for something like
distro which has generic crash telemetry (ie. when users opt in to
automated crash reporting), and in general for debugging gpu crashes,
you want devcoredump, preferably with plenty of information about gpu
state, etc, so you actually have a chance of debugging problems you
can't necessarily reproduce locally.  Note also that mesa CI has some
limited support for collecting devcore dumps if a CI run triggers a
GPU fault.

For something like just notifying a compositor that a gpu crash
happened, perhaps drm_event is more suitable.  See
virtio_gpu_fence_event_create() for an example of adding new event
types.  Although maybe you want it to be an event which is not device
specific.  This isn't so much of a debugging use-case as simply
notification.

BR,
-R
