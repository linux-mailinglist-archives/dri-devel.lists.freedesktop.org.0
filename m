Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397AAC3B01
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 09:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1C210E117;
	Mon, 26 May 2025 07:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HYIa9x7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA1C10E03D;
 Mon, 26 May 2025 07:58:30 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ad51ba0af48so561828166b.0; 
 Mon, 26 May 2025 00:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748246308; x=1748851108; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mFp9E7GoCllffqOOP11MDhEmieHTUjOyTd1L7U3N1fI=;
 b=HYIa9x7QQnAhthJu1LwY5yR+CSzgUvRPL/CH+MZcwGtyvi/uVICU3BRqvKKCpLVGpz
 O8imbviVveUwAzz4JAFIuhNL4jWCPyjdwWD3BQlk/+4WtUExMnsyliPE4eTgOpUaW9PF
 eJueLz5fRTBE1JAFsnTmm2TseyzwuYhsXPqjg3EHamy294tYx3DAJ+WjlgseTRTWNhnM
 Iv3aZ6dMDF1Pk7Ge41aOXykZCMcb8zy3QOrVAPusUtGMyZ7fLqG2rayRT85cx9wW+iig
 DnIygqmIXWqBy/eCY3Qs13ojYBTtxGjt5f/r7AWwb4qwQjL9mQL3zTOupt/4qpziQ06R
 o/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748246308; x=1748851108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mFp9E7GoCllffqOOP11MDhEmieHTUjOyTd1L7U3N1fI=;
 b=ZsCNofuzZmW9s2M4dIRLrwCx/IaL0xv9+AFJ/1X5oRkGCE/Cy8V1E89aAIjiKiE7+0
 4xX+n0KgWgCbWVzbSuzmrUv9CR0o2cJlrQeMTalN4ARiLQT48ec37a3zUNNUvJDpL9i0
 artxcYgVl2YwIx2dCS9Cgv64J7g3lBm+qiLdhio7dU0Bn9mf1mUmQcCV0ybRt4XaYb51
 nscFkA8gN2mvwLtNguy1KtKYpggUOyNCwD0KHyGIfTTIzwEsyqf8cWCqJw5Z3ESPKijw
 F4BuTDQ+a72ER19mIn8xrY4cV/mi87UoXw/CbSY8l+L6O8Rm27/iclISmNBR8CfLRpK2
 i5WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDOlcdmcFjeYvfZdG/c9ozsjlEhtqaOOwQJ/VzOIAX8ZuGThrm+0fKm8Le3tosGGHaPPDvOrajvuI=@lists.freedesktop.org,
 AJvYcCVj9IBcQj+w1gLfm+WTRMoHMjLAxSk39uZ/8XfteqlAKezUwLidpt0I4XJf9A/hSgSRK/HygJ2oNSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa4lWWDsV7bblQJ+UQES07v68P1ho1vS8DDWHBbXK5modve4LU
 yGdQys25s38ageozsU5ZLEA7jdWndcnA9aJAeNZWvn4HPmgBKLblPZ3Q81rudSpoGEbjumB3awd
 omsWLRxwU3YhZo2xLnNOlm1Z7HBY1ikc=
X-Gm-Gg: ASbGnctqmFcu9Ej7/xcEatMus3NexrmyJ9R/v80x1sc9qfXFfpjXUbAtbTq+ueV8Gz1
 YEH2ttRdWvLaBK3R+jdsfXypkWPjv0NVts0/C9fvcfxUkXePwrt0u+WA1OIHW4iHdqV2aC53iCd
 yyoC91nMyLwR6E3cCWgh7rx9cqvT6t8Vc=
X-Google-Smtp-Source: AGHT+IHmFEEr5EGPRHdHxu6GtzPt9+rVYNJ2W5yl8fWfAJYHk+yUpd89Y0QBAb3CwsUgorOeHLGtu/syioYTxvope4k=
X-Received: by 2002:a17:907:6eaa:b0:ad5:3199:e5e4 with SMTP id
 a640c23a62f3a-ad8596d9640mr722860766b.3.1748246308194; Mon, 26 May 2025
 00:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
 <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
 <b867c60d-c6ad-4847-a2f6-4652bad89b25@suse.de>
In-Reply-To: <b867c60d-c6ad-4847-a2f6-4652bad89b25@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 26 May 2025 17:58:16 +1000
X-Gm-Features: AX0GCFufl1SU-qzeIJCM7t6dIhCQA24MBvcO1TYPg_KQFdyNKumEFNU2jG0EzIQ
Message-ID: <CAPM=9ty=Fz6UFcUinVHjDmTpgczTz_-OkxXoV78p=rNWmEk6Fg@mail.gmail.com>
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Michal.Wajdeczko@intel.com
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

On Mon, 26 May 2025 at 16:39, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 22.05.25 um 17:09 schrieb Lucas De Marchi:
> > On Thu, May 22, 2025 at 04:52:18PM +1000, Dave Airlie wrote:
> >> From: Dave Airlie <airlied@redhat.com>
> >>
> >> This reduces this struct from 16 to 8 bytes, and it gets embedded
> >> into a lot of things.
> >>
> >> Signed-off-by: Dave Airlie <airlied@redhat.com>
> >
> > Replied too early on cover. Chatting with Michal Wajdeczko today, this
> > may break things as we then can't byte-address anymore. It seems
> > particularly dangerous when using the iosys_map_wr/iosys_map_rd as
> > there's nothing preventing an unaligned address and we increment the map
> > with the sizeof() of a struct that could be __packed. Example: in
> > xe_guc_ads.c we use it to write packed structs like guc_gt_system_info.
> > In this particular case it doesn't give unaligned address, but we should
> > probably then protect iosys_map from doing the wrong thing.
> >
> > So, if we are keeping this patch, we should probably protect
> > initially-unaligned addresses and the iosys_map_incr() call?
>
> That sounds like a blocker to me. And there's another thing to keep in
> mind. We have use cases where we need to know the caching of the memory
> area. I never got to fully implement this, but it would be stored in the
> iosys-map struct as well. We'd need 2 additional bits to represent UC,
> WC and WT caching. If we don't have at least 3-bit alignment, shrinking
> iosys-map might not be feasible anyway.

I've played around a bit, and it's starting to seem like it might be
difficult to get this across the line.

I can add the iter stuff separately to fix the sub-dword offsets if
needed, we probably don't want to be doing 8-bit iomem accesses
anyways.

But if we need 3-bits then it's messier, what's the use case out of
interest to store the info? do you need all 3 states?

Dave.
