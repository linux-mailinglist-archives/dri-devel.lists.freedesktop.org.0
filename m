Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6EB90B81B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 19:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F6610E47B;
	Mon, 17 Jun 2024 17:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D49310E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 17:33:20 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-62ce53782f4so46522087b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 10:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718645599; x=1719250399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQAVRrUu5DgIhmr32+K0xwONZEayKP5zGr+OfCubAWo=;
 b=eWV0ibu3Cb9lLS9iDafQ/URiuGf/eFOuM89gCjovMj9jx1CfFwFDuXR+PrrCCdSry+
 Mc1T7ezvx24dFQad/c1AZ2yjYNrDtZjmSYJqLUpRoorB4+c3dKPW+lSvMtw8Hpr2L88y
 8DBiRFAxWfxZqU26JH+EEUNzK5v0j9mf01kS8QE+6Ox0Y8PtyohKdIjgYgKu5VV8QYdL
 6vrWUwOQ/Ow5GDVP54XmdnsrTtS5r0MKBWGp/QR/cZWVwWJ2JWpD8fVkdhOobOldmDQc
 pMMNUph5K0RhHkxWMJvjJQuuVektnJiIIAluG6Y/8MFvUu55xu41ETUYL+sWMU7Ztw9s
 GGrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj1Bdy0htDSgBvG7HWab7pWbAQrdACoX/vC4NHRHph7s8PPwnX+rZWOEbNb6Fjf8s5IgS1DtPADt+W8IbuF9j5HV8+iwxKZXvy5qhjORYA
X-Gm-Message-State: AOJu0YwRsoUG/Sas5Jaw/u50m6P/hpRQzzAO+gxG8OUT2KHJF4rIo4bE
 /piMLbm17K5qe4HPVJ5W8BKLE6PGm5siC8ta+e1TLzU5dcf74PV1SGNyJQPx
X-Google-Smtp-Source: AGHT+IEYWPzmKfXCNf+z5H5cxMDk0PTATKSL2gSPbyRneKbOh2C2fOrMUtmwW1YmzX/gHFqIn6dqNQ==
X-Received: by 2002:a0d:ea4c:0:b0:630:d035:ef7e with SMTP id
 00721157ae682-632247105dfmr97147457b3.34.1718645598756; 
 Mon, 17 Jun 2024 10:33:18 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6311a446fc1sm14745377b3.97.2024.06.17.10.33.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 10:33:18 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dfab4779d95so4577976276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 10:33:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVLmW0gkI3M6UhlgvK8ErfXYzjJy3hNRaVJ3UPH+NCzVeYgAroJQc/R83n7QjUR2vXEma6VTtKoSenzasyEkR0yTED+A2+KmdyfaLWWM9xj
X-Received: by 2002:a25:fe05:0:b0:dfa:72cc:f88b with SMTP id
 3f1490d57ef6-dff154a8d22mr9588983276.52.1718645597325; Mon, 17 Jun 2024
 10:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240419083331.7761-1-tzimmermann@suse.de>
 <20240419083331.7761-29-tzimmermann@suse.de>
In-Reply-To: <20240419083331.7761-29-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 19:33:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3N0szUvt1VTbroa2zrT1Nye_VzPb5qqCZ7z5gSm7HGw@mail.gmail.com>
Message-ID: <CAMuHMdX3N0szUvt1VTbroa2zrT1Nye_VzPb5qqCZ7z5gSm7HGw@mail.gmail.com>
Subject: Re: [PATCH v3 28/43] drm/renesas/rcar-du: Use fbdev-dma
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Thomas,

On Fri, Apr 19, 2024 at 10:34=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by rcar-du. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch, which is now commit b3fdbd60d35ce340
("drm/renesas/rcar-du: Use fbdev-dma") in drm-misc/drm-misc-next.

Probably this doesn't come as a surprise, but with CONFIG_DEBUG_VIRTUAL=3Dy=
,
this triggers the following warning on R-Car Gen3/Gen4 (arm64),
e.g. on White-Hawk:

    virt_to_phys used for non-linear address: (____ptrval____)
(0xffffffc088001000)
    WARNING: CPU: 0 PID: 44 at arch/arm64/mm/physaddr.c:12
__virt_to_phys+0x38/0x70
    Modules linked in:
    CPU: 0 PID: 44 Comm: kworker/u17:2 Not tainted
6.9.0-rc6-white-hawk-01422-gb3fdbd60d35c-dirty #283
    Hardware name: Renesas White Hawk CPU and Breakout boards based on
r8a779g0 (DT)
    Workqueue: events_unbound deferred_probe_work_func
    pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
    pc : __virt_to_phys+0x38/0x70
    lr : __virt_to_phys+0x38/0x70
    sp : ffffffc08297b930
    x29: ffffffc08297b930 x28: ffffff844527c000 x27: ffffffc080cb6a47
    x26: ffffffc0810c0000 x25: ffffff84452a7800 x24: ffffff8445370018
    x23: ffffff8443d34480 x22: ffffff8443d32c00 x21: ffffffc08297ba30
    x20: ffffff84452a5800 x19: ffffffc088001000 x18: 0000000000000000
    x17: 666678302820295f x16: 5f5f5f6c61767274 x15: 0720072007200720
    x14: 0720072007200720 x13: 0720072007200720 x12: 0720072007200720
    x11: 0000000000000180 x10: ffffffc0810e9aa0 x9 : ffffffc0813a9c80
    x8 : ffffffc08297b638 x7 : ffffffc08297b640 x6 : 00000000ffff7fff
    x5 : c0000000ffff7fff x4 : 0000000000000000 x3 : 0000000000000001
    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff8441ba2940
    Call trace:
     __virt_to_phys+0x38/0x70
     drm_fbdev_dma_helper_fb_probe+0x178/0x1e8
     __drm_fb_helper_initial_config_and_unlock+0x26c/0x4b8
     drm_fb_helper_initial_config+0x30/0x44
     drm_fbdev_dma_client_hotplug+0x84/0xb4
     drm_client_register+0x74/0xb8
     drm_fbdev_dma_setup+0x118/0x11c
     rcar_du_probe+0x160/0x174
     platform_probe+0x64/0xb0
     really_probe+0x130/0x260
     __driver_probe_device+0xec/0x104
     driver_probe_device+0x4c/0xf8
     __device_attach_driver+0xa8/0xc8
     bus_for_each_drv+0xa4/0xc8
     __device_attach+0xe4/0x144
     device_initial_probe+0x10/0x18
     bus_probe_device+0x38/0xa0
     deferred_probe_work_func+0xb8/0xd0
     process_scheduled_works+0x314/0x4d4
     worker_thread+0x1b8/0x20c
     kthread+0xd8/0xe8
     ret_from_fork+0x10/0x20
    irq event stamp: 7568
    hardirqs last  enabled at (7567): [<ffffffc080928828>]
_raw_spin_unlock_irq+0x2c/0x40
    hardirqs last disabled at (7568): [<ffffffc080922b20>]
__schedule+0x1cc/0x868
    softirqs last  enabled at (5004): [<ffffffc0800102fc>]
__do_softirq+0x1ac/0x3a8
    softirqs last disabled at (4999): [<ffffffc080015624>]
____do_softirq+0xc/0x14

Interestingly, the warning is not triggered on R-Car Gen2 (arm32),
although arch/arm/mm/physaddr.c has a similar check.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
