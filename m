Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B553CCF45
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 10:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0776E0A5;
	Mon, 19 Jul 2021 08:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEE96E0A5;
 Mon, 19 Jul 2021 08:13:25 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id z9so15939392qkg.5;
 Mon, 19 Jul 2021 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3vqAe3KxjzT7cwWvnRTQ366qLe+IapQtvR9/glMcwkk=;
 b=tVVgGwalsRjRWsDOvdQlGwbcEBJ1JDqyXiyXJyhhopRUVoyZ3z7y4N8rKB7VO3Jb0y
 uhycFNVOo+i89dQU9TwXgT0wNIxJ56wM27uDiVBtoGh/NIHBmFeLy694uvOLdDMzE5fL
 OFzCY+IbFpemnPCk8QTbkdUtqtPN+CTvgDb7quBaKe8Pf6sX78k+ITNPh5VjO8k22a3A
 eMQOms7ZzFEf9IgWPqjQ2cjvGWcbPYUOCfeDaYDxRQzK8V/H9Dwf8ucOx7i8aUsMxyGV
 gon425Vg9DRoZjTMK2lgKH663VSXFXi2pbSLu9FoeUGT+kqIO5gvKSca0qlGVAuXFSMY
 Os3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3vqAe3KxjzT7cwWvnRTQ366qLe+IapQtvR9/glMcwkk=;
 b=cJzYUhKTRT4yRRphNPkj24+uMeUX7d+9X2O6WtV12JHpqfifsIH6VkWtIP0bahnLxy
 ZzyVaCGslHLXaNdGT8FhBIwZopxfxptxJs/5Gwn+Uae/24MfKbH0F1pTNred3weoZK37
 Xc+PheWKyOpYHrkiPupcd7Y0kgseZpAqdPX3fa7L7gmzBbsLYWVB39x9F5gZTY2lETjy
 XXWXpK5uAhHDI5tPG5MgDGpeEb9Q4XvqYF53y04QcsZ/T4k7/kF1YzuFDy9x4sssgB1x
 Dd4OIVbs8ei3VpeLS9XKZachmgAeBmm7/vFl+YSb1rKY1xZ0N8BToXiw3MFlMqAakbuX
 jDDg==
X-Gm-Message-State: AOAM531IgkR04aPVbgMmheRGFnzKf7LbaHwW1YJqNHvlNLPKoD1kGxK4
 oAcLv1MQZGFQKglwsngfUxEfhSHA5EhbZRxYP8w=
X-Google-Smtp-Source: ABdhPJwWDNZKkfdzXyHGX/CRxUkzWSLZLu0fh+yDRLP6Gt5sIrwGEPGM8K/ee6b10ipBNCBaPCIuEOr+aCfOkq8usKQ=
X-Received: by 2002:a05:620a:1581:: with SMTP id
 d1mr21944415qkk.327.1626682404425; 
 Mon, 19 Jul 2021 01:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-5-jason@jlekstrand.net>
 <CAM0jSHNjG9ozYM1w3-G2LQgajrGCMnFXTjOPhAeDbLRhO4ejZw@mail.gmail.com>
In-Reply-To: <CAM0jSHNjG9ozYM1w3-G2LQgajrGCMnFXTjOPhAeDbLRhO4ejZw@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 19 Jul 2021 09:12:58 +0100
Message-ID: <CAM0jSHMX0+VkybtE3PKOXqMYg9R4FO6WcpmxK+-W0gkS9SFYBg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/gem: Unify user object creation
 (v2)
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jul 2021 at 20:21, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > Instead of hand-rolling the same three calls in each function, pull them
> > into an i915_gem_object_create_user helper.  Apart from re-ordering of
> > the placements array ENOMEM check, there should be no functional change.
> >
> > v2 (Matthew Auld):
> >  - Add the call to i915_gem_flush_free_objects() from
> >    i915_gem_dumb_create() in a separate patch
> >  - Move i915_gem_object_alloc() below the simple error checks
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Matthew Auld <matthew.auld@intel.com>
>
> If CI is happy,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Might be good to also update the mman selftests to use this new helper.
