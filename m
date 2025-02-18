Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63885A39085
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 02:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FD310E335;
	Tue, 18 Feb 2025 01:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fLhs8RC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAB410E335;
 Tue, 18 Feb 2025 01:42:46 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso848500166b.1; 
 Mon, 17 Feb 2025 17:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739842965; x=1740447765; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dg0cV9YMuOzAAw8bH2Nl8pZMkp2PyRYW0a0TFVz7OKY=;
 b=fLhs8RC2z49vGYYlXTLmSP++b81WY10/P8Nfp2DErxrVtUFcGhpHt/ZH2yBsk/d2HB
 OwGikO8fnMcP37pHZP+2+XXfYTHrpjK89yOBv444oruH+xjpSZ4d+1koXrEv6rTwOeCG
 q1SCrbE2szgzsRu4Fw9jC411LBepRFPoRb+9QTmAghZdPjU8HHmyOcry2a/25iMaDFU0
 g8qMdSEX5STbWjeEheSntSOeFzXBL9kJNr37WOVXjuIwi0dBk5n7Mvh7yCGVeRVQ/WQ1
 jRX7tvZDRbblN5jJN+fWPqTkzQwD0BvcALC/r4HZQa22NgMsXYdK7iTlh8/ZutUn/V8e
 8ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739842965; x=1740447765;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dg0cV9YMuOzAAw8bH2Nl8pZMkp2PyRYW0a0TFVz7OKY=;
 b=CkdU3M4u3XCzfefjiVDBJaF68IVRDLGmiG/2TwRQHoYlV5GMczZby9j5b4xIBhXgVW
 F1wLjuEEMR8gCY3CXIrVyGBvYqhy00UHJD4z8/sj/h39ja7IDmXG7XacnlAhPElGzhqs
 Xj+ctHAkbB1CIAXo+4WhYAWe7G/DlLQglNtk/PIcnURZe7OdtBXkYRjH9Aun0tIllwpw
 0fsnNatCsJryyyLV2fJx4Xl8tO7vEGDn6e+tod3fFi044gwtCdLWC+dQWSKNbPSeitLu
 wIh6H4o/IF6KrK2tg6bE1vTRflq+bfeWtBFlsLWkM5LMkSfmGyH40+thM4aMXAYt1PCK
 H7kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVee0kBD1hGV4Gb1LcTWsUM+NZylARqKqpSh9HdjT37scHXU1C+19H+K9FPKNe/7vZldZLI2MoMw5g=@lists.freedesktop.org,
 AJvYcCXKNY87lxJ/tedyt1oBdGRhSFLHxXvYCji1vPdHb+4wuamj99JvsZsjggCbQuvHrBGCi5txNW/gZw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKrMnTXquT1RMl/vd4dzUheLpkslDLSqvyn90iJff+AKxFG5Hh
 wAd+weDze+JaZuXpyQKQx8wFC6GrAUhvEpsv/xqK7kDK5NTa1f7njjPVmZAy2dpohv2ai1CuVd9
 J4ko7hiafWT9C8XNXS8VxWCOKbmA=
X-Gm-Gg: ASbGncs45V3oXf8tS2C0EmP7lNmFbRibGYmDqqZ/qtI8BFsVHuRryksqyh9Rs8hbnwp
 bvgmMrNc36UCGKLtovGo7fmV0E5ss1z3WCsfFlA2MB3PyfoDf9zFzWsESWcAWKAv9imAex1s=
X-Google-Smtp-Source: AGHT+IEeHApHMoptLuAc4Sh8QkrdHNF4nURGJyV/v17P1QinqcSyBeMUyDJ+iZaOu8uDHKmstlunWglE8DOr4O4H1IQ=
X-Received: by 2002:a17:907:1888:b0:ab7:851d:4718 with SMTP id
 a640c23a62f3a-abb70d77069mr1256620466b.36.1739842965028; Mon, 17 Feb 2025
 17:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
In-Reply-To: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 18 Feb 2025 11:42:33 +1000
X-Gm-Features: AWEUYZkI8CAF9HGjNRmIGmfPzQ6uc3IvLD4mpYKZjq3NUT2hjYZo_v2S68AaTYQ
Message-ID: <CAPM=9typO2VQYDmn8LE+aEfsymqUjQZLrY60mJ30_oujyDD9ig@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Tue, 18 Feb 2025 at 00:04, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
> Hi everyone,
>
> This short RFC is based on top of Danilo's initial driver stub series
> [1] and has for goal to initiate discussions and hopefully some design
> decisions using the simplest subdevice of the GPU (the timer) as an
> example, before implementing more devices allowing the GPU
> initialization sequence to progress (Falcon being the logical next step
> so we can get the GSP rolling).
>
> It is kept simple and short for that purpose, and to avoid bumping into
> a wall with much more device code because my assumptions were incorrect.
>
> This is my first time trying to write Rust kernel code, and some of my
> questions below are probably due to me not understanding yet how to use
> the core kernel interfaces. So before going further I thought it would
> make sense to raise the most obvious questions that came to my mind
> while writing this draft:
>
> - Where and how to store subdevices. The timer device is currently a
>   direct member of the GPU structure. It might work for GSP devices
>   which are IIUC supposed to have at least a few fixed devices required
>   to bring the GSP up ; but as a general rule this probably won't scale
>   as not all subdevices are present on all GPU variants, or in the same
>   numbers. So we will probably need to find an equivalent to the
>   `subdev` linked list in Nouveau.

I deliberately avoided doing this.

My reasoning is this isn't like nouveau, where we control a bunch of
devices, we have one mission, bring up GSP, if that entails a bunch of
fixed function blocks being setup in a particular order then let's
just deal with that.

If things become optional later we can move to Option<> or just have a
completely new path. But in those cases I'd make the Option
<TuringGSPBootDevices> rather than Option<Sec2>, Option<NVDEC>, etc,
but I think we need to look at the boot requirements on other GSP
devices to know.

I just don't see any case where we need to iterate over the subdevices
in any form of list that makes sense and doesn't lead to the nouveau
design which is a pain in the ass to tease out any sense of ordering
or hierarchy.

Just be explicit, boot the devices you need in the order you need to
get GSP up and running.

>
> - BAR sharing between subdevices. Right now each subdevice gets access
>   to the full BAR range. I am wondering whether we could not split it
>   into the relevant slices for each-subdevice, and transfer ownership of
>   each slice to the device that is supposed to use it. That way each
>   register would have a single owner, which is arguably safer - but
>   maybe not as flexible as we will need down the road?

This could be useful, again the mission is mostly not to be hitting
registers since GSP will deal with it, the only case I know that it
won't work is, the GSP CPU sequencer code gets a script from the
device, the script tells you to directly hit registers, with no real
bounds checking, so I don't know if this is practical.

>
> - On a related note, since the BAR is behind a Devres its availability
>   must first be secured before any hardware access using try_access().
>   Doing this on a per-register or per-operation basis looks overkill, so
>   all methods that access the BAR take a reference to it, allowing to
>   call try_access() from the highest-level caller and thus reducing the
>   number of times this needs to be performed. Doing so comes at the cost
>   of an extra argument to most subdevice methods ; but also with the
>   benefit that we don't need to put the BAR behind another Arc and share
>   it across all subdevices. I don't know which design is better here,
>   and input would be very welcome.

We can't pass down the bar, because it takes a devres lock and it
interferes with lockdep ordering, even hanging onto devres too long
caused me lockdep issues.

We should only be doing try access on registers that are runtime
sized, is this a lot of them? Do we expect to be hitting a lot of
registers in an actual fast path?

> - We will probably need sometime like a `Subdevice` trait or something
>   down the road, but I'll wait until we have more than one subdevice to
>   think about it.

Again I'm kinda opposed to this idea, I don't think it buys anything,
with GSP we just want to boot, after that we never touch most of the
subdevices ever again.

Dave.

>
> The first 2 patches are small additions to the core Rust modules, that
> the following patches make use of and which might be useful for other
> drivers as well. The last patch is the naive implementation of the timer
> device. I don't expect it to stay this way at all, so please point out
> all the deficiencies in this very early code! :)
>
> [1] https://lore.kernel.org/nouveau/20250209173048.17398-1-dakr@kernel.org/
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Alexandre Courbot (3):
>       rust: add useful ops for u64
>       rust: make ETIMEDOUT error available
>       gpu: nova-core: add basic timer device
>
>  drivers/gpu/nova-core/driver.rs    |  4 +-
>  drivers/gpu/nova-core/gpu.rs       | 35 ++++++++++++++-
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 43 ++++++++++++++++++
>  drivers/gpu/nova-core/timer.rs     | 91 ++++++++++++++++++++++++++++++++++++++
>  rust/kernel/error.rs               |  1 +
>  rust/kernel/lib.rs                 |  1 +
>  rust/kernel/num.rs                 | 32 ++++++++++++++
>  8 files changed, 206 insertions(+), 2 deletions(-)
> ---
> base-commit: 6484e46f33eac8dd42aa36fa56b51d8daa5ae1c1
> change-id: 20250216-nova_timer-c69430184f54
>
> Best regards,
> --
> Alexandre Courbot <acourbot@nvidia.com>
>
