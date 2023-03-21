Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990716C35BD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 16:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC1610E1F5;
	Tue, 21 Mar 2023 15:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283A010E1F5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 15:33:50 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id q88so3836647qvq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 08:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679412829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y1FAG7EG+oo0WLGCAeT69lFpq2lucqpqtpr3jD7v1IY=;
 b=WHFm+Sgb5BzUhvLZHJQqh5tO2ujgodLNxfu58FMTerf5nPIn9AqQAthzVMhq2LiVtn
 WotmIAp0udQTLT/FE9m4I1i8i94m9B5H7zdt2afcDuQ8zSyuC2lUjpKO8qOS7Xzsk4fp
 DnDtEX/Bt+CaQMv272vFU3mrS+URYPY+ZFIwcXqHDX11VvedPeS3fQsPTpTvzAHd6n/3
 o1K9qPof8eU3cijJypTzpcKaAP/b4m5YJuELK2vTkBX9Fz0ht7JYx9QerW+6wsD30sQV
 X4t+h/JYU7w7LbQqnDQ9AyYkMhgZSPiX+d4bA+jytw1bZprj1jaaE/3+nIGOsIUf4HaK
 jWJw==
X-Gm-Message-State: AO0yUKVmzCSO1DmZwfX+aOrLdW1eNWv9G6zepQqWRxmHl/IIcfDqfpBs
 RXklpnYqJiyDSGQThzNvzLCyX1x/yD+NSg==
X-Google-Smtp-Source: AK7set8qRV0IiwqA6znZ7Ms9l2NIcf+QUdvzN5vRhZXa6Ps3EkR53te556leZq+CoSTp7YsrlkH46g==
X-Received: by 2002:ad4:5d66:0:b0:5ac:bf40:adb9 with SMTP id
 fn6-20020ad45d66000000b005acbf40adb9mr570361qvb.11.1679412829005; 
 Tue, 21 Mar 2023 08:33:49 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 w8-20020a05620a424800b0073b587194d0sm9692920qko.104.2023.03.21.08.33.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 08:33:48 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5419d4c340aso286921717b3.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 08:33:48 -0700 (PDT)
X-Received: by 2002:a81:ac0d:0:b0:545:45f4:2e50 with SMTP id
 k13-20020a81ac0d000000b0054545f42e50mr1317822ywh.4.1679412828173; Tue, 21 Mar
 2023 08:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320082146.4117022-1-geert@linux-m68k.org>
 <c85681c6-6fcf-33ed-210f-661e539f78d8@infradead.org>
 <CAMuHMdWw0OdLPUORh6=Be8AW6bN+Pa2t=dcF47B1m=-ihsNPZQ@mail.gmail.com>
 <7e876937-4254-a2d8-f810-513f067b4855@infradead.org>
In-Reply-To: <7e876937-4254-a2d8-f810-513f067b4855@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Mar 2023 16:33:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+t2-LO2WbWCpOuVWm1ZqR29GKH3k8WfCGKK1Vsr0K5w@mail.gmail.com>
Message-ID: <CAMuHMdU+t2-LO2WbWCpOuVWm1ZqR29GKH3k8WfCGKK1Vsr0K5w@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.3-rc3 (drm/msm/)
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Tue, Mar 21, 2023 at 4:10=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> On 3/21/23 00:34, Geert Uytterhoeven wrote:
> > On Tue, Mar 21, 2023 at 6:38=E2=80=AFAM Randy Dunlap <rdunlap@infradead=
.org> wrote:
> >> On 3/20/23 01:21, Geert Uytterhoeven wrote:
> >>> Below is the list of build error/warning regressions/improvements in
> >>> v6.3-rc3[1] compared to v6.2[2].
> >>>
> >>> Summarized:
> >>>   - build errors: +9/-14
> >>>   - build warnings: +4/-1447
> >>>
> >>> JFYI, when comparing v6.3-rc3[1] to v6.3-rc2[3], the summaries are:
> >>>   - build errors: +0/-1
> >>>   - build warnings: +0/-0
> >>>
> >>> Happy fixing! ;-)
> >>>
> >>> Thanks to the linux-next team for providing the build service.
> >>>
> >>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e8d018dd025=
7f744ca50a729e3d042cf2ec9da65/ (all 152 configs)
> >>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/c9c3395d5e3=
dcc6daee66c6908354d47bf98cb0c/ (all 152 configs)
> >>> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/eeac8ede175=
57680855031c6f305ece2378af326/ (all 152 configs)
> >>>
> >>>
> >>> *** ERRORS ***
> >>>
> >>> 9 error regressions:
> >>
> >>>   + /kisskb/src/drivers/gpu/drm/msm/msm_mdss.c: error: case label doe=
s not reduce to an integer constant:  =3D> 300:2, 299:2, 296:2
> >>
> >>
> >> Are these due to the sign bit being set after a shift?
> >> It looks that way since it is only reported for such values.
> >
> > Yep.
> >
> >> From the reports on the build server, it only happens when building wi=
th gcc5.
> >> I don't have the ability to build with gcc5 or I would test it.
> >
> > I deliberately installed gcc-5.5.0-nolibc/aarch64-linux to reproduce it
> > (gcc5 on x86 didn't reproduce).
>
> Yes, I installed that same compiler. When I tried to use it, I got:
>
> /opt/crosstool/gcc-5.5.0-nolibc/aarch64-linux/bin/aarch64-linux-gcc: unkn=
own C compiler
> scripts/Kconfig.include:44: Sorry, this C compiler is not supported.

I didn't run into that. I used

make ARCH=3Darm64
CROSS_COMPILE=3D/opt/cross/gcc-5.5.0-nolibc/aarch64-linux/bin/aarch64-linux=
-
drivers/gpu/drm/msm/msm_mdss.o

I did have to disable CONFIG_GCC_PLUGINS, else it couldn't find
<gmp.h>.

> >> @Rob and other drm/msm people, what do you think about this?
> >> (or is this already fixed somewhere but not yet in linux-next?)
> >
> > Thanks, I posted a similar fix two weeks ago:
> > https://lore.kernel.org/all/20230306090633.65918-1-geert+renesas@glider=
.be
>
> OK, I replied to that one.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
