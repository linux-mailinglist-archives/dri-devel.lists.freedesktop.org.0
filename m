Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D561C7774AD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 11:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DAF10E17C;
	Thu, 10 Aug 2023 09:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FEA10E4FC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 09:35:05 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-63cf3dcffe0so4596226d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vt-edu.20221208.gappssmtp.com; s=20221208; t=1691660104; x=1692264904;
 h=message-id:date:content-transfer-encoding:mime-version:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=uv75qCkyt70o1hFf27odc+wG4oxSQqlvtrl2bhz3v38=;
 b=h/aQepaqe8G6werpjapm8vSeIHEHJhZvVGJaNztMkf+t/3RKvwP+yqjEepfGiIJt6+
 840gtkuBvOJMGOf9ofEbzlk/VTCWbgSu/AZyZSOiB9ULD+BGLQJ+AFLwcM2h0y7QBAQQ
 X/Bx1YyZiVe8Cx4HVNtXiRQP9/H+fjsUs8KpX5GLjaBBuefzPdyPInei9h+tQfcGPrmp
 gNHBroUZstm7HbykFqw64vSuUpcDl6EDhHOuk/WVYLygODPl5CSiheZD95AI/41YXKCg
 oQ6thSo3V0gOMw5ouBelf3JCYzvr+itdhqOs1cYxX8CvXZYf9V+0qyaaETpFm4w7cPA7
 ZCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691660104; x=1692264904;
 h=message-id:date:content-transfer-encoding:mime-version:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uv75qCkyt70o1hFf27odc+wG4oxSQqlvtrl2bhz3v38=;
 b=c0pKo8LtLjRT9B+q5b8dVsUHMpvD14Hd3W77mIlq7YnOEmd+KvGxdpr/qB1oe4/QDK
 NaWzFb3iGhof6xqbOqN9ApR2wcKrZmHrkoVFwU8/K1eFhS5tKWA+QL3xm+WOV3d4ldTy
 Ni0dFKYHgdPbS+0L41k3NMFFye9t3C/26JQiVI11EvzNbvB/3Ao+GHLDTRWqQzfJj32c
 B0PEtx9ZytVXbYsqdRCzw3AdOtAQOEi5hi8RbQmGzz65L+9afeNfG2uSmNhVjSGbtb1V
 aP6IjDtSBBRMPyWNxS6HRz+s/kgFeQyvsVBzpHGFlNzF52KBohfrRtpRCSKOBOA4Rj35
 a7ww==
X-Gm-Message-State: AOJu0Yz1zXJYSsTqXftW3+ELgcg/S29MVaijdsUwWjY3RB+8oFITm0QD
 lye2Z7LU2fLo73jlfsNQmcVdkA==
X-Google-Smtp-Source: AGHT+IG1K2Swh2PzdHs3WkS6Xi5SbU9PeB4bSFiR14I1Uh+7gTsmkUMUkv7zR2CwtXuH/HJN66RREA==
X-Received: by 2002:a05:6214:21a9:b0:636:d181:46ec with SMTP id
 t9-20020a05621421a900b00636d18146ecmr1543732qvc.32.1691660104293; 
 Thu, 10 Aug 2023 02:35:04 -0700 (PDT)
Received: from turing-police (c-174-179-75-62.hsd1.va.comcast.net.
 [174.179.75.62]) by smtp.gmail.com with ESMTPSA id
 d6-20020a0ce446000000b0063c71b62239sm350146qvm.42.2023.08.10.02.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:35:03 -0700 (PDT)
From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?="
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.10.0-pre 07/05/2021 with nmh-1.8+dev
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Subject: next-20230726 and later - crash in radeon module during init
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1691660102_2972P";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Thu, 10 Aug 2023 05:35:02 -0400
Message-ID: <129403.1691660102@turing-police>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--==_Exmh_1691660102_2972P
Content-Type: text/plain; charset=us-ascii

I am seeing the following consistent crash at boot:

[   61.211213][  T819] [drm] radeon kernel modesetting enabled.
[   61.584870][  T819] vga_switcheroo: detected switching method \_SB_.PCI0.GFX0.ATPX handle
[   61.667507][  T819] ATPX version 1, functions 0x00000033
[   61.748228][  T819] general protection fault, probably for non-canonical address 0x54080068930549a0: 0000 [#1] PREEMPT SMP
[   61.829840][  T819] CPU: 3 PID: 819 Comm: (udev-worker) Tainted: G          I     T  6.5.0-rc4-next-20230804 #58 5cce04b101a5bb4a6c0368bfff037f6f096b3d3e
[   61.911411][  T819] Hardware name: Dell Inc. Inspiron 5559/052K07, BIOS 1.9.0 09/07/2020
[   61.993285][  T819] RIP: 0010:strnlen+0x21/0x40
[   62.074885][  T819] Code: 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 55 48 89 e5 48 8d 14 37 31 c0 48 85 f6 74 16 48 89 f8 eb 09 48 83 c0 01 48 39 c2 74 0e <80> 38 00 75 f2 48 29 f8 5d c3
cc cc cc cc 48 89 d0 5d 48 29 f8 c3
[   62.156529][  T819] RSP: 0018:ffffa310419979b8 EFLAGS: 00010202
[   62.318407][  T819] RAX: 54080068930549a0 RBX: ffffa31041997a20 RCX: 0000000000000000
[   62.400015][  T819] RDX: 54080068930549b0 RSI: 0000000000000010 RDI: 54080068930549a0
[   62.481624][  T819] RBP: ffffa310419979b8 R08: ffff937b85579990 R09: ffffa31041997ad8
[   62.563644][  T819] R10: ffff937b86ddae00 R11: 0000000000000000 R12: 54080068930549a0
[   62.645194][  T819] R13: ffff937b814291b8 R14: 0000000000000001 R15: ffffa31041997b81
[   62.726753][  T819] FS:  00007efd50479600(0000) GS:ffff937ef2e00000(0000) knlGS:0000000000000000
[   62.808312][  T819] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   62.889830][  T819] CR2: 00007f125d30ee70 CR3: 0000000105644002 CR4: 00000000003706e0
[   62.971390][  T819] Call Trace:
[   63.052954][  T819]  <TASK>
[   63.134501][  T819]  ? show_regs+0x64/0x70
[   63.216058][  T819]  ? die_addr+0x36/0x90
[   63.297594][  T819]  ? exc_general_protection+0x1c1/0x440
[   63.379112][  T819]  ? asm_exc_general_protection+0x2b/0x30
[   63.460650][  T819]  ? strnlen+0x21/0x40
[   63.542209][  T819]  set_dev_info+0x40/0x170
[   63.623762][  T819]  dev_printk_emit+0xa8/0xe0
[   63.705308][  T819]  __dev_printk+0x34/0x80
[   63.786806][  T819]  _dev_info+0x7a/0xa0
[   63.868304][  T819]  radeon_atpx_validate.constprop.0.isra.0+0xbc/0x100 [radeon f030e9a708043a486415a94978106b28cd7cb9a2]
[   63.949952][  T819]  radeon_atpx_detect+0x17b/0x190 [radeon f030e9a708043a486415a94978106b28cd7cb9a2]
[   64.031547][  T819]  ? __pfx_radeon_module_init+0x10/0x10 [radeon f030e9a708043a486415a94978106b28cd7cb9a2]
[   64.113102][  T819]  radeon_register_atpx_handler+0xd/0x30 [radeon f030e9a708043a486415a94978106b28cd7cb9a2]
[   64.194721][  T819]  radeon_module_init+0x84/0xff0 [radeon f030e9a708043a486415a94978106b28cd7cb9a2]
[   64.276365][  T819]  do_one_initcall+0x86/0x380
[   64.357865][  T819]  do_init_module+0x63/0x220
[   64.439342][  T819]  load_module+0x99d/0xa90

Some quick digging indicates the most likely culprit is:

commit cbd0606e6a776bf2ba10d4a6957bb7628c0da947
Author: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Date:   Thu Jul 20 15:39:24 2023 +0530

    drm/radeon: Prefer dev_* variant over printk

    Changed from pr_err/info to dev_* variants so that
    we get better debug info when there are multiple GPUs
    in the system.

Looks like this is the failure point because 'dev' is trashed:

+               dev_info(dev, "ATPX Hybrid Graphics\n");

But  I admit I don't know the APCI stuff well enough to see what, if
anything, is wrong with this:

+       struct acpi_device *adev = container_of(atpx->handle, struct acpi_device, handle);
+       struct device *dev = &adev->dev;

Any ideas?


--==_Exmh_1691660102_2972P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQEcBAEBCAAGBQJk1K9GAAoJEI0DS38y7CIcoOcH/iX3E8PPH2G3XQ+oniqGDCtF
02VFIZed9EEMB8M5gpF4bahpxcjEzuO0BPtYqOhN+6L1na1j+cEvzXuRd1FyUEdn
DszLR7EzDRd6gmFJcwGpUn53YbE/LU/afXi4tDFFlABV6yg9XL4kdqFzVlSVgsgP
2pu4nsJjQlFcz9TSmvkvFOLcyjY+Ew57xkkvdy3JD0dqAhow/UhKCMuWQFPVKUFZ
i+ynDjNJKPHoaEJ5LffVqxW5VCRMFatcCJvuXJBdnOJNZi+2tJSTJLrmGM1m8Mwf
styef7V6eyhIBI2f9d0p06dVkw2KufUIzFcdTuBHwXdDScCyrFNvd+6Dxl2SuOo=
=bD3h
-----END PGP SIGNATURE-----

--==_Exmh_1691660102_2972P--
