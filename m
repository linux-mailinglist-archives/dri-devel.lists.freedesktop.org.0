Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4ED5A4128
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 04:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7729210E59B;
	Mon, 29 Aug 2022 02:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26C210E59B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 02:52:07 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id h21so5269031qta.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 19:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=9A9d+kjKzQrIuZeq43F9YxyBAj0VkrD0OuLQjZxap04=;
 b=td3+O5C9ZMiDSzXospbMqyZUe83lYxnUeOUNnb+OeW85Zv/SAvJ9DhwH2VoUDzZCHi
 bbDCjNRE+o9qqZBpdsYBwBIU5vtBiPG+cfxHYgWcwc4H5RtErkBdla8W/5Zb15ovS7ph
 rinD69hVyNwGA/5BKWFt/I9JQMsc1iJHlmiKA+7/r0J+nq7pZvF5jmWkwwEY9QrsYjgO
 tA6N/vT9e5DydpXKV39D9OLN4qfbFW3SIqbysbLAWV2bEi27e7gBxl5e8jMEdMNS/ScN
 DbPbQg+EvZWJGIPQAipSPwUqx1hvbDZY7QUD/QPwwlzxaPXQV+/INcWWIWbndJIPFV0d
 mZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=9A9d+kjKzQrIuZeq43F9YxyBAj0VkrD0OuLQjZxap04=;
 b=cZLgpvXff8isayvdsXpINgYjkXTBRyG//Hsurof/FWtla0zruNZ0bqhqXR2dahHZ0a
 9Y6Q/KPmRDaJgSAw8MPqTaD6adJNcolKvF+otNT9rPwlNEzd+E/Iz9gKxniUT6aJUyql
 nSWosB9lazOfsyj5GtrNhNRaSf1SXBM8vubbGVX7mNUVYfa9v74cSI2kpPiwR1T2JQmO
 PT7IgokRRwVDppqFDqQf6UlXQeKx82c1R7zR3Hr7HY9FVixwVTjgD1h7921shsLC8vQy
 4bY+U8fVMIhN6LTZ54m+POno8nh3GHI6wIRAPBOP/73MFogBHZWyXC1l6Xr8+1v3z27P
 M2CA==
X-Gm-Message-State: ACgBeo2eACQuSiCX7jJh7ZT3dMxdPAC/hqfL4SN8mBk5FiYSMRBwhPrG
 GEQxKiWJW2t+ACcHTDlETfgMnIOCcgO5GY86M8aS7Q==
X-Google-Smtp-Source: AA6agR7XavECSkvuJMssdWeIzXJNqkAGd5KrW+aemYAFylZA79LNRNzeSuUkRnOT0SfiBiCZeloIME0IK3e9TQcEqOs=
X-Received: by 2002:ac8:5c4f:0:b0:344:6df6:a237 with SMTP id
 j15-20020ac85c4f000000b003446df6a237mr8560766qtj.242.1661741526759; Sun, 28
 Aug 2022 19:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com>
 <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
 <CAMSo37XdZSZUHLWJj373DdtOBA9=uD8SJ7ywWCYF2pU1i4cB_g@mail.gmail.com>
 <ed4fe238-4fcd-1253-658f-18fe1e1f13b0@gmail.com>
 <CAMSo37V3U5nYng77jzSnKH73CTLhGYQJu11Q5wRt289se5nFJw@mail.gmail.com>
 <4128aed0-211a-d12a-6a86-deb4457d39f7@gmail.com>
 <CAMSo37W-DePLDP=zk-nY6FGcZuk0QzHj4=usrieyV0TNcNfbXw@mail.gmail.com>
 <da2a661e-9da0-850c-3067-8c1e8d5531bc@gmail.com>
In-Reply-To: <da2a661e-9da0-850c-3067-8c1e8d5531bc@gmail.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Mon, 29 Aug 2022 10:51:55 +0800
Message-ID: <CAMSo37VXNQeR0qZgzZONBwp_4z9CuUSJJJzhM7k+K39BcwvW6A@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
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
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, tomba@kernel.org, airlied@linux.ie,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tony@atomide.com, linux-omap@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Ivaylo

Sorry for the late response, and Thanks very much for the detailed explanat=
ions!

On Thu, 18 Aug 2022 at 18:23, Ivaylo Dimitrov
<ivo.g.dimitrov.75@gmail.com> wrote:
>
> Hi,
>
> On 17.08.22 =D0=B3. 7:52 =D1=87., Yongqin Liu wrote:
> > Hi, Ivaylo
> >
> > On Mon, 15 Aug 2022 at 14:23, Ivaylo Dimitrov
> > <ivo.g.dimitrov.75@gmail.com> wrote:
> >>
> >> Hi Liu,
> >>
> >> On 14.08.22 =D0=B3. 17:27 =D1=87., Yongqin Liu wrote:
> >>> Hi, IvayIo
> >>>
> >>> Thanks very much for the reply!
> >>>
> >>> On Sat, 13 Aug 2022 at 14:58, Ivaylo Dimitrov
> >>> <ivo.g.dimitrov.75@gmail.com> wrote:
> >>>>
> >>>> Hi Liu,
> >>>>
> >>>> On 12.08.22 =D0=B3. 7:35 =D1=87., Yongqin Liu wrote:
> >>>>> Hi, Ivaylo, Tomi
> >>>>>
> >>>>> We have one X15 Android AOSP master build, it could not have the ho=
me
> >>>>> screen displayed
> >>>>> on the hdmi monitor connected with this change, with the following
> >>>>> message printed on the serial console
> >>>>>        [  607.404205] omapdrm omapdrm.0: Failed to setup plane plan=
e-0
> >>>>>        [  607.410522] omapdrm omapdrm.0: Failed to setup plane plan=
e-1
> >>>>>        [  607.416381] omapdrm omapdrm.0: Failed to setup plane plan=
e-2
> >>>>>        [  607.422088] omapdrm omapdrm.0: Failed to setup plane plan=
e-3
> >>>>>
> >>>>>       # for details, please check the link here: http://ix.io/47m1
> >>>>>
> >>>>> It will work with home screen displayed on the hdmi monitor if this
> >>>>> change is reverted.
> >>>>>
> >>>>> Is this the broken problem you talked about here?
> >>>>>
> >>>>> And could you please give some suggestions on how to have the x15
> >>>>> Android build work with this change?
> >>>>>
> >>>>
> >>>> Make sure scanout (i.e. those to be displayed) buffers are actually
> >>>> allocated as such - OMAP_BO_SCANOUT flag must be set when calling
> >>>> omap_bo_new().
> >>>
> >>> I am not familiar with this area, I am sorry if I asked quite silly q=
uestions:(
> >>> I googled omap_bo_new, and found it's a function of libdrm here[1], i=
s
> >>> it what you meant here?
> >>>
> >>
> >> Yes, calling this function from userspace ends in kernel code the
> >> $subject patch is part of.
> >>
> >>> If it's the omap_bo_new that we should pass OMAP_BO_SCANOUT when it i=
s called,
> >>> then is it the correct way to update omap_bo_new to add the OMAP_BO_S=
CANOUT flag
> >>> before it calls omap_bo_new_impl?
> >>>
> >>
> >> omap_bo_new() is fine and does not need any updates/fixes, it is the
> >> code that uses it (whoever it is, I am not familiar with the userspace
> >> you are using) that shall pass correct flags (third parameter) when
> >> calling it.
> >
> > Sorry, I do not get the point here.
> > Like you said, the code that calls omap_bo_new needs to pass OMAP_BO_SC=
ANOUT,
> > then IMO omap_bo_new should be the best place to add the OMAP_BO_SCANOU=
T flag,
> > (like via flags =3D flags | OMAP_BO_SCANOUT), that could help avoid
> > missing the flag by some code,
> > and also avoids hacks/changes on the possible blob binaries.
> >
> > Do I misunderstand somewhere?
> > Or is there some case that OMAP_BO_SCANOUT shouldn't be passed when
> > omap_bo_new is called?
> >
>
> Exactly. You need to pass OMAP_BO_SCANOUT only when you want your
> buffers to be 'scanout' buffers(i.e. buffers that can be displayed on
> screen), which is not always the case - there is no need offscreen
> buffers or pixmaps to be scanout capable, for example. There are more
> cases like that.
>
> The problem is that scanout buffer on OMAP4 allocate additional
> resources in DMM/TILER (a piece of hardware) and those resources are
> limited. Not only that, but DMM/TILER memory space eventually gets
> fragmented over time (if you have lots of allocataoins/deallocations)
> and you will start getting ENOMEM (or similar) errors.
>
> Ofc, in your particular use case you may never hit such issues.

Thanks, I understand the cases now.


> >> BTW you shall really find who and how uses OMAP BO API, in theory it
> >> might use ioctls directly and not call omap_bo_xxx functions.
> >
> > Do you mean the DRM_OMAP_GEM_NEW ioctl api?
> > There is no place in the AOSP tree to call that except the
> > omap_bo_new_impl function,
> > which is called by the omap_bo_new and omap_bo_new_tiled functions.
> > The omap_bo_new should not be called with the OMAP_BO_TILED flag,
> > while the omap_bo_new_tiled should be called with the OMAP_BO_TILED fla=
g
> >
> > Regarding to the omap_bo_new function, there are 2 places call it in
> > the AOSP tree:
> > #1 ./external/libkmsxx/kms++/src/omap/omapframebuffer.cpp
> > #2 ./device/ti/beagle_x15/gpu/gralloc.am57x.so
> >
> > #1 seems not used in AOSP yet, and #2 is one blob binary we do not
> > have the source for.
> >
>
> I would bet on gralloc.am57x.so.
yeah, that's my guess as well.

> >> strace
> >> would be your friend there. or gdb, or whatever tools are used on
> >> android. Or put some printfs() in omap_bo_new() that output the PID of
> >> the calling process, etc.
> >
> > Thanks a lot for these great suggestions! Will use them when possible.
> >
> >>> And another question is that, since the userspace(libdrm) will be use=
d
> >>> to work with different kernel versions,
> >>> like the old 4.14, 4.19, etc, do you think there will be problem to
> >>> pass  OMAP_BO_SCANOUT
> >>> from the userspace side with the old kernels(which does not have this=
 change)?
> >>> does this change need to be backported to the old kernel versions?
> >>
> >> There should not be any issue. The changes could be backported if one
> >> hits the issues this $series is fixing, but there is no need.
> >
> > Thanks for the confirmation!
> > I just boot-tested with adding OMAP_BO_SCANOUT in the omap_bo_new funct=
ion,
> > and it worked with the current 4.14, 4.19, and the mainline kernels.
> > # via adding line "flags =3D flags | OMAP_BO_SCANOUT" in the omap_bo_ne=
w function.
> >
>
> sure, the point is that with this change *every* BO will be allocated as
> scanout BO, potentially leading to the above explained issues.

get it.

> >>>
> >>> And the last question is that, omap_bo_new might be called by some
> >>> property binaries what not everyone
> >>> could get the source to update, for such case what's your suggestions=
?
> >>>
> >>
> >> Hard to say without knowing what that library would be.
> >>
> >> When I hit issues with closed blobs, sometimes I reverse-engineer them
> >> to fix the issue, example:
> >>
> >> https://github.com/maemo-leste/sgx-ddk-um/tree/master/dbm
> >>
> >> This is REed libdbm from sgx-ddk-um 1.17.4948957, that is responsible
> >> for allocating BOs (what omap_bo_new() does) but it uses DUMB buffers
> >> API, instead of OMAP BO API.
> >>
> >> I guess you are using some older version of sgx-ddk-um, so you may fix
> >> in similar way. Or binary patch.
> >
> > The blob binary that calls omap_bo_new is the gralloc.am57x.so here[2]:
> > any suggestions with it?
> > # sorry, I am not able to find out how you did the reverse-engineer
> > work# with the dbm repository shared here,
> > # not sure if you could give some tutorial steps for the similar
> > reverse-engineer# work with gralloc.am57x.so
> >
>
> Sorry, but it is like if you ask me to provide you with a tutorial on
> how to do brain surgery :)
>
> > [2]: https://android.googlesource.com/device/ti/beagle-x15/+/refs/heads=
/master/gpu/gralloc.am57x.so
> >
>
> I investigated this a bit and it seems it calls omap_bo_new() in a
> wrapper function like:
>
> bo =3D omap_bo_new(dev, -page_size & (size + page_size - 1), ((param5 &
> 0x800000) !=3D 0) | OMAP_BO_WC | OMAP_BO_MEM_CONTIG);
>
> Didn't investigate further what param5 is, but it controls if
> OMAP_BO_SCANOUT is passed to omap_bo_new or not.
>
> However, this library was not made with upstream kernel in mind, as
> AFAIK OMAP_BO_MEM_CONTIG never made it upstream:
>
> https://yhbt.net/lore/all/2580272.MiZDHyRxZo@avalon/T/
>
> @Tomi - any comment?
>
> So, you have couple of options:
>
> 1. Ask TI for upstream-compatible library.
check is in progress, but it would take quite a long time I guess
> 2. Try to push OMAP_BO_MEM_CONTIG patch upstream.
hmm, sounds like one impossible thing...
> 3. Modify omap_bo_new() to something like:
> .
> #define OMAP_BO_MEM_CONTIG      0x00000008      /* only use contiguous dm=
a mem */
> .
> if (flags & OMAP_BO_MEM_CONTIG)
>    flags |=3D OMAP_BO_SCANOUT;
> .
> This will not achieve exactly what OMAP_BO_MEM_CONTIG is supposed to do,
> but should make it work, at least.

This looks like the only doable thing at the moment, maybe one change
needs to be submitted to the mesa/drm repository.
I can submit a request on your #3 change to the mesa/drm repository
for discussion after some check if you do not mind.

Thanks,
Yongqin Liu

> >>>>> On Thu, 17 Feb 2022 at 23:29, Ivaylo Dimitrov
> >>>>> <ivo.g.dimitrov.75@gmail.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 17.02.22 =D0=B3. 14:46 =D1=87., Tomi Valkeinen wrote:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
> >>>>>>>> On devices with DMM, all allocations are done through either DMM=
 or
> >>>>>>>> TILER.
> >>>>>>>> DMM/TILER being a limited resource means that such allocations w=
ill start
> >>>>>>>> to fail before actual free memory is exhausted. What is even wor=
se is
> >>>>>>>> that
> >>>>>>>> with time DMM/TILER space gets fragmented to the point that even=
 if we
> >>>>>>>> have
> >>>>>>>> enough free DMM/TILER space and free memory, allocation fails be=
cause
> >>>>>>>> there
> >>>>>>>> is no big enough free block in DMM/TILER space.
> >>>>>>>>
> >>>>>>>> Such failures can be easily observed with OMAP xorg DDX, for exa=
mple -
> >>>>>>>> starting few GUI applications (so buffers for their windows are
> >>>>>>>> allocated)
> >>>>>>>> and then rotating landscape<->portrait while closing and opening=
 new
> >>>>>>>> windows soon results in allocation failures.
> >>>>>>>>
> >>>>>>>> Fix that by mapping buffers through DMM/TILER only when really n=
eeded,
> >>>>>>>> like, for scanout buffers.
> >>>>>>>
> >>>>>>> Doesn't this break users that get a buffer from omapdrm and expec=
t it to
> >>>>>>> be contiguous?
> >>>>>>>
> >>>>>>
> >>>>>> If you mean dumb buffer, then no, this does not break users as dum=
b
> >>>>>> buffers are allocated as scanout:
> >>>>>>
> >>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/oma=
pdrm/omap_gem.c#L603
> >>>>>>
> >>>>>> If you mean omap_bo allocated buffers, then if users want
> >>>>>> linear(scanout) buffer, then they request it explicitly by passing
> >>>>>> OMAP_BO_SCANOUT.
> >>>>>>
> >>>>>> Ivo
> >>>>>
> >>>>>
> >>>>>
> >>>
> >>>
> >>>
> >
> >
> >



--=20
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
