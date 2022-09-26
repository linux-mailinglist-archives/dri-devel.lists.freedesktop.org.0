Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4EA5EA598
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 14:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF6010E365;
	Mon, 26 Sep 2022 12:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBED710E31D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 12:08:13 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MlO9r-1p676R0ivl-00lm9d; Mon, 26 Sep 2022 14:08:06 +0200
Message-ID: <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
Date: Mon, 26 Sep 2022 14:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Content-Language: en-US
To: Marc Kleine-Budde <mkl@pengutronix.de>, Maxime Ripard <maxime@cerno.tech>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:JQ96ZqpeRMMRHfjjq1c02T4ffcXAsZqMsYMfrRU5AmRz6VAPyCe
 anpyio9bi5odTcSg46CCkGTHWgu9fMGMvUKosTdJmJ8Hmn2sBvU8xfnBYprzWHlWiK6Yfjb
 +nm7jomSbXrr8BQ/GNiy8y6IveHVg+Q6vQdeii/7XkQxxqDMShp1MiK7xyVwEZBmnSq7csX
 IgYXHoVP5N6Y+0lY9G8iQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JlXbs8gjq8c=:RLD4iu6keaI4Md1GhlwKt0
 1ZQ37OIifZQoPY/HNPe0074AEbizx5pRrvWz/BznnuG13c91jB/uPK35QAAoR7OIyfPeOITDz
 9O/tEtUbZ0TDIbytF1g2h31qn+TJKBSxYv+1GIt+2DP4zD0ufOwxYKklBOTJtmgEMEGWnyo9g
 FruVKAO4aZJLPC8nqrGPlg6hsmPdN64RtQiD6wkdFBN0zZhtsKE33c+WuV2LUAHZOfzmlAtMU
 XQTW1C5J3RjkIHeWCBF1Whqg+6q3TQ7LLJAYFX/8e/p+Lt5kUWAcBEdSKyl74zAP6Q1I2hiQT
 RSnWEMGdkbCYkp4MTigggcNCX0uonPpNUqKv1HDBN9fCnfypE2TVOW3Qy7RjihZnnugWDDGvP
 NW3OPhhO7BGo0X6pGFhUs9MoBJ1eO+rBJ0oIc1P+Px3uejme8EwdleLylWvjdFM1ukwLtKyTb
 bzL0ItzByQszlEIhBi+9WOcDZENtH4UbM6gDHktfqVUarGFuvMnIJ2+p0I2DbNXtjBShOWC6+
 3TyUiqCOFKD3Q4scI/3Oq5mQ5CirzvCChtiKCVJV0MtJ6qsZoUW7ai3bbrRykRfW5kdgmRLoD
 tpLgwxC5Gg8CeiTHAGQUe50EIqJN4oz01i1QRkSYbOqt5YH7WTyMkBjP56n9A0TlX7qq97dxM
 HIR0GGYxtXp6wlbBiBa8EBn/aux7OXGvlygYYdim27xQAewWxLbW8MYI9MMQa4e15Ccivax2B
 Mi1r/EP6u18OJu1lIGTi1LumY8okEVMTG4iVml7/l5J44Iqn9YGO07eNqJGJJyJdlFhEwNqkY
 r6JGzE7
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
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marc,

Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> On 22.09.2022 17:06:00, Maxime Ripard wrote:
>>> I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
>>> using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
>>>
>>> | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
>>> | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
>>> 9-01)
>>> | [    0.000000] Machine model: Raspberry Pi 3 Model B+
>>> | [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmware from 2022-03-24T13:21:11
>>>
>>> As soon a the vc4 module is loaded the following warnings hits 4
>>> times, then the machine stops.
> [...]
>
>> The warning itself is fixed, both upstream and in stable (5.19.7).
> Ok. Debian is using 5.19.6
>
>> It shouldn't have any relation to the hang though. Can you share your
>> setup?
> - config.txt:
>
> -------->8-------->8-------->8-------->8--------
> gpu_mem=16
> disable_splash=1
>
> arm_64bit=1
> enable_uart=1
> uart_2ndstage=1
>
> os_prefix=/u-boot/
>
> [pi3]
> force_turbo=1
> -------->8-------->8-------->8-------->8--------
>
> - Raspberry Pi 3 Model B+
> - no HDMI connected

Thanks

Does it mean, the issue only occurs without HDMI connected?

If you didn't test with HDMI yet, could you please do?

> - firmware 2022-03-24T13:21:11
>    which boot u-boot:
> - u-boot 2022.04+dfsg-2+b1 (Debian testing)
>    I'm using the "/usr/lib/u-boot/rpi_3/u-boot.bin"
>    u-boot start:
> - Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.org)
>    kernel and dtb are unmodified Debian's linux-image-5.19.0-1-arm64
>    $ ls -l /boot/dtbs/5.19.0-1-arm64/broadcom/bcm2837-rpi-3-b-plus.dtb
>    -rwxr-xr-x 1 root root 15351 Sep 22 09:52 /boot/dtbs/5.19.0-1-arm64/broadcom/bcm2837-rpi-3-b-plus.dtb*
>    $ md5sum /boot/dtbs/5.19.0-1-arm64/broadcom/bcm2837-rpi-3-b-plus.dtb
>    4a9c76c3c4dcafac7d69872ee88ac5fc  /boot/dtbs/5.19.0-1-arm64/broadcom/bcm2837-rpi-3-b-plus.dtb
> - currently, I've blacklisted vc4, but systems hangs after modprobe vc4
>    (4x backtrace, then hang)
>
> regards,
> Marc
>
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel
