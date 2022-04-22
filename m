Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17D50C48D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 01:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A023010E04E;
	Fri, 22 Apr 2022 23:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8522110E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 23:18:40 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 e15-20020a9d63cf000000b006054e65aaecso6542786otl.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 16:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KoWXKICOXrLwboX1KRSR8wabyc5tj+p6lrbCOGJNsB0=;
 b=WfyERyMX7R5AXo/rMMIl6y8nSXixykdVRLEdinY/MomqcCB5r5ZQbLs3BCON1JbJid
 SYBch1vH11Gbyyr7uHnb4uKt0rpEYLwWG6jPVzGB/6YTjnfP6B6nc9E72CRX17Qo8Nv0
 hqL9sBFF2f0anLzd4y4fWfHceVS7UFZj4OgGcGq3zFsQ1W26Ro4FtkgUsgVmFt6FTodv
 WJhhQLAQTlQE5ybgDgtXzSu4H0hkfGnY/mdPQk846Y0PZFkSuevMtu2SOCSNLfL6QGeG
 2/n/ZJOa7dCF4cmxGePvIEuDB/dkYth22mYrBof0ZAwoE1ogpw42s8W4hmZGYwun6WYu
 NaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=KoWXKICOXrLwboX1KRSR8wabyc5tj+p6lrbCOGJNsB0=;
 b=tG6WPQ0sUOWs52YTohCa78jS/T+Kjrgh2x9hKOLNz8WadsC/VRCGb8LYK3BswPI64v
 4RqO3ymYq1wwl4exH7FXrQ5iDlK0jLbwTpcOFS4RoOxKYZfPF0fQgGvugW1FU6IM9+YL
 9uks+CHx62+1kU9e1CPbBabQk4iB64qDAfyO590dz0Do1kmg5FOjBufYSFRSrmLQxXwG
 F6iNNix8HhbVMdeTo/fgE0ID8Lv8rSUnwhAg/xOtOy/37TMQ1ilN7LnKfyNLF2nG5maQ
 8bqighP6BgH0/cBWyWCKAxHyKkWX36R4QSXrA/m/c9DSsEfemVeXqP8tmUgg9dVGxQLW
 lN2Q==
X-Gm-Message-State: AOAM532+Ysxi3W3elsxzK0n5mn9yjzogvVVksGFVDdWatyESzkbSdP7k
 1TMAFGcDz3vjvMgS4rPtyNCEvmBmaV4=
X-Google-Smtp-Source: ABdhPJwKkrwKpAYwt9fhjngX1DM/06254YDKfs9CDiPU2Hx7eNlH3p/K4fmqYt8gQFcOM67kG0jDEA==
X-Received: by 2002:a05:6830:14cd:b0:605:4e77:6472 with SMTP id
 t13-20020a05683014cd00b006054e776472mr2672213otq.94.1650669519778; 
 Fri, 22 Apr 2022 16:18:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a9d5f0f000000b005e6b67945a3sm1256410oti.15.2022.04.22.16.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 16:18:38 -0700 (PDT)
Date: Fri, 22 Apr 2022 16:18:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Message-ID: <20220422231836.GA3202260@roeck-us.net>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
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
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
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
 Michael Turquette <mturquette@baylibre.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 4/22/22 12:16, Arnd Bergmann wrote:
> > > On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > Which machine did you hit this on? Is this on hardware or in qemu?
> > >
> > qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
> > Also, I just noticed that the failure is not always the same.
> > z2 fails to boot from initrd, and sx1 fails to boot completely.
> 
> That's a lot of machines failing, I hope at least we got the same bugs more
> than once here.
> 
> For the I/O space, I found now that PXA was not using the standard
> virtual I/O address yet, but instead used a NULL-based offset.
> 
> I'm not entirely happy with this patch, but this is an outline of what
> I think we need to fix that: https://pastebin.com/3nVgQsEw
> This one is probably incomplete, at least it breaks sa1100 for now,
> and it adds a bogus CONFIG_PCI dependency. I'm also not sure
> in what way the last patch in the series triggers it, rather than the
> one that removed mach/io.h.
> 
> I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
> If you have a custom config for this one, make sure you get the right
> DEBUG_LL address.
> 
> > I'll do another round of bisects.
> 

So ... z2 bisect points to the same patch, but the error is different.
As mentioned, it does not recognize the initrd. Oddly enough, booting
from initrd works for the other platforms.

The sx1 boot failure seems to be unrelated to your patch series. It boots
fine if built from the tip of your branch, but fails to boot in -next.
That will require a bisect from -next.

Guenter
