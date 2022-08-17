Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6287259684E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 06:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7765610E60D;
	Wed, 17 Aug 2022 04:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FF210E60D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 04:52:44 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3321c2a8d4cso150161767b3.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 21:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=P+P7U2dHcH7HvKdIM34nR5zTB1057uLXCO9nJeUpApE=;
 b=mInliz2MDp3Y2l0zLTVTwFKtILUmFyBlHw3FlaOd6SS7mQ5Eb2y2m04Jw/NqPlQreV
 g5xXktTWhDRD4/VNBp1yizy48nHp/Vok2EuGpI/ddA62h3Sb122HX6Qtf+OP5y1gq3/O
 vo+k/SGsKTuT43xLS5sIT3ECxsBSl1tuT57awW6MoNe2A/poRkUozM+mw4UMv/9UZ3Gh
 JZNp77vAcNzp/IknxliP1A0kf1ShqGpCBiVQUrZLstDWp+N/6KuDVKEEtCSzFChEDE76
 3ayfxifKTcpccrmxNEZvLX52svkIq5YJ9p7sSTjS8H1T4HpoCbd9+jiNVMC7/10ObMPI
 AzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=P+P7U2dHcH7HvKdIM34nR5zTB1057uLXCO9nJeUpApE=;
 b=Ngk9/hjTobEtx5WVOZmZl167gHD0aoRJKcm5z4IGu2dci3DdeX1JR6sUyOSc0+CT5n
 XWqoGf9kyObIEzma7kh0vEyXj4yafe02/XhNpunXpbdCvTGVoxSStGrUbGsxBgke/1c8
 oCJpkSSyrvF/znKy1Z3c09TeSYt7q2m1WZQY0aN1ExstUN6XlEFPCSiHwLRuM0hCEjS1
 jjxAXBgdIhZzlUF7XmDR+BEkz2Ail/8mz/HCdsuIJtBsEexXMDxtHlkG5LT/Haml34aj
 uPTil+/FY9C5+3JOfq/+Z4tjdv7C9eULx5nRZ48IBohLt1Pzto1vbp6ipz0XNEVjVDJm
 5Hzg==
X-Gm-Message-State: ACgBeo2bRAy5hY3VztUi1bAYPtzB46+zE9VG+T1L84nhR9AjHdmGr94p
 WZ4zgBHjTdtl0fXmbBaJZ9VaxKoAcXbvn/IE6SoKgg==
X-Google-Smtp-Source: AA6agR4n9oAPiASwsUuBj7VCDanSfJyRQbFukds9m7aRqQZqh5v6CSqLW42Mr30/VlqZmXCPVbQX4WEOqI6qpJpB2kE=
X-Received: by 2002:a25:2b01:0:b0:68a:6dff:4a87 with SMTP id
 r1-20020a252b01000000b0068a6dff4a87mr7229961ybr.364.1660711963618; Tue, 16
 Aug 2022 21:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com>
 <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
 <CAMSo37XdZSZUHLWJj373DdtOBA9=uD8SJ7ywWCYF2pU1i4cB_g@mail.gmail.com>
 <ed4fe238-4fcd-1253-658f-18fe1e1f13b0@gmail.com>
 <CAMSo37V3U5nYng77jzSnKH73CTLhGYQJu11Q5wRt289se5nFJw@mail.gmail.com>
 <4128aed0-211a-d12a-6a86-deb4457d39f7@gmail.com>
In-Reply-To: <4128aed0-211a-d12a-6a86-deb4457d39f7@gmail.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Wed, 17 Aug 2022 12:52:32 +0800
Message-ID: <CAMSo37W-DePLDP=zk-nY6FGcZuk0QzHj4=usrieyV0TNcNfbXw@mail.gmail.com>
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

On Mon, 15 Aug 2022 at 14:23, Ivaylo Dimitrov
<ivo.g.dimitrov.75@gmail.com> wrote:
>
> Hi Liu,
>
> On 14.08.22 =D0=B3. 17:27 =D1=87., Yongqin Liu wrote:
> > Hi, IvayIo
> >
> > Thanks very much for the reply!
> >
> > On Sat, 13 Aug 2022 at 14:58, Ivaylo Dimitrov
> > <ivo.g.dimitrov.75@gmail.com> wrote:
> >>
> >> Hi Liu,
> >>
> >> On 12.08.22 =D0=B3. 7:35 =D1=87., Yongqin Liu wrote:
> >>> Hi, Ivaylo, Tomi
> >>>
> >>> We have one X15 Android AOSP master build, it could not have the home
> >>> screen displayed
> >>> on the hdmi monitor connected with this change, with the following
> >>> message printed on the serial console
> >>>       [  607.404205] omapdrm omapdrm.0: Failed to setup plane plane-0
> >>>       [  607.410522] omapdrm omapdrm.0: Failed to setup plane plane-1
> >>>       [  607.416381] omapdrm omapdrm.0: Failed to setup plane plane-2
> >>>       [  607.422088] omapdrm omapdrm.0: Failed to setup plane plane-3
> >>>
> >>>      # for details, please check the link here: http://ix.io/47m1
> >>>
> >>> It will work with home screen displayed on the hdmi monitor if this
> >>> change is reverted.
> >>>
> >>> Is this the broken problem you talked about here?
> >>>
> >>> And could you please give some suggestions on how to have the x15
> >>> Android build work with this change?
> >>>
> >>
> >> Make sure scanout (i.e. those to be displayed) buffers are actually
> >> allocated as such - OMAP_BO_SCANOUT flag must be set when calling
> >> omap_bo_new().
> >
> > I am not familiar with this area, I am sorry if I asked quite silly que=
stions:(
> > I googled omap_bo_new, and found it's a function of libdrm here[1], is
> > it what you meant here?
> >
>
> Yes, calling this function from userspace ends in kernel code the
> $subject patch is part of.
>
> > If it's the omap_bo_new that we should pass OMAP_BO_SCANOUT when it is =
called,
> > then is it the correct way to update omap_bo_new to add the OMAP_BO_SCA=
NOUT flag
> > before it calls omap_bo_new_impl?
> >
>
> omap_bo_new() is fine and does not need any updates/fixes, it is the
> code that uses it (whoever it is, I am not familiar with the userspace
> you are using) that shall pass correct flags (third parameter) when
> calling it.

Sorry, I do not get the point here.
Like you said, the code that calls omap_bo_new needs to pass OMAP_BO_SCANOU=
T,
then IMO omap_bo_new should be the best place to add the OMAP_BO_SCANOUT fl=
ag,
(like via flags =3D flags | OMAP_BO_SCANOUT), that could help avoid
missing the flag by some code,
and also avoids hacks/changes on the possible blob binaries.

Do I misunderstand somewhere?
Or is there some case that OMAP_BO_SCANOUT shouldn't be passed when
omap_bo_new is called?

> BTW you shall really find who and how uses OMAP BO API, in theory it
> might use ioctls directly and not call omap_bo_xxx functions.

Do you mean the DRM_OMAP_GEM_NEW ioctl api?
There is no place in the AOSP tree to call that except the
omap_bo_new_impl function,
which is called by the omap_bo_new and omap_bo_new_tiled functions.
The omap_bo_new should not be called with the OMAP_BO_TILED flag,
while the omap_bo_new_tiled should be called with the OMAP_BO_TILED flag

Regarding to the omap_bo_new function, there are 2 places call it in
the AOSP tree:
#1 ./external/libkmsxx/kms++/src/omap/omapframebuffer.cpp
#2 ./device/ti/beagle_x15/gpu/gralloc.am57x.so

#1 seems not used in AOSP yet, and #2 is one blob binary we do not
have the source for.

> strace
> would be your friend there. or gdb, or whatever tools are used on
> android. Or put some printfs() in omap_bo_new() that output the PID of
> the calling process, etc.

Thanks a lot for these great suggestions! Will use them when possible.

> > And another question is that, since the userspace(libdrm) will be used
> > to work with different kernel versions,
> > like the old 4.14, 4.19, etc, do you think there will be problem to
> > pass  OMAP_BO_SCANOUT
> > from the userspace side with the old kernels(which does not have this c=
hange)?
> > does this change need to be backported to the old kernel versions?
>
> There should not be any issue. The changes could be backported if one
> hits the issues this $series is fixing, but there is no need.

Thanks for the confirmation!
I just boot-tested with adding OMAP_BO_SCANOUT in the omap_bo_new function,
and it worked with the current 4.14, 4.19, and the mainline kernels.
# via adding line "flags =3D flags | OMAP_BO_SCANOUT" in the omap_bo_new fu=
nction.

> >
> > And the last question is that, omap_bo_new might be called by some
> > property binaries what not everyone
> > could get the source to update, for such case what's your suggestions?
> >
>
> Hard to say without knowing what that library would be.
>
> When I hit issues with closed blobs, sometimes I reverse-engineer them
> to fix the issue, example:
>
> https://github.com/maemo-leste/sgx-ddk-um/tree/master/dbm
>
> This is REed libdbm from sgx-ddk-um 1.17.4948957, that is responsible
> for allocating BOs (what omap_bo_new() does) but it uses DUMB buffers
> API, instead of OMAP BO API.
>
> I guess you are using some older version of sgx-ddk-um, so you may fix
> in similar way. Or binary patch.

The blob binary that calls omap_bo_new is the gralloc.am57x.so here[2]:
any suggestions with it?
# sorry, I am not able to find out how you did the reverse-engineer
work# with the dbm repository shared here,
# not sure if you could give some tutorial steps for the similar
reverse-engineer# work with gralloc.am57x.so

[2]: https://android.googlesource.com/device/ti/beagle-x15/+/refs/heads/mas=
ter/gpu/gralloc.am57x.so

Thanks,
Yongqin Liu

> >>> On Thu, 17 Feb 2022 at 23:29, Ivaylo Dimitrov
> >>> <ivo.g.dimitrov.75@gmail.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 17.02.22 =D0=B3. 14:46 =D1=87., Tomi Valkeinen wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
> >>>>>> On devices with DMM, all allocations are done through either DMM o=
r
> >>>>>> TILER.
> >>>>>> DMM/TILER being a limited resource means that such allocations wil=
l start
> >>>>>> to fail before actual free memory is exhausted. What is even worse=
 is
> >>>>>> that
> >>>>>> with time DMM/TILER space gets fragmented to the point that even i=
f we
> >>>>>> have
> >>>>>> enough free DMM/TILER space and free memory, allocation fails beca=
use
> >>>>>> there
> >>>>>> is no big enough free block in DMM/TILER space.
> >>>>>>
> >>>>>> Such failures can be easily observed with OMAP xorg DDX, for examp=
le -
> >>>>>> starting few GUI applications (so buffers for their windows are
> >>>>>> allocated)
> >>>>>> and then rotating landscape<->portrait while closing and opening n=
ew
> >>>>>> windows soon results in allocation failures.
> >>>>>>
> >>>>>> Fix that by mapping buffers through DMM/TILER only when really nee=
ded,
> >>>>>> like, for scanout buffers.
> >>>>>
> >>>>> Doesn't this break users that get a buffer from omapdrm and expect =
it to
> >>>>> be contiguous?
> >>>>>
> >>>>
> >>>> If you mean dumb buffer, then no, this does not break users as dumb
> >>>> buffers are allocated as scanout:
> >>>>
> >>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapd=
rm/omap_gem.c#L603
> >>>>
> >>>> If you mean omap_bo allocated buffers, then if users want
> >>>> linear(scanout) buffer, then they request it explicitly by passing
> >>>> OMAP_BO_SCANOUT.
> >>>>
> >>>> Ivo
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
