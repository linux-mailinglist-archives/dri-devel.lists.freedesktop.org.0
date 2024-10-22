Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5D9AA2B8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 15:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670C710E31B;
	Tue, 22 Oct 2024 13:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iiEltIP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1722310E31B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 13:04:43 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2e2af4dca5cso1094724a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729602282; x=1730207082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWDeRgm8AjTmhY393T7IKu9ZeB7eJOW+Adot/DNWsok=;
 b=iiEltIP+VrANGg7CH1jKUJKXy++0k9/XHpm10MXHE6YUZ2dIiahNsoWASvHmzVyhbU
 XNhSP1xpR4LqyyJ9v6sHL3CD6PDRJJAE05jUdi/7xdAgen/3hg6Y2BPGSJL/hMpqAqRG
 GTjYCPTMIYc+2je4jUoIeKFZR4nNVcH3w0OHP6YszlKRMFkQg82pSxtZEp9ksO1e13aS
 skd3MCRTn09+6By475MVabbdhpjHo1bUIWY62OOXoK1iQXXmiTzkme8xe/lt1Btud21L
 WzVocgGW5D/SYI1b4MRcbvjB6bCk56Dk073Nei85L2BzdcPM28mD173ua0LPJAmXtaAw
 ZPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729602282; x=1730207082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pWDeRgm8AjTmhY393T7IKu9ZeB7eJOW+Adot/DNWsok=;
 b=jEufNPfTubseo7lqUyg5UQe/QJsAX29O6HdtDUkrNOQxfZWyPKlCzSZFANkY4W9T81
 2YktO6Gh5JSzuFkorgxHGozDdquuZxK0WrYMHnSYUHf6Nwk/0nww0CCTIBYdZUp2evaU
 Vso4Nt9Hp5mc79Vajt7h8yzgXteF4oKiFY+njfEWfHjFODi9kb16vSyfNSfgJTyYPMqw
 lYbyFOuOHkV7Dnydi46OPyIcFiiiiVcgKq3+/YR0P7T6ON/EdX4cjjtpozh9j1nLXUZt
 OU37wxfZnxR3xvaZiIspwO0cJSZJvJxwIv407mhBOmNDXMFvXSJpwzkGt6dFyF13IXFF
 k8rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6CKk6t7ndBn2Rpf7kCAiCproCvFnvgCLME3Z6ug0Lwe4kIuI+rARlgDaZWL5D5eC8tK/6j92KBWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPb2EY5lx5PGqWk19H/4GUjVo+lHCnMeOGehQxeDiKI4zKJxLb
 LWCQDDN1YtblijIe6nsD9PEhiXaJcyhcAPHdfn+umkA7Ms0TWJk55KnEn3kS5xtgetKeOgF2wcC
 /e76Mt5fKrlrwTFYDXpK2Znq+jO8=
X-Google-Smtp-Source: AGHT+IH52G7hhVJzsWn9Mn7Q9OsulLJoDWAxP7UAnkiQV5yHiISOtioTuU80uizG3qQb9Fr754ZF0erA82kY5KLwkoo=
X-Received: by 2002:a17:90a:e296:b0:2e2:de92:2d52 with SMTP id
 98e67ed59e1d1-2e561a58096mr7189173a91.9.1729602282458; Tue, 22 Oct 2024
 06:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241014152502.1477809-1-superm1@kernel.org>
 <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
 <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
In-Reply-To: <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Oct 2024 09:04:30 -0400
Message-ID: <CADnq5_OjfJzcOqa=NbWVw5ENvi+nmvNAZX0u_0hOvk3EVoh0bw@mail.gmail.com>
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

On Tue, Oct 22, 2024 at 2:31=E2=80=AFAM Kai-Heng Feng <kaihengf@nvidia.com>=
 wrote:
>
> Hi Luke,
>
> On 2024/10/15 4:04 PM, Luke Jones wrote:
> > On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
> >> From: Mario Limonciello <mario.limonciello@amd.com>
> >>
> >> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display dev=
ice.
> >>
> >> ```
> >> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce
> >> RTX 4070 Max-Q / Mobile] (rev a1)
> >> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI]
> >> Strix [Radeon 880M / 890M] (rev c1)
> >> ```
> >>
> >> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as th=
e
> >> boot VGA device, but really the eDP is connected to the AMD PCI displa=
y
> >> device.
> >>
> >> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA device=
.
> >>
> >> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> >> Reported-by: Luke D. Jones <luke@ljones.dev>
> >> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >> ---
> >>   drivers/pci/vgaarb.c | 7 -------
> >>   1 file changed, 7 deletions(-)
> >>
> >> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> >> index 78748e8d2dba..05ac2b672d4b 100644
> >> --- a/drivers/pci/vgaarb.c
> >> +++ b/drivers/pci/vgaarb.c
> >> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_device =
*vgadev)
> >>              return true;
> >>      }
> >>
> >> -    /*
> >> -     * Vgadev has neither IO nor MEM enabled.  If we haven't found an=
y
> >> -     * other VGA devices, it is the best candidate so far.
> >> -     */
> >> -    if (!boot_vga)
> >> -            return true;
> >> -
> >>      return false;
> >>   }
> >>
> >> --
> >> 2.43.0
> >
> > Hi Mario,
> >
> > I can verify that this does leave the `boot_vga` attribute set as 0 for=
 the NVIDIA device.
>
> Does the following diff work for you?
> This variant should be less risky for most systems.
>
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 78748e8d2dba..3fb734cb9c1b 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -675,6 +675,9 @@ static bool vga_is_boot_device(struct vga_device *vga=
dev)
>                  return true;
>          }
>
> +       if (vga_arb_integrated_gpu(&pdev->dev))
> +               return true;
> +

The problem is that the integrated graphics does not support VGA.

Alex

>          /*
>           * Vgadev has neither IO nor MEM enabled.  If we haven't found a=
ny
>           * other VGA devices, it is the best candidate so far.
>
>
> Kai-Heng
>
> >
> > Tested-by: Luke D. Jones <luke@ljones.dev>
>
