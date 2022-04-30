Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA3515D96
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 15:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC4410E3AB;
	Sat, 30 Apr 2022 13:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC6510E3AB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 13:32:28 +0000 (UTC)
Received: from mail-yw1-f172.google.com ([209.85.128.172]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MGQSj-1nclO849DJ-00GtgM for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr
 2022 15:32:26 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2f16645872fso110387447b3.4
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 06:32:25 -0700 (PDT)
X-Gm-Message-State: AOAM533VvJfOC6F9hKXxHtGaccKJ/jWfB0EjG+fp1vAUPbQhRvluNVCU
 ciVm7sVA/J5dcdbIbwIbLZmwnjn8BzAReoTwaGg=
X-Google-Smtp-Source: ABdhPJyQsAuOXuwqNSnE+0RumiMVY+a1YoHyKhCVHMghGQo3frV3I1QOJWPIvakdR8DFKer+m5ZGRHZJ5RFDwaJx/vI=
X-Received: by 2002:a81:1dd1:0:b0:2ea:c38b:65a8 with SMTP id
 d200-20020a811dd1000000b002eac38b65a8mr3834670ywd.135.1651325544544; Sat, 30
 Apr 2022 06:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
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
In-Reply-To: <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 30 Apr 2022 15:32:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
Message-ID: <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:80iPIq4ugJWOEHOU4+FNqgMl9gxQcQu9lzCAN1bHuOMn2jR2S7l
 t4YdKnhSfm3uGQpbuyTbul0POFZrmUSplyJNx+jLrk7EnpbuuHI87bTxhwL01U6ybKnpBSY
 5W8arRvmxPpS0q+IR6VRoGkRNOrMzOp7fsaWmof1n6epXqCc432kwbKackfcS/vCwT5cftI
 3r358E8K2VZFVZnerNJNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0zXJJmKcv0g=:MyFb29Z+ZRRm2PT9GsAedd
 +e34gZNT3XGkcjKBMytCi+FKGBQc9jU1YhfrtXaSFjSzG1GuQh3nIfto8uIrnYq00FsIeZA/2
 ld+JUqXyuxQJClA8CGI0owzjFeaTqvOmbQ8SaxHOugJ2u6A4elKc53eNYrFtI4ROJGmWuQRqI
 76K6bFvZa+8fCUfRr2Z+UKwzgzV58nuhvq6phdfAxEShplICRnzA9OflvaCpK+Hu2t5L5PX1+
 Gkgy8oJYLinOpNfrZW3L9bkqSZkHdbiM+JI14o3JA+k9wjoWZZoJ9dsPLC11vIE6tY6Wznfwu
 x48Bw65dHcTYgojBrNuh0xUII/k+VnhvoD6D0OT/DGcGgLdy8FiwRa1HwsKszTuzmWj1X+4a7
 NjE9BbfNYve2FESr+mTqqg7WVzjjYi0+iDgDy2XwjpVq54n+qN21gV91zR3EGOuE54Y0M/Jj4
 zEgUTy06S4VYOCQTin2TfP+bpwp6C8xQi/QWKOZWn9PnYp2g0NJJl+Ym/NXIPOoWWQmrKt40t
 KtRjSdld5Bwj1rqVftd5/fyKohI4GRhiC3LezyF6yE5dH1sRCIItyiekZu65PHgCpYgsNbP7E
 DCAGTe2YzAPs6xY+MyT2IOfOzsZn38Nexf+tcYGCqiYeKBaM4eMpjaBLTZa07+okSqAiOFkGr
 anhmrffviXM7zUrMk+ylit0uEs5JlBANIaR22H3gZGEls//15n0/jsOA9BTwgtZhUtQWE1Nf/
 DnIiUJwagn+lEnFYvfKAzaxC/QRhxxx7mbcWN90PAeIuwc3tlaCMMz8iW4zYKQRZpTNS0n5Pd
 gInpONEgOLjeF/7+Hzf1mgxHeEwlSHx4ACUv5ZjXLDaRdZlcbo=
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

On Sat, Apr 30, 2022 at 2:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/30/22 01:04, Arnd Bergmann wrote:
> > and concluded that it must have done this for a long time. In my own qemu
> > instance, I see a crash from iWMMXt, but that works fine on your machine.
> > OTOH, your failed instances all look like they either time out or
> > failed to find a
> > rootfs. I tried passing an MMC device as root, and that works here.
> >
>
> Booting from mmc works for me as well. Booting from pcmcia worked before,
> so I assume that there must be some regression.

Ok, got it, and managed to reproduce the hang now. My "ARM: pxa/sa1100: move
I/O space to PCI_IOBASE" patch managed to get it to the point of detecting
the pcmcia device instead of crashing, so I assumed it was enough when it
clearly was not. Before that patch, it still works, afterwards it hangs with
"pata_pcmcia: probe of 0.0 failed with error -12" as mentioned above. I'll
have another look.

       Arnd
