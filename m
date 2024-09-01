Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C6967C80
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 00:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAD610E0E0;
	Sun,  1 Sep 2024 22:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d+YJEBBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B7110E0E0
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 22:13:36 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5a108354819so4429821a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2024 15:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725228815; x=1725833615; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uu05Fo9Mc9YyfS0pauXPeDLboNox95mhvm+3wRYnh/M=;
 b=d+YJEBBlkBVWgfX2hHnSyfXBMQzhmOjEzqyKXDVmesmd2DAP8AWtY3ZZGEZmOGEFcf
 m1/ONhegDt7PqMvXJqSLlz1pjlTiiUh2TISk3AbHwubeZqWw/IYQ5OjV0ZrdR+i0IF2j
 n5/rTl4U9fqe+8rGhMOMPY1yjz7BWgt+4FQtrGD9SPSK+ZiwfP9BfQ/sL7vpNEqnX9r3
 PrNE+rIPWqkaeg2gb3bxdo8eTSsERbChNimxDOaA70t5u0AD8rHKRt51vvPNpp25+s8a
 gOjagpBjQfdypAc64Z62gfb5NLKzLUF70lPaKVKTGxz7Teh76vO/j9xdEls2p7iT1GiY
 pkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725228815; x=1725833615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uu05Fo9Mc9YyfS0pauXPeDLboNox95mhvm+3wRYnh/M=;
 b=VmIRPDvr1/ZIHVH+TWhqWLxVQy29W3p2OBbibP1O8YKr7xKCdozfR40Oi5v4cemrZq
 jNvA6eYBr8GeWqqKcvql5FjRmzigC/T2PzI4GCoUgKdMjHxzD+boL51EdZb+kNcuN773
 PJfWNdo9rPmr2BxD+rpUcVDaTF3v5x4yd43BpxsG9t2MNY4d8wyWzdOtS5ayvg31VEGX
 4e2/sfbKu7Lb8oYJWGyuSxb3epzIBx/Zfh9ejDWmZ/YprDy+tk8NWU1RyeFbI5QnWFNI
 zM636LpAUh1UkCto/1ds6EYdtxp5ywyBr5T/kQjN4YA2IzbURCvlQ/N2cdlRlKoes9zH
 41/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+RivjwCvmFrxw3PfiJdXzY8u8Aet147wXndOtqA2ALUZ8J9Dr35VtjQRSVZxJKQw3o3NVt5LQ6oQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnmGIFblQAoacWOUGt5jlIvmIynKC0G1IUFqq2MWlDW2tRiBWn
 2xtrPLkaRFyADSnDN9rBeKd495iVcKNS44cczqkXSHAqJK9vhGYZVdqvKI/J5P1Jq0xWDIUQRWT
 awVBRdb/c6l2UXU9JFlGaq8+gCUA=
X-Google-Smtp-Source: AGHT+IFMdVXB5CtReViBHo6ZhW/u0gI00NEcTW4LRdI2PTBS9Mb/sIzLvXxJSyV4w9+NPYGKmPmEWrB7UW/pabnX7Ng=
X-Received: by 2002:a05:6402:2550:b0:5be:da7c:6176 with SMTP id
 4fb4d7f45d1cf-5c21ed3dfd7mr8870092a12.10.1725228814579; Sun, 01 Sep 2024
 15:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
 <CAHk-=wijFJM9MHvwGSS4ADs8ncRagrXYi2E9SvhK8coMH32D7A@mail.gmail.com>
In-Reply-To: <CAHk-=wijFJM9MHvwGSS4ADs8ncRagrXYi2E9SvhK8coMH32D7A@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 2 Sep 2024 08:13:13 +1000
Message-ID: <CAPM=9txF4+rC_CXQTftPctUd0N37t306YKcV3oKPjz+_zQGqag@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.11-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, 
 lingshan.zhu@amd.com, "Koenig, Christian" <Christian.Koenig@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Aug 2024 at 12:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 30 Aug 2024 at 14:08, Dave Airlie <airlied@gmail.com> wrote:
> >
> > The TTM revert is due to some stuttering graphical apps probably due
> > to longer stalls while prefaulting.
>
> Yeah, trying to pre-fault a PMD worth of pages in one go is just crazy talk.
>
> Now, if it was PMD-aligned and you faulted in a single PMD, that would
> be different. But just doing prn_insert_page() in a loop is insane.
>
> The code doesn't even stop when it hits a page that already existed,
> and it keeps locking and unlocking the last-level page table over and
> over again.
>
> Honestly, that code is questionable even for the *small* value, much
> less the "a PMD size" case.
>
> Now, if you have an array of 'struct page *", you can use
> vm_insert_pages(), and that's reasonably efficient.
>
> And if you have a *contiguous* are of pfns, you can use remap_pfn_range().
>
> But that "insert one pfn at a time" that the drm layer does is
> complete garbage. You're not speeding anything up, you're just digging
> deeper.

I wonder if there is functionality that could be provided in a common
helper, by the mm layers, or if there would be too many locking
interactions to make it sane,

It seems too fraught with danger for drivers or subsystems to be just
doing this in the simplest way that isn't actually that smart.

Dave.
