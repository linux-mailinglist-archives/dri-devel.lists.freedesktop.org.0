Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A28C6AE62C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 17:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390310E0E1;
	Tue,  7 Mar 2023 16:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2666910E0E1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 16:18:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 048F541DF4;
 Tue,  7 Mar 2023 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678205882;
 bh=Qw94FegwAslJUaCniB68UUeUX0OwCWRdd88BzdgPXQE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Bq5PvOWNwJHYFmQhlxM7mXUiwYE4dpW4OGTiXLi0dz4416AAQi8EIVK020edvpeoI
 MRmpbh+Fg9QzKeLgMX2oVPVeJGkAA+yCUHZfyQRMuLdLMzMybsWEgSllQqjrK2obvb
 uuhWDg57cQUvWnPK9qbJbKJlj6ztFWRi5xyfm4xXtfdQTksQxfx7yahzy47cDf6IHl
 EmJ0kxZYA6+x3n9X9YkPOtyYRB9otB/Czkj+vCGPFKh85Dc4nPmn+46I+5huY5GE9+
 DmJT+qSOcFyA0rh43AJ7DTVxDsXimY9L8YcZ51TS+cAM/7x4yspjeM8gSRXAEK2IPc
 D+HcWcb6Nl4gw==
Message-ID: <687b54e7-b9a6-f37b-e5e6-8972e3670cc1@asahilina.net>
Date: Wed, 8 Mar 2023 01:17:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 00/18] Rust DRM subsystem abstractions (& preview AGX
 driver)
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That was supposed to have Markdown-style section headings, but I forgot
that b4 considers a leading # as a comment... sorry for the abrupt topic
changes...

The intended headings are below.

On 07/03/2023 23.25, Asahi Lina wrote:
> Hi everyone!
> 
> This is my first take on the Rust abstractions for the DRM
> subsystem. It includes the abstractions themselves, some minor
> prerequisite changes to the C side, as well as the drm-asahi GPU driver
> (for reference on how the abstractions are used, but not necessarily
> intended to land together).
> 
> These patches apply on top of the tree at [1], which is based on
> 6.3-rc1 with a large number of Rust abstraction/support commits added on
> top. Most of these are not prerequisites for the DRM abstractions
> themselves, but rather only of the driver.
> 
> * #1-12 introduce the abstractions, module by module, with minor C
>   changes before the dependent abstraction.
>   * Patch 10 is a little addition to drm_sched that I ended up needing,
>     but I can pull it out of the abstraction into its own patch if
>     needed.
> * #13-14 add a minor feature to drm/gem and its abstraction used
>   by the driver.
> * #15-16 introduce the (unstable) asahi UAPI. This is obviously not
>   ready for merge yet, but comments are welcome!
> * #17 adds a Rust helper macro to handle GPU core/firmware differences.
>   This probably belongs in the driver at this point, but right now it
>   has to live in rust/macros since there is no mechanism for per-driver
>   proc macros.
> * #18 adds the driver proper, in one big commit, for reference purposes.

## Background

> I've been working since mid last year on an Apple AGX GPU driver for
> Linux, using the (at the time) out-of-tree Rust support. As part of this
> effort, I've been writing safe Rust abstractions for portions of the DRM
> subsystem.
> 
> Now that Rust itself is upstream, I'd like to get all the abstractions
> upstreamed so we can eventually get the driver upstreamed!
> 
> These abstractions have been used by the driver since our release in
> December [2], in a simpler synchronous-submission form:
> 
> * drm::ioctl
> * drm::device
> * drm::drv
> * drm::file
> * drm::{gem, gem::shmem}
> * drm::mm
> 
> This series adds these too, which are used by the explicit sync refactor
> of the driver (the version in this series):
> 
> * drm::syncobj
> * drm::sched
> * dma_fence
> 
> The major dependencies for the DRM abstractions themselves are:
> 
> * [3] rust: error: Add missing wrappers to convert to/from kernel error codes
> * [4] rust: Miscellaneous macro improvements
> * [5] rust: Add a Sealed trait
> * [6] rust: device: Add a minimal RawDevice trait
> * [7] rust: Enable the new_uninit feature for kernel and driver crates
> * [8] rust: ioctl: Add ioctl number manipulation functions
> * [9] rust: sync: Arc: Any downcasting and assume_init()
> *     rust: Add `container_of` and `offset_of` macros
> *     kernel::sync::mutex and dependencies
> 
> Most of these (the ones with links) have already been submitted, and I
> expect all of them to land for 6.4 (the mutex one will likely be last,
> since there is some refactoring that will happen over the current state
> to make it more ergonomic to use). The mutex dep is only necessary for
> drm::mm and dma_fence, and transitively drm::syncobj and drm::sched.

## State

> Things work! We've had most of the abstractions in production edge
> kernels with the driver, and the new explicit sync stuff has passed
> quite a few torture tests (this is how we found the drm_sched issue,
> patch 11).
> 
> The abstractions are intended to be safe (safety review very welcome!).
> While writing them, I tried to avoid making any changes to the C side
> unless absolutely necessary. I understand that it will probably make
> sense to adjust the C side to make some things easier, but I wanted to
> start from this as a baseline.
> 
> Known issues:
> 
> - The existing Rust integration does not currently allow building
>   abstractions as modules, so the Rust abstractions are only available
>   for DRM components that are built in. I added some extra Kconfig
>   symbols to deal with this, so a driver built as a module can depende
>   on having those built in. This should go away in the future (but may
>   not be ready in time for submission... I understand this probably
>   shouldn't be a blocker though?).
> 
> - DRM relies heavily on the "subclassing" pattern for driver objects,
>   and this doesn't map well to Rust. I tried several approaches for
>   various bits, so we can see how they work out. In particular, whether
>   wrapper types should pretend to be smart pointers and Deref to their
>   inner driver-specific types, and whether they should be marked as
>   method receivers (Yuck, internal rustc implementation hacks! But
>   Arc<T> already does the same thing and it makes usage in
>   driver-implemented callbacks as `self` possible) are things I'd love
>   to discuss ^^.
> 
> - Only what I need for my driver is implemented (plus a small amount of
>   obvious extras where better API completeness makes sense). I think the
>   general idea with Rust abstractions is that we add things as they
>   become necessary.
> 
> - The plain GEM vs. GEM-shmem duality ended up with quite a hairy type
>   hierarchy. I'd love to figure out how to make this simpler...
> 
> - drm::mm ends up requiring a built-in mutex in the abstraction, instead
>   of delegating that to the user with the usual Rust mutability rules.
>   This is because nodes can be dropped at any time, and those operations
>   need to be synchronized. We could try to avoid forbidding those drops
>   or mark the node type !Send, but that would make it a lot less
>   ergonomic to use...
> 
> I'm looking for feedback on the abstractions of all kinds, so we can
> move towards an upstreamable version. Optimistically, I'd love to get
> this upstream for 6.5, and the driver for 6.6.
> 
> Please feel free to ask any questions about the Rust bits, since I know
> a lot of this is new to many of the C folks!

## About the drm-asahi driver

> This is a fairly complete driver for Apple AGX G13 and G14 series GPUs.
> 
> The driver today supports the Apple M1, M1 Pro, M1 Max, M1 Ultra, and M2
> SoCs, across two firmware revisions each. It has an explicit sync UAPI
> heavily inspired by the upcoming Intel Xe UAPI, designed with Vulkan
> support in mind. On the Mesa side we currently have a Gallium driver
> that is mostly already upstream (missing the UAPI bits mostly) and
> passes the dEQP GLES2/EGL tests, with most of GLES3.0 passing in
> downstream work-in-progress branches. This is a reverse engineered
> community driver (we have no hardware documentation of any kind, other
> than some hints from aspects shared with PowerVR).
> 
> While developing the driver, I tried to make use of Rust's safety and
> lifetime features to provide not just CPU-side safety, but also
> partial firmware-ABI safety. Thanks to this, it has turned out to be
> a very stable driver even though GPU firmware crashes are fatal (no
> restart capability, need to reboot!) and the FW/driver interface is a
> huge mess of unsafe shared memory structures with complex pointer
> chains. There are over 70 ABI types and 3000+ lines of firmware ABI type
> definitions that vary between firmware builds and GPU cores...
> 
> In a simpler blocking-submission form, it has been shipping in Asahi
> Linux edge kernels since December [2], with lots of users and zero (!)
> reported oopses (and only a couple reports of GPU firmware crashes,
> though that issue should now be fixed). It has survived OOM scenarios
> (Rust makes error cleanup easy!), UAPI-level fuzzing, countless broken
> Mesa builds, uptimes of 40+ days, and more.
> 
> The explicit sync refactor significantly increases performance (and
> potential problems), but this version has survived a lot of torture
> with dEQP/piglit tests and some manual corner case testing.
> 
> In other words, Rust works! ^^
> 
> There are some design notes on the driver and further links at [10].

## Links

> [1] https://github.com/AsahiLinux/linux.git drm-rfc-base-20230307
> [2] https://asahilinux.org/2022/12/gpu-drivers-now-in-asahi-linux/
> [3] https://lore.kernel.org/rust-for-linux/20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net/T/
> [4] https://lore.kernel.org/rust-for-linux/20230224-rust-macros-v1-0-b39fae46e102@asahilina.net/T/
> [5] https://lore.kernel.org/rust-for-linux/20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net/T/#m515bad2cff7f5a46f55897e6b73c6c2f1fb2c638
> [6] https://lore.kernel.org/rust-for-linux/20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net/T/#m4c64e390c43b3ff1b8470fc8b37eaf87f6e12c94
> [7] https://lore.kernel.org/rust-for-linux/CQV7ZNT6LMXI.1XG4YXSH8I7JK@vincent-arch/T/
> [8] https://lore.kernel.org/rust-for-linux/61f734d6-1497-755f-3632-3f261b890846@asahilina.net/T/
> [9] https://lore.kernel.org/rust-for-linux/20230224-rust-arc-v1-0-568eea613a41@asahilina.net/T/
> [10] https://github.com/AsahiLinux/docs/wiki/SW:AGX-driver-notes

~~ Lina
