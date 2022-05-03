Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596355186C0
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 16:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C130310E9D3;
	Tue,  3 May 2022 14:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C13F10E9D3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 14:35:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBDzc-1ngtrA1U7C-00CgxK for <dri-devel@lists.freedesktop.org>; Tue, 03
 May 2022 16:30:10 +0200
Received: by mail-wr1-f42.google.com with SMTP id j15so23671216wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 07:30:09 -0700 (PDT)
X-Gm-Message-State: AOAM532DAq32oXaBarnqeCKhLQdFNVnQ2ZpbT7K7loHSM1cfpgnNSZOI
 JDfyeSyVTf0wep9EnX2vlMkm9eHXcUrecRjk8xo=
X-Google-Smtp-Source: ABdhPJzBrB6Hq8d9DfigwWJUnvR6JgldisGRuo8lFweHaJxUdm7WjYyRpRzeyy/XN6uA5q8KyUIXhqy6JFoQk/SEnPM=
X-Received: by 2002:a05:6000:707:b0:20c:4fd8:1d61 with SMTP id
 bs7-20020a056000070700b0020c4fd81d61mr13363100wrb.407.1651588209550; Tue, 03
 May 2022 07:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
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
 <CAK8P3a39oiWyDwp=BHuCsBVwfzyZ802-NwL9G9r-t6X8KSr6nA@mail.gmail.com>
 <d4eb4752-d8c0-715a-1d69-829f39c88d2e@roeck-us.net>
In-Reply-To: <d4eb4752-d8c0-715a-1d69-829f39c88d2e@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 May 2022 16:29:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0tgEwEJkrcGD5A2WnLsgUhbax+a_mFr8-a+kKc-dUDow@mail.gmail.com>
Message-ID: <CAK8P3a0tgEwEJkrcGD5A2WnLsgUhbax+a_mFr8-a+kKc-dUDow@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:FI9/EecjywLmdM7DCWwctG+EkxC394j7TsBAZpp1Ns6UBvQco9C
 sQjePG4K/+u6iG3Q7HqegVO5ACIrjs0F1czfvBUji+kGWIO0hLocWKnUHnkNsXURwXPfET6
 08UGdOaFxFYUXzQHW8oiwQmmbpUPm23voLFXxaDhJ1jqjlUb0KEIeHbXrAHiB446gCNhYI0
 NrkPwHFFZGzDPfA3+c1PQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bfjStW24nWY=:kkPN80s7AGbSUeVgKuOQ7+
 i4zzK/QCc+SHKTWdA7RcFoXiNvZVH2Lk7jCffjzRdVNYWTzE7XL3MleEa7kYhRtq22O4eCff7
 3TWUhG7boNtBAMt8tqG3gPYv2lNXF/pcbgfuA4aFciH1CTnjbCrme1nLaY1J6YXNAVVoCSU5E
 LigsPok4ElQbQnEOsrmzs1NkMnShmKIYCB5eBKQ5CPMGkRe/QqcLdDCsrC1/r+sOT1i4L8YFO
 qM207BsmsTNNcRiSKFXOdr+wgRo9oPy4kOb+f9BvIrdxICrw81TgYU4zd9tO3YdMzJnDKdt8P
 4ZB6vR1Kyabr4QwUchOjEQu6sfEceo7Hh86ytj23tiBl+YHkSJqiqikoHfsbBAvI1iMByGl/j
 qEE7OeXXhSVkj+G86Y//92h6Qm4Fd84K7jTZVo5Mbhuf1royKeG92GosNWCJsFox+zuWwkxcb
 SLDXvihQGH5r9eZKbQ3GrOnbN0JDzHUDOoUc06zM+hWIRAbgud2Dtcj4cwz35gqI6H7jpbIiw
 3RoSb1OROMHIqaHCDJnjL52OIxdhOAecWhxiG2Z/bqrmKz1MYHomWb8eV+0pB3UXn+63qf1jq
 GuiKzUFD7vfYw2uKa/CwMPQwqS1oNlC6tUc3P0knVGGWT0AIPR3aR/xlXFHBcbCEM6LY+5x6F
 PHZFrOyG2/6B3Kxeo4UXJzQhrwxVkU3WCEkrS5f3WYUTNspt+MSmYTDvoyQDKib6J3mh/B0ro
 UROstykIe7gxzzv2UchDdijJvyP6CsHQDjvesPUTcEWkLkr5WIE2QEVSvrhorFUbs1dMNqB1/
 LvN+7ngrSa1jen261cbp9ZJlQMoc++qfjW6s7v6eZ6FqwdBXw0pQ3pOOvyobEGNYqy/Lr4FMk
 UzrzHl5Mp/YC4SbHj5SJpWyX1uz9I0qDwV5ACPeGXiH/y6YTubYVvuBw4/c8ZZqRX4AapUPFf
 Ljx8WeAu4MA==
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

On Tue, May 3, 2022 at 4:04 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/3/22 00:17, Arnd Bergmann wrote:
>
> > If you have a z2 specific config, that would probably not enable CONFIG_OF,
> > which is always turned on for multiplatform, but again that only adds around
> > 250KB in my builds (using gcc-11). This is more than I'd like it to be, but
> > still much less than 1MB.
> >
>
> Maybe it is a bit less; I only compared the size of "Image". Either case,
> it is enough to cause the problem. I am not sure if it is worth the time
> trying to track this down further.

Sure, I'm not worried about the boot regression any more, as that is definitely
explained by the size growth. The only question is whether the patches make
the kernel grow more than it should. The 40+250KB I measured seem
within my expectations, so unless you have specific data showing much
more, I think we're good.

Thanks for all the help!

        Arnd
