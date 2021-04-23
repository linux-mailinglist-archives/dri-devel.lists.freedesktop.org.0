Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627C9369A92
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 21:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F986EC2D;
	Fri, 23 Apr 2021 19:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474C96E190;
 Fri, 23 Apr 2021 19:00:06 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso23684850otl.0; 
 Fri, 23 Apr 2021 12:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0o8YsKPbK9n+ndRN2Vz6EJYEmhROyvarHJTuZPEflmo=;
 b=TUoGQ2idbkgeKBd7H6e+7VnfvpIWJcmUBsuoFOpZY0GxgsTthuJ+Yyl3AwaEvVv5r6
 tbvfAdBGAJk7QS0Nqr2sXSJLYeSPtBxz6ReyyQzGr58fZvgqc2SJMqq3ZT0ypKf+l38p
 5pLB2spdVUbTb/mjJALfnsMbekDSU+3IdIlSTUL3ksn7CWreJUomMKrwx/SAsAKU7Zri
 iVtKjmpvt6KnmJaJpQWCRsCkBRLM6Mv79yc60bUE49T1yFNTj5f1ZC+0hNtff7RPVhxL
 dyDgnPb8P2lnhrJ9GZm8sqwjYw0F14pxwxhVFp+A++oYwmB7S5/9gJHlFNG7XZ8O7B9x
 BBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0o8YsKPbK9n+ndRN2Vz6EJYEmhROyvarHJTuZPEflmo=;
 b=Tab7Dmff6i1uAzh5Dvl/nXTTh26PosnS5S1lARguY1GbyONWW9sxa89MXv+JJUtAAt
 CK5HQzY6yxHxvRK2jI/xLBm9hErQ+P+dbjdJ4O8zWCTIp62DQdLm9MqONTVE1u/YKj+M
 c/P/rnRtzmKNySDxcGOHTVp9dpUhjGv+Z8lxY/WAK8K9+/YlSfwxJy5f6+lWkomTcLVP
 3EP6n2PNXWiqlgJ4jf2HPzAs4FOmvIJcMZSAEtawUwnRd8Q/1q6sntEDMJro0xwLnU9D
 gYX/QnMt23ZasY9DbwLlNUmeQT6hfyC3BfHlLTqwe7izzVlX2oQj/rmbPjRrV9QhVWDK
 mUYA==
X-Gm-Message-State: AOAM532vMk8i2Oj0yySzGspP8IUOq/i6xlJPK+KFiXM31cuWeQRFZNrd
 VF1oN8fZlPRGSyKhrdKxGCsBwQ3IXdvQUR+GHpk=
X-Google-Smtp-Source: ABdhPJwvqBI0PCB1jdyspoom0AX+75lO37FZqUwSZpYvy2a3NQEgRCZHdLB1PSFUjjgOB/tOgFmxGEXE+L0ZB50WJXI=
X-Received: by 2002:a05:6830:15d3:: with SMTP id
 j19mr4621881otr.23.1619204405457; 
 Fri, 23 Apr 2021 12:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210421174248.97506-1-kai.heng.feng@canonical.com>
In-Reply-To: <20210421174248.97506-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Apr 2021 14:59:54 -0400
Message-ID: <CADnq5_NcoKD8rfxUkVsRo7TVpoqp-3KK+EiaxtYj_iN8a0LPyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Register VGA clients after init can no longer
 fail
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 1:43 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> When an amdgpu device fails to init, it makes another VGA device cause
> kernel splat:
> kernel: amdgpu 0000:08:00.0: amdgpu: amdgpu_device_ip_init failed
> kernel: amdgpu 0000:08:00.0: amdgpu: Fatal error during GPU init
> kernel: amdgpu: probe of 0000:08:00.0 failed with error -110
> ...
> kernel: amdgpu 0000:01:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
> kernel: BUG: kernel NULL pointer dereference, address: 0000000000000018
> kernel: #PF: supervisor read access in kernel mode
> kernel: #PF: error_code(0x0000) - not-present page
> kernel: PGD 0 P4D 0
> kernel: Oops: 0000 [#1] SMP NOPTI
> kernel: CPU: 6 PID: 1080 Comm: Xorg Tainted: G        W         5.12.0-rc8+ #12
> kernel: Hardware name: HP HP EliteDesk 805 G6/872B, BIOS S09 Ver. 02.02.00 12/30/2020
> kernel: RIP: 0010:amdgpu_device_vga_set_decode+0x13/0x30 [amdgpu]
> kernel: Code: 06 31 c0 c3 b8 ea ff ff ff 5d c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 0f 1f 44 00 00 55 48 8b 87 90 06 00 00 48 89 e5 53 89 f3 <48> 8b 40 18 40 0f b6 f6 e8 40 58 39 fd 80 fb 01 5b 5d 19 c0 83 e0
> kernel: RSP: 0018:ffffae3c0246bd68 EFLAGS: 00010002
> kernel: RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> kernel: RDX: ffff8dd1af5a8560 RSI: 0000000000000000 RDI: ffff8dce8c160000
> kernel: RBP: ffffae3c0246bd70 R08: ffff8dd1af5985c0 R09: ffffae3c0246ba38
> kernel: R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000246
> kernel: R13: 0000000000000000 R14: 0000000000000003 R15: ffff8dce81490000
> kernel: FS:  00007f9303d8fa40(0000) GS:ffff8dd1af580000(0000) knlGS:0000000000000000
> kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kernel: CR2: 0000000000000018 CR3: 0000000103cfa000 CR4: 0000000000350ee0
> kernel: Call Trace:
> kernel:  vga_arbiter_notify_clients.part.0+0x4a/0x80
> kernel:  vga_get+0x17f/0x1c0
> kernel:  vga_arb_write+0x121/0x6a0
> kernel:  ? apparmor_file_permission+0x1c/0x20
> kernel:  ? security_file_permission+0x30/0x180
> kernel:  vfs_write+0xca/0x280
> kernel:  ksys_write+0x67/0xe0
> kernel:  __x64_sys_write+0x1a/0x20
> kernel:  do_syscall_64+0x38/0x90
> kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
> kernel: RIP: 0033:0x7f93041e02f7
> kernel: Code: 75 05 48 83 c4 58 c3 e8 f7 33 ff ff 0f 1f 80 00 00 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
> kernel: RSP: 002b:00007fff60e49b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> kernel: RAX: ffffffffffffffda RBX: 000000000000000b RCX: 00007f93041e02f7
> kernel: RDX: 000000000000000b RSI: 00007fff60e49b40 RDI: 000000000000000f
> kernel: RBP: 00007fff60e49b40 R08: 00000000ffffffff R09: 00007fff60e499d0
> kernel: R10: 00007f93049350b5 R11: 0000000000000246 R12: 000056111d45e808
> kernel: R13: 0000000000000000 R14: 000056111d45e7f8 R15: 000056111d46c980
> kernel: Modules linked in: nls_iso8859_1 snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core snd_pcm snd_seq input_leds snd_seq_device snd_timer snd soundcore joydev kvm_amd serio_raw k10temp mac_hid hp_wmi ccp kvm sparse_keymap wmi_bmof ucsi_acpi efi_pstore typec_ucsi rapl typec video wmi sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx libcrc32c xor raid6_pq raid1 raid0 multipath linear dm_mirror dm_region_hash dm_log hid_generic usbhid hid amdgpu drm_ttm_helper ttm iommu_v2 gpu_sched i2c_algo_bit drm_kms_helper syscopyarea sysfillrect crct10dif_pclmul sysimgblt crc32_pclmul fb_sys_fops ghash_clmulni_intel cec rc_core aesni_intel crypto_simd psmouse cryptd r8169 i2c_piix4 drm ahci xhci_pci realtek libahci xhci_pci_renesas gpio_amdpt gpio_generic
> kernel: CR2: 0000000000000018
> kernel: ---[ end trace 76d04313d4214c51 ]---
>
> Commit 4192f7b57689 ("drm/amdgpu: unmap register bar on device init
> failure") makes amdgpu_driver_unload_kms() skips amdgpu_device_fini(),
> so the VGA clients remain registered. So when
> vga_arbiter_notify_clients() iterates over registered clients, it causes
> NULL pointer dereference.
>
> Since there's no reason to register VGA clients that early, so solve
> the issue by putting them after all the goto cleanups.
>
> Fixes: 4192f7b57689 ("drm/amdgpu: unmap register bar on device init failure")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 +++++++++++-----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b4ad1c055c70..115a7699e11e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3410,19 +3410,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         /* doorbell bar mapping and doorbell index init*/
>         amdgpu_device_doorbell_init(adev);
>
> -       /* if we have > 1 VGA cards, then disable the amdgpu VGA resources */
> -       /* this will fail for cards that aren't VGA class devices, just
> -        * ignore it */
> -       if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> -               vga_client_register(adev->pdev, adev, NULL, amdgpu_device_vga_set_decode);
> -
> -       if (amdgpu_device_supports_px(ddev)) {
> -               px = true;
> -               vga_switcheroo_register_client(adev->pdev,
> -                                              &amdgpu_switcheroo_ops, px);
> -               vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
> -       }
> -
>         if (amdgpu_emu_mode == 1) {
>                 /* post the asic on emulation mode */
>                 emu_soc_asic_init(adev);
> @@ -3619,6 +3606,19 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         if (amdgpu_device_cache_pci_state(adev->pdev))
>                 pci_restore_state(pdev);
>
> +       /* if we have > 1 VGA cards, then disable the amdgpu VGA resources */
> +       /* this will fail for cards that aren't VGA class devices, just
> +        * ignore it */
> +       if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> +               vga_client_register(adev->pdev, adev, NULL, amdgpu_device_vga_set_decode);
> +
> +       if (amdgpu_device_supports_px(ddev)) {
> +               px = true;
> +               vga_switcheroo_register_client(adev->pdev,
> +                                              &amdgpu_switcheroo_ops, px);
> +               vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
> +       }
> +

If we move vga_switcheroo_init_domain_pm_ops() here, I think we can
remove the vga_switcheroo cleanup in the failed: label.

Alex


>         if (adev->gmc.xgmi.pending_reset)
>                 queue_delayed_work(system_wq, &mgpu_info.delayed_reset_work,
>                                    msecs_to_jiffies(AMDGPU_RESUME_MS));
> --
> 2.30.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
