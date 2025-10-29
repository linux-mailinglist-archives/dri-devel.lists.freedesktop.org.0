Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197EAC1B15E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037BC10E7B2;
	Wed, 29 Oct 2025 14:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CA910E7B2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:08:21 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-931028aeaf9so5749208241.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761746900; x=1762351700;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OOPVCmUJ4ZNRYV3mHvcjLSYwchRBNgJJbT+F/028/Ck=;
 b=Y0csmsYNcZNIccK63sB+H1HMIfHYE/jRq0CBtzbBziWh+JzEFhFMp6VceJi4y2q5Nb
 Eem+s1exUeEJssK6XSyleOzr60NkUA/LgbwwqjQcYygs7d8Wakwrae9XxrqT/B5wkSUe
 3FNBVfWrb5f/+0VVjK7vwDDcfNXxOliVUj11QLLe2XmZj/aW/QIZ/Y8OJFWgYdMio6KZ
 EgCe1jbujn9BxPpxvqvmLP+5FEPWZ+RLrLGZADy2iOvMtkgdw+TqW9b8lIL2EL4waNA5
 goHBEH2ZA17yRtn+Oq5Jib6C+kChjJgUMQRNQ8B9wBHWbkCOUbQoFJzP78U+jo6ctc9B
 7I/w==
X-Gm-Message-State: AOJu0YwC+syqo3Jw+bzAjkTsq54N3pv3KF2His0hSDbezQCn3hOOIpf4
 pg3C4oqjjJCNxixwRaJvj+c9ok1fpu4xdZDie5q3MTfNr7lv2n9byydJ7tWc2C4o
X-Gm-Gg: ASbGnctuWhNasl/t+2VOQBvkkiL7A/6/u+EKG4nwejCO1L06Vz2mAfwL4RYl+ekFzxw
 MdxKJjOShgX8CaPJxSwoCmVGJWsWXZMdYUq4PVxqsUxifGWThLNqcgA1JDRt/FD0BZ9Eyek3CYC
 oRBWso4L7QRrcVdsuV4xvc1GQaEFFFjYRbRylVDQB5gP7jkD9GBHqArPs6znr4BEMaBrqLbd7xr
 4dTUI3sShQeBUtWE274JOeFH3Gs1bnT3oLzBP/bVMlYenGzqlaQ+oLYChfMskPpDhLu6xdBKSH+
 R9v4YRMQfKXtlLE1mXhwyh3QWl3nPS/9OEPtE6TSEwjcVJSgy/2g8+dufXEYFVFUl1zy6EbbPN+
 WzCJhyscC3FlxcGLIKg3UEf8/DrAxhJJQu7YIWh5jG6ihOvr0DuQpqVs03h+rQODFBsNLJ1IXL0
 Oxzc/rbnrr84rrqhUQAblukASY7qtdLkbnL++oKJO7Qg==
X-Google-Smtp-Source: AGHT+IEjYlfofjyOGutbgjrUExZlshg5pV3tzXr18fz7qKi5ixoFucfm/17zyWFQ3UM8krXWKgc4eQ==
X-Received: by 2002:a05:6122:8c24:b0:557:c345:f48 with SMTP id
 71dfb90a1353d-5581410662cmr999292e0c.6.1761746900252; 
 Wed, 29 Oct 2025 07:08:20 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-557ddb08fcfsm5399845e0c.9.2025.10.29.07.08.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 07:08:19 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-5ce093debf6so7468568137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:08:19 -0700 (PDT)
X-Received: by 2002:a05:6102:e0f:b0:5d5:d1e1:73e8 with SMTP id
 ada2fe7eead31-5db9060234amr888440137.13.1761746898835; Wed, 29 Oct 2025
 07:08:18 -0700 (PDT)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:08:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnMfLsD6ckHkiLwQYsmzX9C30w05ySYiahP4F0MOeUnduw0r08f34AHIpM
Message-ID: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
Subject: drm/imagination: genpd_runtime_suspend() crash
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi all,

While playing with the PowerVR driver on various R-Car SoCs, I ran into
a crash/race condition on Gray Hawk Single (R-Car V4M).  After adding
the GPU device node to DTS, the driver fails to probe due to lack of
suitable firmware, as expected:

    powervr fd000000.gpu: Direct firmware load for
powervr/rogue_36.53.104.796_v1.fw failed with error -2
    powervr fd000000.gpu: [drm] *ERROR* failed to load firmware
powervr/rogue_36.53.104.796_v1.fw (err=-2)

However, after that it crashes:

    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000040
    Mem abort info:
    PM: GENPD_STATE_OFF
      ESR = 0x0000000096000004
    PM: sd_count 19
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    [0000000000000040] user address but active_mm is swapper
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 2 UID: 0 PID: 46 Comm: kworker/u16:2 Tainted: G        W
     6.18.0-rc3-arm64-renesas-04934-g585255656363-dirty #3296 PREEMPT
    Tainted: [W]=WARN
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    Workqueue: pm pm_runtime_work
    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : default_suspend_ok+0xb4/0x20c
    lr : default_suspend_ok+0x9c/0x20c
    sp : ffff800081e23bc0
    x29: ffff800081e23bd0 x28: ffff800080e2d240 x27: ffff0004402d8bc0
    x26: ffff0004402e2900 x25: ffff000440b554e4 x24: ffff80008108bb70
    x23: 0000000000000001 x22: ffff80008108bb88 x21: ffff800080e2c568
    x20: ffff800080e2d258 x19: ffff000440b55400 x18: 0000000000000006
    x17: 2030683937376138 x16: 72206e6f20646573 x15: ffff800081e23510
    x14: 0000000000000000 x13: 3035616234383138 x12: 3030303866666666
    x11: 0000000000000533 x10: 000000000000005d x9 : 000000000001b64f
    x8 : 7f7f7f7f7f7f7f7f x7 : 205d373032323131 x6 : 0000000000000000
    x5 : 0000000000000030 x4 : 0000000000000000 x3 : 0000000000000043
    x2 : ffff800080e2d258 x1 : ffff80008108bb70 x0 : ffff000440b55400
    Call trace:
     default_suspend_ok+0xb4/0x20c (P)
     genpd_runtime_suspend+0x11c/0x4e0
     __rpm_callback+0x44/0x1cc
     rpm_callback+0x6c/0x78
     rpm_suspend+0x108/0x564
     pm_runtime_work+0xb8/0xbc
     process_one_work+0x144/0x280
     worker_thread+0x2c8/0x3d0
     kthread+0x128/0x1e0
     ret_from_fork+0x10/0x20
    Code: aa1303e0 52800863 b0005661 912dc021 (f9402095)
    ---[ end trace 0000000000000000 ]---

This driver uses manual PM Domain handling for multiple PM Domains.  In
my case, pvr_power_domains_fini() calls dev_pm_domain_detach() (twice),
which calls dev_pm_put_subsys_data(), and sets dev->power.subsys_data to
NULL when psd->refcount reaches zero.

Later/in parallel, default_suspend_ok() calls dev_gpd_data():

    static inline struct generic_pm_domain_data *dev_gpd_data(struct
device *dev)
    {
            return to_gpd_data(dev->power.subsys_data->domain_data);
    }

triggering the NULL pointer dereference.  Depending on timing, it may
crash earlier or later in genpd_runtime_suspend(), or not crash at all
(initially, I saw it only with extra debug prints in the genpd subsystem).

As the driver mixes automatic (devm_*()) and manual cleanup, my first
guess was that devm_pm_runtime_enable() would keep Runtime PM enabled
too long after the manual call to pvr_power_domains_fini(), but
replacing that by manual cleanup:

    --- a/drivers/gpu/drm/imagination/pvr_drv.c
    +++ b/drivers/gpu/drm/imagination/pvr_drv.c
    @@ -1424,7 +1424,7 @@ pvr_probe(struct platform_device *plat_dev)
            if (err)
                    goto err_context_fini;

    -       devm_pm_runtime_enable(&plat_dev->dev);
    +       pm_runtime_enable(&plat_dev->dev);
            pm_runtime_mark_last_busy(&plat_dev->dev);

            pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
    @@ -1450,6 +1450,9 @@ pvr_probe(struct platform_device *plat_dev)
     err_watchdog_fini:
            pvr_watchdog_fini(pvr_dev);

    +       pm_runtime_dont_use_autosuspend(&plat_dev->dev);
    +       pm_runtime_disable(&plat_dev->dev);
    +
            pvr_queue_device_fini(pvr_dev);

     err_context_fini:
    @@ -1475,6 +1478,8 @@ static void pvr_remove(struct
platform_device *plat_dev)
            pvr_device_fini(pvr_dev);
            drm_dev_unplug(drm_dev);
            pvr_watchdog_fini(pvr_dev);
    +       pm_runtime_dont_use_autosuspend(&plat_dev->dev);
    +       pm_runtime_disable(&plat_dev->dev);
            pvr_queue_device_fini(pvr_dev);
            pvr_context_device_fini(pvr_dev);
            pvr_power_domains_fini(pvr_dev);

did not fix the issue.  Calling pm_runtime_force_suspend() instead of
pm_runtime_dont_use_autosuspend() also didn't help.

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
