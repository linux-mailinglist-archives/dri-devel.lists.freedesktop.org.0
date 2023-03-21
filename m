Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E26C2B69
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 08:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E8F10E06F;
	Tue, 21 Mar 2023 07:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981110E06F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 07:34:18 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id hf2so12702102qtb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 00:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679384057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vi2yBeJQj8793+/KHPYZqClW0o0BUE+jiSVHLBZTZjU=;
 b=YuQX4o6GQq0OBqrvMrGVrvF+VDTRHJxr14GCNu/7J4jm8gXUE/NWI+MKjv0BBGgZEn
 k3KBVU/twH3KFBt5TW+mPZkw6bzvtbyICMky6WnlpeMm3Z0AVwmarGbz1wo4LeZXUqtj
 xCpBR+MyBLxn1NgfjmhrPdvJqafWgWPjTuJHen88IDknz/Y2La36yxVcQJRQp4qKM0wc
 zXAYd7fALrVGgVDlmCFCQjaJ30g3S4tGjwtUFFALlv+Q71Cvn1bYfHX1NyiqLZ45ht7Q
 kgl4XgqZbpeOsnccr9CJtD1Xm0bugu5sCEt37/MuPOZJ7Nc+PdhJBlf7tiyl+SBXEJFO
 X1Dg==
X-Gm-Message-State: AO0yUKW4ccsPk8zfNh7ic8rooxBqsFC49mIXyTRxWAbRO2EXxZZ3+rsN
 VJhMwH8Is9QPLcTA66EIDZ7JzX5mgq6o/g==
X-Google-Smtp-Source: AK7set/8p69ur1MSfT/83BdyAtA5jCaQgsx6KawY2rrWLbxD+C+iJqVLY3JgDRet+upAeTqSQoqLNQ==
X-Received: by 2002:ac8:58cd:0:b0:3e0:366a:fcd3 with SMTP id
 u13-20020ac858cd000000b003e0366afcd3mr3353134qta.25.1679384057346; 
 Tue, 21 Mar 2023 00:34:17 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 m64-20020a375843000000b0073b8512d2dbsm8764081qkb.72.2023.03.21.00.34.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 00:34:17 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id p204so4839595ybc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 00:34:16 -0700 (PDT)
X-Received: by 2002:a5b:c0d:0:b0:a02:a3a6:78fa with SMTP id
 f13-20020a5b0c0d000000b00a02a3a678famr628369ybq.12.1679384056720; Tue, 21 Mar
 2023 00:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320082146.4117022-1-geert@linux-m68k.org>
 <c85681c6-6fcf-33ed-210f-661e539f78d8@infradead.org>
In-Reply-To: <c85681c6-6fcf-33ed-210f-661e539f78d8@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Mar 2023 08:34:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWw0OdLPUORh6=Be8AW6bN+Pa2t=dcF47B1m=-ihsNPZQ@mail.gmail.com>
Message-ID: <CAMuHMdWw0OdLPUORh6=Be8AW6bN+Pa2t=dcF47B1m=-ihsNPZQ@mail.gmail.com>
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

On Tue, Mar 21, 2023 at 6:38=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> On 3/20/23 01:21, Geert Uytterhoeven wrote:
> > Below is the list of build error/warning regressions/improvements in
> > v6.3-rc3[1] compared to v6.2[2].
> >
> > Summarized:
> >   - build errors: +9/-14
> >   - build warnings: +4/-1447
> >
> > JFYI, when comparing v6.3-rc3[1] to v6.3-rc2[3], the summaries are:
> >   - build errors: +0/-1
> >   - build warnings: +0/-0
> >
> > Happy fixing! ;-)
> >
> > Thanks to the linux-next team for providing the build service.
> >
> > [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e8d018dd0257f=
744ca50a729e3d042cf2ec9da65/ (all 152 configs)
> > [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/c9c3395d5e3dc=
c6daee66c6908354d47bf98cb0c/ (all 152 configs)
> > [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/eeac8ede17557=
680855031c6f305ece2378af326/ (all 152 configs)
> >
> >
> > *** ERRORS ***
> >
> > 9 error regressions:
>
> >   + /kisskb/src/drivers/gpu/drm/msm/msm_mdss.c: error: case label does =
not reduce to an integer constant:  =3D> 300:2, 299:2, 296:2
>
>
> Are these due to the sign bit being set after a shift?
> It looks that way since it is only reported for such values.

Yep.

> From the reports on the build server, it only happens when building with =
gcc5.
> I don't have the ability to build with gcc5 or I would test it.

I deliberately installed gcc-5.5.0-nolibc/aarch64-linux to reproduce it
(gcc5 on x86 didn't reproduce).

> @Rob and other drm/msm people, what do you think about this?
> (or is this already fixed somewhere but not yet in linux-next?)

Thanks, I posted a similar fix two weeks ago:
https://lore.kernel.org/all/20230306090633.65918-1-geert+renesas@glider.be

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
