Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3E5178C3
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 23:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4BF10F4AC;
	Mon,  2 May 2022 21:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59ED610F4AC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 21:03:46 +0000 (UTC)
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQeDw-1nRE0M05kU-00NkZe for <dri-devel@lists.freedesktop.org>; Mon, 02
 May 2022 23:03:44 +0200
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2f7b815ac06so161678947b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 14:03:43 -0700 (PDT)
X-Gm-Message-State: AOAM5332KUQ9ptRPctESZauW0rBOieQLaxBK4fkUoOo7Talqj9HUY0xt
 nkTgczfnHsKxmtvPYmT1Vs3wJ+sOp+ArB+HMiDk=
X-Google-Smtp-Source: ABdhPJxEvI0WTai1d3ZR4KU3iW8w7Gb+IOi/NcLSYY9Kzki6UUTmpSHsKHSdyZ16RsjoU/k3UwknsKUnnDH1BVJBWs0=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr13273488ywk.209.1651525422593; Mon, 02
 May 2022 14:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
 <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
 <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
 <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net>
 <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
 <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
 <4dcdbfe2-9edf-320b-d123-3b62c8b5e28e@roeck-us.net>
 <CAK8P3a0ogn1wgPBDHkT=Fb8ufA+y8Ax1Qov2-vRXfC08QqnrQA@mail.gmail.com>
 <c001d58e-9a78-6338-a533-d0f215b3dfd1@roeck-us.net>
In-Reply-To: <c001d58e-9a78-6338-a533-d0f215b3dfd1@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 2 May 2022 23:03:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1X3YH0RqqmqgqFAaY94yreD-PfY-pvyMf+xU3nGeqvsg@mail.gmail.com>
Message-ID: <CAK8P3a1X3YH0RqqmqgqFAaY94yreD-PfY-pvyMf+xU3nGeqvsg@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YYh/4Fm5MokcW/C+CbjKl98RURmAkSJf3jKF2Flve+nuiwG2aSI
 7hfr3dhQR+MvCYFRv17b9doimRz+tqoQ/8tJBQUdU2XsO7bDABBLAWYvOS9kYo7nEbZ+JSb
 Hj6LbBrNzFZZuEyYbvHr1Y94qwNXKfjN6mqQioVbfotKgBjohhqO0aiRMaHrbqUI5jUkkZO
 Q9hQ2yis12eBofBHozz6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EGAEHbRCIr4=:KLZMeaBSva4i5+dUJ86w0B
 kZC6EEDO6v4tjFGJQsQYWj4WhQ4EHB7uYkQgRrqfQbJn2AmM0ggFd8awbAE/7bqKxPDUm9sI4
 wWeMyq6OGxB8z11417waq+CfWxeB7GLNNQx7wyNPyoX6g0Se3Cst91yjHDJBMHKOUrA9xs/pR
 jNhSZMi0DMDh6pbEGVXJpxjP0t/uxNVNvKOwn7nVt+BWKdOHK1Fnh1fyO6yiLTofgoiJcrTkl
 pkZP5XZpGJ3NJ+aAJL4x25IuOaqbq7dD9JbpGV3kCgfe30ArEM8GGtcgpC9vZwJj+7ojcebJu
 RSDYqeeFJAX8vlrOqGwD8Ylv4He6Q7DuQrxa1SkFytKdqeQSC71nb6ZTU67L+xQc4UoWZTiOl
 D6cg6kwVowaJRpEMIPPWnFor8Nxpazv1nLWXSCwhrllGA5f8gTTTrrPrUZHeIGdvraw03YcC4
 ye7QdWzAzQZxPOQzhV/qNaWpsbwKOaMRpWDTNbMuAk5ir6ghJACFEXZhrHJxT40pPJ/d0ZDn3
 +vBxHTSZpcLEaZvK0++l0GRlPQQpNcvXApUqAgDyvzwoEpWTHqrXfmoR0H8SUknHd6BPKIW3N
 HEPtd9cnw3lw6HJgSPTuZ55Y/ASdvoRp6vOTLU4pS2NSCdj8DBAiYmyfC/sP9A8LnWTxXfgm3
 E78ovZM39tzfewyO7mr27G7VBKAVkG0qv/IS9e64FIl4DpPnd8XXVO0l/uKetln4O8T9nBYak
 9OR6MqR/8Ra8a1H39wlTL1P4nPbLn+PmNHNV2CazndYbhEuRJVaezVIZaYkABG9ME7jU0F6Al
 o/9OeFXYwo6nV/FY9IFiZedwVWrSUTeH7EPT2N0a4kpgv+x95U=
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 2, 2022 at 10:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/2/22 12:21, Arnd Bergmann wrote:
> >
>
> To boot from initrd:
>
> qemu-system-arm -M z2 -kernel \
>       arch/arm/boot/zImage -no-reboot -initrd \
>       rootfs-armv5.cpio --append \
>       "panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0" -nographic \
>       -monitor null -serial stdio
>
> where rootfs-armv5.cpio is from my repository at github.com.
>
> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/rootfs-armv5.cpio.gz
>

Ok, that works here with any configuration, I don't see a regression.
Could this be a problem with the size increase? The machine only has
32MB of RAM, so it's possible that the multiplatform-enabled kernel
with DT support etc pushes it over the edge, especially with an initramfs.

My configuration is clearly a bit different from yours, so I tried giving it
a larger initramfs file, which randomly crashes elsewhere for me:

[    0.648659] pxa2xx-uart.0: ttyS0 at MMIO 0x40100000 (irq = 38,
base_baud = 928571) is a UART1
[    0.697984] kworker/u2:0 invoked oom-killer:
gfp_mask=0x100cca(GFP_HIGHUSER_MOVABLE), order=0, oom_score_adj=0
[    0.698278] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted
5.18.0-rc1-00109-gee927ad51300-dirty #52
[    0.698382] Hardware name: Zipit Z2
[    0.698520] Workqueue: events_unbound async_run_entry_fn
[    0.699063]  unwind_backtrace from show_stack+0x18/0x1c
[    0.699148]  show_stack from dump_header+0x68/0x254
[    0.699186]  dump_header from out_of_memory+0x474/0x4f0
[    0.699208]  out_of_memory from __alloc_pages+0xa0c/0xb84
[    0.699227]  __alloc_pages from shmem_getpage_gfp.constprop.0+0x270/0x9e0
[    0.699247]  shmem_getpage_gfp.constprop.0 from
generic_perform_write+0xd8/0x210
[    0.699268]  generic_perform_write from __generic_file_write_iter+0x130/0x198
[    0.699286]  __generic_file_write_iter from generic_file_write_iter+0x64/0xd0
[    0.699302]  generic_file_write_iter from __kernel_write+0x114/0x2b0
[    0.699321]  __kernel_write from kernel_write+0x68/0x194
[    0.699337]  kernel_write from xwrite+0x3c/0x78
[    0.699363]  xwrite from do_copy+0xc0/0x11c
[    0.699381]  do_copy from write_buffer+0x2c/0x44
[    0.699397]  write_buffer from flush_buffer+0x3c/0xa0
[    0.699413]  flush_buffer from __gunzip+0x2a4/0x364
[    0.699434]  __gunzip from gunzip+0x2c/0x34
[    0.699449]  gunzip from unpack_to_rootfs+0x19c/0x304
[    0.699465]  unpack_to_rootfs from do_populate_rootfs+0x6c/0x1dc
[    0.699483]  do_populate_rootfs from async_run_entry_fn+0x44/0x1a0
[    0.699502]  async_run_entry_fn from process_one_work+0x1e8/0x544
[    0.699520]  process_one_work from worker_thread+0x34/0x578
[    0.699579]  worker_thread from kthread+0xdc/0x114
[    0.699599]  kthread from ret_from_fork+0x14/0x2c
[    0.699651] Exception stack(0xc2821fb0 to 0xc2821ff8)
[    0.699711] 1fa0:                                     00000000
00000000 00000000 00000000
[    0.699731] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    0.699744] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    0.699801] Mem-Info:
[    0.699889] active_anon:90 inactive_anon:674 isolated_anon:0
[    0.699889]  active_file:0 inactive_file:0 isolated_file:0
[    0.699889]  unevictable:0 dirty:0 writeback:0
[    0.699889]  slab_reclaimable:0 slab_unreclaimable:1691
[    0.699889]  mapped:0 shmem:771 pagetables:0 bounce:0
[    0.699889]  kernel_misc_reclaimable:0
[    0.699889]  free:207 free_pcp:37 free_cma:0
[    0.699986] Node 0 active_anon:360kB inactive_anon:2696kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:3084kB
writeback_tmp:0kB kernel_stack:192kB pagetables:0kB all_unreclaimable?
yes
[    0.700116] Normal free:828kB boost:1024kB min:1464kB low:1572kB
high:1680kB reserved_highatomic:0KB active_anon:360kB
inactive_anon:2696kB active_file:0kB inactive_file:0kB unevictable:0kB
writepending:0kB present:32768kB managed:12232kB mlocked:0kB
bounce:0kB free_pcp:148kB local_pcp:148kB free_cma:0kB
[    0.700177] lowmem_reserve[]: 0 0
[    0.700247] Normal: 3*4kB (UM) 2*8kB (UM) 2*16kB (M) 0*32kB 0*64kB
0*128kB 1*256kB (M) 1*512kB (M) 0*1024kB = 828kB

       Arnd
