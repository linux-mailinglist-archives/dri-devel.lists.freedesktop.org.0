Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA8401167
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 21:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2566589A74;
	Sun,  5 Sep 2021 19:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FDB89A74
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 19:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630871123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAaAb7dOM6Vm6PcfEq+fUdCLui4qbh5QAcklMjh9SK4=;
 b=cgD+7/F2XDd8e2nHr/A3CQ12TuSlGKajQ55CN6jYdAHgvBjJNG/WKBkTmifEsGpnc0DPUx
 JjBpmxQT/aMFJEfy81pQ8klKzJZuODy1wNxcRPTyF+Akg2uZ8b87wZ/7Jy+BxhB4tJiBPf
 NmIn2PO9ASK/M1KOaR+i5ja82QyWlSA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-SDfI9v8EMYuoteJhgsS_kg-1; Sun, 05 Sep 2021 15:45:20 -0400
X-MC-Unique: SDfI9v8EMYuoteJhgsS_kg-1
Received: by mail-ot1-f72.google.com with SMTP id
 w35-20020a056830412300b0051bae474534so3234950ott.21
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Sep 2021 12:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=sAaAb7dOM6Vm6PcfEq+fUdCLui4qbh5QAcklMjh9SK4=;
 b=jVt9TlNCxTmXo2LzhRrLuVjvsGBEnvuvtL77cVK3/E6+prpbseA1sD3qqZYKqNJJwm
 8nFzf/OxTqnLmNm2b7b7qj2iE+FDjmeb1oHgt2adxY2oATIjMTU6XGyWQgRu/EMDZv3u
 8APX3cvomFUCyl7UTPKyj7hSarbQk4pgCVoMoSEAdjyPvtDqxIXb2UbO7uvnNLdDhzqX
 n/K/szRVSCU/9vHe+MIfdXnZDtLrRxvIkbTi15EnvlHQgrsvH4yegtDt+RJDZNmZckG0
 dIjekIWBb81sCx/9tGj/JwDQo+61WiYYQYbZDCy4Q8hCbi0vAZqD7tDIFFamWRKXoN/c
 V2Ng==
X-Gm-Message-State: AOAM530IZeyNJ26vPDj1pd/jm/1t0TztdCMqYFjPJrss+JYWeoj+nPbh
 8/h/dFOHEjaOU83ZHqts6DS/Jc7i6XiUz66hpWz2ept3u8ld6lBgCNnOq27WB3pw/pU6DfltOSo
 eyRbc/5w8s2iAGrHI8sq4/gyUfAMpB1Zja/ZR+rdRb9HD
X-Received: by 2002:a05:6808:1787:: with SMTP id
 bg7mr6461144oib.39.1630871119230; 
 Sun, 05 Sep 2021 12:45:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYo3qfPSqFAHmdEmKu00zUgDANFHg9vGMDoShOhmC5JW7RDCe6X+JxWsdQcs+vFRzBIBVl1+uuzXflIMU4VV4=
X-Received: by 2002:a05:6808:1787:: with SMTP id
 bg7mr6461132oib.39.1630871118923; 
 Sun, 05 Sep 2021 12:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAEbev+p-Q=RUBeVkRRAhMpkGJYxXECbyCh2Cuj3QA4Te=0xHLg@mail.gmail.com>
In-Reply-To: <CAEbev+p-Q=RUBeVkRRAhMpkGJYxXECbyCh2Cuj3QA4Te=0xHLg@mail.gmail.com>
From: David Airlie <airlied@redhat.com>
Date: Mon, 6 Sep 2021 05:45:07 +1000
Message-ID: <CAMwc25rjtyqLXVcrr88hikuHvwHThnMKJxbtqUGU0_jP80Dt2w@mail.gmail.com>
Subject: Re: Kernel 5.14.0 - invalid opcode: 0000 [#1] SMP NOPTI
To: Andrew Falcon <bluestang2006@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "Deucher, Alex" <alexdeucher@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

cc'ing lists/people

On Sun, Sep 5, 2021 at 11:50 AM Andrew Falcon <bluestang2006@gmail.com> wro=
te:
>
> Hello,
>
> I am encountering a kernel panic with the error in the subject line using=
 kernel 5.14.0 (final). Kernel 5.14.0-rc7 works without issue for me so loo=
king back at the last amdgpu commits for 5.14.0 (final) not sure which one =
is at fault and causing the panic - https://cgit.freedesktop.org/drm/drm/ta=
g/?h=3Ddrm-fixes-2021-08-27
>
> I filed a kernel bug here - https://bugs.launchpad.net/ubuntu/+source/lin=
ux/+bug/1942684 with a full log attached in the report. I am not sure if a =
separate bug report is needed in drm kernel? I'm hoping I can get some advi=
ce on who needs to be aware of this bug or how to bring it to the right dev=
eloper's attention...
>
> Below is the boot log and the specific error message:
>
> Sep 04 09:07:39 bluestang-pc kernel: [drm] initializing kernel modesettin=
g (SIENNA_CICHLID 0x1002:0x73BF 0x1849:0x5201 0xC1).
> Sep 04 09:07:39 bluestang-pc kernel: amdgpu 0000:2f:00.0: amdgpu: Trusted=
 Memory Zone (TMZ) feature not supported
> Sep 04 09:07:39 bluestang-pc kernel: [drm] register mmio base: 0xFC900000
> Sep 04 09:07:39 bluestang-pc kernel: [drm] register mmio size: 1048576
> Sep 04 09:07:39 bluestang-pc kernel: invalid opcode: 0000 [#1] SMP NOPTI
> Sep 04 09:07:39 bluestang-pc kernel: CPU: 1 PID: 533 Comm: systemd-udevd =
Not tainted 5.14.1-051401-generic #202109030936
> Sep 04 09:07:39 bluestang-pc kernel: Hardware name: Micro-Star Internatio=
nal Co., Ltd. MS-7C84/MAG X570 TOMAHAWK WIFI (MS-7C84), BIOS 1.81 08/05/202=
1
> Sep 04 09:07:39 bluestang-pc kernel: RIP: 0010:amdgpu_discovery_reg_base_=
init+0x225/0x260 [amdgpu]
> Sep 04 09:07:39 bluestang-pc kernel: Code: 0f 85 d4 fe ff ff 48 83 45 c0 =
01 48 8b 45 c0 39 45 c8 0f 8f 55 fe ff ff 8b 45 b4 48 8d 65 d8 5b 41 5c 41 =
5d 41 5e 41 5f 5d c3 <0f> 0b 48 c7 c7 e4 5a 61 c1 e8 9d 79 10 ff eb de 41 8=
9 d0 48 c7 c7
> Sep 04 09:07:39 bluestang-pc kernel: RSP: 0018:ffffb883c1907928 EFLAGS: 0=
0010202
> Sep 04 09:07:39 bluestang-pc kernel: RAX: 0000000000000008 RBX: ffff99558=
b89f128 RCX: 0000000000000006
> Sep 04 09:07:39 bluestang-pc kernel: RDX: ffffffffc1615b69 RSI: ffffffffc=
15c0428 RDI: 0000000000000000
> Sep 04 09:07:39 bluestang-pc kernel: RBP: ffffb883c1907978 R08: 000000000=
0000008 R09: 000000000000000b
> Sep 04 09:07:39 bluestang-pc kernel: R10: ffff99558b89f120 R11: 000000000=
0000000 R12: ffff995587c00000
> Sep 04 09:07:39 bluestang-pc kernel: R13: 0000000000000019 R14: 000000000=
0000019 R15: ffff99558b89f120
> Sep 04 09:07:39 bluestang-pc kernel: FS:  00007f3d5b7138c0(0000) GS:ffff9=
95c7ea40000(0000) knlGS:0000000000000000
> Sep 04 09:07:39 bluestang-pc kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000=
0000080050033
> Sep 04 09:07:39 bluestang-pc kernel: CR2: 00007fc505b6c420 CR3: 000000010=
6d90000 CR4: 0000000000750ee0
> Sep 04 09:07:39 bluestang-pc kernel: PKRU: 55555554
> Sep 04 09:07:39 bluestang-pc kernel: Call Trace:
> Sep 04 09:07:39 bluestang-pc kernel:  nv_set_ip_blocks+0x8e/0xab0 [amdgpu=
]
> Sep 04 09:07:39 bluestang-pc kernel:  amdgpu_device_ip_early_init+0x2b1/0=
x47f [amdgpu]
> Sep 04 09:07:39 bluestang-pc kernel:  ? amdgpu_device_get_job_timeout_set=
tings+0x90/0x1cc [amdgpu]
> Sep 04 09:07:39 bluestang-pc kernel:  amdgpu_device_init.cold+0xc9/0x6d1 =
[amdgpu]
> Sep 04 09:07:39 bluestang-pc kernel:  amdgpu_driver_load_kms+0x6d/0x310 [=
amdgpu]
> Sep 04 09:07:39 bluestang-pc kernel:  amdgpu_pci_probe+0x11b/0x1a0 [amdgp=
u]
> Sep 04 09:07:39 bluestang-pc kernel:  local_pci_probe+0x48/0x80
> Sep 04 09:07:39 bluestang-pc kernel:  pci_device_probe+0x105/0x1d0
> Sep 04 09:07:39 bluestang-pc kernel:  really_probe+0x1fe/0x400
> Sep 04 09:07:39 bluestang-pc kernel:  __driver_probe_device+0x109/0x180
> Sep 04 09:07:39 bluestang-pc kernel:  driver_probe_device+0x23/0x90
> Sep 04 09:07:39 bluestang-pc kernel:  __driver_attach+0xac/0x1b0
> Sep 04 09:07:39 bluestang-pc kernel:  ? __device_attach_driver+0xe0/0xe0
> Sep 04 09:07:39 bluestang-pc kernel:  bus_for_each_dev+0x7e/0xc0
> Sep 04 09:07:39 bluestang-pc kernel:  driver_attach+0x1e/0x20
> Sep 04 09:07:39 bluestang-pc kernel:  bus_add_driver+0x135/0x1f0
> Sep 04 09:07:39 bluestang-pc kernel:  driver_register+0x95/0xf0
> Sep 04 09:07:39 bluestang-pc kernel:  __pci_register_driver+0x68/0x70
> Sep 04 09:07:39 bluestang-pc kernel:  amdgpu_init+0x7c/0x1000 [amdgpu]
> Sep 04 09:07:39 bluestang-pc kernel:  ? 0xffffffffc0e95000
> Sep 04 09:07:39 bluestang-pc kernel:  do_one_initcall+0x48/0x1d0
> Sep 04 09:07:39 bluestang-pc kernel:  ? kmem_cache_alloc_trace+0x159/0x2c=
0
> Sep 04 09:07:39 bluestang-pc kernel:  do_init_module+0x62/0x290
> Sep 04 09:07:39 bluestang-pc kernel:  load_module+0xaa8/0xb40
> Sep 04 09:07:39 bluestang-pc kernel:  __do_sys_finit_module+0xbf/0x120
> Sep 04 09:07:39 bluestang-pc kernel:  __x64_sys_finit_module+0x18/0x20
> Sep 04 09:07:39 bluestang-pc kernel:  do_syscall_64+0x5c/0xc0
> Sep 04 09:07:39 bluestang-pc kernel:  ? exit_to_user_mode_prepare+0x37/0x=
b0
> Sep 04 09:07:39 bluestang-pc kernel:  ? syscall_exit_to_user_mode+0x27/0x=
50
> Sep 04 09:07:39 bluestang-pc kernel:  ? __x64_sys_newfstatat+0x1c/0x20
> Sep 04 09:07:39 bluestang-pc kernel:  ? do_syscall_64+0x69/0xc0
> Sep 04 09:07:39 bluestang-pc kernel:  ? do_syscall_64+0x69/0xc0
> Sep 04 09:07:39 bluestang-pc kernel:  entry_SYSCALL_64_after_hwframe+0x44=
/0xae
> Sep 04 09:07:39 bluestang-pc kernel: RIP: 0033:0x7f3d5bbcbf6d
> Sep 04 09:07:39 bluestang-pc kernel: Code: 28 0d 00 0f 05 eb a9 66 0f 1f =
44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 =
4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d cb de 0c 00 f7 d=
8 64 89 01 48
> Sep 04 09:07:39 bluestang-pc kernel: RSP: 002b:00007fffa53a9048 EFLAGS: 0=
0000246 ORIG_RAX: 0000000000000139
> Sep 04 09:07:39 bluestang-pc kernel: RAX: ffffffffffffffda RBX: 000055866=
fe87bf0 RCX: 00007f3d5bbcbf6d
> Sep 04 09:07:39 bluestang-pc kernel: RDX: 0000000000000000 RSI: 00007f3d5=
bd71e2d RDI: 000000000000001a
> Sep 04 09:07:39 bluestang-pc kernel: RBP: 0000000000020000 R08: 000000000=
0000000 R09: 000055866e61889d
> Sep 04 09:07:39 bluestang-pc kernel: R10: 000000000000001a R11: 000000000=
0000246 R12: 00007f3d5bd71e2d
> Sep 04 09:07:39 bluestang-pc kernel: R13: 0000000000000000 R14: 000055866=
fd4d9e0 R15: 000055866fe87bf0
> Sep 04 09:07:39 bluestang-pc kernel: Modules linked in: snd_hda_codec_hdm=
i snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec iwlmvm(+)=
 snd_hda_core amd64_edac(-) snd_hwdep amdgpu(+) edac_mce_amd fjes(-) snd_pc=
m mac80211 snd_seq_midi snd_seq_midi_event kvm_amd iommu_v2 libarc4 gpu_sch=
ed snd_rawmidi drm_ttm_helper kvm btusb ttm btrtl iwlwifi snd_seq btbcm drm=
_kms_helper btintel crct10dif_pclmul ghash_clmulni_intel snd_seq_device blu=
etooth aesni_intel cec snd_timer rc_core ucsi_ccg i2c_algo_bit snd crypto_s=
imd typec_ucsi fb_sys_fops cryptd syscopyarea joydev ecdh_generic sysfillre=
ct rapl wmi_bmof typec ecc efi_pstore sysimgblt cfg80211 soundcore k10temp =
ccp mac_hid sch_fq_codel msr parport_pc ppdev lp parport drm ip_tables x_ta=
bles autofs4 hid_generic usbhid hid xhci_pci ahci r8169 nvme crc32_pclmul i=
2c_designware_pci xhci_pci_renesas i2c_piix4 libahci realtek nvme_core wmi
> Sep 04 09:07:39 bluestang-pc kernel: ---[ end trace a2f802476d316123 ]---
>
>

