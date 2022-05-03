Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB9A517E6D
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 09:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739FA10EC05;
	Tue,  3 May 2022 07:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C0F10E6E8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 07:17:39 +0000 (UTC)
Received: from mail-yb1-f175.google.com ([209.85.219.175]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MsZ3N-1o6D3S1PMR-00u2ZP for <dri-devel@lists.freedesktop.org>; Tue, 03
 May 2022 09:17:37 +0200
Received: by mail-yb1-f175.google.com with SMTP id h10so686438ybc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 00:17:37 -0700 (PDT)
X-Gm-Message-State: AOAM5314F0fosxb+O9fD4uy7lRL4yuWgPsPpt/v/KzhzEEu0xMl5mStr
 v2ZBJrONGKhqOGNQFklESoPWR0u7y3EK8OoQ6DA=
X-Google-Smtp-Source: ABdhPJxCVe3OWFLSxYuaWnZW2jE5tiG+RIFx0DlFR531d1DfX2PVw0Rn1+OoRgTZrm5UkwICv0JqKul27jNY+A9f6J8=
X-Received: by 2002:a25:c604:0:b0:645:d969:97a7 with SMTP id
 k4-20020a25c604000000b00645d96997a7mr12300750ybf.134.1651562256127; Tue, 03
 May 2022 00:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
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
 <CAK8P3a1X3YH0RqqmqgqFAaY94yreD-PfY-pvyMf+xU3nGeqvsg@mail.gmail.com>
 <04840b4f-5b9d-b29a-62f7-e5148d415313@roeck-us.net>
In-Reply-To: <04840b4f-5b9d-b29a-62f7-e5148d415313@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 May 2022 09:17:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a39oiWyDwp=BHuCsBVwfzyZ802-NwL9G9r-t6X8KSr6nA@mail.gmail.com>
Message-ID: <CAK8P3a39oiWyDwp=BHuCsBVwfzyZ802-NwL9G9r-t6X8KSr6nA@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:taguxRz8ebh0BGm6QnYN0QOqWDECofqinFVs4xKiaYEE04wkukK
 pLMa/ZFpfCcyvVLwWXCuvZ/nwanE1o/QwtUPsworeWnv18kV404g58ZiIM6vhm/lreRh6rN
 1m6jkMSB5vNmsfwp1kb7o6nTADfgeoTNPZ4CdC6BFs/i6zsmj7SiOuchaJi6SYdctqLg43O
 aLX0XM4h2M2OCq1q2KYaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AvRmBik/wkM=:q+dCWGBGFQ9QkHW0yu/MCD
 graRsE9fuuBg4zUb8Rfo7lDdikxlFPVaojDlJ0QOp4KiINLSPCYmzuDF/MOasd/dNLvHn72tG
 WqLoEU240iRXJcezkwi/Cx9s68Spal+Xo7bD/kX4P2GW/uNgaftZ7YhMtp7N56kDqCjc+FozA
 q65eek+GA16YQ8SCiB+d9B4zfC3g8QF1HDaoAKY611cZAvYX9uugRlExTdd8TsGtKf+Lk67KR
 nabWxC129F8y/DNUNj3XMR+Xr9b0Xdq0fsYvRd9MIZ0WX4JpxYblZ9f4CzbLd39aiDOFGgmrd
 qVi1pBmJhRgFIA90Ohb/1HLwD9tWyWb4Gi4wYcQQZ0P2X/KW7TQUAvck9MCh1VAJrPFqz7EaL
 5p98oxXDsY07eMq5/HyW2GVVWASqfzlpCyBf8m8/q8nxmej4A7RD904zdMDi8yj/YHEbrgtPh
 7a0CbQgllnwBo7cBeZ4Ee9qikTCg7j/kocbJFXjtlE+zBdiZl3K4NM1eHLCASP+QPycxookjw
 /qhGDPBQkdcSXyLb8NtZUfeGbtKzQxLzTiMfMPBctDJ2YmArDuEDnjdj1VjLXX00zJpZImWvw
 VOIFvVe7uj+FuBgxJFu4MuGD/ZDMJ6tC/DSbha0R6LeLK/2VGqkbH4tfwWcQSpgLA5SjjDsB2
 1yyIjQGmRrK6SpEaPsnfqV4QfYUSLYbzKIGjQypJMCukvh3XuQPxrV+Itfy3ZA15iHSTQREe7
 +G9yzk2S7A7ZEZCacbMdSycp5acOxtQTaYNxWUlkopLCpAhLbiqIPISTnbsLqq1/7i5AptUEZ
 vj7rSr05keU6ORtHeqp2+2MdXcVckQFNq9VXwRynHruG2IXELA=
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

On Tue, May 3, 2022 at 4:55 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/2/22 14:03, Arnd Bergmann wrote:
> > On Mon, May 2, 2022 at 10:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >> On 5/2/22 12:21, Arnd Bergmann wrote:
>
> qemu puts initrd in the middle of available memory. With the image size
> being ~1MB larger than with v5.18-rc, this is too much, and the kernel
> overwrites part of initrd. This causes it to be corrupted.
>
> It looks like that would have happened eventually, your patch series just
> made it happen now. The kernel is just getting too large to run on such small
> systems. I worked around the problem in my version of qemu by loading initrd
> at the end of the (small) RAM. With that, I no longer see the boot failure.

Ok, thanks for confirming. If it's just the image size that changed,
then I think
we can live with it. Having the kernel image grow by 1MB seems excessive
though, I'd like to understand better where that increase comes from.

Starting out from pxa_defconfig, I see a 40KB increase from the final patch
that moves to multiplatform support, which I think is fine.

If you have a z2 specific config, that would probably not enable CONFIG_OF,
which is always turned on for multiplatform, but again that only adds around
250KB in my builds (using gcc-11). This is more than I'd like it to be, but
still much less than 1MB.

        Arnd
