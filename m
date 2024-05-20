Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736F8CA0A3
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 18:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FDF10E264;
	Mon, 20 May 2024 16:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oh4KWGQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F0510E20E;
 Mon, 20 May 2024 16:22:32 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1ee42b97b32so80273865ad.2; 
 Mon, 20 May 2024 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716222152; x=1716826952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFBObSCpkD5nmJug3DX9VlzemVEGwRpa2+sTtc6Q7Yw=;
 b=Oh4KWGQ6JdYJoWGI3XsqzzEnJtjj2x3SuDcRagxDh5LoNGZybsFW3i7BAu1j2EKUxQ
 TUe5+eqtU7lo4Zlmcxv9oIr48mG1j4kTtuy54LxNzTHOJtkOw5uUcYALST9rY7lpG5uS
 x8sFWRv2uhkgtzotl9BPD3CJ7PFv96Gjzw7LrKYJiBK0PeImCMOcwoG6UOqwYA5BUS8F
 KGFCURWdzv1eudgOMQDVq9cM64wcY1EY08fUZK8A1KUSigccZjyquEV26tqPrdhZo8+V
 hu9CvbBYuM3ReLFtDyLL1dU0gYl0wYk7FIrbFEPfFIHgX2yXb3kar2GmgYSnkZBk577Y
 m1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716222152; x=1716826952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YFBObSCpkD5nmJug3DX9VlzemVEGwRpa2+sTtc6Q7Yw=;
 b=AubVvD5CNJYskO7elVR5u7ccHSxodheptIH8fWhebE/vR8joyWvUdTWASeV182u5Ar
 kE2D4A5DoeHsGUNeNQEqxbpMeBBMqjgc3rBbRt5Vid0MN2Em1ihcTTvTkBDyJZBA7CD0
 jJZMjb+Ywaqzpp4j8jA587Tn81rf9tsp5RPVYCWTZZ+KoO1r5dIvJBXzZmv5+6Y5sHaK
 Mic95lExwcoSgHiwnAv7K9b+8gQxvhCYlXALydlozgelPE9oq0M3fBfrT3f2cLzbHk+D
 91llHD98GSWI6ASYiwKxvt4+67lL49LVMx5KltOR3cjXVS2903tpqiqPOzhIayjtpI8z
 zxOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQpCtHmopJKDinB45XzISgTvTjPEAwINxzc8MoK0UG9MLifERU3h+clZF0rThCwAj9rOZPkI21JoEi/PLGPCU0sC9nSgGVmbMmiK2ID3wTsRCkQwDhDtEOxdWXOuEQXCZjl1dl3BcirCp0BO1KqQ==
X-Gm-Message-State: AOJu0Yzxfr9IOs2cfCheflEVe7PxymEinjxDngjDct5DybOmfrHHRn1n
 5uYc6sKSPIqGeApIxa/iThPA9gmW6fNNCUanE9xHzQDm6IXDwDWMTaKAfXNVkk7uxE7hywNpHbm
 h44iMsATdMw71Oz1nEBFa+h5Ehuc=
X-Google-Smtp-Source: AGHT+IEYd+KqC+SvEJfIHf8mSHrYmSGKwe3P41LDFPj0nBN2+quCwyA2se+yrVDrRNmIrSHeQnP95wqGNchIKoyEg0E=
X-Received: by 2002:a05:6a20:a124:b0:1a1:878d:d3f6 with SMTP id
 adf61e73a8af0-1afde0cd655mr32240161637.26.1716222152104; Mon, 20 May 2024
 09:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <CABWT5yiejGABNXicsS7u-daKnBBjK6YTDVgaQOqwGYn8P20D8Q@mail.gmail.com>
 <6580c2d4-b084-470f-80a0-aa09f1ab880d@gmx.de>
 <CABWT5yiD110qmJcRsoGVMevULAVmYpyiW4w9MtmNjp7E0rDQ8A@mail.gmail.com>
 <CABWT5yg5jG7eMiDp7QN2yhFj6983qF9zN7eHOprH4eEjwQJLBQ@mail.gmail.com>
 <c3205455-7ad2-487e-8954-52102754e154@gmx.de>
In-Reply-To: <c3205455-7ad2-487e-8954-52102754e154@gmx.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 May 2024 12:22:20 -0400
Message-ID: <CADnq5_PM_FuBE4913Z4bxiMTDYtRS+VJgLW6gfDU1qnQQ=FDzA@mail.gmail.com>
Subject: Re: Kernel 5.15.150 black screen with AMD Raven/Picasso GPU
To: Armin Wolf <W_Armin@gmx.de>
Cc: Barry Kauler <bkauler@gmail.com>, Yifan Zhang <yifan1.zhang@amd.com>, 
 Prike Liang <Prike.Liang@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org
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

On Sat, May 18, 2024 at 8:17=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 17.05.24 um 03:30 schrieb Barry Kauler:
>
> > Armin, Yifan, Prike,
> > I will top-post, so you don't have to scroll down.
> > After identifying the commit that causes black screen with my gpu, I
> > posted the result to you guys, on May 9.
> > It is now May 17 and no reply.
> > OK, I have now created a patch that reverts Yifan's commit, compiled
> > 5.15.158, and my gpu now works.
> > Note, the radeon module is not loaded, so it is not a factor.
> > I'm not a kernel developer. I have identified the culprit and it is up
> > to you guys to fix it, Yifan especially, as you are the person who has
> > created the regression.
> > I will attach my patch.
> > Regards,
> > Barry Kauler
>
> Hi,
>
> sorry for not responding to your findings. I normally do not work with GP=
U drivers,
> so i hoped one of the amdgpu developers would handle this.
>
> I CCeddri-devel@lists.freedesktop.org  and amd-gfx@lists.freedesktop.org =
so that other
> amdgpu developers hear from this issue.
>
> Thanks you for you persistence in finding the offending commit.

Likely this patch should not have been ported to 5.15 in the first
place.  The IOMMU requirements have been dropped from the driver for
the last few kernel versions so it is no longer relevant on newer
kernels.

Alex


> Armin Wolf
>
> >
> > On Thu, May 9, 2024 at 4:08=E2=80=AFPM Barry Kauler <bkauler@gmail.com>=
 wrote:
> >> On Fri, May 3, 2024 at 9:03=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wro=
te:
> >>>> ...
> >>>> # lspci | grep VGA
> >>>> 05:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> >>>> [AMD/ATI] Picasso/Raven 2 [Radeon Vega Series / Radeon Vega Mobile
> >>>> Series] (rev c2)
> >>>> 05:00.7 Non-VGA unclassified device: Advanced Micro Devices, Inc.
> >>>> [AMD] Raven/Raven2/Renoir Non-Sensor Fusion Hub KMDF driver
> >>>>
> >>>> # lspci -n -k
> >>>> ...
> >>>> 05:00.0 0300: 1002:15d8 (rev c2)
> >>>> Subsystem: 1025:1456
> >>>> Kernel driver in use: amdgpu
> >>>> Kernel modules: amdgpu
> >>>> ...
> >>> thanks for informing us of this regression. Since there are four comm=
its affecting
> >>> amdgpu in 5.15.150, i suggest that you use "git bisect" to find the f=
aulty commits,
> >>> see https://docs.kernel.org/admin-guide/bug-bisect.html for details.
> >>>
> >>> I think you can speed up the bisecting process by limiting yourself t=
o the AMD DRM
> >>> driver directory with "git bisect start -- drivers/gpu/drm/amd", take=
 a look at the
> >>> man page of "git bisect" for details.
> >>>
> >>> Thanks,
> >>> Armin Wolf
> >> Armin,
> >> Thanks for the advice. I am unfamiliar with git on the commandline.
> >> Previously only used SmartGit gui.
> >> EasyOS requires aufs patch, and for a few days tried to figure out how
> >> to use that with git bisect, then gave up. Changed to testing with my
> >> "QV" distro, which is more conventional, doesn't need any kernel
> >> patches. Managed to get it down to one commit. Here are the steps I
> >> followed:
> >>
> >> # git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
-stable.git
> >> # cd linux-stable
> >> # git tag -l | grep '5\.15\.150'
> >> v5.15.150
> >> # git checkout -b my5.15.150 v5.15.150
> >> Updating files: 100% (65776/65776), done.
> >> Switched to a new branch 'my5.15.150'
> >>
> >> Copied in my .config then...
> >>
> >> # make menuconfig
> >> # git bisect start -- drivers/gpu/drm/amd
> >> # git bisect bad
> >> # git bisect good v5.15.149
> >> Bisecting: 1 revision left to test after this (roughly 1 step)
> >> [b9a61ee2bb2704e42516e3da962f99dfa98f3b20] drm/amdgpu: reset gpu for
> >> s3 suspend abort case
> >> # make
> >> # rm -rf /boot2
> >> # mkdir -p /boot2/lib/modules
> >> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_install
> >> # cp arch/x86/boot/bzImage /boot2/vmlinuz
> >> # sync
> >> ...QV on Acer laptop, with amdgpu, works!
> >> # git bisect good
> >> Bisecting: 0 revisions left to test after this (roughly 0 steps)
> >> [56b522f4668167096a50c39446d6263c96219f5f] drm/amdgpu: init iommu
> >> after amdkfd device init
> >> # make
> >> # mkdir -p /boot2/lib/modules
> >> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_install
> >> # cp arch/x86/boot/bzImage /boot2/vmlinuz
> >> # sync
> >> ...QV on Acer laptop, black screen!
> >>
> >> # git bisect bad
> >> 56b522f4668167096a50c39446d6263c96219f5f is the first bad commit
> >> commit 56b522f4668167096a50c39446d6263c96219f5f
> >> Author: Yifan Zhang <yifan1.zhang@amd.com>
> >> Date:   Tue Sep 28 15:42:35 2021 +0800
> >>
> >>      drm/amdgpu: init iommu after amdkfd device init
> >>
> >>      [ Upstream commit 286826d7d976e7646b09149d9bc2899d74ff962b ]
> >>
> >>      This patch is to fix clinfo failure in Raven/Picasso:
> >>
> >>      Number of platforms: 1
> >>        Platform Profile: FULL_PROFILE
> >>        Platform Version: OpenCL 2.2 AMD-APP (3364.0)
> >>        Platform Name: AMD Accelerated Parallel Processing
> >>        Platform Vendor: Advanced Micro Devices, Inc.
> >>        Platform Extensions: cl_khr_icd cl_amd_event_callback
> >>
> >>        Platform Name: AMD Accelerated Parallel Processing Number of de=
vices: 0
> >>
> >>      Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
> >>      Reviewed-by: James Zhu <James.Zhu@amd.com>
> >>      Tested-by: James Zhu <James.Zhu@amd.com>
> >>      Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >>      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>      Signed-off-by: Sasha Levin <sashal@kernel.org>
> >>
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> Anything else I should do, to identify what in this commit is the
> >> likely culprit?
> >> Regards,
> >> Barry Kauler
