Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA02FFD3F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 08:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709C189ECD;
	Fri, 22 Jan 2021 07:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F5489ECD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 07:18:10 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id p5so5040109oif.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 23:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PBop7RTwFZUlkXdwz2L/SZMu0KIaBvM9tTFwilxFZIE=;
 b=ESKN50Qx1jWj4eYZ4nVBlkkf25dGN8tnEg/svLx1fdiY7CZHRVwBbTrEyaVoCiVwfM
 /WKGgShTUfOsu2mGe1lpeS2aJFf7u+cKNTOW7DzlKE6RjcUcPc6t+0e0S4/W5e7x9wjL
 MknetX89AQ4UC9FvHZrPNmqgNo8AJoPNwB7lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PBop7RTwFZUlkXdwz2L/SZMu0KIaBvM9tTFwilxFZIE=;
 b=jj3gsmMHtc5iHSeS8jcjeXk+Hh8gQkfRAuIMeAUfb6TjyadP52/dYI27AD7DempYAi
 OAN7iTeuo/1aWZIEKZWlDBE+1NPkxXJHtp8KOQ/+6xkdQLmlnHXfHobQBmYaPrvpwg/+
 yJ/87jbi2Jxp8+spJm2QmEMYmuFiQGFsLWvr1MYZ5EI9lvR0CNb1Z82LPWqscKO22H20
 qhxdTEmaeif+3JQ1NnP8BlIZrf7s1cWdi7M9LNJIVFOMOsyHwcjOCJz9aL9rGv2ctxSB
 FtkUftw6szmGNYDJdrw6v8ZlJwWGOApiOvxzAeiK43dZ42ybehREgnJKxbFeJ8oe5OUJ
 5TgA==
X-Gm-Message-State: AOAM532NAOm0HFbDYlvedr2ZwnVMPNCi0ecc7jnLPMUzFM75KJrMixzv
 QqwIXIYkwBQVqbubp2ns5vxM1g7CtmfrcYcMYLJ6zQ8lEExSLg==
X-Google-Smtp-Source: ABdhPJxhcoMkh/eQ09cpexkSmm1MY4WiNK1KKSNsTW/U0VYpD8AAYcqLTNNLivy7TLGo86ft5ohCg9Wh1WRf2uAD+fk=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr2453097oie.128.1611299889390; 
 Thu, 21 Jan 2021 23:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20210122115918.63b56fa1@canb.auug.org.au>
In-Reply-To: <20210122115918.63b56fa1@canb.auug.org.au>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 22 Jan 2021 08:17:58 +0100
Message-ID: <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 1:59 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> WARNING: unmet direct dependencies detected for DRM_I915_WERROR
>   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=y]
>   Selected by [m]:
>   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && EXPERT [=y] && DRM_I915 [=m]
>
> WARNING: unmet direct dependencies detected for DRM_I915_WERROR
>   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=y]
>   Selected by [m]:
>   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && EXPERT [=y] && DRM_I915 [=m]
>
> WARNING: unmet direct dependencies detected for DRM_I915_WERROR
>   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=y]
>   Selected by [m]:
>   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && EXPERT [=y] && DRM_I915 [=m]
>
> Maybe introduced by commit
>
>   4f86975f539d ("drm/i915: Add DEBUG_GEM to the recommended CI config")

Hm that has been in drm-intel-gt-next for a few days, is that tree not
in linux-next?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
