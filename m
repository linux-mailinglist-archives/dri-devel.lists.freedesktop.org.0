Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A34451DBE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 01:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9036E8B1;
	Tue, 16 Nov 2021 00:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFB16E8B1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 00:31:10 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id z6so16502132pfe.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 16:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zUAbk3pYDxq1bSuJItD74NAh/MbYUz0fiMi2jjsqIPc=;
 b=jkN0+anUkVZEafZbns3mnQH3BOzdPE6stTt8SrDHZFGkz5SQGDyxTuScjmOkAtjtG9
 AT2XFauNYqbJ3Hv+WUTHMAUTNsTes+od+8KqsU/GEVyVgjrYYw/xt4G0TAF8HM1LcPVm
 2WJe85H3kQUjZSV8Rb5yVnjCooZk+xWNu9wek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zUAbk3pYDxq1bSuJItD74NAh/MbYUz0fiMi2jjsqIPc=;
 b=5kTAlJAuDwxIg0UjlI9HOCSgVnwlyYCYxFR1G/MiMFMtM8jHA2Vbrpl/p1+OHivzv/
 83yPEDlRVkgOjpHVygm8DDhYTh+Q2io3lJZ20U58HE+42hxUtpR0V+/sTOaDc9JrAMha
 ztYbCfk9bBVIWchSRGMIn9Y6r+ASQR1lxOjJwDr7CTVI5LE4vBwnh5aMAvABcbl0wcyD
 xCqEPkIiqRazmVj74lcvP+hVTA7fHhPIohP0W7JaHYLrewrSB93FvWP9cUoTPEmgu94x
 Up16rFZo1tvz/aaz+3OBIDLX30L4JiO9YSeva9H1Ek78PFEwDYF+3whgQGolFdRFZ5Hi
 vnxA==
X-Gm-Message-State: AOAM532D0fo5E0ef08Ja4dCjcTJyVKz6TKjEsvFHNZNjrQwKvBNmf76j
 iev9crK72XXAcwEZvj1RjlRNtQ==
X-Google-Smtp-Source: ABdhPJxDrEb7NedduOiss/lXzBJfLpYZT+5k0kObH71YXHTZztaI+VVMmjTV988TJQv8GS02GfUMPA==
X-Received: by 2002:a05:6a00:1945:b0:44c:a955:35ea with SMTP id
 s5-20020a056a00194500b0044ca95535eamr36094903pfk.85.1637022670112; 
 Mon, 15 Nov 2021 16:31:10 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h21sm12755848pgk.74.2021.11.15.16.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:31:09 -0800 (PST)
Date: Mon, 15 Nov 2021 16:31:09 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Subject: Re: Build regressions/improvements in v5.16-rc1
Message-ID: <202111151624.91EDCFF7@keescook>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <YZKOce4XhAU49+Yn@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZKOce4XhAU49+Yn@elver.google.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Helge Deller <deller@gmx.de>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Nick Terrell <terrelln@fb.com>, Joey Gouly <joey.gouly@arm.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-ntfs-dev@lists.sourceforge.net, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 05:44:33PM +0100, Marco Elver wrote:
> On Mon, Nov 15, 2021 at 05:12PM +0100, Geert Uytterhoeven wrote:
> [...]
> > >   + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_overflow' declared with attribute error: detected read beyond size of object (1st parameter):  => 263:25, 277:17
> > 
> >     in lib/test_kasan.c
> > 
> > s390-all{mod,yes}config
> > arm64-allmodconfig (gcc11)
> 
> Kees, wasn't that what [1] was meant to fix?
> [1] https://lkml.kernel.org/r/20211006181544.1670992-1-keescook@chromium.org

[1] fixed the ones I found when scanning for __write_overflow(). [2]
fixed some others, so it's possible there are yet more to fix?

Taking a look at Linus's tree, though, the "263" and "277" lines don't
line up correctly. I'll go see if I can reproduce this. Is this with
W=1?

-Kees

[2] https://www.ozlabs.org/~akpm/mmotm/broken-out/kasan-test-consolidate-workarounds-for-unwanted-__alloc_size-protection.patch


-- 
Kees Cook
