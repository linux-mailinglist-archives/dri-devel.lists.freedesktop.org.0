Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D797BA9F989
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC53C10E238;
	Mon, 28 Apr 2025 19:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EBPFYls1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E13A10E238
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 19:32:00 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so769356866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745868719; x=1746473519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=clvMixzUlwXVdP1MVYhs8dd5jD9W6xD/V/kA/2PWTsA=;
 b=EBPFYls1+VbUq+7gFLIXfiKc7hAfzdwwkVvqUqWuvHbYYUYsgOWWUVEg/WMHl5CkWW
 6yEbXiuJSsiCo0X88SCXif8lcUIsBX7MhvQjzj3tA8yYE6thpgnWegulGnybQVZe6HwP
 qH58PEeZSQmRjwbUYv5+Z1mPFZRhudopbI7b40+eRSFuw0d68mjOOaXC/Yd805hYdJfa
 aqgkoJOBhryCaXQWqLF6Xoa+0OVqg3cI5DeTnVaIDuOT+yzAdxiiHJwGBhBywIF4/Xru
 RJSJIrOqIfd/1V7IRs8EAR4q9bsFIrTckZMGOmUO5iBCpT9+AsiMFFdskaaCKx+mHf+V
 xF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745868719; x=1746473519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=clvMixzUlwXVdP1MVYhs8dd5jD9W6xD/V/kA/2PWTsA=;
 b=A7ymXFnJVrz3HCLMdIG0+bXPsbbdPQGqSAJqdoSBnO4RFcArXpI6H1Ub3zhLz2NBEZ
 fdDZ8VJfNoZoUtwiWRvcfN503gvvemVjJfeMYljjIT3BNgeo9ohItmaXobHcisejdLrz
 nFN/8v3mzD+bEbYlwAvZd4Ru0TQe8LZpacF7zumljDjVmWB5s5/lwpkGgk9kMI2KpGgi
 oezVE63Crtdtz9ZL8HbykKsfTnM90WmbRHk2bM3SOcL8FuJhTi9YY51J5+sgsRlLZdSW
 Las/nxj5FDNXjLz8i6EHatuaV/F+QaMrnGE3+vGOggzIj6ZukXbOe6KgrYsGICqA2Wn3
 y4Hg==
X-Gm-Message-State: AOJu0YyPhNn28a7mmqmb7m46M/wZ8HhPUcWXfsDCRSCq92BuLSM585/C
 38T3e/TOF7gR5Pz91A6LtyXgjSB0ea+CEDA7DLChirV/ewJIHDiUXCCOkZCpaT/bejk8EoWwkUT
 wq/G/mPv8pBSCBtsjXjMESKmLm58=
X-Gm-Gg: ASbGncuqZh6egTmVTsb3SGqvWVFEjEPvFtMr6pigrNpEqEz2MawQk6GQUw3ogrGb1ta
 CsOrKKJJuBrm8dAK31bDTUqtLgkQIJoxwBjeRgysPmEWyHSL3JwMZs/N+eeaB0TLrAohpL9oJVn
 +CC/7gWgvh6xfv33bB86lDdRSQdcHSd/8=
X-Google-Smtp-Source: AGHT+IFLuUocUdQmizosojpHdukguxfQt2DZzVHhIIuVAmlSuN8A3ZHMSJnYr5cbpnG+GpgGCSNqqRto8AJov4Lc9X0=
X-Received: by 2002:a17:907:7f8c:b0:aca:e33d:48af with SMTP id
 a640c23a62f3a-acec4f20479mr85905966b.61.1745868718523; Mon, 28 Apr 2025
 12:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250423214321.100440-1-airlied@gmail.com>
 <4bac662a-228e-4739-b627-5d81df3d4842@amd.com>
In-Reply-To: <4bac662a-228e-4739-b627-5d81df3d4842@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 29 Apr 2025 05:31:46 +1000
X-Gm-Features: ATxdqUFX8TlA8SB5and9ojCYJazRG2Xwfktm6GA_G0-fvfnIIHi7VfxOzfvDHjk
Message-ID: <CAPM=9tzVijMmf8P=Kthc-UcaYXK28Gy3e3W+F8i3NKdYzhL_BA@mail.gmail.com>
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org, cgroups@vger.kernel.org
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

On Mon, 28 Apr 2025 at 20:43, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 4/23/25 23:37, Dave Airlie wrote:
> > Hey,
> >
> > I've been tasked to look into this, and I'm going start from hopeless
> > naivety and see how far I can get. This is an initial attempt to hook
> > TTM system memory allocations into memcg and account for them.
>
> Yeah, this looks mostly like what we had already discussed.
>
> >
> > It does:
> > 1. Adds memcg GPU statistic,
> > 2. Adds TTM memcg pointer for drivers to set on their user object
> > allocation paths
> > 3. Adds a singular path where we account for memory in TTM on cached
> > non-pooled non-dma allocations. Cached memory allocations used to be
> > pooled but we dropped that a while back which makes them the best targe=
t
> > to start attacking this from.
>
> I think that should go into the resource like the existing dmem approach =
instead. That allows drivers to control the accounting through the placemen=
t which is far less error prone than the context.

I'll reconsider this, but I'm not sure it'll work at that level,
because we have to handle the fact that when something gets put back
into the pool it gets removed from the cgroup kmem accounting and
taken from the pool gets added to the cgroup kmem account, but
otherwise we just use __GFP_ACCOUNT on allocations. I've added cached
pool support yesterday, which just leaves the dma paths which probably
aren't too insane, but I'll re-evaluate this and see if higher level
makes sense.

> > 4. It only accounts for memory that is allocated directly from a usersp=
ace
> > TTM operation (like page faults or validation). It *doesn't* account fo=
r
> > memory allocated in eviction paths due to device memory pressure.
>
> Yeah, that's something I totally agree on.
>
> But the major show stopper is still accounting to memcg will break existi=
ng userspace. E.g. display servers can get attacked with a deny of service =
with that.

The thing with modern userspace, I'm not sure this out of the box is a
major problem, we usually run the display server and the user
processes in the same cgroup, so they share limits. Most modern
distros don't run X.org servers as root in a separate cgroup, even
running X is usually in the same cgroup as the users of it, Android
might have different opinions of course, but I'd probably suggest we
Kconfig this stuff and let distros turn it on once we agree on a
baseline.

> >
> > This seems to work for me here on my hacked up tests systems at least, =
I
> > can see the GPU stats moving and they look sane.
> >
> > Future work:
> > Account for pooled non-cached
> > Account for pooled dma allocations (no idea how that looks)
> > Figure out if accounting for eviction is possible, and what it might lo=
ok
> > like.
>
> T.J. suggested to account but don't limit the evictions and I think that =
should work.
>

I was going to introduce an gpu eviction stat counter as a start, I
also got the idea that might be a bit hard to pull off, but if a
process needs to evict from VRAM, but the original process has no
space in it's cgroup, we just fail the VRAM allocation for the current
process, which didn't sound insane, but I haven't considered how
implementing that in TTM might look.

Dave.
