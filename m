Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F978C7062
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 04:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7448E10E2B6;
	Thu, 16 May 2024 02:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hKn+9Cn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B999310E2B6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 02:42:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-572d83e3c7eso2843924a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 19:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715827365; x=1716432165; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hZ3Y2dMNZ0IL+qTVOhLosvaCn1uvPGB+B7vwvyRozAE=;
 b=hKn+9Cn47NOUx5qgGSdagP/Z+PQRHLjFnxaMV343LiFWcmIsKXRo5DQqaFv7NwSy9z
 z6GwIyUULq8qziWlpN2ll4KlYAsONz796CtF6UGgy6JqCQI8DtEV0N8vUDs0uTZwGR9z
 QeA6NAta1ssCRSpjQmBCHTkZHD+ENGuRo0PSLVVAAh6/nm1gStoHWyC92UIZoC6sYz5d
 ioG8wINPyam3TSTYWHNPEv10ACpDI1XMNMRf4EgSh6caTXsoSNHFHY8snzEFToT16X1y
 Zwd1kfg/R7xHaXRZ0clXzdaLlW5jHwKOTh7VK16b0nMOCYceUid4S4Dvgz46uhSFpYrF
 7iYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715827365; x=1716432165;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hZ3Y2dMNZ0IL+qTVOhLosvaCn1uvPGB+B7vwvyRozAE=;
 b=ge+oHZY0kp2d35pbrpSToHFN2Zges6BxLtyEtIqB+ujTptliPbhLShpvJ09U3hnq9x
 t0wK7vJlVCy3yOnJa5VNg6T1AA+ypchxCFXMWwk8lZE2VFpEBtwpNTezPfj7lrOvWT3r
 RFsnzXwg5rdo7RNG+Al1iZRhzMw8Zqs29FjMpzACfVCejODi3/VDCkDxyuvHMwbNk8lC
 UuP5uVwQ9o7+4kge0E0vNVieyM2i5Rr9m1pbYP225mXufrHLNVJu3z4UvSM71P8kaR0U
 54F85tY9ZW4H4yPZgMQYYHchnG//uPpKU6nq/kU9/mXz/y+A+mDib/i2PMce/9/2lA0+
 gyLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUhiU8E7pmhE3tLvHsXHH0LtGgkNfYCxsaKdRsoL5KY9xMB7vigJpqj2kMJvjZbqiJtlc4YdNilCSETwQPfTJBCVql0Zwua9Dhwsv/7pfO
X-Gm-Message-State: AOJu0YzhERPAqNKPnu/x8de1cygwNIuF904u2+Hs32PtVkLp9EJF0xe9
 CBSmpZXAsIxxKXlbzDOkTTI73zkfjLvShkRkzZJecRXsH6AzfEheQDQVs/VYpUdDKVX4BihInzO
 eU7yMc5fNYrG42CYs69lMLrWS8wM=
X-Google-Smtp-Source: AGHT+IFD6ir/bb13VxvN5IkaLBRcLudkcqEw8HEMnM4uUaH8EIenkQtK6P8XcYY5L+pJctSgHZVOsWL6kTwzEGtWnpc=
X-Received: by 2002:a17:906:fada:b0:a59:cb29:3fb5 with SMTP id
 a640c23a62f3a-a5a2d572af8mr1125153766b.20.1715827364636; Wed, 15 May 2024
 19:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
 <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
 <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
 <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
 <CAPM=9twOiwquA7Zi_mr1vKFV4RQqhnbHv+c9Xz6BadF3tGEegw@mail.gmail.com>
 <CAPM=9tyHnK_ReDmFf0eUGGuvKpXJQ0VWuKKhDqJt89URjOTU_A@mail.gmail.com>
In-Reply-To: <CAPM=9tyHnK_ReDmFf0eUGGuvKpXJQ0VWuKKhDqJt89URjOTU_A@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 May 2024 12:42:31 +1000
Message-ID: <CAPM=9ty+FH0wW-vuw3H6jE_qg-PimR7pqSSJDNLgyYO1NC+-XA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, 16 May 2024 at 10:06, Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 16 May 2024 at 09:50, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Thu, 16 May 2024 at 06:29, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > On Wed, 15 May 2024 at 13:24, Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > >
> > > > I have to revert both
> > > >
> > > >   a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> > > >   e362b7c8f8c7 ("drm/amdgpu: Modify the contiguous flags behaviour")
> > > >
> > > > to make things build cleanly. Next step: see if it boots and fixes the
> > > > problem for me.
> > >
> > > Well, perhaps not surprisingly, the WARN_ON() no longer triggers with
> > > this, and everything looks fine.
> > >
> > > Let's see if the machine ends up being stable now. It took several
> > > hours for the "scary messages" state to turn into the "hung machine"
> > > state, so they *could* have been independent issues, but it seems a
> > > bit unlikely.
> >
> > I think that should be fine to do for now.
> >
> > I think it is also fine to do like I've attached, but I'm not sure if
> > I'd take that chance.
>
> Scrap that idea, doesn't die, but it makes my system unhappy, like
> fbdev missing,
>
> so for quickest path forward, just make the two reverts seems best.
>
> I've reproduced it here, so I'll track it down,

https://lore.kernel.org/amd-gfx/20240514145636.16253-1-Arunpravin.PaneerSelvam@amd.com/T/#t

This patch seems to fix it for me, I might just pull it into my tree
and send it to you.

Dave.
