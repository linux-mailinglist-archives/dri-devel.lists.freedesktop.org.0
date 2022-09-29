Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D95EEE84
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 09:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E0910E905;
	Thu, 29 Sep 2022 07:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C663810E905;
 Thu, 29 Sep 2022 07:09:43 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id cj27so276619qtb.7;
 Thu, 29 Sep 2022 00:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+onjZYpK5e42V87Cg6u2hPN7v8i5Lvm6t/wPM+ZKj08=;
 b=QkVGO0K1xyGgouWFVhU7yk3G0FY+pzeEKffFzUWx2p2KQiFoFy6FRnUK3+iidSYj5v
 RMaOCU3kH4AYaKmSSLDFwrwLSpSyK7sHN070kh4mlooQ/X+wIOPth1DKH4kAVr6g2vK9
 3dNZF5rauMeLtckV8w5GaMtrhbti8I6/h9hoMxSqemWdaCArUOHSTCoh1yrqWT9VGLh0
 zSuH/9182vdqGi3snBSF5sI4YncIADpZVtX4kacEn3jNjkjq2sOcHC51MWr0UueS+88w
 7MCvdHy9g5pi98cs+jbxve5q9YnBSnKCB8Wrt0Dqz7mzfBN1xEc8+gyVlJHLH5tG2TDs
 PEGA==
X-Gm-Message-State: ACrzQf0c8UiXdXwCSgegFCMjdMl5feioNLaTuveRBXSQlyD0j8+m59/e
 Nr0cMlgDcBpepDePrh8VDA09s4cETiyLJw==
X-Google-Smtp-Source: AMsMyM4BxC9yAVmh/YS8a7QJPkmhb+5ti47jDPAqUwMSsJepwhzzwAAXyZx2IEmClDb5voUHHxMANg==
X-Received: by 2002:a05:622a:2d3:b0:35d:4af6:8de7 with SMTP id
 a19-20020a05622a02d300b0035d4af68de7mr1216200qtx.448.1664435382482; 
 Thu, 29 Sep 2022 00:09:42 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 de21-20020a05620a371500b006bb87c4833asm5293960qkb.109.2022.09.29.00.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 00:09:42 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-324ec5a9e97so5629087b3.7; 
 Thu, 29 Sep 2022 00:09:41 -0700 (PDT)
X-Received: by 2002:a81:9c49:0:b0:34a:de:97b8 with SMTP id
 n9-20020a819c49000000b0034a00de97b8mr1733022ywa.384.1664435381696; 
 Thu, 29 Sep 2022 00:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220928192605.247546-1-broonie@kernel.org>
 <68689c5b-327f-65df-0d34-a7e1a851f568@infradead.org>
In-Reply-To: <68689c5b-327f-65df-0d34-a7e1a851f568@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Sep 2022 09:09:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrQabb_LoCPfbdWo9D11+4kxSjQeBStpjvckvuXuBMNQ@mail.gmail.com>
Message-ID: <CAMuHMdWrQabb_LoCPfbdWo9D11+4kxSjQeBStpjvckvuXuBMNQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 28
 (drivers/gpu/drm/msm/msm_gem_shrinker.c)
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 broonie@kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 8:10 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 9/28/22 12:26, broonie@kernel.org wrote:
> > Changes since 20220927:
> >
>
> on x86_64:
>
> ../drivers/gpu/drm/msm/msm_gem_shrinker.c: In function =E2=80=98can_block=
=E2=80=99:
> ../drivers/gpu/drm/msm/msm_gem_shrinker.c:29:28: error: =E2=80=98__GFP_AT=
OMIC=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98GFP_ATOMIC=E2=80=99?
>    29 |         if (sc->gfp_mask & __GFP_ATOMIC)
>       |                            ^~~~~~~~~~~~
>       |                            GFP_ATOMIC

Also on m68k, as reported by noreply@ellerman.id.au

I have bisected it to commit 1ccea29f90329e35 ("Merge branch
'mm-everything' of
git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm"), but I didn't
see immediately what caused it.

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
