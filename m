Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9D451783A
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 22:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DCB10E598;
	Mon,  2 May 2022 20:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5DD10E598
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 20:35:16 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id m25so2443364oih.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=Wbb/YCuXfU00DfHND/DHy2kwUE+lT6TSINXYpJ/qV5I=;
 b=FLLW/uyff9Ycgsqvr7B/1rKKbYcqxPHcB/Z4Dzkise/sBahurt9MkB5d2Pwdq0mBx6
 JBZ79EtlI9uPK5x9zPokW236sVzMczhGdVx1gIMZGk636HBXuHx4CTnG4GED7AvGzHUW
 Thvss09ZX4qJwF85xOtO/5anUeLJUCJLQqE2oTAv7ob7MgOQbZ8FIG2ataSCB11SLPi/
 zWRPk8cies0VayUBETQZF0ATO7Ph0YxmHCoLhEDbHA/tOq7AD79YUjIKnbLY1pjSmHsB
 fjVxpaNMsC7JbyjvdifBLlvwCFZr+BZVQ35H0Bzt/dw9KykTjCJryLdhyJ23VfF7JeHa
 F90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=Wbb/YCuXfU00DfHND/DHy2kwUE+lT6TSINXYpJ/qV5I=;
 b=anM8qk14vqg4mk3k4CYZYAF0eXQ9H14LzJxvlDSvHxyCSrzsDBXWP3mnQrLnf/dAnn
 r/bVWw1/A8rGddGA4KyK7cF610oFmqSMqwxMK2g39TSi5Qwkxq3uPe+dqoAQBbDZnNDu
 gbGrqbPmoKdLqbV56x43htytJMuqdFreMUclfvILWWeMIG3X/JsLDhM5gyhUng5XLojX
 /y5V/GWI/mUF1h3/SJS2j0mixo+S8b02AM4chYonBZqqRdu0gbpQJsyiA+/HC//GM1wK
 UwCOsxFaANyNkCPfKBNn4JsV5U1O7Jo8u5HaYNiohnsuE1eZlAd1ESdgS7xFzlrUqg8+
 Dxdg==
X-Gm-Message-State: AOAM533CqxWyQh20AsR0pdI5X/vqY7ED5hjsZhu3XjZNaozbIeXMGjDo
 9PCXkQT6zohsW8DUkwIA4cw=
X-Google-Smtp-Source: ABdhPJwiM/GiwIXmL7hyCptsmhhiYotg3kbrvacK9o0+PJRo8UrmYe/PJoRe3aFR7xYQMKwGGCJYVg==
X-Received: by 2002:a05:6808:1311:b0:325:bb64:ced6 with SMTP id
 y17-20020a056808131100b00325bb64ced6mr454522oiv.13.1651523716162; 
 Mon, 02 May 2022 13:35:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a4aa602000000b0035ef3da8387sm1302819oom.4.2022.05.02.13.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 13:35:15 -0700 (PDT)
Message-ID: <c001d58e-9a78-6338-a533-d0f215b3dfd1@roeck-us.net>
Date: Mon, 2 May 2022 13:35:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
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
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
In-Reply-To: <CAK8P3a0ogn1wgPBDHkT=Fb8ufA+y8Ax1Qov2-vRXfC08QqnrQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/2/22 12:21, Arnd Bergmann wrote:
> On Mon, May 2, 2022 at 6:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> With v5.18-rc1-49-gcb813018b5c1, I still get:
>>
>> [    0.797668] RAMDISK: Couldn't find valid RAM disk image starting at 0.
>> [    0.805262] /dev/root: Can't open blockdev
>> [    0.805487] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
>> [    0.805674] Please append a correct "root=" boot option; here are the available partitions:
>>
>> when trying to boot z2 from initrd.
>>
>> The other problems are gone.
> 
> Ok, progress!
> 
> What is your qemu command line? I see that z2 has no pcmcia device, so
> I tried booting
> from MMC, but this already fails with 5.18-rc1 without any of my
> patches, giving me
> 
> [    0.697481] Creating 3 MTD partitions on "physmap-flash":
> [    0.698161] 0x000000000000-0x000000040000 : "U-Boot Bootloader"
> [    0.702815] 0x000000040000-0x000000060000 : "U-Boot Environment"
> [    0.706541] 0x000000060000-0x000000800000 : "Flash"
> [    0.718066] pxa2xx-mci pxa2xx-mci.0: incomplete constraints, dummy
> supplies not allowed
> [    0.718501] pxa2xx-mci pxa2xx-mci.0: incomplete constraints, dummy
> supplies not allowed
> 

To boot from initrd:

qemu-system-arm -M z2 -kernel \
      arch/arm/boot/zImage -no-reboot -initrd \
      rootfs-armv5.cpio --append \
      "panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0" -nographic \
      -monitor null -serial stdio

where rootfs-armv5.cpio is from my repository at github.com.

https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/rootfs-armv5.cpio.gz

> Do  you have MMC or some other rootfs working without my patch series?
> 

I can boot z2 from mmc and flash, but I have a number of configuration
flags enabled on top of pxa_defconfig. That also works with your latest patch
series. See
https://kerneltests.org/builders/qemu-arm-testing/builds/75/steps/qemubuildcommand/logs/stdio

     # Always enable ...
     enable_config "${defconfig}" CONFIG_DEVTMPFS CONFIG_DEVTMPFS_MOUNT CONFIG_BLK_DEV_INITRD
     # Options needed to be built into the kernel for device support
     # on pxa devices
     # MTD, squashfs
     enable_config_cond "${defconfig}" CONFIG_MTD_BLOCK CONFIG_MTD_PXA2XX CONFIG_SQUASHFS
     # MMC
     enable_config_cond "${defconfig}" CONFIG_MMC_BLOCK CONFIG_MMC_PXA
     # PCMCIA
     enable_config_cond "${defconfig}" CONFIG_ATA CONFIG_BLK_DEV_SD CONFIG_PCCARD
     enable_config_cond "${defconfig}" CONFIG_PCMCIA CONFIG_PATA_PCMCIA CONFIG_PCMCIA_PXA2XX
     # USB
     enable_config_cond "${defconfig}" CONFIG_USB CONFIG_USB_STORAGE CONFIG_USB_OHCI_HCD CONFIG_USB_OHCI_HCD_PXA27X

Hope this helps,
Guenter
