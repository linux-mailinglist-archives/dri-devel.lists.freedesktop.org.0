Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A5E344B3B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EFD6E519;
	Mon, 22 Mar 2021 16:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD11B6E519
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 16:26:56 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 f73-20020a9d03cf0000b02901b4d889bce0so16503494otf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tqh9FeOHVd4poYote/ngr+Xzz2Rj23UjzEqrB7uTeRo=;
 b=cpNXOIFlnTrxbTTxFrPv67IFYXotVX6OHbtc9plOtfWvrdMYilu1fSscnSkOvm6A9A
 tb5N3Y4KyIybiyqrF12g2WuE8up3mebJLU084AiAw1XTnKOwJUW4/2TBvdRrSsSuQr8B
 DBVKj27tC8kRrjrGRqEbux3pa6HSRv0qvxcAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tqh9FeOHVd4poYote/ngr+Xzz2Rj23UjzEqrB7uTeRo=;
 b=a4rAmx+IKa5WEwqVu8jlKeEy+vs4dEP95YBcJNwaQkGsBzRJeehxi5gsWT5RWIk/iX
 tujmfBCcG4k55UBQltG3X92yvS+bS//oHtAPDWGccBHSraLlJtTzJZllmWSMMRH0qWXW
 N7cniGzkAIBuYKEiz3Avxb3yojaDBzYTchbxJJRku9uDayRmAePlpiYGSb5lGfWrdRbo
 XKauxare4YaDpzPuiQL8JMgKZGk+4wUWjEsGsS3NzMc4Mhtnj4Z0GPexuMFihBO1REGy
 +wU/LBFzmcO2dKTKTsjEOCtfu1q4TldT8C6WLwoqiPMQfVjx4r/stkWHKpZKUSS7cNbj
 aoAw==
X-Gm-Message-State: AOAM532O/mRe9uauXCAoaaBYddn53FZwOvKycN5zHgQ2ggQqZ/9xqbVq
 mOH2s3JN64iur+19MHbMNN9iUjKJIF+i6Jo59rYg3vpUoKaiStSX
X-Google-Smtp-Source: ABdhPJzmE4tgEpb/ip2Lx5v3nt77TXD1Cj/CIGBi50PjCLpf9bgUX0JMxFbk82TA8RxbH5/WpyAySxb33kK3SGv1lFs=
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr588783oto.281.1616430416150; 
 Mon, 22 Mar 2021 09:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-2-jason@jlekstrand.net>
 <CAOFGe94ggJUBH_+bbxAVLUge8NZQYHK55ZzjnQ2erXhh+r8c=A@mail.gmail.com>
 <87wntz5rdg.fsf@intel.com>
 <CAOFGe97UDA9n6LCGXEZi-2B6ZTNeOG+D7sEX1kwEF5L2kUsWcw@mail.gmail.com>
In-Reply-To: <CAOFGe97UDA9n6LCGXEZi-2B6ZTNeOG+D7sEX1kwEF5L2kUsWcw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 22 Mar 2021 17:26:44 +0100
Message-ID: <CAKMK7uH1o316GKH9234AZUE9Oo3STE7zt1aHY2uqZE9PYy6zzQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 5:01 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Mon, Mar 22, 2021 at 7:01 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > On Sat, 20 Mar 2021, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > >     This reverts commit 88be76cdafc7e60e2e4ed883bfe7e8dd7f35fa3a.  This API
> >
> > Small nit, I think it would be useful to reference commits with the
> > citation style:
> >
> > 88be76cdafc7 ("drm/i915: Allow userspace to specify ringsize on construction")
>
> Done.
>
> >
> > I use this monster in my .gitconfig:
> >
> > [alias]
> >         cite = "!f() { git log -1 '--pretty=format:%H (\"%s\")%n' $1 | sed -e 's/\\([0-f]\\{12\\}\\)[0-f]*/\\1/'; }; f"
>
> Thanks for the tip!

dim script from maintainer-tools has a bunch of these helpers
(andother one is dim fixes for generating Cc: lists) which should work
even without commit rights and all that set up:

https://gitlab.freedesktop.org/drm/maintainer-tools/-/blob/master/dim

Cheers, Daniel

>
> > With that, 'git cite <committish>' will give you the nice reference with
> > 12 chars of sha1 regardless of core.abbrev config.
> >
> >
> > BR,
> > Jani.
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
