Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1494515741
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 23:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B719F10FAC6;
	Fri, 29 Apr 2022 21:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A8610FAC6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 21:47:09 +0000 (UTC)
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M4JVv-1nkpZK2tHN-000HYa for <dri-devel@lists.freedesktop.org>; Fri, 29
 Apr 2022 23:47:07 +0200
Received: by mail-yb1-f171.google.com with SMTP id m128so16731305ybm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 14:47:07 -0700 (PDT)
X-Gm-Message-State: AOAM531jJ055qbBVrbsofWI98tmD/cewt4PXc8i1xJlkbVZYwL56A5sr
 x+hG/Sry/YpBNp9OHdW6qHufExW7USG6XDwYTDw=
X-Google-Smtp-Source: ABdhPJwtcBUeQCwBE/wHCTNSMt9GmZKG8b0zElf3XSRBB+ltEsvmy5fENkUQ3EnsgyBJ9WDIgobY6XmBd5vZorZaAUk=
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id
 e185-20020a25d3c2000000b0064574dff43dmr1535991ybf.394.1651268826333; Fri, 29
 Apr 2022 14:47:06 -0700 (PDT)
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
In-Reply-To: <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 29 Apr 2022 23:46:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
Message-ID: <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:br5MSFOmOKgU8puftmDldSg/HPXXW08+VaR166hX+nYcBtlWgwI
 s0JGSIRZl/mfAXzsTnvvTCF/z+2CsAQHDx5r9Vr1LWd/P6bTrk4Qcnbi3uvM0OqrrcDaYWX
 6Pu64hfcl5+09gkmfdyXUQsw8JHjEu6mNKG1eLa35sx2KO1RWzof/C68vLQkDRmARWYSmsm
 zydnalDwbXX8tu67fU3QQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m1eNdovUjbE=:Q9wTAlkTm1v82g4EJ8iFvr
 lMSKVMBzFKs/PFNCitw1jlXeyYwaT/Z+6cDalgvmAc1MwaBgUHcXEW4AS0r2ZkWLIIfwDHCoF
 ikjV6ew5O5TeBEY/lUxJCURuUA+48qkzKKlBgzRCsbOgHRGhez8IHtNZtE4eL1DaYIjlBkio6
 SbXlb/1HtiWWIpx6aofxDvCm2uQMFIWYJMcP5HFRYq1YcYf3pWqwVq4WQdKjofTp+9B0VC+L5
 q0rxLQMrrWCfLLl99n3ZqlVDw8/jO25v8gQsEcusW5/zsfbpTABXNJkcZi69oUIIQ18rj01ss
 ttD1jTUUULrTQFQ4FLUG/l4TJqUoTcrlNv+sbn/Kkov8YHatYcuuDx0jVRcnLZ35vh76KSkzZ
 1QZdrXUtP00L+JeNWE5mSzCPOMRHM/aEZKYnNUinVRcLeWZM1jOXLsABM9ucPujbadJaLn5Ok
 fL35agX9UxC5Euylk4Hl46FhRee4Q/AVo1x+WZ1MCLu0zq7doWq0oHR2JemPZ+pneZCMq4EBn
 icL6vNHYZjuts/HYReLNQUMINXHaQn6CTrMzF0UDULVE/r1asUzIY6YwiaWzveAq6eON3XaOV
 HufMnya+QUvWLDpmQzGexE5JF35/5eZ08LkTmA66psD0qWpAjxjcRAXLbgepRo1az7DJyrr2w
 jp01idPnUxeXPq7SGrRRyZ574mSm5t0GffbNHIn8KNOSNQ7Q+b/byMjjSku6/YnWLWfLl2m/l
 R9DLaidyDU1192fJhwsGjyXBhHiiOj+OncvBaIcqDK4It+4Jb+knY+5z/D2EtTZVXB6WSgo3m
 T6rzIX+bBJtZiAmeWZK0Bu2jpflAUTa6ebaaXnkTU2wM0Ukl3s=
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

On Fri, Apr 29, 2022 at 10:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/29/22 10:48, Guenter Roeck wrote:
> >
> > I tried the pxa-multiplatform-5.18 branch. Its failures match
> > those in v5.18-rc1.
> >
>
> Uuh, wait, the build wasn't complete. There are still some
> failures. I'll report later.

Sorry about the breakage, I got a few more reports about minor build errors
and warnings, the newly uploaded branches should address all of the ones
I got reports for.

        Arnd
