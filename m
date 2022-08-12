Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88407590C6D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940C4A9047;
	Fri, 12 Aug 2022 07:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BBCA6F68
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 05:35:39 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31f41584236so444357b3.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 22:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=5vwcQReAFikjQnzpSfbkCAycRcrywZUDKw8D4hnhPIg=;
 b=TZi5p5Ld3tBdJ3PbLP+lvU0ZX02K09Pd1zn6gRObVmnQh5H7YsgwOOjwz6aciA++Iv
 4dRmJ/dzJDCF6U566vI5MjVrCgt/BsmqysotNX0eRRonwO+sESQ40e114wgA/OIZqsVZ
 4ycQQpGWDu9ly9cl9GN16uQ4yvfB5IYf8eIS2e3VomKZ3F4tvM72ZbsXx+X4U5mC+p0c
 2M3k+3ab49pAilfrLd5kTrYw9MXY4l0yi6OzEhM1RmEpjSE1KsnbwwGkciEvmiP1AbVw
 MGlxJPE+MBCId65ErSthB4YkdAHy6jnzGQzBw59amKkIdLxau2LcGBMR90ZpA6rWxbdv
 9uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=5vwcQReAFikjQnzpSfbkCAycRcrywZUDKw8D4hnhPIg=;
 b=Cl0Xj3nWVCDHbyg0wtrskbOwXWYxMl/vyXxKrMQELSxxnv2yANr0Pb3MSz/xZ1HnXI
 /H7PGDXUmOzyW41y7l5IsXPmOHGtE92a8EG3vz6NhRZ7UcxraDuLOa2eLc5TfWh2fuPk
 rJbsSiEpnI5cKdiHFD32y1MN5yVgL5bVenCD7sQDEHiAHULMhsaM4axyU4D97XxCRKrp
 F768QgX7Tlskv3H0iyTfWNM7hXBBoEURQIPwuL1wp81P1jkGLyEiPZMwufZGmZKrb9Jn
 RdI3FnzIcR1+S6UAvOWkwS4aZsb6Q05vpJE1d8jdGSMenCqLDtMNippGDtXwvCcvZR3P
 SDOA==
X-Gm-Message-State: ACgBeo36xr0CzaaNQ7o3d9cGPRBFdFmxNM+qbIleyjoxTG9PopRzNIR1
 HFfM2F6vVB5gMaPWt4YxiaPnJVZyR45Alxu1GEYVGw==
X-Google-Smtp-Source: AA6agR7e+9CEuRYGCPvYyNrgfLxEj1GTVFuCiRZY2Z+mVzWZx88pDtHRRG7DBuIgQmc5wlVt9K+90SLWnNUsJg4CeF8=
X-Received: by 2002:a0d:c745:0:b0:324:8800:f63d with SMTP id
 j66-20020a0dc745000000b003248800f63dmr2463417ywd.106.1660282538824; Thu, 11
 Aug 2022 22:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
 <5WJ88R.LXNASHJRBDGL1@crapouillou.net>
In-Reply-To: <5WJ88R.LXNASHJRBDGL1@crapouillou.net>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Fri, 12 Aug 2022 13:35:27 +0800
Message-ID: <CAMSo37We74tpPd_XSdum++SKUopLU5xiLK1peh6mGKA8jYnCrA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge_connector: enable HPD by default if supported
To: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 12 Aug 2022 07:21:22 +0000
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, "Bajjuri, Praneeth" <praneeth@ti.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nikita, All

We have one X15 Android build based on the android mainline kernel,
and it failed to boot with this change because of one kernel panic.
And it would boot to the home  screen if this change is reverted.

Could you please help have a look and give suggestions on what should
be done next
to work with this change?

The kernel panic  is something like the following, for details please
check the link here: http://ix.io/47mc
[   38.784301] Internal error: : 1211 [#2] PREEMPT SMP ARM
[   38.784301] Modules linked in:
[   38.788940] Kernel panic - not syncing: Fatal exception in interrupt
[   38.794189]  snd_soc_omap_hdmi ti_tpd12s015 pvrsrvkm(O)
display_connector omap_wdt omap_aes_driver ti_vpe ti_vpdma ti_csc
ti_sc v4l2_mem2mem videobuf2_dma_contig omap_sham rtc_omap
snd_soc_tlv320aic3x_i2c snd_soc_tlv320aic3x at24 rtc_palmas omap_des
omap_crypto libdes crypto_engine rtc_ds1307 omap_hdq wire phy_gmii_sel
ahci_platform libahci_platform libahci libata scsi_mod bsg scsi_common
snd_soc_simple_card snd_soc_simple_card_utils
[   38.842315] CPU: 1 PID: 454 Comm: vsync Tainted: G      D W  O
5.19.0-02213-g3aeacdb764a2 #1
[   38.851226] Hardware name: Generic DRA74X (Flattened Device Tree)
[   38.857360] PC is at dispc_write_irqenable+0x1c/0x38
[   38.862335] LR is at omap_irq_enable_vblank+0xbc/0xd8
[   38.867431] pc : [<c0948e04>]    lr : [<c0939e9c>]    psr: 60080093
[   38.873718] sp : ea281d40  ip : 00000000  fp : c3ae3008
[   38.878967] r10: 00000000  r9 : c3a89cb8  r8 : 60080093
[   38.884216] r7 : c398f000  r6 : 0812d64c  r5 : c398f000  r4 : c398f184
[   38.890777] r3 : e6137018  r2 : 0812d64c  r1 : 0812d64c  r0 : c3846000
[   38.897338] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment user
[   38.904571] Control: 30c5387d  Table: 84e801c0  DAC: 55555555
[   38.910339] Register r0 information: slab kmalloc-8k start c3846000
pointer offset 0 size 8192
[   38.919006] Register r1 information: non-paged memory
[   38.924102] Register r2 information: non-paged memory
[   38.929168] Register r3 information: 0-page vmalloc region starting
at 0xe6137000 allocated at __devm_ioremap_resource+0x108/0x1f0
[   38.940979] Register r4 information: slab kmalloc-512 start
c398f000 pointer offset 388 size 512
[   38.949829] Register r5 information: slab kmalloc-512 start
c398f000 pointer offset 0 size 512
[   38.958496] Register r6 information: non-paged memory
[   38.963562] Register r7 information: slab kmalloc-512 start
c398f000 pointer offset 0 size 512
[   38.972229] Register r8 information: non-paged memory
[   38.977294] Register r9 information: slab kmalloc-1k start c3a89c00
pointer offset 184 size 1024
[   38.986145] Register r10 information: NULL pointer
[   38.990966] Register r11 information: slab kmalloc-2k start
c3ae3000 pointer offset 8 size 2048
[   38.999725] Register r12 information: NULL pointer
[   39.004547] Process vsync (pid: 454, stack limit =3D 0xd381b509)
[   39.010406] Stack: (0xea281d40 to 0xea282000)
[   39.014770] 1d40: 00000000 00010000 c398fb0c 00000000 c3a89c00
00000000 c398fa40 c0913a98
[   39.022979] 1d60: c191b239 c5f7ea80 00000000 00010000 c398fa40
c398fa80 c3a89c00 00000000
[   39.031219] 1d80: 20080013 c3a89cbc 00000000 c091397c c5f7e800
c39d0280 00000001 c557ff00
[   39.039428] 1da0: c398fa40 ea281e68 c5f8a300 00000001 ffffffea
c3a89c00 c3ae3008 c09150f0
[   39.047637] 1dc0: 00000000 00000000 00000000 00000000 01140657
ea281e68 ffffffff 00000001
[   39.055847] 1de0: 00000000 c39d0000 00000000 00000000 693113f4
00000010 fffffff3 c5f8a300
[   39.064086] 1e00: c3a89c00 c0914f88 ea281e68 00000010 c5f8a300
c08ef2b0 00000000 693113f4
[   39.072296] 1e20: b44fb158 ea281e68 00000010 c0914f88 ea281e68
c5f21840 c5f8a300 c08ef53c
[   39.080505] 1e40: 0000e200 00000001 c1364999 00000000 00000010
b44fb158 c010643a 0000003a
[   39.088745] 1e60: c10730ac 00000000 00000001 00000001 00000000
00000000 00000000 00000000
[   39.096954] 1e80: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   39.105163] 1ea0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   39.113372] 1ec0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   39.121612] 1ee0: 00000000 00000000 693113f4 c5f21840 c3c00a20
ea281f60 0000000c b44fb158
[   39.129821] 1f00: c5f21841 00000036 c010643a c048c1c4 ea281f48
c0f24c4c c02fa044 00000000
[   39.138031] 1f20: 00000000 00000000 693113f4 c5f7e800 60080013
ffffffff ea281f94 c0200b9c
[   39.146240] 1f40: c5f7e800 30c5387d ea281f58 c0f25138 c02001f0
30c5387d 00000000 c0200bb4
[   39.154449] 1f60: 0000000c c010643a b44fb158 b44fb124 b4647348
b44fb158 0000000c 00000036
[   39.162689] 1f80: 693113f4 b4647348 b44fb158 0000000c 00000036
c0200298 c5f7e800 00000036
[   39.170898] 1fa0: 00000000 c0200060 b4647348 b44fb158 0000000c
c010643a b44fb158 b44fb124
[   39.179107] 1fc0: b4647348 b44fb158 0000000c 00000036 b44fb128
c010643a beb2aaa8 00000000
[   39.187316] 1fe0: 00000078 b44fb110 b5f8301b b5fb7ce4 80080010
0000000c 00000000 00000000
[   39.195556]  dispc_write_irqenable from omap_irq_enable_vblank+0xbc/0xd8
[   39.202301]  omap_irq_enable_vblank from drm_vblank_enable+0x8c/0x184
[   39.208770]  drm_vblank_enable from drm_vblank_get+0x7c/0x10c
[   39.214538]  drm_vblank_get from drm_wait_vblank_ioctl+0x168/0x4b8
[   39.220764]  drm_wait_vblank_ioctl from drm_ioctl_kernel+0xe8/0x154
[   39.227050]  drm_ioctl_kernel from drm_ioctl+0x220/0x36c
[   39.232391]  drm_ioctl from sys_ioctl+0xbe4/0xc54
[   39.237121]  sys_ioctl from ret_fast_syscall+0x0/0x4c
[   39.242218] Exception stack(0xea281fa8 to 0xea281ff0)
[   39.247283] 1fa0:                   b4647348 b44fb158 0000000c
c010643a b44fb158 b44fb124
[   39.255493] 1fc0: b4647348 b44fb158 0000000c 00000036 b44fb128
c010643a beb2aaa8 00000000
[   39.263702] 1fe0: 00000078 b44fb110 b5f8301b b5fb7ce4
[   39.268798] Code: e5903004 e1c12002 e2833018 e5832000 (e5902004)
[   39.274902] ---[ end trace 0000000000000000 ]---
[   39.279541] Rebooting in 5 seconds..

Thanks,
Yongqin Liu
On Sat, 5 Mar 2022 at 04:05, Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi Nikita,
>
> Le sam., d=C3=A9c. 25 2021 at 09:31:51 +0300, Nikita Yushchenko
> <nikita.yoush@cogentembedded.com> a =C3=A9crit :
> > Hotplug events reported by bridge drivers over drm_bridge_hpd_notify()
> > get ignored unless somebody calls drm_bridge_hpd_enable(). When the
> > connector for the bridge is bridge_connector, such a call is done from
> > drm_bridge_connector_enable_hpd().
> >
> > However drm_bridge_connector_enable_hpd() is never called on init
> > paths,
> > documentation suggests that it is intended for suspend/resume paths.
> >
> > In result, once encoders are switched to bridge_connector,
> > bridge-detected HPD stops working.
> >
> > This patch adds a call to that API on init path.
> >
> > This fixes HDMI HPD with rcar-du + adv7513 case when adv7513 reports
> > HPD
> > events via interrupts.
> >
> > Fixes: c24110a8fd09 ("drm: rcar-du: Use drm_bridge_connector_init()
> > helper")
> > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
>
> Merged to drm-misc-next.
>
> Thanks!
>
> Cheers,
> -Paul
>
> > ---
> >  drivers/gpu/drm/drm_bridge_connector.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge_connector.c
> > b/drivers/gpu/drm/drm_bridge_connector.c
> > index 791379816837..4f20137ef21d 100644
> > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > @@ -369,8 +369,10 @@ struct drm_connector
> > *drm_bridge_connector_init(struct drm_device *drm,
> >                                   connector_type, ddc);
> >       drm_connector_helper_add(connector,
> > &drm_bridge_connector_helper_funcs);
> >
> > -     if (bridge_connector->bridge_hpd)
> > +     if (bridge_connector->bridge_hpd) {
> >               connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> > +             drm_bridge_connector_enable_hpd(connector);
> > +     }
> >       else if (bridge_connector->bridge_detect)
> >               connector->polled =3D DRM_CONNECTOR_POLL_CONNECT
> >                                 | DRM_CONNECTOR_POLL_DISCONNECT;
> > --
> > 2.30.2
>
>


--=20
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
