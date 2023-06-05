Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7AA722ECA
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 20:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D8010E1D5;
	Mon,  5 Jun 2023 18:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD5310E065
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 18:33:57 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-652dd220d67so4018850b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685990037; x=1688582037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=rN7LudxPUYnjPAJQbN2izPayQt46XoBv5lVSyzqw2SQ=;
 b=WdsbLynlwHw3pOVU4zQ0dTnfW6lam1wS5bTT0HVgvH9qvEBl9iDWepON1G3yN90cAd
 CprRp+rIuyMjMDAtKZbT0A3Nl3sjV25NtAYM+qdCU6HGerMMgu3D6xPAqYxZITcSEaGX
 e3qaasRjcCnaq2W69k7p3l+14m1ZaS3VILElKqAIEnrRys/wrsanmymlA1jP6pbR8Jzr
 bcKFszaKdXo9KrfB0R3t3Td4sMEaWlU3JKIWXLHSIPKLuhPOmPfgMS1xUAo3JrDtLjFv
 UvspdiqPut7JpME7rv/ZY9Ok3EqFw5lIk6h1IRTVZFyDSLilEMwtHg9P/n8bHrNzv3kv
 qCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685990037; x=1688582037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rN7LudxPUYnjPAJQbN2izPayQt46XoBv5lVSyzqw2SQ=;
 b=VrKO7IVP+0GClHUtLk8MJinpoim9AER7qRYz6GIbk3iM8cbbTiu2EYnIVqp1dLouEo
 qOpup73u1pCuQ7e6EEhLFqr4opHPyBBl2twTVOvm5JH8NXRTqiGXg+cyU/HEf3I2Vh8C
 d6kEp8rOOsuEiWQCoGBo6m4JH0TC1Uszfa1B4Stz3PEzLCYcKM2+UkTwIfB1gzALPM2g
 far8P7VjF+LHWx2qHw/JBfmZGKy0VltqlKtUf9DzICL8VnDg7gZudHLoE6genjFhvxOP
 KXXoZcILSWo1RtrcuTLWFe+2USpmLaYBsQH5QbYx5Je4UeQyRFP8SMeHFCfIhLDf/T+e
 pjUA==
X-Gm-Message-State: AC+VfDyTDP7GQA0lshcFAKJsE/qWMH2dmmDvt2ykzy0d/z2PtdOWxLAy
 lpqXb8pT/4bJ+V9jI3V6eV8=
X-Google-Smtp-Source: ACHHUZ4KfBuoXqSnsXxLcWgr9PWcEu4ZtFyLsJedr5ryhOayp5qnMB1o/n2RQYPQy4er/kO5Ran4GA==
X-Received: by 2002:a05:6a00:148b:b0:643:8496:e41c with SMTP id
 v11-20020a056a00148b00b006438496e41cmr570422pfu.20.1685990036687; 
 Mon, 05 Jun 2023 11:33:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a62ee03000000b0065379c6d549sm5164981pfi.215.2023.06.05.11.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 11:33:56 -0700 (PDT)
Date: Mon, 5 Jun 2023 11:33:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/4] Input: ads7846 - Convert to use software nodes
Message-ID: <3af67419-dbac-4103-bdac-15f1588cb3ed@roeck-us.net>
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 08, 2023 at 11:20:06PM +0200, Linus Walleij wrote:
> The Nokia 770 is using GPIOs from the global numberspace on the
> CBUS node to pass down to the LCD controller. This regresses when we
> let the OMAP GPIO driver use dynamic GPIO base.
> 
...
> 
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This patch causes a crash with the mcimx7d-sabre qemu emulation.
Backtrace and bisect results below.

Source:

        pdev_id = device_get_match_data(dev);
        if (!pdev_id) {
                dev_err(dev, "Unknown device model\n");
                return ERR_PTR(-EINVAL);
        }

        pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
        if (!pdata)
                return ERR_PTR(-ENOMEM);

        pdata->model = (unsigned long)pdev_id->driver_data;	<--- crash

It appears that device_get_match_data() already returns driver_data.
A little debugging shows that pdev_id is indeed 0x1EA6 or 7846.

Guenter

---
Stack backtrace:

[    7.254561] wm8960 3-001a: Failed to issue reset
[    7.257313] wm8960: probe of 3-001a failed with error -110
[    7.258170] i2c i2c-3: IMX I2C adapter registered
[    7.265584] hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 counters available
[    7.280312] stmp_reset_block((ptrval)): module reset timeout
[    7.280573] mxs-dma: probe of 33000000.dma-controller failed with error -110
[    7.309572] 8<--- cut here ---
[    7.309785] Unhandled fault: page domain fault (0x01b) at 0x00001eba
[    7.309916] [00001eba] *pgd=00000000
[    7.310327] Internal error: : 1b [#1] SMP ARM
[    7.310504] Modules linked in:
[    7.310701] CPU: 0 PID: 29 Comm: kworker/u4:2 Tainted: G                 N 6.4.0-rc5-next-20230605 #1
[    7.310868] Hardware name: Freescale i.MX7 Dual (Device Tree)
[    7.311058] Workqueue: events_unbound deferred_probe_work_func
[    7.311482] PC is at ads7846_probe+0x9f0/0xfa0
[    7.311576] LR is at _raw_spin_unlock_irqrestore+0x50/0x64
[    7.311659] pc : [<c0cf2ab0>]    lr : [<c1128bf4>]    psr: a0000013
[    7.311742] sp : d0949bf0  ip : 00000001  fp : 00000000
[    7.311814] r10: c1b96954  r9 : cbdcd208  r8 : c499aec0
[    7.311889] r7 : c4b64400  r6 : c4b4d040  r5 : c4b64400  r4 : 00001ea6
[    7.311978] r3 : 00000000  r2 : c41dd000  r1 : 0a3d1000  r0 : c499aec0
[    7.312102] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    7.312211] Control: 10c5387d  Table: 848c406a  DAC: 00000051
[    7.312305] Register r0 information: slab kmalloc-128 start c499ae80 pointer offset 64 size 128
[    7.312688] Register r1 information: non-paged memory
[    7.312832] Register r2 information: slab kmalloc-4k start c41dd000 pointer offset 0 size 4096
[    7.312973] Register r3 information: NULL pointer
[    7.313045] Register r4 information: non-paged memory
[    7.313116] Register r5 information: slab kmalloc-1k start c4b64400 pointer offset 0 size 1024
[    7.313247] Register r6 information: slab kmalloc-4k start c4b4d000 pointer offset 64 size 4096
[    7.313379] Register r7 information: slab kmalloc-1k start c4b64400 pointer offset 0 size 1024
[    7.313509] Register r8 information: slab kmalloc-128 start c499ae80 pointer offset 64 size 128
[    7.313640] Register r9 information: non-slab/vmalloc memory
[    7.313751] Register r10 information: non-slab/vmalloc memory
[    7.313836] Register r11 information: NULL pointer
[    7.313908] Register r12 information: non-paged memory
[    7.313992] Process kworker/u4:2 (pid: 29, stack limit = 0x(ptrval))
[    7.314107] Stack: (0xd0949bf0 to 0xd094a000)
[    7.314223] 9be0:                                     00000000 c4b64400 c4b64400 c1bc0a9c
[    7.314337] 9c00: c4b69000 c234b3f4 cbdcd208 c0e01338 ffffffff 00000000 00000000 00000000
[    7.314441] 9c20: 00000000 00000000 00000000 d0b2c62c 00000000 00000000 c4b64400 c1bc0a9c
[    7.314543] 9c40: 00000000 c234b3f4 cbdcd208 c1b96954 00000000 c0b73a98 c4b64400 00000000
[    7.314650] 9c60: c1bc0aac c0a4a434 c4b64400 c1bc0aac c4b64400 00000016 c234b3f4 c0a4a6d4
[    7.314754] 9c80: c134db68 3fffffff c234b44c c1bc0aac c4b64400 00000016 c234b3f4 c0a4a81c
[    7.314856] 9ca0: 00000001 c1bc0aac d0949cfc c4b64400 c234b3f4 c0a4a948 00000000 c41ea600
[    7.314957] 9cc0: d0949cfc c0a4a8b4 c234b3f4 c0a4849c c4b688bc c41ea6e4 c461d3d8 d0b2c62c
[    7.315059] 9ce0: c4b688bc c4b64400 00000001 c4b64444 c41ea600 c0a4aca8 c413ac88 c4b64400
[    7.315161] 9d00: 00000001 d0b2c62c c4b64400 c4b64400 00000000 c0a49590 c4b64400 00000000
[    7.315263] 9d20: 00000000 c4b68800 c234b3f4 c0a47164 c41dd000 c4b64400 00000000 c422f810
[    7.315365] 9d40: c422f810 d0b2c62c 00000000 c4b64400 c4b68800 c422f810 cbdcd260 c170bd30
[    7.315471] 9d60: c170bd24 c0b77d4c c4b68b1c c4b64400 c4b64400 00000000 cbdcd260 c0b77e34
[    7.315574] 9d80: c4b68800 cbdcd1fc c4b64400 c0b786e4 00000000 c1b7dac4 c4020000 c422f810
[    7.315675] 9da0: d0949d9c 000f4240 00000000 d0b2c62c 00000000 c4b68800 ffffffed c422f800
[    7.315777] 9dc0: c422f810 c4b68d40 c4b68800 00000000 c4020000 c0b8102c 00000000 c423c080
[    7.315878] 9de0: c4b68d40 00000000 c423c040 00000000 00000000 d0b2c62c 00000000 c422f810
[    7.315980] 9e00: c1baff90 00000000 c1b96f6c 00000000 c1c20420 c0a4cd34 c422f810 00000000
[    7.316080] 9e20: c1baff90 00000000 c1b96f6c c0a4a434 c422f810 c1baff90 c422f810 00000016
[    7.316182] 9e40: c1b96f6c c0a4a6d4 c1330f38 3ffffffb c234b44c c1baff90 c422f810 00000016
[    7.316283] 9e60: c1b96f6c c0a4a81c 00000001 c1baff90 d0949ec4 c422f810 c1b96f6c c0a4a948
[    7.316384] 9e80: 00000000 c40dec00 d0949ec4 c0a4a8b4 c1b96f6c c0a4849c c422e0cc c40dece4
[    7.316486] 9ea0: c4603a58 d0b2c62c c422e0cc c422f810 00000001 c422f854 c40dec00 c0a4aca8
[    7.316587] 9ec0: c413ac88 c422f810 00000001 d0b2c62c c423a434 c422f810 c1b96e8c c0a49590
[    7.316689] 9ee0: c423a434 c422f810 c1b96e8c c1b96e90 c1b96f6c c0a4a1d8 c1b96f00 c429f680
[    7.316791] 9f00: c400ce00 c4020000 c1a093d4 c400ce15 c1c20420 c0149e40 00000001 00000000
[    7.316893] 9f20: c0149d78 c4020000 c1b96f00 c209b3cc 00000000 c16e587c 00000000 d0b2c62c
[    7.316996] 9f40: c4020000 c429f680 c4020000 c429f6ac c4020040 c1a05d40 00000088 c41dd000
[    7.317099] 9f60: c4020000 c014a294 00000000 c429c780 c41dd000 c014a268 c429f680 c429f780
[    7.317201] 9f80: d0889ec4 00000000 00000000 c0154358 c429c780 c015425c 00000000 00000000
[    7.317303] 9fa0: 00000000 00000000 00000000 c010012c 00000000 00000000 00000000 00000000
[    7.317404] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.317506] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    7.317682]  ads7846_probe from spi_probe+0x84/0xa8
[    7.317785]  spi_probe from really_probe+0xc4/0x2e0
[    7.317862]  really_probe from __driver_probe_device+0x84/0x1a0
[    7.317948]  __driver_probe_device from driver_probe_device+0x2c/0xc4
[    7.318037]  driver_probe_device from __device_attach_driver+0x94/0xc4
[    7.318125]  __device_attach_driver from bus_for_each_drv+0x84/0xdc
[    7.318214]  bus_for_each_drv from __device_attach+0xac/0x1d8
[    7.318296]  __device_attach from bus_probe_device+0x8c/0x90
[    7.318377]  bus_probe_device from device_add+0x560/0x774
[    7.318455]  device_add from __spi_add_device+0x58/0xe8
[    7.318533]  __spi_add_device from spi_add_device+0x58/0x8c
[    7.318613]  spi_add_device from spi_register_controller+0x784/0xbfc
[    7.318705]  spi_register_controller from spi_imx_probe+0x390/0x604
[    7.318795]  spi_imx_probe from platform_probe+0x58/0xbc
[    7.318872]  platform_probe from really_probe+0xc4/0x2e0
[    7.318947]  really_probe from __driver_probe_device+0x84/0x1a0
[    7.319029]  __driver_probe_device from driver_probe_device+0x2c/0xc4
[    7.319116]  driver_probe_device from __device_attach_driver+0x94/0xc4
[    7.319205]  __device_attach_driver from bus_for_each_drv+0x84/0xdc
[    7.319291]  bus_for_each_drv from __device_attach+0xac/0x1d8
[    7.319372]  __device_attach from bus_probe_device+0x8c/0x90
[    7.319454]  bus_probe_device from deferred_probe_work_func+0x8c/0xc0
[    7.319542]  deferred_probe_work_func from process_one_work+0x288/0x6b0
[    7.319635]  process_one_work from worker_thread+0x2c/0x480
[    7.319715]  worker_thread from kthread+0xfc/0x120
[    7.319788]  kthread from ret_from_fork+0x14/0x28

Bisect result:

# bad: [9ca10bfb8aa8fbf19ee22e702c8cf9b66ea73a54] Add linux-next specific files for 20230605
# good: [9561de3a55bed6bdd44a12820ba81ec416e705a7] Linux 6.4-rc5
git bisect start 'HEAD' 'v6.4-rc5'
# bad: [8e3a5ba24fdd336ddd8096257588f5ad5a934ffa] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
git bisect bad 8e3a5ba24fdd336ddd8096257588f5ad5a934ffa
# bad: [376395b3a956c450a8f52a02acf0e9d7cbb77ac9] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git
git bisect bad 376395b3a956c450a8f52a02acf0e9d7cbb77ac9
# bad: [332f472c4163f902f588816c8b28a00a461ed325] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
git bisect bad 332f472c4163f902f588816c8b28a00a461ed325
# good: [159f9e8420bb86f7b154acec72d93528a3f9b0f7] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect good 159f9e8420bb86f7b154acec72d93528a3f9b0f7
# good: [dc7fd8b3a8838ce715fed6c58a90187380084582] Merge branch 'for-next/core' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
git bisect good dc7fd8b3a8838ce715fed6c58a90187380084582
# bad: [de6a558f810c3de395eaa58bce1063e24d8a78b8] Merge branch 'at91-next' of git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
git bisect bad de6a558f810c3de395eaa58bce1063e24d8a78b8
# good: [3ea093976845afd968dfc9cf36eb8d5ba63b7c0e] Merge branch 'soc/dt' into for-next
git bisect good 3ea093976845afd968dfc9cf36eb8d5ba63b7c0e
# bad: [b26078a2b9df1dfd725a0e171d2b0ad0259cfef1] Merge branch 'arm/fixes' into for-next
git bisect bad b26078a2b9df1dfd725a0e171d2b0ad0259cfef1
# bad: [8e0285ab95a9baf374f2c13eb152221c8ecb3f28] ARM/musb: omap2: Remove global GPIO numbers from TUSB6010
git bisect bad 8e0285ab95a9baf374f2c13eb152221c8ecb3f28
# bad: [e519f0bb64efc2c9c8b67bb2d114dda458bdc34d] ARM/mmc: Convert old mmci-omap to GPIO descriptors
git bisect bad e519f0bb64efc2c9c8b67bb2d114dda458bdc34d
# good: [4c40db6249ff1da335b276bdd6c3c3462efbc2ab] ARM: omap1: Remove reliance on GPIO numbers from PalmTE
git bisect good 4c40db6249ff1da335b276bdd6c3c3462efbc2ab
# bad: [767d83361aaa6a1ecb4d5b89eeb38a267239917a] Input: ads7846 - Convert to use software nodes
git bisect bad 767d83361aaa6a1ecb4d5b89eeb38a267239917a
# good: [480c82daa3e41873421dc2c9e2918ad7e21d7a0b] ARM: omap1: Remove reliance on GPIO numbers from SX1
git bisect good 480c82daa3e41873421dc2c9e2918ad7e21d7a0b
# first bad commit: [767d83361aaa6a1ecb4d5b89eeb38a267239917a] Input: ads7846 - Convert to use software nodes
