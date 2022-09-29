Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 737975EF84F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 17:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC5B10EAAE;
	Thu, 29 Sep 2022 15:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBA810EAAE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 15:05:17 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id s14so1889507ybe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=b9uxRyoaMis4M/Del53oQhe/OKhSA38Po18Or6YilLY=;
 b=j/p76Gbz/6p+klZe5CzqnqgPqzGWALW2g91DrPRqYNms6dk5oGuWDhJHL1Tvx+U25E
 nv9/Y0D9beecD9wyAD08rbImhYmv8NXz9nzQnidMa8IRhaLbrWuagphyW2wJHaXf6e3y
 ORntlHyPdupf80tWY1phTwvXu6h2ci8lJbuNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=b9uxRyoaMis4M/Del53oQhe/OKhSA38Po18Or6YilLY=;
 b=5YaNZT6qclNzy9MiASoPDXxq1Ox0OWHv0QE2Z8Y4yOESwLEQWUKRpZST05SYPWl+id
 fMOPwE9r60piKiCdUtal1QUq43efBx+xkaoo4nMgugbWdCSWizGTWFnUmSOgU4c9h2s5
 TVpgfsevXG9A3PcerF8ACTlyYrVU2ivO6hCk0h3PO/ZdYj0R0Z7VY7sOdatiQ+eufqd5
 qPYVHRd9NehL+kMWNfwWWe5od56qr4xtleYYQWwMJJGmgpFCBC6fsrKdCWEZUar1D35M
 JCyga9YIqxqu/nXwiCfrIfSyVsUGad4925y2iyhaUXhr9PPiv260rRqSF8Hcry/qRqmS
 2OZg==
X-Gm-Message-State: ACrzQf1VgHON40h7gcL5nlw9dooy5QXXFi8zr5iqDdUw69gPma0xvE/r
 JwMuHZ2Y1ndarCYvSJ7CgU+5IhY35rmvmkPfRBcl9A==
X-Google-Smtp-Source: AMsMyM6mVFtECpxKgra3ZkQaG9b6seBNybgK+xW2wUNsy82MrfUpk07hV4+qwXFgEt9Ky8+H6uTmtZZfdLoFajaRwaU=
X-Received: by 2002:a05:6902:284:b0:67b:fc57:9104 with SMTP id
 v4-20020a056902028400b0067bfc579104mr3718530ybh.647.1664463915933; Thu, 29
 Sep 2022 08:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220928192605.247546-1-broonie@kernel.org>
 <68689c5b-327f-65df-0d34-a7e1a851f568@infradead.org>
 <CAMuHMdWrQabb_LoCPfbdWo9D11+4kxSjQeBStpjvckvuXuBMNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWrQabb_LoCPfbdWo9D11+4kxSjQeBStpjvckvuXuBMNQ@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 29 Sep 2022 08:05:04 -0700
Message-ID: <CAJs_Fx4NzHVRvN6xd-unrpmv=Nc_PXYbHvYujhz7UZ=YRkRZ7A@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 28
 (drivers/gpu/drm/msm/msm_gem_shrinker.c)
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: linux-arm-msm@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 broonie@kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 12:09 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Thu, Sep 29, 2022 at 8:10 AM Randy Dunlap <rdunlap@infradead.org> wrot=
e:
> > On 9/28/22 12:26, broonie@kernel.org wrote:
> > > Changes since 20220927:
> > >
> >
> > on x86_64:
> >
> > ../drivers/gpu/drm/msm/msm_gem_shrinker.c: In function =E2=80=98can_blo=
ck=E2=80=99:
> > ../drivers/gpu/drm/msm/msm_gem_shrinker.c:29:28: error: =E2=80=98__GFP_=
ATOMIC=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98GFP_ATOMIC=E2=80=99?
> >    29 |         if (sc->gfp_mask & __GFP_ATOMIC)
> >       |                            ^~~~~~~~~~~~
> >       |                            GFP_ATOMIC
>
> Also on m68k, as reported by noreply@ellerman.id.au
>
> I have bisected it to commit 1ccea29f90329e35 ("Merge branch
> 'mm-everything' of
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm"), but I didn't
> see immediately what caused it.

I'll send a patch for this shortly

BR,
-R


> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
