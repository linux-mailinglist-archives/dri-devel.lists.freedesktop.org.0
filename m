Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB993220F3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 21:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD17E6E0AD;
	Mon, 22 Feb 2021 20:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCBE6E0AD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 20:52:03 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id r19so6112348otk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 12:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EsKNWOTpoXFBX3Vm20VX6e7+2+XeumtrdsmpqxkFoSE=;
 b=hx3ZtNKXCjBF9VddK8QgdVRc3sYrJ55BQupjDWwHI7khjSuKLDNLD0Kz9MR3dQ4v/J
 /NWxPC7wssr4gRI9wTUsE5nQFc+C9iYzom2snaBD0WOe5kHUeCGqd2uzpyUu1N4iZQYB
 m9fhfaAd+CTX1VqvmvTrmZTJUOuJy1WUACfQ8pyZmdzPr2+CUL5+dvHStza5z2tFVhtz
 etYdm5dNI1D70LSlkjgAYmdgW0OEOxYXiUh1jCYsNUUC1GIPjCGj67Nub8zr898KoIPL
 06yH3kUXJ1bU6yJcX125gno29ErYUlSiuOTkwKI6crx8I/LxT0Tdwzt9SCDAxTR9r7ak
 3NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EsKNWOTpoXFBX3Vm20VX6e7+2+XeumtrdsmpqxkFoSE=;
 b=uLV0chPYiVzuvm3tmV7L1n8a1ndKdJYTbL+5AT+dlPX7OF9aZG4Z/WM0XLdw+SedeV
 5xqPFUTIpnIF0vHrFh+Du79rAsh/fz1OqngYyxb/8AP04FDDBQIYTjlB79w/GSPy+Zjj
 7ofg40A1sD+a6Vt89DhWEau0CYY8vrOIreJKhNRN2WG5sQc7QoDDjZqqKhlMWMY/W+J+
 JolZ80spWDU0/vTnJF7yGLfBv7+QG2zcObOmwEL4yFEvsGT1cG/TphCtc18WIlhunKHw
 O/Up+EJuvijG58i1PXwXL5yXzIYeS3h3UTeDITS5B0OPxFvqTuYPNdBptWbRAWO3l47x
 12ow==
X-Gm-Message-State: AOAM533V1l8YUYlEofj+PHP0kZTSwCVToKoDMcMCdvFdrnU6CqlFe8V8
 p6zO4qpTD2kpUZnjdEWIuPJAC+whc8j74iQ/nos=
X-Google-Smtp-Source: ABdhPJxgtf9qdkqoR/ipe+6CsbbzBAq5ddIs5TNufipZbmAeTYrchhfeEOY7Tl9/Fuz8GfJ/YxQrPGmnMN0S7JTlfQc=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr7475200oti.132.1614027122516; 
 Mon, 22 Feb 2021 12:52:02 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txd-x1NKWK9BBqVTDNOR00zNqcXgs76YJrDfL94eMLYqQ@mail.gmail.com>
 <CAHk-=wgiPxXzRNnfaXk7ozSWSu7fFU--kTmVjkDaTB05wwUk_g@mail.gmail.com>
 <20210221234549.GA21254@24bbad8f3778>
In-Reply-To: <20210221234549.GA21254@24bbad8f3778>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Feb 2021 15:51:51 -0500
Message-ID: <CADnq5_OcxrYehTWWiEOO8OMqMSHk22=Z7ehcYhiOUVwFF=Yhyw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.12-rc1
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Kevin Wang <kevin1.wang@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 21, 2021 at 6:45 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Sun, Feb 21, 2021 at 03:07:17PM -0800, Linus Torvalds wrote:
> > On Thu, Feb 18, 2021 at 10:06 PM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > Let me know if there are any issues,
> >
> > gcc was happy, and I obviously already pushed out my merge, but then
> > when I did my clang build afterwards, it reports:
> >
> >   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning:
> > variable 'structure_size' is used uninitialized whenever switch
> > default is taken [-Wsometimes-uninitialized]
> >           default:
> >           ^~~~~~~
> >   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:770:23: note:
> > uninitialized use occurs here
> >           memset(header, 0xFF, structure_size);
> >                                ^~~~~~~~~~~~~~
> >
> > and clang is very very right. That "default" case is completely
> > broken, and will generate a randomly sized memset. Not good.
> >
> > Presumably that default case never happens, but if so it shouldn't exist.
> >
> > Perhaps better yet, make the "default" case just do a "return" instead
> > of a break. Breaking out of the switch statement to code that cannot
> > possibly work is all kinds of mindless.
> >
> > Kevin/Alex? This was introduced by commit de4b7cd8cb87
> > ("drm/amd/pm/swsmu: unify the init soft gpu metrics function")
> >
> >               Linus
>
> I sent https://lore.kernel.org/r/20210218224849.5591-1-nathan@kernel.org/
> a few days ago and Kevin reviewed it, just seems like Alex needs to pick
> it up.

Yeah, sorry, I meant to include it, but it slipped through the cracks
last week.  Will include it in my -fixes PR this week.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
