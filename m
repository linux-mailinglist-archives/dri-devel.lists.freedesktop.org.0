Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C1DC32F1D
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 21:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6F410E668;
	Tue,  4 Nov 2025 20:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="BET+yYbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0BC10E668;
 Tue,  4 Nov 2025 20:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762288891; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ipq8PWB3GgNQMZAmxyUQBtCYrvC1OR4VmMKYFK5oVoZV5sYq9uUjVb5Bj4UK/4XSi526AZrP97T6GXg0Qi3ivK68/0ySblWOgBoO4k8mxhptLw+lxKJUlnEVz+Aiy++TLmNJbjGmcbp92YEwpo7hAWzshNbX5jOeXT5k8kiVG5Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762288891;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=UdNE52py5w5GbF1Vmt3kzvD/+HZJJNr5pY7ZeT6RQeo=; 
 b=CwmkK1TbEtK1poXQs7bT07nCJQX8GvIx6hj5BD7v/5zemhHs/QTcjTYJP379NX9W79FN4iVMYX5qfY91R3PMv55Kor6o1RUGMybyjvtaTMhi461NGeFNNEk00LaH6vOO9TJpLC7mf90MGwCgkfMhQDEMFyCOn6mAn7ZKId5TvXg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762288891; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=UdNE52py5w5GbF1Vmt3kzvD/+HZJJNr5pY7ZeT6RQeo=;
 b=BET+yYbfWgo+EJbuuxNlMXMu8LGS3T8Zg8XnTuqdbu8XK9qRRUfNrTc1hmAeE+kT
 l1BSocmWMSf69v1Bu6cn+7l4cKf8zhvpsxDrzNprpRbuwJP8Ef8hU8CzlRr58ZMXx4c
 zmmqqymtTPmzY764nZ3ZVQ4/GtAWueYJo/4s1Ewk=
Received: by mx.zohomail.com with SMTPS id 1762288888762838.1883086250991;
 Tue, 4 Nov 2025 12:41:28 -0800 (PST)
Date: Tue, 4 Nov 2025 12:41:27 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 "open list:DRM DRIVER FOR NVIDIA GPUS [RUST]" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/8] rust: gem: Introduce DriverObject::Args
Message-ID: <aQpk98pvsZUdk3xa@um790>
References: <20251023212540.1141999-1-lyude@redhat.com>
 <20251023212540.1141999-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023212540.1141999-5-lyude@redhat.com>
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

On Thu, Oct 23, 2025 at 05:22:06PM -0400, Lyude Paul wrote:
> This is an associated type that may be used in order to specify a data-type
> to pass to gem objects when construction them, allowing for drivers to more
> easily initialize their private-data for gem objects.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> ---
> V3:
> * s/BaseDriverObject/DriverObject/
> V4:
> * Fix leftover reference to BaseObjectDriver in rustdoc for
>   DriverObject::Args
> 
>  drivers/gpu/drm/nova/gem.rs |  5 +++--
>  rust/kernel/drm/gem/mod.rs  | 13 ++++++++++---
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450b..173077eeb2def 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -18,8 +18,9 @@ pub(crate) struct NovaObject {}
>  
>  impl gem::DriverObject for NovaObject {
>      type Driver = NovaDriver;
> +    type Args = ();
>  
> -    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
> +    fn new(_dev: &NovaDevice, _size: usize, _args: Self::Args) -> impl PinInit<Self, Error> {
>          try_pin_init!(NovaObject {})
>      }
>  }

Hi Lyude - could you please add the same changes for Tyr so it will
compile too

> @@ -33,7 +34,7 @@ pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self
>              return Err(EINVAL);
>          }
>  
> -        gem::Object::new(dev, aligned_size)
> +        gem::Object::new(dev, aligned_size, ())
>      }
>  
>      /// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 67813cfb0db42..d448c65fe5e13 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -65,8 +65,15 @@ pub trait DriverObject: Sync + Send + Sized {
>      /// Parent `Driver` for this object.
>      type Driver: drm::Driver;
>  
> +    /// The data type to use for passing arguments to [`DriverObject::new`].
> +    type Args;
> +
>      /// Create a new driver data object for a GEM object of a given size.
> -    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
> +    fn new(
> +        dev: &drm::Device<Self::Driver>,
> +        size: usize,
> +        args: Self::Args,
> +    ) -> impl PinInit<Self, Error>;
>  
>      /// Open a new handle to an existing object, associated with a File.
>      fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
> @@ -247,11 +254,11 @@ impl<T: DriverObject> Object<T> {
>      };
>  
>      /// Create a new GEM object.
> -    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
> +    pub fn new(dev: &drm::Device<T::Driver>, size: usize, args: T::Args) -> Result<ARef<Self>> {
>          let obj: Pin<KBox<Self>> = KBox::pin_init(
>              try_pin_init!(Self {
>                  obj: Opaque::new(bindings::drm_gem_object::default()),
> -                data <- T::new(dev, size),
> +                data <- T::new(dev, size, args),
>                  // INVARIANT: The drm subsystem guarantees that the `struct drm_device` will live
>                  // as long as the GEM object lives.
>                  dev: dev.into(),
> -- 
> 2.51.0
> 
