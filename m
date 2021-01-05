Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9B2EAB79
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 14:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D4F89AB6;
	Tue,  5 Jan 2021 13:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E0489AB3;
 Tue,  5 Jan 2021 13:05:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F3D622240;
 Tue,  5 Jan 2021 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609851904;
 bh=ecAslWQ6B5/J70Zk/sQRf9wb8OWGumYxLhSFQeps2yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t5OUpmLL3CQBRciwQZ9jJ3AS//j7ilUb7E/S6WXwp2LSnjSCkf7eg6jM7XLsdGOGK
 LBDUNtCxXuVBHFTQjFnHuAGUOV5owEThc/ZWhneOCZ4h0f/44KYiFbkDvkevZbVdSa
 B1dmHuSClf8v5hKnbiqH98wvuWVoxEP3I8MpWxh35VdFqPAmi+ijwOZ7BoxlSy19tW
 cdEzSuPEnBAX2MG3ShZ1fBpdwzE2OJhLMGlQyJMmBQQuKN1UIEiiJV76UyCJl0p+wL
 Wg+Awld/73fYQxHcNxQeOTt/GfPV9HjExvnGTll84c4fGN0SN04KqOfWTjzpJ2anqV
 uF1f4RruQLrRQ==
Date: Tue, 5 Jan 2021 13:04:58 +0000
From: Will Deacon <will@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/display: Revert "add DCN support for aarch64"
Message-ID: <20210105130458.GA11108@willie-the-truck>
References: <20201214175225.38975-1-ardb@kernel.org>
 <CADnq5_M-U5QO_tmQQ8Q+v+kZXvUc7vjXnmKWYFjX1FmOJYk1OQ@mail.gmail.com>
 <CAMj1kXHnPXqBnQsNQh3nJxDePxK=D55KES3BdVeJ0cFvYxAXAg@mail.gmail.com>
 <CAMj1kXE7Z7=YJq4qYaB9NDDwi8nsXsg-KEXQ8V9wQB=uLCsdrw@mail.gmail.com>
 <CADnq5_PKV4Hekm9Dd_1U2e2RAeb3Mhz_uFSCabWgBNk2gCaAYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PKV4Hekm9Dd_1U2e2RAeb3Mhz_uFSCabWgBNk2gCaAYw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Leo Li <sunpeng.li@amd.com>, Catalin Marinas <catalin.marinas@arm.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Kolesa <daniel@octaforge.org>, Alex Deucher <alexander.deucher@amd.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <dave.martin@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 04, 2021 at 11:27:24AM -0500, Alex Deucher wrote:
> On Tue, Dec 29, 2020 at 8:17 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Wed, 16 Dec 2020 at 23:26, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Wed, 16 Dec 2020 at 19:00, Alex Deucher <alexdeucher@gmail.com> wr=
ote:
> > > >
> > > > On Mon, Dec 14, 2020 at 12:53 PM Ard Biesheuvel <ardb@kernel.org> w=
rote:
> > > > >
> > > > > This reverts commit c38d444e44badc557cf29fdfdfb823604890ccfa.
> > > > >
> > > > > Simply disabling -mgeneral-regs-only left and right is risky, giv=
en that
> > > > > the standard AArch64 ABI permits the use of FP/SIMD registers any=
where,
> > > > > and GCC is known to use SIMD registers for spilling, and may inve=
nt
> > > > > other uses of the FP/SIMD register file that have nothing to do w=
ith the
> > > > > floating point code in question. Note that putting kernel_neon_be=
gin()
> > > > > and kernel_neon_end() around the code that does use FP is not suf=
ficient
> > > > > here, the problem is in all the other code that may be emitted wi=
th
> > > > > references to SIMD registers in it.
> > > > >
> > > > > So the only way to do this properly is to put all floating point =
code in
> > > > > a separate compilation unit, and only compile that unit with
> > > > > -mgeneral-regs-only. But perhaps the use of floating point here is
> > > > > something that should be reconsidered entirely.
> > > > >
> > > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > > Cc: Will Deacon <will@kernel.org>
> > > > > Cc: Dave Martin <dave.martin@arm.com>
> > > > > Cc: Rob Herring <robh@kernel.org>
> > > > > Cc: Leo Li <sunpeng.li@amd.com>
> > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > > > > Cc: David Airlie <airlied@linux.ie>
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > Cc: Daniel Kolesa <daniel@octaforge.org>
> > > > > Cc: amd-gfx@lists.freedesktop.org
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Can rebase this on Linus' master branch?  There were a number of new
> > > > asics added which copy pasted the ARM64 support.
> > > >
> > >
> > > Not sure what you are asking me here. Reverting commit c38d444e44badc5
> > > on top of mainline is not going to fix the other code that was added.
> > > Or are you asking me to go and find the patches (how many?) that added
> > > new ASICs and fix them for arm64?
> > >
> > > Note that this code is critically broken, as it may corrupt user
> > > process state arbitrarily. So if new code was added that contains the
> > > same bug, it should be reverted so that the respective authors can fix
> > > it and resubmit.
> > >
> >
> > Is this simply about dropping the newly added references to
> > $(dml_rcflags) from the Makefile? Because that is quite trivial ...
> =

> Yes, I was thinking something like the attached patch.
> =

> Alex

> From fbc93ca7d7739861ce63f6b483cf23d7cf1d69fb Mon Sep 17 00:00:00 2001
> From: Alex Deucher <alexander.deucher@amd.com>
> Date: Mon, 4 Jan 2021 11:24:20 -0500
> Subject: [PATCH] drm/amdgpu/display: drop DCN support for aarch64
> =

> From Ard:
> =

> "Simply disabling -mgeneral-regs-only left and right is risky, given that
> the standard AArch64 ABI permits the use of FP/SIMD registers anywhere,
> and GCC is known to use SIMD registers for spilling, and may invent
> other uses of the FP/SIMD register file that have nothing to do with the
> floating point code in question. Note that putting kernel_neon_begin()
> and kernel_neon_end() around the code that does use FP is not sufficient
> here, the problem is in all the other code that may be emitted with
> references to SIMD registers in it.
> =

> So the only way to do this properly is to put all floating point code in
> a separate compilation unit, and only compile that unit with
> -mgeneral-regs-only."
> =

> Disable support until the code can be properly refactored to support this
> properly on aarch64.
> =

> Reported-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/display/Kconfig           |  2 +-
>  drivers/gpu/drm/amd/display/dc/calcs/Makefile |  4 ----
>  .../gpu/drm/amd/display/dc/clk_mgr/Makefile   | 21 -------------------
>  drivers/gpu/drm/amd/display/dc/dcn10/Makefile |  7 -------
>  .../drm/amd/display/dc/dcn10/dcn10_resource.c |  7 -------
>  drivers/gpu/drm/amd/display/dc/dcn20/Makefile |  4 ----
>  drivers/gpu/drm/amd/display/dc/dcn21/Makefile |  4 ----
>  drivers/gpu/drm/amd/display/dc/dcn30/Makefile |  5 -----
>  .../gpu/drm/amd/display/dc/dcn301/Makefile    |  4 ----
>  .../gpu/drm/amd/display/dc/dcn302/Makefile    |  4 ----
>  drivers/gpu/drm/amd/display/dc/dml/Makefile   |  4 ----
>  drivers/gpu/drm/amd/display/dc/dsc/Makefile   |  4 ----
>  drivers/gpu/drm/amd/display/dc/os_types.h     |  4 ----
>  13 files changed, 1 insertion(+), 73 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
