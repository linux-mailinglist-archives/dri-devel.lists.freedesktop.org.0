Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5FA4941B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B6A10E26B;
	Fri, 28 Feb 2025 08:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HBf2vB95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFD010E26B;
 Fri, 28 Feb 2025 08:56:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B00875C05A4;
 Fri, 28 Feb 2025 08:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5087C4CED6;
 Fri, 28 Feb 2025 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740732959;
 bh=y/U8R/NI0d97IbZrAfpBI+n/RgNShiZ1WGVlLVetEEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HBf2vB95qVdn4uCpncA6IMNyEnCFFNT3NTU+2Vn2efqGCs3/Ob4irZV2N4F7i4zcS
 8LJTkm8WxrAIc0NyAeve9MU9ATmDig1dABT3IF0dYEzWCVCm0WKMFngvFyKwPQDtqc
 oJWOJ8VYcV1p/2Kq7VZQ3TWILNnbpqARCr0REVUEimc5KYgUZWohgdPgGD+onHORxg
 66040lriCNKbfmY5okqm6T4RQuNo6KEYyRZgpsmdtNTT7vOV6WrQT5nXDS+oa+ij2S
 6Hv2pAtkn9xBAMfQQ3LnTYFl/2kM4Xz1TGujYxGdO//zPlNx99BAYjb3ZPtlXsTglM
 mPUiCijsX8+/A==
Date: Fri, 28 Feb 2025 09:55:57 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tamir Duberstein <tamird@gmail.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Justin Stitt <justinstitt@google.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Klaus Jensen <k.jensen@samsung.com>, 
 Theodore Ts'o <tytso@mit.edu>, gost.dev@samsung.com,
 Barry Song <baohua@kernel.org>, Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH RESEND v3] drm/xe: xe_gen_wa_oob: replace
 program_invocation_short_name
Message-ID: <4ghuhfcasawko7ultvuou3dhfzvb4fm4kazdd6ld5aquwvpzyh@xg2tdw5zi37j>
References: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
 <be5abg6u6wm62nhak7xrhtlkqxcekael6ztnkatwqxcil44x5y@p6yrbfingm4e>
 <CAJ-ks9=gaxW2191c+K0E0MgjsQWLYoKxJZLxGb6RMbPRVHc4tQ@mail.gmail.com>
 <fzigsonsdbtvo6aorgvzlh4mvbpvikbz6iwh6h5jx53e7zd7m4@munr3ea5nbme>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fzigsonsdbtvo6aorgvzlh4mvbpvikbz6iwh6h5jx53e7zd7m4@munr3ea5nbme>
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

On Thu, Feb 27, 2025 at 01:09:55PM +0100, Lucas De Marchi wrote:
> On Thu, Feb 27, 2025 at 08:39:21AM -0500, Tamir Duberstein wrote:
> > Hi Lucas, chiming in here since I also care about building on macOS.
> > 
> > On Mon, Feb 24, 2025 at 10:05 AM Lucas De Marchi
> > <lucas.demarchi@intel.com> wrote:
> > > 
> > > Is this the approach taken for other similar issues you had? Note that
> > > argv[0] and program_invocation_short_name are not the same thing. For
> > > this particular binary I don't really care and if it's the approach
> > > taken in other places, I'm ok using it.
> > 
> > Believe it or not, this is the only place that
> > program_invocation_short_name has ever been used in the kernel. There
> > have been numerous instances of:
> > 
> > #define _GNU_SOURCE /* for program_invocation_short_name */
> > 
> > but never any actual callers (that I could find in the git history)
> > other than this one.
> > 
> > > I was expecting you'd take the acks and merge it all through a single
> > > tree since you received push back on the need to build the kernel in
> > > macOS.  Is this the only thing missing and you'd want it to go through
> > > drm?

Yes, this is the only one missing.

> > 
> > I believe the other patches have been applied or dropped. When I last
> > tested building allmodconfig this was the only issue I ran into (macOS
> > arm64), so I asked Daniel for this resend.

That is correct.

In my opinion, the support for building the Linux kernel on macOS is primarily
supported by LLVM/Clang and the Linux kernel build system. The merged patches
were merely minor tweaks such this one (and refactors from Masahiro), intended
to enable users to configure the build system on these platforms. Patches
dropped led to the creation of the bee-headers project, which allows users
customize their build setup, which seems to be a common practice when people
requires to tweak the build environment.

> 
> fair enough.  Pushed to drm-xe-next since nobody ever reads the
> usage for this helper tool and it doesn't really matter if now it's ugly.

Thanks!

With this, we can now build arm64 in macOS defconfig, allyesconfig and
allmodconfig targets even with Rust support!

Daniel

> 
> Lucas De Marchi
> 
> > 
> > Cheers.
> > Tamir
