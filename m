Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F20AB9BFE
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57BC10EAA3;
	Fri, 16 May 2025 12:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dzaRKeVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B911A10EAA3;
 Fri, 16 May 2025 12:27:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 244605C06B3;
 Fri, 16 May 2025 12:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220A5C4CEEF;
 Fri, 16 May 2025 12:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747398416;
 bh=TX+Wwl4Yd2tT6bg4p7073jpIxrMoUEsu9J9aOBrP3Sg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dzaRKeVJ2hDWwNIgqtJRmFC26lWiPQGzMvBW85mTgx+EAiRp/S8r7MRd4VlwD+d1n
 CAXBSGdNkbvayF+7EzEx/VnKpbv1n5ZQFwQRQ1pq+uCsKqjt67zRbh9DO2DEyn5zty
 LdVlT+PIDPEZWbMMUC7lohMXeRR8/pbovOaTwAPeRpPyZw6HcqXWe+mCOGqfG4qjsO
 aA2aw5wZGFay4sJs9e34PMuvX2sgq0RdifJNh9GzZNTvABCATqYAMwMkc8Kgwt7A/8
 kVPYHQ/Pj1iJe6CYMUTD5KhrHpTXHv7pz4hWTtJqgYPPETdCpDOyIntIr9ZPvRFrGY
 DzKH9iF9x3xww==
Date: Fri, 16 May 2025 14:26:39 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 13/19] gpu: nova-core: add falcon register definitions
 and base code
Message-ID: <aCcu_42cM2c-Koxu@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-13-fcb02749754d@nvidia.com>
 <aCNxFc3Z3TMi5rYt@pollux> <D9XKW0NFY922.5HTPCXGGUGQT@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9XKW0NFY922.5HTPCXGGUGQT@nvidia.com>
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

On Fri, May 16, 2025 at 09:19:45PM +0900, Alexandre Courbot wrote:
> On Wed May 14, 2025 at 1:19 AM JST, Danilo Krummrich wrote:
> <snip>
> >> +        util::wait_on(Duration::from_millis(20), || {
> >> +            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
> >> +            if r.mem_scrubbing() {
> >> +                Some(())
> >> +            } else {
> >> +                None
> >> +            }
> >> +        })
> >> +    }
> >> +
> >> +    /// Reset the falcon engine.
> >> +    fn reset_eng(&self, bar: &Bar0) -> Result<()> {
> >> +        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
> >> +
> >> +        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
> >> +        // RESET_READY so a non-failing timeout is used.
> >
> > Should we still warn about it?
> 
> OpenRM does not (as this is apparently a workaround to a HW bug?) so I
> don't think we need to.
> 
> >
> >> +        let _ = util::wait_on(Duration::from_micros(150), || {
> >
> > Do we know for sure that if RESET_READY is not set after 150us, it won't ever be
> > set? If the answer to that is yes, and we also do not want to warn about
> > RESET_READY not being set, why even bother trying to read it in the first place?
> 
> My guess is because this would the expected behavior if the bug wasn't
> there. My GPU (Ampere) does wait until the timeout, but we can expect
> newer GPUs to not have this problem and return earlier.

Ok, let's keep it then.

> >
> >> +            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
> >> +            if r.reset_ready() {
> >> +                Some(())
> >> +            } else {
> >> +                None
> >> +            }
> >> +        });
> >> +
> >> +        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(true));
> >> +
> >> +        let _: Result<()> = util::wait_on(Duration::from_micros(10), || None);
> >
> > Can we please get an abstraction for udelay() for this?
> 
> Should it be local to nova-core, or be generally available? I refrained
> from doing this because there is work going on regarding timer and I
> thought it would cover things like udelay() as well. I'll add a TODO
> item for now but please let me know if you have something different in
> mind.

Not local to nova-core, but in the generic abstraction. I don't think the
generic abstraction posted on the mailing list contains udelay(). Should be
trivial to add it with a subsequent patch though.

A TODO should be fine for now.

> >> +    let reg_fuse_version = bar.read32(reg_fuse);
> >
> > I feel like the calculation of reg_fuse should be abstracted with a dedicated
> > type in regs.rs. that takes the magic number derived from the engine_id_mask
> > (which I assume is chip specific) and the ucode_id.
> 
> We would need proper support for register arrays to manage the ucode_id
> offset, so I'm afraid this one will be hard to get rid of. What kind of
> type did you have in mind?
> 
> One thing we can do though, is expose the offset of each register as a
> register type constant, and use that instead of the hardcoded values
> currently in this code - that part at least will be cleaner.

Let's do that then for now.

> >> +        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
> >
> > Just `_` instead? Also, please add a comment why it is important to create this
> > instance even though it's never used.
> 
> It is not really important now, more a way to exercise the code until
> we need to run Booter. The variable will be renamed to `sec2_falcon`
> eventually, so I'd like to keep that name in the placeholder.

Ok, seems reasonable.
