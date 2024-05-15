Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4C98C6F50
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 01:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1E510E14E;
	Wed, 15 May 2024 23:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H5ppuIB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1010E14E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 23:51:48 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso3517161a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 16:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715817107; x=1716421907; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6YXsou36uHdIuctIKNGUHwj1t+svMMfcpIbUPLQeTpo=;
 b=H5ppuIB8WbnvFUtAgCTg+fp0Hbi7NongoHNMyAQJjJTjB25t68k07EIInZTqG7lj3W
 pXx4Fy8Q7nk/P24EtB/6IeJpGrP8klTh5Gp6R37htIomr8grv+cH+Cqis1tR5jyXc42r
 Yd5ecUtDKoZJ5UXhE530n53u3btDnFoBpVJe7zvPzEMVjGnc5atDih+NZ7r/uAnrDF/k
 oMVKDFOFRnPvZvh/o4OfBHUVHIHtP+BmOxgPepbsCfmjZdTiQ55hvSNW4MCXL4DLExXi
 2575vB5BzZkxskdtpMxaxcdlN9JIyFt0zeW6VXBm4RgJ1SOJtt1s7OSkDSA48GUex8Yh
 ujpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715817107; x=1716421907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6YXsou36uHdIuctIKNGUHwj1t+svMMfcpIbUPLQeTpo=;
 b=q0Kb+DB+8pxdSYGyWLS8ekY7seHCh8rSv7d4WBjyF+XekmIm9oJdETyxyzrHStwuN5
 N2pGDtd2my+nMOdC6bSmGEJm5FyM7JAflRQq5ulovVZ13KOYNm9X0iyrq17lhvUvsxGL
 iqG47KLLYY+1p4tERpp0garz8hSn2koW+nbQ1u6vpfqNhjZLf38WbZ+Vd8LaWKk5WTAy
 V4HCfrWEJVV2JfZYWuHrY1vzTkaYYLksmLP5OvWTUHGUg2FCee7rDhn6fVBPNscXNnG2
 HpDsDj3JiFf5L+W3K+FP/7qTF/Mok8dQS6/2zm1G8Oez7BoZhaluL2NSgInA76HwLFKv
 NMoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbMwLyGGkQwF8EwL+M64wFaGxVkM35KnJemXaleLBxO36xJPwgJyDoJAzkmB8u5RYVpaEu3lGebGltLRqjS3h3aLE10CRCSJfhY3YoozoG
X-Gm-Message-State: AOJu0YwznEfMg+DzsvrtJi/dJgjB8WHphg7gZKaYU23jn2o4kHVBGQxw
 S8M9fjPmSQRSWBsTT/LlxpGxaTNBHWGYZaytWnWw8kYMea4r3RLIPH5vrq6vIORsswFcIo2dCFz
 2XKCRaXzQ8D31NIjdTA1wP9u5Q1Y=
X-Google-Smtp-Source: AGHT+IHyVX6Um4N7w3Sw8E4PvbkDsTQs+nIgUiwyfzOQ/ygt5zRXx6XNIyWSkqZhazobgOQ7vLc4iwi52g/Gn3w6UlY=
X-Received: by 2002:a17:906:daca:b0:a59:bae0:b12f with SMTP id
 a640c23a62f3a-a5a2d6656c5mr1439369466b.57.1715817106686; Wed, 15 May 2024
 16:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
 <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
 <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
 <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
In-Reply-To: <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 May 2024 09:51:35 +1000
Message-ID: <CAPM=9ty=xoLrCJGx+TfcQe66pMCi5-9etPhhb7HgWUOHFM8dUw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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

On Thu, 16 May 2024 at 06:29, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 15 May 2024 at 13:24, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I have to revert both
> >
> >   a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> >   e362b7c8f8c7 ("drm/amdgpu: Modify the contiguous flags behaviour")
> >
> > to make things build cleanly. Next step: see if it boots and fixes the
> > problem for me.
>
> Well, perhaps not surprisingly, the WARN_ON() no longer triggers with
> this, and everything looks fine.
>
> Let's see if the machine ends up being stable now. It took several
> hours for the "scary messages" state to turn into the "hung machine"
> state, so they *could* have been independent issues, but it seems a
> bit unlikely.

This worries me actually, it's possible this warn could cause a
problem, but I'm not convinced it should have machine ending
properties without some sort of different error at the end, so I'd
keep an eye open here.

Dave.
