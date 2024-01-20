Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B48335A2
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 19:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD0410E302;
	Sat, 20 Jan 2024 18:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from domac.alu.hr (unknown [161.53.235.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4573010E301
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 18:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by domac.alu.hr (Postfix) with ESMTP id DBF2160187;
 Sat, 20 Jan 2024 19:15:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1705774512; bh=E/AVwm19Vw3c9m9wJsEAX0UufsuEbOfBRUcifCQetiY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cyeGHiBWhSkbMSGhRpDXtFCPkmo7kOirsWFp3xAq5clU1x4cnYmcFN0w2jDrDlemS
 ROUUWK7ly3yEW1QVQa6ghJULIFC4Jg1SUPNpMnjNBT2mpnmL5BNvC58ICXfqLXdVMV
 H+qLLubm7ZDkHlrkORfdKF+Xawr3m+GkKGPvgQhv8cEIbFUhpYSsY12e38VvwyFyka
 FFODR3lgb2VkLfIK+spR0Zl7ZQxoX0VqY4FS7/u2KKqoSl1kEOr9hH1nG4pxEE50vZ
 YiVxBKCphAdEFOOmK2vOlHuX2Z7WDNpRg2RsdGVlI1s240bPBkYcCVxmn5QW//YNb9
 VgsHcSwu6IgQg==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
 by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fj_jGnug5Kgg; Sat, 20 Jan 2024 19:15:09 +0100 (CET)
Received: from [192.168.178.20] (dh207-42-16.xnet.hr [88.207.42.16])
 by domac.alu.hr (Postfix) with ESMTPSA id 190E060182;
 Sat, 20 Jan 2024 19:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1705774509; bh=E/AVwm19Vw3c9m9wJsEAX0UufsuEbOfBRUcifCQetiY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mzA1SFNP7xqUT/2FKrs0HQKt1ptQ7GsdmfHSfvLAmbAYOQd1+oD+KBSd5cKmdHYeN
 oi51jfX27frtgkaCWuJZImtPlk+oRLaxBqIay/2nDW/Lpjbq6HDqIeU667RDj9f+oN
 q/W1Kex8s1EWpAKqT0Nts1RlNG+hFJynFMKOMqvsKBtFKsZpqUr7QkPTxcaQvcV+CB
 7gVUmlHgGeN883i0/iFgMgu+BjW66AEKu8/MC7R+Mn4Q+o3/V27eLh4L+GwqoqNPQW
 1nxbYS2UX4WRGAfeMO3du2Y9aJ1jbpgPbGv+10thzUlGpE1ob+U3qidCOLgJ2zdvy2
 WP1+Tl/vFB7Rg==
Message-ID: <3da0801d-acb6-42a0-b4b1-05a8bf25c67e@alu.unizg.hr>
Date: Sat, 20 Jan 2024 19:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG][BISECTED] Freeze at loading init ramdisk
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <8a6aa228-f2da-4dcd-93c1-e34614cd6471@alu.unizg.hr>
 <cc813525-5484-443e-a40a-cb98f2ed4e1f@alu.unizg.hr>
 <ZautsJ6a7_YjW5aQ@archie.me>
From: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <ZautsJ6a7_YjW5aQ@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Prathu Baronia <prathubaronia2011@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/20/24 12:25, Bagas Sanjaya wrote:
> On Wed, Jan 17, 2024 at 07:47:49PM +0100, Mirsad Todorovac wrote:
>> On 1/16/24 01:32, Mirsad Todorovac wrote:
>>> Hi,
>>>
>>> On the Ubuntu 22.04 LTS Jammy platform, on a mainline vanilla torvalds tree kernel, the boot
>>> freezes upon first two lines and before any systemd messages.
>>>
>>> (Please find the config attached.)
>>>
>>> Bisecting the bug led to this result:
>>>
>>> marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect good
>>> d97a78423c33f68ca6543de510a409167baed6f5 is the first bad commit
>>> commit d97a78423c33f68ca6543de510a409167baed6f5
>>> Merge: 61da593f4458 689237ab37c5
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:   Fri Jan 12 14:38:08 2024 -0800
>>>
>>>       Merge tag 'fbdev-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
>>>       Pull fbdev updates from Helge Deller:
>>>        "Three fbdev drivers (~8500 lines of code) removed. The Carillo Ranch
>>>         fbdev driver is for an Intel product which was never shipped, and for
>>>         the intelfb and the amba-clcd drivers the drm drivers can be used
>>>         instead.
>>>         The other code changes are minor: some fb_deferred_io flushing fixes,
>>>         imxfb margin fixes and stifb cleanups.
>>>         Summary:
>>>          - Remove intelfb fbdev driver (Thomas Zimmermann)
>>>          - Remove amba-clcd fbdev driver (Linus Walleij)
>>>          - Remove vmlfb Carillo Ranch fbdev driver (Matthew Wilcox)
>>>          - fb_deferred_io flushing fixes (Nam Cao)
>>>          - imxfb code fixes and cleanups (Dario Binacchi)
>>>          - stifb primary screen detection cleanups (Thomas Zimmermann)"
>>>       * tag 'fbdev-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev: (28 commits)
>>>         fbdev/intelfb: Remove driver
>>>         fbdev/hyperv_fb: Do not clear global screen_info
>>>         firmware/sysfb: Clear screen_info state after consuming it
>>>         fbdev/hyperv_fb: Remove firmware framebuffers with aperture helpers
>>>         drm/hyperv: Remove firmware framebuffers with aperture helper
>>>         fbdev/sis: Remove dependency on screen_info
>>>         video/logo: use %u format specifier for unsigned int values
>>>         video/sticore: Remove info field from STI struct
>>>         arch/parisc: Detect primary video device from device instance
>>>         fbdev/stifb: Allocate fb_info instance with framebuffer_alloc()
>>>         video/sticore: Store ROM device in STI struct
>>>         fbdev: flush deferred IO before closing
>>>         fbdev: flush deferred work in fb_deferred_io_fsync()
>>>         fbdev: amba-clcd: Delete the old CLCD driver
>>>         fbdev: Remove support for Carillo Ranch driver
>>>         fbdev: hgafb: fix kernel-doc comments
>>>         fbdev: mmp: Fix typo and wording in code comment
>>>         fbdev: fsl-diu-fb: Fix sparse warning due to virt_to_phys() prototype change
>>>         fbdev: imxfb: add '*/' on a separate line in block comment
>>>         fbdev: imxfb: use __func__ for function name
>>>         ...
>>>
>>>    Documentation/fb/index.rst                         |    1 -
>>>    Documentation/fb/intelfb.rst                       |  155 --
>>>    Documentation/userspace-api/ioctl/ioctl-number.rst |    1 -
>>>    MAINTAINERS                                        |   12 -
>>>    arch/parisc/video/fbdev.c                          |    2 +-
>>>    drivers/Makefile                                   |    3 +-
>>>    drivers/firmware/sysfb.c                           |   14 +-
>>>    drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    8 +-
>>>    drivers/video/backlight/Kconfig                    |    7 -
>>>    drivers/video/backlight/Makefile                   |    1 -
>>>    drivers/video/backlight/cr_bllcd.c                 |  264 ---
>>>    drivers/video/fbdev/Kconfig                        |   72 -
>>>    drivers/video/fbdev/Makefile                       |    2 -
>>>    drivers/video/fbdev/amba-clcd.c                    |  986 ---------
>>>    drivers/video/fbdev/core/fb_defio.c                |    8 +-
>>>    drivers/video/fbdev/fsl-diu-fb.c                   |    2 +-
>>>    drivers/video/fbdev/hgafb.c                        |   13 +-
>>>    drivers/video/fbdev/hyperv_fb.c                    |   20 +-
>>>    drivers/video/fbdev/imxfb.c                        |  179 +-
>>>    drivers/video/fbdev/intelfb/Makefile               |    8 -
>>>    drivers/video/fbdev/intelfb/intelfb.h              |  382 ----
>>>    drivers/video/fbdev/intelfb/intelfb_i2c.c          |  209 --
>>>    drivers/video/fbdev/intelfb/intelfbdrv.c           | 1680 ----------------
>>>    drivers/video/fbdev/intelfb/intelfbhw.c            | 2115 --------------------
>>>    drivers/video/fbdev/intelfb/intelfbhw.h            |  609 ------
>>>    drivers/video/fbdev/mmp/hw/mmp_spi.c               |    2 +-
>>>    drivers/video/fbdev/sis/sis_main.c                 |   37 -
>>>    drivers/video/fbdev/stifb.c                        |  109 +-
>>>    drivers/video/fbdev/vermilion/Makefile             |    6 -
>>>    drivers/video/fbdev/vermilion/cr_pll.c             |  195 --
>>>    drivers/video/fbdev/vermilion/vermilion.c          | 1175 -----------
>>>    drivers/video/fbdev/vermilion/vermilion.h          |  245 ---
>>>    drivers/video/logo/pnmtologo.c                     |    6 +-
>>>    drivers/video/sticore.c                            |    5 +
>>>    include/linux/amba/clcd-regs.h                     |   87 -
>>>    include/linux/amba/clcd.h                          |  290 ---
>>>    include/video/sticore.h                            |    6 +-
>>>    37 files changed, 208 insertions(+), 8708 deletions(-)
>>>    delete mode 100644 Documentation/fb/intelfb.rst
>>>    delete mode 100644 drivers/video/backlight/cr_bllcd.c
>>>    delete mode 100644 drivers/video/fbdev/amba-clcd.c
>>>    delete mode 100644 drivers/video/fbdev/intelfb/Makefile
>>>    delete mode 100644 drivers/video/fbdev/intelfb/intelfb.h
>>>    delete mode 100644 drivers/video/fbdev/intelfb/intelfb_i2c.c
>>>    delete mode 100644 drivers/video/fbdev/intelfb/intelfbdrv.c
>>>    delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.c
>>>    delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.h
>>>    delete mode 100644 drivers/video/fbdev/vermilion/Makefile
>>>    delete mode 100644 drivers/video/fbdev/vermilion/cr_pll.c
>>>    delete mode 100644 drivers/video/fbdev/vermilion/vermilion.c
>>>    delete mode 100644 drivers/video/fbdev/vermilion/vermilion.h
>>>    delete mode 100644 include/linux/amba/clcd-regs.h
>>>    delete mode 100644 include/linux/amba/clcd.h
>>> marvin@defiant:~/linux/kernel/linux_torvalds$
>>>
>>> Hope this helps.
>>
>> P.S.
>>
>> As I see that this is a larger merge commit, with 5K+ lines changed, I don't think I can
>> bisect further to determine the culprit.
>>
>> But I thought later that it would be interesting to see why my hardware triggered the freeze
>> and probably others did not, or someone would complain already.
>>
>> Both of the boxes were AMD Ryzen: Ryzen 7 5700G and Ryzen 9 7950X.
>>
>> FWIW, I am attaching both hardware listings and the config used, so anyone knowledgeable with
>> fbdev could possibly narrow down the search.
>>
> 
> Hi Mirsad,
> 
> There is another report from Jens with similar symptom [1]. Can you check if
> reverting df67699c9cb0ce ("firmware/sysfb: Clear screen_info state after
> consuming it") fixes your regression?
> 
> Thanks.
> 
> [1]: https://lore.kernel.org/regressions/93ffd2ee-fa83-4469-96fb-fb263c26bb3c@kernel.dk/T/#t

Thanks, Bagas, I confirm that it is the same issue:

  1991  git checkout d97a78423c33
  1992  git revert df67699c9cb0ce
  1993  make clean; make olddefconfig
  1994  time nice make -j 36 bindeb-pkg |& tee ../err-6.8-mrg-1.log; date
  1995  sudo apt-get -s install ../linux-image-6.7.0-bagas-vanilla-rvt-09751-g6b082430adc8_6.7.0-09751-g6b082430adc8-26_amd64.deb
  1996  sudo apt-get -y install ../linux-image-6.7.0-bagas-vanilla-rvt-09751-g6b082430adc8_6.7.0-09751-g6b082430adc8-26_amd64.deb

Reverting df67699c9cb0ce fixed it.

I don't have a slightest idea what is the side effect of this commit.

Tested-by: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>

Best regards,
Mirsad
