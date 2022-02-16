Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3B4B837D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35E810E9F3;
	Wed, 16 Feb 2022 09:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D0910EC5A;
 Wed, 16 Feb 2022 09:02:23 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id g21so1687028vsp.6;
 Wed, 16 Feb 2022 01:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYjCvPon8yMm63jyhw65liUtpTYKWdTMDUVsDcsDf2Y=;
 b=Dg/EgfOW0t8kUiwSo9Q7VYSbYZQOZekrWABxyn9wFQ9khGyWnPkosof76q9RwB/N+4
 sMpHwL9J3LxGsPOFdJiIf6cn3j1yiqnqQuDbVi1GPdYrKLZVbDphX9ojHWCirpHkYKb/
 Ep/DbrmldxiVcfHhpuSLq3zN/6agLwBh9EJ0EJ0D9PGjRe6Oh/IwBYqLERCBtRT18jdo
 cuSDHOGngN2ZVaI+WzSTFdZdHVysj5vfk6kSkLvAGr9gHbUBbFeIdmnALyUNO+v1/mRv
 JVTHKx2xJSFCr3oFoTMwAjBDEF0SVnhxPFXhkcK2YNXs2Zh4zvt8N0i9PD0LUpmZqldJ
 c4GA==
X-Gm-Message-State: AOAM531usYpuH7WR3CLCDC4Xm4per7DGHCWsQZpT1oJktNw37Q8QzseS
 vbe3nGkZeZdpBZIQvFOXmpIyYJzqPcUYrQ==
X-Google-Smtp-Source: ABdhPJztp7c0Y2kSmHYFwaLY4UCQ7+sJhaeUx+kagqE0MGv5QXWv/mdkldCu/drks2Q7pTabia8e4A==
X-Received: by 2002:a05:6102:1613:b0:30d:ed81:f31f with SMTP id
 cu19-20020a056102161300b0030ded81f31fmr617766vsb.16.1645002142796; 
 Wed, 16 Feb 2022 01:02:22 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id t127sm447492vkb.31.2022.02.16.01.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:02:22 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id g20so1666428vsb.9;
 Wed, 16 Feb 2022 01:02:22 -0800 (PST)
X-Received: by 2002:a05:6102:4411:b0:31b:6df1:3b80 with SMTP id
 df17-20020a056102441100b0031b6df13b80mr548021vsb.5.1645002141827; Wed, 16 Feb
 2022 01:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20220215163213.54917-1-andriy.shevchenko@linux.intel.com>
 <87o83859x2.fsf@intel.com> <Ygv32CptVknidyP3@smile.fi.intel.com>
 <87leyb5gy8.fsf@intel.com>
In-Reply-To: <87leyb5gy8.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Feb 2022 10:02:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbpbY0=Beq6AMLS36oOmQhAmCvg=2WGJdFRz9dSwURiA@mail.gmail.com>
Message-ID: <CAMuHMdWbpbY0=Beq6AMLS36oOmQhAmCvg=2WGJdFRz9dSwURiA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/i915/selftests: Replace too verbose for-loop
 with simpler while
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 9:55 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 15 Feb 2022, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Feb 15, 2022 at 07:14:49PM +0200, Jani Nikula wrote:
> >> On Tue, 15 Feb 2022, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> > It's hard to parse for-loop which has some magic calculations inside.
> >> > Much cleaner to use while-loop directly.
> >>
> >> I assume you're trying to prove a point following our recent
> >> for-vs-while loop discussion. I really can't think of any other reason
> >> you'd end up looking at this file or this loop.
> >>
> >> With the change, the loop indeed becomes simpler, but it also runs one
> >> iteration further than the original. Whoops.
> >
> > Yeah, sorry for that, the initial condition should be d = depth - 1,
> > of course.
>
> Well, no, the condition should be while (--i) instead to also match the
> values the original loop takes. ;D

"There are two hard things in computer science: cache invalidation,
 naming things, and off-by-one errors."

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
