Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D18A83C3E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A8C10E7B4;
	Thu, 10 Apr 2025 08:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=asahilina.net header.i=@asahilina.net header.b="m4CrCRFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A163110E7B4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:14:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id A7A5242764;
 Thu, 10 Apr 2025 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1744272889;
 bh=LYwd2FHDrP2Qt7RBPwQ71X46Z4D/EmfDUox98cypTHM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=m4CrCRFd9ptZLgZFnz/qHkt7KQR9SRCtoPxTFlCeYMitM4Bt/KrwBeScgWBBE0YuB
 HvtXMDU8RQxjPUeQ9ggK9uDFZ4ASUmJRnA+xu1cLOkv75lwpzc05cVU0++hTRSmHMS
 41l/feb5K0C8aui3IerKrv4M6nHekdU0S7bDnCmHDw6GRM994sF9l1dXZq7G5oPut9
 T0M+Fl35agRLU35CFb/zQgnNlqJedPNk/gjt4tNgnLZrjEPO058hAc24sJ3RHmgE5T
 vPqhZQNu3sqQg+WSMzgkWwSOk6oQWWuZGUhR7TQ8wHGSnP7VjLB8L+OcrxDcc+wkEe
 1SiaC9FuFytMA==
Message-ID: <cfac1731-e264-45bd-91ce-e23fd3272208@asahilina.net>
Date: Thu, 10 Apr 2025 17:14:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] DRM Rust abstractions
To: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 lyude@redhat.com, acurrid@nvidia.com, daniel.almeida@collabora.com,
 j@jannau.net
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250325235522.3992-1-dakr@kernel.org>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20250325235522.3992-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 3/26/25 8:54 AM, Danilo Krummrich wrote:
> This is the series for the initial DRM Rust abstractions, including DRM device /
> driver, IOCTL, File and GEM object abstractions.
> 
> This series has been posted previously, however this is a long time ago and I
> reworked a lot of things quite heavily. Hence, I decided to post this as a whole
> new series.
> 
> Besides the rework, I want to credit Lina for her initial work, which this
> series is based on.
> 
> In a private mail Lina told me to "feel free to take anything that's useful
> from my past patch submissions or the downstream branches and use it/submit it
> in any way".
> 
> @Lina: If you, however, feel uncomfortable with any of the Co-developed-by:
> tags, due to the major changes, please let me know.

It was brought to my attention that this sentence could be interpreted
in more than one way. To me, it reads as:

If you, however, feel uncomfortable [am bothered by their presence] with
any of the Co-developed-by: tags [which credit me], due to the major
changes [as in, the major changes make me uncomfortable with the tags,
because it's no longer all/mostly my code], please let me know [so I can
remove them and therefore not credit you as author at all].

A single change, removing a comma, turns it into:

If you, however, feel uncomfortable with any of the Co-developed-by:
tags [am bothered by the situation of being listed only as
Co-developed-by] due to the major changes [which was done that way due
to the major changes], please let me know [so I can change authorship to
you].

If you intended the latter interpretation, then I think this is one of
those cases where unclear communication leads the conversation and the
tone well off the rails. If I had perceived that you were open to
promoting me to primary author, as opposed to open to demoting me to
zero credit, I would have been a lot less upset about the situation.

(If you did intend my original interpretation though, then quite
frankly, WTF.)

> 
> Those changes include:
>   - switch to the subclassing pattern for DRM device
>   - rework of the GEM object abstraction; dropping the custom reference types in
>     favor of AlwaysRefCounted
>   - rework of the File abstractions
>   - rework of the driver registration
>   - lots of minor changes (e.g. to better align with existing abstractions)
> 
> This patch series is also available in [1]; an example usage from nova-drm can
> be found in [2] and [3].
> 
> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
> [2] https://lore.kernel.org/nouveau/20250325232222.5326-1-dakr@kernel.org/
> [3] https://gitlab.freedesktop.org/drm/nova/-/tree/staging/nova-drm
> 
> Asahi Lina (1):
>   rust: drm: ioctl: Add DRM ioctl abstraction
> 
> Danilo Krummrich (7):
>   drm: drv: implement __drm_dev_alloc()
>   rust: drm: add driver abstractions
>   rust: drm: add device abstraction
>   rust: drm: add DRM driver registration
>   rust: drm: file: Add File abstraction
>   rust: drm: gem: Add GEM object abstraction
>   MAINTAINERS: add DRM Rust source files to DRM DRIVERS
> 
>  MAINTAINERS                     |   1 +
>  drivers/gpu/drm/drm_drv.c       |  58 ++++--
>  include/drm/drm_drv.h           |   5 +
>  rust/bindings/bindings_helper.h |   6 +
>  rust/helpers/drm.c              |  19 ++
>  rust/helpers/helpers.c          |   1 +
>  rust/kernel/drm/device.rs       | 195 +++++++++++++++++++
>  rust/kernel/drm/driver.rs       | 194 +++++++++++++++++++
>  rust/kernel/drm/file.rs         |  99 ++++++++++
>  rust/kernel/drm/gem/mod.rs      | 321 ++++++++++++++++++++++++++++++++
>  rust/kernel/drm/ioctl.rs        | 159 ++++++++++++++++
>  rust/kernel/drm/mod.rs          |  19 ++
>  rust/kernel/lib.rs              |   2 +
>  rust/uapi/uapi_helper.h         |   1 +
>  14 files changed, 1064 insertions(+), 16 deletions(-)
>  create mode 100644 rust/helpers/drm.c
>  create mode 100644 rust/kernel/drm/device.rs
>  create mode 100644 rust/kernel/drm/driver.rs
>  create mode 100644 rust/kernel/drm/file.rs
>  create mode 100644 rust/kernel/drm/gem/mod.rs
>  create mode 100644 rust/kernel/drm/ioctl.rs
>  create mode 100644 rust/kernel/drm/mod.rs
> 

~~ Lina

