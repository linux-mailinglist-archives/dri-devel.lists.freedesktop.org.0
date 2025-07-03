Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7EAF777B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 16:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DEC10E856;
	Thu,  3 Jul 2025 14:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EUtQUVaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A223310E856;
 Thu,  3 Jul 2025 14:30:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5375B5C5E05;
 Thu,  3 Jul 2025 14:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4192C4CEF5;
 Thu,  3 Jul 2025 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751552998;
 bh=Fm3qk2Sxt9oTRrrfhvZcED03yYICrUHHIb3sCtzNWN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EUtQUVaTKURBSPBDtNxwsZsLLGU/xuEHfm0PM0K5AWLaAr0lx8/+TnwYPfB+kyugp
 o5d1bOfi4bMzMx2v5TNIDepiHs+lhKKtjX3PEHUE1FABzscTZA81BEJuCo0M0+oFZE
 dOrF4zbUAof8uuDe+iZKSFilPr/iDnGR0fZS146Rn1y2CwpF2gGr8tGklAwmWHwLd/
 H8Hc4TXVr72JEd4ApQIUdwamFnhZZ9yo02YLAo86ZBHy6BnhWR2tguDc4rTB9wd0PV
 4ddhT8qjZhuaiqWLp/lCL2F70yOJqRDWT/21+N7ylRkXCOvzQfNM3ccrTj/VKiWXAz
 zCMqHWcqpGzCA==
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-610d87553b6so3239902eaf.2; 
 Thu, 03 Jul 2025 07:29:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVcbsd6zxUvBtcBBX/0EFAODqFQ5E3Wxw+zbCIvxhDb7/dY7tndWm95cf0BkXlRsjwi2ReQI81JyqrO@lists.freedesktop.org,
 AJvYcCXtrl9U4HsyynXxcEvI4sE8x0Pv8qqvJlzkUUQAjil/dDz3z1dziNqrHgt3ulEqOhkdJsf5fJCa@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3BxMdHrM9+BROXwyjXnHfSY/hTI0zsUdLVxjjv7ZM/V9d52hC
 M13ybFuxguVy6qOnKgVQaqMRPV450+ubnThi4rmDM6TXZeGa1Mw7NpVtlWAnAJwkk1qiAC0Kxm8
 2TDe3ZOVjYl0e1ioZQcvUQ6z9U6YzZBQ=
X-Google-Smtp-Source: AGHT+IGKqgRrtyx19Ohp3Z1EI2LoOc/W9BuT9DA7/iSo9WQpIWa8l502nswOSx3IuDHZQjfc+w2NIPaPXuTzX8u35dk=
X-Received: by 2002:a05:6820:2713:b0:611:bbad:7b62 with SMTP id
 006d021491bc7-6120112a218mr4957769eaf.3.1751552997991; Thu, 03 Jul 2025
 07:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250616175019.3471583-1-superm1@kernel.org>
In-Reply-To: <20250616175019.3471583-1-superm1@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Jul 2025 16:29:46 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jc-tjs_a+RCzu6bvrbfhv5QHqsWx-zKjH0wpisiJciKA@mail.gmail.com>
X-Gm-Features: Ac12FXyr5oPvb2c3yNjkDygXC9l6Pt_56oLkJ04HxD0-cR-THCDtscKWWn70wDY
Message-ID: <CAJZ5v0jc-tjs_a+RCzu6bvrbfhv5QHqsWx-zKjH0wpisiJciKA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Improvements to S5 power consumption
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:HIBERNATION (aka Software Suspend,
 aka swsusp)" <linux-pm@vger.kernel.org>, 
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, 
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K . Petersen" <martin.petersen@oracle.com>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>, 
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
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

On Mon, Jun 16, 2025 at 7:50=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> A variety of issues both in function and in power consumption have been
> raised as a result of devices not being put into a low power state when
> the system is powered off.
>
> There have been some localized changes[1] to PCI core to help these issue=
s,
> but they have had various downsides.
>
> This series instead tries to use the S4 flow when the system is being
> powered off.  This lines up the behavior with what other operating system=
s
> do as well.  If for some reason that fails or is not supported, unwind an=
d
> do the previous S5 flow that will wake all devices and run their shutdown=
()
> callbacks.

I actually like this approach, but I think that it is risky.

It also requires more work/review from other people.

I'll be sending some comments on the individual patches going forward,
but I think the earliest it can go in is after 6.17-rc1 (given it is
reviewed properly till then).

Thanks!

> v3->v4:
>  * Fix LKP robot failure
>  * Rebase on v6.16-rc2
>
> Previous submissions [1]:
> Link: https://lore.kernel.org/linux-pm/CAJZ5v0hrKEJa8Ad7iiAvQ3d_0ysVhzZcX=
SYc5kkL=3D6vtseF+bg@mail.gmail.com/T/#m91e4eae868a7405ae579e89b135085f49062=
25d2
> Link: https://lore.kernel.org/linux-pci/20250506041934.1409302-1-superm1@=
kernel.org/
> Link: https://lore.kernel.org/linux-pci/20231213182656.6165-1-mario.limon=
ciello@amd.com/ (v1)
> Link: https://lore.kernel.org/linux-pm/20250514193406.3998101-1-superm1@k=
ernel.org/ (v2)
> Link: https://lore.kernel.org/linux-pm/20250609024619.407257-1-superm1@ke=
rnel.org/ (v3)
>
> Mario Limonciello (5):
>   PM: Use hibernate flows for system power off
>   PCI: Put PCIe ports with downstream devices into D3 at hibernate
>   drm/amd: Avoid evicting resources at S5
>   scsi: Add PM_EVENT_POWEROFF into suspend callbacks
>   usb: sl811-hcd: Add PM_EVENT_POWEROFF into suspend callbacks
>
>  drivers/base/power/main.c                  |  7 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 +
>  drivers/pci/pci-driver.c                   | 94 ++++++++++++++--------
>  drivers/scsi/mesh.c                        |  1 +
>  drivers/scsi/stex.c                        |  1 +
>  drivers/usb/host/sl811-hcd.c               |  1 +
>  include/linux/pm.h                         |  3 +
>  include/trace/events/power.h               |  3 +-
>  kernel/reboot.c                            |  6 ++
>  9 files changed, 86 insertions(+), 34 deletions(-)
>
> --
> 2.43.0
>
