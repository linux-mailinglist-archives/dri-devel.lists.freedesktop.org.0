Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897D59B0334
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 14:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC7910E2C5;
	Fri, 25 Oct 2024 12:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Svxy5lsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9231D10E2C5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 12:55:48 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7eb0448693eso125395a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729860948; x=1730465748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mpopKe0kCq4c6SWTmzVvbk0KW/W7H/olvg6DZS09/0=;
 b=Svxy5lsbF+SfHUOTC46B3IzSh9Rsk9mhr7vZMWv370P7N5RJDnn+wcxbjzD8VOD/Gp
 VZd8DmDZWlutnTKQZOPZ4qivGJ1TuZjeRVCefWxpahi4MPBbKm1sHEq6cCGkaxBTaHl2
 WXF9HHZmAfW2BLoMI9+Vv+4iMmFr9swPoo/dQbZYUhBuHeSHTO4juT7+kBct8ytgM1Ca
 4Jf05k3Qji9rWduYzSu7RKXQ9xR9BggXsZKZnuLJ0V67X9AizbPhecx2T6h9hsoO0rMs
 lsb0Jk4VTSD3jQM/PSZ8546k5DPPaQ0LwYELYTFB50tVlJqQI7Unial/4IoQWJQPLsJc
 mXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729860948; x=1730465748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mpopKe0kCq4c6SWTmzVvbk0KW/W7H/olvg6DZS09/0=;
 b=b5mNKxu5JtK+OYiF/ZDeXU1x9cfRhrQcoWQIFiL0bKWma2S8Ib23qOotLYx3c3t2Pc
 vVH+r+9oBw4S415tRCehoM8fMadpj7mSNfEVpqXd1VaG78ADDd/MO0LL4pBuH88PLck6
 RteSL4G6BmN3wWqx2By85TG45WE7J9lqu7irZLB2xhrrPnJLvvd53ZKHkJGIMaLQQZTj
 yBJqHFZ+1WKnEhkezt3egvaO2zcnWPExRF5wlXsyULY7+wGHsKl20gVumvwCJj4/i790
 cPaRF1e2uzFJlIke67ucLkU4UWlwH6ljfx3r7t14jdRtVnPElB0cb7Hetxk7tdwwcmby
 78pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrXOsU3atNSk1rs9orsPfvLjZSkKZDDtUuKQOAS1tIu0B1gt+PXjfAt86VoIpUZMBC4DUeCL3sJrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgwsjNxm6KaT1d4abVrPgpl2zq5UMMPAQ0YuxfD8zVeAP+Mr+R
 YbP004O2P2t8tCFln4juK+VSiN9FEZBeOQzGcgh+1we8q0bmQrdVp2+0PNPiXHnXjqh7XhJInnA
 29AIoXwscFtCue8D72cyPmVFsAF8=
X-Google-Smtp-Source: AGHT+IFAPOJ193XCnyihRQUSik9FlYyJIZv/7VMnRuPjMeme+UnT3saFzOAbbpalhJ2K+qWHAxiutraJ9lBbhuwKmPw=
X-Received: by 2002:a05:6a20:6a1d:b0:1d9:6ec9:30f2 with SMTP id
 adf61e73a8af0-1d99e1a0235mr995000637.6.1729860947867; Fri, 25 Oct 2024
 05:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241014152502.1477809-1-superm1@kernel.org>
 <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
 <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
 <CADnq5_OjfJzcOqa=NbWVw5ENvi+nmvNAZX0u_0hOvk3EVoh0bw@mail.gmail.com>
 <fd7cae9a-5ee1-4e18-915d-4115f0a6a156@nvidia.com>
 <CADnq5_NTBXPbW+u_AxTewH-aouLNn4gxebpzUSzsyev-VxOtcg@mail.gmail.com>
 <46b487ec-e8a6-43fb-85d5-f264618f2e5d@nvidia.com>
In-Reply-To: <46b487ec-e8a6-43fb-85d5-f264618f2e5d@nvidia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Oct 2024 08:55:36 -0400
Message-ID: <CADnq5_Mh7B8Kk144terpvV9kf2Z4xcQ0nhVakHOcDdwgd3Y1Fg@mail.gmail.com>
Subject: Re: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot
 VGA device
To: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: Luke Jones <luke@ljones.dev>, Mario Limonciello <superm1@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
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

On Fri, Oct 25, 2024 at 3:51=E2=80=AFAM Kai-Heng Feng <kaihengf@nvidia.com>=
 wrote:
>
>
>
> On 2024/10/23 11:27 PM, Alex Deucher wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Tue, Oct 22, 2024 at 9:27=E2=80=AFPM Kai-Heng Feng <kaihengf@nvidia.=
com> wrote:
> >>
> >>
> >>
> >> On 2024/10/22 9:04 PM, Alex Deucher wrote:
> >>> External email: Use caution opening links or attachments
> >>>
> >>>
> >>> On Tue, Oct 22, 2024 at 2:31=E2=80=AFAM Kai-Heng Feng <kaihengf@nvidi=
a.com> wrote:
> >>>>
> >>>> Hi Luke,
> >>>>
> >>>> On 2024/10/15 4:04 PM, Luke Jones wrote:
> >>>>> On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
> >>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>>
> >>>>>> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display=
 device.
> >>>>>>
> >>>>>> ```
> >>>>>> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeFo=
rce
> >>>>>> RTX 4070 Max-Q / Mobile] (rev a1)
> >>>>>> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI]
> >>>>>> Strix [Radeon 880M / 890M] (rev c1)
> >>>>>> ```
> >>>>>>
> >>>>>> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU a=
s the
> >>>>>> boot VGA device, but really the eDP is connected to the AMD PCI di=
splay
> >>>>>> device.
> >>>>>>
> >>>>>> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA de=
vice.
> >>>>>>
> >>>>>> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> >>>>>> Reported-by: Luke D. Jones <luke@ljones.dev>
> >>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
> >>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>> ---
> >>>>>>     drivers/pci/vgaarb.c | 7 -------
> >>>>>>     1 file changed, 7 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> >>>>>> index 78748e8d2dba..05ac2b672d4b 100644
> >>>>>> --- a/drivers/pci/vgaarb.c
> >>>>>> +++ b/drivers/pci/vgaarb.c
> >>>>>> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_dev=
ice *vgadev)
> >>>>>>                return true;
> >>>>>>        }
> >>>>>>
> >>>>>> -    /*
> >>>>>> -     * Vgadev has neither IO nor MEM enabled.  If we haven't foun=
d any
> >>>>>> -     * other VGA devices, it is the best candidate so far.
> >>>>>> -     */
> >>>>>> -    if (!boot_vga)
> >>>>>> -            return true;
> >>>>>> -
> >>>>>>        return false;
> >>>>>>     }
> >>>>>>
> >>>>>> --
> >>>>>> 2.43.0
> >>>>>
> >>>>> Hi Mario,
> >>>>>
> >>>>> I can verify that this does leave the `boot_vga` attribute set as 0=
 for the NVIDIA device.
> >>>>
> >>>> Does the following diff work for you?
> >>>> This variant should be less risky for most systems.
> >>>>
> >>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> >>>> index 78748e8d2dba..3fb734cb9c1b 100644
> >>>> --- a/drivers/pci/vgaarb.c
> >>>> +++ b/drivers/pci/vgaarb.c
> >>>> @@ -675,6 +675,9 @@ static bool vga_is_boot_device(struct vga_device=
 *vgadev)
> >>>>                    return true;
> >>>>            }
> >>>>
> >>>> +       if (vga_arb_integrated_gpu(&pdev->dev))
> >>>> +               return true;
> >>>> +
> >>>
> >>> The problem is that the integrated graphics does not support VGA.
> >>
> >> Right, so the check has to be used much earlier.
> >>
> >> I wonder does the integrated GFX have _DOD/_DOS while the discrete one=
 doesn't?
> >> If that's the case, vga_arb_integrated_gpu() can be used to differenti=
ate which
> >> one is the boot GFX.
> >
> > I think the problem is that the boot GPU is being conflated with vga
> > arb.  In this case the iGPU has no VGA so has no reason to be involved
> > in vga arb.  Trying to mess with any vga related resources on it could
> > be problematic.  Do higher levels of the stack look at vga arb to
> > determine the "primary" GPU?
>
> Hmm, I wonder if all those heuristic are needed for EFI based system?
>
> Can we assume that what being used by UEFI GOP is the primary GFX device?

Yes, I believe so.  The SBIOS should use the GOP device as determined
by the user preference.  I.e.., in the bios configuration you can
generally select iGPU or PEG for the primary display.

Alex

>
> Kai-Heng
>
> >
> > Alex
> >
> >>
> >> Kai-Heng
> >>
> >>>
> >>> Alex
> >>>
> >>>>            /*
> >>>>             * Vgadev has neither IO nor MEM enabled.  If we haven't =
found any
> >>>>             * other VGA devices, it is the best candidate so far.
> >>>>
> >>>>
> >>>> Kai-Heng
> >>>>
> >>>>>
> >>>>> Tested-by: Luke D. Jones <luke@ljones.dev>
> >>>>
> >>
>
