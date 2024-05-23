Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186488CD81C
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 18:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB96110E8F5;
	Thu, 23 May 2024 16:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KTNCRGt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0162310E152;
 Thu, 23 May 2024 13:13:40 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-6f7c72c911cso343966a34.1; 
 Thu, 23 May 2024 06:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716470020; x=1717074820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DuFsS8GdnnXIhSHY7dY+EPeNLswZqMiHIhWn3gMt67g=;
 b=KTNCRGt1STOgbTdmfjZdZsXhFlp7kXF+m6JypP9fXu1RSv+jVGoMCZxOLQhsXe0M/q
 MlYYTaNUHt79LhEcKsZn7t1PGIjRd2VzeJCzb4lsgR0WTYfIlrWUdrUcIppHR5Vdr1AB
 P1wI8xnDDEuTVmDiDsgZd9C3BH9JUrvaeqxRvQq+A1dEbXErhXX1FbM/H01nupkkvDNL
 mqmBny5TH9oezcv5uQu1UycoFM3Gv5oMa7SgohgvAHpmm9A0htL4rtp9XlUX9ICY7yqY
 H6y4Cef6ig9LUOi1zbotI7B0H6xQuYeZm63p1Ey35HKd8EeQ1CVJFJQ5dht0aeKG6Xew
 xjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716470020; x=1717074820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DuFsS8GdnnXIhSHY7dY+EPeNLswZqMiHIhWn3gMt67g=;
 b=gedhYJaCb1BuPgr7yn1TnJO8EpdHHC3FUd0SPt2BGG+3CmtIIeRD9OUSbOT+g5+y39
 IP9TT1NgiAKvhGbibzccA4/wt5Xyf9pFmRlhmgQQuHjALAIixxi1HKBDzbYeHpzh4zDV
 Itw65hNeacGMHH4GnVp8pief4iWhutzpI4qvMuzhBLgPspPJOV8quPUPKGB4Ns62FOw1
 7a7pYhBDXYd5+zCWHO34cSiTqcVP74W62hmO6PZlG9oIziqycKVkfcscvF/8N1geaeeh
 NubwjpVN7F3QrCjnSMehDOqKPC99ovw5W7+qQ2sJHQ69KfYsDusnrtkNTdBstNtwgNfb
 IzGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRmbXLiwhVpo8DKPZU7hpyEebwvHnUMPOb+6uvqE7kIrAOQbSIjXQG45KJdy/K+5ur92yp513Rf99I09mUAvTEycXyzwLK2cA24zhIR2DdXZ+vrRcPnZTuxfEMiDGjG8r8Cj+2JD0m41Ur1LShkg==
X-Gm-Message-State: AOJu0Ywpn6hW/DIpARiQIPbYy9oKaYMRQyEm5qAAQrxNe4g3blo7ayWY
 8+2nKIqz6WDYdEVdpd0WI8PXMIiQFZa68jpynxc3jRUFksevvZQpIk1KXL4RgFE5G2whjJ3z0+2
 69/QLt7KIE4S6w3FSeeGPrZZdLwU=
X-Google-Smtp-Source: AGHT+IGRhta+SA/s0PCzE5m8Z0yR+DdcmEeNX+ioAIHw6X3jIv1r+LveP8GfyyN5Og7gteF+P980ED8OOqEoIZkVTfA=
X-Received: by 2002:a9d:5c09:0:b0:6f1:2103:cd52 with SMTP id
 46e09a7af769-6f7d5fb7e43mr876326a34.15.1716470019586; Thu, 23 May 2024
 06:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <CABWT5yiejGABNXicsS7u-daKnBBjK6YTDVgaQOqwGYn8P20D8Q@mail.gmail.com>
 <6580c2d4-b084-470f-80a0-aa09f1ab880d@gmx.de>
 <CABWT5yiD110qmJcRsoGVMevULAVmYpyiW4w9MtmNjp7E0rDQ8A@mail.gmail.com>
 <CABWT5yg5jG7eMiDp7QN2yhFj6983qF9zN7eHOprH4eEjwQJLBQ@mail.gmail.com>
 <c3205455-7ad2-487e-8954-52102754e154@gmx.de>
 <CADnq5_PM_FuBE4913Z4bxiMTDYtRS+VJgLW6gfDU1qnQQ=FDzA@mail.gmail.com>
 <d04105ea-0f8a-4f0b-b4f2-bc8407d37c73@gmx.de>
In-Reply-To: <d04105ea-0f8a-4f0b-b4f2-bc8407d37c73@gmx.de>
From: Barry Kauler <bkauler@gmail.com>
Date: Thu, 23 May 2024 21:13:00 +0800
Message-ID: <CABWT5yibc52CTUWeCWxYQb4ooi4dsbvBWxJAJCDrG+8405RPTg@mail.gmail.com>
Subject: Re: Kernel 5.15.150 black screen with AMD Raven/Picasso GPU
To: Armin Wolf <W_Armin@gmx.de>
Cc: Alex Deucher <alexdeucher@gmail.com>, Yifan Zhang <yifan1.zhang@amd.com>, 
 Prike Liang <Prike.Liang@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 23 May 2024 16:10:21 +0000
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

On Wed, May 22, 2024 at 12:58=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 20.05.24 um 18:22 schrieb Alex Deucher:
>
> > On Sat, May 18, 2024 at 8:17=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wro=
te:
> >> Am 17.05.24 um 03:30 schrieb Barry Kauler:
> >>
> >>> Armin, Yifan, Prike,
> >>> I will top-post, so you don't have to scroll down.
> >>> After identifying the commit that causes black screen with my gpu, I
> >>> posted the result to you guys, on May 9.
> >>> It is now May 17 and no reply.
> >>> OK, I have now created a patch that reverts Yifan's commit, compiled
> >>> 5.15.158, and my gpu now works.
> >>> Note, the radeon module is not loaded, so it is not a factor.
> >>> I'm not a kernel developer. I have identified the culprit and it is u=
p
> >>> to you guys to fix it, Yifan especially, as you are the person who ha=
s
> >>> created the regression.
> >>> I will attach my patch.
> >>> Regards,
> >>> Barry Kauler
> >> Hi,
> >>
> >> sorry for not responding to your findings. I normally do not work with=
 GPU drivers,
> >> so i hoped one of the amdgpu developers would handle this.
> >>
> >> I CCeddri-devel@lists.freedesktop.org  and amd-gfx@lists.freedesktop.o=
rg so that other
> >> amdgpu developers hear from this issue.
> >>
> >> Thanks you for you persistence in finding the offending commit.
> > Likely this patch should not have been ported to 5.15 in the first
> > place.  The IOMMU requirements have been dropped from the driver for
> > the last few kernel versions so it is no longer relevant on newer
> > kernels.
> >
> > Alex
>
> Barry, can you verify that the latest upstream kernel works on you device=
?
> If yes, then the commit itself is ok and just the backporting itself was =
wrong.
>
> Thanks,
> Armin Wolf

Armin,
The unmodified 6.8.1 kernel works ok.
I presume that patch was applied long before 6.8.1 got released and
only got backported to 5.15.x recently.

Regards,
Barry


> >> Armin Wolf
> >>
> >>> On Thu, May 9, 2024 at 4:08=E2=80=AFPM Barry Kauler <bkauler@gmail.co=
m> wrote:
> >>>> On Fri, May 3, 2024 at 9:03=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> w=
rote:
> >>>>>> ...
> >>>>>> # lspci | grep VGA
> >>>>>> 05:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> >>>>>> [AMD/ATI] Picasso/Raven 2 [Radeon Vega Series / Radeon Vega Mobile
> >>>>>> Series] (rev c2)
> >>>>>> 05:00.7 Non-VGA unclassified device: Advanced Micro Devices, Inc.
> >>>>>> [AMD] Raven/Raven2/Renoir Non-Sensor Fusion Hub KMDF driver
> >>>>>>
> >>>>>> # lspci -n -k
> >>>>>> ...
> >>>>>> 05:00.0 0300: 1002:15d8 (rev c2)
> >>>>>> Subsystem: 1025:1456
> >>>>>> Kernel driver in use: amdgpu
> >>>>>> Kernel modules: amdgpu
> >>>>>> ...
> >>>>> thanks for informing us of this regression. Since there are four co=
mmits affecting
> >>>>> amdgpu in 5.15.150, i suggest that you use "git bisect" to find the=
 faulty commits,
> >>>>> see https://docs.kernel.org/admin-guide/bug-bisect.html for details=
.
> >>>>>
> >>>>> I think you can speed up the bisecting process by limiting yourself=
 to the AMD DRM
> >>>>> driver directory with "git bisect start -- drivers/gpu/drm/amd", ta=
ke a look at the
> >>>>> man page of "git bisect" for details.
> >>>>>
> >>>>> Thanks,
> >>>>> Armin Wolf
> >>>> Armin,
> >>>> Thanks for the advice. I am unfamiliar with git on the commandline.
> >>>> Previously only used SmartGit gui.
> >>>> EasyOS requires aufs patch, and for a few days tried to figure out h=
ow
> >>>> to use that with git bisect, then gave up. Changed to testing with m=
y
> >>>> "QV" distro, which is more conventional, doesn't need any kernel
> >>>> patches. Managed to get it down to one commit. Here are the steps I
> >>>> followed:
> >>>>
> >>>> # git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/lin=
ux-stable.git
> >>>> # cd linux-stable
> >>>> # git tag -l | grep '5\.15\.150'
> >>>> v5.15.150
> >>>> # git checkout -b my5.15.150 v5.15.150
> >>>> Updating files: 100% (65776/65776), done.
> >>>> Switched to a new branch 'my5.15.150'
> >>>>
> >>>> Copied in my .config then...
> >>>>
> >>>> # make menuconfig
> >>>> # git bisect start -- drivers/gpu/drm/amd
> >>>> # git bisect bad
> >>>> # git bisect good v5.15.149
> >>>> Bisecting: 1 revision left to test after this (roughly 1 step)
> >>>> [b9a61ee2bb2704e42516e3da962f99dfa98f3b20] drm/amdgpu: reset gpu for
> >>>> s3 suspend abort case
> >>>> # make
> >>>> # rm -rf /boot2
> >>>> # mkdir -p /boot2/lib/modules
> >>>> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_insta=
ll
> >>>> # cp arch/x86/boot/bzImage /boot2/vmlinuz
> >>>> # sync
> >>>> ...QV on Acer laptop, with amdgpu, works!
> >>>> # git bisect good
> >>>> Bisecting: 0 revisions left to test after this (roughly 0 steps)
> >>>> [56b522f4668167096a50c39446d6263c96219f5f] drm/amdgpu: init iommu
> >>>> after amdkfd device init
> >>>> # make
> >>>> # mkdir -p /boot2/lib/modules
> >>>> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_insta=
ll
> >>>> # cp arch/x86/boot/bzImage /boot2/vmlinuz
> >>>> # sync
> >>>> ...QV on Acer laptop, black screen!
> >>>>
> >>>> # git bisect bad
> >>>> 56b522f4668167096a50c39446d6263c96219f5f is the first bad commit
> >>>> commit 56b522f4668167096a50c39446d6263c96219f5f
> >>>> Author: Yifan Zhang <yifan1.zhang@amd.com>
> >>>> Date:   Tue Sep 28 15:42:35 2021 +0800
> >>>>
> >>>>       drm/amdgpu: init iommu after amdkfd device init
> >>>>
> >>>>       [ Upstream commit 286826d7d976e7646b09149d9bc2899d74ff962b ]
> >>>>
> >>>>       This patch is to fix clinfo failure in Raven/Picasso:
> >>>>
> >>>>       Number of platforms: 1
> >>>>         Platform Profile: FULL_PROFILE
> >>>>         Platform Version: OpenCL 2.2 AMD-APP (3364.0)
> >>>>         Platform Name: AMD Accelerated Parallel Processing
> >>>>         Platform Vendor: Advanced Micro Devices, Inc.
> >>>>         Platform Extensions: cl_khr_icd cl_amd_event_callback
> >>>>
> >>>>         Platform Name: AMD Accelerated Parallel Processing Number of=
 devices: 0
> >>>>
> >>>>       Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
> >>>>       Reviewed-by: James Zhu <James.Zhu@amd.com>
> >>>>       Tested-by: James Zhu <James.Zhu@amd.com>
> >>>>       Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >>>>       Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>>>       Signed-off-by: Sasha Levin <sashal@kernel.org>
> >>>>
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
> >>>>    1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>
> >>>> Anything else I should do, to identify what in this commit is the
> >>>> likely culprit?
> >>>> Regards,
> >>>> Barry Kauler
