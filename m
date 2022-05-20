Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF2B52EC7D
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 14:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EB310FEF4;
	Fri, 20 May 2022 12:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42C710FEF4;
 Fri, 20 May 2022 12:46:34 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id l82so2077338qke.3;
 Fri, 20 May 2022 05:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UhZYflED6/DiNr1feOC9OhkU49iweDam4jS4WznrIsk=;
 b=Ta4euYGjfPlYNzyiiXwPaaqI7S6bWQ7TexuMbV3hPwFOrRqxjl0y4uba3DqKcR3QtX
 HBzZ8t4wqxXzyskaxqe7lxjsqrTBvvaQxeaBDdpxxcc/TO/AS+lzfm5yDSpFgpbUWpcj
 4zr+i4qUlBhXFaJkW0q5DDUZw/mJstYMU6oKTxe5VfU+SnrPIG392gXIq8Htu9YUkR6P
 PuIStrQkAJP1lp2j1NMYyLXeVqbGT4Z7SVxt5riVE5m2Vj42AFGCSiXtYbM7H/UjX6Rf
 zq17qdVIA1ri1dc51pnHk6YI6oBa/z6ftmrp3XnQKUjHL/d9sbTCBO9W+vORL2g+Nr5y
 DkBA==
X-Gm-Message-State: AOAM533nmnhxb2DleSWLNrniO+i2TEpWZmuiUhogx1kOfIWW/EzcT4OQ
 7vk9vEQxAno+5/PUcaoyJQJFbLRyvtGSSA==
X-Google-Smtp-Source: ABdhPJzB1jc1XLXmnyGxl21QSRhOw9QizcJZaupDuv9ySnl5WwongZWzEdSEpbyLaSmNf67WyUypOQ==
X-Received: by 2002:a05:620a:c4c:b0:69c:57a8:4e3b with SMTP id
 u12-20020a05620a0c4c00b0069c57a84e3bmr5811900qki.635.1653050793668; 
 Fri, 20 May 2022 05:46:33 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 f63-20020a379c42000000b006a34a22bc60sm1472944qke.9.2022.05.20.05.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 05:46:33 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id r1so13984142ybo.7;
 Fri, 20 May 2022 05:46:32 -0700 (PDT)
X-Received: by 2002:a05:6902:389:b0:633:31c1:d0f7 with SMTP id
 f9-20020a056902038900b0063331c1d0f7mr9068692ybs.543.1653050792549; Fri, 20
 May 2022 05:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com>
 <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
 <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
In-Reply-To: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 May 2022 14:46:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx7r-4TVV9uVJppT-7ZAriov01BUNk4ghU9Bs4uY28vQ@mail.gmail.com>
Message-ID: <CAMuHMdVx7r-4TVV9uVJppT-7ZAriov01BUNk4ghU9Bs4uY28vQ@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-hwmon@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, KVM list <kvm@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linux-nvme@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-sparse@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 2:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, May 19, 2022 at 8:48 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 5/18/22 17:55, kernel test robot wrote:
> > > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > branch HEAD: 736ee37e2e8eed7fe48d0a37ee5a709514d478b3  Add linux-next specific files for 20220518
> > >
> > > Error/Warning reports:
> > >
> > > https://lore.kernel.org/linux-mm/202204291924.vTGZmerI-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205041248.WgCwPcEV-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205122113.uLKzd3SZ-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205172344.3GFeaum1-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205190527.o9wVEvHI-lkp@intel.com
> > >
> > > Error/Warning: (recently discovered and may have been fixed)
> > >
> > [ .. ]
> > > drivers/hwmon/nct6775-platform.c:199:9: sparse:    unsigned char
> > > drivers/hwmon/nct6775-platform.c:199:9: sparse:    void
> >
> > This is getting tiresome. Every driver using outb() on m68k will
> > experience that "problem". As far as I can see, it is caused by
> >
> > #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))
> >
> > in arch/m68k/include/asm/raw_io.h. I have no idea what the
> > "(void)" is for,
>
> The "(void)" makes sure there is no return value.
> Which matters if the result of a function returning void is propagated
> to another function returning void.

Which, FTR, sparse also doesn't like:

    error: return expression in void function

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
