Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA534108DA
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 00:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D35D6E131;
	Sat, 18 Sep 2021 22:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5663F6E131
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 22:48:13 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id c7so24068077qka.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 15:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QCr/J1mrnfNs5loK8KYHMFOJOYCZd4kydfFazmw1Wx8=;
 b=KU2DKyWJCJtiuZWO1fWP3zB1DKU+x7torW15hVnKn1K6RQwr/acbGJo5xVwt56jah+
 grmglU4vyXa0QrYmJLFBagAVcXnN+ptQcWpQqEaSfCgHjIjaBrxNZWJWe56t9TOHkT53
 gbBqrkm+7MEGDD2NKJiDY2Q4eKHuZyaSuLoFZ3MMv1+YjnrMZA7GVTmdFAf2AaFfzR+t
 AuTW8MGXlWwSHGiIESss1WVYkDZbkz6omaoVRWyJO0ELUz6lmoTysVythLb1V1KDYjdq
 qf2NKe6cjhcz5STJVlUETXPUvkd28L3v0h8LRABYm8ZTqja8fNIZLuW3eRwakVLyFErL
 8gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QCr/J1mrnfNs5loK8KYHMFOJOYCZd4kydfFazmw1Wx8=;
 b=3ACSSZDqS+q2QKW2CyO1heD5G7H/T18/t/Kjtqv2BzYDsNmwp4HEOX9cOCuHy368hs
 wLdNI56Ipgi3/Jmdz8lLvTVvv+sVw55Xq5IQ5SDQ/UpIFQvkCRHVsnmDpiVIRZYhx7yU
 2I7Jf7DXR1d35+H+Ehv+Ld31Re9vurWJ51Asvu5oujvFHU5aKSdWZG3y2GllZiTL1yWr
 vIoAWfQo5/Moy65wexk9KsnwIM/rFOhqrDSYgebjxnsY6ze020EpkTuOdT39C9NOH0vF
 4TibV5tcVhwul8yFqr0MVTRgCNfiJgH03TCeGF41n/IGsBGwI2sgImPGOxcUhCIK+Pr2
 wP3g==
X-Gm-Message-State: AOAM533718jaM8mBvI1btBDSjVSlwXTPqNeZ1rtvcBZEAbzvst4KIy6L
 l5kVH/yIAX9smNWkSYI2AAlcy5AiEjg0E7ELyLKPKrmEkdQ=
X-Google-Smtp-Source: ABdhPJz0nmEnVdi+OmqSG4INm5YigmF8yYeSncXa3VMAwMWi3c1E8c9fclkWhT8n2LKsYWKN7RjTMRiwdVgRVyHcADI=
X-Received: by 2002:a25:cd82:: with SMTP id
 d124mr21526415ybf.491.1632005292265; 
 Sat, 18 Sep 2021 15:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
 <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
In-Reply-To: <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 18 Sep 2021 23:47:36 +0100
Message-ID: <CADVatmNTKof8jMyx4xx9b2fQ=zVb2ZtXZh1uoYE2R-6DkaHj8w@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Stapelberg <michael@stapelberg.ch>,
 Maxime Ripard <maxime@cerno.tech>, 
 Emma Anholt <emma@anholt.net>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Felix Kuehling <felix.kuehling@amd.com>, Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Sep 18, 2021 at 11:15 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Sep 18, 2021 at 3:00 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > Its still there. I am seeing it every night. This was from last night
> > - https://lava.qa.codethink.co.uk/scheduler/job/164#L1356
>
> Note that that web server is not available at least to me.  Looks like
> some internal name or limited dns, I just get
>
>     lava.qa.codethink.co.uk: Name or service not known
>
> so your reports aren't getting a lot of traction.

Looks like a DNS issue with the subdomains, someone else also reported
the same last week.
I have reported this to our ops and they are looking into it.

Also, I have now tested by reverting those two commits and I still get
the same trace on rpi4.
Copying here again for your reference.

[   37.929903] Unable to handle kernel access to user memory outside
uaccess routines at virtual address 0000000000000348
[   37.940882] Mem abort info:
[   37.943715]   ESR = 0x96000004
[   37.946875]   EC = 0x25: DABT (current EL), IL = 32 bits
[   37.952547]   SET = 0, FnV = 0
[   37.956086]   EA = 0, S1PTW = 0
[   37.959570]   FSC = 0x04: level 0 translation fault
[   37.964561] Data abort info:
[   37.967518]   ISV = 0, ISS = 0x00000004
[   37.971437]   CM = 0, WnR = 0
[   37.974666] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000050be0000
[   37.981239] [0000000000000348] pgd=0000000000000000, p4d=0000000000000000
[   37.988234] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   37.993897] Modules linked in: overlay algif_hash algif_skcipher
af_alg bnep sch_fq_codel ppdev lp parport ip_tables x_tables autofs4
btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx xor xor_neon raid6_pq
libcrc32c raid1 raid0 multipath linear hid_generic uas usbhid
usb_storage snd_soc_hdmi_codec btsdio hci_uart bcm2835_v4l2(C)
bcm2835_mmal_vchiq(C) btqca brcmfmac btrtl btbcm videobuf2_vmalloc
videobuf2_memops brcmutil btintel videobuf2_v4l2 cfg80211
raspberrypi_hwmon i2c_brcmstb videobuf2_common bluetooth videodev dwc2
udc_core roles vc4 crct10dif_ce ecdh_generic drm_kms_helper
pwm_bcm2835 cec ecc snd_bcm2835(C) mc drm snd_soc_core xhci_pci
xhci_pci_renesas ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd
fb_sys_fops syscopyarea sysfillrect sysimgblt phy_generic
uio_pdrv_genirq uio aes_neon_bs aes_neon_blk crypto_simd cryptd
[   38.073649] CPU: 1 PID: 1572 Comm: pulseaudio Tainted: G         C
      5.15.0-rc1-d4d016caa4b8 #1
[   38.082913] Hardware name: Raspberry Pi 4 Model B (DT)
[   38.088119] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   38.095178] pc : vc4_hdmi_audio_prepare+0x3c0/0xba4 [vc4]
[   38.100683] lr : vc4_hdmi_audio_prepare+0x308/0xba4 [vc4]
[   38.106173] sp : ffff800013073a60
[   38.109527] x29: ffff800013073a60 x28: ffff00004086b800 x27: 0000000000000000
[   38.116767] x26: 0000000000000000 x25: 000000000000ac44 x24: 0000000021002003
[   38.124004] x23: ffff800013073b50 x22: 0000000000000003 x21: ffff0000561b2080
[   38.131242] x20: ffff0000561b24c8 x19: 0005833333380600 x18: 0000000000000000
[   38.138479] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   38.145716] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000991
[   38.152952] x11: 0000000000000001 x10: 000000000001d4c0 x9 : ffff800008f87708
[   38.160188] x8 : 0000000000000031 x7 : 000000000001d4c0 x6 : 0000000000000030
[   38.167424] x5 : ffff800013073aa8 x4 : ffff800008f9baa8 x3 : 0000000010624dd3
[   38.174661] x2 : 00000000000003e8 x1 : 0000000000000000 x0 : 0000000000562200
[   38.181899] Call trace:
[   38.184371]  vc4_hdmi_audio_prepare+0x3c0/0xba4 [vc4]
[   38.189511]  hdmi_codec_prepare+0xe8/0x1b0 [snd_soc_hdmi_codec]
[   38.195515]  snd_soc_pcm_dai_prepare+0x5c/0x10c [snd_soc_core]
[   38.201476]  soc_pcm_prepare+0x5c/0x130 [snd_soc_core]
[   38.206729]  snd_pcm_prepare+0x150/0x1f0 [snd_pcm]
[   38.211608]  snd_pcm_common_ioctl+0x1644/0x1d14 [snd_pcm]
[   38.217099]  snd_pcm_ioctl+0x3c/0x5c [snd_pcm]
[   38.221620]  __arm64_sys_ioctl+0xb4/0x100
[   38.225687]  invoke_syscall+0x50/0x120
[   38.229486]  el0_svc_common.constprop.0+0x180/0x1a0
[   38.234431]  do_el0_svc+0x34/0xa0
[   38.237788]  el0_svc+0x2c/0xc0
[   38.240883]  el0t_64_sync_handler+0xa4/0x12c
[   38.245208]  el0t_64_sync+0x1a4/0x1a8
[   38.248921] Code: 52807d02 72a20c43 f9400421 9ba37c13 (f941a423)
[   38.255098] ---[ end trace 925d8184702abf4d ]---


-- 
Regards
Sudip
