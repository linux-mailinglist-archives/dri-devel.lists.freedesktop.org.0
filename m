Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC73451EFD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 01:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791C96E131;
	Tue, 16 Nov 2021 00:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F886E131
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 00:35:15 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id y8so10424269plg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 16:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6YrJDwz5lHylUrRKBiCCXn7XIadwbTCaDNmr8F8Qv+s=;
 b=kRgsOovbagRO/7210nSyOKEBlmhfA5hNYfPQV4k7lydus9N2uNl5Vt0UygZC7jGLy1
 CcSKdAOPN7CAjIaxG2Nk7LhNoTdTNyUIV57l7UZ/U0TQtm7n+dBKTmv+GCqWpklKxw86
 72xq1Tvc+lxHwltemgeZ72MdiUZIJVqjFa0RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6YrJDwz5lHylUrRKBiCCXn7XIadwbTCaDNmr8F8Qv+s=;
 b=o+0K7wwvOAaPsXbwwE8YZ2HEKKpUZ7MGmsqcn5wVJ2UJoJn/vsaEpeTSTQtRWk3W+T
 5syl6YjA3673zRATGsyyJu/007GCjIbl3yVosB/rA5PIg3cDNkX1Wis4RIjwSOsUY566
 ZCg/NT/vDnr3yqqyoXhqUam4Nndfga5xdjh+9cGPqDbRPw1rsFJystnMYx5tRl11QgSk
 Q+9qAW2ku92PsYu7wyE948N21ouNxYY1llDshB9C1DGa2JDkuFHEdEUyRBCBsincTfOr
 6DsO8obw2a5xzPV7UTl+5OO3HLpANZrVuD181x23uPYoK1JUn6SetDf7opwe4wfVCk+k
 YF2w==
X-Gm-Message-State: AOAM5308SggMh8uU/DR7Da0FBvAbruHrqyYgzkwATknzC/y2PcENykM3
 q2oQnGymHkDUEPKZxJt0i4u43g==
X-Google-Smtp-Source: ABdhPJy9iYaBB3Pj/LejC8q7/hsST+5gxO7ABIHhxz3+lYk9ZK6BkrL6e9tXPNM1m5lGV6jB9/FWOw==
X-Received: by 2002:a17:90a:c398:: with SMTP id
 h24mr3495024pjt.73.1637022914921; 
 Mon, 15 Nov 2021 16:35:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s21sm16292860pfk.3.2021.11.15.16.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:35:14 -0800 (PST)
Date: Mon, 15 Nov 2021 16:35:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Subject: Re: Build regressions/improvements in v5.16-rc1
Message-ID: <202111151633.DE719CE@keescook>
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

Ah, I found it:

http://kisskb.ellerman.id.au/kisskb/buildresult/14660585/log/

it's actually:

    inlined from 'kasan_memcmp' at /kisskb/src/lib/test_kasan.c:897:2:

and

    inlined from 'kasan_memchr' at /kisskb/src/lib/test_kasan.c:872:2:

I can send a patch doing the same as what [1] does for these cases too.

-- 
Kees Cook
