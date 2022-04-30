Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19493515E36
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 16:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C133210F0F4;
	Sat, 30 Apr 2022 14:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53D610F0F4
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 14:31:26 +0000 (UTC)
Received: from mail-oo1-f41.google.com ([209.85.161.41]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MOiPx-1nUWzT1Sb1-00QDdH for <dri-devel@lists.freedesktop.org>; Sat, 30
 Apr 2022 16:31:24 +0200
Received: by mail-oo1-f41.google.com with SMTP id
 c19-20020a4a3813000000b0035ea4a3b97eso1583460ooa.12
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 07:31:24 -0700 (PDT)
X-Gm-Message-State: AOAM533ULYCCUmvZGHuQ+Y7NpoiFxvyHqIWXyFWe2exLeTY5xAG3lnWR
 bk54nDl6xywuemkUFzqd1bUfg37yZRSypgqkI5U=
X-Google-Smtp-Source: ABdhPJyu1oLM1IRKTqR+eQdQ1rsYTJoLMnuBV/FFpB8y5vKEh5sII8e/hMlA25PDcp1w4A+thLzVKyWiU6hDO089+bw=
X-Received: by 2002:a0d:d804:0:b0:2f4:e47d:1c2c with SMTP id
 a4-20020a0dd804000000b002f4e47d1c2cmr4143200ywe.320.1651328616903; Sat, 30
 Apr 2022 07:23:36 -0700 (PDT)
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
 <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 30 Apr 2022 16:23:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
Message-ID: <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UIkQBxgk/3GTzYBZWfvn8DAXFAM/AYt1AdsKhvp8Wjt6tA3evEv
 IrPgrANnLoEdDlA/GpUoBPrgKLFb4j5Mg+0BVQRTD9iI3wMyhKUWJQ2fWjoRPV+/e7Wsp8u
 PAEw/7l9CtjnABu8Pe7ZIxqFsXohUoPQd06o8/39Hf4Bw9bxQ+KxH63YwUfA1eyEfYYv24Z
 bqAYPuGEmCLD8G86YYRPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y1fonQq54Lg=:vIDTaHFLTr7pZ5aJ2vtx+7
 kjM35b0Na+RWHH9eRHWz62jTIPiKnKgrpGaeE4Dtp9mmfjJ56G0jXgL7D6+KDkEvqNMlXNVmF
 0x8M/+zW672TlF+2SNphAMwHYksykcVrkX/icgqv3hH13MX7nH/EjCDOssZvwsTBcgfVx9Xlw
 WGUta2Gvb9e09ZN215G+1J+ev6sP+FYfYGAGk2BVzCwrjU9wTmLzIs5AImIhT7xTmtNxSnHIn
 r6G9FCQ4FeYzp/bQkLVvtY8nw/2H7udRYNZ4lA4WuumGTPw33DUiNzjDs/YESkk1i5GNNbWgu
 PQAcibvY68dWfxQlVjS80pkQZjaCmPUs8bASYedIGFYrWDQmxWv/H1JZE8B7Ue5Jr9i8AT1eq
 eWuYves+50Jykqdlyhl/6LdizkMsqOLngO4Bn+kIkhzfLDPqbgCosDI1XifqZnLoNMzrLZwt6
 kRKs9ggcwhGu+686A4aOBYPy6Oq/VkpB5ba1AMh1qfuMvWwxRIsZbKElEL/x2CNywgXG/B/u+
 cKuMz2FDviLMFIUCtGwkZcE5/8oLrdBDrMskvKDZrNh8XWPeerzETo72QYitneSUGyHIbAOKt
 rc6KAbgU5uCPplnXjs/Me0kNIRL/a8zThAG2A0w6k7FdZa1NFLOLhZr29E9OQVBh8XlCl240a
 0saxoue8j/peo8BoDAaQ394T5AWeUj7TJeLoELisir7ZFjYGSBt8PMvcdbMv8xLzQ/xS5x6/7
 PeCv/Dho+6SSgCBO0jiCIL6VS1H7Yk47XCcnlwnor5C5obbBQ5pT8GnHrz9vWjiWpBFrGSasc
 3ENZgkFB9jH9/tAH2kj8dFw9wGURjPt/JiEjzLhgkwPRvzGAeU=
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
 Guenter Roeck <linux@roeck-us.net>,
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

On Sat, Apr 30, 2022 at 3:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Apr 30, 2022 at 2:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 4/30/22 01:04, Arnd Bergmann wrote:
> > > and concluded that it must have done this for a long time. In my own qemu
> > > instance, I see a crash from iWMMXt, but that works fine on your machine.
> > > OTOH, your failed instances all look like they either time out or
> > > failed to find a
> > > rootfs. I tried passing an MMC device as root, and that works here.
> > >
> >
> > Booting from mmc works for me as well. Booting from pcmcia worked before,
> > so I assume that there must be some regression.
>
> Ok, got it, and managed to reproduce the hang now. My "ARM: pxa/sa1100: move
> I/O space to PCI_IOBASE" patch managed to get it to the point of detecting
> the pcmcia device instead of crashing, so I assumed it was enough when it
> clearly was not. Before that patch, it still works, afterwards it hangs with
> "pata_pcmcia: probe of 0.0 failed with error -12" as mentioned above. I'll
> have another look.

Got it: as the PCMCIA bus on this machine is the only thing with an I/O space,
I assigned it port number range 0-0x1000, with an io_offset of 0, but this
was apparently unexpected and triggered this sanity check:

static int static_find_io(struct pcmcia_socket *s, unsigned int attr,
                        unsigned int *base, unsigned int num,
                        unsigned int align, struct resource **parent)
{
      if (!s->io_offset)
              return -EINVAL;
      ...
      return 0;
}

I moved the devices around now, giving zeus/viper I/O space an offset of
zero, and moving PCMCIA to offset 0x10000 and 0x11000 for the two slots,
which now works because the io_offset is nonzero. I've regenerated the
branches again, and confirmed the for-next branch still boots from pcmcia.

        Arnd
