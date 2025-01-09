Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4F1A08175
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A0910EF1D;
	Thu,  9 Jan 2025 20:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aTTkpxnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021B810EF1D;
 Thu,  9 Jan 2025 20:41:11 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ef79243680so268057a91.2; 
 Thu, 09 Jan 2025 12:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736455271; x=1737060071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EnBMCdZsTt4lglc0qQTTeSi2hHu565uzhFPcflOVKWQ=;
 b=aTTkpxnXUWUIK0hNYV13xVcDPp/ztt/UA+57C2WrfS5R6sbp3RbPXPZqxayW3B7NY/
 LSxccNaRV6w5OZ8Y9MJYAryH9bErEwCo21sCea27QfwqCIwS34KQ5rF3re3u6EIGjxJS
 FOa/Rz5KdHcaUc2GFJhvUmNF85NerdbT+LAecf/GkpQAgZVt5OGOvXRRSJpIS4Tu9B9x
 FOX5F0mRdXTMVgRa/H8GvGgNof/LFTCeBZDW/u5otdVPwPT6FVM/XN82gvzzgKcecDdM
 ROx4ZvYicv0KPi+7bR7V0ZAiCI1ht/ugAWgevFkW5wKnWlPUq/c59coVVBKiWCqRoP59
 FomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736455271; x=1737060071;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EnBMCdZsTt4lglc0qQTTeSi2hHu565uzhFPcflOVKWQ=;
 b=H+qRQn6ELDy4d/63Fr2MziN6SUWQDIrI0XJsEotad6M83bE3QC/vhUlf/oOig1QsQs
 KFbNuRMAEvJ0g5CQbwA78ctC2CzQsL6iidA94+7PPmk2KfF83d7ecwhxQxEq5p2906Ol
 I3ract6ja740JsrO3pSFlRY35PD0IVVQ99ii5s+n0E+rDr7BwgQGx+uXpn7LA2cAIAE0
 JozwJO+AJpNCozjpqJ4Pwkrr7IqPXhxJW7K8127cLl4x5NPGOiLpYGmMNHfRmcRl0JrA
 SR2Zk6F4JGACamYCzKx68Wm8sW/EGBhCfMyPb9ugWy62SbY1Xo1tTOSgtgMgfmXBzw6c
 Wbqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0skXaRrGGm080eUuGkYimmeYwkrHmaepkJh2MaD8k9t566kS/NwP9BiaFVT7VDXKAWNiD1CpekIrU@lists.freedesktop.org,
 AJvYcCX0PGWTt2aGoWS2V1+qvXOHCSY4NXYmZHoE1bvmtQHdlaBsOByxwZSbjK65fVwYURsG7Mpds1qv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz39vliT2yIbCZLTc4ScAFEvA8BvawJ1bPUaIqx3B0VB68ZCLQE
 698uSxf6yRii8rt9kH0RbmUpq1KMAiYT9sV9XWixOZl2bmwhQcAKoNsmdqELp9fxF2ewCq/meYF
 SC7HD9n4M56b+ag7HNNfyW9bXsuY=
X-Gm-Gg: ASbGncuQRkWaV3I2aPKO3/W6s8RWLhzR6gyZsbl+TjEBX/+HsnBSFr44TWkG/icBlZG
 KNn3m4Hc9/ORD2T0v14WKAzUdCWhcUi+wvY9S4Q==
X-Google-Smtp-Source: AGHT+IHll+MhthP4/+kxpxt+aFJxJLlOi1Nj/wPzNf2LzsPDLGoQqz9Z71ltvDr65wF61D7sXC8SxhSUtYfhuQrvQY0=
X-Received: by 2002:a17:90b:51c5:b0:2ee:948b:72d3 with SMTP id
 98e67ed59e1d1-2f548f04dfbmr4614996a91.1.1736455271361; Thu, 09 Jan 2025
 12:41:11 -0800 (PST)
MIME-Version: 1.0
References: <20250109201740.GEZ4Au5ESOtQd4o1R3@fat_crate.local>
In-Reply-To: <20250109201740.GEZ4Au5ESOtQd4o1R3@fat_crate.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Jan 2025 15:40:59 -0500
X-Gm-Features: AbW1kvZgRnIzZwwnKvJS1-I8KOK5TkCxSkfn0TpC9lK6xqhrEABzZDSqJqM6kek
Message-ID: <CADnq5_OfmegA2XzeCuUNq5PmvbQrX6cdn8vPOUMf4x4BQGb5fQ@mail.gmail.com>
Subject: Re: kmemleak: Found object by alias at 0xffff888107b65918
To: Borislav Petkov <bp@alien8.de>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Jan 9, 2025 at 3:29=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrote=
:
>
> Hi folks,
>
> this is rc6 + tip/master, machine is Carrizo laptop.

Possibly fixed by this patch?
https://lore.kernel.org/lkml/CAJZ5v0i=3Dap+w4QZ8f2DsaHY6D=3DXUEuSNjyQ-2_=3D=
DGOLfZjdn+w@mail.gmail.com/T/

Alex

>
> full dmesg attached.
>
> Thx.
>
> ...
> [   13.271015] [drm] DM_PPLIB:    level           : 8
> [   13.271658] [drm] Display Core v3.2.310 initialized on DCE 11.0
> [   13.351651] kmemleak: Found object by alias at 0xffff888107b65918
> [   13.352365] CPU: 0 UID: 0 PID: 1216 Comm: systemd-udevd Not tainted 6.=
13.0-rc6+ #1
> [   13.352642] Hardware name: HP HP EliteBook 745 G3/807E, BIOS N73 Ver. =
01.39 04/16/2019
> [   13.352928] Call Trace:
> [   13.353023]  <TASK>
> [   13.353108]  dump_stack_lvl+0x71/0xa0
> [   13.353257]  __lookup_object+0x80/0x90
> [   13.353403]  delete_object_full+0x39/0xa0
> [   13.353555]  kfree+0x1dc/0x390
> [   13.353676]  dm_helpers_probe_acpi_edid+0xd3/0x130 [amdgpu]
> [   13.355424]  ? __pfx_dm_helpers_probe_acpi_edid+0x10/0x10 [amdgpu]
> [   13.357127]  edid_block_read+0x50/0x100
> [   13.357279]  _drm_do_get_edid+0xe8/0x380
> [   13.357429]  ? __pfx_dm_helpers_probe_acpi_edid+0x10/0x10 [amdgpu]
> [   13.359131]  drm_edid_read_custom+0x2e/0xc0
> [   13.359296]  dm_helpers_read_local_edid+0x83/0x2a0 [amdgpu]
> [   13.360992]  detect_link_and_local_sink+0x1db/0x1190 [amdgpu]
> [   13.362715]  ? lock_acquire+0xe0/0x300
> [   13.362864]  ? amdgpu_dm_init+0x12b5/0x2150 [amdgpu]
> [   13.364528]  ? __mutex_lock+0x7e5/0xd00
> [   13.364680]  ? amdgpu_dm_init+0x12b5/0x2150 [amdgpu]
> [   13.366345]  ? dal_gpio_destroy+0x44/0x70 [amdgpu]
> [   13.368016]  link_detect+0x30/0x530 [amdgpu]
> [   13.369670]  ? dal_gpio_destroy_irq+0x21/0x40 [amdgpu]
> [   13.371364]  ? query_hpd_status+0x60/0x80 [amdgpu]
> [   13.373060]  amdgpu_dm_init+0x12d3/0x2150 [amdgpu]
> [   13.374719]  dm_hw_init+0x1a/0x40 [amdgpu]
> [   13.376349]  ? pp_hw_init+0x16/0x40 [amdgpu]
> [   13.377994]  amdgpu_device_init+0x20d5/0x2720 [amdgpu]
> [   13.379606]  ? _raw_spin_unlock_irqrestore+0x56/0x70
> [   13.379800]  amdgpu_driver_load_kms+0x23/0xc0 [amdgpu]
> [   13.381427]  amdgpu_pci_probe+0x1c9/0x5a0 [amdgpu]
> [   13.383011]  local_pci_probe+0x53/0xb0
> [   13.383159]  pci_device_probe+0xcc/0x1d0
> [   13.383309]  really_probe+0xda/0x390
> [   13.383448]  ? pm_runtime_barrier+0x61/0xb0
> [   13.383606]  ? __pfx___driver_attach+0x10/0x10
> [   13.383772]  __driver_probe_device+0x78/0x150
> [   13.383934]  driver_probe_device+0x2d/0xb0
> [   13.384088]  __driver_attach+0xdc/0x1d0
> [   13.384233]  bus_for_each_dev+0x6a/0xb0
> [   13.384381]  bus_add_driver+0x139/0x260
> [   13.384526]  driver_register+0x55/0x100
> [   13.384671]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
> [   13.386278]  do_one_initcall+0x60/0x2b0
> [   13.386430]  ? __kmalloc_cache_noprof+0x2c5/0x3c0
> [   13.386612]  do_init_module+0x60/0x230
> [   13.386756]  init_module_from_file+0x89/0xc0
> [   13.386920]  idempotent_init_module+0x113/0x320
> [   13.387094]  __x64_sys_finit_module+0x7b/0xf0
> [   13.387257]  do_syscall_64+0x64/0x130
> [   13.387399]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   13.387586] RIP: 0033:0x7f39c5922059
> [   13.387725] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8f 1d 0d 00 f7 d8 64 89 01 48
> [   13.388386] RSP: 002b:00007ffc51f9cc18 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000139
> [   13.388662] RAX: ffffffffffffffda RBX: 0000558cb28bf670 RCX: 00007f39c=
5922059
> [   13.388919] RDX: 0000000000000000 RSI: 00007f39c5815ded RDI: 000000000=
0000016
> [   13.389176] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000558cb=
28b4a68
> [   13.389432] R10: 0000000000000016 R11: 0000000000000246 R12: 00007f39c=
5815ded
> [   13.389688] R13: 0000000000000000 R14: 0000558cb28baa10 R15: 0000558cb=
28bf670
> [   13.389949]  </TASK>
>
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
