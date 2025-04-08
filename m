Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA959A81903
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 00:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663BE10E2D0;
	Tue,  8 Apr 2025 22:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=asahilina.net header.i=@asahilina.net header.b="Zt4droY5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 494 seconds by postgrey-1.36 at gabe;
 Tue, 08 Apr 2025 16:38:07 UTC
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D26610E269
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 16:38:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 977D944CFC;
 Tue,  8 Apr 2025 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1744129779;
 bh=S/TJS8d87QFulyRwYwtV4MM1f/RFPnLTSXbH7okYRf4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Zt4droY5nw4LmCJWod37WMpx/A14IMORZp3523qx6YknGBF1PfXDstI3dcRoTqsXm
 RbF9Je0Z77q/lsO7iMqoMwlmc2P3hpiNjLPYETGuyj99ywI18N79And46rB6RMyGiL
 6HpS61dBwNbwhT+0Mlv0AQbXzgLZD5q+g6NMd09gnm1O2lq4qtejO6oQ+H4NoswEKg
 +DlxnaFIR7fZ25Cdt2aX86HnpGYdtmFktl1z/V0+QlJ0N3LznTNuNDOh/YzoXtPGAg
 CmhT8j+I8AthAVtJhK1Fo3kvLYwDv9pCz2IGWfv2UQn7EKMaV+Eo8R9VGDPp7wkL3w
 LVaatKFhE7iVg==
Message-ID: <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
Date: Wed, 9 Apr 2025 01:29:35 +0900
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
X-Mailman-Approved-At: Tue, 08 Apr 2025 22:50:49 +0000
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

I'm wondering why you took over primary authorship for some patches. For
example, patch #3 has you listed as primary author, and yet when I diff:

git diff asahi-6.11-1 asahi-6.12.12-1 rust/kernel/drm/drv.rs | grep '^+'
| wc -l
41

(Those two trees have my original commit and your commits, as rebased
over by Janne).

Of those 41 added lines, most are comments, and reworking Registration a
bit.

I thought general kernel etiquette is that you keep the original author
unless you are literally rewriting the majority of the file from scratch...

I'm really tired of kernel politics and I don't want to spend more brain
cycles looking at all the other patches or having to argue (in fact I
usually don't look at patch emails at all recently), but I would
appreciate if you keep my authorship for files that I did largely author
myself. After everything I've been going through the past weeks (some of
the people on Cc know what that's about...) this feels like yet another
slap in the face.

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

