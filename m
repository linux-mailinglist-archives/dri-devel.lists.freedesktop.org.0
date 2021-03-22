Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAD343E6E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CE18997C;
	Mon, 22 Mar 2021 10:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19B8997C;
 Mon, 22 Mar 2021 10:52:45 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id r14so11896173qtt.7;
 Mon, 22 Mar 2021 03:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WJX7JaYFq4GAMYqJbvtx/XER33QOle3RHNn2d1pX0ts=;
 b=cuBpipzJKTWI1UoftSn58ZUn2sM+Qjcu80NaLIq78WUDZLTrkTGeEIvr05tWplBK/C
 pIxH5zqZMel/vmt+IInn35fsp4WYoNq9oYvUm8qNT8YVV1TQwkNlp+SNhAzW/6lu1w+G
 vpPwKNahrsALLxF7TX/aMRBiOmvmAVzWHl8enxjrxGfEpBkqvqfOjYJUS92FTeKx0U6N
 gSnJp/dDheVf0HTUi8OWMgodUIjpP8D5TcIflyEBjNgRMey1YygEDPsYN6Ry/e0NqkPK
 OYP7zWbBwE4ehRpcxEJhtVSxN1kuUCNc+vq/s0VCWmiaLGipIS5AG7vi7mlCvVfzcpZz
 90xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WJX7JaYFq4GAMYqJbvtx/XER33QOle3RHNn2d1pX0ts=;
 b=DispOna0rYWrQauyLw2HekQDA0zCRTmS798j0puiN3dVYdr2ouLMgOiNy/6uQL2HUc
 brd5mZImlpQK+QfLTkmilU4+BQR0pRK2THwhMnxVB9eSatbYbRQaMkUhkZCC+5w9Rfzr
 dTBUATGfsMLmc4wZkC9SYEHgBSwA5ewGiUO9v2LUbNqIVVi+76oek5wTPZDCYmrw921S
 16q7e7LQcYVDV/owf5cX2F3t/PtRJEcYV76AP87UgnxO0slCMj3fvFNRCuIwd9FX9biE
 mFqEuhvCHVZ8UcW8R8F7m+Ww6HnL7Ka7VbYPuQz+Xc4YB9ECakvYni5Q7aOCOW3et4sf
 3ahA==
X-Gm-Message-State: AOAM530GSEREVHFY4Xhq55LW9iKbP+QmXjHXoGQlOnwFdWoW++b4ghyS
 zLylH91KBhYTlURUFaaUUZcOL5ygAETxRW2kUdyfYTDBlUI=
X-Google-Smtp-Source: ABdhPJzEnFDFVJPaZdyrsL0Jax7/4Pqn9U5B9LRleGY0C6itv9RCY59NWab8obTzvhv8T8tHLFj6iMBrLZpZpFQvwPM=
X-Received: by 2002:ac8:4d97:: with SMTP id a23mr8808429qtw.265.1616410365095; 
 Mon, 22 Mar 2021 03:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-2-jason@jlekstrand.net>
 <CAOFGe94ggJUBH_+bbxAVLUge8NZQYHK55ZzjnQ2erXhh+r8c=A@mail.gmail.com>
In-Reply-To: <CAOFGe94ggJUBH_+bbxAVLUge8NZQYHK55ZzjnQ2erXhh+r8c=A@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 22 Mar 2021 10:52:18 +0000
Message-ID: <CAM0jSHPZCAJwaNHWPpKW1xhbm4Y8rBuQeWf+=egmY7VTKXaLwg@mail.gmail.com>
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

On Sat, 20 Mar 2021 at 14:48, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Fri, Mar 19, 2021 at 5:39 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > This reverts commit 88be76cdafc7e60e2e4ed883bfe7e8dd7f35fa3a.  This API
> > has never been used by any real userspace.
>
> After further digging, there is a compute-runtime PR for this.  I
> still think we should drop it and I've updated the commit message
> locally with the following rationale:
>
>     This reverts commit 88be76cdafc7e60e2e4ed883bfe7e8dd7f35fa3a.  This API
>     was originally added for OpenCL but the compute-runtime PR has sat open
>     for a year without action so we can still pull it out if we want.  I
>     argue we should drop it for three reasons:
>
>      1. If the compute-runtime PR has sat open for a year, this clearly
>         isn't that important.
>
>      2. It's a very leaky API.  Ring size is an implementation detail of the
>         current execlist scheduler and really only makes sense there.  It
>         can't apply to the older ring-buffer scheduler on pre-execlist
>         hardware because that's shared across all contexts and it won't
>         apply to the GuC scheduler that's in the pipeline.

Just a drive-by-comment. I thought the lrc model was shared between
execlists and the GuC, so in both cases we get something like a ring
per engine per context which the driver can emit commands into. Why
doesn't ring size still apply with the GuC scheduler?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
