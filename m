Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4AB99678A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2A410E6CA;
	Wed,  9 Oct 2024 10:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hsN4UQ+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2A010E6CA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 10:45:51 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e25d6342837so5801746276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 03:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728470750; x=1729075550;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8o3JP8Ym8QXKjfXUXNfgbLb7FEiYWttofS1cFkjvfo=;
 b=hsN4UQ+SR7GKn1k7SHW7NTlC0xok9/ek/2dNusyXAbF8jfr/ZHJbCWjyfJ+BqoIzyr
 SaNh0/eOLQoSqgw12n+4Lk/Mc0HmN3na08ekGkXj5kpJtYoiDYrGy0PnzI7RcFrR7HpV
 Kyo9i7X8MprKLBTf5jzxpn6loFIKeCP44Upi5r9yFHQYgk5oh3Iw53JBfHmSWp7riNZN
 moUnZH8XutF4DZhCkr3p9jzwIvknGKNSuDs/2BPhvp93VMN2oPEHYYUVLZyS7GKZbxhr
 hcFanq4diaeLAE8gUwMuexK7jBOz7Perv9VCtvUfhtfuP68FGfTvmAEboDTtTBvbkH48
 EnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728470750; x=1729075550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8o3JP8Ym8QXKjfXUXNfgbLb7FEiYWttofS1cFkjvfo=;
 b=NOdo6T/BW32rsa6CCPBr8fUBudJaq4T8C+BpWM7g9jss68SObPZ8NWf4Q/7RfIf6SS
 nkc9MnjkuuHIhDPu7hii3ass1zOo47LFJLYukTYrgPd3ADRKOL7eV+RcVTOLk7IDb4eh
 VjVbGpikvhiktmIr4W5WZBSYyKgyNJod4nSKEbGxQE+u0WVwi5Lg42GlcMnHteu3/fu0
 IlL1URbzxnhy4Drl21ilGdpREoQBm4RVNRJbQPO/L/GcUzVwD4cCvbXKPm2ESvXzXoBy
 kqiSFboxgdNRPdicYyvXjRnVEND6IfNQF6Xo1rFDhvwuCUpbtJ9AaNQU5HhKq+qbacWB
 Fflg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8oih2KdNpLRFM8fmbuKLQ9rwVi3dQfU7sJPckY2DmWcU+UEc6Sxdf4bS7ccivGNgPOdYKgkqgqKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf7g2+l/rfsrcqrwn5CDZVc9/Y9mnWa4zZ7peT0j9LLST3F7SY
 /FSaJ/LgpIXdF18iTL73cIner8cVXNlFRCvumAF078oi4m3UAPjx38m1RzfZqKeab7kR4jR0ida
 Mb8thoI5GGvZfLJ/iJDCq0s8zP0+zwTspeWk9eQ==
X-Google-Smtp-Source: AGHT+IFNV1jEJcdslFSORuIEmRSCIO9ZUPfSTl6otoICMAa7Rat7jue/nFfneJPA4u5AToRHJmksZ06UtzqK+1+6Wt4=
X-Received: by 2002:a05:6902:90f:b0:e13:d392:82bc with SMTP id
 3f1490d57ef6-e28fe32e898mr1565160276.12.1728470750526; Wed, 09 Oct 2024
 03:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241009004332.1901833-1-mcanal@igalia.com>
 <164f5bd6-c240-42af-aef4-37db7e2041cc@suse.de>
 <20241009-melodic-adorable-groundhog-2c01af@houat>
In-Reply-To: <20241009-melodic-adorable-groundhog-2c01af@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Oct 2024 11:45:34 +0100
Message-ID: <CAPY8ntBAujmMV2RD0FLcE94St6tuP6jwC6cMAE+YmHb8qN5h_g@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: Set `fbdev_probe` in `struct vc5_drm_driver`
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
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

On Wed, 9 Oct 2024 at 08:55, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Wed, Oct 09, 2024 at 08:59:29AM GMT, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 09.10.24 um 02:40 schrieb Ma=C3=ADra Canal:
> > > Currently, when booting the RPi 4B, we get a NULL pointer dereference=
:
> > >
> > > [    7.642883] Unable to handle kernel NULL pointer dereference at vi=
rtual address 0000000000000038
> > > [    7.642926] Mem abort info:
> > > [    7.642938]   ESR =3D 0x0000000096000044
> > > [    7.642951]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > > [    7.642968]   SET =3D 0, FnV =3D 0
> > > [    7.642981]   EA =3D 0, S1PTW =3D 0
> > > [    7.642993]   FSC =3D 0x04: level 0 translation fault
> > > [    7.643007] Data abort info:
> > > [    7.643017]   ISV =3D 0, ISS =3D 0x00000044, ISS2 =3D 0x00000000
> > > [    7.643032]   CM =3D 0, WnR =3D 1, TnD =3D 0, TagAccess =3D 0
> > > [    7.643046]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > > [    7.643063] user pgtable: 4k pages, 48-bit VAs, pgdp=3D00000001074=
87000
> > > [    7.643081] [0000000000000038] pgd=3D0000000000000000, p4d=3D00000=
00000000000
> > > [    7.643113] Internal error: Oops: 0000000096000044 [#1] PREEMPT SM=
P
> > > [    7.643131] Modules linked in: snd_bcm2835(C)  [...] vc4 v3d [...]
> > > drm_shmem_helper drm_dma_helper drm_kms_helper drm [...] ipv6
> > > [    7.643377] CPU: 1 UID: 0 PID: 48 Comm: kworker/u16:2 Tainted: G  =
       C         6.12.0-rc1-00310-g2c34a5464007 #185
> > > [    7.643407] Tainted: [C]=3DCRAP
> > > [    7.643419] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
> > > [    7.643438] Workqueue: events_unbound deferred_probe_work_func
> > > [    7.643477] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> > > [    7.643499] pc : __drm_fb_helper_initial_config_and_unlock+0x40c/0=
x588 [drm_kms_helper]
> > > [    7.643616] lr : __drm_fb_helper_initial_config_and_unlock+0x374/0=
x588 [drm_kms_helper]
> > > [    7.643710] sp : ffff8000806c3900
> > > [    7.643724] x29: ffff8000806c3950 x28: ffff431b01a3ec14 x27: 00000=
00000000010
> > > [    7.643758] x26: ffff431b0369f000 x25: 0000000036314752 x24: ffff4=
31b003b6200
> > > [    7.643790] x23: ffff431b0369f000 x22: 00000000000002d0 x21: ffff4=
31b003b6030
> > > [    7.643821] x20: ffff431b003b6030 x19: ffff431b003b6000 x18: ffff4=
31b002e6e48
> > > [    7.643852] x17: 0000000000000001 x16: ffffb19c2f10614c x15: 00000=
00000000000
> > > [    7.643882] x14: 0000000000000000 x13: ffff431b003b62f0 x12: 00000=
00000000500
> > > [    7.643913] x11: 0000000000000000 x10: 0000000000000000 x9 : 005d6=
e6f6362665b
> > > [    7.643945] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 00000=
0000000003f
> > > [    7.643975] x5 : ffffb19bcb45c59c x4 : 0000000000001e00 x3 : ffffb=
19bcb420c20
> > > [    7.644005] x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffff4=
31b003b6000
> > > [    7.644036] Call trace:
> > > [    7.644049]  __drm_fb_helper_initial_config_and_unlock+0x40c/0x588=
 [drm_kms_helper]
> > > [    7.644149]  drm_fb_helper_initial_config+0x34/0x4c [drm_kms_helpe=
r]
> > > [    7.644240]  drm_fbdev_client_hotplug+0x74/0xc8 [drm_kms_helper]
> > > [    7.644331]  drm_client_register+0x58/0xa0 [drm]
> > > [    7.644571]  drm_fbdev_client_setup+0xc4/0x17c [drm_kms_helper]
> > > [    7.644664]  drm_client_setup_with_fourcc+0x28/0x60 [drm_kms_helpe=
r]
> > > [    7.644755]  vc4_drm_bind+0x218/0x264 [vc4]
> > > [    7.644855]  try_to_bring_up_aggregate_device+0x168/0x1b4
> > > [    7.644884]  __component_add+0xb8/0x158
> > > [    7.644905]  component_add+0x14/0x20
> > > [    7.644925]  vc4_hvs_dev_probe+0x1c/0x28 [vc4]
> > > [    7.645019]  platform_probe+0xa8/0xd0
> > > [    7.645045]  really_probe+0x128/0x2c8
> > > [    7.645065]  __driver_probe_device+0xa0/0x128
> > > [    7.645086]  driver_probe_device+0x3c/0x1f8
> > > [    7.645106]  __device_attach_driver+0x118/0x140
> > > [    7.645127]  bus_for_each_drv+0xf4/0x14c
> > > [    7.645145]  __device_attach+0xfc/0x194
> > > [    7.645164]  device_initial_probe+0x14/0x20
> > > [    7.645184]  bus_probe_device+0x94/0x100
> > > [    7.645202]  deferred_probe_work_func+0x88/0xc4
> > > [    7.645223]  process_scheduled_works+0x194/0x2c4
> > > [    7.645246]  worker_thread+0x290/0x39c
> > > [    7.645265]  kthread+0xfc/0x184
> > > [    7.645289]  ret_from_fork+0x10/0x20
> > > [    7.645317] Code: f2ac6c49 aa1303e0 f2cdcde9 f2e00ba9 (f9001d09)
> > > [    7.645338] ---[ end trace 0000000000000000 ]---
> > >
> > > This happens because commit 45903624e9fc ("drm/vc4: Run DRM default c=
lient
> > > setup") only added DRM_FBDEV_DMA_DRIVER_OPS to `struct vc4_drm_driver=
`
> > > and didn't add it to `struct vc5_drm_driver`. The `struct vc4_drm_dri=
ver`
> > > is used in RPi 0-3, as VC4 is also a render node in those RPis. But R=
Pi 4
> > > and 5 use V3D as the render node and VC4 as modeset node and therefor=
e,
> > > use `struct vc5_drm_driver`.
> > >
> > > This commit adds DRM_FBDEV_DMA_DRIVER_OPS to `struct vc5_drm_driver`,
> > > ensuring that `fbdev_probe` exists for all VC4 generations.
> > >
> > > Fixes: 45903624e9fc ("drm/vc4: Run DRM default client setup")
> > > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> It's the third time it was sent:
>
> https://lore.kernel.org/dri-devel/20241002-vc4_fbdev_fix-v1-1-8737bd11b14=
7@raspberrypi.com/
> https://lore.kernel.org/dri-devel/20241003092826.1942901-3-m.szyprowski@s=
amsung.com/

It is. No one responded to my version. I can merge Marek's vc4 change
with my R-b, or now Maira's with Thomas and mine.
But both the other two submissions also included a patch so that
drm_fb_helper handled the error more cleanly [1 and 2]. I'm still new
to maintainership, but I don't believe I'm in a position to merge
either of those.

  Dave

[1] https://lore.kernel.org/dri-devel/20241002-vc4_fbdev_fix-v1-2-8737bd11b=
147@raspberrypi.com/
[2] https://lore.kernel.org/dri-devel/20241003092826.1942901-2-m.szyprowski=
@samsung.com/
