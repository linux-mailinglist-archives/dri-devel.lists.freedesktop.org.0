Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC4552EC4A
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 14:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B644810FCA5;
	Fri, 20 May 2022 12:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C13910FCA5;
 Fri, 20 May 2022 12:40:34 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id e17so6555667qvj.11;
 Fri, 20 May 2022 05:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AW3WbgwLSP0WZKYPK3Y6DQ8WAhPkJkHKkMhSdaktb4M=;
 b=oIktYKJy8OXpStZlQucbfcTiSfAhoZL2H6uMl5g6aggdJSSHaDgRsH0A2X72hWq+XQ
 t7ETPjQf0WRJhoOSJ0e0i3bnVXKRdcP5AfCZsqMeHm8xV6neWiApwl/sxglb1iIY1zw9
 57eSkM9c0j35sJejOQEzxqBd8TXENT2mRq7aDX0r5rsVem/7eByrbMI/iwldF6QrII1S
 xixFUuq5Ry3ZoinFiDOfbLPSRmdiMEsA/KPFJEisIw2q7sldt0txsRp1R5seZ/V7nsro
 WO/CB9IOJFVl5zjtEAPHRoEC8sPc4rYaOL/duXOPF1sZMIUVyHfHYaBLzkYjlCGKyGHn
 a0Lg==
X-Gm-Message-State: AOAM530ZSLcQCBP6bCG72OKF+1Z1m8ZrE2cQRL7mJakE95UYnF1BtoqS
 eg77SlYf5/eusuzJ21SXKWQlH46jQT619Q==
X-Google-Smtp-Source: ABdhPJzoDPH4hjveHByZO4pz3tl1VwE2ezVP4OC6WC4yT17OZkzJet8Juxf6Ce8eCd6k7W7/ajCtEQ==
X-Received: by 2002:a05:6214:1cc5:b0:443:6a15:5894 with SMTP id
 g5-20020a0562141cc500b004436a155894mr7293846qvd.59.1653050432863; 
 Fri, 20 May 2022 05:40:32 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 h124-20020a375382000000b0069fc13ce222sm3142448qkb.83.2022.05.20.05.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 05:40:32 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2ef5380669cso85618337b3.9; 
 Fri, 20 May 2022 05:40:32 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr9969695ywg.316.1653050431948; Fri, 20
 May 2022 05:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com>
 <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
In-Reply-To: <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 May 2022 14:40:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
Message-ID: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi G=C3=BCnter

On Thu, May 19, 2022 at 8:48 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/18/22 17:55, kernel test robot wrote:
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux=
-next.git master
> > branch HEAD: 736ee37e2e8eed7fe48d0a37ee5a709514d478b3  Add linux-next s=
pecific files for 20220518
> >
> > Error/Warning reports:
> >
> > https://lore.kernel.org/linux-mm/202204291924.vTGZmerI-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205041248.WgCwPcEV-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205122113.uLKzd3SZ-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205172344.3GFeaum1-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205190527.o9wVEvHI-lkp@intel.com
> >
> > Error/Warning: (recently discovered and may have been fixed)
> >
> [ .. ]
> > drivers/hwmon/nct6775-platform.c:199:9: sparse:    unsigned char
> > drivers/hwmon/nct6775-platform.c:199:9: sparse:    void
>
> This is getting tiresome. Every driver using outb() on m68k will
> experience that "problem". As far as I can see, it is caused by
>
> #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(ad=
dr)) =3D (b))
>
> in arch/m68k/include/asm/raw_io.h. I have no idea what the
> "(void)" is for,

The "(void)" makes sure there is no return value.
Which matters if the result of a function returning void is propagated
to another function returning void.

> but removing it "fixes" the problem.

This introduces new problems (m68k all{mod,yes}config):

    In file included from arch/m68k/include/asm/io_mm.h:25,
                     from arch/m68k/include/asm/io.h:8,
                     from include/linux/io.h:13,
                     from include/linux/of_address.h:7,
                     from drivers/gpu/drm/msm/adreno/adreno_gpu.c:13:
    drivers/gpu/drm/msm/adreno/a6xx_gmu.h: In function =E2=80=98gmu_write_r=
scc=E2=80=99:
    arch/m68k/include/asm/raw_io.h:34:80: error: =E2=80=98return=E2=80=99 w=
ith a
value, in function returning void [-Werror=3Dreturn-type]
       34 | #define out_le32(addr,l) ((*(__force volatile __le32 *)
(unsigned long)(addr)) =3D cpu_to_le32(l))
          |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
    arch/m68k/include/asm/io_mm.h:397:26: note: in expansion of macro =E2=
=80=98out_le32=E2=80=99
      397 | #define writel(val,addr) out_le32((addr),(val))
          |                          ^~~~~~~~
    drivers/gpu/drm/msm/msm_drv.h:468:32: note: in expansion of macro =E2=
=80=98writel=E2=80=99
      468 | #define msm_writel(data, addr) writel((data), (addr))
          |                                ^~~~~~
    /drivers/gpu/drm/msm/adreno/a6xx_gmu.h:141:9: note: in expansion
of macro =E2=80=98msm_writel=E2=80=99
      141 |  return msm_writel(value, gmu->rscc + (offset << 2));
          |         ^~~~~~~~~~
    In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu.h:11,
                     from drivers/gpu/drm/msm/adreno/adreno_gpu.c:20:
    drivers/gpu/drm/msm/adreno/a6xx_gmu.h:139:20: note: declared here
      139 | static inline void gmu_write_rscc(struct a6xx_gmu *gmu,
u32 offset, u32 value)
          |                    ^~~~~~~~~~~~~~

These can be fixed using e.g. (there are more in the Adreno driver):

     static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 val=
ue)
     {
    -       return msm_writel(value, gmu->mmio + (offset << 2));
    +       msm_writel(value, gmu->mmio + (offset << 2));
     }

> Either case, this is not a problem with the nct6775 driver,
> nor is it a new problem.

Indeed.

For the sparse people:

The full error is:

        drivers/net/appletalk/cops.c:382:17: error: incompatible types
in conditional expression (different base types):
        drivers/net/appletalk/cops.c:382:17:    unsigned char
        drivers/net/appletalk/cops.c:382:17:    void

Basically, sparse doesn't like "a ? b : c", if the return types of
b and c don't match, even if the resulting value is not used.

E.g. outb() on m68k:

    #define outb(val, port) (((port) < 1024 && ISA_TYPE =3D=3D
ISA_TYPE_ENEC) ? isa_rom_outb((val), (port)) : isa_outb((val),
(port)))

where isa_rom_outb() leads to rom_out_8() returning u8, while
isa_outb() leads to the out_8() that includes the cast to void.

So the best solution seems to be to add more "(void)" casts, to e.g.
rom_out_8() and friends?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
