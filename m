Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15803B03CF1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 13:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3084110E205;
	Mon, 14 Jul 2025 11:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A/NN8tQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7669510E205
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 33230A56FF4;
 Mon, 14 Jul 2025 11:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B04C4CEED;
 Mon, 14 Jul 2025 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752491388;
 bh=RpiEzxCKkkEachf+ZeEwRHRoaG1XxJFVTXSqrmNVzLM=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=A/NN8tQT88eMzpyi9QVo5FopZDYNFWMiZau8tGoF66U4JSIfIX2CKajUNXaNepUcH
 eYFQfQmFpbhsabtEazM3xEe6oFK0ex6S6Cn+T1pWTMjOqbO+mzrjte62VIOqcXglse
 /r0bTJ84RmPuOo4LU3Q9T/BCAIaPb7eirWu+pO3Gj8nnpvzQQIwcQX5055n+7kIz/k
 A3WIuPRFj9SVJh6uEr3U+pLQRTXbsbwI7tyMDKmxH/ejSIrniqJ4YY1F85yvU8F9bV
 AC8NmGAynyYd7UlXt4N9iE4nQkbXMivv2fB8Xkx4pcJfAU2i+JjWLn/08Ccpp9fV8w
 MTdtClgm4LeVg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 13:09:39 +0200
Message-Id: <DBBQCHNN1N7F.3O470V9YDXE70@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 05/10] rust: drm: use `core::ffi::CStr` method names
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Breno Leitao" <leitao@debian.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Brendan Higgins" <brendan.higgins@linux.dev>,
 "David Gow" <davidgow@google.com>, "Rae Moar" <rmoar@google.com>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
 <20250709-core-cstr-fanout-1-v1-5-fd793b3e58a2@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-5-fd793b3e58a2@gmail.com>
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

On Wed Jul 9, 2025 at 9:58 PM CEST, Tamir Duberstein wrote:
> Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
> avoid methods that only exist on the latter.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/drm/device.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index b7ee3c464a12..998b942b6dd8 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -83,8 +83,8 @@ impl<T: drm::Driver> Device<T> {
>          major: T::INFO.major,
>          minor: T::INFO.minor,
>          patchlevel: T::INFO.patchlevel,
> -        name: T::INFO.name.as_char_ptr().cast_mut(),
> -        desc: T::INFO.desc.as_char_ptr().cast_mut(),
> +        name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cas=
t_mut(),
> +        desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cas=
t_mut(),

Maybe looks slightly cleaner to import this function, not a blocker though.
