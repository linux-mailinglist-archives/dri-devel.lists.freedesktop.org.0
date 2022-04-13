Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE34FF11F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 09:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A3F10F724;
	Wed, 13 Apr 2022 07:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8F710F724
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:58:01 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id i27so2230569ejd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 00:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=oBruQmr4XB2N3FiWi5orHbgqzrYhRN078PvjlV3/G00=;
 b=Kd5ZK/WY7yr62gHt3kL6X4lGCWF27s2oIs6H206iPkS1fR0nFW2IdW4zJ6TFNxmAKK
 5Z6bKf8hr17Hc7G34kYFBsPvbsLtK4H51Z6l6Tx1ZiOh9NaFCoBHuPEXZ+kClfSXV7jc
 BvkWVBssOek7/E//kyrWnI3SZTIZm3cYC5QIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=oBruQmr4XB2N3FiWi5orHbgqzrYhRN078PvjlV3/G00=;
 b=EFat+wpBKa9LdurIU8IeZfReeUX2fB0By6RdNQOr+7Klw5llz25R774ZjzbSeq/dux
 n2ZVuY7fPJQBlpdArnu1kJl3wjsK8SlpNrEbtYPFk1VmyMhpRZMScGgzdU+0e5QJJtgN
 1rkKuO2E74AjMZM2w0oCld2W5gpfo3d32DZ31U+7T6cNjCWZZVK1M6N6Fhf/iG8WJx1F
 QcKmnbaTHVfJSEFZ6AGk0VJnV7zuboKJziIPuBSAQ7Hl1IyH5t93zKt9SDSO6i/fLfuw
 uRZLE5bHjj7DErSA7O36wpglTY3ORR2RwHmIobMldinPEYlta89s96GEAA6zxTUW81W9
 LPuA==
X-Gm-Message-State: AOAM530FinH56yA4tCHAFFSaXFgRZ+eKYqtllYikcy1Jf+xaMJZSjWki
 r8JeoneK3/tfbj0GIX8gJD9mug==
X-Google-Smtp-Source: ABdhPJxfCXq5SUOUEARKiNbrHpD9ygaSNc0m4X9dNdhHp3sUrOgU4gZSMZLQ6/qjFA9BHmgEvdDeag==
X-Received: by 2002:a17:907:7f87:b0:6e8:354c:d440 with SMTP id
 qk7-20020a1709077f8700b006e8354cd440mr26948261ejc.761.1649836679957; 
 Wed, 13 Apr 2022 00:57:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 lo15-20020a170906fa0f00b006e8a81cb623sm2118263ejb.224.2022.04.13.00.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 00:57:59 -0700 (PDT)
Date: Wed, 13 Apr 2022 09:57:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -next] drm/solomon: Make DRM_SSD130X depends on MMU
Message-ID: <YlaChZAd66pNPMEF@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 YueHaibing <yuehaibing@huawei.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220312063437.19160-1-yuehaibing@huawei.com>
 <08e81f07-99d2-62a3-8eea-b2c0432b4d18@redhat.com>
 <CAMuHMdVYtV9KHYqjcXS05XM+QqbCgPKB_uZCCAN0eAqHUmoeTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVYtV9KHYqjcXS05XM+QqbCgPKB_uZCCAN0eAqHUmoeTg@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 03:49:38PM +0200, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Tue, Mar 15, 2022 at 12:28 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> > On 3/12/22 07:34, YueHaibing wrote:
> > > WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
> > >   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
> > >   Selected by [m]:
> > >   - DRM_SSD130X [=m] && HAS_IOMEM [=y] && DRM [=m]
> > >
> > > DRM_GEM_SHMEM_HELPER depends on MMU, DRM_SSD130X should also depends on MMU.
> > >
> > > Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
> > > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > > ---
> >
> > Indeed. All the DRM drivers that select DRM_GEM_SHMEM_HELPER depend on MMU.
> 
> That's very unfortunate. Is there no way around this?
> 
> Else fbdev can never be deprecated in favor of DRM.

I guess we could transparently replace shmem helpers by cma helpers on
!MMU platforms - like if you have CONFIG_MMU you get the current shmem
helpers, but if you don't have that, we do a dummy shmem helper
implementation which uses cma helpers internally. The problem is that the
interfaces have co-evolved and aren't a perfect match, so some surgery is
probably required. Also we embed the structs into driver buffer object
sturcts generally, and I'm not sure how to best solve that.

Maybe the simplest approach would be to add a pointer to cma_gem_object to
shmem_gem_object for the !MMU case and do a bit of forwarding as
necessary.

It might also be possible to wire through !MMU mmap support for shmem, but
I'm not sure how well that will work in practice since that path would go
to page_alloc and not through CMA (or maybe I'm just wrong about how mmap
works on !MMU, definitely not my area of expertise).

Anyway should be fixable.
-Daniel

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
