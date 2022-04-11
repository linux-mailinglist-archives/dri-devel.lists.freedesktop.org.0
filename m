Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB684FBDC3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71AB10ECDA;
	Mon, 11 Apr 2022 13:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FAF10ECDA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:49:51 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id b189so10630327qkf.11
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vVG2fXlBh+awI+zoG5EckE/Z3Lioiux+cIKRFlmEU0g=;
 b=ToTijVcPBv2NDJkWDFCY+nx9X+OQLcjNeK9nmqncJVmY+y/RUXvW6CARfS0w6qcel/
 Xm3RB3HHW5VaZ6tidnLcPaQ1DUx2GpF+b+Sn5HEy8m1vXuzn6Jz8CK2/t53AkcwcpsGe
 hGa2HPDxtkKnsvvA15dNoQf9d9gje4PapCFbmI7GNyB9tAeefATcNaJ1Hb/xLbS4ctz0
 oH76sdRlO9VJDMLdEy3C9zdLi4QiONLkjHgKtxup2HBnMZ26EAm2dN+aJvtohUY86RKW
 bIod2cp6J1ZfSArNLXEukV7f2aWQdxKcZNh01rGCxDJd1Y+1WwxbmbWTm847rFYbtwF2
 eIUA==
X-Gm-Message-State: AOAM531o1PWsDMBsxpokMQXvpdpknbiP+6417xa8fzCPEG33dkAO/k7h
 cIxOu11c+xcmPiDTDcD7u3p5VzI5Dps+fA==
X-Google-Smtp-Source: ABdhPJzu3QdTbiHKAXxlpbpZWCIVPmLD+PwsBrlJgB0RKPqLEgcKpQxuSIpylowBQk/zpKRL8TuZsA==
X-Received: by 2002:a37:b481:0:b0:69b:eab8:1e79 with SMTP id
 d123-20020a37b481000000b0069beab81e79mr9870708qkf.453.1649684990532; 
 Mon, 11 Apr 2022 06:49:50 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 g14-20020ae9e10e000000b0067b520a01afsm18294188qkm.108.2022.04.11.06.49.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 06:49:50 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id v77so9478284ybi.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:49:50 -0700 (PDT)
X-Received: by 2002:a25:29c2:0:b0:641:224f:17d6 with SMTP id
 p185-20020a2529c2000000b00641224f17d6mr7405779ybp.546.1649684989768; Mon, 11
 Apr 2022 06:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220312063437.19160-1-yuehaibing@huawei.com>
 <08e81f07-99d2-62a3-8eea-b2c0432b4d18@redhat.com>
In-Reply-To: <08e81f07-99d2-62a3-8eea-b2c0432b4d18@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Apr 2022 15:49:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYtV9KHYqjcXS05XM+QqbCgPKB_uZCCAN0eAqHUmoeTg@mail.gmail.com>
Message-ID: <CAMuHMdVYtV9KHYqjcXS05XM+QqbCgPKB_uZCCAN0eAqHUmoeTg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/solomon: Make DRM_SSD130X depends on MMU
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Mar 15, 2022 at 12:28 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 3/12/22 07:34, YueHaibing wrote:
> > WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
> >   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
> >   Selected by [m]:
> >   - DRM_SSD130X [=m] && HAS_IOMEM [=y] && DRM [=m]
> >
> > DRM_GEM_SHMEM_HELPER depends on MMU, DRM_SSD130X should also depends on MMU.
> >
> > Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
>
> Indeed. All the DRM drivers that select DRM_GEM_SHMEM_HELPER depend on MMU.

That's very unfortunate. Is there no way around this?

Else fbdev can never be deprecated in favor of DRM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
