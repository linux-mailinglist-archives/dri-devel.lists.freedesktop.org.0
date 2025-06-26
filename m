Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B5AE949F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 05:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5DF10E264;
	Thu, 26 Jun 2025 03:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Onngm8IB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3ED10E264
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 03:42:39 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4a43972dcd7so8198691cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 20:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750909358; x=1751514158; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3liawWZctXs7keSPhZo5W3GQUl0iBuavz+nLQeEcPG8=;
 b=Onngm8IBYy1amuCwO0OSUQsxr3A9Duj2Gx76P/wl2QsFQxIvVq9ASSbBuUi+cqwvZ2
 oVf4TOP5cDFhgzaqRNF5m6jnkEaa/wmMc1ojKewadZQO6Tr2Zbjc8rTXVEc2AViuKv+j
 FNrH2sI1TI7Mkahu9L4JhrDpKp/H8Mg2srAn2aE36oy6LUy8q5+uXxiezxxoRy3m7tpd
 7f1iCxn1VpYPBlQNmfJ7Q6EUcNE8ZXvz5ADAeGdq/X6nZa3tioZj4KCFyVacgfCYKyu5
 7ULCVRjusQqGYL/KiFEf9t39/FgvUYx7U71pjI14a9e/Liny0WtB3yz9lIKH4PzU4M/8
 wuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750909358; x=1751514158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3liawWZctXs7keSPhZo5W3GQUl0iBuavz+nLQeEcPG8=;
 b=Y8EiwZTJ/JwmHU0yEGWe4tRqNe5nosuu636+Vr/6n4e9l6ZINngKSaEoJM8U2nTXeD
 ln7kW22T/iW1FjaVnc5pnV4p71zMBnnQn7+BHicXvdoKk6m4xft170kIE6T7JE0Znmi1
 J702p74FF/NA/j+J0NgM8esWQpOg0ox7Q/lfMWqq3xmBi3VVAGSYCzcA924DrPnpNG0M
 IcE7bn8D/Z2cizNDi79D1xdH+txAjbLzLAOE/bNsPM87/yyHP3EB2zgoVAlegYPt2d4c
 BhZEe7rT116sExnaHsAoMYAigV15t7qkqq4e1W8Rmz7Ib1ZQ6lSJoR6CYEmqejkdezb8
 ax8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYDssgvA4SToVaC60ETm0YUaBIJzGa67dz/wvUlbfGwOuFTs+NcazQEv5+ZNszBFbMoCYIS0TICf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzar3m8wdYT7QbvcEuIsQh2qCp7CSgDzyQSCEREgi8cdQYwEZnh
 qyf3Hufia54rqFVplPw8fT6gacke4DP88qnYJV8pYdiQewJZ6Mrlg4c/
X-Gm-Gg: ASbGncu6liJxaIzDoUMTBGovRLNcV6Pq2lzeirRlTqCOrDxaHuovJ0GIjy62HZ/bPUy
 Kvv5MrcDANcLXukdKRELRkhvPZHpQpTmQpzkW4neR3Mg41tmEWEUVJmN91ny/Y37xZSnwsJAhbn
 AITtoARF2+P1Sxr1vtmPTpzAbjermnObnQ900Y5W2ngqUlSUeKp64mxhixCfnVLfi93KGvdDKrs
 nw1X0EACInx0/M4tzBiVGkbpvAgUaAwUyxbR8TWb5esQmWZHSGFO+auN4R/xXPR1kwIrvVtxfUb
 gjS5zCYRiTn4LCrBoI/KNfnm7MqF4N+Yjcr9GLBRt7gAvHnbOllOmmzWGqFcN9ln7sQxGro64k7
 1JR4mfvwoapldtqGEFbpQEgXUMnAE/s+M8ES+TOUxRVvKgd/FIha4
X-Google-Smtp-Source: AGHT+IFhhwRvlnji45uC2Dtp9KaiTKyb5Stv70eMaFEe1Wr/Xy7cLd1PkADT73suamYikUi7ELZa4w==
X-Received: by 2002:a05:622a:2611:b0:4a7:14c3:7405 with SMTP id
 d75a77b69052e-4a7c07d4cf2mr107582861cf.27.1750909358053; 
 Wed, 25 Jun 2025 20:42:38 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a779d672f6sm67750101cf.27.2025.06.25.20.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 20:42:37 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfauth.phl.internal (Postfix) with ESMTP id 05400F40066;
 Wed, 25 Jun 2025 23:42:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 23:42:37 -0400
X-ME-Sender: <xms:rMFcaD5BdUPjrtAh5aOxRjF_iLdRO-hxNTiqfRPNKbnZgm2e6vEe_w>
 <xme:rMFcaI6XqELPHFIhvtaz37h7hihLLQ0j7zTnx3tz1dT9kRKZ2xbaMeVy2tzfzZqKv
 ZVKnA_wunb9YF9p6Q>
X-ME-Received: <xmr:rMFcaKdzOqw2NHmYJy7B0GVPNmCZtA7qrtbJ2JW43Vghs6irOyvfNzZeZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvgeehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
 vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
 hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
 shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
 hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
 udeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsvggrthgrrdhmihgthhgrlh
 hskhgrsegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
 pdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtth
 hopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhes
 ghhoohhglhgvrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtoh
 hllhgrsghorhgrrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
 pdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtg
 hpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rMFcaEK0oo0zlHzCXKcyG9qLhXYVgKA3pvoSkUtDQvKhN8Ja4L32TQ>
 <xmx:rMFcaHLQVSEhKlQNKz_9JCrNP-VkwoEzjlUfLA6PoSJmkUtpoQuA6Q>
 <xmx:rMFcaNzIztB8Gegt3cMyIl33klVJzmM3M4v00BefVQok6wQlA8wHTA>
 <xmx:rMFcaDK_7hUsd1j5ZfV9pHBEO4wbwZBPw1tfS3JUOl91Fm6P9cTPNw>
 <xmx:rcFcaCYhN305NErnbZx_pqfampNke6-guDhSERvjtsVTglYZoi0KvRcE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 23:42:36 -0400 (EDT)
Date: Wed, 25 Jun 2025 20:42:35 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, dakr@kernel.org,
 aliceryhl@google.com, daniel.almeida@collabora.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFzBq4wDVbLFry6z@Mac.home>
References: <20250625081333.2217887-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625081333.2217887-1-beata.michalska@arm.com>
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

Hi Beata,

On Wed, Jun 25, 2025 at 10:13:33AM +0200, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraits. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where none is acually
> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> ---

Appreciate it if you could put a change log here mentioning changes
between each version.

>  drivers/gpu/drm/nova/file.rs | 23 ++++++--------
>  drivers/gpu/drm/nova/nova.rs |  1 -
>  drivers/gpu/drm/nova/uapi.rs | 61 ------------------------------------
>  rust/kernel/drm/ioctl.rs     | 11 ++++---
>  4 files changed, 16 insertions(+), 80 deletions(-)
>  delete mode 100644 drivers/gpu/drm/nova/uapi.rs
> 
> diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
> index 7e59a34b830d..7e7d4e2de2fb 100644
> --- a/drivers/gpu/drm/nova/file.rs
> +++ b/drivers/gpu/drm/nova/file.rs
> @@ -2,13 +2,11 @@
>  
>  use crate::driver::{NovaDevice, NovaDriver};
>  use crate::gem::NovaObject;
> -use crate::uapi::{GemCreate, GemInfo, Getparam};
>  use kernel::{
>      alloc::flags::*,
>      drm::{self, gem::BaseObject},
>      pci,
>      prelude::*,
> -    types::Opaque,
>      uapi,
>  };
>  
> @@ -26,20 +24,19 @@ impl File {
>      /// IOCTL: get_param: Query GPU / driver metadata.
>      pub(crate) fn get_param(
>          dev: &NovaDevice,
> -        getparam: &Opaque<uapi::drm_nova_getparam>,
> +        getparam: &mut uapi::drm_nova_getparam,
>          _file: &drm::File<File>,
>      ) -> Result<u32> {
>          let adev = &dev.adev;
>          let parent = adev.parent().ok_or(ENOENT)?;
>          let pdev: &pci::Device = parent.try_into()?;
> -        let getparam: &Getparam = getparam.into();
>  
> -        let value = match getparam.param() as u32 {
> +        let value = match getparam.param as u32 {
>              uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
>              _ => return Err(EINVAL),
>          };
>  
> -        getparam.set_value(value);
> +        getparam.value = value;
>  
>          Ok(0)
>      }
> @@ -47,13 +44,12 @@ pub(crate) fn get_param(
>      /// IOCTL: gem_create: Create a new DRM GEM object.
>      pub(crate) fn gem_create(
>          dev: &NovaDevice,
> -        req: &Opaque<uapi::drm_nova_gem_create>,
> +        req: &mut uapi::drm_nova_gem_create,
>          file: &drm::File<File>,
>      ) -> Result<u32> {
> -        let req: &GemCreate = req.into();
> -        let obj = NovaObject::new(dev, req.size().try_into()?)?;
> +        let obj = NovaObject::new(dev, req.size.try_into()?)?;
>  
> -        req.set_handle(obj.create_handle(file)?);
> +        req.handle = obj.create_handle(file)?;
>  
>          Ok(0)
>      }
> @@ -61,13 +57,12 @@ pub(crate) fn gem_create(
>      /// IOCTL: gem_info: Query GEM metadata.
>      pub(crate) fn gem_info(
>          _dev: &NovaDevice,
> -        req: &Opaque<uapi::drm_nova_gem_info>,
> +        req: &mut uapi::drm_nova_gem_info,
>          file: &drm::File<File>,
>      ) -> Result<u32> {
> -        let req: &GemInfo = req.into();
> -        let bo = NovaObject::lookup_handle(file, req.handle())?;
> +        let bo = NovaObject::lookup_handle(file, req.handle)?;
>  
> -        req.set_size(bo.size().try_into()?);
> +        req.size = bo.size().try_into()?;
>  
>          Ok(0)
>      }
> diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
> index 902876aa14d1..730598defe04 100644
> --- a/drivers/gpu/drm/nova/nova.rs
> +++ b/drivers/gpu/drm/nova/nova.rs
> @@ -5,7 +5,6 @@
>  mod driver;
>  mod file;
>  mod gem;
> -mod uapi;
>  
>  use crate::driver::NovaDriver;
>  
> diff --git a/drivers/gpu/drm/nova/uapi.rs b/drivers/gpu/drm/nova/uapi.rs
> deleted file mode 100644
> index eb228a58d423..000000000000
> --- a/drivers/gpu/drm/nova/uapi.rs
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -use kernel::uapi;
> -
> -// TODO Work out some common infrastructure to avoid boilerplate code for uAPI abstractions.
> -
> -macro_rules! define_uapi_abstraction {
> -    ($name:ident <= $inner:ty) => {
> -        #[repr(transparent)]
> -        pub struct $name(::kernel::types::Opaque<$inner>);
> -
> -        impl ::core::convert::From<&::kernel::types::Opaque<$inner>> for &$name {
> -            fn from(value: &::kernel::types::Opaque<$inner>) -> Self {
> -                // SAFETY: `Self` is a transparent wrapper of `$inner`.
> -                unsafe { ::core::mem::transmute(value) }
> -            }
> -        }
> -    };
> -}
> -
> -define_uapi_abstraction!(Getparam <= uapi::drm_nova_getparam);
> -
> -impl Getparam {
> -    pub fn param(&self) -> u64 {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
> -        unsafe { (*self.0.get()).param }
> -    }
> -
> -    pub fn set_value(&self, v: u64) {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
> -        unsafe { (*self.0.get()).value = v };
> -    }
> -}
> -
> -define_uapi_abstraction!(GemCreate <= uapi::drm_nova_gem_create);
> -
> -impl GemCreate {
> -    pub fn size(&self) -> u64 {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
> -        unsafe { (*self.0.get()).size }
> -    }
> -
> -    pub fn set_handle(&self, handle: u32) {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
> -        unsafe { (*self.0.get()).handle = handle };
> -    }
> -}
> -
> -define_uapi_abstraction!(GemInfo <= uapi::drm_nova_gem_info);
> -
> -impl GemInfo {
> -    pub fn handle(&self) -> u32 {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
> -        unsafe { (*self.0.get()).handle }
> -    }
> -
> -    pub fn set_size(&self, size: u64) {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
> -        unsafe { (*self.0.get()).size = size };
> -    }
> -}
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> index 445639404fb7..3425a835f9cd 100644
> --- a/rust/kernel/drm/ioctl.rs
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -83,7 +83,7 @@ pub mod internal {
>  ///
>  /// ```ignore
>  /// fn foo(device: &kernel::drm::Device<Self>,
> -///        data: &Opaque<uapi::argument_type>,
> +///        data: &mut uapi::argument_type,
>  ///        file: &kernel::drm::File<Self::File>,
>  /// ) -> Result<u32>
>  /// ```
> @@ -138,9 +138,12 @@ pub mod internal {
>                              // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
>                              // asserted above matches the size of this type, and all bit patterns of
>                              // UAPI structs must be valid.
> -                            let data = unsafe {
> -                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
> -                            };
> +                            // The `ioctl` argument is exclusively owned by the handler
> +                            // and guaranteed by the C implementation (`drm_ioctl()`) to remain
> +                            // valid for the entire lifetime of the reference taken here.
> +                            // There is no concurrent access or aliasing; no other references
> +                            // to this object exist during this call.
> +                            let data = unsafe { &mut *(raw_data as *mut $crate::uapi::$struct) };

"ptr as ptr" should be avoided, see:

	https://lore.kernel.org/rust-for-linux/20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com/

so probably

    let data = unsafe { &mut *(raw_data.cast()) };

?

With that fixed, feel free to add:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

>                              // SAFETY: This is just the DRM file structure
>                              let file = unsafe { $crate::drm::File::as_ref(raw_file) };
>  
> -- 
> 2.25.1
> 
