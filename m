Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9677488C7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 18:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C562010E16D;
	Wed,  5 Jul 2023 16:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E79110E16D;
 Wed,  5 Jul 2023 16:00:50 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-c4cb4919bb9so4799451276.3; 
 Wed, 05 Jul 2023 09:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688572849; x=1691164849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U4k16nrtVTp0StmZm35Nhjlm8cLixxMolvWHEm3DX98=;
 b=Ml4FQQfqLSZjCILF8T3IwT0cChbWoQekRexsfMLImAIgFv+/z17QECJVT4aEWVVu5r
 by8ts5HgBHKk0ivvxfzsdK/cdiKijipRbTntc3svXBNgZ621brlGQqcrBtmumtxWBoGF
 kFs4C2a5sqdxHoDdSz66dEizOQBXi7nqaE8kG21HBj9UNvx01kSXjkkyAUlFJ2g79tpG
 RAhad021XLoeRb0pSxA1DtuFZWAlX+vzbM3meGadmdZJzsliTOR3tFuNwVtj95YGWRHq
 8vJrvX+tprXsPtPm1VV/7Z2wGYQNTSAXRzMc5YEPQ+/gcORbsEjWYaH5ccvuvANyoV40
 rDBw==
X-Gm-Message-State: ABy/qLaavzzbHXH59lSRdE3g7X24TaBS2z5BXj8TfmwW9JUWa4voyLen
 uMTdtItCDCKLDltZBVA5XW912yXztbosBQ==
X-Google-Smtp-Source: APBJJlGKKew7uZVjpDRiHqS0NVIFwjcRj3OrlbB//x/++2joJOfca/IC85XIqhAT16XP3SGdvsywyw==
X-Received: by 2002:a25:4143:0:b0:c60:3b9a:5281 with SMTP id
 o64-20020a254143000000b00c603b9a5281mr3497516yba.32.1688572848809; 
 Wed, 05 Jul 2023 09:00:48 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 i1-20020a25b201000000b00c4788bfe468sm2365826ybj.1.2023.07.05.09.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 09:00:48 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5700b15c12fso83093107b3.1; 
 Wed, 05 Jul 2023 09:00:48 -0700 (PDT)
X-Received: by 2002:a25:e042:0:b0:bd0:8e5:d548 with SMTP id
 x63-20020a25e042000000b00bd008e5d548mr15284471ybg.39.1688572848445; Wed, 05
 Jul 2023 09:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <e77836236dfb6724aa95a8c2305a2d63762367be.1688570228.git.geert+renesas@glider.be>
In-Reply-To: <e77836236dfb6724aa95a8c2305a2d63762367be.1688570228.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jul 2023 18:00:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWy4h+rCBXSwONDs7KxRY7gEx8gLNk7eXtCRDEw1piEQ@mail.gmail.com>
Message-ID: <CAMuHMdVWy4h+rCBXSwONDs7KxRY7gEx8gLNk7eXtCRDEw1piEQ@mail.gmail.com>
Subject: Re: [PATCH libdrm] amdgpu: Use %ll to format 64-bit integers
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
Cc: amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 5, 2023 at 5:17=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> On 32-bit:
>
>     ../tests/amdgpu/amdgpu_stress.c: In function =E2=80=98alloc_bo=E2=80=
=99:
>     ../tests/amdgpu/amdgpu_stress.c:178:49: warning: format =E2=80=98%lx=
=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but=
 argument 4 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long uns=
igned int=E2=80=99} [-Wformat=3D]
>       fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size=
 %lu\n",
>                                                    ~~^
>                                                    %llx
>        num_buffers++, addr, domain, size);
>                       ~~~~
>     ../tests/amdgpu/amdgpu_stress.c:178:72: warning: format =E2=80=98%lu=
=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but=
 argument 6 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long uns=
igned int=E2=80=99} [-Wformat=3D]
>       fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size=
 %lu\n",
>                                                                          =
 ~~^
>                                                                          =
 %llu
>        num_buffers++, addr, domain, size);
>                                     ~~~~
>     ../tests/amdgpu/amdgpu_stress.c: In function =E2=80=98submit_ib=E2=80=
=99:
>     ../tests/amdgpu/amdgpu_stress.c:276:54: warning: format =E2=80=98%lx=
=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but=
 argument 5 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long uns=
igned int=E2=80=99} [-Wformat=3D]
>       fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %=
lu bytes took %lu usec\n",
>                                                         ~~^
>                                                         %llx
>        count, from, virtual[from], to, virtual[to], copied, delta / 1000)=
;
>                     ~~~~~~~~~~~~~
>     ../tests/amdgpu/amdgpu_stress.c:276:65: warning: format =E2=80=98%lx=
=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but=
 argument 7 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long uns=
igned int=E2=80=99} [-Wformat=3D]
>       fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %=
lu bytes took %lu usec\n",
>                                                                    ~~^
>                                                                    %llx
>        count, from, virtual[from], to, virtual[to], copied, delta / 1000)=
;
>                                        ~~~~~~~~~~~
>     ../tests/amdgpu/amdgpu_stress.c:276:70: warning: format =E2=80=98%lu=
=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but=
 argument 8 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long uns=
igned int=E2=80=99} [-Wformat=3D]
>       fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %=
lu bytes took %lu usec\n",
>                                                                         ~=
~^
>                                                                         %=
llu
>        count, from, virtual[from], to, virtual[to], copied, delta / 1000)=
;
>                                                     ~~~~~~
>     ../tests/amdgpu/amdgpu_stress.c:276:85: warning: format =E2=80=98%lu=
=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but=
 argument 9 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long uns=
igned int=E2=80=99} [-Wformat=3D]
>       fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %=
lu bytes took %lu usec\n",
>                                                                          =
              ~~^
>                                                                          =
              %llu
>        count, from, virtual[from], to, virtual[to], copied, delta / 1000)=
;
>                                                             ~~~~~~~~~~~~
>     ../tests/amdgpu/amdgpu_stress.c: In function =E2=80=98parse_size=E2=
=80=99:
>     ../tests/amdgpu/amdgpu_stress.c:296:24: warning: format =E2=80=98%li=
=E2=80=99 expects argument of type =E2=80=98long int *=E2=80=99, but argume=
nt 3 has type =E2=80=98uint64_t *=E2=80=99 {aka =E2=80=98long long unsigned=
 int *=E2=80=99} [-Wformat=3D]
>       if (sscanf(optarg, "%li%1[kmgKMG]", &size, ext) < 1) {
>                           ~~^             ~~~~~
>                           %lli
>     ../tests/amdgpu/amdgpu_stress.c: In function =E2=80=98main=E2=80=99:
>     ../tests/amdgpu/amdgpu_stress.c:378:45: warning: format =E2=80=98%lu=
=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but=
 argument 3 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long uns=
igned int=E2=80=99} [-Wformat=3D]
>          fprintf(stderr, "Buffer size to small %lu\n", size);
>                                                ~~^     ~~~~
>                                                %llu
>
> Fix this by using the proper "%ll" format specifier prefix.
>
> Fixes: d77ccdf3ba6f5a39 ("amdgpu: add amdgpu_stress utility v2")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Scrap it, now it fails on 64-bit :-(

> --- a/tests/amdgpu/amdgpu_stress.c
> +++ b/tests/amdgpu/amdgpu_stress.c
> @@ -175,7 +175,7 @@ int alloc_bo(uint32_t domain, uint64_t size)
>
>         resources[num_buffers] =3D bo;
>         virtual[num_buffers] =3D addr;
> -       fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, si=
ze %lu\n",
> +       fprintf(stdout, "Allocated BO number %u at 0x%llx, domain 0x%x, s=
ize %llu\n",
>                 num_buffers++, addr, domain, size);
>         return 0;
>  }
> @@ -273,7 +273,7 @@ int submit_ib(uint32_t from, uint32_t to, uint64_t si=
ze, uint32_t count)
>         delta =3D stop.tv_nsec + stop.tv_sec * 1000000000UL;
>         delta -=3D start.tv_nsec + start.tv_sec * 1000000000UL;
>
> -       fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx)=
 %lu bytes took %lu usec\n",
> +       fprintf(stdout, "Submitted %u IBs to copy from %u(%llx) to %u(%ll=
x) %llu bytes took %llu usec\n",
>                 count, from, virtual[from], to, virtual[to], copied, delt=
a / 1000);
>         return 0;
>  }
> @@ -293,7 +293,7 @@ uint64_t parse_size(void)
>         char ext[2];
>
>         ext[0] =3D 0;
> -       if (sscanf(optarg, "%li%1[kmgKMG]", &size, ext) < 1) {
> +       if (sscanf(optarg, "%lli%1[kmgKMG]", &size, ext) < 1) {
>                 fprintf(stderr, "Can't parse size arg: %s\n", optarg);
>                 exit(EXIT_FAILURE);
>         }
> @@ -375,7 +375,7 @@ int main(int argc, char **argv)
>                         next_arg(argc, argv, "Missing buffer size");
>                         size =3D parse_size();
>                         if (size < getpagesize()) {
> -                               fprintf(stderr, "Buffer size to small %lu=
\n", size);
> +                               fprintf(stderr, "Buffer size to small %ll=
u\n", size);
>                                 exit(EXIT_FAILURE);
>                         }
>                         r =3D alloc_bo(domain, size);

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
