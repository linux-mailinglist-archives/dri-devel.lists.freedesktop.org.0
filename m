Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4FB61543F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 22:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1627A10E420;
	Tue,  1 Nov 2022 21:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD68A10E420;
 Tue,  1 Nov 2022 21:28:03 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 r15-20020a4abf0f000000b004761c7e6be1so2240842oop.9; 
 Tue, 01 Nov 2022 14:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7floQmYMzLgaddTMF2cgROiayJCZkDQQYG5jcMnB2Mg=;
 b=CUfRAOLG/90T2J7O+9cTJGRFsZDOddWLZ7QygnM1H/0Jbr/5N8WQkUrvg0y0475BqV
 OLHYPd+AvEyH95tkvnbCRYACyKOOuNcI0NhLCqN75HTpOJf0jGNkq21AxYSjahqZ2V9X
 QDIuL9afXBV/pMjDnnax+Va9kqJtBB0qHFwswOtHzcEEKk21lYxKqwl/J/OYhyX+4XdU
 6A91pNXCQmqcNEPHtw6o7o0XtZP9tSZqYwDLczOkMLxjw5oobQ6u0kJ47dchzuOEFOyQ
 UWEYvZ9OOM8x+FGIT/Zr19nCZ8ABgot0Ye01RImeViDtjA/t5gvRbpcpobmQlRaKJ7gM
 sFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7floQmYMzLgaddTMF2cgROiayJCZkDQQYG5jcMnB2Mg=;
 b=reHsLKEnvSUqpOrwfrJam/kYhZ2bu8EMTvbytIMNhbdOd07Y2Jaw5VFe4406iQlOBM
 niai/DSU9/3RByVFX5pWkN2XuDkh/NIP73/irLAJgOltuAyLSY85dRWnWQA8xoPpHuJk
 oTrqZGCUal/s30U/ULDCPMh9zmPbW5H6xRU6uB0zF/ygaxO6tNqwEzfYiEZzbX+BWNNl
 TvDgANqek2hzY91vmVk4C8QT6j5T/tdRYuseuaDAK12tQRFtm6XQDd1PcyncX31yDKbV
 eBjdGhqdvuQS8mn45yR9RjqlfR4Yh5beURx1yssmG03KfYy4HvkJZ9njDG+glZM41lyK
 nqBg==
X-Gm-Message-State: ACrzQf3dltRiPLkc7o1XM3D8XghoBLqkeip6AKwzLu7742q3T5KfA6pa
 583LYWZsIhBSeRvrrDtCQ7GMv9+rc9oSBTqK3/w=
X-Google-Smtp-Source: AMsMyM7yk7X+Cj9EUIZxraYgPnAGIa0+Hu39Z7lSzBEzpctAS8fb7Y+6uxZLdnqcgfbWXEEUoo2awWK5pli6jW0aJmU=
X-Received: by 2002:a4a:b913:0:b0:480:b3bf:7812 with SMTP id
 x19-20020a4ab913000000b00480b3bf7812mr9031444ooo.97.1667338082817; Tue, 01
 Nov 2022 14:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <Y1trhRE3nK5iAY6q@mail.google.com>
 <Y1yetX1CHsr+fibp@mail.google.com>
 <CADnq5_Mod90O=tN26+Yi74WPYxpVtss+LG_+_HZyFv2EtzR+MA@mail.gmail.com>
 <Y2GMEjB4NQ3RYk2C@mail.google.com>
In-Reply-To: <Y2GMEjB4NQ3RYk2C@mail.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Nov 2022 17:27:51 -0400
Message-ID: <CADnq5_MuYmxOExeuhQAZ_KU4jfOdFhy1Jn4QBuawuL2Tq64n7w@mail.gmail.com>
Subject: Re: [PATCH v2] [next] drm/radeon: Replace one-element array with
 flexible-array member
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022 at 5:14 PM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> On Tue, Nov 01, 2022 at 10:42:14AM -0400, Alex Deucher wrote:
> > On Fri, Oct 28, 2022 at 11:32 PM Paulo Miguel Almeida
> > <paulo.miguel.almeida.rodenas@gmail.com> wrote:
> > >
> > > One-element arrays are deprecated, and we are replacing them with
> > > flexible array members instead. So, replace one-element array with
> > > flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
> > > refactor the rest of the code accordingly.
> > >
> > > It's worth mentioning that doing a build before/after this patch results
> > > in no binary output differences.
> > >
> > > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > > routines on memcpy() and help us make progress towards globally
> > > enabling -fstrict-flex-arrays=3 [1].
> >
> > This seems like a worthy goal, and I'm not opposed to the patch per
> > se, but it seems a bit at odds with what this header represents.
> > atombios.h represents the memory layout of the data stored in the ROM
> > on the GPU.  This changes the memory layout of that ROM.  We can work
> > around that in the driver code, but if someone were to take this
> > header to try and write some standalone tool or use it for something
> > else in the kernel, it would not reflect reality.
> >
> > Alex
> >
> Hi Alex, thanks for taking the time to review this patch.
>
> I see where you are coming from and why you may be apprehensive with the
> approach. From my humble point of view, I think that the artificial line
> that separates "what we can change at will" and "what we should be extra
> careful not to break/confuse others" is whether the header file is part
> of the UAPI. Given that atombios.h isn't publicly accessible, I tend to
> gravitate towards the first one.

It may not be publicly accessible, but it describes a physical thing
that is burned into millions of GPU boards out in the wild.  There are
tons of open source tools out there that take these headers from the
kernel to be able to parse the date in the ROM on the GPU.  If those
applications sync up with the latest version of the header from the
kernel, it will break their tools.  The next time someone from AMD
syncs up the header with the version maintained by the vbios team, the
change could accidently sneak back in and break the code.  It seems to
me in this particular case that the header should reflect the physical
layout of the ROM since that is what it describes.

Alex

>
> > > +  /* empty fake edid record must be 3 bytes long */
> > +    sizeof(ATOM_FAKE_EDID_PATCH_RECORD) + 1;
>
> I am assuming that this is the part of the patch that makes you feel
> concerned about how devs will get it (should they copy this header),
> is that right?
>
> If so, would a comment on the ATOM_FAKE_EDID_PATCH_RECORD struct
> specifying the size of the struct when empty do the trick?
>
> - Paulo A.
>
