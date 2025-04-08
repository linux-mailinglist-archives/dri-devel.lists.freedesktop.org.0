Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A4A81337
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 19:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070B010E23D;
	Tue,  8 Apr 2025 17:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C4ngqpBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFC710E23D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 17:04:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6E80168432;
 Tue,  8 Apr 2025 17:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2EFC4CEE5;
 Tue,  8 Apr 2025 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744131853;
 bh=BPgoYDjsWQUapZ9bLnrqCt/iW/iMPEl2Daf0Khl0opc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C4ngqpBZUIXFjUVYpWOSJtH9zAx2//vBKgf0Up51Lrai8hrsnmmiJPsfkhewm1Ivy
 DFpeldR4TbHJJ6CCk87Xz2tPjBGFxXraZ3BuT8MiGV5GLnAS2/DNQ0egCCpPiFG5Nl
 Q8RRfZOU6O5glDGp6IHpHjpEFQqnxvAP/M7pOSIAYA1ucfvBtFeN2UdXlQ8caZOOX9
 w6l9NhVspMJaVpOaiAWKVMI4mK0niLMHyMKDlcyg69gmSZ2RAq2YMt2ShsQNUyIPtN
 jyOOy/ZVrsZZZr0QfgxQETUSFiYH9nm6RzEAXcUY4xMNij06Aucve2mhMdzw0xAXEZ
 b4kyk2ELf9amA==
Date: Tue, 8 Apr 2025 19:04:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Asahi Lina <lina@asahilina.net>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 acurrid@nvidia.com, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/8] DRM Rust abstractions
Message-ID: <Z_VXBZcBsk2k6eVN@cassiopeiae>
References: <20250325235522.3992-1-dakr@kernel.org>
 <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
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

On Wed, Apr 09, 2025 at 01:29:35AM +0900, Asahi Lina wrote:
> On 3/26/25 8:54 AM, Danilo Krummrich wrote:
> > This is the series for the initial DRM Rust abstractions, including DRM device /
> > driver, IOCTL, File and GEM object abstractions.
> > 
> > This series has been posted previously, however this is a long time ago and I
> > reworked a lot of things quite heavily. Hence, I decided to post this as a whole
> > new series.
> > 
> > Besides the rework, I want to credit Lina for her initial work, which this
> > series is based on.
> > 
> > In a private mail Lina told me to "feel free to take anything that's useful
> > from my past patch submissions or the downstream branches and use it/submit it
> > in any way".
> > 
> > @Lina: If you, however, feel uncomfortable with any of the Co-developed-by:
> > tags, due to the major changes, please let me know.
> 
> I'm wondering why you took over primary authorship for some patches.

Because the patches did either not exist previously or have been changed
extensively.

For instance, the patch you are referring to below (commit 242ae06b5ec9 ("rust:
drm: Add Device and Driver abstractions")) has been split up in three different
patches, where one of them (patch #2) in this series has indeed mostly the same
code, the other two (#3 and #4) were modified.

> For
> example, patch #3 has you listed as primary author, and yet when I diff:
> 
> git diff asahi-6.11-1 asahi-6.12.12-1 rust/kernel/drm/drv.rs | grep '^+'
> | wc -l
> 41
> 
> (Those two trees have my original commit and your commits, as rebased
> over by Janne).

Not really, this series is much different than what is in asahi-6.12.12-1.

> Of those 41 added lines, most are comments, and reworking Registration a
> bit.
> 
> I thought general kernel etiquette is that you keep the original author
> unless you are literally rewriting the majority of the file from scratch...

As mentioned above I re-organized patches and changed quite a lot of code. If,
with this precondition, I would have kept you as "primary" author, you could
have been complaining about me misrepresenting you / your work instead.

Now, you could argue that I should have been asking first, right?

But in a private mail you told me (and others that have been on CC as well) the
following:

"Please feel free to take anything that's useful from my past patch
submissions or the downstream branches and use it/submit it in any way."

You said "use it/submit it in any way".

If you changed your mind on this, that is fine with me.

Please let me know where you'd like to have primary authorship changed and how
you'd like it to be.

> I'm really tired of kernel politics and I don't want to spend more brain
> cycles looking at all the other patches or having to argue (in fact I
> usually don't look at patch emails at all recently), but I would
> appreciate if you keep my authorship for files that I did largely author
> myself. After everything I've been going through the past weeks (some of
> the people on Cc know what that's about...) this feels like yet another
> slap in the face.

As mentioned, please diff the correct thing and then just tell me where you'd
like to have primary authorship changed.

> > 
> > Those changes include:
> >   - switch to the subclassing pattern for DRM device
> >   - rework of the GEM object abstraction; dropping the custom reference types in
> >     favor of AlwaysRefCounted
> >   - rework of the File abstractions
> >   - rework of the driver registration
> >   - lots of minor changes (e.g. to better align with existing abstractions)
> > 
> > This patch series is also available in [1]; an example usage from nova-drm can
> > be found in [2] and [3].
> > 
> > [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
> > [2] https://lore.kernel.org/nouveau/20250325232222.5326-1-dakr@kernel.org/
> > [3] https://gitlab.freedesktop.org/drm/nova/-/tree/staging/nova-drm
> > 
> > Asahi Lina (1):
> >   rust: drm: ioctl: Add DRM ioctl abstraction
> > 
> > Danilo Krummrich (7):
> >   drm: drv: implement __drm_dev_alloc()
> >   rust: drm: add driver abstractions
> >   rust: drm: add device abstraction
> >   rust: drm: add DRM driver registration
> >   rust: drm: file: Add File abstraction
> >   rust: drm: gem: Add GEM object abstraction
> >   MAINTAINERS: add DRM Rust source files to DRM DRIVERS
> > 
> >  MAINTAINERS                     |   1 +
> >  drivers/gpu/drm/drm_drv.c       |  58 ++++--
> >  include/drm/drm_drv.h           |   5 +
> >  rust/bindings/bindings_helper.h |   6 +
> >  rust/helpers/drm.c              |  19 ++
> >  rust/helpers/helpers.c          |   1 +
> >  rust/kernel/drm/device.rs       | 195 +++++++++++++++++++
> >  rust/kernel/drm/driver.rs       | 194 +++++++++++++++++++
> >  rust/kernel/drm/file.rs         |  99 ++++++++++
> >  rust/kernel/drm/gem/mod.rs      | 321 ++++++++++++++++++++++++++++++++
> >  rust/kernel/drm/ioctl.rs        | 159 ++++++++++++++++
> >  rust/kernel/drm/mod.rs          |  19 ++
> >  rust/kernel/lib.rs              |   2 +
> >  rust/uapi/uapi_helper.h         |   1 +
> >  14 files changed, 1064 insertions(+), 16 deletions(-)
> >  create mode 100644 rust/helpers/drm.c
> >  create mode 100644 rust/kernel/drm/device.rs
> >  create mode 100644 rust/kernel/drm/driver.rs
> >  create mode 100644 rust/kernel/drm/file.rs
> >  create mode 100644 rust/kernel/drm/gem/mod.rs
> >  create mode 100644 rust/kernel/drm/ioctl.rs
> >  create mode 100644 rust/kernel/drm/mod.rs
> > 
> 
> ~~ Lina
> 
