Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B224A84D734
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 01:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4D110E8AF;
	Thu,  8 Feb 2024 00:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XPM9oQ3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5910E8AF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 00:36:22 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-55790581457so1621793a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 16:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707352580; x=1707957380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0GzmIt9/X4CSQBO8A9F4YzHaPGQQ8V523DqusUAF0Y=;
 b=XPM9oQ3PWbeQ60vYRBYR0w+S1Prw8Nmk5nAWehJE7Jx0/rSAZyHyYbZpdrN6bwTzUq
 nyjsnv8UNYvMK5ddhs3ds7i//z0q7Lx93uHDyaqhKUf6cXqH8MayJ/NppNpz8h7El9oW
 odgjSDBdkBy5EpYIjlcj3aj8jyv7WpHOWS23iEHgtic5ppkR+zkDceE9v7AH6i2Ib31M
 nMicGXJ6LwplK0EFnBb2fexm3jw4DBS+9qG36Q/B4HI7lJ1YsxkUkJDv7TrC4sDvn0Mx
 Tvkw9n+qltFrnGR0w3YPkRy53oDSw5oylHG/Id6h05vyArLKLvCevLKxlygT4WFoKckw
 JCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707352580; x=1707957380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0GzmIt9/X4CSQBO8A9F4YzHaPGQQ8V523DqusUAF0Y=;
 b=NzjMzW7JXszdeO9bcE5KK1ZN7GnSUU/M8xg5yeMYvlN3k9aBFTYfr7ME3Vk7gu4B/I
 GwoXS6KDcjEmzSa5fmcTFumR4ve2z1HBs33PYGr0QQ8odLU72HMA6GhT6JxueIq2Dq+g
 vkbbH7kl4YnAzEDYb635SmzN6iUPQgNqGf0rucaOu8X6hRBFeSLeN524FTgW2BS4NglY
 LO3tTWL5+6IyMnWkpBYuj6EFjDFAza1fyDR9gG4K9ygiGXJpxp3GVAm4YHlawY7Ii+OB
 Sa7aj9dnXmImwPglRox4HunsD+Pb/J3psgFfPaeANgXaaSobt2kpW+9qeaQDQMg6eFXt
 fF1g==
X-Gm-Message-State: AOJu0YwarBFjdt5VI2lGeZ/T8VeG9CNzIg/KoZ0HMoZ52od8a3w7LxL+
 YqSqtJjv20eNRL84huTjhGNGSZ38FiP56iRn5i1WOvKp670zzzfaOK7qQsVtFCL0vs4bGYFyTwE
 /4HOcFHHYiSJRo5DfYdUL+fm/xT8=
X-Google-Smtp-Source: AGHT+IH0krO1z618IUxkvf8UMcOx92jGvI+PBEM+NS6keUmwlzvvwORLiIcdmE4nkuGZj7+dbwXDWNFSxrJ1469oUD8=
X-Received: by 2002:a17:906:34cf:b0:a30:2690:5c48 with SMTP id
 h15-20020a17090634cf00b00a3026905c48mr5820599ejb.8.1707352579925; Wed, 07 Feb
 2024 16:36:19 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
 <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
In-Reply-To: <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 8 Feb 2024 10:36:08 +1000
Message-ID: <CAPM=9twvcJPdZvaw+TOpTC+6NoNTbSqhy97aJRP5Hg0HBkQE0g@mail.gmail.com>
Subject: Re: xe vs amdgpu userptr handling
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Just cc'ing some folks. I've also added another question.

On Wed, 7 Feb 2024 at 21:08, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> Adding another point to this discussion, would it make sense to somehow
> create a generic structure that all drivers, including shmem drivers,
> could use it?
>
> Best Regards,
> - Ma=C3=ADra
>
> On 2/7/24 03:56, Dave Airlie wrote:
> > I'm just looking over the userptr handling in both drivers, and of
> > course they've chosen different ways to represent things. Again this
> > is a divergence that is just going to get more annoying over time and
> > eventually I'd like to make hmm/userptr driver independent as much as
> > possible, so we get consistent semantics in userspace.
> >
> > AFAICS the main difference is that amdgpu builds the userptr handling
> > inside a GEM object in the kernel, whereas xe doesn't bother creating
> > a holding object and just handles things directly in the VM binding
> > code.
> >
> > Is this just different thinking at different times here?
> > like since we have VM BIND in xe, it made sense not to bother creating
> > a gem object for userptrs?
> > or is there some other advantages to going one way or the other?
> >

So the current AMD code uses hmm to do userptr work, but xe doesn't
again, why isn't xe using hmm here, I thought I remembered scenarios
where plain mmu_notifiers weren't sufficient.

Dave.
