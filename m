Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C813A5B318D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 10:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0A510EBEF;
	Fri,  9 Sep 2022 08:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC0410EBEC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 08:21:11 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so4663175pjp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 01:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=fOkT0Hz2ztO6dhwPOAE25fkbFVXvPUfNFCjmjS3XSGg=;
 b=P7fTOlF1RQByq+FvLVlzxZ0OXiAADVBXhraQOO6kHM/9yTJMtpxR3OQIxUJDG+sZJ3
 knSwht9BOZqm9VIjZo2iHBmI+ap9ZCqK1tQL1lTa3wygMAArW4YaKKa5YEc5GxFFt4PM
 eWp0aRjwSiEmNznlxtVMt5IYZseoUp9IKpsxcpgOh90M9pKELvxgxu3A4q6cM2ZKURM9
 zEDuVx/vxEPwPac2xylCm562ocTCff5GkMLpKTIdqROJsmwmfmPXZxoQvbzFUVZ5YNKh
 DmAB1OAjjtsIXR4zIPKUv09S88BXOnUCsbdYCWqsbCeSbyFaAMDwFcU7XCq7UA8euZ12
 g1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fOkT0Hz2ztO6dhwPOAE25fkbFVXvPUfNFCjmjS3XSGg=;
 b=yIiAUsIGCVGOZonL5z5fyXOz6K+MC7LXvWX53J+5nGFKNJ6jz49UteVQeFxalWmsQw
 qcvmiBEy6RALfEx1gWxo7WrGiLAZBWLg8BhjcNfkvWdIYQsXapfxt3M3p4/WLd7M1D85
 O/IhvyzKaaznh69+mqnkySfFtHk0rL1Dk4QLy3YtfL8jMB3YH/m7Gdw8hqKg+NV4wFj1
 wUz92HwQxFao8/TK2mf/FNp7zq4rMJe/dYwYUMq52XG/ITm3pAYmF375B+3JpLnKocJz
 KQZn6maMBfWq6t4lNvFj/z77zG9Ep+E4iJ/Eor9IN1ot8uh/IIPuqq427QD4qlRqiO/R
 QjLw==
X-Gm-Message-State: ACgBeo089GmQD0HzjGZaeIyQSG8lCmLUGnvIrikXzREIi7cJnvPcpVZZ
 6Wl/YyG4I3ybfPX9OLKVB1rsN0PnR9YEBif/6QQ=
X-Google-Smtp-Source: AA6agR4HUcdpG4HoFBX7Rg4G+88NeuLfijS+hxbh4ZCTIWAVf25eVbEj3AF1vfQKQtZiq9fIJCl9y5mp4crNYk1GSOs=
X-Received: by 2002:a17:903:204d:b0:176:ca4e:37d4 with SMTP id
 q13-20020a170903204d00b00176ca4e37d4mr12931775pla.106.1662711670501; Fri, 09
 Sep 2022 01:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220906203852.527663-1-hdegoede@redhat.com>
 <20220906203852.527663-3-hdegoede@redhat.com>
In-Reply-To: <20220906203852.527663-3-hdegoede@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 9 Sep 2022 10:20:59 +0200
Message-ID: <CAMeQTsZEuhwDBsUAqtbSmC+uPpJh6V7z9c+0ahPC83Hv1TsOOw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/gma500: Fix WARN_ON(lock->magic != lock) error
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 6, 2022 at 10:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> psb_gem_unpin() calls dma_resv_lock() but the underlying ww_mutex
> gets destroyed by drm_gem_object_release() move the
> drm_gem_object_release() call in psb_gem_free_object() to after
> the unpin to fix the below warning:

Looks good. I'll apply this to drm-misc-fixes. Let me know if it
should go somewhere else.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

>
> [   79.693962] ------------[ cut here ]------------
> [   79.693992] DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> [   79.694015] WARNING: CPU: 0 PID: 240 at kernel/locking/mutex.c:582 __w=
w_mutex_lock.constprop.0+0x569/0xfb0
> [   79.694052] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer qrtr b=
nep ath9k ath9k_common ath9k_hw snd_hda_codec_realtek snd_hda_codec_generic=
 ledtrig_audio snd_hda_codec_hdmi snd_hda_intel ath3k snd_intel_dspcfg mac8=
0211 snd_intel_sdw_acpi btusb snd_hda_codec btrtl btbcm btintel btmtk bluet=
ooth at24 snd_hda_core snd_hwdep uvcvideo snd_seq libarc4 videobuf2_vmalloc=
 ath videobuf2_memops videobuf2_v4l2 videobuf2_common snd_seq_device videod=
ev acer_wmi intel_powerclamp coretemp mc snd_pcm joydev sparse_keymap ecdh_=
generic pcspkr wmi_bmof cfg80211 i2c_i801 i2c_smbus snd_timer snd r8169 rfk=
ill lpc_ich soundcore acpi_cpufreq zram rtsx_pci_sdmmc mmc_core serio_raw r=
tsx_pci gma500_gfx(E) video wmi ip6_tables ip_tables i2c_dev fuse
> [   79.694436] CPU: 0 PID: 240 Comm: plymouthd Tainted: G        W   E   =
   6.0.0-rc3+ #490
> [   79.694457] Hardware name: Packard Bell dot s/SJE01_CT, BIOS V1.10 07/=
23/2013
> [   79.694469] RIP: 0010:__ww_mutex_lock.constprop.0+0x569/0xfb0
> [   79.694496] Code: ff 85 c0 0f 84 15 fb ff ff 8b 05 ca 3c 11 01 85 c0 0=
f 85 07 fb ff ff 48 c7 c6 30 cb 84 aa 48 c7 c7 a3 e1 82 aa e8 ac 29 f8 ff <=
0f> 0b e9 ed fa ff ff e8 5b 83 8a ff 85 c0 74 10 44 8b 0d 98 3c 11
> [   79.694513] RSP: 0018:ffffad1dc048bbe0 EFLAGS: 00010282
> [   79.694623] RAX: 0000000000000028 RBX: 0000000000000000 RCX: 000000000=
0000000
> [   79.694636] RDX: 0000000000000001 RSI: ffffffffaa8b0ffc RDI: 00000000f=
fffffff
> [   79.694650] RBP: ffffad1dc048bc80 R08: 0000000000000000 R09: ffffad1dc=
048ba90
> [   79.694662] R10: 0000000000000003 R11: ffffffffaad62fe8 R12: ffff9ff30=
2103138
> [   79.694675] R13: ffff9ff306ec8000 R14: ffff9ff307779078 R15: ffff9ff30=
14c0270
> [   79.694690] FS:  00007ff1cccf1740(0000) GS:ffff9ff3bc200000(0000) knlG=
S:0000000000000000
> [   79.694705] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   79.694719] CR2: 0000559ecbcb4420 CR3: 0000000013210000 CR4: 000000000=
00006f0
> [   79.694734] Call Trace:
> [   79.694749]  <TASK>
> [   79.694761]  ? __schedule+0x47f/0x1670
> [   79.694796]  ? psb_gem_unpin+0x27/0x1a0 [gma500_gfx]
> [   79.694830]  ? lock_is_held_type+0xe3/0x140
> [   79.694864]  ? ww_mutex_lock+0x38/0xa0
> [   79.694885]  ? __cond_resched+0x1c/0x30
> [   79.694902]  ww_mutex_lock+0x38/0xa0
> [   79.694925]  psb_gem_unpin+0x27/0x1a0 [gma500_gfx]
> [   79.694964]  psb_gem_unpin+0x199/0x1a0 [gma500_gfx]
> [   79.694996]  drm_gem_object_release_handle+0x50/0x60
> [   79.695020]  ? drm_gem_object_handle_put_unlocked+0xf0/0xf0
> [   79.695042]  idr_for_each+0x4b/0xb0
> [   79.695066]  ? _raw_spin_unlock_irqrestore+0x30/0x60
> [   79.695095]  drm_gem_release+0x1c/0x30
> [   79.695118]  drm_file_free.part.0+0x1ea/0x260
> [   79.695150]  drm_release+0x6a/0x120
> [   79.695175]  __fput+0x9f/0x260
> [   79.695203]  task_work_run+0x59/0xa0
> [   79.695227]  do_exit+0x387/0xbe0
> [   79.695250]  ? seqcount_lockdep_reader_access.constprop.0+0x82/0x90
> [   79.695275]  ? lockdep_hardirqs_on+0x7d/0x100
> [   79.695304]  do_group_exit+0x33/0xb0
> [   79.695331]  __x64_sys_exit_group+0x14/0x20
> [   79.695353]  do_syscall_64+0x58/0x80
> [   79.695376]  ? up_read+0x17/0x20
> [   79.695401]  ? lock_is_held_type+0xe3/0x140
> [   79.695429]  ? asm_exc_page_fault+0x22/0x30
> [   79.695450]  ? lockdep_hardirqs_on+0x7d/0x100
> [   79.695473]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [   79.695493] RIP: 0033:0x7ff1ccefe3f1
> [   79.695516] Code: Unable to access opcode bytes at RIP 0x7ff1ccefe3c7.
> [   79.695607] RSP: 002b:00007ffed4413378 EFLAGS: 00000246 ORIG_RAX: 0000=
0000000000e7
> [   79.695629] RAX: ffffffffffffffda RBX: 00007ff1cd0159e0 RCX: 00007ff1c=
cefe3f1
> [   79.695644] RDX: 000000000000003c RSI: 00000000000000e7 RDI: 000000000=
0000000
> [   79.695656] RBP: 0000000000000000 R08: ffffffffffffff80 R09: 00007ff1c=
d020b20
> [   79.695671] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ff1c=
d0159e0
> [   79.695684] R13: 0000000000000000 R14: 00007ff1cd01aee8 R15: 00007ff1c=
d01af00
> [   79.695733]  </TASK>
> [   79.695746] irq event stamp: 725979
> [   79.695757] hardirqs last  enabled at (725979): [<ffffffffa9132d54>] f=
inish_task_switch.isra.0+0xe4/0x3f0
> [   79.695780] hardirqs last disabled at (725978): [<ffffffffa9eb4113>] _=
_schedule+0xdd3/0x1670
> [   79.695803] softirqs last  enabled at (725974): [<ffffffffa90fbc9d>] _=
_irq_exit_rcu+0xed/0x160
> [   79.695825] softirqs last disabled at (725969): [<ffffffffa90fbc9d>] _=
_irq_exit_rcu+0xed/0x160
> [   79.695845] ---[ end trace 0000000000000000 ]---
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/gma500/gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index dffe37490206..4b7627a72637 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -112,12 +112,12 @@ static void psb_gem_free_object(struct drm_gem_obje=
ct *obj)
>  {
>         struct psb_gem_object *pobj =3D to_psb_gem_object(obj);
>
> -       drm_gem_object_release(obj);
> -
>         /* Undo the mmap pin if we are destroying the object */
>         if (pobj->mmapping)
>                 psb_gem_unpin(pobj);
>
> +       drm_gem_object_release(obj);
> +
>         WARN_ON(pobj->in_gart && !pobj->stolen);
>
>         release_resource(&pobj->resource);
> --
> 2.37.2
>
