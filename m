Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9048A4D0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 02:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6388F10E4BD;
	Tue, 11 Jan 2022 01:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B87610E4AB;
 Tue, 11 Jan 2022 01:11:47 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g79-20020a9d12d5000000b0058f08f31338so17078082otg.2; 
 Mon, 10 Jan 2022 17:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=24u0HfOYmEXMexHKNr6/VqyMwcTiPMZEtxMMSABMM2U=;
 b=eeLLtu9FBUsrR18bBEVcvoYAS8rN3dtSLLefmLIXSGl89dFeLKCTiL0o3MCjfvtMEn
 OaIFlO/WKvwQvZokAqzOPPoU2HNG7VOlQRz526FK5KnAF26pUXt5gYdoK+IwO+i+gwpU
 nMVMoiWKuoY9lcF6uOv65tRTpDMKD47+NCNoFuB9o2WVmXEBXiNfsGyLWrFsYBHbuMA3
 AEflSnx2LF6PSJeQQ6k0cP7wJ96OMP52wNGLhqMtV4BrtH8Nf0lCc2YsBWiUj7OITIQG
 ftWuvKy+C8N9HhNe8yfoppWGipWpDBIsKix9hDEwcJyEJTQ7UgAi1hBXzHNZgQDCn20o
 GQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=24u0HfOYmEXMexHKNr6/VqyMwcTiPMZEtxMMSABMM2U=;
 b=es18wWpFkr1JOJ+7OqLqDkwDst8Eg0Iim+dTXmjWZo9uvGaF/4iSvGuQJnciP0z+1/
 EsE3z5hT3p/cZvccRuN1WJsWI+gPjhuG8dDM5Xr/FdtTEbbyGmLfY+68ONxU7Qs8gjXG
 uQAZUVl8I9h7PEOAzoVdxQhyZ3U4Iz4vsrBqciAAbUnVZi2ps4osaH7DEHvyDLv6qzbi
 smSEs8SexBcqG+2bl1gSHovEETOuI1gJKmrExUioPiq2qeKc4KXZSuIuHDVIQP/lS3aI
 ey//tnIq9jaCAheCtA9/oFQUEljwvHKijwteu8hwelHafCNySM1B5RIP0RUgWOncUlvO
 p6Kw==
X-Gm-Message-State: AOAM531UontAPGt/mvWm9IZ3sQeveewS+4aODGQllaG+20eSeVwflnrO
 MJjsxu70di6yYAd3eHa7qGx4n2MejBFXbTjlK5s=
X-Google-Smtp-Source: ABdhPJwKhnwL+hbPwQXmM+GBeSLhrHPTondS/I97ppFbTy9pmgYJQaAdL+UYlUBpmLMERfQQoJi7/7DiUkdfbdsyRI8=
X-Received: by 2002:a9d:6390:: with SMTP id w16mr1830898otk.200.1641863506848; 
 Mon, 10 Jan 2022 17:11:46 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
 <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
 <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
In-Reply-To: <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Jan 2022 20:11:35 -0500
Message-ID: <CADnq5_OYO7kq+9DBnDvbSfpouFvdLB0LPSL6+f1ZPRBsV=qEqA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 8:04 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Jan 10, 2022 at 2:13 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Sounds like something related to watermarks.  That said, we haven't
> > really touched the display code for DCE11 cards in quite a while.  Can
> > you provide your dmesg output?
>
> I'm not seeing anything that would look interesting, but here's the
> parts that look relevant for drm..

We are putting together a system to try and repro the issue.  Does it
happen with a single monitor or only with two?

Thanks,

Alex
