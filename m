Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F6B782619
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 11:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5B010E20F;
	Mon, 21 Aug 2023 09:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DB310E20F;
 Mon, 21 Aug 2023 09:14:20 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-58fb8963617so19491347b3.3; 
 Mon, 21 Aug 2023 02:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692609259; x=1693214059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fvin6/Z51yU4WmEQS2O93Vp8CO3v+hhjM9dfyAYYpkQ=;
 b=RskIK1iST5h4FHYVgbo3Yib7hFojaHev6HjQovJ9vDFLe81v2PNBeTzBBFvtaJWIPN
 l7LuXJTbykEeGzRF06ntmbQsp3WE5eVtPShsO7138sBQKI67+QmxuxfbecavSbd2H36I
 WFvuyRWejkKPUsMlquBrXnnvnDdU3x+z48opQ6GTK5T6C4j9uKAXIOewA4woNVs7bOwD
 9q9EdrD6CcOO0pEcwnyWckficSd/LCXGuB2nSOGH5Uccj6ptQ52taul9oaTb+gTUf5zg
 hcUIPo+1BB6ftBV1MNGRBY6uMRrgRRU2bWRjWVlZjb54ZXye6cex+z9PVu/zqTw5Gx0z
 jqoQ==
X-Gm-Message-State: AOJu0Yxy14Lf3yBa4WkxgTpPtV4HLzo7j86Bywqv/NJZ1CWFvtamgNE4
 LHzl16HwHwb/BjRkhtJAwOJFOHI1fNS2vg==
X-Google-Smtp-Source: AGHT+IHYoDtvtUkyLX58KxgVJCvCLwMWYBM7nL7lds0tY8gBw8prLVRkwJ39sxlQS4QBqMvNi+oTLg==
X-Received: by 2002:a81:6e89:0:b0:58c:8b7e:a1ce with SMTP id
 j131-20020a816e89000000b0058c8b7ea1cemr6726199ywc.46.1692609259050; 
 Mon, 21 Aug 2023 02:14:19 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 d15-20020a814f0f000000b00584554be59dsm2133964ywb.85.2023.08.21.02.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 02:14:18 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-d665467e134so3208881276.2; 
 Mon, 21 Aug 2023 02:14:18 -0700 (PDT)
X-Received: by 2002:a05:6902:50d:b0:d62:be1e:1622 with SMTP id
 x13-20020a056902050d00b00d62be1e1622mr6706413ybs.38.1692609258435; Mon, 21
 Aug 2023 02:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <8ffa3be3dc7b27345dde3bb32498c4cd3af050fa.1688632590.git.geert+renesas@glider.be>
 <c13c9974-8903-904a-55a8-4065b43a437b@gmail.com>
 <CAMuHMdW226aZY_Nx9nfbS-ivsW2oarbNAjZB10O60W0SUQzmYg@mail.gmail.com>
In-Reply-To: <CAMuHMdW226aZY_Nx9nfbS-ivsW2oarbNAjZB10O60W0SUQzmYg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Aug 2023 11:14:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzqTF9hfe91QN2woV=ycUjLJ-WsODYG8_jH5ABkNk8mQ@mail.gmail.com>
Message-ID: <CAMuHMdUzqTF9hfe91QN2woV=ycUjLJ-WsODYG8_jH5ABkNk8mQ@mail.gmail.com>
Subject: Re: [PATCH libdrm v2] amdgpu: Use PRI?64 to format uint64_t
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Fri, Jul 7, 2023 at 9:36=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Fri, Jul 7, 2023 at 2:06=E2=80=AFPM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> > Am 06.07.23 um 10:36 schrieb Geert Uytterhoeven:
> > > On 32-bit:
> > >
> > >      ../tests/amdgpu/amdgpu_stress.c: In function =E2=80=98alloc_bo=
=E2=80=99:
> > >      ../tests/amdgpu/amdgpu_stress.c:178:49: warning: format =E2=80=
=98%lx=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=
=99, but argument 4 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long =
long unsigned int=E2=80=99} [-Wformat=3D]
> > >        fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x,=
 size %lu\n",
> > >                                                     ~~^
> > >                                                     %llx
> > >         num_buffers++, addr, domain, size);
> > >                        ~~~~
>
> [...]
>
> > > Fix this by using the proper "PRI?64" format specifiers.
> > >
> > > Fixes: d77ccdf3ba6f5a39 ("amdgpu: add amdgpu_stress utility v2")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Well generally good patch, but libdrm changes are now reviewed by merge
> > request and not on the mailing list any more.
>
> I heard such a rumor, too ;-)
>
> Unfortunately one year later, that process is still not documented in
> https://gitlab.freedesktop.org/mesa/drm/-/blob/main/CONTRIBUTING.rst
> which still instructs me (a casual drive-by developer) to just submit
> my patches to the mailing list...

So a few weeks ago I created gitlab PRs for all my pending libdrm
patch series, and I rebased them regularly when needed.
What needs to be done to get them merged?

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
