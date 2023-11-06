Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9137E28AA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 16:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5EF10E347;
	Mon,  6 Nov 2023 15:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA3410E345;
 Mon,  6 Nov 2023 15:29:04 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1f0656b5c99so1850987fac.1; 
 Mon, 06 Nov 2023 07:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699284543; x=1699889343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvIhF9xuFJUuwvzTU42upDnVbw8DHp9VYw/HLhc/loM=;
 b=MX8djYqvtoc+1b10QffHfMl7EDLwxNdNEC/z97+w8yJiOPwfpL2kR+s3dhadowYv4J
 U4Yfp3BfsM3/d0+PowpaLYcD1SP8oBS4ajOTHdpUu/qQ4/WM70rh3gtwnA17/jIMR2VT
 o0Eqqhr7BDw1WI9bmGFTfOqIojppdiEyWMRPjZ6VeH9UTuUUKOiOFjblo+FI/APN5LW9
 kZG8U1/hMIlYUNAT3ZHWDuJXDy8xvdWcLlwLLsnLmESFjtgJRB3WhPSxLWUbGTmIVEmz
 q3iWpjCBHlsHnKLcY561YTilqOKG7wMYt96pCc4/KhGbY8EcQVw68p6LxRwdDTDMbjPn
 WJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699284543; x=1699889343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uvIhF9xuFJUuwvzTU42upDnVbw8DHp9VYw/HLhc/loM=;
 b=u23hmK6U4vaVD5Z+IzSaQhd81Jd5dfyL6wiwGq2q2BmFUYgR8+zYXBHjl5jlLFg1Ap
 w3GY6MAFz1O83IHZL5uw39nfmBiIogHSbDSbaS4/QJ1EieVvqDPy4iFGYQK4k3FoHf0/
 gj/kyTZTZD4h1q2u9IiMmcG6GBxVwCsRntjmJBwx0djqICfemg/8uHKGLWfZd7Lz7mXZ
 k0NECQGdcthGV+owwuMtb473Iou31LPosThcqp6JxaLoHhePSMDseEccIaEQdwzxaXhx
 Y2VNJa95HTT5zbT/NSunNbsvH9vkK6GviGqYTaDS9YrAGPTKeUKhHtNR5L70sMjyr60O
 J5sA==
X-Gm-Message-State: AOJu0YxkvasW+OoPJtg2mN9wdyNeEU28jeAWMkuRJYebdhu9fcGFV8zR
 5ODmRUIsSeTPy6z9Y5uzAgdN3OS3DhotFGPZnMM=
X-Google-Smtp-Source: AGHT+IFteXQH9BHt3ZRZ7W8tal+jmYmVtmtqRSJtP+IzhFyTFRZv9u7SFv3/jCWbln4qIky7btDjoxGt8fk0qUfbPt8=
X-Received: by 2002:a05:6871:489:b0:1ef:b0b6:7e14 with SMTP id
 f9-20020a056871048900b001efb0b67e14mr6595oaj.10.1699284543003; Mon, 06 Nov
 2023 07:29:03 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsNsDLvZR8RGf9ji5938QreSix89FCpGHju+9in2x6OfDw@mail.gmail.com>
In-Reply-To: <CABXGCsNsDLvZR8RGf9ji5938QreSix89FCpGHju+9in2x6OfDw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Nov 2023 10:28:51 -0500
Message-ID: <CADnq5_ObMvxN4pFAsWU7OM3SAtYCNHKE_fHsLqizGm0p1ubp=w@mail.gmail.com>
Subject: Re: 6.7/regression/KASAN: null-ptr-deref in
 amdgpu_ras_reset_error_count+0x2d6
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
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
Cc: tao.zhou1@amd.com, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 10:22=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi,
> another release cycle, and another regression.
> After another kernel update in Fedora Rawhide GPU not
> entering in graphic mode on my laptop ASUS ROG Strix G15 Advantage
> Edition G513QY-HQ007.
> And in kernel log appears this bug trace:
> [   22.574698] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   22.574704] BUG: KASAN: null-ptr-deref in
> amdgpu_ras_reset_error_count+0x2d6/0x3e0 [amdgpu]
> [   22.575115] Read of size 4 at addr 0000000000000180 by task (udev-work=
er)/504
>
> [   22.575125] CPU: 2 PID: 504 Comm: (udev-worker) Tainted: G        W
>    L     6.6.0-last-d2f51b3516dade79269ff45eae2a7668ae711b25+ #163
> [   22.575135] Hardware name: ASUSTeK COMPUTER INC. ROG Strix
> G513QY_G513QY/G513QY, BIOS G513QY.331 02/24/2023
> [   22.575143] Call Trace:
> [   22.575147]  <TASK>
> [   22.575151]  dump_stack_lvl+0x76/0xd0
> [   22.575158]  kasan_report+0xa6/0xe0
> [   22.575165]  ? amdgpu_ras_reset_error_count+0x2d6/0x3e0 [amdgpu]
> [   22.575320]  kasan_check_range+0x105/0x1b0
> [   22.575320]  amdgpu_ras_reset_error_count+0x2d6/0x3e0 [amdgpu]
> [   22.575320]  gmc_v9_0_late_init+0xcf/0x1b0 [amdgpu]
> [   22.575320]  amdgpu_device_ip_late_init+0x103/0x7b0 [amdgpu]
> [   22.575320]  amdgpu_device_init+0x7b33/0x8a90 [amdgpu]
> [   22.575320]  ? __pfx_amdgpu_device_init+0x10/0x10 [amdgpu]
> [   22.575320]  ? __pfx_pci_bus_read_config_word+0x10/0x10
> [   22.575320]  ? do_pci_enable_device+0x22d/0x2a0
> [   22.575320]  ? __pfx_pci_request_acs+0x1/0x10
> [   22.575320]  ? _raw_spin_unlock_irqrestore+0x66/0x80
> [   22.575320]  ? lockdep_hardirqs_on+0x81/0x110
> [   22.575320]  ? __kasan_check_byte+0x13/0x50
> [   22.575320]  amdgpu_driver_load_kms+0x1d/0x4b0 [amdgpu]
> [   22.575320]  amdgpu_pci_probe+0x282/0xac0 [amdgpu]
> [   22.575320]  ? __pfx_amdgpu_pci_probe+0x10/0x10 [amdgpu]
> [   22.575320]  local_pci_probe+0xdd/0x190
> [   22.575320]  pci_device_probe+0x23a/0x780
> [   22.575320]  ? kernfs_add_one+0x326/0x490
> [   22.575320]  ? kernfs_get.part.0+0x4c/0x70
> [   22.575320]  ? __pfx_pci_device_probe+0x10/0x10
> [   22.575320]  ? kernfs_create_link+0x16b/0x230
> [   22.575320]  ? kernfs_put+0x1c/0x40
> [   22.575320]  ? sysfs_do_create_link_sd+0x8e/0x100
> [   22.575320]  really_probe+0x3e2/0xb80
> [   22.575320]  __driver_probe_device+0x18c/0x450
> [   22.575320]  driver_probe_device+0x4a/0x120
> [   22.575320]  __driver_attach+0x1e5/0x4a0
> [   22.575320]  ? __pfx___driver_attach+0x10/0x10
> [   22.575320]  bus_for_each_dev+0x109/0x190
> [   22.575320]  ? __pfx_bus_for_each_dev+0x10/0x10
> [   22.575320]  bus_add_driver+0x2a1/0x570
> [   22.575320]  driver_register+0x134/0x460
> [   22.575320]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
> [   22.575320]  do_one_initcall+0xd6/0x430
> [   22.575320]  ? __pfx_do_one_initcall+0x10/0x10
> [   22.575320]  ? kasan_unpoison+0x44/0x70
> [   22.575320]  do_init_module+0x238/0x770
> [   22.575320]  load_module+0x5581/0x6f10
> [   22.575320]  ? __pfx_load_module+0x10/0x10
> [   22.575320]  ? ima_post_read_file+0x189/0x1b0
> [   22.575320]  ? __pfx_ima_post_read_file+0x10/0x10
> [   22.575320]  ? __pfx_bpf_lsm_kernel_post_read_file+0x10/0x10
> [   22.575320]  ? kernel_read_file+0x243/0x820
> [   22.575320]  ? __pfx_kernel_read_file+0x10/0x10
> [   22.575320]  ? init_module_from_file+0xd1/0x130
> [   22.575320]  init_module_from_file+0xd1/0x130
> [   22.575320]  ? __pfx_init_module_from_file+0x10/0x10
> [   22.575320]  ? local_clock_noinstr+0x45/0xc0
> [   22.575320]  ? do_raw_spin_unlock+0x58/0x1f0
> [   22.575320]  idempotent_init_module+0x235/0x650
> [   22.575320]  ? __pfx_idempotent_init_module+0x10/0x10
> [   22.575320]  ? __pfx_bpf_lsm_capable+0x10/0x10
> [   22.575320]  ? security_capable+0x74/0xb0
> [   22.575320]  __x64_sys_finit_module+0xbe/0x130
> [   22.575320]  do_syscall_64+0x64/0xe0
> [   22.575320]  ? do_syscall_64+0x70/0xe0
> [   22.575320]  ? lockdep_hardirqs_on+0x81/0x110
> [   22.575320]  ? do_syscall_64+0x70/0xe0
> [   22.575320]  ? do_syscall_64+0x70/0xe0
> [   22.575320]  ? do_syscall_64+0x70/0xe0
> [   22.575320]  ? do_syscall_64+0x70/0xe0
> [   22.575320]  ? do_syscall_64+0x70/0xe0
> [   22.575320]  ? do_syscall_64+0x70/0xe0
> [   22.575320]  ? lockdep_hardirqs_on+0x81/0x110
> [   22.575320]  ? do_syscall_64+0x70/0xe0
> [   22.575320]  ? lockdep_hardirqs_on+0x81/0x110
> [   22.575320]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> [   22.575320] RIP: 0033:0x7f8ab56bbf8d
> [   22.575320] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e
> fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 4e 0c 00 f7 d8 64 89
> 01 48
> [   22.575320] RSP: 002b:00007ffe2e836608 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   22.575320] RAX: ffffffffffffffda RBX: 000055f55ef37f30 RCX: 00007f8ab=
56bbf8d
> [   22.575320] RDX: 0000000000000000 RSI: 000055f55ef10950 RDI: 000000000=
0000015
> [   22.575320] RBP: 00007ffe2e8366c0 R08: 0000000000000000 R09: 00007ffe2=
e836650
> [   22.575320] R10: 0000000000000015 R11: 0000000000000246 R12: 000055f55=
ef10950
> [   22.575320] R13: 0000000000020000 R14: 000055f55ef37240 R15: 000055f55=
ef393d0
> [   22.575320]  </TASK>
> [   22.575320] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> Using bisect, I found out that this commit is to blame
> =E2=9D=AF git bisect good
> 73582be11ac8f6d6765e185bf48f22efb9d28c3b is the first bad commit
> commit 73582be11ac8f6d6765e185bf48f22efb9d28c3b
> Author: Tao Zhou <tao.zhou1@amd.com>
> Date:   Thu Oct 12 14:33:37 2023 +0800
>
>     drm/amdgpu: bypass RAS error reset in some conditions
>
>     PMFW is responsible for RAS error reset in some conditions, driver ca=
n
>     skip the operation.
>
>     v2: add check for ras->in_recovery, it's set earlier than
>     amdgpu_in_reset.
>
>     v3: fix error in gpu reset check.
>
>     Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
>     Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> I rebuilt the kernel from master with reverted
> 73582be11ac8f6d6765e185bf48f22efb9d28c3b and my laptop started working
> again.
>
> All kernel logs and build config I attached below.
> Laptop hardware probe is here: https://linux-hardware.org/?probe=3D85a38e=
7906

Already fixed in this commit:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/d1d4c0b7b65b7fab2bc6f97=
af9e823b1c42ccdb0
Which is in included in last weeks PR.

Alex

>
> --
> Best Regards,
> Mike Gavrilov.
