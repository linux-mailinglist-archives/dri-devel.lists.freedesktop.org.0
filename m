Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7859ACEBA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 17:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE8E10E373;
	Wed, 23 Oct 2024 15:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U71TozmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DDB10E373
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 15:27:35 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7ea64af4bbbso746502a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729697254; x=1730302054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgIQoq6KNaLLN/YAbOHNwmlTZJmPg/4UDeUr0HAYKcA=;
 b=U71TozmRbQ0+M7/R3g8IJ6MjrMUgKo945/kT1TI7E/zyNgJXPSsizcP85di2jWCvLT
 kn8B3LJtsM1xoHGjntQDQrvb7n4iWcD/2o/cZfonqoOfqM5jHDqOJCgWyjADUB+7bXU7
 izOFfmB4UVhTbDL7FRWaNh6QEqkbM3HEa065YIwKcZkzlSLCy7q2n+uL0kI1NOVff4uD
 o9cMLrpuOwN+42rxB4O0QzgwxcSOh3DqqR6h/4T61tRsDB0Fkyp32qRvWvv4cvFdaAYS
 WIgQxGEpMvch5XFdAoaU07j/o4Zu1Zza7OVFscz8cWhIWBcOzU5ZAYTVHFZ0E3Drhz/a
 ZkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729697254; x=1730302054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgIQoq6KNaLLN/YAbOHNwmlTZJmPg/4UDeUr0HAYKcA=;
 b=cUrM8jopgTO1EjC9xDJa7ALTUJKvoowMm7aarGXF5GF1xza+5nOLnRQidcb/FdOgZy
 Xf3dazFSmgE/GFDItKPugHt7nJL11te0M2kId8emGkDhNNSr+gry9U20wyiEsVcgKwNM
 gI67S4HAfQ5XWHXhD18X1Tnm8YxYEi2QUug6riwy36SbazhMwSwRGBkO1q8Qie83VYGy
 c7QwnsKyE6+NacRkMuzEHcMSTQLnxEz+TKaf7mh+z9XTqBNlBEvTBqBomOdejfgS2scf
 t1RcDIiCWC59WamX+Cleprp6XCcMYlf7pK/Tfsterx9wf19msmPlnq5mRALZ+iGmurXY
 f05A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKIzVVXwwWPNpQU3q2oDpicluDHSr8w8zidmGMWERT66+/Vr+xE8eR+HjFkJYa/Cf5jqYAIuyLmh8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCrFthe3MkatcvlsVV76Hubmge0qHW5YLlrSByaRIp5ZQtrWXj
 VnX91DnsvH4U4qWxOKTqg0wGdfzmXvuQxDDj/XSo7OiopEHlsfdO9h+eXOKMVorZ0q3DltXgjfQ
 Dg9pP40ZlSTOKhqtNfOVsm9r+rP+3oA==
X-Google-Smtp-Source: AGHT+IHx8hn46XoyrIBSavBR29Txf0wclGSq28wvr+ELnHXP69lVjDWT3I5vfqfFUQPcQOdabS6idpRapRcqFXeAxws=
X-Received: by 2002:a05:6a20:6a0e:b0:1cf:34a9:63d2 with SMTP id
 adf61e73a8af0-1d978b96069mr2009125637.9.1729697254464; Wed, 23 Oct 2024
 08:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241014152502.1477809-1-superm1@kernel.org>
 <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
 <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
 <CADnq5_OjfJzcOqa=NbWVw5ENvi+nmvNAZX0u_0hOvk3EVoh0bw@mail.gmail.com>
 <fd7cae9a-5ee1-4e18-915d-4115f0a6a156@nvidia.com>
In-Reply-To: <fd7cae9a-5ee1-4e18-915d-4115f0a6a156@nvidia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Oct 2024 11:27:22 -0400
Message-ID: <CADnq5_NTBXPbW+u_AxTewH-aouLNn4gxebpzUSzsyev-VxOtcg@mail.gmail.com>
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

On Tue, Oct 22, 2024 at 9:27=E2=80=AFPM Kai-Heng Feng <kaihengf@nvidia.com>=
 wrote:
>
>
>
> On 2024/10/22 9:04 PM, Alex Deucher wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Tue, Oct 22, 2024 at 2:31=E2=80=AFAM Kai-Heng Feng <kaihengf@nvidia.=
com> wrote:
> >>
> >> Hi Luke,
> >>
> >> On 2024/10/15 4:04 PM, Luke Jones wrote:
> >>> On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
> >>>> From: Mario Limonciello <mario.limonciello@amd.com>
> >>>>
> >>>> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display d=
evice.
> >>>>
> >>>> ```
> >>>> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForc=
e
> >>>> RTX 4070 Max-Q / Mobile] (rev a1)
> >>>> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI]
> >>>> Strix [Radeon 880M / 890M] (rev c1)
> >>>> ```
> >>>>
> >>>> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as =
the
> >>>> boot VGA device, but really the eDP is connected to the AMD PCI disp=
lay
> >>>> device.
> >>>>
> >>>> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA devi=
ce.
> >>>>
> >>>> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> >>>> Reported-by: Luke D. Jones <luke@ljones.dev>
> >>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
> >>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>> ---
> >>>>    drivers/pci/vgaarb.c | 7 -------
> >>>>    1 file changed, 7 deletions(-)
> >>>>
> >>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> >>>> index 78748e8d2dba..05ac2b672d4b 100644
> >>>> --- a/drivers/pci/vgaarb.c
> >>>> +++ b/drivers/pci/vgaarb.c
> >>>> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_devic=
e *vgadev)
> >>>>               return true;
> >>>>       }
> >>>>
> >>>> -    /*
> >>>> -     * Vgadev has neither IO nor MEM enabled.  If we haven't found =
any
> >>>> -     * other VGA devices, it is the best candidate so far.
> >>>> -     */
> >>>> -    if (!boot_vga)
> >>>> -            return true;
> >>>> -
> >>>>       return false;
> >>>>    }
> >>>>
> >>>> --
> >>>> 2.43.0
> >>>
> >>> Hi Mario,
> >>>
> >>> I can verify that this does leave the `boot_vga` attribute set as 0 f=
or the NVIDIA device.
> >>
> >> Does the following diff work for you?
> >> This variant should be less risky for most systems.
> >>
> >> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> >> index 78748e8d2dba..3fb734cb9c1b 100644
> >> --- a/drivers/pci/vgaarb.c
> >> +++ b/drivers/pci/vgaarb.c
> >> @@ -675,6 +675,9 @@ static bool vga_is_boot_device(struct vga_device *=
vgadev)
> >>                   return true;
> >>           }
> >>
> >> +       if (vga_arb_integrated_gpu(&pdev->dev))
> >> +               return true;
> >> +
> >
> > The problem is that the integrated graphics does not support VGA.
>
> Right, so the check has to be used much earlier.
>
> I wonder does the integrated GFX have _DOD/_DOS while the discrete one do=
esn't?
> If that's the case, vga_arb_integrated_gpu() can be used to differentiate=
 which
> one is the boot GFX.

I think the problem is that the boot GPU is being conflated with vga
arb.  In this case the iGPU has no VGA so has no reason to be involved
in vga arb.  Trying to mess with any vga related resources on it could
be problematic.  Do higher levels of the stack look at vga arb to
determine the "primary" GPU?

Alex

>
> Kai-Heng
>
> >
> > Alex
> >
> >>           /*
> >>            * Vgadev has neither IO nor MEM enabled.  If we haven't fou=
nd any
> >>            * other VGA devices, it is the best candidate so far.
> >>
> >>
> >> Kai-Heng
> >>
> >>>
> >>> Tested-by: Luke D. Jones <luke@ljones.dev>
> >>
>
