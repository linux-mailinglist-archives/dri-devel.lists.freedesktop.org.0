Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9CE8C6F63
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 02:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360BA10E349;
	Thu, 16 May 2024 00:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dc4PgiNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CEC10E349
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 00:06:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a59b178b75bso197061466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 17:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715817999; x=1716422799; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qXkt2d5OC0yazlvXkniMYKtb6wDXdUmwsgGhPTbJ6y0=;
 b=dc4PgiNnUzLMK5rBY57QdnAe3EFyN89GvCpIBlrjZmiHZTXumbCKknmdf2JLv4TF7M
 Qpei6wGDSgfsLJGZzAbrnC0G9MFXTklcTswLsKLzjx3or+Fx3u4+9hrl1qIpWehQnB/X
 K79RqE4umFzBlxeasAxJUKN/EFBOQO7ro8rEYV22X923p+SvdjbrC3jAa+d7lsYgaHuo
 cpNHplemJXdbHcotCWL8kQiAfKPsVCWuJFjYXu37lHrs0TD2gS3jdt1GWD+qOCbeX4Nz
 /mVHO9IL9U+CfXLygFNF4Sr50f58NYY5IH+DS+/lWpHAjg4C+N+efQbRFKVsb02gPhIf
 95DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715817999; x=1716422799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qXkt2d5OC0yazlvXkniMYKtb6wDXdUmwsgGhPTbJ6y0=;
 b=AtW4FTcxGTlSaO5T52HatpbzuQ4ArnI4oZq5iV31+6J7WsCc0wBceStIizVZqOuiU9
 4z6uqHt7eZSn2rhQoXI2aPjcDjx5LuEZmb8daYzTib/n8driCjX5wvf6QD7fAbFY9/OM
 Q2+Mi8QBry29NbsgEzuIOU2VjkWLYbDmA19iUsTce6UyGQUxWJOgqifKAbeXERa7dBm/
 3deWhPHQY5qYaB5zq7DFjRODF2Q5e0e5m0kDPfnMXIaQf0BZwxC4zRsF7voHaBdeYQ1J
 7KRZ529YWOsrKMgCzau4+HggpamfXTixqX3SRV9yjSAFkg9TUGoVsjfXX2sztaXvWZMP
 Us/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9RCwJx2KNKjwSa3jvyilmT4uCD+RoOJCbuMHAtkoBgql8r/oSBtRGVewr2V6wNTfhZ729Ouft7JSCjgsiRuvj+7eYykIDIwMvAfzicOic
X-Gm-Message-State: AOJu0YwoGow1a+ycJG3mnWpByMqdio2aF1uk8F0V3vb8WiKVJPKC7FG5
 iHZo7w/5wvnN1HPlDF8UQSoakLaXKyA95fVch7JH3L65YOrqSYYvU7rjHNMb+Ci/q6o1fgrM+j4
 8umDH+aR44kwpDNS9Pmdi8hOYUlc=
X-Google-Smtp-Source: AGHT+IFAEotjeBboaPBFp2QUGMMZIdoqD2WN1t5mGNJO/gCZeS/brOW+E0G5KfJnaQrvg7dmy3tbgJdNajWBs6sH8E4=
X-Received: by 2002:a17:906:528b:b0:a59:cf0a:4e4d with SMTP id
 a640c23a62f3a-a5a2d55a730mr1225744166b.12.1715817998859; Wed, 15 May 2024
 17:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
 <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
 <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
 <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
 <CAPM=9twOiwquA7Zi_mr1vKFV4RQqhnbHv+c9Xz6BadF3tGEegw@mail.gmail.com>
In-Reply-To: <CAPM=9twOiwquA7Zi_mr1vKFV4RQqhnbHv+c9Xz6BadF3tGEegw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 May 2024 10:06:27 +1000
Message-ID: <CAPM=9tyHnK_ReDmFf0eUGGuvKpXJQ0VWuKKhDqJt89URjOTU_A@mail.gmail.com>
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

On Thu, 16 May 2024 at 09:50, Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 16 May 2024 at 06:29, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, 15 May 2024 at 13:24, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > I have to revert both
> > >
> > >   a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> > >   e362b7c8f8c7 ("drm/amdgpu: Modify the contiguous flags behaviour")
> > >
> > > to make things build cleanly. Next step: see if it boots and fixes the
> > > problem for me.
> >
> > Well, perhaps not surprisingly, the WARN_ON() no longer triggers with
> > this, and everything looks fine.
> >
> > Let's see if the machine ends up being stable now. It took several
> > hours for the "scary messages" state to turn into the "hung machine"
> > state, so they *could* have been independent issues, but it seems a
> > bit unlikely.
>
> I think that should be fine to do for now.
>
> I think it is also fine to do like I've attached, but I'm not sure if
> I'd take that chance.

Scrap that idea, doesn't die, but it makes my system unhappy, like
fbdev missing,

so for quickest path forward, just make the two reverts seems best.

I've reproduced it here, so I'll track it down,

Dave.
