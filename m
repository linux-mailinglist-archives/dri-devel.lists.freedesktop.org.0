Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD9D44E395
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 10:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74646E929;
	Fri, 12 Nov 2021 09:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9BC89BAC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 17:03:16 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g91-20020a9d12e4000000b0055ae68cfc3dso9793840otg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 09:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mV7Svxbj6a7twrtS2MVOqCX/bM3yCZxI1fpz6mS4fBw=;
 b=F20SqIrIDG0tWmpJrHPaq/wzkFpJgh2vFwXSqyYOhX6soAcJ3HRucB0XZI8+dF2xci
 ieWyWfH0N3839hsbHaCVWHWvGg+ZohnwB+8FvK6RxBD/AAqzbgNJGqVnlAA+NvguSQy6
 oL07KgDhJDDU3ijUFeosNse/TWAtDTWroDTCmINXX0q69v40VHVRvr6LOOZY3+hlv/Mz
 j+fbZGQALvU6RucGFZk733JrYjj4ofTkDpFG3RtXt/FulLMc846Fmtzd99aPcjDOvEZL
 B/46ZZVttLomQBR8pgKAAwvQzbAOvPcO4cmdLle1D2YrN34cjjlog0DKhgC+4lapZNYi
 M3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mV7Svxbj6a7twrtS2MVOqCX/bM3yCZxI1fpz6mS4fBw=;
 b=lHTh5egz/qEv+i/EMDcsIthvxoUtngtuuKdf9gb8/pA7OrA0g566fKVdgE8W67/2cW
 N0wN+oRFGUZY8lCt/F2+1YGh31CyFe80fWhp0s944f22+KMUj6Mmdm2gQGhEgD1Exv5P
 huIFAmNTKX6zNvpbBPgQ/kqL2C+rzvkWeXobgWcRnxT//HcgegB1Uu/gyFDsIH2bfwYd
 XT3whoCxo6TPhUZrQ8Fz1SjaRGJx0Yb2H/AdZqUOB5VsVC1S1jN/X3bGuBrtbDUDUIzG
 UNVz83SAzZB2oEBEVwssZzvagkTfoW+LmyhRQlLyHr0pK7M5fcfuVFsEmvz9nBqJ9N1u
 oT6Q==
X-Gm-Message-State: AOAM530WyBXgh9Pcal217zhALoP/6gDtskzHOFsxkbYleSza7cKbh/j+
 OpwAUlJmJrZ0sFYoVJ66lYx17odH0ygk2on1+F8=
X-Google-Smtp-Source: ABdhPJxMsF2RcSEdjkezayc2/ABjmuTyd7BvR1tF+oeWV+kQ296nqd8azRAZ/CuOv0O2mCxP8qxZzKeV+SD3fU/L30s=
X-Received: by 2002:a9d:7617:: with SMTP id k23mr6844213otl.351.1636650195487; 
 Thu, 11 Nov 2021 09:03:15 -0800 (PST)
MIME-Version: 1.0
References: <c19e9907-4651-7503-915e-60f4df530e95@kernel.dk>
In-Reply-To: <c19e9907-4651-7503-915e-60f4df530e95@kernel.dk>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Thu, 11 Nov 2021 22:33:03 +0530
Message-ID: <CAHP4M8WdJUH4UY5s0La=Xq9sMnqDQzk=zSaFTZ9G321KYVmx0A@mail.gmail.com>
Subject: Re: ____i915_gem_object_get_pages() -> shmem_get_pages() crash in -git
To: Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 12 Nov 2021 09:03:36 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jens.

Same issue at my side.

Have posted a patch at
https://lore.kernel.org/linux-mm/CAMZfGtUp6dkT4OWzLhL8whqNnXAbfVw5c6AQogHzY=
3bbM_k2Qw@mail.gmail.com/T/#m2189d135b9293de9b4a11362f0179c17b254d5ab

Will be great to hear back if it fixes things at your side too.


Thanks and Regards,
Ajay

On Thu, Nov 11, 2021 at 7:54 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> Hi,
>
> Running -git as of a day or two ago on my laptop, and I've hit this resum=
e
> crash a few times:
>
> OOM killer enabled.
> Restarting tasks ... done.
> thermal thermal_zone7: failed to read out thermal zone (-61)
> xfs filesystem being remounted at /run/systemd/unit-root/var/cache/privat=
e/fwupdmgr supports timestamps until 2038 (0x7fffffff)
> PM: suspend exit
> BUG: unable to handle page fault for address: fffffffffffffff4
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 21360b067 P4D 21360b067 PUD 21360d067 PMD 0
> Oops: 0000 [#1] PREEMPT SMP
> CPU: 7 PID: 3687 Comm: Xorg Tainted: G S                5.15.0+ #12136
> Hardware name: LENOVO 20XWCTO1WW/20XWCTO1WW, BIOS N32ET72W (1.48 ) 10/08/=
2021
> RIP: 0010:shmem_read_mapping_page_gfp+0x53/0x90
> Code: af 75 5b 41 89 d0 6a 00 45 31 c9 b9 02 00 00 00 6a 00 48 8d 55 f0 4=
c 89 d7 e8 89 f6 ff ff 5a 85 c0 59 74 2b 48 98 48 89 45 f0 <48> 8b 10 f7 c2=
 00 00 80 00 48 c7 c2 fb ff ff ff 48 0f 45 c2 48 8b
> RSP: 0018:ffffa01940ec7c18 EFLAGS: 00010282
> RAX: fffffffffffffff4 RBX: 00000000000002f3 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffffffffffff RDI: ffffffffaff0a3c0
> RBP: ffffa01940ec7c28 R08: 0000000000000000 R09: 0000000000000f00
> R10: 0000000000000002 R11: 0000000000000000 R12: 00000000001120d2
> R13: ffff8c6b0648a200 R14: ffff8c69a45472c0 R15: ffff8c69ba412c10
> FS:  00007ffae02f3a40(0000) GS:ffff8c6b8f7c0000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: fffffffffffffff4 CR3: 000000010efb5001 CR4: 0000000000570ee0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  shmem_get_pages+0x242/0x640 [i915]
>  ? drm_vma_node_allow+0xb7/0xe0 [drm]
>  ? drm_gem_handle_create_tail+0xca/0x1a0 [drm]
>  ____i915_gem_object_get_pages+0x20/0x50 [i915]
>  __i915_gem_object_get_pages+0x35/0x40 [i915]
>  i915_gem_set_domain_ioctl+0x255/0x2d0 [i915]
>  ? i915_gem_object_set_to_cpu_domain+0xb0/0xb0 [i915]
>  drm_ioctl_kernel+0xb4/0x140 [drm]
>  drm_ioctl+0x22d/0x440 [drm]
>  ? i915_gem_object_set_to_cpu_domain+0xb0/0xb0 [i915]
>  ? __fget_files+0x74/0xa0
>  __x64_sys_ioctl+0x8e/0xc0
>  do_syscall_64+0x35/0xb0
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7ffae065350b
> Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff f=
f ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffe8b906c88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00005611c921d0b0 RCX: 00007ffae065350b
> RDX: 00007ffe8b906cd4 RSI: 00000000400c645f RDI: 0000000000000011
> RBP: 00007ffe8b906d60 R08: 00005611ca9f7360 R09: 00005611cb62e920
> R10: 00005611c9167010 R11: 0000000000000246 R12: 00005611ca9f7360
> R13: 00005611c921d0c8 R14: 00007ffe8b906cd4 R15: 0000000000000011
>  </TASK>
> Modules linked in: rfcomm ccm cmac bnep iwlmvm mac80211 btusb btrtl binfm=
t_misc btbcm uvcvideo btintel bluetooth x86_pkg_temp_thermal videobuf2_vmal=
loc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev nls_iso8859_1=
 intel_powerclamp mc coretemp ecdh_generic ecc libarc4 kvm_intel wmi_bmof i=
wlwifi snd_hda_codec_hdmi kvm snd_ctl_led snd_hda_codec_realtek snd_hda_cod=
ec_generic cfg80211 irqbypass snd_hda_intel snd_intel_dspcfg snd_hda_codec =
intel_cstate input_leds snd_hwdep thinkpad_acpi snd_hda_core serio_raw hid_=
multitouch nvram ledtrig_audio mei_me platform_profile snd_seq snd_pcm mei =
snd_timer processor_thermal_device_pci_legacy snd_seq_device intel_soc_dts_=
iosf processor_thermal_device processor_thermal_rfim snd ucsi_acpi typec_uc=
si processor_thermal_mbox typec processor_thermal_rapl intel_rapl_common so=
undcore int3403_thermal int340x_thermal_zone int3400_thermal wmi acpi_therm=
al_rel acpi_pad sch_fq_codel msr ip_tables x_tables usbhid i915 hid_generic=
 i2c_algo_bit
>  ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm crc=
t10dif_pclmul crc32_pclmul nvme ghash_clmulni_intel aesni_intel nvme_core i=
ntel_lpss_pci crypto_simd intel_lpss cryptd idma64 virt_dma video
> CR2: fffffffffffffff4
> ---[ end trace f26a0d7d10ef13d6 ]---
> RIP: 0010:shmem_read_mapping_page_gfp+0x53/0x90
> Code: af 75 5b 41 89 d0 6a 00 45 31 c9 b9 02 00 00 00 6a 00 48 8d 55 f0 4=
c 89 d7 e8 89 f6 ff ff 5a 85 c0 59 74 2b 48 98 48 89 45 f0 <48> 8b 10 f7 c2=
 00 00 80 00 48 c7 c2 fb ff ff ff 48 0f 45 c2 48 8b
> RSP: 0018:ffffa01940ec7c18 EFLAGS: 00010282
> RAX: fffffffffffffff4 RBX: 00000000000002f3 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffffffffffff RDI: ffffffffaff0a3c0
> RBP: ffffa01940ec7c28 R08: 0000000000000000 R09: 0000000000000f00
> R10: 0000000000000002 R11: 0000000000000000 R12: 00000000001120d2
> R13: ffff8c6b0648a200 R14: ffff8c69a45472c0 R15: ffff8c69ba412c10
> FS:  00007ffae02f3a40(0000) GS:ffff8c6b8f7c0000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: fffffffffffffff4 CR3: 000000010efb5001 CR4: 0000000000570ee0
> PKRU: 55555554
>
> Ring a bell for anyone? This is an X1 gen9 laptop, intel graphics.
>
> --
> Jens Axboe
>
