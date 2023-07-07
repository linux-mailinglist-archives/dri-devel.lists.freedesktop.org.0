Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B28074B739
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 21:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D5510E030;
	Fri,  7 Jul 2023 19:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338AF10E030;
 Fri,  7 Jul 2023 19:37:12 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-c4e4c258ba9so2507268276.1; 
 Fri, 07 Jul 2023 12:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758630; x=1691350630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWQQd+QTfcKD61lhZj5te5p5tmq1PqejPqHsprM5Iyw=;
 b=BpE0i/gma4W0+2IHlhR/ljxvndX77lGW+6PMOrhFASmVssFfp2Wgp3J6IEllIe5sVC
 cjBppEQmbSQI6oKlUe1vw9R71+6vJ1GqNPFredyskQfNpyfbTdd9iyEFBG1WmSpjxaFh
 1lzCjhEHo/LIkhD2w/RFujmKDbxe+9Ho1ZKIM3UOna8ukYPtt6aTNmULpsD/5qxH4J2J
 H8Awj9TTUEWodjcm6Dw17FHRkmhf4K214PpHj37OFwoETV0DlS/Lx5z0vrVrbsEoeTWh
 fxHAlnqUTYF9+B6epiC5yGQeyUXxWXaOSislKfYY9jJNcDd4SYSjosEgu8r0Fa7YnM+e
 eSDg==
X-Gm-Message-State: ABy/qLam36EGGqN1n6h3lPm0d+iWQufPpXzXxP+isXaaEWKB5odTKzZ0
 I43ygeKeNMnKK5n5QloEEZy8vDQCAl4dqQ==
X-Google-Smtp-Source: APBJJlEFL76/c7L3kZubN4A0PKPIktnKSabDsMNS6hcsd6+BmXWGMeMYvWKxW6upxlcdDTUzrqbGAA==
X-Received: by 2002:a25:c092:0:b0:bca:efc4:2ccf with SMTP id
 c140-20020a25c092000000b00bcaefc42ccfmr4965954ybf.44.1688758629978; 
 Fri, 07 Jul 2023 12:37:09 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 n76-20020a25d64f000000b00be45a29d440sm1113484ybg.12.2023.07.07.12.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 12:37:09 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-c4e4c258ba9so2507253276.1; 
 Fri, 07 Jul 2023 12:37:09 -0700 (PDT)
X-Received: by 2002:a25:a128:0:b0:c60:982f:680b with SMTP id
 z37-20020a25a128000000b00c60982f680bmr5226669ybh.46.1688758629284; Fri, 07
 Jul 2023 12:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <8ffa3be3dc7b27345dde3bb32498c4cd3af050fa.1688632590.git.geert+renesas@glider.be>
 <c13c9974-8903-904a-55a8-4065b43a437b@gmail.com>
In-Reply-To: <c13c9974-8903-904a-55a8-4065b43a437b@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Jul 2023 21:36:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW226aZY_Nx9nfbS-ivsW2oarbNAjZB10O60W0SUQzmYg@mail.gmail.com>
Message-ID: <CAMuHMdW226aZY_Nx9nfbS-ivsW2oarbNAjZB10O60W0SUQzmYg@mail.gmail.com>
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

On Fri, Jul 7, 2023 at 2:06=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 06.07.23 um 10:36 schrieb Geert Uytterhoeven:
> > On 32-bit:
> >
> >      ../tests/amdgpu/amdgpu_stress.c: In function =E2=80=98alloc_bo=E2=
=80=99:
> >      ../tests/amdgpu/amdgpu_stress.c:178:49: warning: format =E2=80=98%=
lx=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, b=
ut argument 4 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long u=
nsigned int=E2=80=99} [-Wformat=3D]
> >        fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, s=
ize %lu\n",
> >                                                     ~~^
> >                                                     %llx
> >         num_buffers++, addr, domain, size);
> >                        ~~~~

[...]

> > Fix this by using the proper "PRI?64" format specifiers.
> >
> > Fixes: d77ccdf3ba6f5a39 ("amdgpu: add amdgpu_stress utility v2")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Well generally good patch, but libdrm changes are now reviewed by merge
> request and not on the mailing list any more.

I heard such a rumor, too ;-)

Unfortunately one year later, that process is still not documented in
https://gitlab.freedesktop.org/mesa/drm/-/blob/main/CONTRIBUTING.rst
which still instructs me (a casual drive-by developer) to just submit
my patches to the mailing list...

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
